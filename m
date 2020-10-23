Content-Type: multipart/mixed; boundary="===============5161699833938365785=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/2] kunit: Support for Parameterized Testing
Date: Sat, 24 Oct 2020 02:14:26 +0800
Message-ID: <202010240204.uq8kxhNh-lkp@intel.com>
In-Reply-To: <20201023150536.282568-1-98.arpi@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5161699833938365785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arpitha,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ext4/dev]
[also build test WARNING on linus/master v5.9 next-20201023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arpitha-Raghunandan/kunit-=
Support-for-Parameterized-Testing/20201023-230827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: arm64-randconfig-r026-20201023 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 147b94=
97e79a98a8614b2b5eb4ba653b44f6b6f0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/2c09a7974ce3b438845bfafb5=
39513dc91c021b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arpitha-Raghunandan/kunit-Support-=
for-Parameterized-Testing/20201023-230827
        git checkout 2c09a7974ce3b438845bfafb539513dc91c021b4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from lib/kunit/test.c:9:
>> include/kunit/test.h:1732:2: warning: comparison of distinct pointer typ=
es ('typeof (__left) *' (aka 'unsigned long *') and 'typeof (__right) *' (a=
ka 'int *')) [-Wcompare-distinct-pointer-types]
           KUNIT_ASSERT_EQ(test, (prev_param - param_array) % type_size, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1494:2: note: expanded from macro 'KUNIT_ASSERT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:843:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:833:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:744:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:720:9: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           ((void)__typecheck(__left, __right));                           =
       \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:850:29: note: expanded from macro '__typecheck'
                   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
                              ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   In file included from lib/kunit/test.c:9:
>> include/kunit/test.h:1737:2: warning: incompatible pointer to integer co=
nversion initializing 'long long' with an expression of type 'typeof (prev_=
param)' (aka 'void *') [-Wint-conversion]
           KUNIT_ASSERT_GE(test, prev_param, param_array);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1644:2: note: expanded from macro 'KUNIT_ASSERT_GE'
           KUNIT_BINARY_GE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1038:2: note: expanded from macro 'KUNIT_BINARY_GE_=
ASSERTION'
           KUNIT_BINARY_GE_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1028:2: note: expanded from macro 'KUNIT_BINARY_GE_=
MSG_ASSERTION'
           KUNIT_BASE_GE_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/kunit/test.h:729:8: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                                             __left,                       =
       \
                                             ^~~~~~
   include/kunit/assert.h:238:16: note: expanded from macro 'KUNIT_INIT_BIN=
ARY_ASSERT_STRUCT'
           .left_value =3D left_val,                                       =
         \
                         ^~~~~~~~
   include/kunit/test.h:622:36: note: expanded from macro 'KUNIT_ASSERTION'
           struct assert_class __assertion =3D INITIALIZER;                =
         \
                                             ^~~~~~~~~~~
>> include/kunit/test.h:1737:2: warning: incompatible pointer to integer co=
nversion initializing 'long long' with an expression of type 'typeof (param=
_array)' (aka 'void *') [-Wint-conversion]
           KUNIT_ASSERT_GE(test, prev_param, param_array);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1644:2: note: expanded from macro 'KUNIT_ASSERT_GE'
           KUNIT_BINARY_GE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1038:2: note: expanded from macro 'KUNIT_BINARY_GE_=
ASSERTION'
           KUNIT_BINARY_GE_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1028:2: note: expanded from macro 'KUNIT_BINARY_GE_=
MSG_ASSERTION'
           KUNIT_BASE_GE_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/kunit/test.h:731:8: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                                             __right),                     =
       \
                                             ^~~~~~~
   include/kunit/assert.h:240:17: note: expanded from macro 'KUNIT_INIT_BIN=
ARY_ASSERT_STRUCT'
           .right_value =3D right_val                                      =
         \
                          ^~~~~~~~~
   include/kunit/test.h:622:36: note: expanded from macro 'KUNIT_ASSERTION'
           struct assert_class __assertion =3D INITIALIZER;                =
         \
                                             ^~~~~~~~~~~
   3 warnings generated.
--
   In file included from lib/kunit/debugfs.c:10:
>> include/kunit/test.h:1732:2: warning: comparison of distinct pointer typ=
es ('typeof (__left) *' (aka 'unsigned long *') and 'typeof (__right) *' (a=
ka 'int *')) [-Wcompare-distinct-pointer-types]
           KUNIT_ASSERT_EQ(test, (prev_param - param_array) % type_size, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1494:2: note: expanded from macro 'KUNIT_ASSERT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:843:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:833:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:744:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:720:9: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           ((void)__typecheck(__left, __right));                           =
       \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:850:29: note: expanded from macro '__typecheck'
                   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
                              ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   In file included from lib/kunit/debugfs.c:10:
>> include/kunit/test.h:1737:2: warning: incompatible pointer to integer co=
nversion initializing 'long long' with an expression of type 'typeof (prev_=
param)' (aka 'void *') [-Wint-conversion]
           KUNIT_ASSERT_GE(test, prev_param, param_array);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1644:2: note: expanded from macro 'KUNIT_ASSERT_GE'
           KUNIT_BINARY_GE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1038:2: note: expanded from macro 'KUNIT_BINARY_GE_=
