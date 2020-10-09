Content-Type: multipart/mixed; boundary="===============0131854163526733526=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [gustavoars-linux:for-next/clang-ft 2/3] drivers/media/dvb-frontends/m88ds3103.c:910:2: warning: unannotated fall-through between switch labels
Date: Fri, 09 Oct 2020 13:19:41 +0800
Message-ID: <202010091336.B4hdfmE8-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0131854163526733526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.gi=
t for-next/clang-ft
head:   de6b606b07e40c037ed4f83b53ee541692a78c6e
commit: 7d30604536de43168b1eae0a4a938bcbca7786d2 [2/3] Revert "kbuild: Do n=
ot enable -Wimplicit-fallthrough for clang for now"
config: x86_64-randconfig-a003-20201009 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 4cfc40=
25cc1433ca5ef1c526053fc9c4bfe64109)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.=
git/commit/?id=3D7d30604536de43168b1eae0a4a938bcbca7786d2
        git remote add gustavoars-linux https://git.kernel.org/pub/scm/linu=
x/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars-linux for-next/clang-ft
        git checkout 7d30604536de43168b1eae0a4a938bcbca7786d2
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/dvb-frontends/m88ds3103.c:8:
   In file included from drivers/media/dvb-frontends/m88ds3103_priv.h:11:
   In file included from include/media/dvb_frontend.h:48:
   In file included from include/media/dvbdev.h:23:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:241:2: warning: unannotated fall-through between =
switch labels [-Wimplicit-fallthrough]
           case 1: ;
           ^
   include/linux/signal.h:241:2: note: insert '__attribute__((fallthrough))=
;' to silence this warning
           case 1: ;
           ^
           __attribute__((fallthrough)); =

   include/linux/signal.h:241:2: note: insert 'break;' to avoid fall-through
           case 1: ;
           ^
           break; =

   include/linux/signal.h:253:2: warning: unannotated fall-through between =
switch labels [-Wimplicit-fallthrough]
           case 1: ;
           ^
   include/linux/signal.h:253:2: note: insert '__attribute__((fallthrough))=
;' to silence this warning
           case 1: ;
           ^
           __attribute__((fallthrough)); =

   include/linux/signal.h:253:2: note: insert 'break;' to avoid fall-through
           case 1: ;
           ^
           break; =

>> drivers/media/dvb-frontends/m88ds3103.c:910:2: warning: unannotated fall=
-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/media/dvb-frontends/m88ds3103.c:910:2: note: insert '__attribute=
__((fallthrough));' to silence this warning
           default:
           ^
           __attribute__((fallthrough)); =

   drivers/media/dvb-frontends/m88ds3103.c:910:2: note: insert 'break;' to =
avoid fall-through
           default:
           ^
           break; =

   3 warnings generated.
--
   In file included from drivers/media/cec/core/cec-pin.c:10:
   In file included from include/media/cec-pin.h:12:
   In file included from include/media/cec.h:11:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:241:2: warning: unannotated fall-through between =
switch labels [-Wimplicit-fallthrough]
           case 1: ;
           ^
   include/linux/signal.h:241:2: note: insert '__attribute__((fallthrough))=
;' to silence this warning
           case 1: ;
           ^
           __attribute__((fallthrough)); =

   include/linux/signal.h:241:2: note: insert 'break;' to avoid fall-through
           case 1: ;
           ^
           break; =

   include/linux/signal.h:253:2: warning: unannotated fall-through between =
switch labels [-Wimplicit-fallthrough]
           case 1: ;
           ^
   include/linux/signal.h:253:2: note: insert '__attribute__((fallthrough))=
;' to silence this warning
           case 1: ;
           ^
           __attribute__((fallthrough)); =

   include/linux/signal.h:253:2: note: insert 'break;' to avoid fall-through
           case 1: ;
           ^
           break; =

>> drivers/media/cec/core/cec-pin.c:421:2: warning: unannotated fall-throug=
h between switch labels [-Wimplicit-fallthrough]
           case CEC_ST_TX_DATA_BIT_0_HIGH:
           ^
   drivers/media/cec/core/cec-pin.c:421:2: note: insert '__attribute__((fal=
lthrough));' to silence this warning
           case CEC_ST_TX_DATA_BIT_0_HIGH:
           ^
           __attribute__((fallthrough)); =

   drivers/media/cec/core/cec-pin.c:421:2: note: insert 'break;' to avoid f=
all-through
           case CEC_ST_TX_DATA_BIT_0_HIGH:
           ^
           break; =

   drivers/media/cec/core/cec-pin.c:449:2: warning: unannotated fall-throug=
h between switch labels [-Wimplicit-fallthrough]
           case CEC_ST_TX_DATA_BIT_HIGH_CUSTOM:
           ^
   drivers/media/cec/core/cec-pin.c:449:2: note: insert '__attribute__((fal=
lthrough));' to silence this warning
           case CEC_ST_TX_DATA_BIT_HIGH_CUSTOM:
           ^
           __attribute__((fallthrough)); =

   drivers/media/cec/core/cec-pin.c:449:2: note: insert 'break;' to avoid f=
all-through
           case CEC_ST_TX_DATA_BIT_HIGH_CUSTOM:
           ^
           break; =

   drivers/media/cec/core/cec-pin.c:463:2: warning: unannotated fall-throug=
h between switch labels [-Wimplicit-fallthrough]
           case CEC_ST_TX_START_BIT_HIGH:
           ^
   drivers/media/cec/core/cec-pin.c:463:2: note: insert '__attribute__((fal=
lthrough));' to silence this warning
           case CEC_ST_TX_START_BIT_HIGH:
           ^
           __attribute__((fallthrough)); =

   drivers/media/cec/core/cec-pin.c:463:2: note: insert 'break;' to avoid f=
all-through
           case CEC_ST_TX_START_BIT_HIGH:
           ^
           break; =

   5 warnings generated.
