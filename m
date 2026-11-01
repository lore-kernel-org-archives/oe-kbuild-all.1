Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541517;
	b=3/q5fWBR/MDg+HjXrfNjHyzPz2PeY+Hq2hFXG3WF3sR3DoKOAWWLOrFejyI59DS5JXJ4
	 vouCLxohbEcL8cqvKAWi61qvxoNb6KAfD4VT9Voovw9y63PxRnR2onrBnP6teipA1A+wy
	 H5J4/yTM7nZ7QD0Z/ib8SBfBsBPsvN7omQD9ilKBNpLa/uk0FKmR0cROysgmd85T3camR
	 o5pQMKhnqZBzL1Z1F9wSymKU2wZe5yj5bXT0jASBV/edcBpmsOF3ygqhD4u64tLA0w5F1
	 C5R5BXUKGvOyU6n9/t56Bvk0X6641mD3SOFNg7uzE80NLa+pzrj5QG16bwixtVf2r5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541517;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=443pCuumyrFMa93+nJXEDpejMsFE+6UcTwetd6Exz5o=;
	b=kInfsEg19izffMDOGg5s+4mXYdct3GFwy8Dx3JUM83KqHYn4R2Dc1AJuTE7JFL4CPHmC
	 hVfxxyO+5iFminmDRBKXnnxisLK7CkAghr0kNXxgdD6RoRzDMATwT9tAydySxEnZX6iHY
	 0qoucaQEGjrmkvLLaEnW9t1Y/JSflrZo93QyO69bYP9CE5G9nhZeAKQVF+hSSo6597GKX
	 V67N5+KIRvakGmfAOqp4E1ljIQKfsLHNLgtuPe9WpL5YKzXVmRAEp7wMegcDoBiia5BlZ
	 dw3aNDElyBiYCOojdkObVnBhtPI0qmqHINM0LifPsm9FCNEaRe1QXVPa5PiHYiraXdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZgjUE75e;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C15606A325
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 13:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C15606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZgjUE75e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793541515; x=1825077515;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qq4UuLNWGaFfP7QUuQM7+aPJMz4brj9JrqK2QWIwNfU=;
  b=ZgjUE75eAKDiU+sHfzcv6vx0LDO9HvLzHyr5vqcjpn/pMD7tczGYkv3U
   pxYrDHuLqR+m5Uq8VJbrMT7JA0e+cnlDNDs/LnQ0eXIhRZXGLsaDj+Y+j
   hlXwMgZ1cIeXWgmSJdcXeh/PAzlvwYenuE3cD58bPghDp/SkLv2xf9nv7
   zPzg4E5vLmIAVUjmHt79FiTHUyupmuarbB3BCiBgCcApuB1g9hi6UB9pJ
   vCBDiKsbgoCvOfuKwRt2UQdoL4kuJiCuG41RWu07u1SWbFhmGsy+cLQCU
   RHz4xKpcTFxuwXJ+avlpWmfEtQQ+UFhzTLveGYIFA4BAgd8SavtsowPx9
   A==;
X-CSE-ConnectionGUID: AQsM59TpRsSUvipdpCP/yQ==
X-CSE-MsgGUID: XLQMyovhSuu+mFH43CR0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2244300"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2244300"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 05:58:34 -0800
X-CSE-ConnectionGUID: c4/7sazdTo20Y9XnC9UfVA==
X-CSE-MsgGUID: almY0hsNTcevpodHDQxqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="7695240"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 01 Nov 2026 05:58:33 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNW4s-000000007t5-1xIb;
	Sun, 01 Nov 2026 13:58:30 +0000
Date: Sun, 01 Nov 2026 14:57:52 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-main_preview 35/35]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5494:1: warning: label 'no_pcs'
 defined but not used
Message-ID: <202611011421.z2r5Oiht-lkp@intel.com>
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

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-main_preview
head:   ab2af42d6ed901295c998bab1ce6fbee17d1b8d9
commit: ab2af42d6ed901295c998bab1ce6fbee17d1b8d9 [35/35] try to fix the ser=
des path patch, but still without the mt7622 workaround
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261=
101/202611011421.z2r5Oiht-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261101/202611011421.z2r5Oiht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611011421.z2r5Oiht-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_add_mac':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5494:1: warning: label 'no_p=
cs' defined but not used [-Wunused-label]
    5494 | no_pcs:
         | ^~~~~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5360:22: warning: unused var=
