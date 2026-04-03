Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252F135A939
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206023; cv=none; b=qVVhrbs7bofG5V5B+vg3YermJ7P55UX7dpZnSGky128wWmebIH6T1J8Ik8elkPGlZggl2JZ5lP4QKpYMpHhDbTADzHZjzIbg9u5oBhBtWySSf9tACXDs4kDezZytoHzbnt734sWCknssouNO1H2k+IGPdylTi+K1VRXA7t4Gi/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206023; c=relaxed/simple;
	bh=B9JDflcyYURXBnfHSRQOPMKOpgiA1Yvg4H+uex2PHyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MddbDRAxSu/WDZL2UyVae1AtFBO0LBmgek06MF6bKHqJy3ljdqiVeW36Y0AI4HMxdM6seUtbBdJrk/4ozecHVbxN1aES0si24UNpntoT8l6QmuAaAfpX/FpyCrHHSrrz5i/OA7fu7NZ2YRKnWFDBGkhc9Kzp60zwQ5MuJXz0zQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLZ87vDi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLZ87vDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206022; x=1806742022;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B9JDflcyYURXBnfHSRQOPMKOpgiA1Yvg4H+uex2PHyg=;
  b=DLZ87vDiqsLePRSK1Sbp0dROe0+9FwANqIYayo7lAQatYqU9SUGCc4gg
   MZ9R49OT4612UUVlyjEpj7Jlp5vhFc+ulzpd73Y4WbLtcA907jKEUosXs
   IqdT494Wxvl8FhynhBH2F1cwh574kCCykGSycQ1s5shcyTIDvKeupOtDz
   ck3rqk6O8vbGyNS6GppMwYm1qM73tgWHcGA4yEXChCSDQ/f3Nq7SUFMxz
   NHre84Dq3E5gkhdnay5Yp1r7JV0glBcMXufQPabYGDa6m9jkLv8dh1to3
   /zE1nLtoRgqq7ikTG6H7Dh+pgLvE3AjuT8b3/FHfruYDnj5hto5KQgSme
   A==;
X-CSE-ConnectionGUID: NdS5G14KQluLHQW3p7XzWQ==
X-CSE-MsgGUID: YF+14IlOQ7ibjT8thlVNXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312093"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:00 -0700
X-CSE-ConnectionGUID: c91Qr4YjTz+9whGwcxMilg==
X-CSE-MsgGUID: suNDuHc5SaSvRdWJDQ+IxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287302"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016p-3hHA;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-r3-issue 11/11]
 drivers/net/dsa/mt7530-mdio.c:87:29: warning: variable 'port_dn' set but not
 used
Message-ID: <202604031133.684OAS7H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-r3-issue
head:   0031af66037e29406f1e2ad46affd50efe1b8e88
commit: 0031af66037e29406f1e2ad46affd50efe1b8e88 [11/11] net: pcs: made eas=
ier fix without dts-modification (do not configure switch side as before)
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026040=
3/202604031133.684OAS7H-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260403/202604031133.684OAS7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031133.684OAS7H-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/mt7530-mdio.c: In function 'mt7531_create_sgmii':
>> drivers/net/dsa/mt7530-mdio.c:87:29: warning: variable 'port_dn' set but=
 not used [-Wunused-but-set-variable]
      87 |         struct device_node *port_dn;
         |                             ^~~~~~~


vim +/port_dn +87 drivers/net/dsa/mt7530-mdio.c

