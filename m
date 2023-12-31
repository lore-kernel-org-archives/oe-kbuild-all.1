Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6568EFBE1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 00:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8R/hufu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703981007; x=1735517007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3SfwUoaFCTVfJblghSA3gp/HHf4S1N1v9iI36AEo5+U=;
  b=X8R/hufuBax6jdDX9zZI9vRKgbgNYw/kBEmdmcwV83eoDLfIOis5/WQJ
   fxtl+EEfbaTrGQLMdw0Fb+DefpPB/dGWDZDexMszsiRRojS2zfhNMOEFs
   hwmAFqGpId4K4vFW8ZDRcFvPtOLEenqu6hdVz38QPTTpueBtzfEtvjUyW
   o8wkW2uD3zevBDttVSDJDGD4k1Uetnu8Bk2HBoKykpk/tQigf3krx6vAZ
   5QVj2w5zZr5yFzPPrCaI+Gp+F8I22iO9vnD1YooRTubvFOVWvWIX7KfYj
   bfm02kwb1ByZwQ4THd5gxAdueiZ7BRphh2Wb0xsGvnZ4iMtXgF8fsRzAT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="4033892"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="4033892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 16:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="27504633"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Dec 2023 16:03:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJjIY-000Iqz-1x;
	Sun, 31 Dec 2023 00:03:22 +0000
Date: Sun, 31 Dec 2023 08:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9336/10295] ld.lld: error: undefined symbol:
 devm_led_classdev_register_ext
Message-ID: <202312310730.IpNmGtcO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 18764b883e157e28126b54e7d4ba9dd487d5bf54 [9336/10295] r8169: add support for LED's on RTL8168/RTL8101
config: i386-randconfig-r054-20231230 (https://download.01.org/0day-ci/archive/20231231/202312310730.IpNmGtcO-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312310730.IpNmGtcO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310730.IpNmGtcO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_register_ext
   >>> referenced by leds.h:299 (include/linux/leds.h:299)
   >>>               drivers/net/ethernet/realtek/r8169_leds.o:(rtl8168_init_leds) in archive vmlinux.a
   >>> referenced by leds.h:299 (include/linux/leds.h:299)
   >>>               drivers/net/ethernet/realtek/r8169_leds.o:(rtl8168_init_leds) in archive vmlinux.a
   >>> referenced by leds.h:299 (include/linux/leds.h:299)
   >>>               drivers/net/ethernet/realtek/r8169_leds.o:(rtl8168_init_leds) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
