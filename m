Content-Type: multipart/mixed; boundary="===============6723459969563297515=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] fs: ext4: Modify inode-test.c to use KUnit parameterized testing feature
Date: Sat, 24 Oct 2020 01:33:00 +0800
Message-ID: <202010240131.hnUjOylq-lkp@intel.com>
In-Reply-To: <20201023150634.282631-1-98.arpi@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6723459969563297515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arpitha,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ext4/dev]
[also build test WARNING on linus/master v5.9 next-20201023]
[cannot apply to tytso-fscrypt/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arpitha-Raghunandan/kunit-=
Support-for-Parameterized-Testing/20201023-230827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: x86_64-randconfig-s021-20201023 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-17-g2d3af347-dirty
        # https://github.com/0day-ci/linux/commit/67c9830f2988a5b2153f7bb05=
396611947ee6677
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arpitha-Raghunandan/kunit-Support-=
for-Parameterized-Testing/20201023-230827
        git checkout 67c9830f2988a5b2153f7bb05396611947ee6677
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   fs/ext4/inode-test.c: note: in included file:
>> include/kunit/test.h:1732:9: sparse: sparse: incompatible types in compa=
rison expression (different type sizes):
>> include/kunit/test.h:1732:9: sparse:    unsigned long *
>> include/kunit/test.h:1732:9: sparse:    int *

vim +1732 include/kunit/test.h

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1147  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1148  #define KUNIT_PTR_NOT=
_ERR_OR_NULL_ASSERTION(test, assert_type, ptr)	       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1149  	KUNIT_PTR_NOT_ERR_OR=
_NULL_MSG_ASSERTION(test,			       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1150  						assert_type,		 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1151  						ptr,			       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1152  						NULL)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1153  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1154  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1155   * KUNIT_EXPECT_TRUE(=
) - Causes a test failure when the expression is not true.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1156   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1157   * @condition: an arb=
itrary boolean expression. The test fails when this does
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1158   * not evaluate to tr=
ue.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1159   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1160   * This and expectati=
ons of the form `KUNIT_EXPECT_*` will cause the test case
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1161   * to fail when the s=
pecified condition is not met; however, it will not prevent
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1162   * the test case from=
 continuing to run; this is otherwise known as an
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1163   * *expectation failu=
re*.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1164   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1165  #define KUNIT_EXPECT_=
TRUE(test, condition) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1166  	KUNIT_TRUE_ASSERTION=
(test, KUNIT_EXPECTATION, condition)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1167  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1168  #define KUNIT_EXPECT_=
TRUE_MSG(test, condition, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1169  	KUNIT_TRUE_MSG_ASSER=
TION(test,					       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1170  				 KUNIT_EXPECTATIO=
N,			       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1171  				 condition,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1172  				 fmt,					       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1173  				 ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1174  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1175  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1176   * KUNIT_EXPECT_FALSE=
() - Makes a test failure when the expression is not false.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1177   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1178   * @condition: an arb=
itrary boolean expression. The test fails when this does
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1179   * not evaluate to fa=
lse.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1180   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1181   * Sets an expectatio=
n that @condition evaluates to false. See
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1182   * KUNIT_EXPECT_TRUE(=
) for more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1183   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1184  #define KUNIT_EXPECT_=
FALSE(test, condition) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1185  	KUNIT_FALSE_ASSERTIO=
N(test, KUNIT_EXPECTATION, condition)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1186  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1187  #define KUNIT_EXPECT_=
FALSE_MSG(test, condition, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1188  	KUNIT_FALSE_MSG_ASSE=
RTION(test,					       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1189  				  KUNIT_EXPECTATI=
ON,			       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1190  				  condition,				 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1191  				  fmt,					      =
 \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1192  				  ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1193  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1194  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1195   * KUNIT_EXPECT_EQ() =
- Sets an expectation that @left and @right are equal.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1196   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1197   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1198   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1199   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1200   * Sets an expectatio=
n that the values that @left and @right evaluate to are
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1201   * equal. This is sem=
antically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1202   * KUNIT_EXPECT_TRUE(=
@test, (@left) =3D=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1203   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1204   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1205  #define KUNIT_EXPECT_=
EQ(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1206  	KUNIT_BINARY_EQ_ASSE=
RTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1207  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1208  #define KUNIT_EXPECT_=
EQ_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1209  	KUNIT_BINARY_EQ_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1210  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1211  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1212  				      right,				 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1213  				      fmt,				   =
    \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1214  				      ##__VA_ARGS=
__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1215  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1216  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1217   * KUNIT_EXPECT_PTR_E=
Q() - Expects that pointers @left and @right are equal.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1218   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1219   * @left: an arbitrar=
y expression that evaluates to a pointer.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1220   * @right: an arbitra=
ry expression that evaluates to a pointer.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1221   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1222   * Sets an expectatio=
n that the values that @left and @right evaluate to are
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1223   * equal. This is sem=
antically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1224   * KUNIT_EXPECT_TRUE(=
@test, (@left) =3D=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1225   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1226   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1227  #define KUNIT_EXPECT_=
PTR_EQ(test, left, right)				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1228  	KUNIT_BINARY_PTR_EQ_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1229  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1230  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1231  				      right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1232  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1233  #define KUNIT_EXPECT_=
PTR_EQ_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1234  	KUNIT_BINARY_PTR_EQ_=
MSG_ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1235  					  KUNIT_EXPECTAT=
ION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1236  					  left,				     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1237  					  right,			     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1238  					  fmt,				      =
 \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1239  					  ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1240  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1241  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1242   * KUNIT_EXPECT_NE() =
- An expectation that @left and @right are not equal.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1243   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1244   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1245   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1246   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1247   * Sets an expectatio=
n that the values that @left and @right evaluate to are not
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1248   * equal. This is sem=
antically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1249   * KUNIT_EXPECT_TRUE(=
@test, (@left) !=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1250   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1251   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1252  #define KUNIT_EXPECT_=
NE(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1253  	KUNIT_BINARY_NE_ASSE=
RTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1254  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1255  #define KUNIT_EXPECT_=
NE_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1256  	KUNIT_BINARY_NE_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1257  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1258  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1259  				      right,				 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1260  				      fmt,				   =
    \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1261  				      ##__VA_ARGS=
__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1262  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1263  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1264   * KUNIT_EXPECT_PTR_N=
E() - Expects that pointers @left and @right are not equal.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1265   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1266   * @left: an arbitrar=
y expression that evaluates to a pointer.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1267   * @right: an arbitra=
ry expression that evaluates to a pointer.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1268   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1269   * Sets an expectatio=
n that the values that @left and @right evaluate to are not
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1270   * equal. This is sem=
antically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1271   * KUNIT_EXPECT_TRUE(=
@test, (@left) !=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1272   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1273   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1274  #define KUNIT_EXPECT_=
PTR_NE(test, left, right)				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1275  	KUNIT_BINARY_PTR_NE_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1276  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1277  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1278  				      right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1279  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1280  #define KUNIT_EXPECT_=
PTR_NE_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1281  	KUNIT_BINARY_PTR_NE_=
MSG_ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1282  					  KUNIT_EXPECTAT=
ION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1283  					  left,				     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1284  					  right,			     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1285  					  fmt,				      =
 \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1286  					  ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1287  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1288  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1289   * KUNIT_EXPECT_LT() =
- An expectation that @left is less than @right.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1290   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1291   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1292   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1293   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1294   * Sets an expectatio=
n that the value that @left evaluates to is less than the
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1295   * value that @right =
evaluates to. This is semantically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1296   * KUNIT_EXPECT_TRUE(=
@test, (@left) < (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1297   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1298   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1299  #define KUNIT_EXPECT_=
LT(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1300  	KUNIT_BINARY_LT_ASSE=
RTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1301  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1302  #define KUNIT_EXPECT_=
LT_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1303  	KUNIT_BINARY_LT_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1304  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1305  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1306  				      right,				 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1307  				      fmt,				   =
    \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1308  				      ##__VA_ARGS=
__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1309  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1310  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1311   * KUNIT_EXPECT_LE() =
- Expects that @left is less than or equal to @right.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1312   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1313   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1314   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1315   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1316   * Sets an expectatio=
n that the value that @left evaluates to is less than or
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1317   * equal to the value=
 that @right evaluates to. Semantically this is equivalent
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1318   * to KUNIT_EXPECT_TR=
UE(@test, (@left) <=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1319   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1320   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1321  #define KUNIT_EXPECT_=
LE(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1322  	KUNIT_BINARY_LE_ASSE=
RTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1323  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1324  #define KUNIT_EXPECT_=
LE_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1325  	KUNIT_BINARY_LE_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1326  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1327  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1328  				      right,				 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1329  				      fmt,				   =
    \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1330  				      ##__VA_ARGS=
__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1331  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1332  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1333   * KUNIT_EXPECT_GT() =
- An expectation that @left is greater than @right.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1334   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1335   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1336   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1337   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1338   * Sets an expectatio=
n that the value that @left evaluates to is greater than
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1339   * the value that @ri=
ght evaluates to. This is semantically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1340   * KUNIT_EXPECT_TRUE(=
@test, (@left) > (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1341   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1342   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1343  #define KUNIT_EXPECT_=
GT(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1344  	KUNIT_BINARY_GT_ASSE=
RTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1345  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1346  #define KUNIT_EXPECT_=
GT_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1347  	KUNIT_BINARY_GT_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1348  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1349  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1350  				      right,				 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1351  				      fmt,				   =
    \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1352  				      ##__VA_ARGS=
__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1353  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1354  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1355   * KUNIT_EXPECT_GE() =
- Expects that @left is greater than or equal to @right.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1356   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1357   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1358   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1359   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1360   * Sets an expectatio=
n that the value that @left evaluates to is greater than
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1361   * the value that @ri=
ght evaluates to. This is semantically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1362   * KUNIT_EXPECT_TRUE(=
@test, (@left) >=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1363   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1364   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1365  #define KUNIT_EXPECT_=
GE(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1366  	KUNIT_BINARY_GE_ASSE=
RTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1367  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1368  #define KUNIT_EXPECT_=
GE_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1369  	KUNIT_BINARY_GE_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1370  				      KUNIT_EXPEC=
TATION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1371  				      left,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1372  				      right,				 =
      \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1373  				      fmt,				   =
    \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1374  				      ##__VA_ARGS=
__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1375  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1376  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1377   * KUNIT_EXPECT_STREQ=
() - Expects that strings @left and @right are equal.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1378   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1379   * @left: an arbitrar=
y expression that evaluates to a null terminated string.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1380   * @right: an arbitra=
ry expression that evaluates to a null terminated string.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1381   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1382   * Sets an expectatio=
n that the values that @left and @right evaluate to are
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1383   * equal. This is sem=
antically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1384   * KUNIT_EXPECT_TRUE(=
@test, !strcmp((@left), (@right))). See KUNIT_EXPECT_TRUE()
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1385   * for more informati=
on.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1386   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1387  #define KUNIT_EXPECT_=
STREQ(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1388  	KUNIT_BINARY_STR_EQ_=
ASSERTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1389  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1390  #define KUNIT_EXPECT_=
STREQ_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1391  	KUNIT_BINARY_STR_EQ_=
MSG_ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1392  					  KUNIT_EXPECTAT=
ION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1393  					  left,				     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1394  					  right,			     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1395  					  fmt,				      =
 \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1396  					  ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1397  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1398  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1399   * KUNIT_EXPECT_STRNE=
Q() - Expects that strings @left and @right are not equal.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1400   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1401   * @left: an arbitrar=
y expression that evaluates to a null terminated string.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1402   * @right: an arbitra=
ry expression that evaluates to a null terminated string.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1403   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1404   * Sets an expectatio=
n that the values that @left and @right evaluate to are
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1405   * not equal. This is=
 semantically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1406   * KUNIT_EXPECT_TRUE(=
@test, strcmp((@left), (@right))). See KUNIT_EXPECT_TRUE()
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1407   * for more informati=
on.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1408   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1409  #define KUNIT_EXPECT_=
STRNEQ(test, left, right) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1410  	KUNIT_BINARY_STR_NE_=
ASSERTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1411  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1412  #define KUNIT_EXPECT_=
STRNEQ_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1413  	KUNIT_BINARY_STR_NE_=
MSG_ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1414  					  KUNIT_EXPECTAT=
ION,		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1415  					  left,				     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1416  					  right,			     =
  \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1417  					  fmt,				      =
 \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1418  					  ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1419  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1420  /**
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1421   * KUNIT_EXPECT_NOT_E=
RR_OR_NULL() - Expects that @ptr is not null and not err.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1422   * @test: The test co=
ntext object.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1423   * @ptr: an arbitrary=
 pointer.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1424   *
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1425   * Sets an expectatio=
n that the value that @ptr evaluates to is not null and not
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1426   * an errno stored in=
 a pointer. This is semantically equivalent to
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1427   * KUNIT_EXPECT_TRUE(=
@test, !IS_ERR_OR_NULL(@ptr)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1428   * more information.
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1429   */
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1430  #define KUNIT_EXPECT_=
NOT_ERR_OR_NULL(test, ptr) \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1431  	KUNIT_PTR_NOT_ERR_OR=
_NULL_ASSERTION(test, KUNIT_EXPECTATION, ptr)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1432  =

73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1433  #define KUNIT_EXPECT_=
NOT_ERR_OR_NULL_MSG(test, ptr, fmt, ...)		       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1434  	KUNIT_PTR_NOT_ERR_OR=
_NULL_MSG_ASSERTION(test,			       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1435  						KUNIT_EXPECTATI=
ON,	       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1436  						ptr,			       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1437  						fmt,			       \
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1438  						##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins     2019-09-23  1439  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1440  #define KUNIT_ASSERT_=
FAILURE(test, fmt, ...) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1441  	KUNIT_FAIL_ASSERTION=
(test, KUNIT_ASSERTION, fmt, ##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1442  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1443  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1444   * KUNIT_ASSERT_TRUE(=
) - Sets an assertion that @condition is true.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1445   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1446   * @condition: an arb=
itrary boolean expression. The test fails and aborts when
e4aea8f8532b55f Brendan Higgins     2019-09-23  1447   * this does not eval=
uate to true.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1448   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1449   * This and assertion=
s of the form `KUNIT_ASSERT_*` will cause the test case to
e4aea8f8532b55f Brendan Higgins     2019-09-23  1450   * fail *and immediat=
ely abort* when the specified condition is not met. Unlike
e4aea8f8532b55f Brendan Higgins     2019-09-23  1451   * an expectation fai=
lure, it will prevent the test case from continuing to run;
e4aea8f8532b55f Brendan Higgins     2019-09-23  1452   * this is otherwise =
known as an *assertion failure*.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1453   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1454  #define KUNIT_ASSERT_=
TRUE(test, condition) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1455  	KUNIT_TRUE_ASSERTION=
(test, KUNIT_ASSERTION, condition)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1456  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1457  #define KUNIT_ASSERT_=
TRUE_MSG(test, condition, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1458  	KUNIT_TRUE_MSG_ASSER=
TION(test,					       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1459  				 KUNIT_ASSERTION,=
			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1460  				 condition,				  =
     \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1461  				 fmt,					       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1462  				 ##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1463  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1464  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1465   * KUNIT_ASSERT_FALSE=
() - Sets an assertion that @condition is false.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1466   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1467   * @condition: an arb=
itrary boolean expression.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1468   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1469   * Sets an assertion =
that the value that @condition evaluates to is false. This
e4aea8f8532b55f Brendan Higgins     2019-09-23  1470   * is the same as KUN=
IT_EXPECT_FALSE(), except it causes an assertion failure
e4aea8f8532b55f Brendan Higgins     2019-09-23  1471   * (see KUNIT_ASSERT_=
TRUE()) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1472   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1473  #define KUNIT_ASSERT_=
FALSE(test, condition) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1474  	KUNIT_FALSE_ASSERTIO=
N(test, KUNIT_ASSERTION, condition)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1475  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1476  #define KUNIT_ASSERT_=
FALSE_MSG(test, condition, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1477  	KUNIT_FALSE_MSG_ASSE=
RTION(test,					       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1478  				  KUNIT_ASSERTION=
,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1479  				  condition,				 =
      \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1480  				  fmt,					      =
 \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1481  				  ##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1482  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1483  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1484   * KUNIT_ASSERT_EQ() =
- Sets an assertion that @left and @right are equal.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1485   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1486   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1487   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1488   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1489   * Sets an assertion =
that the values that @left and @right evaluate to are
e4aea8f8532b55f Brendan Higgins     2019-09-23  1490   * equal. This is the=
 same as KUNIT_EXPECT_EQ(), except it causes an assertion
e4aea8f8532b55f Brendan Higgins     2019-09-23  1491   * failure (see KUNIT=
_ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1492   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1493  #define KUNIT_ASSERT_=
EQ(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1494  	KUNIT_BINARY_EQ_ASSE=
RTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1495  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1496  #define KUNIT_ASSERT_=
EQ_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1497  	KUNIT_BINARY_EQ_MSG_=
ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1498  				      KUNIT_ASSER=
TION,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1499  				      left,				  =
     \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1500  				      right,				 =
      \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1501  				      fmt,				   =
    \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1502  				      ##__VA_ARGS=
__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1503  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1504  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1505   * KUNIT_ASSERT_PTR_E=
Q() - Asserts that pointers @left and @right are equal.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1506   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1507   * @left: an arbitrar=
y expression that evaluates to a pointer.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1508   * @right: an arbitra=
ry expression that evaluates to a pointer.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1509   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1510   * Sets an assertion =
that the values that @left and @right evaluate to are
e4aea8f8532b55f Brendan Higgins     2019-09-23  1511   * equal. This is the=
 same as KUNIT_EXPECT_EQ(), except it causes an assertion
e4aea8f8532b55f Brendan Higgins     2019-09-23  1512   * failure (see KUNIT=
_ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1513   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1514  #define KUNIT_ASSERT_=
PTR_EQ(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1515  	KUNIT_BINARY_PTR_EQ_=
ASSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1516  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1517  #define KUNIT_ASSERT_=
PTR_EQ_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1518  	KUNIT_BINARY_PTR_EQ_=
MSG_ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1519  					  KUNIT_ASSERTIO=
N,		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1520  					  left,				     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1521  					  right,			     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1522  					  fmt,				      =
 \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1523  					  ##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1524  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1525  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1526   * KUNIT_ASSERT_NE() =
- An assertion that @left and @right are not equal.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1527   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1528   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1529   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1530   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1531   * Sets an assertion =
that the values that @left and @right evaluate to are not
e4aea8f8532b55f Brendan Higgins     2019-09-23  1532   * equal. This is the=
 same as KUNIT_EXPECT_NE(), except it causes an assertion
e4aea8f8532b55f Brendan Higgins     2019-09-23  1533   * failure (see KUNIT=
_ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1534   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1535  #define KUNIT_ASSERT_=
NE(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1536  	KUNIT_BINARY_NE_ASSE=
RTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1537  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1538  #define KUNIT_ASSERT_=
NE_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1539  	KUNIT_BINARY_NE_MSG_=
ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1540  				      KUNIT_ASSER=
TION,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1541  				      left,				  =
     \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1542  				      right,				 =
      \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1543  				      fmt,				   =
    \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1544  				      ##__VA_ARGS=
__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1545  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1546  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1547   * KUNIT_ASSERT_PTR_N=
E() - Asserts that pointers @left and @right are not equal.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1548   * KUNIT_ASSERT_PTR_E=
Q() - Asserts that pointers @left and @right are equal.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1549   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1550   * @left: an arbitrar=
y expression that evaluates to a pointer.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1551   * @right: an arbitra=
ry expression that evaluates to a pointer.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1552   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1553   * Sets an assertion =
that the values that @left and @right evaluate to are not
e4aea8f8532b55f Brendan Higgins     2019-09-23  1554   * equal. This is the=
 same as KUNIT_EXPECT_NE(), except it causes an assertion
e4aea8f8532b55f Brendan Higgins     2019-09-23  1555   * failure (see KUNIT=
_ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1556   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1557  #define KUNIT_ASSERT_=
PTR_NE(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1558  	KUNIT_BINARY_PTR_NE_=
ASSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1559  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1560  #define KUNIT_ASSERT_=
PTR_NE_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1561  	KUNIT_BINARY_PTR_NE_=
MSG_ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1562  					  KUNIT_ASSERTIO=
N,		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1563  					  left,				     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1564  					  right,			     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1565  					  fmt,				      =
 \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1566  					  ##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1567  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1568   * KUNIT_ASSERT_LT() =
- An assertion that @left is less than @right.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1569   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1570   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1571   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1572   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1573   * Sets an assertion =
that the value that @left evaluates to is less than the
e4aea8f8532b55f Brendan Higgins     2019-09-23  1574   * value that @right =
evaluates to. This is the same as KUNIT_EXPECT_LT(), except
e4aea8f8532b55f Brendan Higgins     2019-09-23  1575   * it causes an asser=
tion failure (see KUNIT_ASSERT_TRUE()) when the assertion
e4aea8f8532b55f Brendan Higgins     2019-09-23  1576   * is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1577   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1578  #define KUNIT_ASSERT_=
LT(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1579  	KUNIT_BINARY_LT_ASSE=
RTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1580  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1581  #define KUNIT_ASSERT_=
LT_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1582  	KUNIT_BINARY_LT_MSG_=
ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1583  				      KUNIT_ASSER=
TION,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1584  				      left,				  =
     \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1585  				      right,				 =
      \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1586  				      fmt,				   =
    \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1587  				      ##__VA_ARGS=
__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1588  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1589   * KUNIT_ASSERT_LE() =
- An assertion that @left is less than or equal to @right.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1590   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1591   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1592   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1593   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1594   * Sets an assertion =
that the value that @left evaluates to is less than or
e4aea8f8532b55f Brendan Higgins     2019-09-23  1595   * equal to the value=
 that @right evaluates to. This is the same as
e4aea8f8532b55f Brendan Higgins     2019-09-23  1596   * KUNIT_EXPECT_LE(),=
 except it causes an assertion failure (see
e4aea8f8532b55f Brendan Higgins     2019-09-23  1597   * KUNIT_ASSERT_TRUE(=
)) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1598   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1599  #define KUNIT_ASSERT_=
LE(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1600  	KUNIT_BINARY_LE_ASSE=
RTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1601  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1602  #define KUNIT_ASSERT_=
LE_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1603  	KUNIT_BINARY_LE_MSG_=
ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1604  				      KUNIT_ASSER=
TION,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1605  				      left,				  =
     \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1606  				      right,				 =
      \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1607  				      fmt,				   =
    \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1608  				      ##__VA_ARGS=
__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1609  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1610  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1611   * KUNIT_ASSERT_GT() =
- An assertion that @left is greater than @right.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1612   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1613   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1614   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1615   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1616   * Sets an assertion =
that the value that @left evaluates to is greater than the
e4aea8f8532b55f Brendan Higgins     2019-09-23  1617   * value that @right =
evaluates to. This is the same as KUNIT_EXPECT_GT(), except
e4aea8f8532b55f Brendan Higgins     2019-09-23  1618   * it causes an asser=
tion failure (see KUNIT_ASSERT_TRUE()) when the assertion
e4aea8f8532b55f Brendan Higgins     2019-09-23  1619   * is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1620   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1621  #define KUNIT_ASSERT_=
GT(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1622  	KUNIT_BINARY_GT_ASSE=
RTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1623  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1624  #define KUNIT_ASSERT_=
GT_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1625  	KUNIT_BINARY_GT_MSG_=
ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1626  				      KUNIT_ASSER=
TION,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1627  				      left,				  =
     \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1628  				      right,				 =
      \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1629  				      fmt,				   =
    \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1630  				      ##__VA_ARGS=
__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1631  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1632  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1633   * KUNIT_ASSERT_GE() =
- Assertion that @left is greater than or equal to @right.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1634   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1635   * @left: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1636   * @right: an arbitra=
ry expression that evaluates to a primitive C type.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1637   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1638   * Sets an assertion =
that the value that @left evaluates to is greater than the
e4aea8f8532b55f Brendan Higgins     2019-09-23  1639   * value that @right =
evaluates to. This is the same as KUNIT_EXPECT_GE(), except
e4aea8f8532b55f Brendan Higgins     2019-09-23  1640   * it causes an asser=
tion failure (see KUNIT_ASSERT_TRUE()) when the assertion
e4aea8f8532b55f Brendan Higgins     2019-09-23  1641   * is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1642   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1643  #define KUNIT_ASSERT_=
GE(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1644  	KUNIT_BINARY_GE_ASSE=
RTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1645  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1646  #define KUNIT_ASSERT_=
GE_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1647  	KUNIT_BINARY_GE_MSG_=
ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1648  				      KUNIT_ASSER=
TION,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1649  				      left,				  =
     \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1650  				      right,				 =
      \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1651  				      fmt,				   =
    \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1652  				      ##__VA_ARGS=
__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1653  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1654  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1655   * KUNIT_ASSERT_STREQ=
() - An assertion that strings @left and @right are equal.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1656   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1657   * @left: an arbitrar=
y expression that evaluates to a null terminated string.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1658   * @right: an arbitra=
ry expression that evaluates to a null terminated string.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1659   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1660   * Sets an assertion =
that the values that @left and @right evaluate to are
e4aea8f8532b55f Brendan Higgins     2019-09-23  1661   * equal. This is the=
 same as KUNIT_EXPECT_STREQ(), except it causes an
e4aea8f8532b55f Brendan Higgins     2019-09-23  1662   * assertion failure =
(see KUNIT_ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1663   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1664  #define KUNIT_ASSERT_=
STREQ(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1665  	KUNIT_BINARY_STR_EQ_=
ASSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1666  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1667  #define KUNIT_ASSERT_=
STREQ_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1668  	KUNIT_BINARY_STR_EQ_=
MSG_ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1669  					  KUNIT_ASSERTIO=
N,		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1670  					  left,				     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1671  					  right,			     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1672  					  fmt,				      =
 \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1673  					  ##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1674  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1675  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1676   * KUNIT_ASSERT_STRNE=
Q() - Expects that strings @left and @right are not equal.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1677   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1678   * @left: an arbitrar=
y expression that evaluates to a null terminated string.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1679   * @right: an arbitra=
ry expression that evaluates to a null terminated string.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1680   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1681   * Sets an expectatio=
n that the values that @left and @right evaluate to are
e4aea8f8532b55f Brendan Higgins     2019-09-23  1682   * not equal. This is=
 semantically equivalent to
e4aea8f8532b55f Brendan Higgins     2019-09-23  1683   * KUNIT_ASSERT_TRUE(=
@test, strcmp((@left), (@right))). See KUNIT_ASSERT_TRUE()
e4aea8f8532b55f Brendan Higgins     2019-09-23  1684   * for more informati=
on.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1685   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1686  #define KUNIT_ASSERT_=
STRNEQ(test, left, right) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1687  	KUNIT_BINARY_STR_NE_=
ASSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1688  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1689  #define KUNIT_ASSERT_=
STRNEQ_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1690  	KUNIT_BINARY_STR_NE_=
MSG_ASSERTION(test,				       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1691  					  KUNIT_ASSERTIO=
N,		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1692  					  left,				     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1693  					  right,			     =
  \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1694  					  fmt,				      =
 \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1695  					  ##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1696  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1697  /**
e4aea8f8532b55f Brendan Higgins     2019-09-23  1698   * KUNIT_ASSERT_NOT_E=
RR_OR_NULL() - Assertion that @ptr is not null and not err.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1699   * @test: The test co=
ntext object.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1700   * @ptr: an arbitrary=
 pointer.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1701   *
e4aea8f8532b55f Brendan Higgins     2019-09-23  1702   * Sets an assertion =
that the value that @ptr evaluates to is not null and not
e4aea8f8532b55f Brendan Higgins     2019-09-23  1703   * an errno stored in=
 a pointer. This is the same as
e4aea8f8532b55f Brendan Higgins     2019-09-23  1704   * KUNIT_EXPECT_NOT_E=
RR_OR_NULL(), except it causes an assertion failure (see
e4aea8f8532b55f Brendan Higgins     2019-09-23  1705   * KUNIT_ASSERT_TRUE(=
)) when the assertion is not met.
e4aea8f8532b55f Brendan Higgins     2019-09-23  1706   */
e4aea8f8532b55f Brendan Higgins     2019-09-23  1707  #define KUNIT_ASSERT_=
NOT_ERR_OR_NULL(test, ptr) \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1708  	KUNIT_PTR_NOT_ERR_OR=
_NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1709  =

e4aea8f8532b55f Brendan Higgins     2019-09-23  1710  #define KUNIT_ASSERT_=
NOT_ERR_OR_NULL_MSG(test, ptr, fmt, ...)		       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1711  	KUNIT_PTR_NOT_ERR_OR=
_NULL_MSG_ASSERTION(test,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1712  						KUNIT_ASSERTION=
,	       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1713  						ptr,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1714  						fmt,			       \
e4aea8f8532b55f Brendan Higgins     2019-09-23  1715  						##__VA_ARGS__)
e4aea8f8532b55f Brendan Higgins     2019-09-23  1716  =

2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1717  /**
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1718   * kunit_param_genera=
tor_helper() - Helper method for test parameter generators
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1719   * 				    required i=
n parameterized tests.
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1720   * @test: The test co=
ntext object.
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1721   * @prev_param: a poi=
nter to the previous test parameter, NULL for first parameter.
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1722   * @param_array: a us=
er-supplied pointer to an array of test parameters.
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1723   * @array_size: numbe=
r of test parameters in the array.
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1724   * @type_size: size o=
f one test parameter.
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1725   */
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1726  static inline void *k=
unit_param_generator_helper(struct kunit *test,
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1727  					void *prev_param,
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1728  					void *param_arra=
y,
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1729  					size_t array_siz=
e,
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1730  					size_t type_size)
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1731  {
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23 @1732  	KUNIT_ASSERT_EQ(test=
, (prev_param - param_array) % type_size, 0);
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1733  =

2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1734  	if (!prev_param)
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1735  		return param_array;
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1736  =

2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1737  	KUNIT_ASSERT_GE(test=
, prev_param, param_array);
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1738  =

2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1739  	if (prev_param + typ=
e_size < param_array + (array_size * type_size))
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1740  		return prev_param +=
 type_size;
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1741  	else
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1742  		return NULL;
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1743  }
2c09a7974ce3b43 Arpitha Raghunandan 2020-10-23  1744  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============6723459969563297515==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6723459969563297515==--

