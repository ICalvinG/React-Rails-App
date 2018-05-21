import { ADD_ARTICLE } from "../constants/constants";

export const addArticle = article => ({
  type: ADD_ARTICLE,
  payload: article
});
