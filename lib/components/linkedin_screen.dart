import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';

UserObject user;
bool logoutUser = false;
final String redirectUrl = 'https://www.linkedin.com/company/smi-tsf-app';
final String clientId = '86im0nzq5wrotn';
final String clientSecret = '2GrI4LjBkhBLfJmK';


class AuthCodeObject {
  String code, state;

  AuthCodeObject({this.code, this.state});
}

class UserObject {
  String firstName, lastName, email, profileImageUrl;

  UserObject({this.firstName, this.lastName, this.email, this.profileImageUrl});
}

class LinkedInuser extends StatefulWidget {
  @override
  _LinkedInuserState createState() => _LinkedInuserState();
}

class _LinkedInuserState extends State<LinkedInuser> {
  @override
  Widget build(BuildContext context) {
    return LinkedInUserWidget(
      appBar: AppBar(
        title: Text('SMI_TSF'),
      ),
      destroySession: logoutUser,
      redirectUrl: redirectUrl,
      clientId: clientId,
      clientSecret: clientSecret,
      projection:  [
        ProjectionParameters.id,
        ProjectionParameters.localizedFirstName,
        ProjectionParameters.localizedLastName,
        ProjectionParameters.firstName,
        ProjectionParameters.lastName,
        ProjectionParameters.profilePicture,
      ],
      onGetUserProfile: (LinkedInUserModel linkedInUser) {
        print('Access token ${linkedInUser.token.accessToken}');

        print('User id: ${linkedInUser.userId}');

        user = UserObject(
          firstName: linkedInUser?.firstName?.localized?.label,
          lastName: linkedInUser?.lastName?.localized?.label,
          email: linkedInUser
              ?.email?.elements[0]?.handleDeep?.emailAddress,
          profileImageUrl: linkedInUser?.profilePicture?.displayImageContent?.elements[0]?.identifiers[0]?.identifier,
        );

        setState(() {
          logoutUser = false;
        });

      },
      catchError: (LinkedInErrorObject error) {
        print('Error description: ${error.description},'
            ' Error code: ${error.statusCode.toString()}');
        Navigator.pop(context);
      },
    );
  }
}
