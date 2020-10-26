Content-Type: multipart/mixed; boundary="===============3101424932212646940=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/2] fs: ext4: Modify inode-test.c to use KUnit parameterized testing feature
Date: Tue, 27 Oct 2020 04:19:22 +0800
Message-ID: <202010270419.t5tYXkR9-lkp@intel.com>
In-Reply-To: <20201026183639.82883-1-98.arpi@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3101424932212646940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arpitha,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ext4/dev]
[also build test WARNING on linus/master v5.10-rc1 next-20201026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arpitha-Raghunandan/kunit-=
Support-for-Parameterized-Testing/20201027-023812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: m68k-allmodconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1c6cd3899d5ed7da9b746ba88=
7779ca2c89c5bab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arpitha-Raghunandan/kunit-Support-=
for-Parameterized-Testing/20201027-023812
        git checkout 1c6cd3899d5ed7da9b746ba887779ca2c89c5bab
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from fs/ext4/inode-test.c:7:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of p=
ointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr) ((void *)(kaddr) >=3D (void *)PAG=
E_OFFSET && (void *)(kaddr) < high_memory)
         |                                                 ^~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/scatterlist.h:143:2: note: in expansion of macro 'BUG_ON'
     143 |  BUG_ON(!virt_addr_valid(buf));
         |  ^~~~~~
   include/linux/scatterlist.h:143:10: note: in expansion of macro 'virt_ad=
dr_valid'
     143 |  BUG_ON(!virt_addr_valid(buf));
         |          ^~~~~~~~~~~~~~~
   In file included from fs/ext4/inode-test.c:7:
   fs/ext4/inode-test.c: In function 'ext4_inode_gen_params':
>> include/kunit/test.h:1733:58: warning: return discards 'const' qualifier=
 from pointer target type [-Wdiscarded-qualifiers]
    1733 |   return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;=
   \
   fs/ext4/inode-test.c:214:1: note: in expansion of macro 'KUNIT_PARAM_GEN=
ERATOR'
     214 | KUNIT_PARAM_GENERATOR(ext4_inode, test_data);
         | ^~~~~~~~~~~~~~~~~~~~~

vim +/const +1733 include/kunit/test.h

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1152  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1153  #define KUNIT_PTR_NOT_=
ERR_OR_NULL_ASSERTION(test, assert_type, ptr)	       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1154  	KUNIT_PTR_NOT_ERR_OR_=
NULL_MSG_ASSERTION(test,			       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1155  						assert_type,		  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1156  						ptr,			       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1157  						NULL)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1158  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1159  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1160   * KUNIT_EXPECT_TRUE()=
 - Causes a test failure when the expression is not true.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1161   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1162   * @condition: an arbi=
