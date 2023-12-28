Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBF0468A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 03:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfF4Y86/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703733300; x=1735269300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ofshb9drJ4xYSbx7XZAav0gXlT2jZFoJataiBLYNPeo=;
  b=UfF4Y86/HeYsJ0l+WnjioG+l9IwGp/k+ShBlWo4yTD9hlTmqdhcyHIug
   R32XjTIcMT6Kp6xAQRAq80Awe78nLdX/r9VpuPUSIwuQSYNU6VIsCr3wM
   Z/9y+me5kuouDE579J4eRUyGAOZlmpENj1sx62TIzYp1Nps7IWBIIiW9b
   jOearxPS/vVuBHt9D3h3dKJeivAjuaxyPmokqgDF/Uj4xVxwG3xzbJxU4
   rO/Vw1YxadOx63cP6qWSfjTksAxDvACrt/Y8itF4JwPE4xnznkXSR+d6t
   8p1fT3tNw9nwtsDZl3Leq06O9UdJK6LFnl1v5m4710U2wXhzN2vkcBsHH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="399291604"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="399291604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 19:14:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="951680988"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="951680988"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Dec 2023 19:14:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIgrI-000FyX-0H;
	Thu, 28 Dec 2023 03:14:56 +0000
Date: Thu, 28 Dec 2023 11:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9336/10295]
 drivers/net/ethernet/realtek/r8169_leds.c:undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202312281159.9TPeXbNd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 18764b883e157e28126b54e7d4ba9dd487d5bf54 [9336/10295] r8169: add support for LED's on RTL8168/RTL8101
config: mips-randconfig-r003-20230302 (https://download.01.org/0day-ci/archive/20231228/202312281159.9TPeXbNd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312281159.9TPeXbNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312281159.9TPeXbNd-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: kernel/kexec_core.o: in function `kimage_free':
   kernel/kexec_core.c:(.text+0x1208): undefined reference to `machine_kexec_cleanup'
   mips-linux-ld: kernel/kexec_core.o: in function `__crash_kexec':
   kernel/kexec_core.c:(.text+0x16d4): undefined reference to `machine_crash_shutdown'
   mips-linux-ld: kernel/kexec_core.c:(.text+0x16dc): undefined reference to `machine_kexec'
   mips-linux-ld: kernel/kexec_core.o: in function `kernel_kexec':
   kernel/kexec_core.c:(.text+0x1bf8): undefined reference to `machine_shutdown'
   mips-linux-ld: kernel/kexec_core.c:(.text+0x1c08): undefined reference to `machine_kexec'
   mips-linux-ld: drivers/net/ethernet/realtek/r8169_leds.o: in function `rtl8168_init_leds':
>> drivers/net/ethernet/realtek/r8169_leds.c:(.text+0x2b8): undefined reference to `devm_led_classdev_register_ext'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