ASSERTION'
           KUNIT_BINARY_GE_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1028:2: note: expanded from macro 'KUNIT_BINARY_GE_=
MSG_ASSERTION'
           KUNIT_BASE_GE_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/kunit/test.h:729:8: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                                             __left,                       =
       \
                                             ^~~~~~
   include/kunit/assert.h:238:16: note: expanded from macro 'KUNIT_INIT_BIN=
ARY_ASSERT_STRUCT'
           .left_value =3D left_val,                                       =
         \
                         ^~~~~~~~
   include/kunit/test.h:622:36: note: expanded from macro 'KUNIT_ASSERTION'
           struct assert_class __assertion =3D INITIALIZER;                =
         \
                                             ^~~~~~~~~~~
>> include/kunit/test.h:1737:2: warning: incompatible pointer to integer co=
nversion initializing 'long long' with an expression of type 'typeof (param=
_array)' (aka 'void *') [-Wint-conversion]
           KUNIT_ASSERT_GE(test, prev_param, param_array);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1644:2: note: expanded from macro 'KUNIT_ASSERT_GE'
           KUNIT_BINARY_GE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1038:2: note: expanded from macro 'KUNIT_BINARY_GE_=
ASSERTION'
           KUNIT_BINARY_GE_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1028:2: note: expanded from macro 'KUNIT_BINARY_GE_=
MSG_ASSERTION'
           KUNIT_BASE_GE_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/kunit/test.h:731:8: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                                             __right),                     =
       \
                                             ^~~~~~~
   include/kunit/assert.h:240:17: note: expanded from macro 'KUNIT_INIT_BIN=
ARY_ASSERT_STRUCT'
           .right_value =3D right_val                                      =
         \
                          ^~~~~~~~~
   include/kunit/test.h:622:36: note: expanded from macro 'KUNIT_ASSERTION'
           struct assert_class __assertion =3D INITIALIZER;                =
         \
                                             ^~~~~~~~~~~
   lib/kunit/debugfs.c:28:6: warning: no previous prototype for function 'k=
unit_debugfs_cleanup' [-Wmissing-prototypes]
   void kunit_debugfs_cleanup(void)
        ^
   lib/kunit/debugfs.c:28:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
   void kunit_debugfs_cleanup(void)
   ^
   static =

   lib/kunit/debugfs.c:33:6: warning: no previous prototype for function 'k=
unit_debugfs_init' [-Wmissing-prototypes]
   void kunit_debugfs_init(void)
        ^
   lib/kunit/debugfs.c:33:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
   void kunit_debugfs_init(void)
   ^
   static =

   lib/kunit/debugfs.c:92:6: warning: no previous prototype for function 'k=
unit_debugfs_create_suite' [-Wmissing-prototypes]
   void kunit_debugfs_create_suite(struct kunit_suite *suite)
        ^
   lib/kunit/debugfs.c:92:1: note: declare 'static' if the function is not =
intended to be used outside of this translation unit
   void kunit_debugfs_create_suite(struct kunit_suite *suite)
   ^
   static =

   lib/kunit/debugfs.c:108:6: warning: no previous prototype for function '=
kunit_debugfs_destroy_suite' [-Wmissing-prototypes]
   void kunit_debugfs_destroy_suite(struct kunit_suite *suite)
        ^
   lib/kunit/debugfs.c:108:1: note: declare 'static' if the function is not=
 intended to be used outside of this translation unit
   void kunit_debugfs_destroy_suite(struct kunit_suite *suite)
   ^
   static =

   7 warnings generated.