cb675afcddbbeb Daniel Golle     2023-04-03   82 =20
cb675afcddbbeb Daniel Golle     2023-04-03   83  static int
1f4a85f2eaa8f2 Ar=C4=B1n=C3=A7 =C3=9CNAL       2024-01-22   84  mt7531_crea=
te_sgmii(struct mt7530_priv *priv)
cb675afcddbbeb Daniel Golle     2023-04-03   85  {
91daa4f62ce878 Daniel Golle     2023-04-16   86  	struct regmap_config *mt7=
531_pcs_config[2] =3D {};
f693e2ed24287c Frank Wunderlich 2026-04-02  @87  	struct device_node *port_=
dn;
f693e2ed24287c Frank Wunderlich 2026-04-02   88  	struct dsa_port *port_dp;
cb675afcddbbeb Daniel Golle     2023-04-03   89  	struct phylink_pcs *pcs;
cb675afcddbbeb Daniel Golle     2023-04-03   90  	struct regmap *regmap;
cb675afcddbbeb Daniel Golle     2023-04-03   91  	int i, ret =3D 0;
cb675afcddbbeb Daniel Golle     2023-04-03   92 =20
1f4a85f2eaa8f2 Ar=C4=B1n=C3=A7 =C3=9CNAL       2024-01-22   93  	for (i =3D =
priv->p5_sgmii ? 0 : 1; i < 2; i++) {
cb675afcddbbeb Daniel Golle     2023-04-03   94  		mt7531_pcs_config[i] =3D =
devm_kzalloc(priv->dev,
cb675afcddbbeb Daniel Golle     2023-04-03   95  						    sizeof(struct re=
gmap_config),
cb675afcddbbeb Daniel Golle     2023-04-03   96  						    GFP_KERNEL);
cb675afcddbbeb Daniel Golle     2023-04-03   97  		if (!mt7531_pcs_config[i=
]) {
cb675afcddbbeb Daniel Golle     2023-04-03   98  			ret =3D -ENOMEM;
cb675afcddbbeb Daniel Golle     2023-04-03   99  			break;
cb675afcddbbeb Daniel Golle     2023-04-03  100  		}
cb675afcddbbeb Daniel Golle     2023-04-03  101 =20
cb675afcddbbeb Daniel Golle     2023-04-03  102  		mt7531_pcs_config[i]->na=
me =3D i ? "port6" : "port5";
cb675afcddbbeb Daniel Golle     2023-04-03  103  		mt7531_pcs_config[i]->re=
g_bits =3D 16;
cb675afcddbbeb Daniel Golle     2023-04-03  104  		mt7531_pcs_config[i]->va=
l_bits =3D 32;
cb675afcddbbeb Daniel Golle     2023-04-03  105  		mt7531_pcs_config[i]->re=
g_stride =3D 4;
cb675afcddbbeb Daniel Golle     2023-04-03  106  		mt7531_pcs_config[i]->re=
g_base =3D MT7531_SGMII_REG_BASE(5 + i);
cb675afcddbbeb Daniel Golle     2023-04-03  107  		mt7531_pcs_config[i]->ma=
x_register =3D 0x17c;
cb675afcddbbeb Daniel Golle     2023-04-03  108  		mt7531_pcs_config[i]->lo=
ck =3D mt7530_mdio_regmap_lock;
cb675afcddbbeb Daniel Golle     2023-04-03  109  		mt7531_pcs_config[i]->un=
lock =3D mt7530_mdio_regmap_unlock;
cb675afcddbbeb Daniel Golle     2023-04-03  110  		mt7531_pcs_config[i]->lo=
ck_arg =3D &priv->bus->mdio_lock;
cb675afcddbbeb Daniel Golle     2023-04-03  111 =20
868ff5f4944aa9 Ar=C4=B1n=C3=A7 =C3=9CNAL       2024-04-18  112  		regmap =
=3D devm_regmap_init(priv->dev, &mt7530_regmap_bus, priv,
cb675afcddbbeb Daniel Golle     2023-04-03  113  					  mt7531_pcs_config[i=
]);
cb675afcddbbeb Daniel Golle     2023-04-03  114  		if (IS_ERR(regmap)) {
cb675afcddbbeb Daniel Golle     2023-04-03  115  			ret =3D PTR_ERR(regmap);
cb675afcddbbeb Daniel Golle     2023-04-03  116  			break;
cb675afcddbbeb Daniel Golle     2023-04-03  117  		}
f693e2ed24287c Frank Wunderlich 2026-04-02  118  		dev_warn(priv->dev, "add=
 lynxi pcs for switch (%s)\n",mt7531_pcs_config[i]->name);
f693e2ed24287c Frank Wunderlich 2026-04-02  119  		port_dp =3D dsa_to_port(=
priv->ds, i+5);
f693e2ed24287c Frank Wunderlich 2026-04-02  120  		port_dn =3D port_dp->dn;
0031af66037e29 Frank Wunderlich 2026-04-02  121  		pcs =3D mtk_pcs_lynxi_cr=
eate(priv->dev, NULL, regmap,
bde1ae2d52ab35 Vladimir Oltean  2026-01-19  122  					   MT7531_PHYA_CTRL_S=
IGNAL3);
cb675afcddbbeb Daniel Golle     2023-04-03  123  		if (!pcs) {
cb675afcddbbeb Daniel Golle     2023-04-03  124  			ret =3D -ENXIO;
cb675afcddbbeb Daniel Golle     2023-04-03  125  			break;
cb675afcddbbeb Daniel Golle     2023-04-03  126  		}
cb675afcddbbeb Daniel Golle     2023-04-03  127  		priv->ports[5 + i].sgmii=
_pcs =3D pcs;
cb675afcddbbeb Daniel Golle     2023-04-03  128  	}
cb675afcddbbeb Daniel Golle     2023-04-03  129 =20
cb675afcddbbeb Daniel Golle     2023-04-03  130  	if (ret && i)
cb675afcddbbeb Daniel Golle     2023-04-03  131  		mtk_pcs_lynxi_destroy(pr=
iv->ports[5].sgmii_pcs);
cb675afcddbbeb Daniel Golle     2023-04-03  132 =20
cb675afcddbbeb Daniel Golle     2023-04-03  133  	return ret;
cb675afcddbbeb Daniel Golle     2023-04-03  134  }
cb675afcddbbeb Daniel Golle     2023-04-03  135 =20

:::::: The code at line 87 was first introduced by commit
:::::: f693e2ed24287ce1e125d7f6202e14e263cc564d net: dsa: mt7530-mdio: pass=
 port node to handle serdes polarity

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
