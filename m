Content-Type: multipart/mixed; boundary="===============8318721970455873818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:xlnx_rebase_v5.4 1296/1697] drivers/media/i2c/adv7511-v4l2.c:2102:63: sparse: sparse: incorrect type in argument 1 (different base types)
Date: Fri, 15 Jan 2021 08:32:40 +0800
Message-ID: <202101150827.tHH0y8aM-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8318721970455873818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vishal,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   629150468791671b5fde21363e643e87c5815b17
commit: 0b197959bbbdb68e1da974bd013339f08704b178 [1296/1697] staging: xlnxs=
ync: Fix the uapi header license
config: alpha-randconfig-s032-20210113 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://github.com/Xilinx/linux-xlnx/commit/0b197959bbbdb68e1da97=
4bd013339f08704b178
        git remote add xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xlnx xlnx_rebase_v5.4
        git checkout 0b197959bbbdb68e1da974bd013339f08704b178
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dalpha =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/media/i2c/adv7511-v4l2.c:427:16: sparse: sparse: return expressi=
on in void function
>> drivers/media/i2c/adv7511-v4l2.c:2102:63: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2102:63: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2102:63: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2106:65: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2106:65: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2106:65: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2110:62: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2110:62: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2110:62: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2117:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2117:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2117:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2121:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2121:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2121:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2125:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2125:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2125:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2129:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2129:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2129:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2133:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2133:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2133:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2137:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2137:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2137:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2141:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2141:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2141:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2151:42: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2151:42: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2151:42: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2157:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2157:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2157:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2161:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2161:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2161:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2165:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2165:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2165:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2169:55: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2169:55: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2169:55: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2174:63: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2174:63: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2174:63: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2181:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2181:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2181:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2186:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2186:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2186:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2191:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2191:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2191:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2196:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2196:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2196:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2201:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2201:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2201:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2206:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2206:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2206:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2211:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2211:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2211:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2216:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2216:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2216:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2221:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2221:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2221:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2226:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2226:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2226:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2231:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2231:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2231:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop
   drivers/media/i2c/adv7511-v4l2.c:2236:72: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected restricted __be32 con=
st [usertype] *p @@     got unsigned int const [usertype] *[assigned] prop =
@@
   drivers/media/i2c/adv7511-v4l2.c:2236:72: sparse:     expected restricte=
d __be32 const [usertype] *p
   drivers/media/i2c/adv7511-v4l2.c:2236:72: sparse:     got unsigned int c=
onst [usertype] *[assigned] prop

vim +2102 drivers/media/i2c/adv7511-v4l2.c

