Content-Type: multipart/mixed; boundary="===============2043379283992431221=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] ASoC: cs42l42: make HSBIAS_SENSE_EN optional
Date: Sat, 08 May 2021 02:14:03 +0800
Message-ID: <202105080224.hGTjX5Be-lkp@intel.com>
In-Reply-To: <20210507141748.742037-1-tanureal@opensource.cirrus.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2043379283992431221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on asoc/for-next]
[also build test ERROR on next-20210507]
[cannot apply to v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lucas-Tanure/ASoC-cs42l42-=
make-HSBIAS_SENSE_EN-optional/20210507-221954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
config: arc-randconfig-s031-20210506 (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/17dc415a57a00d44b8be8db47=
91a2843daee7db1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lucas-Tanure/ASoC-cs42l42-make-HSB=
IAS_SENSE_EN-optional/20210507-221954
        git checkout 17dc415a57a00d44b8be8db4791a2843daee7db1
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs42l42.c: In function 'cs42l42_handle_device_data':
>> sound/soc/codecs/cs42l42.c:1812:33: error: 'dev' undeclared (first use i=
n this function); did you mean 'cdev'?
    1812 |  ret =3D device_property_read_u32(dev, "cirrus,hs-bias-sense-en"=
, &val);
         |                                 ^~~
         |                                 cdev
   sound/soc/codecs/cs42l42.c:1812:33: note: each undeclared identifier is =
reported only once for each function it appears in


vim +1812 sound/soc/codecs/cs42l42.c

  1632	=

  1633	static int cs42l42_handle_device_data(struct i2c_client *i2c_client,
  1634						struct cs42l42_private *cs42l42)
  1635	{
  1636		struct device_node *np =3D i2c_client->dev.of_node;
  1637		unsigned int val;
  1638		unsigned int thresholds[CS42L42_NUM_BIASES];
  1639		int ret;
  1640		int i;
  1641	=

  1642		ret =3D of_property_read_u32(np, "cirrus,ts-inv", &val);
  1643	=

  1644		if (!ret) {
  1645			switch (val) {
  1646			case CS42L42_TS_INV_EN:
  1647			case CS42L42_TS_INV_DIS:
  1648				cs42l42->ts_inv =3D val;
  1649				break;
  1650			default:
  1651				dev_err(&i2c_client->dev,
  1652					"Wrong cirrus,ts-inv DT value %d\n",
  1653					val);
  1654				cs42l42->ts_inv =3D CS42L42_TS_INV_DIS;
  1655			}
  1656		} else {
  1657			cs42l42->ts_inv =3D CS42L42_TS_INV_DIS;
  1658		}
  1659	=

  1660		regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
  1661				CS42L42_TS_INV_MASK,
  1662				(cs42l42->ts_inv << CS42L42_TS_INV_SHIFT));
  1663	=

  1664		ret =3D of_property_read_u32(np, "cirrus,ts-dbnc-rise", &val);
  1665	=

  1666		if (!ret) {
  1667			switch (val) {
  1668			case CS42L42_TS_DBNCE_0:
  1669			case CS42L42_TS_DBNCE_125:
  1670			case CS42L42_TS_DBNCE_250:
  1671			case CS42L42_TS_DBNCE_500:
  1672			case CS42L42_TS_DBNCE_750:
  1673			case CS42L42_TS_DBNCE_1000:
  1674			case CS42L42_TS_DBNCE_1250:
  1675			case CS42L42_TS_DBNCE_1500:
  1676				cs42l42->ts_dbnc_rise =3D val;
  1677				break;
  1678			default:
  1679				dev_err(&i2c_client->dev,
  1680					"Wrong cirrus,ts-dbnc-rise DT value %d\n",
  1681					val);
  1682				cs42l42->ts_dbnc_rise =3D CS42L42_TS_DBNCE_1000;
  1683			}
  1684		} else {
  1685			cs42l42->ts_dbnc_rise =3D CS42L42_TS_DBNCE_1000;
  1686		}
  1687	=

  1688		regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
  1689				CS42L42_TS_RISE_DBNCE_TIME_MASK,
  1690				(cs42l42->ts_dbnc_rise <<
  1691				CS42L42_TS_RISE_DBNCE_TIME_SHIFT));
  1692	=

  1693		ret =3D of_property_read_u32(np, "cirrus,ts-dbnc-fall", &val);
  1694	=

  1695		if (!ret) {
  1696			switch (val) {
  1697			case CS42L42_TS_DBNCE_0:
  1698			case CS42L42_TS_DBNCE_125:
  1699			case CS42L42_TS_DBNCE_250:
  1700			case CS42L42_TS_DBNCE_500:
  1701			case CS42L42_TS_DBNCE_750:
  1702			case CS42L42_TS_DBNCE_1000:
  1703			case CS42L42_TS_DBNCE_1250:
  1704			case CS42L42_TS_DBNCE_1500:
  1705				cs42l42->ts_dbnc_fall =3D val;
  1706				break;
  1707			default:
  1708				dev_err(&i2c_client->dev,
  1709					"Wrong cirrus,ts-dbnc-fall DT value %d\n",
  1710					val);
  1711				cs42l42->ts_dbnc_fall =3D CS42L42_TS_DBNCE_0;
  1712			}
  1713		} else {
  1714			cs42l42->ts_dbnc_fall =3D CS42L42_TS_DBNCE_0;
  1715		}
  1716	=

  1717		regmap_update_bits(cs42l42->regmap, CS42L42_TSENSE_CTL,
  1718				CS42L42_TS_FALL_DBNCE_TIME_MASK,
  1719				(cs42l42->ts_dbnc_fall <<
  1720				CS42L42_TS_FALL_DBNCE_TIME_SHIFT));
  1721	=

  1722		ret =3D of_property_read_u32(np, "cirrus,btn-det-init-dbnce", &val);
  1723	=

  1724		if (!ret) {
  1725			if (val <=3D CS42L42_BTN_DET_INIT_DBNCE_MAX)
  1726				cs42l42->btn_det_init_dbnce =3D val;
  1727			else {
  1728				dev_err(&i2c_client->dev,
  1729					"Wrong cirrus,btn-det-init-dbnce DT value %d\n",
  1730					val);
  1731				cs42l42->btn_det_init_dbnce =3D
  1732					CS42L42_BTN_DET_INIT_DBNCE_DEFAULT;
  1733			}
  1734		} else {
  1735			cs42l42->btn_det_init_dbnce =3D
  1736				CS42L42_BTN_DET_INIT_DBNCE_DEFAULT;
  1737		}
  1738	=

  1739		ret =3D of_property_read_u32(np, "cirrus,btn-det-event-dbnce", &val=
);
  1740	=

  1741		if (!ret) {
  1742			if (val <=3D CS42L42_BTN_DET_EVENT_DBNCE_MAX)
  1743				cs42l42->btn_det_event_dbnce =3D val;
  1744			else {
  1745				dev_err(&i2c_client->dev,
  1746				"Wrong cirrus,btn-det-event-dbnce DT value %d\n", val);
  1747				cs42l42->btn_det_event_dbnce =3D
  1748					CS42L42_BTN_DET_EVENT_DBNCE_DEFAULT;
  1749			}
  1750		} else {
  1751			cs42l42->btn_det_event_dbnce =3D
  1752				CS42L42_BTN_DET_EVENT_DBNCE_DEFAULT;
  1753		}
  1754	=

  1755		ret =3D of_property_read_u32_array(np, "cirrus,bias-lvls",
  1756					   (u32 *)thresholds, CS42L42_NUM_BIASES);
  1757	=

  1758		if (!ret) {
  1759			for (i =3D 0; i < CS42L42_NUM_BIASES; i++) {
  1760				if (thresholds[i] <=3D CS42L42_HS_DET_LEVEL_MAX)
  1761					cs42l42->bias_thresholds[i] =3D thresholds[i];
  1762				else {
  1763					dev_err(&i2c_client->dev,
  1764					"Wrong cirrus,bias-lvls[%d] DT value %d\n", i,
  1765						thresholds[i]);
  1766					cs42l42->bias_thresholds[i] =3D
  1767						threshold_defaults[i];
  1768				}
  1769			}
  1770		} else {
  1771			for (i =3D 0; i < CS42L42_NUM_BIASES; i++)
  1772				cs42l42->bias_thresholds[i] =3D threshold_defaults[i];
  1773		}
  1774	=

  1775		ret =3D of_property_read_u32(np, "cirrus,hs-bias-ramp-rate", &val);
  1776	=

  1777		if (!ret) {
  1778			switch (val) {
  1779			case CS42L42_HSBIAS_RAMP_FAST_RISE_SLOW_FALL:
  1780				cs42l42->hs_bias_ramp_rate =3D val;
  1781				cs42l42->hs_bias_ramp_time =3D CS42L42_HSBIAS_RAMP_TIME0;
  1782				break;
  1783			case CS42L42_HSBIAS_RAMP_FAST:
  1784				cs42l42->hs_bias_ramp_rate =3D val;
  1785				cs42l42->hs_bias_ramp_time =3D CS42L42_HSBIAS_RAMP_TIME1;
  1786				break;
  1787			case CS42L42_HSBIAS_RAMP_SLOW:
  1788				cs42l42->hs_bias_ramp_rate =3D val;
  1789				cs42l42->hs_bias_ramp_time =3D CS42L42_HSBIAS_RAMP_TIME2;
  1790				break;
  1791			case CS42L42_HSBIAS_RAMP_SLOWEST:
  1792				cs42l42->hs_bias_ramp_rate =3D val;
  1793				cs42l42->hs_bias_ramp_time =3D CS42L42_HSBIAS_RAMP_TIME3;
  1794				break;
  1795			default:
  1796				dev_err(&i2c_client->dev,
  1797					"Wrong cirrus,hs-bias-ramp-rate DT value %d\n",
  1798					val);
  1799				cs42l42->hs_bias_ramp_rate =3D CS42L42_HSBIAS_RAMP_SLOW;
  1800				cs42l42->hs_bias_ramp_time =3D CS42L42_HSBIAS_RAMP_TIME2;
  1801			}
  1802		} else {
  1803			cs42l42->hs_bias_ramp_rate =3D CS42L42_HSBIAS_RAMP_SLOW;
  1804			cs42l42->hs_bias_ramp_time =3D CS42L42_HSBIAS_RAMP_TIME2;
  1805		}
  1806	=

  1807		regmap_update_bits(cs42l42->regmap, CS42L42_HS_BIAS_CTL,
  1808				CS42L42_HSBIAS_RAMP_MASK,
  1809				(cs42l42->hs_bias_ramp_rate <<
  1810				CS42L42_HSBIAS_RAMP_SHIFT));
  1811	=

> 1812		ret =3D device_property_read_u32(dev, "cirrus,hs-bias-sense-en", &v=
al);
  1813		if (!ret) {
  1814			switch (val) {
  1815			case CS42L42_HSBIAS_SENSE_OFF:
  1816			case CS42L42_HSBIAS_SENSE_ON:
  1817				cs42l42->hs_bias_sense_en =3D val;
  1818				break;
  1819			default:
  1820				dev_err(dev,
  1821					"Wrong cirrus,hs-bias-sense-en DT value %d\n",
  1822					val);
  1823				cs42l42->hs_bias_sense_en =3D CS42L42_HSBIAS_SENSE_ON;
  1824				break;
  1825			}
  1826		} else {
  1827			cs42l42->hs_bias_sense_en =3D CS42L42_HSBIAS_SENSE_ON;
  1828		}
  1829	=

  1830		return 0;
  1831	}
  1832	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2043379283992431221==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
B9T2WoZrAQA=
--===============2043379283992431221==--

