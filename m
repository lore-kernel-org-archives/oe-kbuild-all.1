Content-Type: multipart/mixed; boundary="===============4965559219038367214=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC v2 08/12] kunit: mock: add basic matchers and actions
Date: Tue, 13 Oct 2020 09:57:24 +0800
Message-ID: <202010130905.OO2S8W7J-lkp@intel.com>
In-Reply-To: <20201012222050.999431-9-dlatypov@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4965559219038367214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 10b82d5176488acee2820e5a2cf0f2ec5c3488b6]

url:    https://github.com/0day-ci/linux/commits/Daniel-Latypov/kunit-intro=
duce-class-mocking-support/20201013-062218
base:    10b82d5176488acee2820e5a2cf0f2ec5c3488b6
config: powerpc64-randconfig-r031-20201012 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project a324d8=
f964bf421fa7d8b882b0f64ead28c4149c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6189c327549d0bbce5bb21f28=
fb607f7ea04976e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Latypov/kunit-introduce-cla=
ss-mocking-support/20201013-062218
        git checkout 6189c327549d0bbce5bb21f28fb607f7ea04976e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/kunit/common-mocks.c:105:1: warning: no previous prototype for funct=
ion 'to_mock_u8_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(u8);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:55:1: note: expanded from here
   to_mock_u8_matcher
   ^
   lib/kunit/common-mocks.c:105:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:106:1: warning: no previous prototype for funct=
ion 'to_mock_u16_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(u16);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:168:1: note: expanded from here
   to_mock_u16_matcher
   ^
   lib/kunit/common-mocks.c:106:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:107:1: warning: no previous prototype for funct=
ion 'to_mock_u32_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(u32);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:281:1: note: expanded from here
   to_mock_u32_matcher
   ^
   lib/kunit/common-mocks.c:107:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:108:1: warning: no previous prototype for funct=
ion 'to_mock_u64_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(u64);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:89:1: note: expanded from here
   to_mock_u64_matcher
   ^
   lib/kunit/common-mocks.c:108:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:59:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:60:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:64:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:65:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:92:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ne, !=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:59:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:92:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ne, !=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:60:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
--
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:65:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:98:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ge, >=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:59:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:98:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ge, >=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:60:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:98:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ge, >=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:64:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:98:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ge, >=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:65:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:100:3: note: expanded from macro 'DEFINE_MATCHE=
R_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, gt, >)               =
       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:59:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:100:3: note: expanded from macro 'DEFINE_MATCHE=
R_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, gt, >)               =
       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:60:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:100:3: note: expanded from macro 'DEFINE_MATCHE=
R_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, gt, >)               =
       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:64:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:108:1: warning: format specifies type 'int' but=
 the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
   DEFINE_MATCHER(u64);
   ^~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:100:3: note: expanded from macro 'DEFINE_MATCHE=
R_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, gt, >)               =
       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:65:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
>> lib/kunit/common-mocks.c:109:1: warning: no previous prototype for funct=
ion 'to_mock_char_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(char);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:202:1: note: expanded from here
   to_mock_char_matcher
   ^
   lib/kunit/common-mocks.c:109:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:110:1: warning: no previous prototype for funct=
ion 'to_mock_uchar_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER_WITH_TYPENAME(uchar, unsigned char);
   ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:6:1: note: expanded from here
   to_mock_uchar_matcher
   ^
   lib/kunit/common-mocks.c:110:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:111:1: warning: no previous prototype for funct=
ion 'to_mock_schar_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER_WITH_TYPENAME(schar, signed char);
   ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:119:1: note: expanded from here
   to_mock_schar_matcher
   ^
   lib/kunit/common-mocks.c:111:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:112:1: warning: no previous prototype for funct=
ion 'to_mock_short_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(short);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:232:1: note: expanded from here
   to_mock_short_matcher
   ^
   lib/kunit/common-mocks.c:112:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:113:1: warning: no previous prototype for funct=
ion 'to_mock_ushort_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER_WITH_TYPENAME(ushort, unsigned short);
   ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:67:1: note: expanded from here
   to_mock_ushort_matcher
   ^
   lib/kunit/common-mocks.c:113:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:114:1: warning: no previous prototype for funct=
ion 'to_mock_int_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(int);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:180:1: note: expanded from here
   to_mock_int_matcher
   ^
   lib/kunit/common-mocks.c:114:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:115:1: warning: no previous prototype for funct=
ion 'to_mock_uint_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER_WITH_TYPENAME(uint, unsigned int);
   ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:7:1: note: expanded from here
   to_mock_uint_matcher
   ^
   lib/kunit/common-mocks.c:115:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
>> lib/kunit/common-mocks.c:116:1: warning: no previous prototype for funct=
ion 'to_mock_long_matcher' [-Wmissing-prototypes]
   DEFINE_MATCHER(long);
   ^
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:37:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   to_mock_##type_name##_matcher(                          =
       \
                   ^
   <scratch space>:120:1: note: expanded from here
   to_mock_long_matcher
   ^
   lib/kunit/common-mocks.c:116:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^
   lib/kunit/common-mocks.c:89:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_TO_MATCHER_STRUCT(type_name)                     =
       \
                   ^
   lib/kunit/common-mocks.c:36:3: note: expanded from macro 'DEFINE_TO_MATC=
