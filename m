Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469A7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKzdY5qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699699281; x=1731235281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JKWAytFa4rvXw4kNKyxeaPEYJftHGdFO7vLKqH+soCc=;
  b=fKzdY5qzkkaOW3Bt0yUN0YRCcukOK+VbO/nh41Km2ZE/wO86l5US8AJU
   lAXctVcR9wF5NG7mzt1iAIdwWmOmCrmkAMualdcF//jp6r6sZIFLfjRsC
   a6VoKiMjtlrcKCDcfmsHENBaEEm2SPUnbQMG4BBh3VXJ1JTxlsMHTtVxz
   /4C/rSHuDOnpIhb/k9TaIEs3dNIFSyB4wxF6ADVzQ+LthOWhOmypBzQ8O
   ChZGxZhyO1DkZSMCscvGwiy4s/d610/rJTXW6+vVSPpz1d3HtyJGFRJDb
   j/50GINde/dwNO5YlaFpiIodoag3R9pCOK4bmGonIccVxnJ+pkWfJ7RH/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="389131636"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="389131636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 02:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="854578680"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="854578680"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2023 02:41:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1lQS-000ANe-2a;
	Sat, 11 Nov 2023 10:41:16 +0000
Date: Sat, 11 Nov 2023 18:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] arm64/syscall: Remove duplicate declaration
Message-ID: <202311111835.TwZb5HDc-lkp@intel.com>
References: <20231109101958.225593-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109101958.225593-1-kevin.brodsky@arm.com>

