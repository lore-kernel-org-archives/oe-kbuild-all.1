Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEB67E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCzvbDJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698019462; x=1729555462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLkpUqCG5zU6TxgYcYw9yfVxS+r1ryDJFJIe5RUBIJA=;
  b=BCzvbDJ6oMm2E+E8SSaOfG/W1ArVGSU7p/7Jc5M2cWtUnTT3IdlR/puY
   wzuRDp2RVmhPtXHx7nHQPgdmxdiFig1eQko76rRIie6wFA8mkbQsaHJWu
   yhdz2FlW3TYSvjsJ5G6Zq0CDAFzyLG97HFWvgM/4++pt+b5CNAJTnMSAj
   aLsLdhzilBZzcFrZ+qYToiDpdYFIXwNVKaytOQEWjciGFyIeNl++H3gTa
   ryPRanlCllfIxW9KYYDsi1N8XH9rIt0ZaZxgf5JTR5mMWb/kOeilE8LDi
   e+gwa8F0e/Jr6N30lQNKJ8hh5cEuUbc9MM01zfv+N9xZkeKSdmSAS+3wy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="377114015"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="377114015"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 17:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="5896213"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2023 17:04:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quiQc-0006Nw-1l;
	Mon, 23 Oct 2023 00:04:18 +0000
Date: Mon, 23 Oct 2023 08:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:host-upstream-wip 21/24]
 arch/x86/kernel/acpi/boot.c:782:14: error: static declaration of
 'acpi_suspend_lowlevel' follows non-static declaration
Message-ID: <202310230818.aJ1sYTaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kai,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/tdx.git host-upstream-wip
head:   d4844073b181fc98ffae310d8bfa534ab6d18155
commit: 9372e0278e2a14419d08e8df36e474dc72d93784 [21/24] x86/acpi: Add a helper to override ACPI lowlevel suspend function
config: x86_64-buildonly-randconfig-002-20231023 (https://download.01.org/0day-ci/archive/20231023/202310230818.aJ1sYTaS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310230818.aJ1sYTaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230818.aJ1sYTaS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/acpi/boot.c:782:14: error: static declaration of 'acpi_suspend_lowlevel' follows non-static declaration
     782 | static int (*acpi_suspend_lowlevel)(void) = x86_acpi_suspend_lowlevel;
         |              ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/acpi/acpi_io.h:7,
                    from include/linux/acpi.h:37,
                    from arch/x86/kernel/acpi/boot.c:11:
   arch/x86/include/asm/acpi.h:64:14: note: previous declaration of 'acpi_suspend_lowlevel' with type 'int (*)(void)'
      64 | extern int (*acpi_suspend_lowlevel)(void);
         |              ^~~~~~~~~~~~~~~~~~~~~


vim +/acpi_suspend_lowlevel +782 arch/x86/kernel/acpi/boot.c

   780	
   781	#ifdef CONFIG_ACPI_SLEEP
 > 782	static int (*acpi_suspend_lowlevel)(void) = x86_acpi_suspend_lowlevel;
   783	#else
   784	static int (*acpi_suspend_lowlevel)(void);
   785	#endif
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
