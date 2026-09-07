Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429264734CC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782124; cv=none; b=YV2TK0lhO7gGXRHJRBwiXCwhttXddlv+E3LVdelmEEkt7tcyoJqxjY6eybHyq0KiGDG5IepvNF1hceX3Xf6yGeUT4tyLIVw4SIiBd/A5V2G7+Plov39BhxtZqJixRZVHfjv8ph0xx8zJVGED3u38pRIE/oX/5Kkq6SD98PMzrg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782124; c=relaxed/simple;
	bh=sYXlKPicw5iN3B0/gB8uVEhn3rz0IrET7FlbfNU3Qnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=klozAgDRNmGKmSmvQiYYUg6b0sNyOy9b5jn6Eojcxpw0hPUHYLpmIfIz2x/1R1dc87rX/LTV0WEqBF9XAG/dc+8LsKcQj+gAVOL4OfrO0HZYVt1ALOuOcTwJPOqQGBrUKFWzbJrtBIcQWkbHgxXq0bsRPr5HvkfnhoMZ8u1MGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NijOWsVk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NijOWsVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788782121; x=1820318121;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sYXlKPicw5iN3B0/gB8uVEhn3rz0IrET7FlbfNU3Qnk=;
  b=NijOWsVkoHjN7G9ak8r8Y9sQTmgQI4CU1ePeplozBa04tnR4ePcPVtnn
   cHM4JM7y3sz9ZyKIBRr3rci2mJ5D7an8yDUWxhFM3BT8ZRm3u0jjJGYJz
   vTvYYWjdpADsIjH9/5fsl7CVgtfCBURZ45Ve2CgkLvRDUt2VXJOEEl9uj
   T3jIVWXHHuOVMYBoMLnjjBWXxSESGAnIKti1/M0/yAjNDS3C5dDWrONQP
   YIS11SbtaxswgSz8gU6mSqhbsoA4ziq6Mqkbjm/xQbhx+SxW8g3FN2YgO
   ucvgiAOwnEX1qz4X1kqbQBA1G4Kg6auB2DTZbq1z37Szs8pnM7QXrFcO5
   Q==;
X-CSE-ConnectionGUID: KHVJuTWzTViKfzCLdfocNQ==
X-CSE-MsgGUID: EhfZbpFvSBOpV82ncbudLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89203413"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89203413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:55:20 -0700
X-CSE-ConnectionGUID: CUDDVFHnSRa+ObdihP4E2A==
X-CSE-MsgGUID: jETMeNZmSCKakf/eBlYmig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="295558223"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 Sep 2026 04:55:19 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3XwT-000000000E2-0l54;
	Mon, 07 Sep 2026 11:55:17 +0000
Date: Mon, 07 Sep 2026 13:54:40 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rc 82/144]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5425:22: warning: variable 'sid'
 set but not used
Message-ID: <202609071324.sDo5hLX7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rc
head:   a48e9fe4c82938d01091baf795940325d6470030
commit: 56fc946120b904c6ad38f2c7f4fed7d55203cc0c [82/144] WIP: net: mtk_eth=
_soc: try to fix the pcs handling after change to fill_pcs
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260907/2=
02609071324.sDo5hLX7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260907/202609071324.sDo5hLX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609071324.sDo5hLX7-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_add_mac':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5425:22: warning: variable '=
sid' set but not used [-Wunused-but-set-variable=3D]
    5425 |         unsigned int sid;
         |                      ^~~


vim +/sid +5425 drivers/net/ethernet/mediatek/mtk_eth_soc.c

