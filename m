Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E615C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 00:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719361198; cv=none; b=qsvynihiUdTig3nfDwjqcCpIy4xVECftWmrnLglfeOimAm8ewpBdd+gSIhH+WRUbEG+6ekWKjwuK9jeItt+85bo9CD1wQrsNIUkd9cLiHm6yZqcJ3cTH+uNylBqa5tkBDy4G2An4e9CzhGkiS1+o+ZGnGakvf2xfl1Pj0WztyXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719361198; c=relaxed/simple;
	bh=PzRDHSyfK6Iqj2MJMWjZzlvh4B9lOljfEzPkzzxDxkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/tgT4z0XhiWaNesc0hbfL3QpHd+bNpRFItVN2INYOxGS8K6y2EgI9ebce+mQNlfIEuUPiocHIWF9zHu+WadelXQ2OHxMX0J1FtuvTnmvGU1xcrIuGy1bKC9KcVkWSRP5bXaCxarEaDd4GeBAjNur/oShBRiF2geqQIQjD6dISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRa88De+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRa88De+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719361196; x=1750897196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PzRDHSyfK6Iqj2MJMWjZzlvh4B9lOljfEzPkzzxDxkg=;
  b=TRa88De+5jFDtQbU86Lwm+Nj00LPpy+IvkbHOtNJSKDxJP9NEG6qQxbc
   QaK0kQncnWVQTpop3KyMr9n+dcyhVRHM+4ZD9xKsnV8kVKvXlhAvA9CyX
   jK5biNFOqf+O3Q9cYMmNLZC2qv+cA8qXrNtyvr2uORldV9pl/j1mGSHxI
   I9hGYkbSyJPm5OIKN0MJ2tGWfunUcyVShVPUWjUWdaqD8e4mvcEfT3o7p
   6YUr9nBQwG0ez0KXxSkEJTHj/Ff5jHiqA62PhlbE65k6Ac7UawQdlhGBr
   g3swfIFWV/DtC7uyege1ilsYcOuxbRR07NkDOZcw/ssXZ4iZADvmGMb+e
   w==;
X-CSE-ConnectionGUID: zncQ8Z1WTXW2vVwhqcQWDA==
X-CSE-MsgGUID: aNFGA+XsScGz9Wo8yHltXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16233147"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="16233147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:19:56 -0700
X-CSE-ConnectionGUID: Swxd7vXBQ8ePs1pxgHYeVg==
X-CSE-MsgGUID: uxz9gTCVTAibk8ph1ZgPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48201431"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jun 2024 17:19:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMGO7-000EpN-39;
	Wed, 26 Jun 2024 00:19:51 +0000
Date: Wed, 26 Jun 2024 08:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 12815/15087]
 arch/x86/include/asm/thread_info.h:92:17: error: 'NR_syscalls' undeclared
 here (not in a function); did you mean 'si_syscall'?
