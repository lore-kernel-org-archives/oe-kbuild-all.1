Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446CD255E43
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770476330; cv=none; b=qCe04K0JGRV9RHeV1uPOZwuKHYroneqr+1+qyeD7mBoKfmAKkR3qxlyHjwJSy7Vt1TAczbb84HiGVkHsGoEYCSy2xd1YOsDEGL/eLGVWymizTbRG1RTjRKRppvFg6J4qWyOWnaOeh13/P7VwosVe24KOMf314vM6iIPUvW2wktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770476330; c=relaxed/simple;
	bh=ggNWPqCQDszxBT3k6iILI0+/BVe80fETnf19+h4oCEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IsjCF3OptNBt6Tf4RbpNpSkfEOIw1o+/mHU+y1vDXxINJDG+Vn+zIVSC/FuLpbhRAcR1EtSSxuooHhHQ4WJGlD+2a49bOy/XJN3mtkHhy0PLzv9r4h1kXJKxnYj78/VglYOVFld/uMRHHRygly+M3VG3FEfg8Pv8BEVWowdiiEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iI+eJHRr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iI+eJHRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770476329; x=1802012329;
  h=date:from:to:cc:subject:message-id;
  bh=ggNWPqCQDszxBT3k6iILI0+/BVe80fETnf19+h4oCEg=;
  b=iI+eJHRrGrIwGwJIPLIXMiASo1P/0S2H87uZsDIrt/dIGUDG8k223t+H
   gB6IqLD6RxG++1YS1zAWr+vpzq0S79hvpfqwaqMQDYUMERdSeyom5silb
   GmNOXBHSWLmK75uNPPypuMt9ekvooUkKApXr1udrD1hm2t7d0ga5k8fWf
   6TzA4KqZvS3fmea1e9R5Ym0PvJDmmLOW3ZFseo6zN8Mbu62CU4gvs/Mzn
   0Lq23uIyWNN9Zvjz+iSirT6NH+Wec1sE/d/onvd3OOxNn3mfPwjgL7NmS
   xpohQ0TTTjETMKHvQ10/SrxfCdDpenz0JdcDeVo4w1h/JD9QibEIzGyVr
   w==;
X-CSE-ConnectionGUID: zUaV2x0KQJmrT16hwkYAMQ==
X-CSE-MsgGUID: 1O6iLzRnQyaiMkIRcaIMTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="82390475"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="82390475"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 06:58:49 -0800
X-CSE-ConnectionGUID: L1n9iCbWTQiB7M2glUrfYg==
X-CSE-MsgGUID: PiXezL74SneP3QaFSq7BQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210931812"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2026 06:58:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vojlk-00000000lho-3fmF;
	Sat, 07 Feb 2026 14:58:44 +0000
Date: Sat, 07 Feb 2026 22:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6]
 arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected identifier or
 '('
Message-ID: <202602072215.rJJTQQJs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: 080689dfb5679e0e8b9210ffb2f58b6e295a835f [0/6] ANDROID: pkvm: x86: Add __cpu_possible_mask and nr_cpu_ids symbols
config: x86_64-randconfig-123-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072215.rJJTQQJs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072215.rJJTQQJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072215.rJJTQQJs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/pkvm/hyp/vmexit.c:9:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected identifier or '('
     145 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/vmexit.c:9:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/vmexit.c:9:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected ')'
     145 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:358:24: note: expanded from macro 'CONFIG_NR_CPUS'
     358 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
   3 errors generated.
--
   In file included from arch/x86/kvm/vmx/pkvm/hyp/nested.c:6:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected identifier or '('
     145 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/nested.c:6:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/nested.c:6:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected ')'
     145 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:358:24: note: expanded from macro 'CONFIG_NR_CPUS'
     358 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
   arch/x86/kvm/vmx/pkvm/hyp/nested.c:1259:18: warning: variable 'a2' set but not used [-Wunused-but-set-variable]
    1259 |         u64 nr, a0, a1, a2, a3;
         |                         ^
   arch/x86/kvm/vmx/pkvm/hyp/nested.c:1259:22: warning: variable 'a3' set but not used [-Wunused-but-set-variable]
    1259 |         u64 nr, a0, a1, a2, a3;
         |                             ^
   2 warnings and 3 errors generated.
--
   In file included from arch/x86/kvm/vmx/pkvm/hyp/vmx.c:3:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected identifier or '('
     145 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/vmx.c:3:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected ')'
   include/linux/cpumask.h:28:22: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                      ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: note: to match this '('
   include/linux/cpumask.h:28:21: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                     ^
   In file included from arch/x86/kvm/vmx/pkvm/hyp/vmx.c:3:
>> arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: error: expected ')'
     145 | extern unsigned int pkvm_sym(nr_cpu_ids);
         |                              ^
   include/linux/cpumask.h:28:35: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                                   ^
   include/linux/threads.h:21:18: note: expanded from macro 'NR_CPUS'
      21 | #define NR_CPUS         CONFIG_NR_CPUS
         |                         ^
   ./include/generated/autoconf.h:358:24: note: expanded from macro 'CONFIG_NR_CPUS'
     358 | #define CONFIG_NR_CPUS 1
         |                        ^
   arch/x86/kvm/vmx/pkvm/include/pkvm.h:145:30: note: to match this '('
   include/linux/cpumask.h:28:20: note: expanded from macro 'nr_cpu_ids'
      28 | #define nr_cpu_ids ((unsigned int)NR_CPUS)
         |                    ^
   arch/x86/kvm/vmx/pkvm/hyp/vmx.c:70:28: error: call to undeclared function 'per_cpu_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         vmcs_writel(HOST_FS_BASE, per_cpu_offset(cpu));
         |                                   ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +145 arch/x86/kvm/vmx/pkvm/include/pkvm.h

   137	
   138	extern unsigned long pkvm_sym(__page_base_offset);
   139	extern unsigned long pkvm_sym(__symbol_base_offset);
   140	extern struct pkvm_hyp *pkvm_sym(pkvm_hyp);
   141	extern unsigned long pkvm_sym(__x86_clflush_size);
   142	extern struct cpuinfo_x86 pkvm_sym(boot_cpu_data);
   143	extern unsigned int pkvm_sym(tsc_khz);
   144	extern struct cpumask pkvm_sym(__cpu_possible_mask);
 > 145	extern unsigned int pkvm_sym(nr_cpu_ids);
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
