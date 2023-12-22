export const MATCH_STATE = {
  HOME_BANNING_1: 0,
  AWAY_BANNING_1: 1,
  HOME_BANNING_2: 2,
  AWAY_BANNING_2: 3,
  HOME_PICKING: 4,
  AWAY_PICKING: 5,
  MATCHING: 6,
  MATCH_END: 7,
}

export const states = [
  { label: 'Home banning 1', value: MATCH_STATE.HOME_BANNING_1 },
  { label: 'Away banning 1', value: MATCH_STATE.AWAY_BANNING_1 },
  { label: 'Home banning 2', value: MATCH_STATE.HOME_BANNING_2 },
  { label: 'Away banning 2', value: MATCH_STATE.AWAY_BANNING_2 },
  { label: 'Home picking', value: MATCH_STATE.HOME_PICKING },
  { label: 'Away picking', value: MATCH_STATE.AWAY_PICKING },
  { label: 'Matching', value: MATCH_STATE.MATCHING },
  { label: 'Match end', value: MATCH_STATE.MATCH_END },
]

export const ROLES = {
  NORMAL : 0,
  PES: 1,
  ADMIN: 99
}

export const BAN_PICK_VIEW = {
  VIEWER: 0,
  HOME: 1,
  AWAY: 2
}

export const MATCH_HISTORY = {
  NOT_YET: 0,
  DRAW: 1,
  WIN: 2,
  LOSE: 3
}