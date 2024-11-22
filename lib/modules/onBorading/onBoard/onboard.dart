import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:genesia_demo/core/base/base_cubit.dart';
import 'package:genesia_demo/extensions/extensions.dart';
import 'package:genesia_demo/generated/assets.gen.dart';
import 'package:genesia_demo/model/ai_friend_data.dart';
import 'package:genesia_demo/model/user_profile.dart';
import 'package:genesia_demo/modules/dashboard/dashboard.dart';
import 'package:genesia_demo/services/preferenceService/pref_manager.dart';
import 'package:genesia_demo/utils/utils.dart';

part 'onboard_cubit.dart';
part 'onboard_screen.dart';
part 'onboard_state.dart';
part 'widget/choose_ai_friend_screen.dart';
part 'widget/choose_friend_age_screen.dart';
part 'widget/choose_friend_personality_screen.dart';
part 'widget/choose_name_and_gender_screen.dart';
part 'widget/enter_your_name_onboard_screen.dart';
part 'widget/your_dob_screen.dart';
part 'widget/your_interests_screen.dart';
part 'widget/your_pronouns_screen.dart';