Hi Kevin,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on soc/for-next arm/for-next kvmarm/next arm/fixes linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/arm64-syscall-Remove-duplicate-declaration/20231109-232300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231109101958.225593-1-kevin.brodsky%40arm.com
patch subject: [PATCH] arm64/syscall: Remove duplicate declaration
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311111835.TwZb5HDc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111835.TwZb5HDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111835.TwZb5HDc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/error-injection.h:7,
                    from include/linux/module.h:26,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from drivers/pci/syscall.c:9:
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_pciconfig_read' undeclared here (not in a function); did you mean 'args__pciconfig_read'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:223:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     223 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   drivers/pci/syscall.c:15:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      15 | SYSCALL_DEFINE5(pciconfig_read, unsigned long, bus, unsigned long, dfn,
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_pciconfig_write' undeclared here (not in a function); did you mean '__arm64_sys_pciconfig_read'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:223:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     223 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   drivers/pci/syscall.c:86:1: note: in expansion of macro 'SYSCALL_DEFINE5'
      86 | SYSCALL_DEFINE5(pciconfig_write, unsigned long, bus, unsigned long, dfn,
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/error-injection.h:7,
                    from include/linux/module.h:26,
                    from include/linux/kallsyms.h:14,
                    from include/linux/ftrace.h:13,
                    from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from arch/arm64/include/asm/cacheflush.h:11,
                    from include/linux/cacheflush.h:5,
                    from include/linux/highmem.h:8,
                    from kernel/sched/core.c:9:
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_nice' undeclared here (not in a function); did you mean '__arm64_sys_ni_syscall'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:7276:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    7276 | SYSCALL_DEFINE1(nice, int, increment)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_setscheduler' undeclared here (not in a function); did you mean 'args__sched_setscheduler'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8052:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    8052 | SYSCALL_DEFINE3(sched_setscheduler, pid_t, pid, int, policy, struct sched_param __user *, param)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_setparam' undeclared here (not in a function); did you mean 'args__sched_setparam'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8067:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    8067 | SYSCALL_DEFINE2(sched_setparam, pid_t, pid, struct sched_param __user *, param)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_setattr' undeclared here (not in a function); did you mean '__arm64_sys_sched_setparam'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8078:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    8078 | SYSCALL_DEFINE3(sched_setattr, pid_t, pid, struct sched_attr __user *, uattr,
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_getscheduler' undeclared here (not in a function); did you mean '__arm64_sys_sched_setscheduler'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8121:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    8121 | SYSCALL_DEFINE1(sched_getscheduler, pid_t, pid)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_getparam' undeclared here (not in a function); did you mean '__arm64_sys_sched_setparam'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8150:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    8150 | SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_getattr' undeclared here (not in a function); did you mean '__arm64_sys_sched_setattr'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8231:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    8231 | SYSCALL_DEFINE4(sched_getattr, pid_t, pid, struct sched_attr __user *, uattr,
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_setaffinity' undeclared here (not in a function); did you mean '__arm64_sys_sched_setattr'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8448:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    8448 | SYSCALL_DEFINE3(sched_setaffinity, pid_t, pid, unsigned int, len,
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_getaffinity' undeclared here (not in a function); did you mean '__arm64_sys_sched_setaffinity'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:8500:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    8500 | SYSCALL_DEFINE3(sched_getaffinity, pid_t, pid, unsigned int, len,
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:72:31: error: '__arm64_sys_sched_yield' undeclared here (not in a function); did you mean '__arm64_sys_sched_getattr'?
      72 |         ALLOW_ERROR_INJECTION(__arm64_sys_##sname, ERRNO);                      \
         |                               ^~~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   kernel/sched/core.c:8553:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    8553 | SYSCALL_DEFINE0(sched_yield)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_get_priority_max' undeclared here (not in a function); did you mean 'args__sched_get_priority_max'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:9039:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    9039 | SYSCALL_DEFINE1(sched_get_priority_max, int, policy)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_get_priority_min' undeclared here (not in a function); did you mean '__arm64_sys_sched_get_priority_max'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:9066:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    9066 | SYSCALL_DEFINE1(sched_get_priority_min, int, policy)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_rr_get_interval' undeclared here (not in a function); did you mean 'args__sched_rr_get_interval'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:9131:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    9131 | SYSCALL_DEFINE2(sched_rr_get_interval, pid_t, pid,
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_sched_rr_get_interval_time32' undeclared here (not in a function); did you mean '__arm64_sys_sched_rr_get_interval'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/core.c:9144:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    9144 | SYSCALL_DEFINE2(sched_rr_get_interval_time32, pid_t, pid,
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/error-injection.h:7,
                    from include/linux/module.h:26,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/cpufreq.h:12,
                    from kernel/sched/build_utility.c:22:
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_membarrier' undeclared here (not in a function); did you mean 'args__membarrier'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/error-injection.h:7,
                    from include/linux/module.h:26,
                    from include/linux/bpf.h:20,
                    from kernel/bpf/syscall.c:4:
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_bpf' undeclared here (not in a function)
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:5437:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    5437 | SYSCALL_DEFINE3(bpf, int, cmd, union bpf_attr __user *, uattr, unsigned int, size)
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/error-injection.h:7,
                    from include/linux/module.h:26,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:90,
                    from fs/notify/inotify/inotify_user.c:26:
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_inotify_init1' undeclared here (not in a function); did you mean 'args__inotify_init1'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     219 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/notify/inotify/inotify_user.c:720:1: note: in expansion of macro 'SYSCALL_DEFINE1'
     720 | SYSCALL_DEFINE1(inotify_init1, int, flags)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:72:31: error: '__arm64_sys_inotify_init' undeclared here (not in a function); did you mean '__arm64_sys_inotify_init1'?
      72 |         ALLOW_ERROR_INJECTION(__arm64_sys_##sname, ERRNO);                      \
         |                               ^~~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   fs/notify/inotify/inotify_user.c:725:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     725 | SYSCALL_DEFINE0(inotify_init)
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_inotify_add_watch' undeclared here (not in a function); did you mean 'args__inotify_add_watch'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/notify/inotify/inotify_user.c:730:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     730 | SYSCALL_DEFINE3(inotify_add_watch, int, fd, const char __user *, pathname,
         | ^~~~~~~~~~~~~~~
>> arch/arm64/include/asm/syscall_wrapper.h:53:31: error: '__arm64_sys_inotify_rm_watch' undeclared here (not in a function); did you mean '__arm64_sys_inotify_add_watch'?
      53 |         ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);                        \
         |                               ^~~~~~~~~~~
   include/asm-generic/error-injection.h:31:40: note: in definition of macro 'ALLOW_ERROR_INJECTION'
      31 |                 .addr = (unsigned long)fname,                           \
         |                                        ^~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/notify/inotify/inotify_user.c:794:1: note: in expansion of macro 'SYSCALL_DEFINE2'
     794 | SYSCALL_DEFINE2(inotify_rm_watch, int, fd, __s32, wd)
         | ^~~~~~~~~~~~~~~
..


vim +53 arch/arm64/include/asm/syscall_wrapper.h

4378a7d4be30ec Mark Rutland  2018-07-11  19  
4378a7d4be30ec Mark Rutland  2018-07-11  20  #define COMPAT_SYSCALL_DEFINEx(x, name, ...)						\
4378a7d4be30ec Mark Rutland  2018-07-11 @21  	ALLOW_ERROR_INJECTION(__arm64_compat_sys##name, ERRNO);				\
4378a7d4be30ec Mark Rutland  2018-07-11  22  	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
4378a7d4be30ec Mark Rutland  2018-07-11  23  	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
33ceedf4f314c4 Kevin Brodsky 2023-11-09  24  	asmlinkage long __arm64_compat_sys##name(const struct pt_regs *regs);		\
4378a7d4be30ec Mark Rutland  2018-07-11  25  	asmlinkage long __arm64_compat_sys##name(const struct pt_regs *regs)		\
4378a7d4be30ec Mark Rutland  2018-07-11  26  	{										\
4378a7d4be30ec Mark Rutland  2018-07-11  27  		return __se_compat_sys##name(SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));	\
4378a7d4be30ec Mark Rutland  2018-07-11  28  	}										\
4378a7d4be30ec Mark Rutland  2018-07-11  29  	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
4378a7d4be30ec Mark Rutland  2018-07-11  30  	{										\
4378a7d4be30ec Mark Rutland  2018-07-11  31  		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
4378a7d4be30ec Mark Rutland  2018-07-11  32  	}										\
4378a7d4be30ec Mark Rutland  2018-07-11  33  	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
4378a7d4be30ec Mark Rutland  2018-07-11  34  
4378a7d4be30ec Mark Rutland  2018-07-11  35  #define COMPAT_SYSCALL_DEFINE0(sname)							\
0e358bd7b7ebd2 Sami Tolvanen 2019-05-24  36  	asmlinkage long __arm64_compat_sys_##sname(const struct pt_regs *__unused);	\
4378a7d4be30ec Mark Rutland  2018-07-11  37  	ALLOW_ERROR_INJECTION(__arm64_compat_sys_##sname, ERRNO);			\
0e358bd7b7ebd2 Sami Tolvanen 2019-05-24  38  	asmlinkage long __arm64_compat_sys_##sname(const struct pt_regs *__unused)
4378a7d4be30ec Mark Rutland  2018-07-11  39  
4378a7d4be30ec Mark Rutland  2018-07-11  40  #define COND_SYSCALL_COMPAT(name) 							\
6ac19f96515e1f Arnd Bergmann 2023-05-16  41  	asmlinkage long __arm64_compat_sys_##name(const struct pt_regs *regs);		\
c27eccfe4d6c74 Sami Tolvanen 2019-09-10  42  	asmlinkage long __weak __arm64_compat_sys_##name(const struct pt_regs *regs)	\
c27eccfe4d6c74 Sami Tolvanen 2019-09-10  43  	{										\
c27eccfe4d6c74 Sami Tolvanen 2019-09-10  44  		return sys_ni_syscall();						\
c27eccfe4d6c74 Sami Tolvanen 2019-09-10  45  	}
4378a7d4be30ec Mark Rutland  2018-07-11  46  
4378a7d4be30ec Mark Rutland  2018-07-11  47  #define COMPAT_SYS_NI(name) \
4378a7d4be30ec Mark Rutland  2018-07-11  48  	SYSCALL_ALIAS(__arm64_compat_sys_##name, sys_ni_posix_timers);
4378a7d4be30ec Mark Rutland  2018-07-11  49  
4378a7d4be30ec Mark Rutland  2018-07-11  50  #endif /* CONFIG_COMPAT */
4378a7d4be30ec Mark Rutland  2018-07-11  51  
4378a7d4be30ec Mark Rutland  2018-07-11  52  #define __SYSCALL_DEFINEx(x, name, ...)						\
4378a7d4be30ec Mark Rutland  2018-07-11 @53  	ALLOW_ERROR_INJECTION(__arm64_sys##name, ERRNO);			\
4378a7d4be30ec Mark Rutland  2018-07-11  54  	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
4378a7d4be30ec Mark Rutland  2018-07-11  55  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
6ac19f96515e1f Arnd Bergmann 2023-05-16  56  	asmlinkage long __arm64_sys##name(const struct pt_regs *regs);		\
4378a7d4be30ec Mark Rutland  2018-07-11  57  	asmlinkage long __arm64_sys##name(const struct pt_regs *regs)		\
4378a7d4be30ec Mark Rutland  2018-07-11  58  	{									\
4378a7d4be30ec Mark Rutland  2018-07-11  59  		return __se_sys##name(SC_ARM64_REGS_TO_ARGS(x,__VA_ARGS__));	\
4378a7d4be30ec Mark Rutland  2018-07-11  60  	}									\
4378a7d4be30ec Mark Rutland  2018-07-11  61  	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
4378a7d4be30ec Mark Rutland  2018-07-11  62  	{									\
4378a7d4be30ec Mark Rutland  2018-07-11  63  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
4378a7d4be30ec Mark Rutland  2018-07-11  64  		__MAP(x,__SC_TEST,__VA_ARGS__);					\
4378a7d4be30ec Mark Rutland  2018-07-11  65  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
4378a7d4be30ec Mark Rutland  2018-07-11  66  		return ret;							\
4378a7d4be30ec Mark Rutland  2018-07-11  67  	}									\
4378a7d4be30ec Mark Rutland  2018-07-11  68  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
4378a7d4be30ec Mark Rutland  2018-07-11  69  
4378a7d4be30ec Mark Rutland  2018-07-11  70  #define SYSCALL_DEFINE0(sname)							\
4378a7d4be30ec Mark Rutland  2018-07-11  71  	SYSCALL_METADATA(_##sname, 0);						\
4378a7d4be30ec Mark Rutland  2018-07-11 @72  	ALLOW_ERROR_INJECTION(__arm64_sys_##sname, ERRNO);			\
33ceedf4f314c4 Kevin Brodsky 2023-11-09  73  	asmlinkage long __arm64_sys_##sname(const struct pt_regs *__unused);	\
0e358bd7b7ebd2 Sami Tolvanen 2019-05-24  74  	asmlinkage long __arm64_sys_##sname(const struct pt_regs *__unused)
4378a7d4be30ec Mark Rutland  2018-07-11  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
