import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProfileService {
  ParseObject _profile;
  Future<Map<String, dynamic>> getProfile() async {
    final currentUser = await ParseUser.currentUser();
    print(currentUser);
    ParseObject profileObject = ParseObject('Profile');
    QueryBuilder<ParseObject> profile = QueryBuilder<ParseObject>(profileObject)
      ..whereEqualTo('user', currentUser);
    try {
      var response = await profile.query();
      var returnValue = await response.results[0];
      return {'status': 200, 'response': returnValue, 'message': 'Profile'};
    } catch (e) {
      print('Profile get Error $e');
      return {
        'status': 400,
        'response': e,
        'message': 'Unable to get your profile'
      };
    }
  }

  Future<void> setCountry(String country, String method) async {
    switch (method) {
      case 'nationality':
        _profile.set('nationality', country);
        break;
      default:
        _profile.set('country_of_residence', country);
        break;
    }
    await _profile.save();
  }

  Future<void> setCity(String city) async {
    _profile.set('city_of_residence', city);
    await _profile.save();
  }

  Future<void> setGender(String gender) async {
    _profile.set('gender', gender);
    await _profile.save();
  }

  Future<void> setFacebook(String facebook) async {
    _profile.set('facebook', facebook);
    await _profile.save();
  }

  Future<void> setTwitter(String twitter) async {
    _profile.set('twitter', twitter);
    await _profile.save();
  }

  Future<void> setLinkedIn(String linkedIn) async {
    _profile.set('linkedIn', linkedIn);
    await _profile.save();
  }

  Future<void> setWebsite(String website) async {
    _profile.set('website', website);
    await _profile.save();
  }

  Future<void> setSummary(String summary) async {
    _profile.set('summary', summary);
    await _profile.save();
  }

  Future<void> setPVEWork(String pveWork) async {
    _profile.set('pve_work', pveWork);
    await _profile.save();
  }

  Future<void> setFunFacts(String funFacts) async {
    _profile.set('fun_facts', funFacts);
    await _profile.save();
  }

  Future<void> setDateOfBirth(String dateOfBirth) async {
    _profile.set('date_of_birth', dateOfBirth);
    await _profile.save();
  }

  Future<void> setPhoneNumber(String phoneNumber) async {
    _profile.set('phone_number', phoneNumber);
    await _profile.save();
  }
}
