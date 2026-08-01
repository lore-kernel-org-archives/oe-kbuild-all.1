Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2B3B0AC3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785577385; cv=none; b=Q4SMHcOR9yMRkgF/FE7wX6is8HufQXmdIa3FdvNiJO3Ih6MLygdZaYJtCj9izwKgITR0EZwLVe+KxMWFWaf5nnC3xekBLBzppsiYLOO0SMDOPTv7dFU+k1ubca99ivi6zD7ip6+Zqv8TQyGP8Qa6yr9Bps1JpSM7aja/azsGt9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785577385; c=relaxed/simple;
	bh=TBWxxgi/6Am/GlYImZSxe+ptEp3i+xuIvNW6+SzK5YI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MiHHXPdc8BGqkBHj6E5OWeY1dvWVxMguXccEQXutbUdB1HH5P7/t2PwBM0phkeK/hpkBqNT+M3SqblkmOtZs5hMFdN5iQ0WjR2iH2ySpg5suHhcB34ssZI4NNBhh8wTXEP6mX5oE88aW7cAmTyMzunjeUlmXo0L/Iwm4m9aLpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O58vCvrP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O58vCvrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785577382; x=1817113382;
  h=date:from:to:cc:subject:message-id;
  bh=TBWxxgi/6Am/GlYImZSxe+ptEp3i+xuIvNW6+SzK5YI=;
  b=O58vCvrP0jXiMJDzXhHEKeZKTXVNZgvy6x+jYMrc/hfjr9k0aZFeO2EV
   f+bwwEPYWezmtypQGhG6Gne+PLGyUvkJcEQLxewNjn6gG9U1rbA1lJe0K
   qZz0fjUXfp8m09iycLPltw1bun5CNixNj1Z9agfNn6CbMgkZulKgfPnNv
   1r2HI/vqEFrWAiXLBPrlQhJ8O1pDdivFAoE6qCqttLj3vleQfIw8pz2LW
   u/LwebPuDzji+ky2fVUfcuyUJcd8zgzxiBqDwXacuMS4wJ8i0w2/1VviB
   knVLCnoh9P4EUuRd57mpEIfxf/df7qZyL+8lyn5lDXN45b0N9QCx4WtQX
   Q==;
X-CSE-ConnectionGUID: lj+ZLJVOQ2CDwxwPWk5jBQ==
X-CSE-MsgGUID: nwWYGUVlQD6ijD26ault6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86395121"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86395121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 02:42:57 -0700
X-CSE-ConnectionGUID: Mj8z/X0ESCyl3KfGybfcDw==
X-CSE-MsgGUID: mn74dT4FTMCnnzTwWcStOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="260215069"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2026 02:42:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq6F4-0000000037D-0Y9f;
	Sat, 01 Aug 2026 09:42:54 +0000
Date: Sat, 01 Aug 2026 17:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 11/17]
 arch/arm64/include/asm/percpu.h:278:42: warning: conversion from 'long
 unsigned int' to 'u8' {aka 'unsigned char'} changes value from
 '18446744073709551615' to '255'
Message-ID: <202608011641.dj2IIpnP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   f14d3c444eacd9a722e55ff59e30cce2b1ac8985
commit: 55cddf3387a963a59fa5f7e0df28d64fc2d8aa51 [11/17] arm64: percpu: Implement preemptible read/write ops
config: arm64-randconfig-003-20260801 (https://download.01.org/0day-ci/archive/20260801/202608011641.dj2IIpnP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011641.dj2IIpnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011641.dj2IIpnP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/spectre.h:17,
                    from arch/arm64/include/asm/processor.h:47,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/stop_machine.h:5,
                    from kernel/trace/ftrace.c:17:
   kernel/trace/ftrace.c: In function 'ftrace_filter_pid_sched_switch_probe':
>> arch/arm64/include/asm/percpu.h:278:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]
     278 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
   arch/arm64/include/asm/percpu.h:260:20: note: in definition of macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
     369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
    8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> arch/arm64/include/asm/percpu.h:280:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
     280 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
   arch/arm64/include/asm/percpu.h:260:20: note: in definition of macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
     370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
    8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> arch/arm64/include/asm/percpu.h:282:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     282 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
   arch/arm64/include/asm/percpu.h:260:20: note: in definition of macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
    8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'ignore_task_cpu':
>> arch/arm64/include/asm/percpu.h:278:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]
     278 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
   arch/arm64/include/asm/percpu.h:260:20: note: in definition of macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
     369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
    8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> arch/arm64/include/asm/percpu.h:280:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
     280 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
   arch/arm64/include/asm/percpu.h:260:20: note: in definition of macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
     370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
    8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> arch/arm64/include/asm/percpu.h:282:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     282 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
   arch/arm64/include/asm/percpu.h:260:20: note: in definition of macro '_pcp_wrap'
     260 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
    8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~


vim +278 arch/arm64/include/asm/percpu.h

   267	
   268	#define this_cpu_read_1(pcp)		\
   269		_pcp_wrap_return(__percpu_read_8, pcp)
   270	#define this_cpu_read_2(pcp)		\
   271		_pcp_wrap_return(__percpu_read_16, pcp)
   272	#define this_cpu_read_4(pcp)		\
   273		_pcp_wrap_return(__percpu_read_32, pcp)
   274	#define this_cpu_read_8(pcp)		\
   275		_pcp_wrap_return(__percpu_read_64, pcp)
   276	
   277	#define this_cpu_write_1(pcp, val)	\
 > 278		_pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
   279	#define this_cpu_write_2(pcp, val)	\
 > 280		_pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
   281	#define this_cpu_write_4(pcp, val)	\
 > 282		_pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
   283	#define this_cpu_write_8(pcp, val)	\
   284		_pcp_wrap(__percpu_write_64, pcp, (unsigned long)val)
   285	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
