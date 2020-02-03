Content-Type: multipart/mixed; boundary="===============4092919154879156425=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/3] m88ds3103: Add support for ds3103b demod
Date: Mon, 03 Feb 2020 19:09:00 +0800
Message-ID: <202002031833.UMAtmy8J%lkp@intel.com>
In-Reply-To: <20200201214826.22873-2-brad@nextdimension.cc>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4092919154879156425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Brad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.5 next-20200203]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Brad-Love/m88ds3103-Add-su=
pport-for-Montage-3103b-DVB-S-demod/20200203-135639
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-d002-20200202 (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/current.h:5:0,
                    from include/linux/sched.h:12,
                    from include/media/dvb_frontend.h:36,
                    from drivers/media/dvb-frontends/m88ds3103_priv.h:11,
                    from drivers/media/dvb-frontends/m88ds3103.c:8:
   drivers/media/dvb-frontends/m88ds3103.c: In function 'm88ds3103_set_fron=
tend':
   include/linux/compiler.h:56:26: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                             ^
>> drivers/media/dvb-frontends/m88ds3103.c:906:3: note: in expansion of mac=
ro 'if'
      if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
      ^~
   drivers/media/dvb-frontends/m88ds3103.c:911:2: note: here
     default:
     ^~~~~~~
   Cyclomatic Complexity 1 arch/x86/include/asm/bitops.h:fls64
   Cyclomatic Complexity 1 include/linux/log2.h:__ilog2_u64
   Cyclomatic Complexity 1 include/linux/math64.h:div_u64_rem
   Cyclomatic Complexity 1 include/linux/math64.h:div_s64_rem
   Cyclomatic Complexity 1 include/linux/math64.h:div_u64
   Cyclomatic Complexity 1 include/linux/math64.h:div_s64
   Cyclomatic Complexity 1 include/linux/err.h:PTR_ERR
   Cyclomatic Complexity 1 include/linux/jiffies.h:_msecs_to_jiffies
   Cyclomatic Complexity 7 include/linux/jiffies.h:msecs_to_jiffies
   Cyclomatic Complexity 4 include/linux/slab.h:kmalloc_type
   Cyclomatic Complexity 84 include/linux/slab.h:kmalloc_index
   Cyclomatic Complexity 1 include/linux/slab.h:kmalloc_large
   Cyclomatic Complexity 10 include/linux/slab.h:kmalloc
   Cyclomatic Complexity 1 include/linux/slab.h:kzalloc
   Cyclomatic Complexity 1 include/linux/device.h:dev_get_drvdata
   Cyclomatic Complexity 1 include/linux/device.h:dev_set_drvdata
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_get_clientdata
   Cyclomatic Complexity 1 include/linux/i2c.h:i2c_set_clientdata
   Cyclomatic Complexity 1 include/linux/i2c-mux.h:i2c_mux_priv
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_read_ber
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_get_tune_settings
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_get_dvb_frontend
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_get_i2c_adapter
   Cyclomatic Complexity 4 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_get_agc_pwm
   Cyclomatic Complexity 4 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_read_snr
   Cyclomatic Complexity 74 include/asm-generic/getorder.h:get_order
   Cyclomatic Complexity 3 include/linux/err.h:IS_ERR_OR_NULL
   Cyclomatic Complexity 3 include/linux/i2c.h:i2c_client_has_driver
   Cyclomatic Complexity 3 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_attach
   Cyclomatic Complexity 1 include/linux/err.h:IS_ERR
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_driver_init
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_release
   Cyclomatic Complexity 4 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_remove
   Cyclomatic Complexity 19 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_wr_reg_val_tab
   Cyclomatic Complexity 56 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_get_frontend
   Cyclomatic Complexity 7 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_update_bits
   Cyclomatic Complexity 56 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_probe
   Cyclomatic Complexity 10 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_set_voltage
   Cyclomatic Complexity 12 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_set_tone
   Cyclomatic Complexity 31 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_diseqc_send_burst
   Cyclomatic Complexity 35 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_diseqc_send_master_cmd
   Cyclomatic Complexity 16 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_sleep
   Cyclomatic Complexity 82 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_read_status
   Cyclomatic Complexity 6 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3b_dt_read
   Cyclomatic Complexity 6 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3b_dt_write
   Cyclomatic Complexity 30 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03b_select_mclk
   Cyclomatic Complexity 79 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03b_set_mclk
   Cyclomatic Complexity 210 drivers/media/dvb-frontends/m88ds3103.c:m88ds3=
103_set_frontend
   Cyclomatic Complexity 50 drivers/media/dvb-frontends/m88ds3103.c:m88ds31=
03_init
   Cyclomatic Complexity 7 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_select
   Cyclomatic Complexity 1 drivers/media/dvb-frontends/m88ds3103.c:m88ds310=
3_driver_exit

vim +/if +906 drivers/media/dvb-frontends/m88ds3103.c

   623	=

   624	static int m88ds3103_set_frontend(struct dvb_frontend *fe)
   625	{
   626		struct m88ds3103_dev *dev =3D fe->demodulator_priv;
   627		struct i2c_client *client =3D dev->client;
   628		struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
   629		int ret, len;
   630		const struct m88ds3103_reg_val *init;
   631		u8 u8tmp, u8tmp1 =3D 0, u8tmp2 =3D 0; /* silence compiler warning */
   632		u8 buf[3];
   633		u16 u16tmp;
   634		u32 tuner_frequency_khz, target_mclk, u32tmp;
   635		s32 s32tmp;
   636		static const struct reg_sequence reset_buf[] =3D {
   637			{0x07, 0x80}, {0x07, 0x00}
   638		};
   639	=

   640		dev_dbg(&client->dev,
   641			"delivery_system=3D%d modulation=3D%d frequency=3D%u symbol_rate=
=3D%d inversion=3D%d pilot=3D%d rolloff=3D%d\n",
   642			c->delivery_system, c->modulation, c->frequency, c->symbol_rate,
   643			c->inversion, c->pilot, c->rolloff);
   644	=

   645		if (!dev->warm) {
   646			ret =3D -EAGAIN;
   647			goto err;
   648		}
   649	=

   650		/* reset */
   651		ret =3D regmap_multi_reg_write(dev->regmap, reset_buf, 2);
   652		if (ret)
   653			goto err;
   654	=

   655		/* Disable demod clock path */
   656		if (dev->chip_id =3D=3D M88RS6000_CHIP_ID) {
   657			if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
   658				ret =3D regmap_read(dev->regmap, 0xb2, &u32tmp);
   659				if (ret)
   660					goto err;
   661				if (u32tmp =3D=3D 0x01) {
   662					ret =3D regmap_write(dev->regmap, 0x00, 0x00);
   663					if (ret)
   664						goto err;
   665					ret =3D regmap_write(dev->regmap, 0xb2, 0x00);
   666					if (ret)
   667						goto err;
   668				}
   669			}
   670	=

   671			ret =3D regmap_write(dev->regmap, 0x06, 0xe0);
   672			if (ret)
   673				goto err;
   674		}
   675	=

   676		/* program tuner */
   677		if (fe->ops.tuner_ops.set_params) {
   678			ret =3D fe->ops.tuner_ops.set_params(fe);
   679			if (ret)
   680				goto err;
   681		}
   682	=

   683		if (fe->ops.tuner_ops.get_frequency) {
   684			ret =3D fe->ops.tuner_ops.get_frequency(fe, &tuner_frequency_khz);
   685			if (ret)
   686				goto err;
   687		} else {
   688			/*
   689			 * Use nominal target frequency as tuner driver does not provide
   690			 * actual frequency used. Carrier offset calculation is not
   691			 * valid.
   692			 */
   693			tuner_frequency_khz =3D c->frequency;
   694		}
   695	=

   696		/* set M88RS6000/DS3103B demod main mclk and ts mclk from tuner die=
 */
   697		if (dev->chip_id =3D=3D M88RS6000_CHIP_ID) {
   698			if (c->symbol_rate > 45010000)
   699				dev->mclk =3D 110250000;
   700			else
   701				dev->mclk =3D 96000000;
   702	=

   703			if (c->delivery_system =3D=3D SYS_DVBS)
   704				target_mclk =3D 96000000;
   705			else
   706				target_mclk =3D 144000000;
   707	=

   708			if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
   709				m88ds3103b_select_mclk(dev);
   710				m88ds3103b_set_mclk(dev, target_mclk / 1000);
   711			}
   712	=

   713			/* Enable demod clock path */
   714			ret =3D regmap_write(dev->regmap, 0x06, 0x00);
   715			if (ret)
   716				goto err;
   717			usleep_range(10000, 20000);
   718		} else {
   719		/* set M88DS3103 mclk and ts mclk. */
   720			dev->mclk =3D 96000000;
   721	=

   722			switch (dev->cfg->ts_mode) {
   723			case M88DS3103_TS_SERIAL:
   724			case M88DS3103_TS_SERIAL_D7:
   725				target_mclk =3D dev->cfg->ts_clk;
   726				break;
   727			case M88DS3103_TS_PARALLEL:
   728			case M88DS3103_TS_CI:
   729				if (c->delivery_system =3D=3D SYS_DVBS)
   730					target_mclk =3D 96000000;
   731				else {
   732					if (c->symbol_rate < 18000000)
   733						target_mclk =3D 96000000;
   734					else if (c->symbol_rate < 28000000)
   735						target_mclk =3D 144000000;
   736					else
   737						target_mclk =3D 192000000;
   738				}
   739				break;
   740			default:
   741				dev_dbg(&client->dev, "invalid ts_mode\n");
   742				ret =3D -EINVAL;
   743				goto err;
   744			}
   745	=

   746			switch (target_mclk) {
   747			case 96000000:
   748				u8tmp1 =3D 0x02; /* 0b10 */
   749				u8tmp2 =3D 0x01; /* 0b01 */
   750				break;
   751			case 144000000:
   752				u8tmp1 =3D 0x00; /* 0b00 */
   753				u8tmp2 =3D 0x01; /* 0b01 */
   754				break;
   755			case 192000000:
   756				u8tmp1 =3D 0x03; /* 0b11 */
   757				u8tmp2 =3D 0x00; /* 0b00 */
   758				break;
   759			}
   760			ret =3D m88ds3103_update_bits(dev, 0x22, 0xc0, u8tmp1 << 6);
   761			if (ret)
   762				goto err;
   763			ret =3D m88ds3103_update_bits(dev, 0x24, 0xc0, u8tmp2 << 6);
   764			if (ret)
   765				goto err;
   766		}
   767	=

   768		ret =3D regmap_write(dev->regmap, 0xb2, 0x01);
   769		if (ret)
   770			goto err;
   771	=

   772		ret =3D regmap_write(dev->regmap, 0x00, 0x01);
   773		if (ret)
   774			goto err;
   775	=

   776		switch (c->delivery_system) {
   777		case SYS_DVBS:
   778			if (dev->chip_id =3D=3D M88RS6000_CHIP_ID) {
   779				len =3D ARRAY_SIZE(m88rs6000_dvbs_init_reg_vals);
   780				init =3D m88rs6000_dvbs_init_reg_vals;
   781			} else {
   782				len =3D ARRAY_SIZE(m88ds3103_dvbs_init_reg_vals);
   783				init =3D m88ds3103_dvbs_init_reg_vals;
   784			}
   785			break;
   786		case SYS_DVBS2:
   787			if (dev->chip_id =3D=3D M88RS6000_CHIP_ID) {
   788				len =3D ARRAY_SIZE(m88rs6000_dvbs2_init_reg_vals);
   789				init =3D m88rs6000_dvbs2_init_reg_vals;
   790			} else {
   791				len =3D ARRAY_SIZE(m88ds3103_dvbs2_init_reg_vals);
   792				init =3D m88ds3103_dvbs2_init_reg_vals;
   793			}
   794			break;
   795		default:
   796			dev_dbg(&client->dev, "invalid delivery_system\n");
   797			ret =3D -EINVAL;
   798			goto err;
   799		}
   800	=

   801		/* program init table */
   802		if (c->delivery_system !=3D dev->delivery_system) {
   803			ret =3D m88ds3103_wr_reg_val_tab(dev, init, len);
   804			if (ret)
   805				goto err;
   806		}
   807	=

   808		if (dev->chip_id =3D=3D M88RS6000_CHIP_ID) {
   809			if (c->delivery_system =3D=3D SYS_DVBS2 &&
   810			    c->symbol_rate <=3D 5000000) {
   811				ret =3D regmap_write(dev->regmap, 0xc0, 0x04);
   812				if (ret)
   813					goto err;
   814				buf[0] =3D 0x09;
   815				buf[1] =3D 0x22;
   816				buf[2] =3D 0x88;
   817				ret =3D regmap_bulk_write(dev->regmap, 0x8a, buf, 3);
   818				if (ret)
   819					goto err;
   820			}
   821			ret =3D m88ds3103_update_bits(dev, 0x9d, 0x08, 0x08);
   822			if (ret)
   823				goto err;
   824	=

   825			if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
   826				buf[0] =3D m88ds3103b_dt_read(dev, 0x15);
   827				buf[1] =3D m88ds3103b_dt_read(dev, 0x16);
   828	=

   829				if (c->symbol_rate > 45010000) {
   830					buf[0] &=3D ~0x03;
   831					buf[0] |=3D 0x02;
   832					buf[0] |=3D ((147 - 32) >> 8) & 0x01;
   833					buf[1] =3D (147 - 32) & 0xFF;
   834	=

   835					dev->mclk =3D 110250 * 1000;
   836				} else {
   837					buf[0] &=3D ~0x03;
   838					buf[0] |=3D ((128 - 32) >> 8) & 0x01;
   839					buf[1] =3D (128 - 32) & 0xFF;
   840	=

   841					dev->mclk =3D 96000 * 1000;
   842				}
   843				m88ds3103b_dt_write(dev, 0x15, buf[0]);
   844				m88ds3103b_dt_write(dev, 0x16, buf[1]);
   845	=

   846				regmap_read(dev->regmap, 0x30, &u32tmp);
   847				u32tmp &=3D ~0x80;
   848				regmap_write(dev->regmap, 0x30, u32tmp & 0xff);
   849			}
   850	=

   851			ret =3D regmap_write(dev->regmap, 0xf1, 0x01);
   852			if (ret)
   853				goto err;
   854	=

   855			if (dev->chiptype !=3D M88DS3103_CHIPTYPE_3103B) {
   856				ret =3D m88ds3103_update_bits(dev, 0x30, 0x80, 0x80);
   857				if (ret)
   858					goto err;
   859			}
   860		}
   861	=

   862		switch (dev->cfg->ts_mode) {
   863		case M88DS3103_TS_SERIAL:
   864			u8tmp1 =3D 0x00;
   865			u8tmp =3D 0x06;
   866			break;
   867		case M88DS3103_TS_SERIAL_D7:
   868			u8tmp1 =3D 0x20;
   869			u8tmp =3D 0x06;
   870			break;
   871		case M88DS3103_TS_PARALLEL:
   872			u8tmp =3D 0x02;
   873			if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
   874				u8tmp =3D 0x01;
   875				u8tmp1 =3D 0x01;
   876			}
   877			break;
   878		case M88DS3103_TS_CI:
   879			u8tmp =3D 0x03;
   880			break;
   881		default:
   882			dev_dbg(&client->dev, "invalid ts_mode\n");
   883			ret =3D -EINVAL;
   884			goto err;
   885		}
   886	=

   887		if (dev->cfg->ts_clk_pol)
   888			u8tmp |=3D 0x40;
   889	=

   890		/* TS mode */
   891		ret =3D regmap_write(dev->regmap, 0xfd, u8tmp);
   892		if (ret)
   893			goto err;
   894	=

   895		switch (dev->cfg->ts_mode) {
   896		case M88DS3103_TS_SERIAL:
   897		case M88DS3103_TS_SERIAL_D7:
   898			ret =3D m88ds3103_update_bits(dev, 0x29, 0x20, u8tmp1);
   899			if (ret)
   900				goto err;
   901			u16tmp =3D 0;
   902			u8tmp1 =3D 0x3f;
   903			u8tmp2 =3D 0x3f;
   904			break;
   905		case M88DS3103_TS_PARALLEL:
 > 906			if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
   907				ret =3D m88ds3103_update_bits(dev, 0x29, 0x01, u8tmp1);
   908				if (ret)
   909					goto err;
   910			}
   911		default:
   912			u16tmp =3D DIV_ROUND_UP(target_mclk, dev->cfg->ts_clk);
   913			u8tmp1 =3D u16tmp / 2 - 1;
   914			u8tmp2 =3D DIV_ROUND_UP(u16tmp, 2) - 1;
   915		}
   916	=

   917		dev_dbg(&client->dev, "target_mclk=3D%u ts_clk=3D%u ts_clk_divide_r=
atio=3D%u\n",
   918			target_mclk, dev->cfg->ts_clk, u16tmp);
   919	=

   920		/* u8tmp1[5:2] =3D> fe[3:0], u8tmp1[1:0] =3D> ea[7:6] */
   921		/* u8tmp2[5:0] =3D> ea[5:0] */
   922		u8tmp =3D (u8tmp1 >> 2) & 0x0f;
   923		ret =3D regmap_update_bits(dev->regmap, 0xfe, 0x0f, u8tmp);
   924		if (ret)
   925			goto err;
   926		u8tmp =3D ((u8tmp1 & 0x03) << 6) | u8tmp2 >> 0;
   927		ret =3D regmap_write(dev->regmap, 0xea, u8tmp);
   928		if (ret)
   929			goto err;
   930	=

   931		if (c->symbol_rate <=3D 3000000)
   932			u8tmp =3D 0x20;
   933		else if (c->symbol_rate <=3D 10000000)
   934			u8tmp =3D 0x10;
   935		else
   936			u8tmp =3D 0x06;
   937	=

   938		if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B)
   939			m88ds3103b_set_mclk(dev, target_mclk / 1000);
   940	=

   941		ret =3D regmap_write(dev->regmap, 0xc3, 0x08);
   942		if (ret)
   943			goto err;
   944	=

   945		ret =3D regmap_write(dev->regmap, 0xc8, u8tmp);
   946		if (ret)
   947			goto err;
   948	=

   949		ret =3D regmap_write(dev->regmap, 0xc4, 0x08);
   950		if (ret)
   951			goto err;
   952	=

   953		ret =3D regmap_write(dev->regmap, 0xc7, 0x00);
   954		if (ret)
   955			goto err;
   956	=

   957		u16tmp =3D DIV_ROUND_CLOSEST_ULL((u64)c->symbol_rate * 0x10000, dev=
->mclk);
   958		buf[0] =3D (u16tmp >> 0) & 0xff;
   959		buf[1] =3D (u16tmp >> 8) & 0xff;
   960		ret =3D regmap_bulk_write(dev->regmap, 0x61, buf, 2);
   961		if (ret)
   962			goto err;
   963	=

   964		ret =3D m88ds3103_update_bits(dev, 0x4d, 0x02, dev->cfg->spec_inv <=
< 1);
   965		if (ret)
   966			goto err;
   967	=

   968		ret =3D m88ds3103_update_bits(dev, 0x30, 0x10, dev->cfg->agc_inv <<=
 4);
   969		if (ret)
   970			goto err;
   971	=

   972		ret =3D regmap_write(dev->regmap, 0x33, dev->cfg->agc);
   973		if (ret)
   974			goto err;
   975	=

   976		if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
   977			/* enable/disable 192M LDPC clock */
   978			ret =3D m88ds3103_update_bits(dev, 0x29, 0x10,
   979						(c->delivery_system =3D=3D SYS_DVBS) ? 0x10 : 0x0);
   980			if (ret)
   981				goto err;
   982	=

   983			ret =3D m88ds3103_update_bits(dev, 0xc9, 0x08, 0x08);
   984		}
   985	=

   986		dev_dbg(&client->dev, "carrier offset=3D%d\n",
   987			(tuner_frequency_khz - c->frequency));
   988	=

   989		/* Use 32-bit calc as there is no s64 version of DIV_ROUND_CLOSEST(=
) */
   990		s32tmp =3D 0x10000 * (tuner_frequency_khz - c->frequency);
   991		s32tmp =3D DIV_ROUND_CLOSEST(s32tmp, dev->mclk / 1000);
   992		buf[0] =3D (s32tmp >> 0) & 0xff;
   993		buf[1] =3D (s32tmp >> 8) & 0xff;
   994		ret =3D regmap_bulk_write(dev->regmap, 0x5e, buf, 2);
   995		if (ret)
   996			goto err;
   997	=

   998		ret =3D regmap_write(dev->regmap, 0x00, 0x00);
   999		if (ret)
  1000			goto err;
  1001	=

  1002		ret =3D regmap_write(dev->regmap, 0xb2, 0x00);
  1003		if (ret)
  1004			goto err;
  1005	=

  1006		dev->delivery_system =3D c->delivery_system;
  1007	=

  1008		return 0;
  1009	err:
  1010		dev_dbg(&client->dev, "failed=3D%d\n", ret);
  1011		return ret;
  1012	}
  1013	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============4092919154879156425==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ctj4H8TncxOb0wEA
--===============4092919154879156425==--

