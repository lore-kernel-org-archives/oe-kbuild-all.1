Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9A635
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692248661; x=1723784661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2mPcAHxYd1Y3BwtFX6pgPfCA8+LPRJsW6/b5uQQRqHc=;
  b=JPLckl8n2lqfz8fH/X4zTCXwW7bzXMyd8RxOG4YT0VRJnKj7gO952wq1
   s0QJ8+Y0cin/R4rPMVTR7hFIzifbgJNIW+TPo2is1/AAOPdyAkjW/z+wt
   BciDhss+z5Vf2cemRireYSF0gmdHEBjKCDpu6mMz1oGXdOP08lnklCYMI
   b9tEPQ3pIgxu2UAaebIJuM/xAYnk0Bhe7E79h9q+/Unmh9kes7rfoifKy
   aFakTotB98uJ6SBZ63THgnlHGEc6ijZl+bfD6CoejkZbqMegZbcNJAyV2
   G0TIqXcuMybFs7fHh6UfAOpJKVJ44ca/eQclBYwMIzaa0PjNns6Nff3nc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372712785"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="372712785"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 22:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763895790"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="763895790"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 22:04:17 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWVBA-0000nv-35;
	Thu, 17 Aug 2023 05:04:16 +0000
Date: Thu, 17 Aug 2023 13:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_files 17/19] trap.c:(__tracepoints+0xb4):
 multiple definition of `__tracepoint_devlink_trap_report';
 net/devlink/core.o:core.c:(__tracepoints+0xb4): first defined here
Message-ID: <202308171235.GqYVkHqm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_files
head:   00a5b9621f0bc27e4f004dc027f187a5ef824a53
commit: 7d5b9c0f23e2895699cddab7f4e29c9025d61ba7 [17/19] devlink: move devlink_hw*() tracepoint definitions into core.c
config: riscv-randconfig-r042-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171235.GqYVkHqm-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171235.GqYVkHqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171235.GqYVkHqm-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: net/devlink/trap.o: in function `.LANCHOR0':
>> trap.c:(__tracepoints+0xb4): multiple definition of `__tracepoint_devlink_trap_report'; net/devlink/core.o:core.c:(__tracepoints+0xb4): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_trap_report':
>> trap.c:(.text+0x1fa): multiple definition of `__traceiter_devlink_trap_report'; net/devlink/core.o:core.c:(.text+0x1fa): first defined here
>> riscv32-linux-ld: net/devlink/trap.o:(.sdata+0x0): multiple definition of `__SCK__tp_func_devlink_trap_report'; net/devlink/core.o:(.sdata+0x0): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_hwmsg':
>> trap.c:(.text+0x0): multiple definition of `__traceiter_devlink_hwmsg'; net/devlink/core.o:core.c:(.text+0x0): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_hwmsg':
>> trap.c:(.text+0x68): multiple definition of `__probestub_devlink_hwmsg'; net/devlink/core.o:core.c:(.text+0x68): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_hwerr':
>> trap.c:(.text+0x70): multiple definition of `__traceiter_devlink_hwerr'; net/devlink/core.o:core.c:(.text+0x70): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_hwerr':
>> trap.c:(.text+0xc6): multiple definition of `__probestub_devlink_hwerr'; net/devlink/core.o:core.c:(.text+0xc6): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_health_report':
>> trap.c:(.text+0xce): multiple definition of `__traceiter_devlink_health_report'; net/devlink/core.o:core.c:(.text+0xce): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_health_report':
>> trap.c:(.text+0x124): multiple definition of `__probestub_devlink_health_report'; net/devlink/core.o:core.c:(.text+0x124): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_health_recover_aborted':
>> trap.c:(.text+0x12c): multiple definition of `__traceiter_devlink_health_recover_aborted'; net/devlink/core.o:core.c:(.text+0x12c): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_health_recover_aborted':
>> trap.c:(.text+0x194): multiple definition of `__probestub_devlink_health_recover_aborted'; net/devlink/core.o:core.c:(.text+0x194): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__traceiter_devlink_health_reporter_state_update':
>> trap.c:(.text+0x19c): multiple definition of `__traceiter_devlink_health_reporter_state_update'; net/devlink/core.o:core.c:(.text+0x19c): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_health_reporter_state_update':
>> trap.c:(.text+0x1f2): multiple definition of `__probestub_devlink_health_reporter_state_update'; net/devlink/core.o:core.c:(.text+0x1f2): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `__probestub_devlink_trap_report':
>> trap.c:(.text+0x2ed0): multiple definition of `__probestub_devlink_trap_report'; net/devlink/core.o:core.c:(.text+0x245c): first defined here
>> riscv32-linux-ld: net/devlink/trap.o:(.sdata+0x4): multiple definition of `__SCK__tp_func_devlink_health_reporter_state_update'; net/devlink/core.o:(.sdata+0x4): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `.LANCHOR0':
>> trap.c:(__tracepoints+0x90): multiple definition of `__tracepoint_devlink_health_reporter_state_update'; net/devlink/core.o:core.c:(__tracepoints+0x90): first defined here
>> riscv32-linux-ld: net/devlink/trap.o:(.sdata+0x8): multiple definition of `__SCK__tp_func_devlink_health_recover_aborted'; net/devlink/core.o:(.sdata+0x8): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `.LANCHOR0':
>> trap.c:(__tracepoints+0x6c): multiple definition of `__tracepoint_devlink_health_recover_aborted'; net/devlink/core.o:core.c:(__tracepoints+0x6c): first defined here
>> riscv32-linux-ld: net/devlink/trap.o:(.sdata+0xc): multiple definition of `__SCK__tp_func_devlink_health_report'; net/devlink/core.o:(.sdata+0xc): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `.LANCHOR0':
>> trap.c:(__tracepoints+0x48): multiple definition of `__tracepoint_devlink_health_report'; net/devlink/core.o:core.c:(__tracepoints+0x48): first defined here
   riscv32-linux-ld: net/devlink/trap.o:(.sdata+0x10): multiple definition of `__SCK__tp_func_devlink_hwerr'; net/devlink/core.o:(.sdata+0x10): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `.LANCHOR0':
   trap.c:(__tracepoints+0x24): multiple definition of `__tracepoint_devlink_hwerr'; net/devlink/core.o:core.c:(__tracepoints+0x24): first defined here
   riscv32-linux-ld: net/devlink/trap.o:(.sdata+0x14): multiple definition of `__SCK__tp_func_devlink_hwmsg'; net/devlink/core.o:(.sdata+0x14): first defined here
   riscv32-linux-ld: net/devlink/trap.o: in function `.LANCHOR0':
   trap.c:(__tracepoints+0x0): multiple definition of `__tracepoint_devlink_hwmsg'; net/devlink/core.o:core.c:(__tracepoints+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