5a544cce2177fe36 drivers/media/i2c/adv7511.c      Hans Verkuil        2013-=
08-23  2086  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2087  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2088  static void adv7511_get_ofdt_config(struct i2c_client *client,
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2089  	struct adv7511_state *state)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2090  {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2091  	struct device_node *dn =3D client->dev.of_node;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2092  	struct device_node *np;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2093  	struct adv7511_config *config =3D &state->cfg;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2094  	u32 const *prop;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2095  	int size;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2096  	bool vin_loaded, vout_loaded;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2097  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2098  	vin_loaded =3D vout_loaded =3D false;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2099  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2100  	prop =3D of_get_property(dn, "edid-addr", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2101  	if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15 @2102  		state->pdata.i2c_edid =3D (uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2103  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2104  	prop =3D of_get_property(dn, "pktmem-addr", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2105  	if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2106  		state->pdata.i2c_pktmem =3D (uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2107  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2108  	prop =3D of_get_property(dn, "cec-addr", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2109  	if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2110  		state->pdata.i2c_cec =3D (uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2111  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2112  	np =3D of_find_node_by_name(dn, "video-input");
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2113  	if (np) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2114  		prop =3D of_get_property(np, "input-id", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2115  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2116  			config->in_params.input_id =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2117  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2118  		prop =3D of_get_property(np, "input-style", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2119  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2120  			config->in_params.input_style =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2121  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2122  		prop =3D of_get_property(np, "input-color-depth", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2123  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2124  			config->in_params.input_color_depth =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2125  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2126  		prop =3D of_get_property(np, "bit-justification", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2127  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2128  			config->in_params.bit_justification =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2129  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2130  		prop =3D of_get_property(np, "hsync-polarity", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2131  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2132  			config->in_params.hsync_polarity =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2133  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2134  		prop =3D of_get_property(np, "vsync-polarity", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2135  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2136  			config->in_params.vsync_polarity =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2137  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2138  		prop =3D of_get_property(np, "clock-delay", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2139  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2140  			config->in_params.clock_delay =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2141  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2142  		vin_loaded =3D true;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2143  	} else {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2144  		pr_info("No video input configuration, using device default\=
n");
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2145  	}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2146  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2147  	np =3D of_find_node_by_name(dn, "video-output");
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2148  	if (np) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2149  		prop =3D of_get_property(np, "hdmi-mode", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2150  		if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2151  			if (be32_to_cpup(prop) =3D=3D 1)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2152  				config->out_params.hdmi_mode =3D true;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2153  		}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2154  		prop =3D of_get_property(np, "output-format", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2155  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2156  			config->out_params.output_format =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2157  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2158  		prop =3D of_get_property(np, "output-color-space", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2159  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2160  			config->out_params.output_color_space =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2161  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2162  		prop =3D of_get_property(np, "up-conversion", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2163  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2164  			config->out_params.up_conversion =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2165  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2166  		prop =3D of_get_property(np, "csc-enable", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2167  		if (prop)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2168  			config->out_params.csc_enable =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2169  				(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2170  		if (config->out_params.csc_enable) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2171  			prop =3D of_get_property(np, "csc-scaling-factor", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2172  			if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2173  				config->out_params.csc_scaling_factor =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2174  					(uint8_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2175  			}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2176  			np =3D of_find_node_by_name(dn, "csc-coefficients");
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2177  			if (np) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2178  				prop =3D of_get_property(np, "a1", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2179  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2180  					config->out_params.csc_coeff.a1 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2181  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2182  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2183  				prop =3D of_get_property(np, "a2", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2184  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2185  					config->out_params.csc_coeff.a2 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2186  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2187  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2188  				prop =3D of_get_property(np, "a3", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2189  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2190  					config->out_params.csc_coeff.a3 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2191  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2192  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2193  				prop =3D of_get_property(np, "a4", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2194  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2195  					config->out_params.csc_coeff.a4 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2196  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2197  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2198  				prop =3D of_get_property(np, "b1", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2199  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2200  					config->out_params.csc_coeff.b1 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2201  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2202  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2203  				prop =3D of_get_property(np, "b2", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2204  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2205  					config->out_params.csc_coeff.b2 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2206  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2207  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2208  				prop =3D of_get_property(np, "b3", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2209  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2210  					config->out_params.csc_coeff.b3 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2211  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2212  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2213  				prop =3D of_get_property(np, "b4", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2214  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2215  					config->out_params.csc_coeff.b4 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2216  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2217  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2218  				prop =3D of_get_property(np, "c1", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2219  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2220  					config->out_params.csc_coeff.c1 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2221  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2222  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2223  				prop =3D of_get_property(np, "c2", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2224  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2225  					config->out_params.csc_coeff.c2 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2226  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2227  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2228  				prop =3D of_get_property(np, "c3", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2229  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2230  					config->out_params.csc_coeff.c3 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2231  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2232  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2233  				prop =3D of_get_property(np, "c4", &size);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2234  				if (prop) {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2235  					config->out_params.csc_coeff.c4 =3D
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2236  						(uint16_t)be32_to_cpup(prop);
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2237  				}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2238  			} else {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2239  				pr_info("No CSC coefficients, using default\n");
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2240  			}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2241  		}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2242  		vout_loaded =3D true;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2243  	} else {
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2244  		pr_info("No video output configuration, using device default=
\n");
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2245  	}
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2246  =

9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2247  	if (vin_loaded && vout_loaded)
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2248  		config->loaded =3D true;
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2249  }
9836a252284b997a drivers/media/i2c/adv7511-v4l2.c Radhey Shyam Pandey 2014-=
01-15  2250  =


:::::: The code at line 2102 was first introduced by commit
:::::: 9836a252284b997aacd6b86766514a0bb84b4f43 drivers: media: Customized =
adv7511 for Xylon LogiCVC (deprecated)

:::::: TO: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8318721970455873818==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
1LhekyJusTVY6P8ABeb6Uk4eAgA=
--===============8318721970455873818==--

