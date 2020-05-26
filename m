Content-Type: multipart/mixed; boundary="===============3975198829290035567=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lunn:v5.7-rc4-net-next-cable-test-tdr 5/6] net/ethtool/cabletest.c:270:12: warning: comparison is always false due to limited range of data type
Date: Tue, 26 May 2020 16:44:25 +0800
Message-ID: <202005261623.KR05t0t1%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3975198829290035567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/lunn/linux.git v5.7-rc4-net-next-cable-test-tdr
head:   a18dce53d5a2412c66b0bf6c4ad36a027133fb7d
commit: c2574fa18c705975cfec42a962b391bec02a2090 [5/6] net: ethtool: Allow =
PHY cable test TDR data to configured
config: arc-vdk_hs38_defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout c2574fa18c705975cfec42a962b391bec02a2090
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

net/ethtool/cabletest.c: In function 'ethnl_act_cable_test_tdr':
>> net/ethtool/cabletest.c:270:12: warning: comparison is always false due =
to limited range of data type [-Wtype-limits]
270 |   if (pair < ETHTOOL_A_CABLE_PAIR_A ||
|            ^

vim +270 net/ethtool/cabletest.c

   225	=

   226	int ethnl_act_cable_test_tdr(struct sk_buff *skb, struct genl_info *=
info)
   227	{
   228		struct nlattr *tb[ETHTOOL_A_CABLE_TEST_TDR_MAX + 1];
   229		struct ethnl_req_info req_info =3D {};
   230		struct net_device *dev;
   231		u32 first, last, step;
   232		int ret;
   233		u8 pair;
   234	=

   235		ret =3D nlmsg_parse(info->nlhdr, GENL_HDRLEN, tb,
   236				  ETHTOOL_A_CABLE_TEST_TDR_MAX,
   237				  cable_test_tdr_act_policy, info->extack);
   238		if (ret < 0)
   239			return ret;
   240	=

   241		ret =3D ethnl_parse_header_dev_get(&req_info,
   242						 tb[ETHTOOL_A_CABLE_TEST_TDR_HEADER],
   243						 genl_info_net(info), info->extack,
   244						 true);
   245		if (ret < 0)
   246			return ret;
   247	=

   248		dev =3D req_info.dev;
   249		if (!dev->phydev) {
   250			ret =3D -EOPNOTSUPP;
   251			goto out_dev_put;
   252		}
   253	=

   254		if (tb[ETHTOOL_A_CABLE_TEST_TDR_FIRST])
   255			first =3D nla_get_u32(tb[ETHTOOL_A_CABLE_TEST_TDR_FIRST]);
   256		else
   257			first =3D 100;
   258		if (tb[ETHTOOL_A_CABLE_TEST_TDR_LAST])
   259			last =3D nla_get_u32(tb[ETHTOOL_A_CABLE_TEST_TDR_LAST]);
   260		else
   261			last =3D MAX_CABLE_LENGTH_CM;
   262	=

   263		if (tb[ETHTOOL_A_CABLE_TEST_TDR_STEP])
   264			step =3D nla_get_u32(tb[ETHTOOL_A_CABLE_TEST_TDR_STEP]);
   265		else
   266			step =3D 100;
   267	=

   268		if (tb[ETHTOOL_A_CABLE_TEST_TDR_PAIR]) {
   269			pair =3D nla_get_u8(tb[ETHTOOL_A_CABLE_TEST_TDR_PAIR]);
 > 270			if (pair < ETHTOOL_A_CABLE_PAIR_A ||
   271			    pair > ETHTOOL_A_CABLE_PAIR_D) {
   272				NL_SET_ERR_MSG(info->extack,
   273					       "invalid pair parameter");
   274				return -EINVAL;
   275			}
   276		} else {
   277			pair =3D PHY_PAIR_ALL;
   278		}
   279	=

   280		if (first > MAX_CABLE_LENGTH_CM) {
   281			NL_SET_ERR_MSG(info->extack, "invalid first parameter");
   282			return -EINVAL;
   283		}
   284	=

   285		if (last > MAX_CABLE_LENGTH_CM) {
   286			NL_SET_ERR_MSG(info->extack, "invalid last parameter");
   287			return -EINVAL;
   288		}
   289	=

   290		if (first > last) {
   291			NL_SET_ERR_MSG(info->extack, "invalid first/last parameter");
   292			return -EINVAL;
   293		}
   294	=

   295		if (!step) {
   296			NL_SET_ERR_MSG(info->extack, "invalid step parameter");
   297			return -EINVAL;
   298		}
   299	=

   300		rtnl_lock();
   301		ret =3D ethnl_ops_begin(dev);
   302		if (ret < 0)
   303			goto out_rtnl;
   304	=

   305		ret =3D phy_start_cable_test_tdr(dev->phydev, info->extack,
   306					       first, last, step, pair);
   307	=

   308		ethnl_ops_complete(dev);
   309	=

   310		if (!ret)
   311			ethnl_cable_test_started(dev->phydev,
   312						 ETHTOOL_MSG_CABLE_TEST_TDR_NTF);
   313	=

   314	out_rtnl:
   315		rtnl_unlock();
   316	out_dev_put:
   317		dev_put(dev);
   318		return ret;
   319	}
   320	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3975198829290035567==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3975198829290035567==--