HER_STRUCT'
                   struct mock_##type_name##_matcher *                     =
       \
                   ^
   lib/kunit/common-mocks.c:116:1: warning: format specifies type 'int' but=
 the argument has type 'long' [-Wformat]
   DEFINE_MATCHER(long);
   ^~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:59:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:116:1: warning: format specifies type 'int' but=
 the argument has type 'long' [-Wformat]
   DEFINE_MATCHER(long);
   ^~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:60:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:116:1: warning: format specifies type 'int' but=
 the argument has type 'long' [-Wformat]
   DEFINE_MATCHER(long);
   ^~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:64:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:116:1: warning: format specifies type 'int' but=
 the argument has type 'long' [-Wformat]
   DEFINE_MATCHER(long);
   ^~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:90:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, eq, =3D=3D)          =
           \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:65:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:116:1: warning: format specifies type 'int' but=
 the argument has type 'long' [-Wformat]
   DEFINE_MATCHER(long);
   ^~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:92:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ne, !=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:59:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    actual,                =
       \
                                                    ^~~~~~
   lib/kunit/common-mocks.c:116:1: warning: format specifies type 'int' but=
 the argument has type 'long' [-Wformat]
   DEFINE_MATCHER(long);
   ^~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
   #define DEFINE_MATCHER(type) DEFINE_MATCHER_WITH_TYPENAME(type, type)
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:92:3: note: expanded from macro 'DEFINE_MATCHER=
_WITH_TYPENAME'
                   DEFINE_MATCH_FUNC(type_name, type, ne, !=3D)            =
         \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:60:8: note: expanded from macro 'DEFINE_MATCH_F=
UNC'
                                                    matcher->expected);    =
       \
                                                    ^~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:116:1: warning: format specifies type 'int' but=
 the argument has type 'long' [-Wformat]
   DEFINE_MATCHER(long);
   ^~~~~~~~~~~~~~~~~~~~
   lib/kunit/common-mocks.c:103:30: note: expanded from macro 'DEFINE_MATCH=
ER'
..