trary boolean expression. The test fails when this does
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1163   * not evaluate to tru=
e.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1164   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1165   * This and expectatio=
ns of the form `KUNIT_EXPECT_*` will cause the test case
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1166   * to fail when the sp=
ecified condition is not met; however, it will not prevent
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1167   * the test case from =
continuing to run; this is otherwise known as an
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1168   * *expectation failur=
e*.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1169   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1170  #define KUNIT_EXPECT_T=
RUE(test, condition) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1171  	KUNIT_TRUE_ASSERTION(=
test, KUNIT_EXPECTATION, condition)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1172  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1173  #define KUNIT_EXPECT_T=
RUE_MSG(test, condition, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1174  	KUNIT_TRUE_MSG_ASSERT=
ION(test,					       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1175  				 KUNIT_EXPECTATION=
,			       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1176  				 condition,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1177  				 fmt,					       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1178  				 ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1179  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1180  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1181   * KUNIT_EXPECT_FALSE(=
) - Makes a test failure when the expression is not false.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1182   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1183   * @condition: an arbi=
trary boolean expression. The test fails when this does
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1184   * not evaluate to fal=
se.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1185   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1186   * Sets an expectation=
 that @condition evaluates to false. See
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1187   * KUNIT_EXPECT_TRUE()=
 for more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1188   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1189  #define KUNIT_EXPECT_F=
ALSE(test, condition) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1190  	KUNIT_FALSE_ASSERTION=
(test, KUNIT_EXPECTATION, condition)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1191  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1192  #define KUNIT_EXPECT_F=
ALSE_MSG(test, condition, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1193  	KUNIT_FALSE_MSG_ASSER=
TION(test,					       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1194  				  KUNIT_EXPECTATIO=
N,			       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1195  				  condition,				  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1196  				  fmt,					       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1197  				  ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1198  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1199  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1200   * KUNIT_EXPECT_EQ() -=
 Sets an expectation that @left and @right are equal.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1201   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1202   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1203   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1204   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1205   * Sets an expectation=
 that the values that @left and @right evaluate to are
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1206   * equal. This is sema=
ntically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1207   * KUNIT_EXPECT_TRUE(@=
test, (@left) =3D=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1208   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1209   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1210  #define KUNIT_EXPECT_E=
Q(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1211  	KUNIT_BINARY_EQ_ASSER=
TION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1212  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1213  #define KUNIT_EXPECT_E=
Q_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1214  	KUNIT_BINARY_EQ_MSG_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1215  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1216  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1217  				      right,				  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1218  				      fmt,				    =
   \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1219  				      ##__VA_ARGS_=
_)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1220  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1221  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1222   * KUNIT_EXPECT_PTR_EQ=
() - Expects that pointers @left and @right are equal.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1223   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1224   * @left: an arbitrary=
 expression that evaluates to a pointer.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1225   * @right: an arbitrar=
y expression that evaluates to a pointer.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1226   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1227   * Sets an expectation=
 that the values that @left and @right evaluate to are
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1228   * equal. This is sema=
ntically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1229   * KUNIT_EXPECT_TRUE(@=
test, (@left) =3D=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1230   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1231   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1232  #define KUNIT_EXPECT_P=
TR_EQ(test, left, right)				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1233  	KUNIT_BINARY_PTR_EQ_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1234  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1235  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1236  				      right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1237  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1238  #define KUNIT_EXPECT_P=
TR_EQ_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1239  	KUNIT_BINARY_PTR_EQ_M=
SG_ASSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1240  					  KUNIT_EXPECTATI=
ON,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1241  					  left,				      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1242  					  right,			      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1243  					  fmt,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1244  					  ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1245  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1246  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1247   * KUNIT_EXPECT_NE() -=
 An expectation that @left and @right are not equal.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1248   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1249   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1250   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1251   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1252   * Sets an expectation=
 that the values that @left and @right evaluate to are not
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1253   * equal. This is sema=
ntically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1254   * KUNIT_EXPECT_TRUE(@=
test, (@left) !=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1255   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1256   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1257  #define KUNIT_EXPECT_N=
E(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1258  	KUNIT_BINARY_NE_ASSER=
TION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1259  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1260  #define KUNIT_EXPECT_N=
E_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1261  	KUNIT_BINARY_NE_MSG_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1262  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1263  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1264  				      right,				  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1265  				      fmt,				    =
   \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1266  				      ##__VA_ARGS_=
_)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1267  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1268  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1269   * KUNIT_EXPECT_PTR_NE=
() - Expects that pointers @left and @right are not equal.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1270   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1271   * @left: an arbitrary=
 expression that evaluates to a pointer.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1272   * @right: an arbitrar=
y expression that evaluates to a pointer.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1273   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1274   * Sets an expectation=
 that the values that @left and @right evaluate to are not
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1275   * equal. This is sema=
ntically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1276   * KUNIT_EXPECT_TRUE(@=
test, (@left) !=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1277   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1278   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1279  #define KUNIT_EXPECT_P=
TR_NE(test, left, right)				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1280  	KUNIT_BINARY_PTR_NE_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1281  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1282  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1283  				      right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1284  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1285  #define KUNIT_EXPECT_P=
TR_NE_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1286  	KUNIT_BINARY_PTR_NE_M=
SG_ASSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1287  					  KUNIT_EXPECTATI=
ON,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1288  					  left,				      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1289  					  right,			      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1290  					  fmt,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1291  					  ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1292  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1293  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1294   * KUNIT_EXPECT_LT() -=
 An expectation that @left is less than @right.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1295   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1296   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1297   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1298   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1299   * Sets an expectation=
 that the value that @left evaluates to is less than the
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1300   * value that @right e=
valuates to. This is semantically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1301   * KUNIT_EXPECT_TRUE(@=
test, (@left) < (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1302   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1303   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1304  #define KUNIT_EXPECT_L=
T(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1305  	KUNIT_BINARY_LT_ASSER=
TION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1306  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1307  #define KUNIT_EXPECT_L=
T_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1308  	KUNIT_BINARY_LT_MSG_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1309  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1310  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1311  				      right,				  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1312  				      fmt,				    =
   \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1313  				      ##__VA_ARGS_=
_)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1314  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1315  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1316   * KUNIT_EXPECT_LE() -=
 Expects that @left is less than or equal to @right.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1317   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1318   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1319   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1320   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1321   * Sets an expectation=
 that the value that @left evaluates to is less than or
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1322   * equal to the value =
that @right evaluates to. Semantically this is equivalent
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1323   * to KUNIT_EXPECT_TRU=
E(@test, (@left) <=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1324   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1325   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1326  #define KUNIT_EXPECT_L=
E(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1327  	KUNIT_BINARY_LE_ASSER=
TION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1328  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1329  #define KUNIT_EXPECT_L=
E_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1330  	KUNIT_BINARY_LE_MSG_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1331  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1332  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1333  				      right,				  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1334  				      fmt,				    =
   \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1335  				      ##__VA_ARGS_=
_)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1336  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1337  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1338   * KUNIT_EXPECT_GT() -=
 An expectation that @left is greater than @right.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1339   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1340   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1341   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1342   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1343   * Sets an expectation=
 that the value that @left evaluates to is greater than
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1344   * the value that @rig=
ht evaluates to. This is semantically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1345   * KUNIT_EXPECT_TRUE(@=
test, (@left) > (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1346   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1347   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1348  #define KUNIT_EXPECT_G=
T(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1349  	KUNIT_BINARY_GT_ASSER=
TION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1350  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1351  #define KUNIT_EXPECT_G=
T_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1352  	KUNIT_BINARY_GT_MSG_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1353  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1354  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1355  				      right,				  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1356  				      fmt,				    =
   \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1357  				      ##__VA_ARGS_=
_)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1358  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1359  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1360   * KUNIT_EXPECT_GE() -=
 Expects that @left is greater than or equal to @right.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1361   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1362   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1363   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1364   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1365   * Sets an expectation=
 that the value that @left evaluates to is greater than
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1366   * the value that @rig=
ht evaluates to. This is semantically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1367   * KUNIT_EXPECT_TRUE(@=
test, (@left) >=3D (@right)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1368   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1369   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1370  #define KUNIT_EXPECT_G=
E(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1371  	KUNIT_BINARY_GE_ASSER=
TION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1372  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1373  #define KUNIT_EXPECT_G=
E_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1374  	KUNIT_BINARY_GE_MSG_A=
SSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1375  				      KUNIT_EXPECT=
ATION,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1376  				      left,				   =
    \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1377  				      right,				  =
     \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1378  				      fmt,				    =
   \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1379  				      ##__VA_ARGS_=
_)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1380  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1381  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1382   * KUNIT_EXPECT_STREQ(=
) - Expects that strings @left and @right are equal.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1383   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1384   * @left: an arbitrary=
 expression that evaluates to a null terminated string.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1385   * @right: an arbitrar=
y expression that evaluates to a null terminated string.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1386   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1387   * Sets an expectation=
 that the values that @left and @right evaluate to are
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1388   * equal. This is sema=
ntically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1389   * KUNIT_EXPECT_TRUE(@=
test, !strcmp((@left), (@right))). See KUNIT_EXPECT_TRUE()
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1390   * for more informatio=
n.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1391   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1392  #define KUNIT_EXPECT_S=
TREQ(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1393  	KUNIT_BINARY_STR_EQ_A=
SSERTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1394  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1395  #define KUNIT_EXPECT_S=
TREQ_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1396  	KUNIT_BINARY_STR_EQ_M=
SG_ASSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1397  					  KUNIT_EXPECTATI=
ON,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1398  					  left,				      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1399  					  right,			      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1400  					  fmt,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1401  					  ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1402  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1403  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1404   * KUNIT_EXPECT_STRNEQ=
() - Expects that strings @left and @right are not equal.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1405   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1406   * @left: an arbitrary=
 expression that evaluates to a null terminated string.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1407   * @right: an arbitrar=
y expression that evaluates to a null terminated string.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1408   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1409   * Sets an expectation=
 that the values that @left and @right evaluate to are
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1410   * not equal. This is =
semantically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1411   * KUNIT_EXPECT_TRUE(@=
test, strcmp((@left), (@right))). See KUNIT_EXPECT_TRUE()
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1412   * for more informatio=
n.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1413   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1414  #define KUNIT_EXPECT_S=
TRNEQ(test, left, right) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1415  	KUNIT_BINARY_STR_NE_A=
SSERTION(test, KUNIT_EXPECTATION, left, right)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1416  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1417  #define KUNIT_EXPECT_S=
TRNEQ_MSG(test, left, right, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1418  	KUNIT_BINARY_STR_NE_M=
SG_ASSERTION(test,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1419  					  KUNIT_EXPECTATI=
ON,		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1420  					  left,				      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1421  					  right,			      =
 \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1422  					  fmt,				       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1423  					  ##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1424  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1425  /**
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1426   * KUNIT_EXPECT_NOT_ER=
R_OR_NULL() - Expects that @ptr is not null and not err.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1427   * @test: The test con=
text object.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1428   * @ptr: an arbitrary =
pointer.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1429   *
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1430   * Sets an expectation=
 that the value that @ptr evaluates to is not null and not
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1431   * an errno stored in =
a pointer. This is semantically equivalent to
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1432   * KUNIT_EXPECT_TRUE(@=
test, !IS_ERR_OR_NULL(@ptr)). See KUNIT_EXPECT_TRUE() for
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1433   * more information.
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1434   */
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1435  #define KUNIT_EXPECT_N=
OT_ERR_OR_NULL(test, ptr) \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1436  	KUNIT_PTR_NOT_ERR_OR_=
NULL_ASSERTION(test, KUNIT_EXPECTATION, ptr)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1437  =

73cda7bb8bfb1d Brendan Higgins     2019-09-23  1438  #define KUNIT_EXPECT_N=
OT_ERR_OR_NULL_MSG(test, ptr, fmt, ...)		       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1439  	KUNIT_PTR_NOT_ERR_OR_=
NULL_MSG_ASSERTION(test,			       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1440  						KUNIT_EXPECTATIO=
N,	       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1441  						ptr,			       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1442  						fmt,			       \
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1443  						##__VA_ARGS__)
73cda7bb8bfb1d Brendan Higgins     2019-09-23  1444  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1445  #define KUNIT_ASSERT_F=
AILURE(test, fmt, ...) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1446  	KUNIT_FAIL_ASSERTION(=
test, KUNIT_ASSERTION, fmt, ##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1447  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1448  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1449   * KUNIT_ASSERT_TRUE()=
 - Sets an assertion that @condition is true.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1450   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1451   * @condition: an arbi=
trary boolean expression. The test fails and aborts when
e4aea8f8532b55 Brendan Higgins     2019-09-23  1452   * this does not evalu=
ate to true.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1453   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1454   * This and assertions=
 of the form `KUNIT_ASSERT_*` will cause the test case to
e4aea8f8532b55 Brendan Higgins     2019-09-23  1455   * fail *and immediate=
ly abort* when the specified condition is not met. Unlike
e4aea8f8532b55 Brendan Higgins     2019-09-23  1456   * an expectation fail=
ure, it will prevent the test case from continuing to run;
e4aea8f8532b55 Brendan Higgins     2019-09-23  1457   * this is otherwise k=
nown as an *assertion failure*.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1458   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1459  #define KUNIT_ASSERT_T=
RUE(test, condition) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1460  	KUNIT_TRUE_ASSERTION(=
test, KUNIT_ASSERTION, condition)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1461  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1462  #define KUNIT_ASSERT_T=
RUE_MSG(test, condition, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1463  	KUNIT_TRUE_MSG_ASSERT=
ION(test,					       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1464  				 KUNIT_ASSERTION,	=
		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1465  				 condition,				   =
    \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1466  				 fmt,					       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1467  				 ##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1468  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1469  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1470   * KUNIT_ASSERT_FALSE(=
) - Sets an assertion that @condition is false.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1471   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1472   * @condition: an arbi=
trary boolean expression.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1473   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1474   * Sets an assertion t=
hat the value that @condition evaluates to is false. This
e4aea8f8532b55 Brendan Higgins     2019-09-23  1475   * is the same as KUNI=
T_EXPECT_FALSE(), except it causes an assertion failure
e4aea8f8532b55 Brendan Higgins     2019-09-23  1476   * (see KUNIT_ASSERT_T=
RUE()) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1477   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1478  #define KUNIT_ASSERT_F=
ALSE(test, condition) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1479  	KUNIT_FALSE_ASSERTION=
(test, KUNIT_ASSERTION, condition)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1480  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1481  #define KUNIT_ASSERT_F=
ALSE_MSG(test, condition, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1482  	KUNIT_FALSE_MSG_ASSER=
TION(test,					       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1483  				  KUNIT_ASSERTION,=
			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1484  				  condition,				  =
     \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1485  				  fmt,					       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1486  				  ##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1487  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1488  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1489   * KUNIT_ASSERT_EQ() -=
 Sets an assertion that @left and @right are equal.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1490   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1491   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1492   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1493   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1494   * Sets an assertion t=
hat the values that @left and @right evaluate to are
e4aea8f8532b55 Brendan Higgins     2019-09-23  1495   * equal. This is the =
same as KUNIT_EXPECT_EQ(), except it causes an assertion
e4aea8f8532b55 Brendan Higgins     2019-09-23  1496   * failure (see KUNIT_=
ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1497   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1498  #define KUNIT_ASSERT_E=
Q(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1499  	KUNIT_BINARY_EQ_ASSER=
TION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1500  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1501  #define KUNIT_ASSERT_E=
Q_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1502  	KUNIT_BINARY_EQ_MSG_A=
SSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1503  				      KUNIT_ASSERT=
ION,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1504  				      left,				   =
    \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1505  				      right,				  =
     \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1506  				      fmt,				    =
   \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1507  				      ##__VA_ARGS_=
_)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1508  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1509  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1510   * KUNIT_ASSERT_PTR_EQ=
() - Asserts that pointers @left and @right are equal.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1511   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1512   * @left: an arbitrary=
 expression that evaluates to a pointer.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1513   * @right: an arbitrar=
y expression that evaluates to a pointer.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1514   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1515   * Sets an assertion t=
hat the values that @left and @right evaluate to are
e4aea8f8532b55 Brendan Higgins     2019-09-23  1516   * equal. This is the =
same as KUNIT_EXPECT_EQ(), except it causes an assertion
e4aea8f8532b55 Brendan Higgins     2019-09-23  1517   * failure (see KUNIT_=
ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1518   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1519  #define KUNIT_ASSERT_P=
TR_EQ(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1520  	KUNIT_BINARY_PTR_EQ_A=
SSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1521  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1522  #define KUNIT_ASSERT_P=
TR_EQ_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1523  	KUNIT_BINARY_PTR_EQ_M=
SG_ASSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1524  					  KUNIT_ASSERTION=
,		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1525  					  left,				      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1526  					  right,			      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1527  					  fmt,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1528  					  ##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1529  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1530  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1531   * KUNIT_ASSERT_NE() -=
 An assertion that @left and @right are not equal.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1532   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1533   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1534   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1535   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1536   * Sets an assertion t=
hat the values that @left and @right evaluate to are not
e4aea8f8532b55 Brendan Higgins     2019-09-23  1537   * equal. This is the =
same as KUNIT_EXPECT_NE(), except it causes an assertion
e4aea8f8532b55 Brendan Higgins     2019-09-23  1538   * failure (see KUNIT_=
ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1539   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1540  #define KUNIT_ASSERT_N=
E(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1541  	KUNIT_BINARY_NE_ASSER=
TION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1542  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1543  #define KUNIT_ASSERT_N=
E_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1544  	KUNIT_BINARY_NE_MSG_A=
SSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1545  				      KUNIT_ASSERT=
ION,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1546  				      left,				   =
    \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1547  				      right,				  =
     \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1548  				      fmt,				    =
   \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1549  				      ##__VA_ARGS_=
_)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1550  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1551  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1552   * KUNIT_ASSERT_PTR_NE=
() - Asserts that pointers @left and @right are not equal.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1553   * KUNIT_ASSERT_PTR_EQ=
() - Asserts that pointers @left and @right are equal.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1554   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1555   * @left: an arbitrary=
 expression that evaluates to a pointer.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1556   * @right: an arbitrar=
y expression that evaluates to a pointer.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1557   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1558   * Sets an assertion t=
hat the values that @left and @right evaluate to are not
e4aea8f8532b55 Brendan Higgins     2019-09-23  1559   * equal. This is the =
same as KUNIT_EXPECT_NE(), except it causes an assertion
e4aea8f8532b55 Brendan Higgins     2019-09-23  1560   * failure (see KUNIT_=
ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1561   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1562  #define KUNIT_ASSERT_P=
TR_NE(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1563  	KUNIT_BINARY_PTR_NE_A=
SSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1564  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1565  #define KUNIT_ASSERT_P=
TR_NE_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1566  	KUNIT_BINARY_PTR_NE_M=
SG_ASSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1567  					  KUNIT_ASSERTION=
,		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1568  					  left,				      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1569  					  right,			      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1570  					  fmt,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1571  					  ##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1572  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1573   * KUNIT_ASSERT_LT() -=
 An assertion that @left is less than @right.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1574   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1575   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1576   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1577   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1578   * Sets an assertion t=
hat the value that @left evaluates to is less than the
e4aea8f8532b55 Brendan Higgins     2019-09-23  1579   * value that @right e=
valuates to. This is the same as KUNIT_EXPECT_LT(), except
e4aea8f8532b55 Brendan Higgins     2019-09-23  1580   * it causes an assert=
ion failure (see KUNIT_ASSERT_TRUE()) when the assertion
e4aea8f8532b55 Brendan Higgins     2019-09-23  1581   * is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1582   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1583  #define KUNIT_ASSERT_L=
T(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1584  	KUNIT_BINARY_LT_ASSER=
TION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1585  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1586  #define KUNIT_ASSERT_L=
T_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1587  	KUNIT_BINARY_LT_MSG_A=
SSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1588  				      KUNIT_ASSERT=
ION,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1589  				      left,				   =
    \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1590  				      right,				  =
     \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1591  				      fmt,				    =
   \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1592  				      ##__VA_ARGS_=
_)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1593  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1594   * KUNIT_ASSERT_LE() -=
 An assertion that @left is less than or equal to @right.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1595   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1596   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1597   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1598   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1599   * Sets an assertion t=
hat the value that @left evaluates to is less than or
e4aea8f8532b55 Brendan Higgins     2019-09-23  1600   * equal to the value =
that @right evaluates to. This is the same as
e4aea8f8532b55 Brendan Higgins     2019-09-23  1601   * KUNIT_EXPECT_LE(), =
except it causes an assertion failure (see
e4aea8f8532b55 Brendan Higgins     2019-09-23  1602   * KUNIT_ASSERT_TRUE()=
) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1603   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1604  #define KUNIT_ASSERT_L=
E(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1605  	KUNIT_BINARY_LE_ASSER=
TION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1606  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1607  #define KUNIT_ASSERT_L=
E_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1608  	KUNIT_BINARY_LE_MSG_A=
SSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1609  				      KUNIT_ASSERT=
ION,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1610  				      left,				   =
    \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1611  				      right,				  =
     \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1612  				      fmt,				    =
   \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1613  				      ##__VA_ARGS_=
_)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1614  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1615  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1616   * KUNIT_ASSERT_GT() -=
 An assertion that @left is greater than @right.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1617   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1618   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1619   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1620   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1621   * Sets an assertion t=
hat the value that @left evaluates to is greater than the
e4aea8f8532b55 Brendan Higgins     2019-09-23  1622   * value that @right e=
valuates to. This is the same as KUNIT_EXPECT_GT(), except
e4aea8f8532b55 Brendan Higgins     2019-09-23  1623   * it causes an assert=
ion failure (see KUNIT_ASSERT_TRUE()) when the assertion
e4aea8f8532b55 Brendan Higgins     2019-09-23  1624   * is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1625   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1626  #define KUNIT_ASSERT_G=
T(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1627  	KUNIT_BINARY_GT_ASSER=
TION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1628  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1629  #define KUNIT_ASSERT_G=
T_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1630  	KUNIT_BINARY_GT_MSG_A=
SSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1631  				      KUNIT_ASSERT=
ION,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1632  				      left,				   =
    \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1633  				      right,				  =
     \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1634  				      fmt,				    =
   \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1635  				      ##__VA_ARGS_=
_)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1636  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1637  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1638   * KUNIT_ASSERT_GE() -=
 Assertion that @left is greater than or equal to @right.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1639   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1640   * @left: an arbitrary=
 expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1641   * @right: an arbitrar=
y expression that evaluates to a primitive C type.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1642   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1643   * Sets an assertion t=
hat the value that @left evaluates to is greater than the
e4aea8f8532b55 Brendan Higgins     2019-09-23  1644   * value that @right e=
valuates to. This is the same as KUNIT_EXPECT_GE(), except
e4aea8f8532b55 Brendan Higgins     2019-09-23  1645   * it causes an assert=
ion failure (see KUNIT_ASSERT_TRUE()) when the assertion
e4aea8f8532b55 Brendan Higgins     2019-09-23  1646   * is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1647   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1648  #define KUNIT_ASSERT_G=
E(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1649  	KUNIT_BINARY_GE_ASSER=
TION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1650  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1651  #define KUNIT_ASSERT_G=
E_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1652  	KUNIT_BINARY_GE_MSG_A=
SSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1653  				      KUNIT_ASSERT=
ION,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1654  				      left,				   =
    \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1655  				      right,				  =
     \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1656  				      fmt,				    =
   \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1657  				      ##__VA_ARGS_=
_)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1658  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1659  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1660   * KUNIT_ASSERT_STREQ(=
) - An assertion that strings @left and @right are equal.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1661   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1662   * @left: an arbitrary=
 expression that evaluates to a null terminated string.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1663   * @right: an arbitrar=
y expression that evaluates to a null terminated string.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1664   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1665   * Sets an assertion t=
hat the values that @left and @right evaluate to are
e4aea8f8532b55 Brendan Higgins     2019-09-23  1666   * equal. This is the =
same as KUNIT_EXPECT_STREQ(), except it causes an
e4aea8f8532b55 Brendan Higgins     2019-09-23  1667   * assertion failure (=
see KUNIT_ASSERT_TRUE()) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1668   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1669  #define KUNIT_ASSERT_S=
TREQ(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1670  	KUNIT_BINARY_STR_EQ_A=
SSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1671  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1672  #define KUNIT_ASSERT_S=
TREQ_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1673  	KUNIT_BINARY_STR_EQ_M=
SG_ASSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1674  					  KUNIT_ASSERTION=
,		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1675  					  left,				      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1676  					  right,			      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1677  					  fmt,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1678  					  ##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1679  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1680  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1681   * KUNIT_ASSERT_STRNEQ=
() - Expects that strings @left and @right are not equal.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1682   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1683   * @left: an arbitrary=
 expression that evaluates to a null terminated string.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1684   * @right: an arbitrar=
y expression that evaluates to a null terminated string.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1685   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1686   * Sets an expectation=
 that the values that @left and @right evaluate to are
e4aea8f8532b55 Brendan Higgins     2019-09-23  1687   * not equal. This is =
semantically equivalent to
e4aea8f8532b55 Brendan Higgins     2019-09-23  1688   * KUNIT_ASSERT_TRUE(@=
test, strcmp((@left), (@right))). See KUNIT_ASSERT_TRUE()
e4aea8f8532b55 Brendan Higgins     2019-09-23  1689   * for more informatio=
n.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1690   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1691  #define KUNIT_ASSERT_S=
TRNEQ(test, left, right) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1692  	KUNIT_BINARY_STR_NE_A=
SSERTION(test, KUNIT_ASSERTION, left, right)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1693  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1694  #define KUNIT_ASSERT_S=
TRNEQ_MSG(test, left, right, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1695  	KUNIT_BINARY_STR_NE_M=
SG_ASSERTION(test,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1696  					  KUNIT_ASSERTION=
,		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1697  					  left,				      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1698  					  right,			      =
 \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1699  					  fmt,				       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1700  					  ##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1701  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1702  /**
e4aea8f8532b55 Brendan Higgins     2019-09-23  1703   * KUNIT_ASSERT_NOT_ER=
R_OR_NULL() - Assertion that @ptr is not null and not err.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1704   * @test: The test con=
text object.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1705   * @ptr: an arbitrary =
pointer.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1706   *
e4aea8f8532b55 Brendan Higgins     2019-09-23  1707   * Sets an assertion t=
hat the value that @ptr evaluates to is not null and not
e4aea8f8532b55 Brendan Higgins     2019-09-23  1708   * an errno stored in =
a pointer. This is the same as
e4aea8f8532b55 Brendan Higgins     2019-09-23  1709   * KUNIT_EXPECT_NOT_ER=
R_OR_NULL(), except it causes an assertion failure (see
e4aea8f8532b55 Brendan Higgins     2019-09-23  1710   * KUNIT_ASSERT_TRUE()=
) when the assertion is not met.
e4aea8f8532b55 Brendan Higgins     2019-09-23  1711   */
e4aea8f8532b55 Brendan Higgins     2019-09-23  1712  #define KUNIT_ASSERT_N=
OT_ERR_OR_NULL(test, ptr) \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1713  	KUNIT_PTR_NOT_ERR_OR_=
NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1714  =

e4aea8f8532b55 Brendan Higgins     2019-09-23  1715  #define KUNIT_ASSERT_N=
OT_ERR_OR_NULL_MSG(test, ptr, fmt, ...)		       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1716  	KUNIT_PTR_NOT_ERR_OR_=
NULL_MSG_ASSERTION(test,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1717  						KUNIT_ASSERTION,=
	       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1718  						ptr,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1719  						fmt,			       \
e4aea8f8532b55 Brendan Higgins     2019-09-23  1720  						##__VA_ARGS__)
e4aea8f8532b55 Brendan Higgins     2019-09-23  1721  =

6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1722  /**
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1723   * KUNIT_PARAM_GENERAT=
OR() - Helper method for test parameter generators
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1724   * 			     required in=
 parameterized tests.
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1725   * @name:  prefix of t=
he name for the test parameter generator function.
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1726   * @prev: a pointer to=
 the previous test parameter, NULL for first parameter.
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1727   * @array: a user-supp=
lied pointer to an array of test parameters.
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1728   */
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1729  #define KUNIT_PARAM_GE=
NERATOR(name, array)							\
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1730  	static void *name##_g=
en_params(void *prev)						\
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1731  	{											\
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1732  		typeof((array)[0]) *=
 __next =3D prev ? ((typeof(__next)) prev) + 1 : (array);	\
6b4ee29da75136 Arpitha Raghunandan 2020-10-27 @1733  		return __next - (arr=
ay) < ARRAY_SIZE((array)) ? __next : NULL;			\
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1734  	}
6b4ee29da75136 Arpitha Raghunandan 2020-10-27  1735  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============3101424932212646940==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3101424932212646940==--

