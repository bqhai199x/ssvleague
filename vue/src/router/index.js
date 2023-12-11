import { createRouter, createWebHistory } from 'vue-router';
import routes from './routes';
import { useAuthStore } from 'stores/auth-store';
import authCaller from 'callers/auth-caller';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

router.beforeEach(async (to, from, next) => {
  const auth = useAuthStore();
  if(to.meta.requiredAuth || !from.name) {
    const user = await authCaller.getMe();
    if (user) auth.login(user);
    else {
      auth.logout();
      await authCaller.logout();
    }
  }
  if(to.meta.requiredAuth) {
    if (to.meta.roles?.length > 0) {
      if(to.meta.roles.includes(auth.role)) next();
      else next({ path: '/404' });
    } else if(auth.isLoggedIn) next();
    else next({ path: '/404' });
  } else next();
});

export default router