56fc946120b904 Frank Wunderlich       2026-09-01  5416 =20
56fc946120b904 Frank Wunderlich       2026-09-01  5417 =20
656e705243fd0c John Crispin           2016-03-08  5418  static int mtk_add_=
mac(struct mtk_eth *eth, struct device_node *np)
656e705243fd0c John Crispin           2016-03-08  5419  {
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5420  	const struct phyli=
nk_mac_ops *mac_ops =3D &mtk_phylink_ops;
656e705243fd0c John Crispin           2016-03-08  5421  	const __be32 *_id =
=3D of_get_property(np, "reg", NULL);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5422  	phy_interface_t ph=
y_mode;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5423  	struct phylin=
k *phylink;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5424  	struct mtk_ma=
c *mac;
c4995ed24241c6 Daniel Golle           2023-12-12 @5425  	unsigned int sid;
f63959c7eec315 Felix Fietkau          2022-11-16  5426  	int txqs =3D 1;
56fc946120b904 Frank Wunderlich       2026-09-01  5427  	int id, err;
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5428) 	u32 val;
656e705243fd0c John Crispin           2016-03-08  5429 =20
656e705243fd0c John Crispin           2016-03-08  5430  	if (!_id) {
656e705243fd0c John Crispin           2016-03-08  5431  		dev_err(eth->dev,=
 "missing mac id\n");
656e705243fd0c John Crispin           2016-03-08  5432  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5433  	}
656e705243fd0c John Crispin           2016-03-08  5434 =20
656e705243fd0c John Crispin           2016-03-08  5435  	id =3D be32_to_cpu=
p(_id);
e05fd6274ee657 Lorenzo Bianconi       2023-07-25  5436  	if (id >=3D MTK_MA=
X_DEVS) {
656e705243fd0c John Crispin           2016-03-08  5437  		dev_err(eth->dev,=
 "%d is not a valid mac id\n", id);
656e705243fd0c John Crispin           2016-03-08  5438  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5439  	}
656e705243fd0c John Crispin           2016-03-08  5440 =20
656e705243fd0c John Crispin           2016-03-08  5441  	if (eth->netdev[id=
]) {
656e705243fd0c John Crispin           2016-03-08  5442  		dev_err(eth->dev,=
 "duplicate mac id found: %d\n", id);
656e705243fd0c John Crispin           2016-03-08  5443  		return -EINVAL;
656e705243fd0c John Crispin           2016-03-08  5444  	}
656e705243fd0c John Crispin           2016-03-08  5445 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5446  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_QDMA))
f63959c7eec315 Felix Fietkau          2022-11-16  5447  		txqs =3D MTK_QDMA=
_NUM_QUEUES;
f63959c7eec315 Felix Fietkau          2022-11-16  5448 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5449  	eth->netdev[id] =
=3D alloc_etherdev_mqs(sizeof(*mac), txqs, 1);
656e705243fd0c John Crispin           2016-03-08  5450  	if (!eth->netdev[i=
d]) {
656e705243fd0c John Crispin           2016-03-08  5451  		dev_err(eth->dev,=
 "alloc_etherdev failed\n");
656e705243fd0c John Crispin           2016-03-08  5452  		return -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5453  	}
656e705243fd0c John Crispin           2016-03-08  5454  	mac =3D netdev_pri=
v(eth->netdev[id]);
656e705243fd0c John Crispin           2016-03-08  5455  	eth->mac[id] =3D m=
ac;
656e705243fd0c John Crispin           2016-03-08  5456  	mac->id =3D id;
656e705243fd0c John Crispin           2016-03-08  5457  	mac->hw =3D eth;
656e705243fd0c John Crispin           2016-03-08  5458  	mac->of_node =3D n=
p;
656e705243fd0c John Crispin           2016-03-08  5459 =20
1d6d537dc55d1f Daniel Golle           2023-07-13  5460  	err =3D of_get_eth=
dev_address(mac->of_node, eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5461  	if (err =3D=3D -EP=
ROBE_DEFER)
1d6d537dc55d1f Daniel Golle           2023-07-13  5462  		return err;
1d6d537dc55d1f Daniel Golle           2023-07-13  5463 =20
1d6d537dc55d1f Daniel Golle           2023-07-13  5464  	if (err) {
1d6d537dc55d1f Daniel Golle           2023-07-13  5465  		/* If the mac add=
ress is invalid, use random mac address */
1d6d537dc55d1f Daniel Golle           2023-07-13  5466  		eth_hw_addr_rando=
m(eth->netdev[id]);
1d6d537dc55d1f Daniel Golle           2023-07-13  5467  		dev_err(eth->dev,=
 "generated random MAC address %pM\n",
1d6d537dc55d1f Daniel Golle           2023-07-13  5468  			eth->netdev[id]-=
>dev_addr);
1d6d537dc55d1f Daniel Golle           2023-07-13  5469  	}
1d6d537dc55d1f Daniel Golle           2023-07-13  5470 =20
ee40681037c0e5 Nelson Chang           2016-09-17  5471  	memset(mac->hwlro_=
ip, 0, sizeof(mac->hwlro_ip));
ee40681037c0e5 Nelson Chang           2016-09-17  5472  	mac->hwlro_ip_cnt =
=3D 0;
ee40681037c0e5 Nelson Chang           2016-09-17  5473 =20
656e705243fd0c John Crispin           2016-03-08  5474  	mac->hw_stats =3D =
devm_kzalloc(eth->dev,
656e705243fd0c John Crispin           2016-03-08  5475  				     sizeof(*ma=
c->hw_stats),
656e705243fd0c John Crispin           2016-03-08  5476  				     GFP_KERNEL=
);
656e705243fd0c John Crispin           2016-03-08  5477  	if (!mac->hw_stats=
) {
656e705243fd0c John Crispin           2016-03-08  5478  		dev_err(eth->dev,=
 "failed to allocate counter memory\n");
656e705243fd0c John Crispin           2016-03-08  5479  		err =3D -ENOMEM;
656e705243fd0c John Crispin           2016-03-08  5480  		goto free_netdev;
656e705243fd0c John Crispin           2016-03-08  5481  	}
656e705243fd0c John Crispin           2016-03-08  5482  	spin_lock_init(&ma=
c->hw_stats->stats_lock);
d7005652cd31df sean.wang@mediatek.com 2016-08-13  5483  	u64_stats_init(&ma=
c->hw_stats->syncp);
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5484 =20
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5485  	if (mtk_is_netsys_=
v3_or_greater(eth))
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5486  		mac->hw_stats->re=
g_offset =3D id * 0x80;
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5487  	else
1953f134a1a8b4 Lorenzo Bianconi       2023-07-25  5488  		mac->hw_stats->re=
g_offset =3D id * 0x40;
656e705243fd0c John Crispin           2016-03-08  5489 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5490  	/* phylink cr=
eate */
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5491  	err =3D of_get_phy=
_mode(np, &phy_mode);
0c65b2b90d13c1 Andrew Lunn            2019-11-04  5492  	if (err) {
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5493  		dev_err(eth-=
>dev, "incorrect phy-mode\n");
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5494  		goto free_ne=
tdev;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5495  	}
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5496 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5497  	/* mac config=
 is not set */
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5498  	mac->interfac=
e =3D PHY_INTERFACE_MODE_NA;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5499  	mac->speed =
=3D SPEED_UNKNOWN;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5500 =20
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5501  	mac->phylink_=
config.dev =3D &eth->netdev[id]->dev;
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5502  	mac->phylink_=
config.type =3D PHYLINK_NETDEV;
a4238f6ce151af Russell King (Oracle   2021-11-16  5503) 	mac->phylink_confi=
g.mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
a4238f6ce151af Russell King (Oracle   2021-11-16  5504) 		MAC_10 | MAC_100 =
| MAC_1000 | MAC_2500FD;
952d7325362ffb Qingfang Deng          2025-02-17  5505  	mac->phylink_confi=
g.lpi_capabilities =3D MAC_100FD | MAC_1000FD |
952d7325362ffb Qingfang Deng          2025-02-17  5506  		MAC_2500FD;
952d7325362ffb Qingfang Deng          2025-02-17  5507  	mac->phylink_confi=
g.lpi_timer_default =3D 1000;
56fc946120b904 Frank Wunderlich       2026-09-01  5508  	mac->phylink_confi=
g.fill_available_pcs =3D mtk_fill_available_pcs;
a4238f6ce151af Russell King (Oracle   2021-11-16  5509)=20
76a4cb755cf911 Russell King (Oracle   2023-07-22  5510) 	/* MT7623 gmac0 is=
 now missing its speed-specific PLL configuration
76a4cb755cf911 Russell King (Oracle   2023-07-22  5511) 	 * in its .mac_con=
fig method (since state->speed is not valid there.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5512) 	 * Disable support=
 for MII, GMII and RGMII.
76a4cb755cf911 Russell King (Oracle   2023-07-22  5513) 	 */
76a4cb755cf911 Russell King (Oracle   2023-07-22  5514) 	if (!mac->hw->soc-=
>disable_pll_modes || mac->id !=3D 0) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5515) 		__set_bit(PHY_INT=
ERFACE_MODE_MII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5516) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5517) 		__set_bit(PHY_INT=
ERFACE_MODE_GMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5518) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5519)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5520) 		if (MTK_HAS_CAPS(=
mac->hw->soc->caps, MTK_RGMII))
83800d29f0c578 Russell King (Oracle   2021-11-16  5521) 			phy_interface_se=
t_rgmii(mac->phylink_config.supported_interfaces);
76a4cb755cf911 Russell King (Oracle   2023-07-22  5522) 	}
83800d29f0c578 Russell King (Oracle   2021-11-16  5523)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5524) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_TRGMII) && !mac->id)
83800d29f0c578 Russell King (Oracle   2021-11-16  5525) 		__set_bit(PHY_INT=
ERFACE_MODE_TRGMII,
83800d29f0c578 Russell King (Oracle   2021-11-16  5526) 			  mac->phylink_c=
onfig.supported_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5527)=20
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5528) 	/* TRGMII is not p=
ermitted on MT7621 if using DDR2 */
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5529) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_GMAC1_TRGMII) &&
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5530) 	    MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_TRGMII_MT7621_CLK)) {
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5531) 		regmap_read(eth->=
ethsys, ETHSYS_SYSCFG, &val);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5532) 		if (val & SYSCFG_=
DRAM_TYPE_DDR2)
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5533) 			__clear_bit(PHY_=
INTERFACE_MODE_TRGMII,
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5534) 				    mac->phylin=
k_config.supported_interfaces);
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5535) 	}
7910898e1b2ae8 Russell King (Oracle   2023-03-07  5536)=20
83800d29f0c578 Russell King (Oracle   2021-11-16  5537) 	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_SGMII)) {
83800d29f0c578 Russell King (Oracle   2021-11-16  5538) 		__set_bit(PHY_INT=
ERFACE_MODE_SGMII,
c4995ed24241c6 Daniel Golle           2023-12-12  5539  			  mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5540) 		__set_bit(PHY_INT=
ERFACE_MODE_1000BASEX,
c4995ed24241c6 Daniel Golle           2023-12-12  5541  			  mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5542) 		__set_bit(PHY_INT=
ERFACE_MODE_2500BASEX,
c4995ed24241c6 Daniel Golle           2023-12-12  5543  			  mac->phylink_c=
onfig.pcs_interfaces);
c4995ed24241c6 Daniel Golle           2023-12-12  5544 =20
c4995ed24241c6 Daniel Golle           2023-12-12  5545  		if (mtk_is_netsys=
_v3_or_greater(mac->hw)) {
c4995ed24241c6 Daniel Golle           2023-12-12  5546  			__set_bit(PHY_IN=
TERFACE_MODE_5GBASER,
c4995ed24241c6 Daniel Golle           2023-12-12  5547  				mac->phylink_co=
nfig.pcs_interfaces);
c4995ed24241c6 Daniel Golle           2023-12-12  5548  			__set_bit(PHY_IN=
TERFACE_MODE_10GBASER,
c4995ed24241c6 Daniel Golle           2023-12-12  5549  				mac->phylink_co=
nfig.pcs_interfaces);
c4995ed24241c6 Daniel Golle           2023-12-12  5550  			__set_bit(PHY_IN=
TERFACE_MODE_USXGMII,
c4995ed24241c6 Daniel Golle           2023-12-12  5551  				mac->phylink_co=
nfig.pcs_interfaces);
c4995ed24241c6 Daniel Golle           2023-12-12  5552  		} else {
c4995ed24241c6 Daniel Golle           2023-12-12  5553  			if (MTK_HAS_CAPS=
(eth->soc->caps, MTK_SHARED_SGMII)) {
c4995ed24241c6 Daniel Golle           2023-12-12  5554  				/* single LynxI=
 PCS used by either GMAC */
c4995ed24241c6 Daniel Golle           2023-12-12  5555  				if (!test_bit(p=
hy_mode, eth->sgmii_pcs[0]->supported_interfaces))
c4995ed24241c6 Daniel Golle           2023-12-12  5556  					goto no_pcs;
c4995ed24241c6 Daniel Golle           2023-12-12  5557  				if (eth->shared=
_sgmii_used) {
c4995ed24241c6 Daniel Golle           2023-12-12  5558  					err =3D -EBUSY;
c4995ed24241c6 Daniel Golle           2023-12-12  5559  					goto free_netd=
ev;
c4995ed24241c6 Daniel Golle           2023-12-12  5560  				}
c4995ed24241c6 Daniel Golle           2023-12-12  5561  				sid =3D 0;
c4995ed24241c6 Daniel Golle           2023-12-12  5562  				eth->shared_sgm=
ii_used =3D true;
c4995ed24241c6 Daniel Golle           2023-12-12  5563  			} else {
c4995ed24241c6 Daniel Golle           2023-12-12  5564  				sid =3D id;
c4995ed24241c6 Daniel Golle           2023-12-12  5565  			}
c4995ed24241c6 Daniel Golle           2023-12-12  5566  		}
c4995ed24241c6 Daniel Golle           2023-12-12  5567 =20
c4995ed24241c6 Daniel Golle           2023-12-12  5568  		phy_interface_or(=
mac->phylink_config.supported_interfaces,
c4995ed24241c6 Daniel Golle           2023-12-12  5569  				 mac->phylink_c=
onfig.supported_interfaces,
c4995ed24241c6 Daniel Golle           2023-12-12  5570  				 mac->phylink_c=
onfig.pcs_interfaces);
83800d29f0c578 Russell King (Oracle   2021-11-16  5571) 	}
b8fc9f30821ec0 Ren=C3=A9 van Dorst         2019-08-25  5572 =20
c4995ed24241c6 Daniel Golle           2023-12-12  5573  no_pcs:
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5574  	if (mtk_is_netsys_=
v3_or_greater(mac->hw) &&
1bdea6fad6fb98 Bo-Cun Chen            2025-05-13  5575  	    MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_ESW) &&
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5576  	    id =3D=3D MTK_=
GMAC1_ID) {
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5577  		mac->phylink_conf=
ig.mac_capabilities =3D MAC_ASYM_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5578  						       MAC_SY=
M_PAUSE |
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5579  						       MAC_10=
000FD;
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5580  		phy_interface_zer=
o(mac->phylink_config.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5581  		__set_bit(PHY_INT=
ERFACE_MODE_INTERNAL,
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5582  			  mac->phylink_c=
onfig.supported_interfaces);
c4995ed24241c6 Daniel Golle           2023-12-12  5583  	} else if (MTK_HAS=
_CAPS(mac->hw->soc->caps, MTK_USXGMII)) {
c4995ed24241c6 Daniel Golle           2023-12-12  5584  		mac->phylink_conf=
ig.mac_capabilities |=3D MAC_5000FD | MAC_10000FD;
c4995ed24241c6 Daniel Golle           2023-12-12  5585  		__set_bit(PHY_INT=
ERFACE_MODE_5GBASER,
c4995ed24241c6 Daniel Golle           2023-12-12  5586  			  mac->phylink_c=
onfig.supported_interfaces);
c4995ed24241c6 Daniel Golle           2023-12-12  5587  		__set_bit(PHY_INT=
ERFACE_MODE_10GBASER,
c4995ed24241c6 Daniel Golle           2023-12-12  5588  			  mac->phylink_c=
onfig.supported_interfaces);
c4995ed24241c6 Daniel Golle           2023-12-12  5589  		__set_bit(PHY_INT=
ERFACE_MODE_USXGMII,
c4995ed24241c6 Daniel Golle           2023-12-12  5590  			  mac->phylink_c=
onfig.supported_interfaces);
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5591  	}
445eb6448ed3bf Lorenzo Bianconi       2023-07-25  5592 =20
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5593  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_SOC_MT7628))
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5594  		mac_ops =3D &rt53=
50_phylink_ops;
9a04d3b2f0708a Joris Vaisvila         2026-02-26  5595 =20
e4b4d8410c7cce Christian Marangi      2026-06-15  5596  	if (MTK_HAS_CAPS(m=
ac->hw->soc->caps, MTK_2P5GPHY) &&
e4b4d8410c7cce Christian Marangi      2026-06-15  5597  	    id =3D=3D MTK_=
GMAC2_ID)
e4b4d8410c7cce Christian Marangi      2026-06-15  5598  		__set_bit(PHY_INT=
ERFACE_MODE_INTERNAL,
e4b4d8410c7cce Christian Marangi      2026-06-15  5599  			  mac->phylink_c=
onfig.supported_interfaces);
e4b4d8410c7cce Christian Marangi      2026-06-15  5600 =20
656e705243fd0c John Crispin           2016-03-08  5601  	SET_NETDEV_DEV(eth=
->netdev[id], eth->dev);
eaadf9fd3f6390 John Crispin           2016-06-10  5602  	eth->netdev[id]->w=
atchdog_timeo =3D 5 * HZ;
656e705243fd0c John Crispin           2016-03-08  5603  	eth->netdev[id]->n=
etdev_ops =3D &mtk_netdev_ops;
656e705243fd0c John Crispin           2016-03-08  5604  	eth->netdev[id]->b=
ase_addr =3D (unsigned long)eth->base;
ee40681037c0e5 Nelson Chang           2016-09-17  5605 =20
296c9120752bab Stefan Roese           2019-08-16  5606  	eth->netdev[id]->h=
w_features =3D eth->soc->hw_features;
ee40681037c0e5 Nelson Chang           2016-09-17  5607  	if (eth->hwlro)
ee40681037c0e5 Nelson Chang           2016-09-17  5608  		eth->netdev[id]->=
hw_features |=3D NETIF_F_LRO;
ee40681037c0e5 Nelson Chang           2016-09-17  5609 =20
296c9120752bab Stefan Roese           2019-08-16  5610  	eth->netdev[id]->v=
lan_features =3D eth->soc->hw_features &
c6d96df9fa2c1d Felix Fietkau          2023-04-26  5611  		~NETIF_F_HW_VLAN_=
CTAG_TX;
296c9120752bab Stefan Roese           2019-08-16  5612  	eth->netdev[id]->f=
eatures |=3D eth->soc->hw_features;
656e705243fd0c John Crispin           2016-03-08  5613  	eth->netdev[id]->e=
thtool_ops =3D &mtk_ethtool_ops;
656e705243fd0c John Crispin           2016-03-08  5614 =20
20472491c458ab Mason Chang            2026-05-09  5615  	eth->netdev[id]->i=
rq =3D eth->irq_fe[MTK_FE_IRQ_SHARED];
3174b3b58cba69 Sean Wang              2017-04-07  5616  	eth->netdev[id]->d=
ev.of_node =3D np;
3174b3b58cba69 Sean Wang              2017-04-07  5617 =20
c4995ed24241c6 Daniel Golle           2023-12-12  5618  	phylink =3D phylin=
k_create(&mac->phylink_config,
c4995ed24241c6 Daniel Golle           2023-12-12  5619  				 of_fwnode_hand=
le(mac->of_node),
c4995ed24241c6 Daniel Golle           2023-12-12  5620  				 phy_mode, mac_=
ops);
c4995ed24241c6 Daniel Golle           2023-12-12  5621  	if (IS_ERR(phylink=
)) {
c4995ed24241c6 Daniel Golle           2023-12-12  5622  		err =3D PTR_ERR(p=
hylink);
c4995ed24241c6 Daniel Golle           2023-12-12  5623  		goto free_netdev;
c4995ed24241c6 Daniel Golle           2023-12-12  5624  	}
c4995ed24241c6 Daniel Golle           2023-12-12  5625 =20
c4995ed24241c6 Daniel Golle           2023-12-12  5626  	mac->phylink =3D p=
hylink;
c4995ed24241c6 Daniel Golle           2023-12-12  5627 =20
4fd59792097a6b DENG Qingfang          2021-01-25  5628  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_SOC_MT7628))
555a893303872e Landen Chao            2020-07-29  5629  		eth->netdev[id]->=
max_mtu =3D MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
4fd59792097a6b DENG Qingfang          2021-01-25  5630  	else
4fd59792097a6b DENG Qingfang          2021-01-25  5631  		eth->netdev[id]->=
max_mtu =3D MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;
555a893303872e Landen Chao            2020-07-29  5632 =20
f63959c7eec315 Felix Fietkau          2022-11-16  5633  	if (MTK_HAS_CAPS(e=
th->soc->caps, MTK_QDMA)) {
f63959c7eec315 Felix Fietkau          2022-11-16  5634  		mac->device_notif=
ier.notifier_call =3D mtk_device_event;
f63959c7eec315 Felix Fietkau          2022-11-16  5635  		register_netdevic=
e_notifier(&mac->device_notifier);
f63959c7eec315 Felix Fietkau          2022-11-16  5636  	}
f63959c7eec315 Felix Fietkau          2022-11-16  5637 =20
66c0e13ad236c7 Marek Majtyka          2023-02-01  5638  	if (mtk_page_pool_=
enabled(eth))
66c0e13ad236c7 Marek Majtyka          2023-02-01  5639  		eth->netdev[id]->=
xdp_features =3D NETDEV_XDP_ACT_BASIC |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5640  						NETDEV_XDP_AC=
T_REDIRECT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5641  						NETDEV_XDP_AC=
T_NDO_XMIT |
66c0e13ad236c7 Marek Majtyka          2023-02-01  5642  						NETDEV_XDP_AC=
T_NDO_XMIT_SG;
66c0e13ad236c7 Marek Majtyka          2023-02-01  5643 =20
656e705243fd0c John Crispin           2016-03-08  5644  	return 0;
656e705243fd0c John Crispin           2016-03-08  5645 =20
656e705243fd0c John Crispin           2016-03-08  5646  free_netdev:
656e705243fd0c John Crispin           2016-03-08  5647  	free_netdev(eth->n=
etdev[id]);
656e705243fd0c John Crispin           2016-03-08  5648  	return err;
656e705243fd0c John Crispin           2016-03-08  5649  }
656e705243fd0c John Crispin           2016-03-08  5650 =20

:::::: The code at line 5425 was first introduced by commit
:::::: c4995ed24241c642b1e4c4e23e18670c149ec6b7 net: ethernet: mtk_eth_soc:=
 add paths and SerDes modes for MT7988

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
