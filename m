Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD5FD50F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689700451; x=1721236451;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2slYWp1ImBIClIPL0EaW3FvDPNfCP37Haq6r/N5yMTM=;
  b=Mt8/Dgx6WyFbFKzI2HNvc7ICpLusmE1K9amU8G9GejnCssCflIeXC/RI
   eNT98GypVldW2MxL53VaxY/XpnMYozIkFem4vDW3Kmm+wsTlMh/V4X76B
   uyZKsAayZbMFeIePhGt3iJI0BthKpZwMVnlRwbdmJqnO7CxZZKaGlsyws
   xzMkTPmou8Ot+bqlkqRrbaG734x1nsicHCkeQGEgqx0Xxxq12My2/T3Lk
   Eo1c2FpeBw7XCxJGqQSb6W6Sb4kH2+nNE5ZGqJ/9HXjELCBFbfowxgQ41
   51V7vEmr7sG6qtiB+NunQK7XLB1Hjsxx92FYeK2ub4gOV3vyIuQI2UXti
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346562707"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="346562707"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 10:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="727024651"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="727024651"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2023 10:14:10 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLoGz-0002Jf-1m
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Jul 2023 17:14:06 +0000
Date: Wed, 19 Jul 2023 01:13:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 22448/26803]
 include/linux/dovetail.h:234:10: fatal error: asm/dovetail.h: No such file
 or directory
Message-ID: <202307190149.qjzGRgbO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   9ebe966c9db2389fa11b6997119b22b7374fd44d
commit: 03b1e7a382974fcb9316972ef10fad37dac90382 [22448/26803] dovetail: include asm/dovetail.h even if !DOVETAIL
config: nios2-randconfig-r031-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190149.qjzGRgbO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190149.qjzGRgbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190149.qjzGRgbO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:23,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/kernel/asm-offsets.c:9:
>> include/linux/dovetail.h:234:10: fatal error: asm/dovetail.h: No such file or directory
     234 | #include <asm/dovetail.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   make[2]: *** [scripts/Makefile.build:121: arch/nios2/kernel/asm-offsets.s] Error 1 shuffle=2315842978
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1254: prepare0] Error 2 shuffle=2315842978
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2 shuffle=2315842978
   make: Target 'prepare' not remade because of errors.


vim +234 include/linux/dovetail.h

   232	
   233	/* We may have arch-specific placeholders. */
 > 234	#include <asm/dovetail.h>
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
