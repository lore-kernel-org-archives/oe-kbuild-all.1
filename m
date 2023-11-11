Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCFD6FA7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCCTbH08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699734888; x=1731270888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b13dmVzHvBgSWjIcL/bo4/Os5ljo3h17jpI3M3+GlLQ=;
  b=gCCTbH08Qptnh2IT6VJu+toWtrCrIilwEubL8E447HQ3OUhiPkGN0fbv
   zsYAqKvi/8hzLAiDB7xhCT6lTnp6WFw8/46D2vJ2HQy2YZLEUWNpVeJ9A
   uREswPMqcSBUqCK/9ToR8pPzxBTeCbhPdxAzDROC9g1y2IwHXSr23XrpU
   SwzO7QdZhePsMBiefUsZ7713PraEKVsd9W5lo6mx7yv4ABcCwCadc94C1
   /kmoMcwScJ6U8lgZVeutUncG+MyYXttXUlDLo7B5CgS3AMzujv00NDypb
   4/Akt+57KRTBh7DraE2sZCkYAML7qkNUpWh3H5XKACLrS7tfMzLLFVW8C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="375325511"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="375325511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 12:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="713885483"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="713885483"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Nov 2023 12:34:47 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ugm-000AjO-30;
	Sat, 11 Nov 2023 20:34:44 +0000
Date: Sun, 12 Nov 2023 04:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/pinctrl/pinctrl-ep93xx.c:682:27: warning:
 'raster_on_sdram3_pins' defined but not used
Message-ID: <202311120427.y51eB09W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sverdlin/linux ep93xx-i2s-dma
head:   2e1bf6b46aac1ecbd5a4f8d6ec0e888b05a2e090
commit: b5290cbbb088c22e36a712ded379a38ea7db91db ARM: ep93xx: DT for the Cirrus ep93xx SoC platforms
date:   4 days ago
config: arm-ep93xx_defconfig (https://download.01.org/0day-ci/archive/20231112/202311120427.y51eB09W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120427.y51eB09W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120427.y51eB09W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-ep93xx.c:682:27: warning: 'raster_on_sdram3_pins' defined but not used [-Wunused-const-variable=]
     682 | static const unsigned int raster_on_sdram3_pins[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~


vim +/raster_on_sdram3_pins +682 drivers/pinctrl/pinctrl-ep93xx.c

65aceaa56bc722 Nikita Shubin 2023-06-01  681  
65aceaa56bc722 Nikita Shubin 2023-06-01 @682  static const unsigned int raster_on_sdram3_pins[] = {
65aceaa56bc722 Nikita Shubin 2023-06-01  683  };
65aceaa56bc722 Nikita Shubin 2023-06-01  684  

:::::: The code at line 682 was first introduced by commit
:::::: 65aceaa56bc722c3adfe0577896fb15a98b83c75 pinctrl: add a Cirrus ep93xx SoC pin controller

:::::: TO: Nikita Shubin <nikita.shubin@maquefel.me>
:::::: CC: Nikita Shubin <nikita.shubin@maquefel.me>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