Message-ID: <202406260813.BqUYUoHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   6eb9e92fbf125570cc7b4e233b733e3d0e72e5a8
commit: f50b7d2c226ed73ee8be68842a1bbf7f49da1109 [12815/15087] CHROMIUM: x86: Add alt-syscall support
config: x86_64-randconfig-r061-20240625 (https://download.01.org/0day-ci/archive/20240626/202406260813.BqUYUoHq-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260813.BqUYUoHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260813.BqUYUoHq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/init_task.h:5,
                    from init/init_task.c:2:
>> arch/x86/include/asm/thread_info.h:92:17: error: 'NR_syscalls' undeclared here (not in a function); did you mean 'si_syscall'?
      92 |  .nr_syscalls = NR_syscalls,  \
         |                 ^~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:2: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |  INIT_THREAD_INFO_SYSCALL  \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:17: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |  .thread_info = INIT_THREAD_INFO(init_task),
         |                 ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/thread_info.h:93:20: error: 'sys_call_table' undeclared here (not in a function); did you mean 'sys_desc_table'?
      93 |  .sys_call_table = sys_call_table, \
         |                    ^~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:2: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |  INIT_THREAD_INFO_SYSCALL  \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:17: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |  .thread_info = INIT_THREAD_INFO(init_task),
         |                 ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/thread_info.h:86:22: error: 'IA32_NR_syscalls' undeclared here (not in a function)
      86 |  .ia32_nr_syscalls = IA32_NR_syscalls,  \
         |                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:94:2: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL_COMPAT'
      94 |  INIT_THREAD_INFO_SYSCALL_COMPAT
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:2: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |  INIT_THREAD_INFO_SYSCALL  \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:17: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |  .thread_info = INIT_THREAD_INFO(init_task),
         |                 ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/thread_info.h:87:25: error: 'ia32_sys_call_table' undeclared here (not in a function)
      87 |  .ia32_sys_call_table = ia32_sys_call_table,
         |                         ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:94:2: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL_COMPAT'
      94 |  INIT_THREAD_INFO_SYSCALL_COMPAT
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:2: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |  INIT_THREAD_INFO_SYSCALL  \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:17: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |  .thread_info = INIT_THREAD_INFO(init_task),
         |                 ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:57,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/x86/kernel/alt-syscall.c:1:
   arch/x86/kernel/alt-syscall.c: In function 'arch_dup_sys_call_table':
>> arch/x86/kernel/alt-syscall.c:40:30: error: 'ia32_sys_call_table' undeclared (first use in this function); did you mean 'alt_sys_call_table'?
      40 |  memcpy(entry->compat_table, ia32_sys_call_table,
         |                              ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:638:27: note: in definition of macro '__fortify_memcpy_chk'
     638 |  const size_t __q_size = (q_size);    \
         |                           ^~~~~~
   include/linux/fortify-string.h:694:21: note: in expansion of macro '__struct_size'
     694 |   __struct_size(p), __struct_size(q),   \
         |                     ^~~~~~~~~~~~~
   arch/x86/kernel/alt-syscall.c:40:2: note: in expansion of macro 'memcpy'
      40 |  memcpy(entry->compat_table, ia32_sys_call_table,
         |  ^~~~~~
   arch/x86/kernel/alt-syscall.c:40:30: note: each undeclared identifier is reported only once for each function it appears in
      40 |  memcpy(entry->compat_table, ia32_sys_call_table,
         |                              ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:638:27: note: in definition of macro '__fortify_memcpy_chk'
     638 |  const size_t __q_size = (q_size);    \
         |                           ^~~~~~
   include/linux/fortify-string.h:694:21: note: in expansion of macro '__struct_size'
     694 |   __struct_size(p), __struct_size(q),   \
         |                     ^~~~~~~~~~~~~
   arch/x86/kernel/alt-syscall.c:40:2: note: in expansion of macro 'memcpy'
      40 |  memcpy(entry->compat_table, ia32_sys_call_table,
         |  ^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +92 arch/x86/include/asm/thread_info.h

    82	
    83	#ifdef CONFIG_ALT_SYSCALL
    84	# ifdef CONFIG_IA32_EMULATION
    85	#  define INIT_THREAD_INFO_SYSCALL_COMPAT			\
  > 86		.ia32_nr_syscalls	= IA32_NR_syscalls,		\
  > 87		.ia32_sys_call_table	= ia32_sys_call_table,
    88	# else
    89	#  define INIT_THREAD_INFO_SYSCALL_COMPAT /* */
    90	# endif
    91	# define INIT_THREAD_INFO_SYSCALL \
  > 92		.nr_syscalls	= NR_syscalls,		\
  > 93		.sys_call_table	= sys_call_table,	\
    94		INIT_THREAD_INFO_SYSCALL_COMPAT
    95	#else
    96	# define INIT_THREAD_INFO_SYSCALL /* */
    97	#endif
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