--
>> drivers/media/test-drivers/vivid/vivid-vbi-gen.c:302:2: warning: unannot=
ated fall-through between switch labels [-Wimplicit-fallthrough]
           case 1 ... 7:
           ^
   drivers/media/test-drivers/vivid/vivid-vbi-gen.c:302:2: note: insert '__=
attribute__((fallthrough));' to silence this warning
           case 1 ... 7:
           ^
           __attribute__((fallthrough)); =

   drivers/media/test-drivers/vivid/vivid-vbi-gen.c:302:2: note: insert 'br=
eak;' to avoid fall-through
           case 1 ... 7:
           ^
           break; =

   1 warning generated.

vim +910 drivers/media/dvb-frontends/m88ds3103.c

e6089feca460cb4 Brad Love        2020-02-01   621  =

395d00d1ca89478 Antti Palosaari  2013-02-25   622  static int m88ds3103_set=
_frontend(struct dvb_frontend *fe)
395d00d1ca89478 Antti Palosaari  2013-02-25   623  {
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   624  	struct m88ds3103_dev *d=
ev =3D fe->demodulator_priv;
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   625  	struct i2c_client *clie=
nt =3D dev->client;
395d00d1ca89478 Antti Palosaari  2013-02-25   626  	struct dtv_frontend_pro=
perties *c =3D &fe->dtv_property_cache;
06487dee53ae157 Antti Palosaari  2013-12-02   627  	int ret, len;
395d00d1ca89478 Antti Palosaari  2013-02-25   628  	const struct m88ds3103_=
reg_val *init;
b6851419409664b nibble.max       2014-11-05   629  	u8 u8tmp, u8tmp1 =3D 0,=
 u8tmp2 =3D 0; /* silence compiler warning */
f4df95bcbb7b142 nibble.max       2014-10-30   630  	u8 buf[3];
334ef18e879980e Antti Palosaari  2016-06-29   631  	u16 u16tmp;
e6089feca460cb4 Brad Love        2020-02-01   632  	u32 tuner_frequency_khz=
, target_mclk, u32tmp;
395d00d1ca89478 Antti Palosaari  2013-02-25   633  	s32 s32tmp;
981fbe3da20a6f3 James Hutchinson 2019-01-13   634  	static const struct reg=
_sequence reset_buf[] =3D {
981fbe3da20a6f3 James Hutchinson 2019-01-13   635  		{0x07, 0x80}, {0x07, 0=
x00}
981fbe3da20a6f3 James Hutchinson 2019-01-13   636  	};
41b9aa0040526d1 Antti Palosaari  2014-08-21   637  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   638  	dev_dbg(&client->dev,
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   639  		"delivery_system=3D%d =
modulation=3D%d frequency=3D%u symbol_rate=3D%d inversion=3D%d pilot=3D%d r=
olloff=3D%d\n",
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   640  		c->delivery_system, c-=
>modulation, c->frequency, c->symbol_rate,
395d00d1ca89478 Antti Palosaari  2013-02-25   641  		c->inversion, c->pilot=
, c->rolloff);
395d00d1ca89478 Antti Palosaari  2013-02-25   642  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   643  	if (!dev->warm) {
395d00d1ca89478 Antti Palosaari  2013-02-25   644  		ret =3D -EAGAIN;
395d00d1ca89478 Antti Palosaari  2013-02-25   645  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   646  	}
395d00d1ca89478 Antti Palosaari  2013-02-25   647  =

f4df95bcbb7b142 nibble.max       2014-10-30   648  	/* reset */
981fbe3da20a6f3 James Hutchinson 2019-01-13   649  	ret =3D regmap_multi_re=
g_write(dev->regmap, reset_buf, 2);
f4df95bcbb7b142 nibble.max       2014-10-30   650  	if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   651  		goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   652  =

f4df95bcbb7b142 nibble.max       2014-10-30   653  	/* Disable demod clock =
path */
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   654  	if (dev->chip_id =3D=3D=
 M88RS6000_CHIP_ID) {
e6089feca460cb4 Brad Love        2020-02-01   655  		if (dev->chiptype =3D=
=3D M88DS3103_CHIPTYPE_3103B) {
e6089feca460cb4 Brad Love        2020-02-01   656  			ret =3D regmap_read(d=
ev->regmap, 0xb2, &u32tmp);
e6089feca460cb4 Brad Love        2020-02-01   657  			if (ret)
e6089feca460cb4 Brad Love        2020-02-01   658  				goto err;
e6089feca460cb4 Brad Love        2020-02-01   659  			if (u32tmp =3D=3D 0x0=
1) {
e6089feca460cb4 Brad Love        2020-02-01   660  				ret =3D regmap_write=
(dev->regmap, 0x00, 0x00);
e6089feca460cb4 Brad Love        2020-02-01   661  				if (ret)
e6089feca460cb4 Brad Love        2020-02-01   662  					goto err;
e6089feca460cb4 Brad Love        2020-02-01   663  				ret =3D regmap_write=
(dev->regmap, 0xb2, 0x00);
e6089feca460cb4 Brad Love        2020-02-01   664  				if (ret)
e6089feca460cb4 Brad Love        2020-02-01   665  					goto err;
e6089feca460cb4 Brad Love        2020-02-01   666  			}
e6089feca460cb4 Brad Love        2020-02-01   667  		}
e6089feca460cb4 Brad Love        2020-02-01   668  =

478932b16052f5d Antti Palosaari  2015-04-16   669  		ret =3D regmap_write(d=
ev->regmap, 0x06, 0xe0);
f4df95bcbb7b142 nibble.max       2014-10-30   670  		if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   671  			goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   672  	}
f4df95bcbb7b142 nibble.max       2014-10-30   673  =

395d00d1ca89478 Antti Palosaari  2013-02-25   674  	/* program tuner */
395d00d1ca89478 Antti Palosaari  2013-02-25   675  	if (fe->ops.tuner_ops.s=
et_params) {
395d00d1ca89478 Antti Palosaari  2013-02-25   676  		ret =3D fe->ops.tuner_=
ops.set_params(fe);
395d00d1ca89478 Antti Palosaari  2013-02-25   677  		if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   678  			goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   679  	}
395d00d1ca89478 Antti Palosaari  2013-02-25   680  =

395d00d1ca89478 Antti Palosaari  2013-02-25   681  	if (fe->ops.tuner_ops.g=
et_frequency) {
f5d9b88db7222bf Antti Palosaari  2016-06-29   682  		ret =3D fe->ops.tuner_=
ops.get_frequency(fe, &tuner_frequency_khz);
395d00d1ca89478 Antti Palosaari  2013-02-25   683  		if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   684  			goto err;
2f9dff3f39f0d6d Antti Palosaari  2014-02-01   685  	} else {
2f9dff3f39f0d6d Antti Palosaari  2014-02-01   686  		/*
2f9dff3f39f0d6d Antti Palosaari  2014-02-01   687  		 * Use nominal target =
frequency as tuner driver does not provide
2f9dff3f39f0d6d Antti Palosaari  2014-02-01   688  		 * actual frequency us=
ed. Carrier offset calculation is not
2f9dff3f39f0d6d Antti Palosaari  2014-02-01   689  		 * valid.
2f9dff3f39f0d6d Antti Palosaari  2014-02-01   690  		 */
f5d9b88db7222bf Antti Palosaari  2016-06-29   691  		tuner_frequency_khz =
=3D c->frequency;
395d00d1ca89478 Antti Palosaari  2013-02-25   692  	}
395d00d1ca89478 Antti Palosaari  2013-02-25   693  =

e6089feca460cb4 Brad Love        2020-02-01   694  	/* set M88RS6000/DS3103=
B demod main mclk and ts mclk from tuner die */
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   695  	if (dev->chip_id =3D=3D=
 M88RS6000_CHIP_ID) {
f4df95bcbb7b142 nibble.max       2014-10-30   696  		if (c->symbol_rate > 4=
5010000)
f5d9b88db7222bf Antti Palosaari  2016-06-29   697  			dev->mclk =3D 1102500=
00;
f4df95bcbb7b142 nibble.max       2014-10-30   698  		else
f5d9b88db7222bf Antti Palosaari  2016-06-29   699  			dev->mclk =3D 9600000=
0;
395d00d1ca89478 Antti Palosaari  2013-02-25   700  =

f4df95bcbb7b142 nibble.max       2014-10-30   701  		if (c->delivery_system=
 =3D=3D SYS_DVBS)
f5d9b88db7222bf Antti Palosaari  2016-06-29   702  			target_mclk =3D 96000=
000;
f4df95bcbb7b142 nibble.max       2014-10-30   703  		else
f5d9b88db7222bf Antti Palosaari  2016-06-29   704  			target_mclk =3D 14400=
0000;
395d00d1ca89478 Antti Palosaari  2013-02-25   705  =

e6089feca460cb4 Brad Love        2020-02-01   706  		if (dev->chiptype =3D=
=3D M88DS3103_CHIPTYPE_3103B) {
e6089feca460cb4 Brad Love        2020-02-01   707  			m88ds3103b_select_mcl=
k(dev);
e6089feca460cb4 Brad Love        2020-02-01   708  			m88ds3103b_set_mclk(d=
ev, target_mclk / 1000);
e6089feca460cb4 Brad Love        2020-02-01   709  		}
e6089feca460cb4 Brad Love        2020-02-01   710  =

f4df95bcbb7b142 nibble.max       2014-10-30   711  		/* Enable demod clock =
path */
478932b16052f5d Antti Palosaari  2015-04-16   712  		ret =3D regmap_write(d=
ev->regmap, 0x06, 0x00);
395d00d1ca89478 Antti Palosaari  2013-02-25   713  		if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   714  			goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   715  		usleep_range(10000, 20=
000);
f4df95bcbb7b142 nibble.max       2014-10-30   716  	} else {
f4df95bcbb7b142 nibble.max       2014-10-30   717  	/* set M88DS3103 mclk a=
nd ts mclk. */
f5d9b88db7222bf Antti Palosaari  2016-06-29   718  		dev->mclk =3D 96000000;
395d00d1ca89478 Antti Palosaari  2013-02-25   719  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   720  		switch (dev->cfg->ts_m=
ode) {
395d00d1ca89478 Antti Palosaari  2013-02-25   721  		case M88DS3103_TS_SERI=
AL:
395d00d1ca89478 Antti Palosaari  2013-02-25   722  		case M88DS3103_TS_SERI=
AL_D7:
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   723  			target_mclk =3D dev->=
cfg->ts_clk;
395d00d1ca89478 Antti Palosaari  2013-02-25   724  			break;
395d00d1ca89478 Antti Palosaari  2013-02-25   725  		case M88DS3103_TS_PARA=
LLEL:
395d00d1ca89478 Antti Palosaari  2013-02-25   726  		case M88DS3103_TS_CI:
b6851419409664b nibble.max       2014-11-05   727  			if (c->delivery_syste=
m =3D=3D SYS_DVBS)
f5d9b88db7222bf Antti Palosaari  2016-06-29   728  				target_mclk =3D 9600=
0000;
b6851419409664b nibble.max       2014-11-05   729  			else {
395d00d1ca89478 Antti Palosaari  2013-02-25   730  				if (c->symbol_rate <=
 18000000)
f5d9b88db7222bf Antti Palosaari  2016-06-29   731  					target_mclk =3D 960=
00000;
395d00d1ca89478 Antti Palosaari  2013-02-25   732  				else if (c->symbol_r=
ate < 28000000)
f5d9b88db7222bf Antti Palosaari  2016-06-29   733  					target_mclk =3D 144=
000000;
395d00d1ca89478 Antti Palosaari  2013-02-25   734  				else
f5d9b88db7222bf Antti Palosaari  2016-06-29   735  					target_mclk =3D 192=
000000;
b6851419409664b nibble.max       2014-11-05   736  			}
395d00d1ca89478 Antti Palosaari  2013-02-25   737  			break;
395d00d1ca89478 Antti Palosaari  2013-02-25   738  		default:
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   739  			dev_dbg(&client->dev,=
 "invalid ts_mode\n");
395d00d1ca89478 Antti Palosaari  2013-02-25   740  			ret =3D -EINVAL;
395d00d1ca89478 Antti Palosaari  2013-02-25   741  			goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   742  		}
f4df95bcbb7b142 nibble.max       2014-10-30   743  =

f4df95bcbb7b142 nibble.max       2014-10-30   744  		switch (target_mclk) {
f5d9b88db7222bf Antti Palosaari  2016-06-29   745  		case 96000000:
f4df95bcbb7b142 nibble.max       2014-10-30   746  			u8tmp1 =3D 0x02; /* 0=
b10 */
f4df95bcbb7b142 nibble.max       2014-10-30   747  			u8tmp2 =3D 0x01; /* 0=
b01 */
f4df95bcbb7b142 nibble.max       2014-10-30   748  			break;
f5d9b88db7222bf Antti Palosaari  2016-06-29   749  		case 144000000:
f4df95bcbb7b142 nibble.max       2014-10-30   750  			u8tmp1 =3D 0x00; /* 0=
b00 */
f4df95bcbb7b142 nibble.max       2014-10-30   751  			u8tmp2 =3D 0x01; /* 0=
b01 */
f4df95bcbb7b142 nibble.max       2014-10-30   752  			break;
f5d9b88db7222bf Antti Palosaari  2016-06-29   753  		case 192000000:
f4df95bcbb7b142 nibble.max       2014-10-30   754  			u8tmp1 =3D 0x03; /* 0=
b11 */
f4df95bcbb7b142 nibble.max       2014-10-30   755  			u8tmp2 =3D 0x00; /* 0=
b00 */
f4df95bcbb7b142 nibble.max       2014-10-30   756  			break;
f4df95bcbb7b142 nibble.max       2014-10-30   757  		}
56ea37da3b93dfe Antti Palosaari  2015-10-03   758  		ret =3D m88ds3103_upda=
te_bits(dev, 0x22, 0xc0, u8tmp1 << 6);
f4df95bcbb7b142 nibble.max       2014-10-30   759  		if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   760  			goto err;
56ea37da3b93dfe Antti Palosaari  2015-10-03   761  		ret =3D m88ds3103_upda=
te_bits(dev, 0x24, 0xc0, u8tmp2 << 6);
f4df95bcbb7b142 nibble.max       2014-10-30   762  		if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   763  			goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   764  	}
f4df95bcbb7b142 nibble.max       2014-10-30   765  =

478932b16052f5d Antti Palosaari  2015-04-16   766  	ret =3D regmap_write(de=
v->regmap, 0xb2, 0x01);
f4df95bcbb7b142 nibble.max       2014-10-30   767  	if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   768  		goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   769  =

478932b16052f5d Antti Palosaari  2015-04-16   770  	ret =3D regmap_write(de=
v->regmap, 0x00, 0x01);
f4df95bcbb7b142 nibble.max       2014-10-30   771  	if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   772  		goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   773  =

f4df95bcbb7b142 nibble.max       2014-10-30   774  	switch (c->delivery_sys=
tem) {
f4df95bcbb7b142 nibble.max       2014-10-30   775  	case SYS_DVBS:
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   776  		if (dev->chip_id =3D=
=3D M88RS6000_CHIP_ID) {
f4df95bcbb7b142 nibble.max       2014-10-30   777  			len =3D ARRAY_SIZE(m8=
8rs6000_dvbs_init_reg_vals);
f4df95bcbb7b142 nibble.max       2014-10-30   778  			init =3D m88rs6000_dv=
bs_init_reg_vals;
f4df95bcbb7b142 nibble.max       2014-10-30   779  		} else {
f4df95bcbb7b142 nibble.max       2014-10-30   780  			len =3D ARRAY_SIZE(m8=
8ds3103_dvbs_init_reg_vals);
f4df95bcbb7b142 nibble.max       2014-10-30   781  			init =3D m88ds3103_dv=
bs_init_reg_vals;
f4df95bcbb7b142 nibble.max       2014-10-30   782  		}
f4df95bcbb7b142 nibble.max       2014-10-30   783  		break;
f4df95bcbb7b142 nibble.max       2014-10-30   784  	case SYS_DVBS2:
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   785  		if (dev->chip_id =3D=
=3D M88RS6000_CHIP_ID) {
f4df95bcbb7b142 nibble.max       2014-10-30   786  			len =3D ARRAY_SIZE(m8=
8rs6000_dvbs2_init_reg_vals);
f4df95bcbb7b142 nibble.max       2014-10-30   787  			init =3D m88rs6000_dv=
bs2_init_reg_vals;
f4df95bcbb7b142 nibble.max       2014-10-30   788  		} else {
f4df95bcbb7b142 nibble.max       2014-10-30   789  			len =3D ARRAY_SIZE(m8=
8ds3103_dvbs2_init_reg_vals);
f4df95bcbb7b142 nibble.max       2014-10-30   790  			init =3D m88ds3103_dv=
bs2_init_reg_vals;
f4df95bcbb7b142 nibble.max       2014-10-30   791  		}
395d00d1ca89478 Antti Palosaari  2013-02-25   792  		break;
395d00d1ca89478 Antti Palosaari  2013-02-25   793  	default:
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   794  		dev_dbg(&client->dev, =
"invalid delivery_system\n");
395d00d1ca89478 Antti Palosaari  2013-02-25   795  		ret =3D -EINVAL;
395d00d1ca89478 Antti Palosaari  2013-02-25   796  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   797  	}
395d00d1ca89478 Antti Palosaari  2013-02-25   798  =

395d00d1ca89478 Antti Palosaari  2013-02-25   799  	/* program init table */
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   800  	if (c->delivery_system =
!=3D dev->delivery_system) {
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   801  		ret =3D m88ds3103_wr_r=
eg_val_tab(dev, init, len);
395d00d1ca89478 Antti Palosaari  2013-02-25   802  		if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   803  			goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   804  	}
395d00d1ca89478 Antti Palosaari  2013-02-25   805  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   806  	if (dev->chip_id =3D=3D=
 M88RS6000_CHIP_ID) {
f5d9b88db7222bf Antti Palosaari  2016-06-29   807  		if (c->delivery_system=
 =3D=3D SYS_DVBS2 &&
f5d9b88db7222bf Antti Palosaari  2016-06-29   808  		    c->symbol_rate <=
=3D 5000000) {
478932b16052f5d Antti Palosaari  2015-04-16   809  			ret =3D regmap_write(=
dev->regmap, 0xc0, 0x04);
f4df95bcbb7b142 nibble.max       2014-10-30   810  			if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   811  				goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   812  			buf[0] =3D 0x09;
f4df95bcbb7b142 nibble.max       2014-10-30   813  			buf[1] =3D 0x22;
f4df95bcbb7b142 nibble.max       2014-10-30   814  			buf[2] =3D 0x88;
478932b16052f5d Antti Palosaari  2015-04-16   815  			ret =3D regmap_bulk_w=
rite(dev->regmap, 0x8a, buf, 3);
f4df95bcbb7b142 nibble.max       2014-10-30   816  			if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   817  				goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   818  		}
56ea37da3b93dfe Antti Palosaari  2015-10-03   819  		ret =3D m88ds3103_upda=
te_bits(dev, 0x9d, 0x08, 0x08);
f4df95bcbb7b142 nibble.max       2014-10-30   820  		if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   821  			goto err;
e6089feca460cb4 Brad Love        2020-02-01   822  =

e6089feca460cb4 Brad Love        2020-02-01   823  		if (dev->chiptype =3D=
=3D M88DS3103_CHIPTYPE_3103B) {
e6089feca460cb4 Brad Love        2020-02-01   824  			buf[0] =3D m88ds3103b=
_dt_read(dev, 0x15);
e6089feca460cb4 Brad Love        2020-02-01   825  			buf[1] =3D m88ds3103b=
_dt_read(dev, 0x16);
e6089feca460cb4 Brad Love        2020-02-01   826  =

e6089feca460cb4 Brad Love        2020-02-01   827  			if (c->symbol_rate > =
45010000) {
e6089feca460cb4 Brad Love        2020-02-01   828  				buf[0] &=3D ~0x03;
e6089feca460cb4 Brad Love        2020-02-01   829  				buf[0] |=3D 0x02;
e6089feca460cb4 Brad Love        2020-02-01   830  				buf[0] |=3D ((147 - =
32) >> 8) & 0x01;
e6089feca460cb4 Brad Love        2020-02-01   831  				buf[1] =3D (147 - 32=
) & 0xFF;
e6089feca460cb4 Brad Love        2020-02-01   832  =

e6089feca460cb4 Brad Love        2020-02-01   833  				dev->mclk =3D 110250=
 * 1000;
e6089feca460cb4 Brad Love        2020-02-01   834  			} else {
e6089feca460cb4 Brad Love        2020-02-01   835  				buf[0] &=3D ~0x03;
e6089feca460cb4 Brad Love        2020-02-01   836  				buf[0] |=3D ((128 - =
32) >> 8) & 0x01;
e6089feca460cb4 Brad Love        2020-02-01   837  				buf[1] =3D (128 - 32=
) & 0xFF;
e6089feca460cb4 Brad Love        2020-02-01   838  =

e6089feca460cb4 Brad Love        2020-02-01   839  				dev->mclk =3D 96000 =
* 1000;
e6089feca460cb4 Brad Love        2020-02-01   840  			}
e6089feca460cb4 Brad Love        2020-02-01   841  			m88ds3103b_dt_write(d=
ev, 0x15, buf[0]);
e6089feca460cb4 Brad Love        2020-02-01   842  			m88ds3103b_dt_write(d=
ev, 0x16, buf[1]);
e6089feca460cb4 Brad Love        2020-02-01   843  =

e6089feca460cb4 Brad Love        2020-02-01   844  			regmap_read(dev->regm=
ap, 0x30, &u32tmp);
e6089feca460cb4 Brad Love        2020-02-01   845  			u32tmp &=3D ~0x80;
e6089feca460cb4 Brad Love        2020-02-01   846  			regmap_write(dev->reg=
map, 0x30, u32tmp & 0xff);
e6089feca460cb4 Brad Love        2020-02-01   847  		}
e6089feca460cb4 Brad Love        2020-02-01   848  =

478932b16052f5d Antti Palosaari  2015-04-16   849  		ret =3D regmap_write(d=
ev->regmap, 0xf1, 0x01);
f4df95bcbb7b142 nibble.max       2014-10-30   850  		if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   851  			goto err;
e6089feca460cb4 Brad Love        2020-02-01   852  =

e6089feca460cb4 Brad Love        2020-02-01   853  		if (dev->chiptype !=3D=
 M88DS3103_CHIPTYPE_3103B) {
56ea37da3b93dfe Antti Palosaari  2015-10-03   854  			ret =3D m88ds3103_upd=
ate_bits(dev, 0x30, 0x80, 0x80);
f4df95bcbb7b142 nibble.max       2014-10-30   855  			if (ret)
f4df95bcbb7b142 nibble.max       2014-10-30   856  				goto err;
f4df95bcbb7b142 nibble.max       2014-10-30   857  		}
e6089feca460cb4 Brad Love        2020-02-01   858  	}
f4df95bcbb7b142 nibble.max       2014-10-30   859  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   860  	switch (dev->cfg->ts_mo=
de) {
395d00d1ca89478 Antti Palosaari  2013-02-25   861  	case M88DS3103_TS_SERIA=
L:
395d00d1ca89478 Antti Palosaari  2013-02-25   862  		u8tmp1 =3D 0x00;
79d0933032d657e nibble.max       2014-08-11   863  		u8tmp =3D 0x06;
395d00d1ca89478 Antti Palosaari  2013-02-25   864  		break;
395d00d1ca89478 Antti Palosaari  2013-02-25   865  	case M88DS3103_TS_SERIA=
L_D7:
395d00d1ca89478 Antti Palosaari  2013-02-25   866  		u8tmp1 =3D 0x20;
79d0933032d657e nibble.max       2014-08-11   867  		u8tmp =3D 0x06;
395d00d1ca89478 Antti Palosaari  2013-02-25   868  		break;
395d00d1ca89478 Antti Palosaari  2013-02-25   869  	case M88DS3103_TS_PARAL=
LEL:
79d0933032d657e nibble.max       2014-08-11   870  		u8tmp =3D 0x02;
e6089feca460cb4 Brad Love        2020-02-01   871  		if (dev->chiptype =3D=
=3D M88DS3103_CHIPTYPE_3103B) {
e6089feca460cb4 Brad Love        2020-02-01   872  			u8tmp =3D 0x01;
e6089feca460cb4 Brad Love        2020-02-01   873  			u8tmp1 =3D 0x01;
e6089feca460cb4 Brad Love        2020-02-01   874  		}
395d00d1ca89478 Antti Palosaari  2013-02-25   875  		break;
395d00d1ca89478 Antti Palosaari  2013-02-25   876  	case M88DS3103_TS_CI:
79d0933032d657e nibble.max       2014-08-11   877  		u8tmp =3D 0x03;
395d00d1ca89478 Antti Palosaari  2013-02-25   878  		break;
395d00d1ca89478 Antti Palosaari  2013-02-25   879  	default:
7978b8a1bc8ae0f Antti Palosaari  2015-04-16   880  		dev_dbg(&client->dev, =
"invalid ts_mode\n");
395d00d1ca89478 Antti Palosaari  2013-02-25   881  		ret =3D -EINVAL;
395d00d1ca89478 Antti Palosaari  2013-02-25   882  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   883  	}
395d00d1ca89478 Antti Palosaari  2013-02-25   884  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   885  	if (dev->cfg->ts_clk_po=
l)
79d0933032d657e nibble.max       2014-08-11   886  		u8tmp |=3D 0x40;
79d0933032d657e nibble.max       2014-08-11   887  =

395d00d1ca89478 Antti Palosaari  2013-02-25   888  	/* TS mode */
478932b16052f5d Antti Palosaari  2015-04-16   889  	ret =3D regmap_write(de=
v->regmap, 0xfd, u8tmp);
395d00d1ca89478 Antti Palosaari  2013-02-25   890  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   891  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   892  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   893  	switch (dev->cfg->ts_mo=
de) {
395d00d1ca89478 Antti Palosaari  2013-02-25   894  	case M88DS3103_TS_SERIA=
L:
395d00d1ca89478 Antti Palosaari  2013-02-25   895  	case M88DS3103_TS_SERIA=
L_D7:
56ea37da3b93dfe Antti Palosaari  2015-10-03   896  		ret =3D m88ds3103_upda=
te_bits(dev, 0x29, 0x20, u8tmp1);
395d00d1ca89478 Antti Palosaari  2013-02-25   897  		if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   898  			goto err;
334ef18e879980e Antti Palosaari  2016-06-29   899  		u16tmp =3D 0;
334ef18e879980e Antti Palosaari  2016-06-29   900  		u8tmp1 =3D 0x3f;
334ef18e879980e Antti Palosaari  2016-06-29   901  		u8tmp2 =3D 0x3f;
b6851419409664b nibble.max       2014-11-05   902  		break;
e6089feca460cb4 Brad Love        2020-02-01   903  	case M88DS3103_TS_PARAL=
LEL:
e6089feca460cb4 Brad Love        2020-02-01   904  		if (dev->chiptype =3D=
=3D M88DS3103_CHIPTYPE_3103B) {
e6089feca460cb4 Brad Love        2020-02-01   905  			ret =3D m88ds3103_upd=
ate_bits(dev, 0x29, 0x01, u8tmp1);
e6089feca460cb4 Brad Love        2020-02-01   906  			if (ret)
e6089feca460cb4 Brad Love        2020-02-01   907  				goto err;
e6089feca460cb4 Brad Love        2020-02-01   908  		}
e6089feca460cb4 Brad Love        2020-02-01   909  		/* fall through */
b6851419409664b nibble.max       2014-11-05  @910  	default:
334ef18e879980e Antti Palosaari  2016-06-29   911  		u16tmp =3D DIV_ROUND_U=
P(target_mclk, dev->cfg->ts_clk);
334ef18e879980e Antti Palosaari  2016-06-29   912  		u8tmp1 =3D u16tmp / 2 =
- 1;
334ef18e879980e Antti Palosaari  2016-06-29   913  		u8tmp2 =3D DIV_ROUND_U=
P(u16tmp, 2) - 1;
395d00d1ca89478 Antti Palosaari  2013-02-25   914  	}
395d00d1ca89478 Antti Palosaari  2013-02-25   915  =

f5d9b88db7222bf Antti Palosaari  2016-06-29   916  	dev_dbg(&client->dev, "=
target_mclk=3D%u ts_clk=3D%u ts_clk_divide_ratio=3D%u\n",
334ef18e879980e Antti Palosaari  2016-06-29   917  		target_mclk, dev->cfg-=
>ts_clk, u16tmp);
395d00d1ca89478 Antti Palosaari  2013-02-25   918  =

395d00d1ca89478 Antti Palosaari  2013-02-25   919  	/* u8tmp1[5:2] =3D> fe[=
3:0], u8tmp1[1:0] =3D> ea[7:6] */
395d00d1ca89478 Antti Palosaari  2013-02-25   920  	/* u8tmp2[5:0] =3D> ea[=
5:0] */
334ef18e879980e Antti Palosaari  2016-06-29   921  	u8tmp =3D (u8tmp1 >> 2)=
 & 0x0f;
334ef18e879980e Antti Palosaari  2016-06-29   922  	ret =3D regmap_update_b=
its(dev->regmap, 0xfe, 0x0f, u8tmp);
395d00d1ca89478 Antti Palosaari  2013-02-25   923  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   924  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   925  	u8tmp =3D ((u8tmp1 & 0x=
03) << 6) | u8tmp2 >> 0;
478932b16052f5d Antti Palosaari  2015-04-16   926  	ret =3D regmap_write(de=
v->regmap, 0xea, u8tmp);
395d00d1ca89478 Antti Palosaari  2013-02-25   927  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   928  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   929  =

395d00d1ca89478 Antti Palosaari  2013-02-25   930  	if (c->symbol_rate <=3D=
 3000000)
395d00d1ca89478 Antti Palosaari  2013-02-25   931  		u8tmp =3D 0x20;
395d00d1ca89478 Antti Palosaari  2013-02-25   932  	else if (c->symbol_rate=
 <=3D 10000000)
395d00d1ca89478 Antti Palosaari  2013-02-25   933  		u8tmp =3D 0x10;
395d00d1ca89478 Antti Palosaari  2013-02-25   934  	else
395d00d1ca89478 Antti Palosaari  2013-02-25   935  		u8tmp =3D 0x06;
395d00d1ca89478 Antti Palosaari  2013-02-25   936  =

e6089feca460cb4 Brad Love        2020-02-01   937  	if (dev->chiptype =3D=
=3D M88DS3103_CHIPTYPE_3103B)
e6089feca460cb4 Brad Love        2020-02-01   938  		m88ds3103b_set_mclk(de=
v, target_mclk / 1000);
e6089feca460cb4 Brad Love        2020-02-01   939  =

478932b16052f5d Antti Palosaari  2015-04-16   940  	ret =3D regmap_write(de=
v->regmap, 0xc3, 0x08);
395d00d1ca89478 Antti Palosaari  2013-02-25   941  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   942  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   943  =

478932b16052f5d Antti Palosaari  2015-04-16   944  	ret =3D regmap_write(de=
v->regmap, 0xc8, u8tmp);
395d00d1ca89478 Antti Palosaari  2013-02-25   945  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   946  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   947  =

478932b16052f5d Antti Palosaari  2015-04-16   948  	ret =3D regmap_write(de=
v->regmap, 0xc4, 0x08);
395d00d1ca89478 Antti Palosaari  2013-02-25   949  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   950  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   951  =

478932b16052f5d Antti Palosaari  2015-04-16   952  	ret =3D regmap_write(de=
v->regmap, 0xc7, 0x00);
395d00d1ca89478 Antti Palosaari  2013-02-25   953  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   954  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   955  =

f5d9b88db7222bf Antti Palosaari  2016-06-29   956  	u16tmp =3D DIV_ROUND_CL=
OSEST_ULL((u64)c->symbol_rate * 0x10000, dev->mclk);
395d00d1ca89478 Antti Palosaari  2013-02-25   957  	buf[0] =3D (u16tmp >> 0=
) & 0xff;
395d00d1ca89478 Antti Palosaari  2013-02-25   958  	buf[1] =3D (u16tmp >> 8=
) & 0xff;
478932b16052f5d Antti Palosaari  2015-04-16   959  	ret =3D regmap_bulk_wri=
te(dev->regmap, 0x61, buf, 2);
395d00d1ca89478 Antti Palosaari  2013-02-25   960  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   961  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   962  =

56ea37da3b93dfe Antti Palosaari  2015-10-03   963  	ret =3D m88ds3103_updat=
e_bits(dev, 0x4d, 0x02, dev->cfg->spec_inv << 1);
395d00d1ca89478 Antti Palosaari  2013-02-25   964  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   965  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   966  =

56ea37da3b93dfe Antti Palosaari  2015-10-03   967  	ret =3D m88ds3103_updat=
e_bits(dev, 0x30, 0x10, dev->cfg->agc_inv << 4);
395d00d1ca89478 Antti Palosaari  2013-02-25   968  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   969  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   970  =

478932b16052f5d Antti Palosaari  2015-04-16   971  	ret =3D regmap_write(de=
v->regmap, 0x33, dev->cfg->agc);
395d00d1ca89478 Antti Palosaari  2013-02-25   972  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   973  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   974  =

e6089feca460cb4 Brad Love        2020-02-01   975  	if (dev->chiptype =3D=
=3D M88DS3103_CHIPTYPE_3103B) {
e6089feca460cb4 Brad Love        2020-02-01   976  		/* enable/disable 192M=
 LDPC clock */
e6089feca460cb4 Brad Love        2020-02-01   977  		ret =3D m88ds3103_upda=
te_bits(dev, 0x29, 0x10,
e6089feca460cb4 Brad Love        2020-02-01   978  				(c->delivery_system =
=3D=3D SYS_DVBS) ? 0x10 : 0x0);
e6089feca460cb4 Brad Love        2020-02-01   979  		if (ret)
e6089feca460cb4 Brad Love        2020-02-01   980  			goto err;
e6089feca460cb4 Brad Love        2020-02-01   981  =

e6089feca460cb4 Brad Love        2020-02-01   982  		ret =3D m88ds3103_upda=
te_bits(dev, 0xc9, 0x08, 0x08);
c4ed27cfed45c16 Sean Young       2020-04-16   983  		if (ret)
c4ed27cfed45c16 Sean Young       2020-04-16   984  			goto err;
e6089feca460cb4 Brad Love        2020-02-01   985  	}
e6089feca460cb4 Brad Love        2020-02-01   986  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16   987  	dev_dbg(&client->dev, "=
carrier offset=3D%d\n",
f5d9b88db7222bf Antti Palosaari  2016-06-29   988  		(tuner_frequency_khz -=
 c->frequency));
395d00d1ca89478 Antti Palosaari  2013-02-25   989  =

f5d9b88db7222bf Antti Palosaari  2016-06-29   990  	/* Use 32-bit calc as t=
here is no s64 version of DIV_ROUND_CLOSEST() */
f5d9b88db7222bf Antti Palosaari  2016-06-29   991  	s32tmp =3D 0x10000 * (t=
uner_frequency_khz - c->frequency);
f5d9b88db7222bf Antti Palosaari  2016-06-29   992  	s32tmp =3D DIV_ROUND_CL=
OSEST(s32tmp, dev->mclk / 1000);
395d00d1ca89478 Antti Palosaari  2013-02-25   993  	buf[0] =3D (s32tmp >> 0=
) & 0xff;
395d00d1ca89478 Antti Palosaari  2013-02-25   994  	buf[1] =3D (s32tmp >> 8=
) & 0xff;
478932b16052f5d Antti Palosaari  2015-04-16   995  	ret =3D regmap_bulk_wri=
te(dev->regmap, 0x5e, buf, 2);
395d00d1ca89478 Antti Palosaari  2013-02-25   996  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25   997  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25   998  =

478932b16052f5d Antti Palosaari  2015-04-16   999  	ret =3D regmap_write(de=
v->regmap, 0x00, 0x00);
395d00d1ca89478 Antti Palosaari  2013-02-25  1000  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25  1001  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25  1002  =

478932b16052f5d Antti Palosaari  2015-04-16  1003  	ret =3D regmap_write(de=
v->regmap, 0xb2, 0x00);
395d00d1ca89478 Antti Palosaari  2013-02-25  1004  	if (ret)
395d00d1ca89478 Antti Palosaari  2013-02-25  1005  		goto err;
395d00d1ca89478 Antti Palosaari  2013-02-25  1006  =

7978b8a1bc8ae0f Antti Palosaari  2015-04-16  1007  	dev->delivery_system =
=3D c->delivery_system;
395d00d1ca89478 Antti Palosaari  2013-02-25  1008  =

395d00d1ca89478 Antti Palosaari  2013-02-25  1009  	return 0;
395d00d1ca89478 Antti Palosaari  2013-02-25  1010  err:
7978b8a1bc8ae0f Antti Palosaari  2015-04-16  1011  	dev_dbg(&client->dev, "=
failed=3D%d\n", ret);
395d00d1ca89478 Antti Palosaari  2013-02-25  1012  	return ret;
395d00d1ca89478 Antti Palosaari  2013-02-25  1013  }
395d00d1ca89478 Antti Palosaari  2013-02-25  1014  =


:::::: The code at line 910 was first introduced by commit
:::::: b6851419409664bc564ce5148bbec1141944c710 [media] m88ds3103: change t=
s clock config for serial mode

:::::: TO: nibble.max <nibble.max@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0131854163526733526==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICAzrf18AAy5jb25maWcAjDxLe9u2svv+Cn3ppmfR1HYc3/SezwuQBEVUJMEApCx5w09V5Byf
OnaubLfJv78zAB8AOFTbRWrODN7zxkA//vDjgr2+PH3Zvdzvdw8P3xefD4+H4+7l8Glxd/9w+Pci
kYtS1gueiPotEOf3j6/ffvn24aq9uly8f/vr27Ofj/v/WawOx8fDwyJ+ery7//wK7e+fHn/48YdY
lqlYtnHcrrnSQpZtzTf19Zv9w+7x8+LPw/EZ6BbnF2/P3p4tfvp8//K/v/wC/365Px6fjr88PPz5
pf16fPrvYf+yuNzf7S/PLt7v9+eX797td+8Pd+f79xdXZ+/f3e1/3V/+fne4ujw/+/Vfb/pRl+Ow
12c9ME+mMKATuo1zVi6vvzuEAMzzZAQZiqH5+cUZ/Of0EbOyzUW5chqMwFbXrBaxh8uYbpku2qWs
5SyilU1dNTWJFyV0zR2ULHWtmriWSo9QoT62N1I584oakSe1KHhbsyjnrZbKGaDOFGew+jKV8A+Q
aGwKp/njYmmY42HxfHh5/Tqeb6TkipctHK8uKmfgUtQtL9ctU7CfohD19bsL6GWYbVEJGL3mul7c
Py8en16w45GgYZVoM5gLVxOi/pRkzPL+RN68ocAta9ztNWtvNctrhz5ja96uuCp53i5vhbMGFxMB
5oJG5bcFozGb27kWcg5xSSNudY3MOGyPM19y+9xZE1vnzzxstbk91SdM/jT68hQaF0JMKOEpa/La
sI1zNj04k7ouWcGv3/z0+PR4ADkf+tU3jN4CvdVrUcXEYJXUYtMWHxveOALkQrFxXOfu3tywOs5a
gyWHi5XUui14IdW2ZXXN4oxmbM1zERGzYg2o2eD0mYIxDQInxPJ8xAdQI6Ig7Yvn19+fvz+/HL6M
IrrkJVciNsqgUjJyFu2idCZv3PFVAlANG9wqrnmZ+FolkQUTpQ/ToqCI2kxwhUvZ0gMXrFaw9bAQ
EF3QXzQVTkKtQZGCWBcy4f5IqVQxTzr9JVxlriumNEci9zjdnhMeNctU+8d1ePy0eLoLtnS0BjJe
adnAmJYxEumMaE7NJTFc/Z1qvGa5SFjN25zpuo23cU4cjtHW6wkH9GjTH1/zstYnkaiqWRLDQKfJ
CjgxlvzWkHSF1G1T4ZQDVrXiE1eNma7SxnYEtuckjeHg+v4LOAYUE4MBXYGV4cClrpTcthVMTCbG
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
--===============0131854163526733526==--

