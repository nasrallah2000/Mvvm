import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/models/post_model.dart';
import 'package:mvvm/shared/end_point.dart';
import 'package:mvvm/shared/network/remote/dio_helper.dart';
import 'package:mvvm/viewModels/home/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final String homeTitle = 'Posts';

  // Stream<List<PostModel>> postItem(){

  // }
  List<PostModel> listPosts = [];
  void getPost() async {
    emit(HomeGetPostsLoadingState());
    await DioHelper.getData(
      url: '/$posts',
      lang: 'en',
    ).then((value) {
      List list = value!.data;
      for (var element in list) {
        listPosts.add(PostModel.fromJson(element));
      }
      //list.map((post) => PostModel.fromJson(post)).toList();
      emit(HomeGetPostsSuccessState());
    }).catchError((e) {
      emit(HomeGetPostsErrorState(e.toString()));
    });
  }
}
