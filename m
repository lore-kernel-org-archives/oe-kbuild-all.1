Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F04FF50F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 04:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764132232; cv=none; b=fZmToPorCt/xRKqx3KXCXBLExGkKrCqk0tNblk76oiRQkFuUws8kPSv9wSFelqn7eOpgUxyocBFjtII0giplFTILNbVTfS/vXLqnUE88QUhUQFwwYvMaUxfWYFB66vN2byjDeFB+8/YV0zzHIz+UAhQTsYXX9/4W6CxlsQdqMtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764132232; c=relaxed/simple;
	bh=hXkjsbaZ2mbUEhcOdBjtpzKyam2T0h4zyGQIZBr0ApI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMb3WKRYqlAuJfzVZ0QeNNFP3owvAphjKagXIOb4xIGed5Mvtf/jzc4/uoHBbbcJbeEJ8ixMQK+odYHuJq6rtjCp7G6QPgDfm9ELcwZvC16CqFEDvUZjldj2rQmwOzen4yL6oiQuiUVQuejSMfNfgSFS8BFhKq0E0PyQmFXaSc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isxYGsQU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isxYGsQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764132230; x=1795668230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXkjsbaZ2mbUEhcOdBjtpzKyam2T0h4zyGQIZBr0ApI=;
  b=isxYGsQUG28X13XTuiX0D8ALk/m8IBEy28hvObisW4Fn5b22x+XiBd/N
   jf+EaxmzGg0v7bssN5Zr1DENHCDZ+DpDA0FplrDeLcCfal7uMJIRGAFgS
   N7zoVp3sJJvXAx14MB5SbD+FCI8xbuWolOFFBrp6C+twZbPxPo951KzHu
   GFNKpxRyYNg5TsIB10gduw51nO0+ROkbJTDE+unHOcPriIYkpU43hIqXx
   7vAEbxrcYHhunwscMUqoyCL/fCjCL6Y/W9sgnHtGUZmtsGq1J5r1AbECX
   P56eoGsCvLEzFPIOz89BQBV+57+RgDTPLP4fv7BYGpgw+bOodZKOOtZjX
   Q==;
X-CSE-ConnectionGUID: WjvJEy+ITsy5gHW48RXVUQ==
X-CSE-MsgGUID: nbRbH4ErTj29umw8ffQpqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70020365"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="70020365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 20:43:49 -0800
X-CSE-ConnectionGUID: Akaf54MkRlitpZQdkidxeA==
X-CSE-MsgGUID: akgwmSg0Qx6wzlOWnl3+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="197151317"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2025 20:43:48 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO7Na-000000000dd-2IPV;
	Wed, 26 Nov 2025 04:43:46 +0000
Date: Wed, 26 Nov 2025 05:42:54 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:randomize-kstack-siphash 1/1]
 arch/x86/include/asm/entry-common.h:95:9: error: implicit declaration of
 function 'choose_random_kstack_offset'
Message-ID: <202511260525.TumYGjRu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git randomize-kstack-siphash
head:   0783912db6e30339d55a5dc7eb6a696b440bedb3
commit: 0783912db6e30339d55a5dc7eb6a696b440bedb3 [1/1] HACK: use siphash to generate kstack offset per-task
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251126/202511260525.TumYGjRu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260525.TumYGjRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260525.TumYGjRu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irq-entry-common.h:12,
                    from include/linux/entry-common.h:5,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/include/asm/traps.h:9,
                    from arch/x86/boot/startup/sev-startup.c:36:
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_to_user_mode_prepare':
>> arch/x86/include/asm/entry-common.h:95:9: error: implicit declaration of function 'choose_random_kstack_offset' [-Wimplicit-function-declaration]
      95 |         choose_random_kstack_offset(rdtsc());
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/irq-entry-common.h:12,
                    from include/linux/entry-common.h:5,
                    from arch/x86/entry/syscall_64.c:8:
   arch/x86/include/asm/entry-common.h: In function 'arch_exit_to_user_mode_prepare':
>> arch/x86/include/asm/entry-common.h:95:9: error: implicit declaration of function 'choose_random_kstack_offset' [-Wimplicit-function-declaration]
      95 |         choose_random_kstack_offset(rdtsc());
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/entry/syscall_64.c: In function 'do_syscall_64':
>> arch/x86/entry/syscall_64.c:89:9: error: implicit declaration of function 'add_random_kstack_offset' [-Wimplicit-function-declaration]
      89 |         add_random_kstack_offset();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/choose_random_kstack_offset +95 arch/x86/include/asm/entry-common.h

fe950f6020338c Kees Cook       2021-04-01   84  
fe950f6020338c Kees Cook       2021-04-01   85  	/*
6db1208bf95b4c Kees Cook       2024-06-19   86  	 * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
6db1208bf95b4c Kees Cook       2024-06-19   87  	 * bits. The actual entropy will be further reduced by the compiler
6db1208bf95b4c Kees Cook       2024-06-19   88  	 * when applying stack alignment constraints (see cc_stack_align4/8 in
fe950f6020338c Kees Cook       2021-04-01   89  	 * arch/x86/Makefile), which will remove the 3 (x86_64) or 2 (ia32)
fe950f6020338c Kees Cook       2021-04-01   90  	 * low bits from any entropy chosen here.
fe950f6020338c Kees Cook       2021-04-01   91  	 *
6db1208bf95b4c Kees Cook       2024-06-19   92  	 * Therefore, final stack offset entropy will be 7 (x86_64) or
6db1208bf95b4c Kees Cook       2024-06-19   93  	 * 8 (ia32) bits.
fe950f6020338c Kees Cook       2021-04-01   94  	 */
6db1208bf95b4c Kees Cook       2024-06-19  @95  	choose_random_kstack_offset(rdtsc());
2f8f173413f1cb Pawan Gupta     2025-08-14   96  
2f8f173413f1cb Pawan Gupta     2025-08-14   97  	/* Avoid unnecessary reads of 'x86_ibpb_exit_to_user' */
2f8f173413f1cb Pawan Gupta     2025-08-14   98  	if (cpu_feature_enabled(X86_FEATURE_IBPB_EXIT_TO_USER) &&
2f8f173413f1cb Pawan Gupta     2025-08-14   99  	    this_cpu_read(x86_ibpb_exit_to_user)) {
2f8f173413f1cb Pawan Gupta     2025-08-14  100  		indirect_branch_prediction_barrier();
2f8f173413f1cb Pawan Gupta     2025-08-14  101  		this_cpu_write(x86_ibpb_exit_to_user, false);
2f8f173413f1cb Pawan Gupta     2025-08-14  102  	}
167fd210ec0555 Thomas Gleixner 2020-07-23  103  }
167fd210ec0555 Thomas Gleixner 2020-07-23  104  #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
167fd210ec0555 Thomas Gleixner 2020-07-23  105  

:::::: The code at line 95 was first introduced by commit
:::::: 6db1208bf95b4c091897b597c415e11edeab2e2d randomize_kstack: Remove non-functional per-arch entropy filtering

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Kees Cook <kees@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
