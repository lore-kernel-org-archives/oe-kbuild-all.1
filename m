Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4058358A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEmL3SRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137985; x=1728673985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9RIaXudoOpbrcqzpV9QroHTSGw0+lzUR7UTV9VHeBxU=;
  b=cEmL3SRzHSUDV17kmUyyIId6zZh5AD7mfCKvOEeMVRoTEUsfoEOOatRr
   rcOwUq82HIYPLJqcjhvDVDa91xe5jwmyzUIQuZvDMVBhdHQ8VYZ25wUsR
   /pB5g3VhcTrL6xuFFed2UWEmiMuImgO5b3AYWgid1kFqV7gX4skXol8/E
   Jbz6vkTGKhVm61b717a5Q+4oNzClqlIMCdtdCoHDRoEHPLgmfWCSSdxtR
   T/8BTC0NH5P9ZGmlCoUZW/YZ6aPu/6S8BteKKNCEvCMD9B2UM1QyJ23ww
   kYlIDzVprjkTANxT6vR735+OQKTCuKGYwC+I6aqXwLRL8obCGZuDbDgmZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365277839"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="365277839"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 12:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820266571"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820266571"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 12:13:01 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr17C-0003mM-0d;
	Thu, 12 Oct 2023 19:12:58 +0000
Date: Fri, 13 Oct 2023 03:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 9950/15768] csky-linux-ld:
 i2c-flexio.c:undefined reference to `flexio_setup_shiftcfg'
Message-ID: <202310130306.UvsIv0cZ-lkp@intel.com>
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
config: csky-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231013/202310130306.UvsIv0cZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130306.UvsIv0cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130306.UvsIv0cZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_init_hardware':
   i2c-flexio.c:(.text+0x94): undefined reference to `flexio_sw_reset'
>> csky-linux-ld: i2c-flexio.c:(.text+0xb6): undefined reference to `flexio_setup_shiftcfg'
>> csky-linux-ld: i2c-flexio.c:(.text+0xe4): undefined reference to `flexio_setup_shiftctl'
   csky-linux-ld: i2c-flexio.c:(.text+0xfc): undefined reference to `flexio_setup_shiftcfg'
   csky-linux-ld: i2c-flexio.c:(.text+0x128): undefined reference to `flexio_setup_shiftctl'
>> csky-linux-ld: i2c-flexio.c:(.text+0x152): undefined reference to `flexio_setup_timercfg'
>> csky-linux-ld: i2c-flexio.c:(.text+0x16c): undefined reference to `flexio_writel'
>> csky-linux-ld: i2c-flexio.c:(.text+0x1a4): undefined reference to `flexio_setup_timerctl'
   csky-linux-ld: i2c-flexio.c:(.text+0x1ce): undefined reference to `flexio_setup_timercfg'
   csky-linux-ld: i2c-flexio.c:(.text+0x1da): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x212): undefined reference to `flexio_setup_timerctl'
   csky-linux-ld: i2c-flexio.c:(.text+0x21c): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x226): undefined reference to `flexio_writel'
>> csky-linux-ld: i2c-flexio.c:(.text+0x22e): undefined reference to `flexio_get_default_ctrl'
>> csky-linux-ld: i2c-flexio.c:(.text+0x23a): undefined reference to `flexio_setup_ctrl'
>> csky-linux-ld: i2c-flexio.c:(.text+0x250): undefined reference to `flexio_sw_reset'
   csky-linux-ld: i2c-flexio.c:(.text+0x254): undefined reference to `flexio_setup_shiftcfg'
   csky-linux-ld: i2c-flexio.c:(.text+0x258): undefined reference to `flexio_setup_shiftctl'
   csky-linux-ld: i2c-flexio.c:(.text+0x25c): undefined reference to `flexio_setup_timercfg'
   csky-linux-ld: i2c-flexio.c:(.text+0x260): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x264): undefined reference to `flexio_setup_timerctl'
   csky-linux-ld: i2c-flexio.c:(.text+0x268): undefined reference to `flexio_get_default_ctrl'
   csky-linux-ld: i2c-flexio.c:(.text+0x26c): undefined reference to `flexio_setup_ctrl'
   csky-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_master_xfer':
   i2c-flexio.c:(.text+0x4f0): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x4fa): undefined reference to `flexio_writel'
>> csky-linux-ld: i2c-flexio.c:(.text+0x52a): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x568): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x580): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x58a): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x5a0): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x61c): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x644): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x686): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x698): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x69c): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x6b8): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x6f6): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x71c): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x768): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x772): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x784): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x79e): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x7a8): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x7ba): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x7c4): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x7d6): undefined reference to `flexio_writel'
   csky-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x81e): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x83c): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x850): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x86e): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x87c): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x888): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x8a0): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x8c2): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x8e2): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x912): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x91c): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x938): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x974): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x9a4): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x9b8): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0x9bc): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x9ce): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0x9f4): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xa0a): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xa32): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xa40): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xa52): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xa5c): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xa70): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xa8a): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xac0): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xace): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xad8): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xae6): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xaf6): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xb0a): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xb14): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xb24): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xb34): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xb38): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xb54): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xb62): undefined reference to `flexio_writel'
   csky-linux-ld: i2c-flexio.c:(.text+0xb78): undefined reference to `flexio_readl'
   csky-linux-ld: i2c-flexio.c:(.text+0xb7c): undefined reference to `flexio_writel'
   csky-linux-ld: drivers/firmware/imx/imx-scu-soc.o: in function `imx_scu_soc_init':
   imx-scu-soc.c:(.text+0x168): undefined reference to `TKT340553_SW_WORKAROUND'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
