Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067630D15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7X7bb9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697126429; x=1728662429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NI6FgDQbI1s2r5T06l4HY+ahVXePDzuNdKeBud1qc7o=;
  b=j7X7bb9ccs4V03g3mrrlqxDgFJSeWMxZUoBFoby0TTGraL7hD24xlK1t
   /F2m9TPPS6FWKqMBHrO328A8ZuGiCkUSSY619R3eIJpzFhcuJz0yrkHbs
   TGPn2hQnW7sEUqLmEv6A2Iiiati8g4+JsPSbujS9ivhk5WOWR+K7nt1ZP
   tX6uoAIj48MDlnFvnyi8eetdu/hGSkBR/4yuKrijEA297CLS+onsEdUTi
   7RlblvlSP00IaxqkKNDi3Z1MO6NffD56TLVACp8J0R34X+ekhPG+IaoVM
   a6qwpHWXhhX7QXIKdTG1tPoZLqzmBr60PvqKs71B+G5MzyJmREFDxZuH1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471214353"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471214353"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928045572"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="928045572"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Oct 2023 09:00:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqy6n-0003b7-1x;
	Thu, 12 Oct 2023 16:00:21 +0000
Date: Thu, 12 Oct 2023 23:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 9950/15768] arceb-elf-ld:
 i2c-flexio.c:undefined reference to `flexio_sw_reset'
Message-ID: <202310122305.c2se7etU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 16b65085d4d93242942e510c861a445167acc4e6 [9950/15768] LF-8343-2: driver: i2c: buses: flexio: rework to use mfd
config: arc-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231012/202310122305.c2se7etU-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122305.c2se7etU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122305.c2se7etU-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_init_hardware':
   i2c-flexio.c:(.text+0x7a): undefined reference to `flexio_sw_reset'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x7a): undefined reference to `flexio_sw_reset'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x8e): undefined reference to `flexio_setup_shiftcfg'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x8e): undefined reference to `flexio_setup_shiftcfg'
>> arceb-elf-ld: i2c-flexio.c:(.text+0xb4): undefined reference to `flexio_setup_shiftctl'
>> arceb-elf-ld: i2c-flexio.c:(.text+0xb4): undefined reference to `flexio_setup_shiftctl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xc8): undefined reference to `flexio_setup_shiftcfg'
   arceb-elf-ld: i2c-flexio.c:(.text+0xc8): undefined reference to `flexio_setup_shiftcfg'
   arceb-elf-ld: i2c-flexio.c:(.text+0xee): undefined reference to `flexio_setup_shiftctl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xee): undefined reference to `flexio_setup_shiftctl'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x10e): undefined reference to `flexio_setup_timercfg'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x10e): undefined reference to `flexio_setup_timercfg'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x12e): undefined reference to `flexio_writel'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x12e): undefined reference to `flexio_writel'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x15a): undefined reference to `flexio_setup_timerctl'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x15a): undefined reference to `flexio_setup_timerctl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x176): undefined reference to `flexio_setup_timercfg'
   arceb-elf-ld: i2c-flexio.c:(.text+0x176): undefined reference to `flexio_setup_timercfg'
   arceb-elf-ld: i2c-flexio.c:(.text+0x184): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x184): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x1b4): undefined reference to `flexio_setup_timerctl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x1b4): undefined reference to `flexio_setup_timerctl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x1c0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x1c0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x1ca): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x1ca): undefined reference to `flexio_writel'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x1d0): undefined reference to `flexio_get_default_ctrl'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x1d0): undefined reference to `flexio_get_default_ctrl'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x1de): undefined reference to `flexio_setup_ctrl'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x1de): undefined reference to `flexio_setup_ctrl'
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_master_xfer':
   i2c-flexio.c:(.text+0x448): undefined reference to `flexio_readl'
>> arceb-elf-ld: i2c-flexio.c:(.text+0x448): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x460): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x460): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x46a): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x46a): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x47a): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x47a): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x484): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x484): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x494): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x494): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x4bc): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x4bc): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x4c8): undefined reference to `flexio_writel'
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0x4c8): more undefined references to `flexio_writel' follow
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_master_xfer':
   i2c-flexio.c:(.text+0x4e8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x4e8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x536): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x536): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x544): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x544): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x54c): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x54c): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x55e): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x55e): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x5ce): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x5ce): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x5fe): undefined reference to `flexio_writel'
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0x5fe): more undefined references to `flexio_writel' follow
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x792): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x792): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x7c0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x7c0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x7e6): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x7e6): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x824): undefined reference to `flexio_writel'
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0x824): more undefined references to `flexio_writel' follow
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x86c): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x86c): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x87a): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x87a): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x886): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x886): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x8aa): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x8aa): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x8c0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x8c0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x8e8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x8e8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x906): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x906): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x916): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x916): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x92a): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x92a): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x938): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x938): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x958): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x958): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0x97a): undefined reference to `flexio_writel'
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0x97a): more undefined references to `flexio_writel' follow
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x9d8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x9d8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x9e8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0x9e8): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa22): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa22): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa2c): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa2c): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa7a): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa7a): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa88): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa88): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa92): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xa92): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xaa0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xaa0): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xac4): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xac4): undefined reference to `flexio_readl'
   arceb-elf-ld: i2c-flexio.c:(.text+0xad4): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xad4): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xade): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xade): undefined reference to `flexio_writel'
   arceb-elf-ld: i2c-flexio.c:(.text+0xaf2): undefined reference to `flexio_writel'
   arceb-elf-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0xaf2): more undefined references to `flexio_writel' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
