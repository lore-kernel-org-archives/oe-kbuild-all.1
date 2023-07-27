Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C38219C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 00:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690417202; x=1721953202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9u6X9qZP3IdUtT36DvgdSYzUtjV8Wj1BxFR1sJM/M2Y=;
  b=LtGYvM+oaUY0avTVAOrPTAf/KSMUfQGeXwEVQeZkk+TZzHy8fN3z+WV/
   CHpha7hlMt9jVVpMI6t6w313sffTTw/vpyoFrZRnXEwkRFArYwF1AnTBA
   CHYtXCPOChPxgyGj+0AD96lC487d2M13upZv64rS9CyMwJoHB5Cl8OK8w
   XH2m921PXsTyTCmkDLVOB2ImEh5+0KCDmPjMtaNPxra6iOFVbPvolsOZb
   K6euiUnWizDgrr4wmWy9TqUt9I0QoygGQWTFMg3wMOR5cL7mnQSQ+zQzz
   NsqbJ35XwP3Kw8fdjeHdH15FQkOdMH0+5wMJYVoW95MkZrUU/cSuBCr6S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358166132"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="358166132"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 17:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="730055473"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="730055473"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 17:20:00 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOojX-0001T5-24;
	Thu, 27 Jul 2023 00:19:59 +0000
Date: Thu, 27 Jul 2023 08:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10-gki-base 5/5]
 drivers/staging/Kconfig:121: can't open file
 "drivers/staging/dev-sw-sync/Kconfig"
Message-ID: <202307270828.OcKEDf9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10-gki-base
head:   ef6460a91e988fd1da22cb484a52ab23b7bf7bec
commit: ef6460a91e988fd1da22cb484a52ab23b7bf7bec [5/5] Remove DEV_SW_SYNC driver
config: i386-randconfig-r026-20230726 (attached as .config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270828.OcKEDf9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270828.OcKEDf9Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/Kconfig:121: can't open file "drivers/staging/dev-sw-sync/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: oldconfig] Error 1 shuffle=3757489570
   make[1]: *** [Makefile:631: oldconfig] Error 2 shuffle=3757489570
   make: *** [Makefile:192: __sub-make] Error 2 shuffle=3757489570
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/staging/Kconfig:121: can't open file "drivers/staging/dev-sw-sync/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: olddefconfig] Error 1 shuffle=3757489570
   make[1]: *** [Makefile:631: olddefconfig] Error 2 shuffle=3757489570
   make: *** [Makefile:192: __sub-make] Error 2 shuffle=3757489570
   make: Target 'olddefconfig' not remade because of errors.


vim +121 drivers/staging/Kconfig

1747938a37d1df Mauro Carvalho Chehab 2020-08-17  120  
48ea82ac43eed4 srok                  2021-12-07 @121  source "drivers/staging/dev-sw-sync/Kconfig"
48ea82ac43eed4 srok                  2021-12-07  122  

:::::: The code at line 121 was first introduced by commit
:::::: 48ea82ac43eed4b05156e7875d41e2f354d101bc CHROMIUM: [arcvm-kernel-v5.10] Add dev_sw_sync option

:::::: TO: srok <srok@google.com>
:::::: CC: Treehugger Robot <treehugger-gerrit@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
