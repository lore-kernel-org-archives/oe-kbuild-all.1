Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9E47476
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693427300; x=1724963300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2HSlgHmmcRoUCReyl+OhJKz7cdc+P35r1jmmRW+D8w=;
  b=kiaqGLEPVb+CKMv+jllAEACShlXefdTC8IwGn5Ro+eUH+1dvDn+5rvBQ
   Bw0OSWwPiMKHwSzHk66xXbnUcX2l4InPEXZg9ecpbj67fDxzRCJ4DYyP3
   J05A3FOWxejJYrTVJm07r5f8uemXnd0gUA65C3Pmn48NCSsuKWIGWSE22
   7OWQzMJQYCdVXxo9d5iofD7LDrT1VKGtCXbaTnvJ61XqJYy9PWLRIdvwQ
   Ra00rvC/1IBU1RsjWocnM0R7YD2Mdb8qse48/L3M6PkerBGPzoR7Z+VVp
   iG2/nuz50aqpVs7pUSImPq0R0hLW1WdQ8FLQ7YUW/vMBSiSf694i7dTL6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379494512"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="379494512"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 13:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="1069957521"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="1069957521"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2023 13:28:17 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbRkc-000AC5-0f;
	Wed, 30 Aug 2023 20:26:45 +0000
Date: Thu, 31 Aug 2023 04:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_3 11439/11537]
 drivers/net/ethernet/mediatek/mtk_usxgmii.c:656:41: warning: writing 1 byte
 into a region of size 0
Message-ID: <202308310458.HoL5v8IV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_3
head:   54bd1754325fff513afb9343c20b38e5a32c5ebd
commit: 7aca3d37f62dba77e6dc1683c4bf7fad96c348de [11439/11537] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310458.HoL5v8IV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310458.HoL5v8IV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310458.HoL5v8IV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_usxgmii.c: In function 'mtk_usxgmii_init':
>> drivers/net/ethernet/mediatek/mtk_usxgmii.c:656:41: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     656 |                 eth->usxgmii_pcs[i]->id = i;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   In file included from include/linux/dma-mapping.h:8,
                    from drivers/net/ethernet/mediatek/mtk_eth_soc.h:12,
                    from drivers/net/ethernet/mediatek/mtk_usxgmii.c:11:
   In function 'devm_kzalloc',
       inlined from 'mtk_usxgmii_init' at drivers/net/ethernet/mediatek/mtk_usxgmii.c:652:25:
   include/linux/device.h:314:16: note: at offset 28 into destination object of size 8 allocated by 'devm_kmalloc'
     314 |         return devm_kmalloc(dev, size, gfp | __GFP_ZERO);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +656 drivers/net/ethernet/mediatek/mtk_usxgmii.c

   639	
   640	int mtk_usxgmii_init(struct mtk_eth *eth)
   641	{
   642		struct device_node *r = eth->dev->of_node;
   643		struct device *dev = eth->dev;
   644		struct device_node *np;
   645		int i, ret;
   646	
   647		for (i = 0; i < MTK_MAX_DEVS; i++) {
   648			np = of_parse_phandle(r, "mediatek,usxgmiisys", i);
   649			if (!np)
   650				break;
   651	
   652			eth->usxgmii_pcs[i] = devm_kzalloc(dev, sizeof(*eth->usxgmii_pcs), GFP_KERNEL);
   653			if (!eth->usxgmii_pcs[i])
   654				return -ENOMEM;
   655	
 > 656			eth->usxgmii_pcs[i]->id = i;
   657			eth->usxgmii_pcs[i]->eth = eth;
   658			eth->usxgmii_pcs[i]->regmap = syscon_node_to_regmap(np);
   659			if (IS_ERR(eth->usxgmii_pcs[i]->regmap))
   660				return PTR_ERR(eth->usxgmii_pcs[i]->regmap);
   661	
   662			eth->usxgmii_pcs[i]->pcs.ops = &mtk_usxgmii_pcs_ops;
   663			eth->usxgmii_pcs[i]->pcs.poll = true;
   664			eth->usxgmii_pcs[i]->pcs.neg_mode = true;
   665			eth->usxgmii_pcs[i]->interface = PHY_INTERFACE_MODE_NA;
   666			eth->usxgmii_pcs[i]->neg_mode = -1;
   667	
   668			of_node_put(np);
   669		}
   670	
   671		ret = mtk_xfi_pextp_init(eth);
   672		if (ret)
   673			return ret;
   674	
   675		ret = mtk_xfi_pll_init(eth);
   676		if (ret)
   677			return ret;
   678	
   679		ret = mtk_toprgu_init(eth);
   680		if (ret)
   681			return ret;
   682	
   683		return mtk_sgmii_wrapper_init(eth);
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