iable 'sid' [-Wunused-variable]
    5360 |         unsigned int sid;
         |                      ^~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5358:22: warning: unused var=
iable 'count' [-Wunused-variable]
    5358 |         int id, err, count, i;
         |                      ^~~~~


vim +/no_pcs +5494 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin           2016-03-08  5351 =20
656e705243fd0c John Crispin           2016-03-08  5352  static int mtk_add_=
mac(struct mtk_eth *eth, struct device_node *np)
656e705243fd0c John Crispin           2016-03-08  5353  {
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5354  	const struct phyli=
nk_mac_ops *mac_ops =3D &mtk_phylink_ops;
656e705243fd0c John Crispin           2016-03-08  5355  	const __be32 *_id =
=3D of_get_property(np, "reg", NULL);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5356  	phy_interface_t ph=
y_mode;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5357  	struct phylin=
k *phylink;
f127c46785e445 Daniel Golle           2023-12-12 @5358  	int id, err, count=
, i;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5359  	struct mtk_ma=
c *mac;
f127c46785e445 Daniel Golle           2023-12-12 @5360  	unsigned int sid;
f63959c7eec315 Felix Fietkau          2022-11-16  5361  	int txqs =3D 1;
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5362) 	u32 val;
656e705243fd0c John Crispin           2016-03-08  5363 =20
656e705243fd0c John Crispin           2016-03-08  5364  	if (!_id) {
656e705243fd0c John Crispin           2016-03-08  5365  		dev_err(eth->dev,=
 "missing mac id\n");
656e705243fd0c John Crispin           2016-03-08  5366  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5367  	}
656e705243fd0c John Crispin           2016-03-08  5368 =20
656e705243fd0c John Crispin           2016-03-08  5369  	id =3D be32_to_cpu=
p(_id);
e05fd6274ee657 Lorenzo Bianconi       2023-07-25  5370  	if (id >=3D MTK_MA=
X_DEVS) {
656e705243fd0c John Crispin           2016-03-08  5371  		dev_err(eth->dev,=
 "%d is not a valid mac id\n", id);
656e705243fd0c John Crispin           2016-03-08  5372  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5373  	}
656e705243fd0c John Crispin           2016-03-08  5374 =20
656e705243fd0c John Crispin           2016-03-08  5375  	if (eth->netdev[id=
]) {
656e705243fd0c John Crispin           2016-03-08  5376  		dev_err(eth->dev,=
 "duplicate mac id found: %d\n", id);
656e705243fd0c John Crispin           2016-03-08  5377  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5378  	}
656e705243fd0c John Crispin           2016-03-08  5379 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5380  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_QDMA))
f63959c7eec315 Felix Fietkau          2022-11-16  5381  		txqs =3D MTK_QDMA=
_NUM_QUEUES;
f63959c7eec315 Felix Fietkau          2022-11-16  5382 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5383  	eth->netdev[id] =
=3D alloc_etherdev_mqs(sizeof(*mac), txqs, 1);
656e705243fd0c John Crispin           2016-03-08  5384  	if (!eth->netdev[i=
d]) {
656e705243fd0c John Crispin           2016-03-08  5385  		dev_err(eth->dev,=
 "alloc_etherdev failed\n");
656e705243fd0c John Crispin           2016-03-08  5386  		return -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5387  	}
656e705243fd0c John Crispin           2016-03-08  5388  	mac =3D netdev_pri=
v(eth->netdev[id]);
656e705243fd0c John Crispin           2016-03-08  5389  	eth->mac[id] =3D m=
ac;
656e705243fd0c John Crispin           2016-03-08  5390  	mac->id =3D id;
656e705243fd0c John Crispin           2016-03-08  5391  	mac->hw =3D eth;
656e705243fd0c John Crispin           2016-03-08  5392  	mac->of_node =3D n=
p;
656e705243fd0c John Crispin           2016-03-08  5393 =20
1d6d537dc55d1f Daniel Golle           2023-07-13  5394  	err =3D of_get_eth=
dev_address(mac->of_node, eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5395  	if (err =3D=3D -EP=
ROBE_DEFER)
1d6d537dc55d1f Daniel Golle           2023-07-13  5396  		return err;
1d6d537dc55d1f Daniel Golle           2023-07-13  5397 =20
1d6d537dc55d1f Daniel Golle           2023-07-13  5398  	if (err) {
1d6d537dc55d1f Daniel Golle           2023-07-13  5399  		/* If the mac add=
ress is invalid, use random mac address */
1d6d537dc55d1f Daniel Golle           2023-07-13  5400  		eth_hw_addr_rando=
m(eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5401  		dev_err(eth->dev,=
 "generated random MAC address %pM\n",
1d6d537dc55d1f Daniel Golle           2023-07-13  5402  			eth->netdev[id]-=
>dev_addr);
1d6d537dc55d1f Daniel Golle           2023-07-13  5403  	}
1d6d537dc55d1f Daniel Golle           2023-07-13  5404 =20
ee40681037c0e5 Nelson Chang           2016-09-17  5405  	memset(mac->hwlro_=
ip, 0, sizeof(mac->hwlro_ip));
ee40681037c0e5 Nelson Chang           2016-09-17  5406  	mac->hwlro_ip_cnt =
=3D 0;
ee40681037c0e5 Nelson Chang           2016-09-17  5407 =20
656e705243fd0c John Crispin           2016-03-08  5408  	mac->hw_stats =3D =
devm_kzalloc(eth->dev,
656e705243fd0c John Crispin           2016-03-08  5409  				     sizeof(*ma=
c->hw_stats),
656e705243fd0c John Crispin           2016-03-08  5410  				     GFP_KERNEL=
);
656e705243fd0c John Crispin           2016-03-08  5411  	if (!mac->hw_stats=
) {
656e705243fd0c John Crispin           2016-03-08  5412  		dev_err(eth->dev,=
 "failed to allocate counter memory\n");
656e705243fd0c John Crispin           2016-03-08  5413  		err =3D -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5414  		goto free_netdev;
656e705243fd0c John Crispin           2016-03-08  5415  	}
656e705243fd0c John Crispin           2016-03-08  5416  	spin_lock_init(&ma=
c->hw_stats->stats_lock);
d7005652cd31df sean.wang@mediatek.com 2016-08-13  5417  	u64_stats_init(&ma=
c->hw_stats->syncp);
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5418 =20
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5419  	if (mtk_is_netsys_=
v3_or_greater(eth))
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5420  		mac->hw_stats->re=
g_offset =3D id * 0x80;
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5421  	else
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5422  		mac->hw_stats->re=
g_offset =3D id * 0x40;
656e705243fd0c John Crispin           2016-03-08  5423 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5424  	/* phylink cr=
eate */
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5425  	err =3D of_get_phy=
_mode(np, &phy_mode);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5426  	if (err) {
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5427  		dev_err(eth-=
>dev, "incorrect phy-mode\n");
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5428  		goto free_ne=
tdev;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5429  	}
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5430 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5431  	/* mac config=
 is not set */
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5432  	mac->interfac=
e =3D PHY_INTERFACE_MODE_NA;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5433  	mac->speed =
=3D SPEED_UNKNOWN;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5434 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5435  	mac->phylink_=
config.dev =3D &eth->netdev[id]->dev;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5436  	mac->phylink_=
config.type =3D PHYLINK_NETDEV;
a4238f6ce151af Russell King (Oracle   2021-11-16  5437) 	mac->phylink_confi=
g.mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
a4238f6ce151af Russell King (Oracle   2021-11-16  5438) 		MAC_10 | MAC_100 =
| MAC_1000 | MAC_2500FD;
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5439  	/* LPI above 1 Gbp=
s is not supported */
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5440  	mac->phylink_confi=
g.lpi_capabilities =3D MAC_100FD | MAC_1000FD;
952d7325362ffb Qingfang Deng          2025-02-17  5441  	mac->phylink_confi=
g.lpi_timer_default =3D 1000;
ab2af42d6ed901 Frank Wunderlich       2026-11-01  5442  	mac->phylink_confi=
g.num_possible_pcs =3D fwnode_phylink_pcs_count(dev_fwnode(mac->phylink_con=
fig.dev));
ab2af42d6ed901 Frank Wunderlich       2026-11-01  5443  	mac->phylink_confi=
g.fill_available_pcs =3D mtk_fill_available_pcs;
a4238f6ce151af Russell King (Oracle   2021-11-16  5444)=20
76a4cb755cf911 Russell King (Oracle   2023-07-22  5445) 	/* MT7623 gmac0 is=
 now missing its speed-specific PLL configuration
76a4cb755cf911 Russell King (Oracle   2023-07-22  5446) 	 * in its .mac_con=
fig method (since state->speed is not valid there.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5447) 	 * Disable support=
 for MII, GMII and RGMII.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5448) 	 */
76a4cb755cf911 Russell King (Oracle   2023-07-22  5449) 	if (!mac->hw->soc-=
>disable_pll_modes || mac->id !=3D 0) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5450) 		__set_bit(PHY_INT=
ERFACE_MODE_MII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5451) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5452) 		__set_bit(PHY_INT=
ERFACE_MODE_GMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5453) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5454)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5455) 		if (MTK_HAS_CAPS(=
mac->hw->soc->caps, MTK_RGMII))
83800d29f0c578 Russell King (Oracle   2021-11-16  5456) 			phy_interface_se=
t_rgmii(mac->phylink_config.supported_interfaces);
76a4cb755cf911 Russell King (Oracle   2023-07-22  5457) 	}
83800d29f0c578 Russell King (Oracle   2021-11-16  5458)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5459) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_TRGMII) && !mac->id)
83800d29f0c578 Russell King (Oracle   2021-11-16  5460) 		__set_bit(PHY_INT=
ERFACE_MODE_TRGMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5461) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5462)=20
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5463) 	/* TRGMII is not p=
ermitted on MT7621 if using DDR2 */
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5464) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_GMAC1_TRGMII) &&
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5465) 	    MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_TRGMII_MT7621_CLK)) {
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5466) 		regmap_read(eth->=
ethsys, ETHSYS_SYSCFG, &val);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5467) 		if (val & SYSCFG_=
DRAM_TYPE_DDR2)
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5468) 			__clear_bit(PHY_=
INTERFACE_MODE_TRGMII,
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5469) 				    mac->phylin=
k_config.supported_interfaces);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5470) 	}
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5471)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5472) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_SGMII)) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5473) 		__set_bit(PHY_INT=
ERFACE_MODE_SGMII,
f127c46785e445 Daniel Golle           2023-12-12  5474  			  mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5475) 		__set_bit(PHY_INT=
ERFACE_MODE_1000BASEX,
f127c46785e445 Daniel Golle           2023-12-12  5476  			  mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5477) 		__set_bit(PHY_INT=
ERFACE_MODE_2500BASEX,
f127c46785e445 Daniel Golle           2023-12-12  5478  			  mac->phylink_c=
onfig.pcs_interfaces);
f127c46785e445 Daniel Golle           2023-12-12  5479 =20
f127c46785e445 Daniel Golle           2023-12-12  5480  		if (mtk_is_netsys=
_v3_or_greater(mac->hw)) {
f127c46785e445 Daniel Golle           2023-12-12  5481  			__set_bit(PHY_IN=
TERFACE_MODE_5GBASER,
f127c46785e445 Daniel Golle           2023-12-12  5482  				mac->phylink_co=
nfig.pcs_interfaces);
f127c46785e445 Daniel Golle           2023-12-12  5483  			__set_bit(PHY_IN=
TERFACE_MODE_10GBASER,
f127c46785e445 Daniel Golle           2023-12-12  5484  				mac->phylink_co=
nfig.pcs_interfaces);
f127c46785e445 Daniel Golle           2023-12-12  5485  			__set_bit(PHY_IN=
TERFACE_MODE_USXGMII,
f127c46785e445 Daniel Golle           2023-12-12  5486  				mac->phylink_co=
nfig.pcs_interfaces);
f127c46785e445 Daniel Golle           2023-12-12  5487  		}
f127c46785e445 Daniel Golle           2023-12-12  5488 =20
f127c46785e445 Daniel Golle           2023-12-12  5489  		phy_interface_or(=
mac->phylink_config.supported_interfaces,
f127c46785e445 Daniel Golle           2023-12-12  5490  				 mac->phylink_c=
onfig.supported_interfaces,
f127c46785e445 Daniel Golle           2023-12-12  5491  				 mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5492) 	}
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5493 =20
f127c46785e445 Daniel Golle           2023-12-12 @5494  no_pcs:
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5495  	if (mtk_is_netsys_=
v3_or_greater(mac->hw) &&
1bdea6fad6fb98 Bo-Cun Chen            2025-05-13  5496  	    MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_ESW) &&
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5497  	    id =3D=3D MTK_=
GMAC1_ID) {
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5498  		mac->phylink_conf=
ig.mac_capabilities =3D MAC_ASYM_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5499  						       MAC_SY=
M_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5500  						       MAC_10=
000FD;
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5501  		phy_interface_zer=
o(mac->phylink_config.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5502  		__set_bit(PHY_INT=
ERFACE_MODE_INTERNAL,
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5503  			  mac->phylink_c=
onfig.supported_interfaces);
f127c46785e445 Daniel Golle           2023-12-12  5504  	} else if (MTK_HAS=
_CAPS(mac->hw->soc->caps, MTK_USXGMII)) {
f127c46785e445 Daniel Golle           2023-12-12  5505  		mac->phylink_conf=
ig.mac_capabilities |=3D MAC_5000FD | MAC_10000FD;
f127c46785e445 Daniel Golle           2023-12-12  5506  		__set_bit(PHY_INT=
ERFACE_MODE_5GBASER,
f127c46785e445 Daniel Golle           2023-12-12  5507  			  mac->phylink_c=
onfig.supported_interfaces);
f127c46785e445 Daniel Golle           2023-12-12  5508  		__set_bit(PHY_INT=
ERFACE_MODE_10GBASER,
f127c46785e445 Daniel Golle           2023-12-12  5509  			  mac->phylink_c=
onfig.supported_interfaces);
f127c46785e445 Daniel Golle           2023-12-12  5510  		__set_bit(PHY_INT=
ERFACE_MODE_USXGMII,
f127c46785e445 Daniel Golle           2023-12-12  5511  			  mac->phylink_c=
onfig.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5512  	}
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5513 =20
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5514  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_SOC_MT7628))
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5515  		mac_ops =3D &rt53=
50_phylink_ops;
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5516 =20
e4b4d8410c7cce Christian Marangi      2026-06-15  5517  	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_2P5GPHY) &&
e4b4d8410c7cce Christian Marangi      2026-06-15  5518  	    id =3D=3D MTK_=
GMAC2_ID)
e4b4d8410c7cce Christian Marangi      2026-06-15  5519  		__set_bit(PHY_INT=
ERFACE_MODE_INTERNAL,
e4b4d8410c7cce Christian Marangi      2026-06-15  5520  			  mac->phylink_c=
onfig.supported_interfaces);
e4b4d8410c7cce Christian Marangi      2026-06-15  5521 =20
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5522  	/* LPI wake-up tim=
ing is only verified on MTK_GMAC_EEE SoCs */
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5523  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_GMAC_EEE)) {
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5524  		phy_interface_cop=
y(mac->phylink_config.lpi_interfaces,
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5525  				   mac->phylink=
_config.supported_interfaces);
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5526  		__clear_bit(PHY_I=
NTERFACE_MODE_2500BASEX,
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5527  			    mac->phylink=
_config.lpi_interfaces);
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5528  		for (i =3D 0; i <=
 PHY_INTERFACE_MODE_MAX; i++)
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5529  			if (mtk_interfac=
e_mode_is_xgmii(eth, i))
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5530  				__clear_bit(i,
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5531  					    mac->phyli=
nk_config.lpi_interfaces);
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5532  	}
d876c9cb2d16ed Aleksei Sviridkin      2026-09-03  5533 =20
656e705243fd0c John Crispin           2016-03-08  5534  	SET_NETDEV_DEV(eth=
->netdev[id], eth->dev);
eaadf9fd3f6390 John Crispin           2016-06-10  5535  	eth->netdev[id]->w=
atchdog_timeo =3D 5 * HZ;
656e705243fd0c John Crispin           2016-03-08  5536  	eth->netdev[id]->n=
etdev_ops =3D &mtk_netdev_ops;
656e705243fd0c John Crispin           2016-03-08  5537  	eth->netdev[id]->b=
ase_addr =3D (unsigned long)eth->base;
ee40681037c0e5 Nelson Chang           2016-09-17  5538 =20
296c9120752bab Stefan Roese           2019-08-16  5539  	eth->netdev[id]->h=
w_features =3D eth->soc->hw_features;
ee40681037c0e5 Nelson Chang           2016-09-17  5540  	if (eth->hwlro)
ee40681037c0e5 Nelson Chang           2016-09-17  5541  		eth->netdev[id]->=
hw_features |=3D NETIF_F_LRO;
ee40681037c0e5 Nelson Chang           2016-09-17  5542 =20
296c9120752bab Stefan Roese           2019-08-16  5543  	eth->netdev[id]->v=
lan_features =3D eth->soc->hw_features &
c6d96df9fa2c1d Felix Fietkau          2023-04-26  5544  		~NETIF_F_HW_VLAN_=
CTAG_TX;
296c9120752bab Stefan Roese           2019-08-16  5545  	eth->netdev[id]->f=
eatures |=3D eth->soc->hw_features;
656e705243fd0c John Crispin           2016-03-08  5546  	eth->netdev[id]->e=
thtool_ops =3D &mtk_ethtool_ops;
656e705243fd0c John Crispin           2016-03-08  5547 =20
c81b15ce6facb9 Mason Chang            2026-05-09  5548  	eth->netdev[id]->i=
rq =3D eth->irq_fe[MTK_FE_IRQ_SHARED];
3174b3b58cba69 Sean Wang              2017-04-07  5549  	eth->netdev[id]->d=
ev.of_node =3D np;
3174b3b58cba69 Sean Wang              2017-04-07  5550 =20
f127c46785e445 Daniel Golle           2023-12-12  5551  	phylink =3D phylin=
k_create(&mac->phylink_config,
f127c46785e445 Daniel Golle           2023-12-12  5552  				 of_fwnode_hand=
le(mac->of_node),
f127c46785e445 Daniel Golle           2023-12-12  5553  				 phy_mode, mac_=
ops);
f127c46785e445 Daniel Golle           2023-12-12  5554  	if (IS_ERR(phylink=
)) {
f127c46785e445 Daniel Golle           2023-12-12  5555  		err =3D PTR_ERR(p=
hylink);
f127c46785e445 Daniel Golle           2023-12-12  5556  		goto free_netdev;
f127c46785e445 Daniel Golle           2023-12-12  5557  	}
f127c46785e445 Daniel Golle           2023-12-12  5558 =20
f127c46785e445 Daniel Golle           2023-12-12  5559  	mac->phylink =3D p=
hylink;
f127c46785e445 Daniel Golle           2023-12-12  5560 =20
4fd59792097a6b DENG Qingfang          2021-01-25  5561  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_SOC_MT7628))
555a893303872e Landen Chao            2020-07-29  5562  		eth->netdev[id]->=
max_mtu =3D MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
4fd59792097a6b DENG Qingfang          2021-01-25  5563  	else
4fd59792097a6b DENG Qingfang          2021-01-25  5564  		eth->netdev[id]->=
max_mtu =3D MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;
555a893303872e Landen Chao            2020-07-29  5565 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5566  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_QDMA)) {
f63959c7eec315 Felix Fietkau          2022-11-16  5567  		mac->device_notif=
ier.notifier_call =3D mtk_device_event;
f63959c7eec315 Felix Fietkau          2022-11-16  5568  		register_netdevic=
e_notifier(&mac->device_notifier);
f63959c7eec315 Felix Fietkau          2022-11-16  5569  	}
f63959c7eec315 Felix Fietkau          2022-11-16  5570 =20
66c0e13ad236c7 Marek Majtyka          2023-02-01  5571  	if (mtk_page_pool_=
enabled(eth))
66c0e13ad236c7 Marek Majtyka          2023-02-01  5572  		eth->netdev[id]->=
xdp_features =3D NETDEV_XDP_ACT_BASIC |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5573  						NETDEV_XDP_AC=
T_REDIRECT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5574  						NETDEV_XDP_AC=
T_NDO_XMIT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5575  						NETDEV_XDP_AC=
T_NDO_XMIT_SG;
66c0e13ad236c7 Marek Majtyka          2023-02-01  5576 =20
656e705243fd0c John Crispin           2016-03-08  5577  	return 0;
656e705243fd0c John Crispin           2016-03-08  5578 =20
656e705243fd0c John Crispin           2016-03-08  5579  free_netdev:
656e705243fd0c John Crispin           2016-03-08  5580  	free_netdev(eth->n=
etdev[id]);
656e705243fd0c John Crispin           2016-03-08  5581  	return err;
656e705243fd0c John Crispin           2016-03-08  5582  }
656e705243fd0c John Crispin           2016-03-08  5583 =20

:::::: The code at line 5494 was first introduced by commit
:::::: f127c46785e445875e796e939f07af1cb6cfd58b net: ethernet: mtk_eth_soc:=
 add paths and SerDes modes for MT7988

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
