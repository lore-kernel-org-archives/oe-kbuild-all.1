Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA717C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691912195; x=1723448195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/uLP2E3Uyz/c8Zy7DexKHefzpYXN+H2/4AHI8S9sRb4=;
  b=PVRvEJt9aCtYrhk8+8vMUp/qk1FQ8ISeqwJOMFxjR3cQ71GcdlZP6p7+
   kAlAcoM68uaFwitWxljiEuqAs5GYQpftf7jI71AI1MytMJrihZKpA62EO
   W66h4adE+ZILGGM0Rl6adNVzNePFjyD78JGDc4JyR18q2LWY8jh+rESTc
   ubJsC6F1V1cWfGrvVbqNCpfbRjZm1xqwhEAOTMjxxAUEbxlmxSiIbgaeT
   EJo2rXAgpAvaVKhpon25uBm14cAaT+s/kQwicOzsTpoDSSTA61wcvJGSL
   3TzbXyeEesDEvWDqzNsZlI2BgzcLoow18nhpCql7sdi2fmzQ+b2mPmHlq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="369346220"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="369346220"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 00:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876603763"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2023 00:36:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV5eK-00090K-2k;
	Sun, 13 Aug 2023 07:36:32 +0000
Date: Sun, 13 Aug 2023 15:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4 7967/8003]
 drivers/clk/mediatek/clk-mt7988-eth.c:128:25: error:
 'of_match_clk_mt7988_eth' undeclared here (not in a function); did you mean
 'of_match_clk_mt7986_eth'?
Message-ID: <202308131503.Ke0WGArO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4
head:   33ae06cdbe7cdded20d1ac549403343243272109
commit: 1e91394d28f99d3b7557a477cbded447e3279b83 [7967/8003] clk: mediatek: add drivers for MT7988 SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230813/202308131503.Ke0WGArO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131503.Ke0WGArO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308131503.Ke0WGArO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from include/linux/of_device.h:5,
                    from drivers/clk/mediatek/clk-mt7988-eth.c:11:
>> drivers/clk/mediatek/clk-mt7988-eth.c:128:25: error: 'of_match_clk_mt7988_eth' undeclared here (not in a function); did you mean 'of_match_clk_mt7986_eth'?
     128 | MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__of_match_clk_mt7988_eth_device_table' aliased to undefined symbol 'of_match_clk_mt7988_eth'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/clk/mediatek/clk-mt7988-eth.c:128:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     128 | MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
         | ^~~~~~~~~~~~~~~~~~~


vim +128 drivers/clk/mediatek/clk-mt7988-eth.c

   120	
   121	static const struct of_device_id of_match_clk_mt7986_eth[] = {
   122		{ .compatible = "mediatek,mt7988-ethsys", .data = &ethdma_desc },
   123		{ .compatible = "mediatek,mt7988-sgmiisys_0", .data = &sgmii0_desc },
   124		{ .compatible = "mediatek,mt7988-sgmiisys_1", .data = &sgmii1_desc },
   125		{ .compatible = "mediatek,mt7988-ethwarp", .data = &ethwarp_desc },
   126		{ /* sentinel */ }
   127	};
 > 128	MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_eth);
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