vim +1732 include/kunit/test.h

  1147	=

  1148	#define KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, assert_type, ptr)	=
       \
  1149		KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,			       \
  1150							assert_type,		       \
  1151							ptr,			       \
  1152							NULL)
  1153	=

  1154	/**
  1155	 * KUNIT_EXPECT_TRUE() - Causes a test failure when the expression i=
s not true.
  1156	 * @test: The test context object.
  1157	 * @condition: an arbitrary boolean expression. The test fails when =
this does
  1158	 * not evaluate to true.
  1159	 *
  1160	 * This and expectations of the form `KUNIT_EXPECT_*` will cause the=
 test case
  1161	 * to fail when the specified condition is not met; however, it will=
 not prevent
  1162	 * the test case from continuing to run; this is otherwise known as =
an
  1163	 * *expectation failure*.
  1164	 */
  1165	#define KUNIT_EXPECT_TRUE(test, condition) \
  1166		KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
  1167	=

  1168	#define KUNIT_EXPECT_TRUE_MSG(test, condition, fmt, ...)		       \
  1169		KUNIT_TRUE_MSG_ASSERTION(test,					       \
  1170					 KUNIT_EXPECTATION,			       \
  1171					 condition,				       \
  1172					 fmt,					       \
  1173					 ##__VA_ARGS__)
  1174	=

  1175	/**
  1176	 * KUNIT_EXPECT_FALSE() - Makes a test failure when the expression i=
s not false.
  1177	 * @test: The test context object.
  1178	 * @condition: an arbitrary boolean expression. The test fails when =
this does
  1179	 * not evaluate to false.
  1180	 *
  1181	 * Sets an expectation that @condition evaluates to false. See
  1182	 * KUNIT_EXPECT_TRUE() for more information.
  1183	 */
  1184	#define KUNIT_EXPECT_FALSE(test, condition) \
  1185		KUNIT_FALSE_ASSERTION(test, KUNIT_EXPECTATION, condition)
  1186	=

  1187	#define KUNIT_EXPECT_FALSE_MSG(test, condition, fmt, ...)		       \
  1188		KUNIT_FALSE_MSG_ASSERTION(test,					       \
  1189					  KUNIT_EXPECTATION,			       \
  1190					  condition,				       \
  1191					  fmt,					       \
  1192					  ##__VA_ARGS__)
  1193	=

  1194	/**
  1195	 * KUNIT_EXPECT_EQ() - Sets an expectation that @left and @right are=
 equal.
  1196	 * @test: The test context object.
  1197	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1198	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1199	 *
  1200	 * Sets an expectation that the values that @left and @right evaluat=
e to are
  1201	 * equal. This is semantically equivalent to
  1202	 * KUNIT_EXPECT_TRUE(@test, (@left) =3D=3D (@right)). See KUNIT_EXPE=
CT_TRUE() for
  1203	 * more information.
  1204	 */
  1205	#define KUNIT_EXPECT_EQ(test, left, right) \
  1206		KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1207	=

  1208	#define KUNIT_EXPECT_EQ_MSG(test, left, right, fmt, ...)		       \
  1209		KUNIT_BINARY_EQ_MSG_ASSERTION(test,				       \
  1210					      KUNIT_EXPECTATION,		       \
  1211					      left,				       \
  1212					      right,				       \
  1213					      fmt,				       \
  1214					      ##__VA_ARGS__)
  1215	=

  1216	/**
  1217	 * KUNIT_EXPECT_PTR_EQ() - Expects that pointers @left and @right ar=
e equal.
  1218	 * @test: The test context object.
  1219	 * @left: an arbitrary expression that evaluates to a pointer.
  1220	 * @right: an arbitrary expression that evaluates to a pointer.
  1221	 *
  1222	 * Sets an expectation that the values that @left and @right evaluat=
e to are
  1223	 * equal. This is semantically equivalent to
  1224	 * KUNIT_EXPECT_TRUE(@test, (@left) =3D=3D (@right)). See KUNIT_EXPE=
CT_TRUE() for
  1225	 * more information.
  1226	 */
  1227	#define KUNIT_EXPECT_PTR_EQ(test, left, right)				       \
  1228		KUNIT_BINARY_PTR_EQ_ASSERTION(test,				       \
  1229					      KUNIT_EXPECTATION,		       \
  1230					      left,				       \
  1231					      right)
  1232	=

  1233	#define KUNIT_EXPECT_PTR_EQ_MSG(test, left, right, fmt, ...)		      =
 \
  1234		KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,				       \
  1235						  KUNIT_EXPECTATION,		       \
  1236						  left,				       \
  1237						  right,			       \
  1238						  fmt,				       \
  1239						  ##__VA_ARGS__)
  1240	=

  1241	/**
  1242	 * KUNIT_EXPECT_NE() - An expectation that @left and @right are not =
equal.
  1243	 * @test: The test context object.
  1244	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1245	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1246	 *
  1247	 * Sets an expectation that the values that @left and @right evaluat=
e to are not
  1248	 * equal. This is semantically equivalent to
  1249	 * KUNIT_EXPECT_TRUE(@test, (@left) !=3D (@right)). See KUNIT_EXPECT=
_TRUE() for
  1250	 * more information.
  1251	 */
  1252	#define KUNIT_EXPECT_NE(test, left, right) \
  1253		KUNIT_BINARY_NE_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1254	=

  1255	#define KUNIT_EXPECT_NE_MSG(test, left, right, fmt, ...)		       \
  1256		KUNIT_BINARY_NE_MSG_ASSERTION(test,				       \
  1257					      KUNIT_EXPECTATION,		       \
  1258					      left,				       \
  1259					      right,				       \
  1260					      fmt,				       \
  1261					      ##__VA_ARGS__)
  1262	=

  1263	/**
  1264	 * KUNIT_EXPECT_PTR_NE() - Expects that pointers @left and @right ar=
e not equal.
  1265	 * @test: The test context object.
  1266	 * @left: an arbitrary expression that evaluates to a pointer.
  1267	 * @right: an arbitrary expression that evaluates to a pointer.
  1268	 *
  1269	 * Sets an expectation that the values that @left and @right evaluat=
e to are not
  1270	 * equal. This is semantically equivalent to
  1271	 * KUNIT_EXPECT_TRUE(@test, (@left) !=3D (@right)). See KUNIT_EXPECT=
_TRUE() for
  1272	 * more information.
  1273	 */
  1274	#define KUNIT_EXPECT_PTR_NE(test, left, right)				       \
  1275		KUNIT_BINARY_PTR_NE_ASSERTION(test,				       \
  1276					      KUNIT_EXPECTATION,		       \
  1277					      left,				       \
  1278					      right)
  1279	=

  1280	#define KUNIT_EXPECT_PTR_NE_MSG(test, left, right, fmt, ...)		      =
 \
  1281		KUNIT_BINARY_PTR_NE_MSG_ASSERTION(test,				       \
  1282						  KUNIT_EXPECTATION,		       \
  1283						  left,				       \
  1284						  right,			       \
  1285						  fmt,				       \
  1286						  ##__VA_ARGS__)
  1287	=

  1288	/**
  1289	 * KUNIT_EXPECT_LT() - An expectation that @left is less than @right.
  1290	 * @test: The test context object.
  1291	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1292	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1293	 *
  1294	 * Sets an expectation that the value that @left evaluates to is les=
s than the
  1295	 * value that @right evaluates to. This is semantically equivalent to
  1296	 * KUNIT_EXPECT_TRUE(@test, (@left) < (@right)). See KUNIT_EXPECT_TR=
UE() for
  1297	 * more information.
  1298	 */
  1299	#define KUNIT_EXPECT_LT(test, left, right) \
  1300		KUNIT_BINARY_LT_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1301	=

  1302	#define KUNIT_EXPECT_LT_MSG(test, left, right, fmt, ...)		       \
  1303		KUNIT_BINARY_LT_MSG_ASSERTION(test,				       \
  1304					      KUNIT_EXPECTATION,		       \
  1305					      left,				       \
  1306					      right,				       \
  1307					      fmt,				       \
  1308					      ##__VA_ARGS__)
  1309	=

  1310	/**
  1311	 * KUNIT_EXPECT_LE() - Expects that @left is less than or equal to @=
right.
  1312	 * @test: The test context object.
  1313	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1314	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1315	 *
  1316	 * Sets an expectation that the value that @left evaluates to is les=
s than or
  1317	 * equal to the value that @right evaluates to. Semantically this is=
 equivalent
  1318	 * to KUNIT_EXPECT_TRUE(@test, (@left) <=3D (@right)). See KUNIT_EXP=
ECT_TRUE() for
  1319	 * more information.
  1320	 */
  1321	#define KUNIT_EXPECT_LE(test, left, right) \
  1322		KUNIT_BINARY_LE_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1323	=

  1324	#define KUNIT_EXPECT_LE_MSG(test, left, right, fmt, ...)		       \
  1325		KUNIT_BINARY_LE_MSG_ASSERTION(test,				       \
  1326					      KUNIT_EXPECTATION,		       \
  1327					      left,				       \
  1328					      right,				       \
  1329					      fmt,				       \
  1330					      ##__VA_ARGS__)
  1331	=

  1332	/**
  1333	 * KUNIT_EXPECT_GT() - An expectation that @left is greater than @ri=
ght.
  1334	 * @test: The test context object.
  1335	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1336	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1337	 *
  1338	 * Sets an expectation that the value that @left evaluates to is gre=
ater than
  1339	 * the value that @right evaluates to. This is semantically equivale=
nt to
  1340	 * KUNIT_EXPECT_TRUE(@test, (@left) > (@right)). See KUNIT_EXPECT_TR=
UE() for
  1341	 * more information.
  1342	 */
  1343	#define KUNIT_EXPECT_GT(test, left, right) \
  1344		KUNIT_BINARY_GT_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1345	=

  1346	#define KUNIT_EXPECT_GT_MSG(test, left, right, fmt, ...)		       \
  1347		KUNIT_BINARY_GT_MSG_ASSERTION(test,				       \
  1348					      KUNIT_EXPECTATION,		       \
  1349					      left,				       \
  1350					      right,				       \
  1351					      fmt,				       \
  1352					      ##__VA_ARGS__)
  1353	=

  1354	/**
  1355	 * KUNIT_EXPECT_GE() - Expects that @left is greater than or equal t=
o @right.
  1356	 * @test: The test context object.
  1357	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1358	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1359	 *
  1360	 * Sets an expectation that the value that @left evaluates to is gre=
ater than
  1361	 * the value that @right evaluates to. This is semantically equivale=
nt to
  1362	 * KUNIT_EXPECT_TRUE(@test, (@left) >=3D (@right)). See KUNIT_EXPECT=
_TRUE() for
  1363	 * more information.
  1364	 */
  1365	#define KUNIT_EXPECT_GE(test, left, right) \
  1366		KUNIT_BINARY_GE_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1367	=

  1368	#define KUNIT_EXPECT_GE_MSG(test, left, right, fmt, ...)		       \
  1369		KUNIT_BINARY_GE_MSG_ASSERTION(test,				       \
  1370					      KUNIT_EXPECTATION,		       \
  1371					      left,				       \
  1372					      right,				       \
  1373					      fmt,				       \
  1374					      ##__VA_ARGS__)
  1375	=

  1376	/**
  1377	 * KUNIT_EXPECT_STREQ() - Expects that strings @left and @right are =
equal.
  1378	 * @test: The test context object.
  1379	 * @left: an arbitrary expression that evaluates to a null terminate=
d string.
  1380	 * @right: an arbitrary expression that evaluates to a null terminat=
ed string.
  1381	 *
  1382	 * Sets an expectation that the values that @left and @right evaluat=
e to are
  1383	 * equal. This is semantically equivalent to
  1384	 * KUNIT_EXPECT_TRUE(@test, !strcmp((@left), (@right))). See KUNIT_E=
XPECT_TRUE()
  1385	 * for more information.
  1386	 */
  1387	#define KUNIT_EXPECT_STREQ(test, left, right) \
  1388		KUNIT_BINARY_STR_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1389	=

  1390	#define KUNIT_EXPECT_STREQ_MSG(test, left, right, fmt, ...)		       \
  1391		KUNIT_BINARY_STR_EQ_MSG_ASSERTION(test,				       \
  1392						  KUNIT_EXPECTATION,		       \
  1393						  left,				       \
  1394						  right,			       \
  1395						  fmt,				       \
  1396						  ##__VA_ARGS__)
  1397	=

  1398	/**
  1399	 * KUNIT_EXPECT_STRNEQ() - Expects that strings @left and @right are=
 not equal.
  1400	 * @test: The test context object.
  1401	 * @left: an arbitrary expression that evaluates to a null terminate=
d string.
  1402	 * @right: an arbitrary expression that evaluates to a null terminat=
ed string.
  1403	 *
  1404	 * Sets an expectation that the values that @left and @right evaluat=
e to are
  1405	 * not equal. This is semantically equivalent to
  1406	 * KUNIT_EXPECT_TRUE(@test, strcmp((@left), (@right))). See KUNIT_EX=
PECT_TRUE()
  1407	 * for more information.
  1408	 */
  1409	#define KUNIT_EXPECT_STRNEQ(test, left, right) \
  1410		KUNIT_BINARY_STR_NE_ASSERTION(test, KUNIT_EXPECTATION, left, right)
  1411	=

  1412	#define KUNIT_EXPECT_STRNEQ_MSG(test, left, right, fmt, ...)		      =
 \
  1413		KUNIT_BINARY_STR_NE_MSG_ASSERTION(test,				       \
  1414						  KUNIT_EXPECTATION,		       \
  1415						  left,				       \
  1416						  right,			       \
  1417						  fmt,				       \
  1418						  ##__VA_ARGS__)
  1419	=

  1420	/**
  1421	 * KUNIT_EXPECT_NOT_ERR_OR_NULL() - Expects that @ptr is not null an=
d not err.
  1422	 * @test: The test context object.
  1423	 * @ptr: an arbitrary pointer.
  1424	 *
  1425	 * Sets an expectation that the value that @ptr evaluates to is not =
null and not
  1426	 * an errno stored in a pointer. This is semantically equivalent to
  1427	 * KUNIT_EXPECT_TRUE(@test, !IS_ERR_OR_NULL(@ptr)). See KUNIT_EXPECT=
_TRUE() for
  1428	 * more information.
  1429	 */
  1430	#define KUNIT_EXPECT_NOT_ERR_OR_NULL(test, ptr) \
  1431		KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_EXPECTATION, ptr)
  1432	=

  1433	#define KUNIT_EXPECT_NOT_ERR_OR_NULL_MSG(test, ptr, fmt, ...)		     =
  \
  1434		KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,			       \
  1435							KUNIT_EXPECTATION,	       \
  1436							ptr,			       \
  1437							fmt,			       \
  1438							##__VA_ARGS__)
  1439	=

  1440	#define KUNIT_ASSERT_FAILURE(test, fmt, ...) \
  1441		KUNIT_FAIL_ASSERTION(test, KUNIT_ASSERTION, fmt, ##__VA_ARGS__)
  1442	=

  1443	/**
  1444	 * KUNIT_ASSERT_TRUE() - Sets an assertion that @condition is true.
  1445	 * @test: The test context object.
  1446	 * @condition: an arbitrary boolean expression. The test fails and a=
borts when
  1447	 * this does not evaluate to true.
  1448	 *
  1449	 * This and assertions of the form `KUNIT_ASSERT_*` will cause the t=
est case to
  1450	 * fail *and immediately abort* when the specified condition is not =
met. Unlike
  1451	 * an expectation failure, it will prevent the test case from contin=
uing to run;
  1452	 * this is otherwise known as an *assertion failure*.
  1453	 */
  1454	#define KUNIT_ASSERT_TRUE(test, condition) \
  1455		KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
  1456	=

  1457	#define KUNIT_ASSERT_TRUE_MSG(test, condition, fmt, ...)		       \
  1458		KUNIT_TRUE_MSG_ASSERTION(test,					       \
  1459					 KUNIT_ASSERTION,			       \
  1460					 condition,				       \
  1461					 fmt,					       \
  1462					 ##__VA_ARGS__)
  1463	=

  1464	/**
  1465	 * KUNIT_ASSERT_FALSE() - Sets an assertion that @condition is false.
  1466	 * @test: The test context object.
  1467	 * @condition: an arbitrary boolean expression.
  1468	 *
  1469	 * Sets an assertion that the value that @condition evaluates to is =
false. This
  1470	 * is the same as KUNIT_EXPECT_FALSE(), except it causes an assertio=
n failure
  1471	 * (see KUNIT_ASSERT_TRUE()) when the assertion is not met.
  1472	 */
  1473	#define KUNIT_ASSERT_FALSE(test, condition) \
  1474		KUNIT_FALSE_ASSERTION(test, KUNIT_ASSERTION, condition)
  1475	=

  1476	#define KUNIT_ASSERT_FALSE_MSG(test, condition, fmt, ...)		       \
  1477		KUNIT_FALSE_MSG_ASSERTION(test,					       \
  1478					  KUNIT_ASSERTION,			       \
  1479					  condition,				       \
  1480					  fmt,					       \
  1481					  ##__VA_ARGS__)
  1482	=

  1483	/**
  1484	 * KUNIT_ASSERT_EQ() - Sets an assertion that @left and @right are e=
qual.
  1485	 * @test: The test context object.
  1486	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1487	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1488	 *
  1489	 * Sets an assertion that the values that @left and @right evaluate =
to are
  1490	 * equal. This is the same as KUNIT_EXPECT_EQ(), except it causes an=
 assertion
  1491	 * failure (see KUNIT_ASSERT_TRUE()) when the assertion is not met.
  1492	 */
  1493	#define KUNIT_ASSERT_EQ(test, left, right) \
  1494		KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1495	=

  1496	#define KUNIT_ASSERT_EQ_MSG(test, left, right, fmt, ...)		       \
  1497		KUNIT_BINARY_EQ_MSG_ASSERTION(test,				       \
  1498					      KUNIT_ASSERTION,			       \
  1499					      left,				       \
  1500					      right,				       \
  1501					      fmt,				       \
  1502					      ##__VA_ARGS__)
  1503	=

  1504	/**
  1505	 * KUNIT_ASSERT_PTR_EQ() - Asserts that pointers @left and @right ar=
e equal.
  1506	 * @test: The test context object.
  1507	 * @left: an arbitrary expression that evaluates to a pointer.
  1508	 * @right: an arbitrary expression that evaluates to a pointer.
  1509	 *
  1510	 * Sets an assertion that the values that @left and @right evaluate =
to are
  1511	 * equal. This is the same as KUNIT_EXPECT_EQ(), except it causes an=
 assertion
  1512	 * failure (see KUNIT_ASSERT_TRUE()) when the assertion is not met.
  1513	 */
  1514	#define KUNIT_ASSERT_PTR_EQ(test, left, right) \
  1515		KUNIT_BINARY_PTR_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1516	=

  1517	#define KUNIT_ASSERT_PTR_EQ_MSG(test, left, right, fmt, ...)		      =
 \
  1518		KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,				       \
  1519						  KUNIT_ASSERTION,		       \
  1520						  left,				       \
  1521						  right,			       \
  1522						  fmt,				       \
  1523						  ##__VA_ARGS__)
  1524	=

  1525	/**
  1526	 * KUNIT_ASSERT_NE() - An assertion that @left and @right are not eq=
ual.
  1527	 * @test: The test context object.
  1528	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1529	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1530	 *
  1531	 * Sets an assertion that the values that @left and @right evaluate =
to are not
  1532	 * equal. This is the same as KUNIT_EXPECT_NE(), except it causes an=
 assertion
  1533	 * failure (see KUNIT_ASSERT_TRUE()) when the assertion is not met.
  1534	 */
  1535	#define KUNIT_ASSERT_NE(test, left, right) \
  1536		KUNIT_BINARY_NE_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1537	=

  1538	#define KUNIT_ASSERT_NE_MSG(test, left, right, fmt, ...)		       \
  1539		KUNIT_BINARY_NE_MSG_ASSERTION(test,				       \
  1540					      KUNIT_ASSERTION,			       \
  1541					      left,				       \
  1542					      right,				       \
  1543					      fmt,				       \
  1544					      ##__VA_ARGS__)
  1545	=

  1546	/**
  1547	 * KUNIT_ASSERT_PTR_NE() - Asserts that pointers @left and @right ar=
e not equal.
  1548	 * KUNIT_ASSERT_PTR_EQ() - Asserts that pointers @left and @right ar=
e equal.
  1549	 * @test: The test context object.
  1550	 * @left: an arbitrary expression that evaluates to a pointer.
  1551	 * @right: an arbitrary expression that evaluates to a pointer.
  1552	 *
  1553	 * Sets an assertion that the values that @left and @right evaluate =
to are not
  1554	 * equal. This is the same as KUNIT_EXPECT_NE(), except it causes an=
 assertion
  1555	 * failure (see KUNIT_ASSERT_TRUE()) when the assertion is not met.
  1556	 */
  1557	#define KUNIT_ASSERT_PTR_NE(test, left, right) \
  1558		KUNIT_BINARY_PTR_NE_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1559	=

  1560	#define KUNIT_ASSERT_PTR_NE_MSG(test, left, right, fmt, ...)		      =
 \
  1561		KUNIT_BINARY_PTR_NE_MSG_ASSERTION(test,				       \
  1562						  KUNIT_ASSERTION,		       \
  1563						  left,				       \
  1564						  right,			       \
  1565						  fmt,				       \
  1566						  ##__VA_ARGS__)
  1567	/**
  1568	 * KUNIT_ASSERT_LT() - An assertion that @left is less than @right.
  1569	 * @test: The test context object.
  1570	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1571	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1572	 *
  1573	 * Sets an assertion that the value that @left evaluates to is less =
than the
  1574	 * value that @right evaluates to. This is the same as KUNIT_EXPECT_=
LT(), except
  1575	 * it causes an assertion failure (see KUNIT_ASSERT_TRUE()) when the=
 assertion
  1576	 * is not met.
  1577	 */
  1578	#define KUNIT_ASSERT_LT(test, left, right) \
  1579		KUNIT_BINARY_LT_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1580	=

  1581	#define KUNIT_ASSERT_LT_MSG(test, left, right, fmt, ...)		       \
  1582		KUNIT_BINARY_LT_MSG_ASSERTION(test,				       \
  1583					      KUNIT_ASSERTION,			       \
  1584					      left,				       \
  1585					      right,				       \
  1586					      fmt,				       \
  1587					      ##__VA_ARGS__)
  1588	/**
  1589	 * KUNIT_ASSERT_LE() - An assertion that @left is less than or equal=
 to @right.
  1590	 * @test: The test context object.
  1591	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1592	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1593	 *
  1594	 * Sets an assertion that the value that @left evaluates to is less =
than or
  1595	 * equal to the value that @right evaluates to. This is the same as
  1596	 * KUNIT_EXPECT_LE(), except it causes an assertion failure (see
  1597	 * KUNIT_ASSERT_TRUE()) when the assertion is not met.
  1598	 */
  1599	#define KUNIT_ASSERT_LE(test, left, right) \
  1600		KUNIT_BINARY_LE_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1601	=

  1602	#define KUNIT_ASSERT_LE_MSG(test, left, right, fmt, ...)		       \
  1603		KUNIT_BINARY_LE_MSG_ASSERTION(test,				       \
  1604					      KUNIT_ASSERTION,			       \
  1605					      left,				       \
  1606					      right,				       \
  1607					      fmt,				       \
  1608					      ##__VA_ARGS__)
  1609	=

  1610	/**
  1611	 * KUNIT_ASSERT_GT() - An assertion that @left is greater than @righ=
t.
  1612	 * @test: The test context object.
  1613	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1614	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1615	 *
  1616	 * Sets an assertion that the value that @left evaluates to is great=
er than the
  1617	 * value that @right evaluates to. This is the same as KUNIT_EXPECT_=
GT(), except
  1618	 * it causes an assertion failure (see KUNIT_ASSERT_TRUE()) when the=
 assertion
  1619	 * is not met.
  1620	 */
  1621	#define KUNIT_ASSERT_GT(test, left, right) \
  1622		KUNIT_BINARY_GT_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1623	=

  1624	#define KUNIT_ASSERT_GT_MSG(test, left, right, fmt, ...)		       \
  1625		KUNIT_BINARY_GT_MSG_ASSERTION(test,				       \
  1626					      KUNIT_ASSERTION,			       \
  1627					      left,				       \
  1628					      right,				       \
  1629					      fmt,				       \
  1630					      ##__VA_ARGS__)
  1631	=

  1632	/**
  1633	 * KUNIT_ASSERT_GE() - Assertion that @left is greater than or equal=
 to @right.
  1634	 * @test: The test context object.
  1635	 * @left: an arbitrary expression that evaluates to a primitive C ty=
pe.
  1636	 * @right: an arbitrary expression that evaluates to a primitive C t=
ype.
  1637	 *
  1638	 * Sets an assertion that the value that @left evaluates to is great=
er than the
  1639	 * value that @right evaluates to. This is the same as KUNIT_EXPECT_=
GE(), except
  1640	 * it causes an assertion failure (see KUNIT_ASSERT_TRUE()) when the=
 assertion
  1641	 * is not met.
  1642	 */
  1643	#define KUNIT_ASSERT_GE(test, left, right) \
  1644		KUNIT_BINARY_GE_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1645	=

  1646	#define KUNIT_ASSERT_GE_MSG(test, left, right, fmt, ...)		       \
  1647		KUNIT_BINARY_GE_MSG_ASSERTION(test,				       \
  1648					      KUNIT_ASSERTION,			       \
  1649					      left,				       \
  1650					      right,				       \
  1651					      fmt,				       \
  1652					      ##__VA_ARGS__)
  1653	=

  1654	/**
  1655	 * KUNIT_ASSERT_STREQ() - An assertion that strings @left and @right=
 are equal.
  1656	 * @test: The test context object.
  1657	 * @left: an arbitrary expression that evaluates to a null terminate=
d string.
  1658	 * @right: an arbitrary expression that evaluates to a null terminat=
ed string.
  1659	 *
  1660	 * Sets an assertion that the values that @left and @right evaluate =
to are
  1661	 * equal. This is the same as KUNIT_EXPECT_STREQ(), except it causes=
 an
  1662	 * assertion failure (see KUNIT_ASSERT_TRUE()) when the assertion is=
 not met.
  1663	 */
  1664	#define KUNIT_ASSERT_STREQ(test, left, right) \
  1665		KUNIT_BINARY_STR_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1666	=

  1667	#define KUNIT_ASSERT_STREQ_MSG(test, left, right, fmt, ...)		       \
  1668		KUNIT_BINARY_STR_EQ_MSG_ASSERTION(test,				       \
  1669						  KUNIT_ASSERTION,		       \
  1670						  left,				       \
  1671						  right,			       \
  1672						  fmt,				       \
  1673						  ##__VA_ARGS__)
  1674	=

  1675	/**
  1676	 * KUNIT_ASSERT_STRNEQ() - Expects that strings @left and @right are=
 not equal.
  1677	 * @test: The test context object.
  1678	 * @left: an arbitrary expression that evaluates to a null terminate=
d string.
  1679	 * @right: an arbitrary expression that evaluates to a null terminat=
ed string.
  1680	 *
  1681	 * Sets an expectation that the values that @left and @right evaluat=
e to are
  1682	 * not equal. This is semantically equivalent to
  1683	 * KUNIT_ASSERT_TRUE(@test, strcmp((@left), (@right))). See KUNIT_AS=
SERT_TRUE()
  1684	 * for more information.
  1685	 */
  1686	#define KUNIT_ASSERT_STRNEQ(test, left, right) \
  1687		KUNIT_BINARY_STR_NE_ASSERTION(test, KUNIT_ASSERTION, left, right)
  1688	=

  1689	#define KUNIT_ASSERT_STRNEQ_MSG(test, left, right, fmt, ...)		      =
 \
  1690		KUNIT_BINARY_STR_NE_MSG_ASSERTION(test,				       \
  1691						  KUNIT_ASSERTION,		       \
  1692						  left,				       \
  1693						  right,			       \
  1694						  fmt,				       \
  1695						  ##__VA_ARGS__)
  1696	=

  1697	/**
  1698	 * KUNIT_ASSERT_NOT_ERR_OR_NULL() - Assertion that @ptr is not null =
and not err.
  1699	 * @test: The test context object.
  1700	 * @ptr: an arbitrary pointer.
  1701	 *
  1702	 * Sets an assertion that the value that @ptr evaluates to is not nu=
ll and not
  1703	 * an errno stored in a pointer. This is the same as
  1704	 * KUNIT_EXPECT_NOT_ERR_OR_NULL(), except it causes an assertion fai=
lure (see
  1705	 * KUNIT_ASSERT_TRUE()) when the assertion is not met.
  1706	 */
  1707	#define KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr) \
  1708		KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
  1709	=

  1710	#define KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr, fmt, ...)		     =
  \
  1711		KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,			       \
  1712							KUNIT_ASSERTION,	       \
  1713							ptr,			       \
  1714							fmt,			       \
  1715							##__VA_ARGS__)
  1716	=

  1717	/**
  1718	 * kunit_param_generator_helper() - Helper method for test parameter=
 generators
  1719	 * 				    required in parameterized tests.
  1720	 * @test: The test context object.
  1721	 * @prev_param: a pointer to the previous test parameter, NULL for f=
irst parameter.
  1722	 * @param_array: a user-supplied pointer to an array of test paramet=
ers.
  1723	 * @array_size: number of test parameters in the array.
  1724	 * @type_size: size of one test parameter.
  1725	 */
  1726	static inline void *kunit_param_generator_helper(struct kunit *test,
  1727						void *prev_param,
  1728						void *param_array,
  1729						size_t array_size,
  1730						size_t type_size)
  1731	{
> 1732		KUNIT_ASSERT_EQ(test, (prev_param - param_array) % type_size, 0);
  1733	=

  1734		if (!prev_param)
  1735			return param_array;
  1736	=

> 1737		KUNIT_ASSERT_GE(test, prev_param, param_array);
  1738	=

  1739		if (prev_param + type_size < param_array + (array_size * type_size))
  1740			return prev_param + type_size;
  1741		else
  1742			return NULL;
  1743	}
  1744	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============5161699833938365785==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5161699833938365785==--

