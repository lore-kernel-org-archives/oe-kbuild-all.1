Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077872;
	b=1pnCdVlzbgs2FqD3BjWajImL4z8qEAwmaZEdoegrxVZCmuJxiNmmSXMj+uBhDRi/Ou6k
	 SkcGvDzIeLIudw4lOLxg70Cn3izQ0ysnC1JweETvMUHNd2KjugJi0iA6A5gCJadYJuWe9
	 xA7mKvgBa7uFWBSViMsJWmugGzP5hKYukVpAxAi7EwqEnCT0JOnPukpxko+q+6SkY5yhs
	 q01xGnJB9AOWjEANMhwlQ+h8JGywUy6Lt+IgU7eV9998kfnlL4TXTfTsk2ILHyCycGDcr
	 PbaaK/Re/nt2+3k3RROwcC5eX7QTa5XaR38nkR6HZ8RrrGQ/PI1ar4K2XRrBmWvkRzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077872;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SmgUuAov/QEmuqZwcIBNuj96HbVZxcrMZZLXG+X3cVQ=;
	b=srdX4pLDbncdA9ehjxtCr/iYETQ4Km6rwUDu3JDvyEbZjznQU1agLOcm3NXhKaibDEG3
	 FRaY5T+RbSQga644nSqUk2iP7KLTogJ9drqZBYcqiiJtAHZ6hYL9nsUosOJxsZCX//PQE
	 z9tm1ji2/8hfLv4TVz0zKI88ipLeqo83gp5MDJvFaGjsXdGzw8j4B80VEP35bIFoM1A1j
	 m+dCOQD0t3FkoM9677gdfnxaYMRT7wPfk/z4uxNjbR8WrkeobErjlN8GbhqTWlj46aMd3
	 NyCHCNdnBsx9EzLF019W17ldAhuQJ6Bcdvg9jXx7OAQql+qFkYu9SGYMxXjovgmH2cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LrXB5+tG;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767A606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 18:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1767A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LrXB5+tG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794077870; x=1825613870;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kGfqcRyMfJTz1yNMhTyKE3NwQxmbB8veIhYkrcE/c+Q=;
  b=LrXB5+tGDB6E2PnpOdq4MqmbLus936kctCptv2uUsJejUqY6vV6aX2CM
   /Z0vOq6BoNb1JqkCIfLnmIHl6Pzh8NNhAbjHJR7W4dHVPuorK9u91mbg9
   Aa/T8XVzLAm8dCkAdcB9uKOUVjQdokD0BFx7TOqBi/1rhabxDHFfU/IgF
   /GKXqlikJL5pvpj+5fIcaQtAZ34z88Nx/76by8G5L+iR9INe090T95SYd
   r0Ilx9gXltyaiktBY+ka/Tnng3xxnxTeLuN1BNzmftsmMWE33hzjovgUF
   JqBOBLZwYz+y4h1OjxGgylemP3dvbWreSJM1+uMTt0wdg520Nq6BGz8h2
   w==;
X-CSE-ConnectionGUID: Ko3TfJXlQ6WvkprVlfimPQ==
X-CSE-MsgGUID: YyEs1bOWTKyXtzXhZ1405w==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2853219"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2853219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 10:57:50 -0800
X-CSE-ConnectionGUID: 4xDHW/yLTUOOz7pcIPsfwQ==
X-CSE-MsgGUID: 0r5I3+v7TIqIJUudWxdFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7876364"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2026 10:57:47 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPlbl-00000000Alr-2cJB;
	Sat, 07 Nov 2026 18:57:45 +0000
Date: Sat, 07 Nov 2026 19:57:06 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-main 151/151]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5332:22: warning: variable 'sid'
 set but not used
