Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3944340A59
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 18:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081244; cv=none; b=CqOODaZQP/eEr7jArQN4wlym5gApLVeVEPhRSQ3DLnsn9rFnABpZ4xMDmTiepQb2o/HaJHE4JLq4edFUtqVnnDrrnIVqvZZMMQNEN8Xwm2BFOkeypKxw5ZPWWrOwXZFRT+GojPk8+PQhuxjSxO/OvWBE+bBiOTpuMoFYrjwhsXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081244; c=relaxed/simple;
	bh=/Qb/FLH/G6kQx1MkvryNW1UrqlkUoL5NA7llWAKCvrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VlLQB97F90hgA8ML6IkabHIkyVlfCiuzw4YJSX/zzrMFqOObNTU/zMFMcMc0UzrGFMRYgbrA3AGGpO8jn/penA5V4BYq02jvBvYinltoLFlbR3m7lIhu3yhzh6OzVEWkN6Q4ZDihu4AwCkkLxREgCD1acOtHwKRKyE5DCr6bm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yf2sPXmm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yf2sPXmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773081243; x=1804617243;
  h=date:from:to:cc:subject:message-id;
  bh=/Qb/FLH/G6kQx1MkvryNW1UrqlkUoL5NA7llWAKCvrg=;
  b=Yf2sPXmmhgfalcRWoAhzFhnMLbJwvlDDhd73TpIVg/v+6IV9HzirYcjP
   cM5p9rAuk+Jty0Y+Pjv7akurFlXR5YEIaeImgkeqjxo1pSyWFw9mnWOeq
   JABU9tOGWsdTE44deFF3oEAz1QRCJMcKYzOxHJyB9SPTYPTSWE6TAy5bl
   mlG8spL5E5bHUJbd0UhF03q+cf716CEtJMhErJE4u5BMZHs+V0V4uMIBt
   hKkC3+i03DY8BUrVhfl2ItsB1L6HlUc8w4GA6Q78WGEFnBTRY0rMjrSOu
   LT+MoTsM4yki+wxWU9DGxZyqRTMKMXOQVlSzf4rM2L6A5ufCo4WA24tEV
   w==;
X-CSE-ConnectionGUID: i/Dw+EAVRNulm/nYZbIiZw==
X-CSE-MsgGUID: Kd96k3IySYCpoDeFR89i8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73314790"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73314790"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 11:34:02 -0700
X-CSE-ConnectionGUID: ofHzvFoUSb2S7hvzx5K8gw==
X-CSE-MsgGUID: PGIAsbhLT8mrLNafBPi5mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219966885"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Mar 2026 11:34:01 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzfQT-000000000hQ-2Rr3;
	Mon, 09 Mar 2026 18:33:57 +0000
Date: Tue, 10 Mar 2026 02:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 73/87]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5599:6: warning: variable 'flags'
 set but not used
Message-ID: <202603100205.3PH5mGcC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 62b5fb77a2bb10bff6a473e3e4126823dd32f03d [73/87] net: pcs: mtk-lynxi: add phya tx rx clock path
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260310/202603100205.3PH5mGcC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100205.3PH5mGcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100205.3PH5mGcC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c:5110:18: warning: unused variable 'mac' [-Wunused-variable]
    5110 |         struct mtk_mac *mac = netdev_priv(dev);
         |                         ^~~
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5599:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    5599 |         u32 flags = 0;
         |             ^
   2 warnings generated.


vim +/flags +5599 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5594	
  5595	static int mtk_sgmii_init(struct mtk_eth *eth)
  5596	{
  5597		struct device_node *np;
  5598		struct regmap *regmap;
> 5599		u32 flags = 0;
  5600		int i;
  5601	
  5602		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5603			np = of_parse_phandle(eth->dev->of_node, "mediatek,sgmiisys", i);
  5604			if (!np)
  5605				break;
  5606	
  5607			regmap = syscon_node_to_regmap(np);
  5608			if (IS_ERR(regmap)) {
  5609				of_node_put(np);
  5610	
  5611			if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
  5612				flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
  5613	
  5614			of_node_put(np);
  5615	
  5616			if (IS_ERR(regmap))
  5617				return PTR_ERR(regmap);
  5618			}
  5619	
  5620			eth->sgmii_pcs[i] = mtk_pcs_lynxi_create(eth->dev,
  5621								 of_fwnode_handle(np),
  5622								 regmap,
  5623								 eth->soc->ana_rgc3);
  5624			of_node_put(np);
  5625		}
  5626	
  5627		return 0;
  5628	}
  5629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
