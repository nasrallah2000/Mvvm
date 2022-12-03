abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetPostsSuccessState extends HomeStates {}

class HomeGetPostsLoadingState extends HomeStates {}

class HomeGetPostsErrorState extends HomeStates {
  String error;
  HomeGetPostsErrorState(this.error);
}
