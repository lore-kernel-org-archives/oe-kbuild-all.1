Content-Type: multipart/mixed; boundary="===============5344576934871139984=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/2] kunit: Support for Parameterized Testing
Date: Sat, 24 Oct 2020 02:08:40 +0800
Message-ID: <202010240247.JNQ8VRdQ-lkp@intel.com>
In-Reply-To: <20201023150536.282568-1-98.arpi@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5344576934871139984==
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
config: x86_64-randconfig-r015-20201023 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 147b94=
97e79a98a8614b2b5eb4ba653b44f6b6f0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/0day-ci/linux/commit/2c09a7974ce3b438845bfafb5=
39513dc91c021b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arpitha-Raghunandan/kunit-Support-=
for-Parameterized-Testing/20201023-230827
        git checkout 2c09a7974ce3b438845bfafb539513dc91c021b4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


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

--===============5344576934871139984==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5344576934871139984==--