vim +/to_mock_u8_matcher +105 lib/kunit/common-mocks.c

   104	=

 > 105	DEFINE_MATCHER(u8);
 > 106	DEFINE_MATCHER(u16);
 > 107	DEFINE_MATCHER(u32);
 > 108	DEFINE_MATCHER(u64);
 > 109	DEFINE_MATCHER(char);
 > 110	DEFINE_MATCHER_WITH_TYPENAME(uchar, unsigned char);
 > 111	DEFINE_MATCHER_WITH_TYPENAME(schar, signed char);
 > 112	DEFINE_MATCHER(short);
 > 113	DEFINE_MATCHER_WITH_TYPENAME(ushort, unsigned short);
 > 114	DEFINE_MATCHER(int);
 > 115	DEFINE_MATCHER_WITH_TYPENAME(uint, unsigned int);
 > 116	DEFINE_MATCHER(long);
 > 117	DEFINE_MATCHER_WITH_TYPENAME(ulong, unsigned long);
 > 118	DEFINE_MATCHER_WITH_TYPENAME(longlong, long long);
 > 119	DEFINE_MATCHER_WITH_TYPENAME(ulonglong, unsigned long long);
   120	=

 > 121	DEFINE_MATCHER_WITH_TYPENAME(ptr, void *);
   122	=

   123	struct mock_memeq_matcher {
   124		struct mock_param_matcher matcher;
   125		const void *expected;
   126		size_t size;
   127	};
   128	=

   129	static bool match_memeq(struct mock_param_matcher *pmatcher,
   130				struct kunit_stream *stream,
   131				const void *pactual)
   132	{
   133		struct mock_memeq_matcher *matcher =3D
   134				container_of(pmatcher,
   135					     struct mock_memeq_matcher,
   136					     matcher);
   137		const void *actual =3D CONVERT_TO_ACTUAL_TYPE(const void *, pactual=
);
   138		bool matches =3D !memcmp(actual, matcher->expected, matcher->size);
   139		int i;
   140	=

   141		for (i =3D 0; i < matcher->size; i++)
   142			kunit_stream_add(stream, "%02x, ", ((const char *) actual)[i]);
   143		if (matches)
   144			kunit_stream_add(stream, "=3D=3D ");
   145		else
   146			kunit_stream_add(stream, "!=3D ");
   147		for (i =3D 0; i < matcher->size; i++)
   148			kunit_stream_add(stream,
   149				    "%02x, ",
   150				    ((const char *) matcher->expected)[i]);
   151	=

   152		return matches;
   153	}
   154	=

   155	struct mock_param_matcher *kunit_memeq(struct kunit *test,
   156					      const void *buf,
   157					      size_t size)
   158	{
   159		struct mock_memeq_matcher *matcher;
   160	=

   161		matcher =3D kunit_kzalloc(test, sizeof(*matcher), GFP_KERNEL);
   162		if (!matcher)
   163			return NULL;
   164	=

   165		matcher->matcher.match =3D match_memeq;
   166		matcher->expected =3D buf;
   167		matcher->size =3D size;
   168	=

   169		return &matcher->matcher;
   170	}
   171	=

   172	struct mock_streq_matcher {
   173		struct mock_param_matcher matcher;
   174		const char *expected;
   175	};
   176	=

   177	static bool match_streq(struct mock_param_matcher *pmatcher,
   178				struct kunit_stream *stream,
   179				const void *pactual)
   180	{
   181		struct mock_streq_matcher *matcher =3D
   182				container_of(pmatcher,
   183					     struct mock_streq_matcher,
   184					     matcher);
   185		const char *actual =3D CONVERT_TO_ACTUAL_TYPE(const char *, pactual=
);
   186		bool matches =3D !strcmp(actual, matcher->expected);
   187	=

   188		if (matches)
   189			kunit_stream_add(stream, "%s =3D=3D %s", actual, matcher->expected=
);
   190		else
   191			kunit_stream_add(stream, "%s !=3D %s", actual, matcher->expected);
   192	=

   193		return matches;
   194	}
   195	=

   196	struct mock_param_matcher *kunit_streq(struct kunit *test, const cha=
r *str)
   197	{
   198		struct mock_streq_matcher *matcher;
   199	=

   200		matcher =3D kunit_kzalloc(test, sizeof(*matcher), GFP_KERNEL);
   201		if (!matcher)
   202			return NULL;
   203	=

   204		matcher->matcher.match =3D match_streq;
   205		matcher->expected =3D str;
   206	=

   207		return &matcher->matcher;
   208	}
   209	=

   210	#define DEFINE_RETURN_ACTION_STRUCT(type_name, type)			       \
   211			struct mock_##type_name##_action {			       \
   212				struct mock_action action;			       \
   213				type ret;					       \
   214			}
   215	=

   216	#define DEFINE_RETURN_ACTION_FUNC(type_name, type)			       \
   217			void *do_##type_name##_return(struct mock_action *paction,     \
   218						      const void **params,	       \
   219						      int len)			       \
   220			{							       \
   221				struct mock_##type_name##_action *action =3D	       \
   222						container_of(paction,		       \
   223							     struct mock_##type_name##_action,\
   224							     action);		       \
   225										       \
   226				return (void *) &action->ret;			       \
   227			}
   228	=

   229	#define DEFINE_RETURN_ACTION_FACTORY(type_name, type)			       \
   230			struct mock_action *kunit_##type_name##_return(		       \
   231					struct kunit *test,			       \
   232					type ret)				       \
   233			{							       \
   234				struct mock_##type_name##_action *action;	       \
   235										       \
   236				action =3D kunit_kmalloc(test,			       \
   237						      sizeof(*action),		       \
   238						      GFP_KERNEL);		       \
   239				if (!action)					       \
   240					return NULL;				       \
   241										       \
   242				action->action.do_action =3D do_##type_name##_return;    \
   243				action->ret =3D ret;				       \
   244										       \
   245				return &action->action;				       \
   246			}
   247	=

   248	#define DEFINE_RETURN_ACTION_WITH_TYPENAME(type_name, type)		       \
   249			DEFINE_RETURN_ACTION_STRUCT(type_name, type);		       \
   250			DEFINE_RETURN_ACTION_FUNC(type_name, type);		       \
   251			DEFINE_RETURN_ACTION_FACTORY(type_name, type)
   252	=

   253	#define DEFINE_RETURN_ACTION(type) \
   254			DEFINE_RETURN_ACTION_WITH_TYPENAME(type, type)
   255	=

 > 256	DEFINE_RETURN_ACTION(u8);
 > 257	DEFINE_RETURN_ACTION(u16);
 > 258	DEFINE_RETURN_ACTION(u32);
 > 259	DEFINE_RETURN_ACTION(u64);
 > 260	DEFINE_RETURN_ACTION(char);
 > 261	DEFINE_RETURN_ACTION_WITH_TYPENAME(uchar, unsigned char);
 > 262	DEFINE_RETURN_ACTION_WITH_TYPENAME(schar, signed char);
 > 263	DEFINE_RETURN_ACTION(short);
 > 264	DEFINE_RETURN_ACTION_WITH_TYPENAME(ushort, unsigned short);
 > 265	DEFINE_RETURN_ACTION(int);
 > 266	DEFINE_RETURN_ACTION_WITH_TYPENAME(uint, unsigned int);
 > 267	DEFINE_RETURN_ACTION(long);
 > 268	DEFINE_RETURN_ACTION_WITH_TYPENAME(ulong, unsigned long);
 > 269	DEFINE_RETURN_ACTION_WITH_TYPENAME(longlong, long long);
 > 270	DEFINE_RETURN_ACTION_WITH_TYPENAME(ulonglong, unsigned long long);
 > 271	DEFINE_RETURN_ACTION_WITH_TYPENAME(ptr, void *);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4965559219038367214==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4965559219038367214==--

