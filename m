Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101557;
	b=U/+aKLBJIDQ3y2NsqQV+7QiLbrABdTildMmTaA3y1MekftsD6sJA5xD8IoTwAAQWVf2T
	 Tdq8kPZ+aYNEU697i9AfaYTrGUpnf9nvY0qLp3rycN0K1bX3PULb8Qb92ay55+hSlX7IQ
	 HGl8MuJUtVdJh+Ioum4P31DKAPa2AIhE3YoE1dsuK+uGh5g3/pfw21KLxt6pjH/jjxJ+6
	 fuSM/516O8JCX1GZGuXaDBiIwG853eouaAMA89x9NX+CVRyEhVn6JLBEgy167h3HrCyb+
	 OtTnK/t4LeLmD5hr7C3sBD00BLtlXpG2brhspXSvtCTFl0bFWm5iTOAtFF63Ht6jrww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101557;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=d0odrOvnNqzJO4eD1wbkh5ioeEFCAoZM1unEBDSwPOw=;
	b=QZExMPXfUAaWpRt3iL1FyifP07LDDvAlV65LuAanJyd4qVPAnzWQEpXLRkUHy0a0H7V5
	 YO0Zh1+gg8bW4dhIgyrlMFmpAXfnraWpvkLEU3qvS4zc1I1ySOcCMZv5g3A++3k7gb948
	 L0zGdaOsqV54uYFO38VtEpDlLNq9fF74yixSK1cN6+6qjiGbckTUPMqfyzMz2ZarTVde6
	 NlJ2VZnIkmtg2ZtnkQeg6p9BvSbZ4fJAkjtfdpOYegQZQvsOeMqLOZ5yUpjN7yIRSUYRq
	 he1WA4zcz60wpzVGW1sPe3joIJ4AAWunR3AS07wOeqaXb1jCH9QqiI3Xxmtbiqv6Qzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CA3nMrHF;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A88B606A33A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 01:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A88B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CA3nMrHF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794101557; x=1825637557;
  h=date:from:to:cc:subject:message-id;
  bh=3XqEm4M889Q7cIdlFta3UH5gq9VJHXos9tQsNTqw/O4=;
  b=CA3nMrHFUR6i2n8q8mJ9cZMrPhhm16DjqgazsO223SIQH5eXmMDe8JBd
   0Zb5v8u/gZI9JkI2YgdUJev7jsvXeEtvBIFgWQes3+M5DPkjeO8AWpGmk
   crg0rAGYAsqtxa/nHtmxuZQ+90G6EEKZM278xN3Xxs3dwEMHxAeuh73uv
   ZiuwpwRrHgNH4HdKYGsaW8wbz3pj+/XMRLE13j7lvTnAvfDX++OHTFnfR
   sNi2IO+TNVB7sX15/VZsKDknRAv4COB0KuKHaVYLzhFW36P658aBLpJ9q
   rvcAbsNx0oRb5Gg3lN6+UVsAr8xWBmsHN3g29ukt96Z85EdwynwYYt8BQ
   A==;
X-CSE-ConnectionGUID: DFBiwZZXQsiZwOsqE4zR0Q==
X-CSE-MsgGUID: oBTHfMekQ5ei6dyh7VQnVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2774509"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2774509"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 17:32:36 -0800
X-CSE-ConnectionGUID: 1pWvj7dLSxGEjF6tB0+S6Q==
X-CSE-MsgGUID: PMVUaubwS4KVVSg3iTczbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7471600"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2026 17:32:35 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPrlo-00000000AwJ-2RUo;
	Sun, 08 Nov 2026 01:32:32 +0000
Date: Sun, 08 Nov 2026 02:31:46 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 37/154]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5536 mtk_sgmii_init() warn:
 inconsistent indenting
Message-ID: <202611080214.dRIobVGk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: 51267acf54375bc00d77b438e7557a1fc0f0017e [37/154] net: pcs: mtk-lynxi: add phya tx rx clock path
config: arm-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080214.dRIobVGk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080214.dRIobVGk-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:5536 mtk_sgmii_init() warn: inconsistent indenting

Old smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:5815 mtk_probe() error: buffer overflow 'eth->irq_pdma' 4 <= 4

vim +5536 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5519	
  5520	static int mtk_sgmii_init(struct mtk_eth *eth)
  5521	{
  5522		struct device_node *np;
  5523		struct regmap *regmap;
  5524		u32 flags = 0;
  5525		int i;
  5526	
  5527		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5528			np = of_parse_phandle(eth->dev->of_node, "mediatek,sgmiisys", i);
  5529			if (!np)
  5530				break;
  5531	
  5532			regmap = syscon_node_to_regmap(np);
  5533			if (IS_ERR(regmap)) {
  5534				of_node_put(np);
  5535	
> 5536			if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
  5537				flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
  5538	
  5539			of_node_put(np);
  5540	
  5541			if (IS_ERR(regmap))
  5542				return PTR_ERR(regmap);
  5543			}
  5544	
  5545			eth->sgmii_pcs[i] = mtk_pcs_lynxi_create(eth->dev,
  5546								 of_fwnode_handle(np),
  5547								 regmap,
  5548								 eth->soc->ana_rgc3);
  5549			of_node_put(np);
  5550		}
  5551	
  5552		return 0;
  5553	}
  5554	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