Message-ID: <202611071918.qkBI579P-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-main
head:   933c2827bb87dddc6074db77c90f8c3b965e13f5
commit: 3dd587817d9a2f5caf9174c16c28bfac49972644 [151/151] WIP: net: mtk_et=
h_soc: try to fix the pcs handling after change to fill_pcs
config: s390-randconfig-2002-20261107 (https://download.01.org/0day-ci/arch=
ive/20261107/202611071918.qkBI579P-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261107/202611071918.qkBI579P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071918.qkBI579P-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_add_mac':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5332:22: warning: variable '=
sid' set but not used [-Wunused-but-set-variable]
    5332 |         unsigned int sid;
         |                      ^~~


vim +/sid +5332 drivers/net/ethernet/mediatek/mtk_eth_soc.c

3dd587817d9a2f Frank Wunderlich       2026-09-01  5322 =20
3dd587817d9a2f Frank Wunderlich       2026-09-01  5323 =20
656e705243fd0c John Crispin           2016-03-08  5324  static int mtk_add_=
mac(struct mtk_eth *eth, struct device_node *np)
656e705243fd0c John Crispin           2016-03-08  5325  {
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5326  	const struct phyli=
nk_mac_ops *mac_ops =3D &mtk_phylink_ops;
656e705243fd0c John Crispin           2016-03-08  5327  	const __be32 *_id =
=3D of_get_property(np, "reg", NULL);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5328  	phy_interface_t ph=
y_mode;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5329  	struct phylin=
k *phylink;
3dd587817d9a2f Frank Wunderlich       2026-09-01  5330  	int id, err, i;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5331  	struct mtk_ma=
c *mac;
e04722cf4c8164 Daniel Golle           2023-12-12 @5332  	unsigned int sid;
f63959c7eec315 Felix Fietkau          2022-11-16  5333  	int txqs =3D 1;
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5334) 	u32 val;
656e705243fd0c John Crispin           2016-03-08  5335 =20
656e705243fd0c John Crispin           2016-03-08  5336  	if (!_id) {
656e705243fd0c John Crispin           2016-03-08  5337  		dev_err(eth->dev,=
 "missing mac id\n");
656e705243fd0c John Crispin           2016-03-08  5338  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5339  	}
656e705243fd0c John Crispin           2016-03-08  5340 =20
656e705243fd0c John Crispin           2016-03-08  5341  	id =3D be32_to_cpu=
p(_id);
e05fd6274ee657 Lorenzo Bianconi       2023-07-25  5342  	if (id >=3D MTK_MA=
X_DEVS) {
656e705243fd0c John Crispin           2016-03-08  5343  		dev_err(eth->dev,=
 "%d is not a valid mac id\n", id);
656e705243fd0c John Crispin           2016-03-08  5344  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5345  	}
656e705243fd0c John Crispin           2016-03-08  5346 =20
656e705243fd0c John Crispin           2016-03-08  5347  	if (eth->netdev[id=
]) {
656e705243fd0c John Crispin           2016-03-08  5348  		dev_err(eth->dev,=
 "duplicate mac id found: %d\n", id);
656e705243fd0c John Crispin           2016-03-08  5349  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5350  	}
656e705243fd0c John Crispin           2016-03-08  5351 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5352  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_QDMA))
f63959c7eec315 Felix Fietkau          2022-11-16  5353  		txqs =3D MTK_QDMA=
_NUM_QUEUES;
f63959c7eec315 Felix Fietkau          2022-11-16  5354 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5355  	eth->netdev[id] =
=3D alloc_etherdev_mqs(sizeof(*mac), txqs, 1);
656e705243fd0c John Crispin           2016-03-08  5356  	if (!eth->netdev[i=
d]) {
656e705243fd0c John Crispin           2016-03-08  5357  		dev_err(eth->dev,=
 "alloc_etherdev failed\n");
656e705243fd0c John Crispin           2016-03-08  5358  		return -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5359  	}
656e705243fd0c John Crispin           2016-03-08  5360  	mac =3D netdev_pri=
v(eth->netdev[id]);
656e705243fd0c John Crispin           2016-03-08  5361  	eth->mac[id] =3D m=
ac;
656e705243fd0c John Crispin           2016-03-08  5362  	mac->id =3D id;
656e705243fd0c John Crispin           2016-03-08  5363  	mac->hw =3D eth;
656e705243fd0c John Crispin           2016-03-08  5364  	mac->of_node =3D n=
p;
656e705243fd0c John Crispin           2016-03-08  5365 =20
1d6d537dc55d1f Daniel Golle           2023-07-13  5366  	err =3D of_get_eth=
dev_address(mac->of_node, eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5367  	if (err =3D=3D -EP=
ROBE_DEFER)
1d6d537dc55d1f Daniel Golle           2023-07-13  5368  		return err;
1d6d537dc55d1f Daniel Golle           2023-07-13  5369 =20
1d6d537dc55d1f Daniel Golle           2023-07-13  5370  	if (err) {
1d6d537dc55d1f Daniel Golle           2023-07-13  5371  		/* If the mac add=
ress is invalid, use random mac address */
1d6d537dc55d1f Daniel Golle           2023-07-13  5372  		eth_hw_addr_rando=
m(eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5373  		dev_err(eth->dev,=
 "generated random MAC address %pM\n",
1d6d537dc55d1f Daniel Golle           2023-07-13  5374  			eth->netdev[id]-=
>dev_addr);
1d6d537dc55d1f Daniel Golle           2023-07-13  5375  	}
1d6d537dc55d1f Daniel Golle           2023-07-13  5376 =20
ee40681037c0e5 Nelson Chang           2016-09-17  5377  	memset(mac->hwlro_=
ip, 0, sizeof(mac->hwlro_ip));
ee40681037c0e5 Nelson Chang           2016-09-17  5378  	mac->hwlro_ip_cnt =
=3D 0;
ee40681037c0e5 Nelson Chang           2016-09-17  5379 =20
656e705243fd0c John Crispin           2016-03-08  5380  	mac->hw_stats =3D =
devm_kzalloc(eth->dev,
656e705243fd0c John Crispin           2016-03-08  5381  				     sizeof(*ma=
c->hw_stats),
656e705243fd0c John Crispin           2016-03-08  5382  				     GFP_KERNEL=
);
656e705243fd0c John Crispin           2016-03-08  5383  	if (!mac->hw_stats=
) {
656e705243fd0c John Crispin           2016-03-08  5384  		dev_err(eth->dev,=
 "failed to allocate counter memory\n");
656e705243fd0c John Crispin           2016-03-08  5385  		err =3D -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5386  		goto free_netdev;
656e705243fd0c John Crispin           2016-03-08  5387  	}
656e705243fd0c John Crispin           2016-03-08  5388  	spin_lock_init(&ma=
c->hw_stats->stats_lock);
d7005652cd31df sean.wang@mediatek.com 2016-08-13  5389  	u64_stats_init(&ma=
c->hw_stats->syncp);
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5390 =20
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5391  	if (mtk_is_netsys_=
v3_or_greater(eth))
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5392  		mac->hw_stats->re=
g_offset =3D id * 0x80;
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5393  	else
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5394  		mac->hw_stats->re=
g_offset =3D id * 0x40;
656e705243fd0c John Crispin           2016-03-08  5395 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5396  	/* phylink cr=
eate */
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5397  	err =3D of_get_phy=
_mode(np, &phy_mode);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5398  	if (err) {
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5399  		dev_err(eth-=
>dev, "incorrect phy-mode\n");
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5400  		goto free_ne=
tdev;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5401  	}
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5402 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5403  	/* mac config=
 is not set */
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5404  	mac->interfac=
e =3D PHY_INTERFACE_MODE_NA;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5405  	mac->speed =
=3D SPEED_UNKNOWN;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5406 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5407  	mac->phylink_=
config.dev =3D &eth->netdev[id]->dev;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5408  	mac->phylink_=
config.type =3D PHYLINK_NETDEV;
a4238f6ce151af Russell King (Oracle   2021-11-16  5409) 	mac->phylink_confi=
g.mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
a4238f6ce151af Russell King (Oracle   2021-11-16  5410) 		MAC_10 | MAC_100 =
| MAC_1000 | MAC_2500FD;
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5411  	/* LPI above 1 Gbp=
s is not supported */
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5412  	mac->phylink_confi=
g.lpi_capabilities =3D MAC_100FD | MAC_1000FD;
952d7325362ffb Qingfang Deng          2025-02-17  5413  	mac->phylink_confi=
g.lpi_timer_default =3D 1000;
3dd587817d9a2f Frank Wunderlich       2026-09-01  5414  	mac->phylink_confi=
g.fill_available_pcs =3D mtk_fill_available_pcs;
a4238f6ce151af Russell King (Oracle   2021-11-16  5415)=20
76a4cb755cf911 Russell King (Oracle   2023-07-22  5416) 	/* MT7623 gmac0 is=
 now missing its speed-specific PLL configuration
76a4cb755cf911 Russell King (Oracle   2023-07-22  5417) 	 * in its .mac_con=
fig method (since state->speed is not valid there.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5418) 	 * Disable support=
 for MII, GMII and RGMII.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5419) 	 */
76a4cb755cf911 Russell King (Oracle   2023-07-22  5420) 	if (!mac->hw->soc-=
>disable_pll_modes || mac->id !=3D 0) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5421) 		__set_bit(PHY_INT=
ERFACE_MODE_MII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5422) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5423) 		__set_bit(PHY_INT=
ERFACE_MODE_GMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5424) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5425)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5426) 		if (MTK_HAS_CAPS(=
mac->hw->soc->caps, MTK_RGMII))
83800d29f0c578 Russell King (Oracle   2021-11-16  5427) 			phy_interface_se=
t_rgmii(mac->phylink_config.supported_interfaces);
76a4cb755cf911 Russell King (Oracle   2023-07-22  5428) 	}
83800d29f0c578 Russell King (Oracle   2021-11-16  5429)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5430) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_TRGMII) && !mac->id)
83800d29f0c578 Russell King (Oracle   2021-11-16  5431) 		__set_bit(PHY_INT=
ERFACE_MODE_TRGMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5432) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5433)=20
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5434) 	/* TRGMII is not p=
ermitted on MT7621 if using DDR2 */
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5435) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_GMAC1_TRGMII) &&
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5436) 	    MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_TRGMII_MT7621_CLK)) {
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5437) 		regmap_read(eth->=
ethsys, ETHSYS_SYSCFG, &val);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5438) 		if (val & SYSCFG_=
DRAM_TYPE_DDR2)
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5439) 			__clear_bit(PHY_=
INTERFACE_MODE_TRGMII,
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5440) 				    mac->phylin=
k_config.supported_interfaces);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5441) 	}
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5442)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5443) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_SGMII)) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5444) 		__set_bit(PHY_INT=
ERFACE_MODE_SGMII,
e04722cf4c8164 Daniel Golle           2023-12-12  5445  			  mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5446) 		__set_bit(PHY_INT=
ERFACE_MODE_1000BASEX,
e04722cf4c8164 Daniel Golle           2023-12-12  5447  			  mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5448) 		__set_bit(PHY_INT=
ERFACE_MODE_2500BASEX,
e04722cf4c8164 Daniel Golle           2023-12-12  5449  			  mac->phylink_c=
onfig.pcs_interfaces);
e04722cf4c8164 Daniel Golle           2023-12-12  5450 =20
e04722cf4c8164 Daniel Golle           2023-12-12  5451  		if (mtk_is_netsys=
_v3_or_greater(mac->hw)) {
e04722cf4c8164 Daniel Golle           2023-12-12  5452  			__set_bit(PHY_IN=
TERFACE_MODE_5GBASER,
e04722cf4c8164 Daniel Golle           2023-12-12  5453  				mac->phylink_co=
nfig.pcs_interfaces);
e04722cf4c8164 Daniel Golle           2023-12-12  5454  			__set_bit(PHY_IN=
TERFACE_MODE_10GBASER,
e04722cf4c8164 Daniel Golle           2023-12-12  5455  				mac->phylink_co=
nfig.pcs_interfaces);
e04722cf4c8164 Daniel Golle           2023-12-12  5456  			__set_bit(PHY_IN=
TERFACE_MODE_USXGMII,
e04722cf4c8164 Daniel Golle           2023-12-12  5457  				mac->phylink_co=
nfig.pcs_interfaces);
e04722cf4c8164 Daniel Golle           2023-12-12  5458  		} else {
e04722cf4c8164 Daniel Golle           2023-12-12  5459  			if (MTK_HAS_CAPS=
(eth->soc->caps, MTK_SHARED_SGMII)) {
e04722cf4c8164 Daniel Golle           2023-12-12  5460  				/* single LynxI=
 PCS used by either GMAC */
e04722cf4c8164 Daniel Golle           2023-12-12  5461  				if (!test_bit(p=
hy_mode, eth->sgmii_pcs[0]->supported_interfaces))
e04722cf4c8164 Daniel Golle           2023-12-12  5462  					goto no_pcs;
e04722cf4c8164 Daniel Golle           2023-12-12  5463  				if (eth->shared=
_sgmii_used) {
e04722cf4c8164 Daniel Golle           2023-12-12  5464  					err =3D -EBUSY;
e04722cf4c8164 Daniel Golle           2023-12-12  5465  					goto free_netd=
ev;
e04722cf4c8164 Daniel Golle           2023-12-12  5466  				}
e04722cf4c8164 Daniel Golle           2023-12-12  5467  				sid =3D 0;
e04722cf4c8164 Daniel Golle           2023-12-12  5468  				eth->shared_sgm=
ii_used =3D true;
e04722cf4c8164 Daniel Golle           2023-12-12  5469  			} else {
e04722cf4c8164 Daniel Golle           2023-12-12  5470  				sid =3D id;
e04722cf4c8164 Daniel Golle           2023-12-12  5471  			}
e04722cf4c8164 Daniel Golle           2023-12-12  5472  		}
e04722cf4c8164 Daniel Golle           2023-12-12  5473 =20
e04722cf4c8164 Daniel Golle           2023-12-12  5474  		phy_interface_or(=
mac->phylink_config.supported_interfaces,
e04722cf4c8164 Daniel Golle           2023-12-12  5475  				 mac->phylink_c=
onfig.supported_interfaces,
e04722cf4c8164 Daniel Golle           2023-12-12  5476  				 mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5477) 	}
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5478 =20
e04722cf4c8164 Daniel Golle           2023-12-12  5479  no_pcs:
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5480  	if (mtk_is_netsys_=
v3_or_greater(mac->hw) &&
1bdea6fad6fb98 Bo-Cun Chen            2025-05-13  5481  	    MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_ESW) &&
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5482  	    id =3D=3D MTK_=
GMAC1_ID) {
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5483  		mac->phylink_conf=
ig.mac_capabilities =3D MAC_ASYM_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5484  						       MAC_SY=
M_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5485  						       MAC_10=
000FD;
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5486  		phy_interface_zer=
o(mac->phylink_config.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5487  		__set_bit(PHY_INT=
ERFACE_MODE_INTERNAL,
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5488  			  mac->phylink_c=
onfig.supported_interfaces);
e04722cf4c8164 Daniel Golle           2023-12-12  5489  	} else if (MTK_HAS=
_CAPS(mac->hw->soc->caps, MTK_USXGMII)) {
e04722cf4c8164 Daniel Golle           2023-12-12  5490  		mac->phylink_conf=
ig.mac_capabilities |=3D MAC_5000FD | MAC_10000FD;
e04722cf4c8164 Daniel Golle           2023-12-12  5491  		__set_bit(PHY_INT=
ERFACE_MODE_5GBASER,
e04722cf4c8164 Daniel Golle           2023-12-12  5492  			  mac->phylink_c=
onfig.supported_interfaces);
e04722cf4c8164 Daniel Golle           2023-12-12  5493  		__set_bit(PHY_INT=
ERFACE_MODE_10GBASER,
e04722cf4c8164 Daniel Golle           2023-12-12  5494  			  mac->phylink_c=
onfig.supported_interfaces);
e04722cf4c8164 Daniel Golle           2023-12-12  5495  		__set_bit(PHY_INT=
ERFACE_MODE_USXGMII,
e04722cf4c8164 Daniel Golle           2023-12-12  5496  			  mac->phylink_c=
onfig.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5497  	}
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5498 =20
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5499  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_SOC_MT7628))
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5500  		mac_ops =3D &rt53=
50_phylink_ops;
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5501 =20
e4b4d8410c7cce Christian Marangi      2026-06-15  5502  	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_2P5GPHY) &&
e4b4d8410c7cce Christian Marangi      2026-06-15  5503  	    id =3D=3D MTK_=
GMAC2_ID)
e4b4d8410c7cce Christian Marangi      2026-06-15  5504  		__set_bit(PHY_INT=
ERFACE_MODE_INTERNAL,
e4b4d8410c7cce Christian Marangi      2026-06-15  5505  			  mac->phylink_c=
onfig.supported_interfaces);
e4b4d8410c7cce Christian Marangi      2026-06-15  5506 =20
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5507  	/* LPI wake-up tim=
ing is only verified on MTK_GMAC_EEE SoCs */
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5508  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_GMAC_EEE)) {
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5509  		phy_interface_cop=
y(mac->phylink_config.lpi_interfaces,
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5510  				   mac->phylink=
_config.supported_interfaces);
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5511  		__clear_bit(PHY_I=
NTERFACE_MODE_2500BASEX,
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5512  			    mac->phylink=
_config.lpi_interfaces);
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5513  		for (i =3D 0; i <=
 PHY_INTERFACE_MODE_MAX; i++)
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5514  			if (mtk_interfac=
e_mode_is_xgmii(eth, i))
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5515  				__clear_bit(i,
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5516  					    mac->phyli=
nk_config.lpi_interfaces);
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5517  	}
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5518 =20
656e705243fd0c John Crispin           2016-03-08  5519  	SET_NETDEV_DEV(eth=
->netdev[id], eth->dev);
eaadf9fd3f6390 John Crispin           2016-06-10  5520  	eth->netdev[id]->w=
atchdog_timeo =3D 5 * HZ;
656e705243fd0c John Crispin           2016-03-08  5521  	eth->netdev[id]->n=
etdev_ops =3D &mtk_netdev_ops;
656e705243fd0c John Crispin           2016-03-08  5522  	eth->netdev[id]->b=
ase_addr =3D (unsigned long)eth->base;
ee40681037c0e5 Nelson Chang           2016-09-17  5523 =20
296c9120752bab Stefan Roese           2019-08-16  5524  	eth->netdev[id]->h=
w_features =3D eth->soc->hw_features;
ee40681037c0e5 Nelson Chang           2016-09-17  5525  	if (eth->hwlro)
ee40681037c0e5 Nelson Chang           2016-09-17  5526  		eth->netdev[id]->=
hw_features |=3D NETIF_F_LRO;
ee40681037c0e5 Nelson Chang           2016-09-17  5527 =20
296c9120752bab Stefan Roese           2019-08-16  5528  	eth->netdev[id]->v=
lan_features =3D eth->soc->hw_features &
c6d96df9fa2c1d Felix Fietkau          2023-04-26  5529  		~NETIF_F_HW_VLAN_=
CTAG_TX;
296c9120752bab Stefan Roese           2019-08-16  5530  	eth->netdev[id]->f=
eatures |=3D eth->soc->hw_features;
656e705243fd0c John Crispin           2016-03-08  5531  	eth->netdev[id]->e=
thtool_ops =3D &mtk_ethtool_ops;
656e705243fd0c John Crispin           2016-03-08  5532 =20
c81b15ce6facb9 Mason Chang            2026-05-09  5533  	eth->netdev[id]->i=
rq =3D eth->irq_fe[MTK_FE_IRQ_SHARED];
3174b3b58cba69 Sean Wang              2017-04-07  5534  	eth->netdev[id]->d=
ev.of_node =3D np;
3174b3b58cba69 Sean Wang              2017-04-07  5535 =20
e04722cf4c8164 Daniel Golle           2023-12-12  5536  	phylink =3D phylin=
k_create(&mac->phylink_config,
e04722cf4c8164 Daniel Golle           2023-12-12  5537  				 of_fwnode_hand=
le(mac->of_node),
e04722cf4c8164 Daniel Golle           2023-12-12  5538  				 phy_mode, mac_=
ops);
e04722cf4c8164 Daniel Golle           2023-12-12  5539  	if (IS_ERR(phylink=
)) {
e04722cf4c8164 Daniel Golle           2023-12-12  5540  		err =3D PTR_ERR(p=
hylink);
e04722cf4c8164 Daniel Golle           2023-12-12  5541  		goto free_netdev;
e04722cf4c8164 Daniel Golle           2023-12-12  5542  	}
e04722cf4c8164 Daniel Golle           2023-12-12  5543 =20
e04722cf4c8164 Daniel Golle           2023-12-12  5544  	mac->phylink =3D p=
hylink;
e04722cf4c8164 Daniel Golle           2023-12-12  5545 =20
4fd59792097a6b DENG Qingfang          2021-01-25  5546  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_SOC_MT7628))
555a893303872e Landen Chao            2020-07-29  5547  		eth->netdev[id]->=
max_mtu =3D MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
4fd59792097a6b DENG Qingfang          2021-01-25  5548  	else
4fd59792097a6b DENG Qingfang          2021-01-25  5549  		eth->netdev[id]->=
max_mtu =3D MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;
555a893303872e Landen Chao            2020-07-29  5550 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5551  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_QDMA)) {
f63959c7eec315 Felix Fietkau          2022-11-16  5552  		mac->device_notif=
ier.notifier_call =3D mtk_device_event;
f63959c7eec315 Felix Fietkau          2022-11-16  5553  		register_netdevic=
e_notifier(&mac->device_notifier);
f63959c7eec315 Felix Fietkau          2022-11-16  5554  	}
f63959c7eec315 Felix Fietkau          2022-11-16  5555 =20
66c0e13ad236c7 Marek Majtyka          2023-02-01  5556  	if (mtk_page_pool_=
enabled(eth))
66c0e13ad236c7 Marek Majtyka          2023-02-01  5557  		eth->netdev[id]->=
xdp_features =3D NETDEV_XDP_ACT_BASIC |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5558  						NETDEV_XDP_AC=
T_REDIRECT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5559  						NETDEV_XDP_AC=
T_NDO_XMIT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5560  						NETDEV_XDP_AC=
T_NDO_XMIT_SG;
66c0e13ad236c7 Marek Majtyka          2023-02-01  5561 =20
656e705243fd0c John Crispin           2016-03-08  5562  	return 0;
656e705243fd0c John Crispin           2016-03-08  5563 =20
656e705243fd0c John Crispin           2016-03-08  5564  free_netdev:
656e705243fd0c John Crispin           2016-03-08  5565  	free_netdev(eth->n=
etdev[id]);
656e705243fd0c John Crispin           2016-03-08  5566  	return err;
656e705243fd0c John Crispin           2016-03-08  5567  }
656e705243fd0c John Crispin           2016-03-08  5568 =20

:::::: The code at line 5332 was first introduced by commit
:::::: e04722cf4c8164bcfff07ed9c4a3c7d22bee599d net: ethernet: mtk_eth_soc:=
 add paths and SerDes modes for MT7988

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
