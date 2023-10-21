Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AFB2109
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9om2H2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697890807; x=1729426807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NOyH2cplo+CJ5yaYOhQPdPaRnj/uf8oXT/DU8M4Yr2E=;
  b=Z9om2H2R/ew5zNO5UEtTac8XEikPH3SQUc10V+p/cJu12ZTrs89SLPAr
   1bpdu1efNhD4PQ16V/7nw3E/eJdgw70oY7CqDfryPkId0waxuDbHwF+/M
   9ZE4NIuEZklBah2SRYphPFp16BbEMiE6jlMkptM69bcdFCf28+YuQ7NDV
   F0Irrv2DUsk9q/3ImJc4CNEd+iGKwYEkAbBaRW1zcexMgsCvtjlgNKiqJ
   tl6h3I+1q3rz0EcUmjm+fBSN7weu02JPfkIsy6kQyvmgn/wpfZbPv46gZ
   ft61BIdg20l3G7ptK2LTAUoHM9fAiApCs/zmAqDC3hpZkbFLB0TWIomp+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383833590"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="383833590"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 05:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734218902"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="734218902"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2023 05:20:05 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quAxX-0004oI-1b;
	Sat, 21 Oct 2023 12:20:03 +0000
Date: Sat, 21 Oct 2023 20:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/tip/tdx/2023/1013 10/10]
 arch/x86/kernel/x86_init.c:153:43: error: 'print_mem_encrypt_feature_info'
 undeclared here (not in a function)
Message-ID: <202310212052.GauWLGRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/tip/tdx/2023/1013
head:   a1d4d1204a2799ff94c9d1d01f2dda125aafa8e2
commit: a1d4d1204a2799ff94c9d1d01f2dda125aafa8e2 [10/10] x86/mm: Print the encryption features correctly when a paravisor is present
config: x86_64-buildonly-randconfig-002-20231021 (https://download.01.org/0day-ci/archive/20231021/202310212052.GauWLGRY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310212052.GauWLGRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212052.GauWLGRY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/x86_init.c:153:43: error: 'print_mem_encrypt_feature_info' undeclared here (not in a function)
     153 |         .print_mem_enc_feature_info     = print_mem_encrypt_feature_info,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/print_mem_encrypt_feature_info +153 arch/x86/kernel/x86_init.c

   139	
   140	struct x86_platform_ops x86_platform __ro_after_init = {
   141		.calibrate_cpu			= native_calibrate_cpu_early,
   142		.calibrate_tsc			= native_calibrate_tsc,
   143		.get_wallclock			= mach_get_cmos_time,
   144		.set_wallclock			= mach_set_cmos_time,
   145		.iommu_shutdown			= iommu_shutdown_noop,
   146		.is_untracked_pat_range		= is_ISA_range,
   147		.nmi_init			= default_nmi_init,
   148		.get_nmi_reason			= default_get_nmi_reason,
   149		.save_sched_clock_state		= tsc_save_sched_clock_state,
   150		.restore_sched_clock_state	= tsc_restore_sched_clock_state,
   151		.realmode_reserve		= reserve_real_mode,
   152		.realmode_init			= init_real_mode,
 > 153		.print_mem_enc_feature_info	= print_mem_encrypt_feature_info,
   154		.hyper.pin_vcpu			= x86_op_int_noop,
   155		.hyper.is_private_mmio		= is_private_mmio_noop,
   156	
   157		.guest = {
   158			.enc_status_change_prepare = enc_status_change_prepare_noop,
   159			.enc_status_change_finish  = enc_status_change_finish_noop,
   160			.enc_tlb_flush_required	   = enc_tlb_flush_required_noop,
   161			.enc_cache_flush_required  = enc_cache_flush_required_noop,
   162		},
   163	};
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
