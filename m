Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297BA18FC74
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733375315; cv=none; b=OofNP3zU8C7Kj2kjFRwWef5KGln4g9Y5/zJVk4OmpU7uAPAkkgm00QdABVrrFs/mF1f1MHlQQjrdWNPE76qFNSyeG8/uOF4eG6Kgid2Sj6OJaoEZdB5VQ5Umc6trdyF9lWVxDVKt/a4ITgYNxKNCJhxUwao92EdLQ8GynHA7/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733375315; c=relaxed/simple;
	bh=cDtwxeKilP8bCjKL5fL8++QMAwBemerXQuiIUhzeFlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TafLNJSSGAkbOv2r8cRzCND724LAsoCgIAM/BJiRWg+XH85s4tyAoo7AVdu1oZz+0fxeY3g/sQwnRRtlyjWOz1pNqjZbDptS9iGc6gYFrSXsCKk3K5AldfCTaS5fTJaDhiZT6iCll+vaOEc3G9J2LOv+P5TokjZmIAQfGxpe7qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wse5+PIH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wse5+PIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733375314; x=1764911314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDtwxeKilP8bCjKL5fL8++QMAwBemerXQuiIUhzeFlU=;
  b=Wse5+PIHHeI6q9ylN5LTQsZn5LCAjLTjJYgDwJH40sD7BebQD9MbfW6E
   HuUrwamPlodayPunGCalHZivnMMqkBWRMvy7fpRlK7DOMKVb0kWSpn/T9
   wD41AtD11I4KfMIL4H21hiNAMOiWEclrVIm64DQep0pOf/+RGI6U6MfD5
   CNrXw0RlE6BO4ofSO1CJyInF5RJz5XFU+ZJeSzlx9ZR7QW1o8ON/Ee+HG
   jLTK92uAsI57MjmtNvSoQP2A0qIxB/kJPrj7CWqT1fgzcaS6C1uqeLwj0
   PfZJKbpaDpaFgluAQPs1lm/r4Pwtfnb54a6OkJTLvv5Vsmyj++mdle1q7
   w==;
X-CSE-ConnectionGUID: tAD0Jh8+RbKWONoM2LsFag==
X-CSE-MsgGUID: bmC10IMPRmyUTB4wzA6WTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33802252"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33802252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 21:08:33 -0800
X-CSE-ConnectionGUID: 23xVm0CXTCWRGDhkIbO+dg==
X-CSE-MsgGUID: 1AqMeu9HQ1u7zrGIA8GZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94818116"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 21:08:32 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ46I-0003p0-05;
	Thu, 05 Dec 2024 05:08:30 +0000
Date: Thu, 5 Dec 2024 13:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:8250-cleanup 13/13]
 drivers/tty/serial/8250/8250_core.c:842:15: error: implicit declaration of
 function 'sunserial_register_minors'
Message-ID: <202412051301.uW7jIWkl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git 8250-cleanup
head:   babed7b34c5946d07f915c7e4aab26fa2470ff86
commit: babed7b34c5946d07f915c7e4aab26fa2470ff86 [13/13] serial: 8250: split out legacy isa driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20241205/202412051301.uW7jIWkl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051301.uW7jIWkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051301.uW7jIWkl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_core.c: In function 'serial8250_init':
>> drivers/tty/serial/8250/8250_core.c:842:15: error: implicit declaration of function 'sunserial_register_minors' [-Wimplicit-function-declaration]
     842 |         ret = sunserial_register_minors(&serial8250_reg, UART_NR);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_core.c:855:9: error: implicit declaration of function 'sunserial_unregister_minors' [-Wimplicit-function-declaration]
     855 |         sunserial_unregister_minors(&serial8250_reg, UART_NR);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sunserial_register_minors +842 drivers/tty/serial/8250/8250_core.c

   834	
   835	static int __init serial8250_init(void)
   836	{
   837		int ret;
   838	
   839		serial8250_setup_ports();
   840	
   841	#ifdef CONFIG_SPARC
 > 842		ret = sunserial_register_minors(&serial8250_reg, UART_NR);
   843	#else
   844		serial8250_reg.nr = UART_NR;
   845		ret = uart_register_driver(&serial8250_reg);
   846	#endif
   847		if (ret)
   848			goto out;
   849	
   850		ret = serial8250_isa_init();
   851		if (ret == 0)
   852			return 0;
   853	
   854	#ifdef CONFIG_SPARC
 > 855		sunserial_unregister_minors(&serial8250_reg, UART_NR);
   856	#else
   857		uart_unregister_driver(&serial8250_reg);
   858	#endif
   859	out:
   860		return ret;
   861	}
   862	module_init(serial8250_init);
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
