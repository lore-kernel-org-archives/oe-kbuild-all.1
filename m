Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EFF846A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 00:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373031; cv=none; b=LCpfVR0z+qubRQXqlkfuZLs1gNg3LSypnknbmOeB1mqZ+6GXGNeOknD7CcOowuunBA00INwDDyPAxltA4/mlINeZsZsqHwfej1kXfufV1xjX5EGjlGqfiHr+ni8JPePfhaokwciRP5IMfwRLvoDi5oDf8jtJqJ64qinNTSFRQCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373031; c=relaxed/simple;
	bh=7jYTWpABzj7MW5pm+bh5if5zy+esuQ4lq/eAnNnpY/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IlrlWxdGdxj9lE5QSH2661K/etFjYEYep9Ms/F4gP25W+F0Fm7y41kAjQ8NltiN+NftY1Rfw6T0NPTaYARsHxJJ3bHrrVsTUxEcIgMtE+qnZ5fsaU6Di23cNidDXdSMpBgM1XF+br9tN6dkrrQEMFZa/bCTcNWkv0A36xig6L9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuXrfFia; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuXrfFia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785373030; x=1816909030;
  h=date:from:to:cc:subject:message-id;
  bh=7jYTWpABzj7MW5pm+bh5if5zy+esuQ4lq/eAnNnpY/M=;
  b=QuXrfFiaTsNyX902gkWLC7OpTHGZCGHOzHJAubhopgjC67nngb7Jv5zW
   ooIDU0kXS2PrfrY0l6hRmQMpSo35HmyYjo5hfp3qARJ3Du5kfBhJ2e41k
   M4+JVtkMUbtVTnK8BbpdxxdLATkkQq1atE05jFBCkkkIWAZMJ+Y/IS0nL
   5kJf0Ruxuo004rAnzS3bDzrHvk1kIoQNOCrcm5f7QWW0B76B9Zrz25Ac7
   uP4pynWPzoBuyN5Xs2X0Mb06Cjsd171X0kG60yE5AgpMisKhPSAVw1kOd
   8wTye87oL9z/cc3FrXVfkfxhhIEROQ1ZA6/XifDMI/uIQ0wudIAInuGZf
   w==;
X-CSE-ConnectionGUID: TJo5RVMeSom9l1fEdvBFCQ==
X-CSE-MsgGUID: xaRrYugLR5C7uU1HcY1KaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97144312"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="97144312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 17:57:09 -0700
X-CSE-ConnectionGUID: lXL9KCrbToalfU0djD6E8w==
X-CSE-MsgGUID: L/KhpIz7RKeXN0Zy5nQnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="260768961"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2026 17:57:08 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpF57-000000002IQ-394s;
	Thu, 30 Jul 2026 00:57:05 +0000
Date: Thu, 30 Jul 2026 02:56:52 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/percpu-fixup 9/17]
 ./arch/arm64/include/asm/percpu.h:267:42: warning: conversion from 'long
 unsigned int' to 'u8' {aka 'unsigned char'} changes value from
 '18446744073709551615' to '255'
Message-ID: <202607300237.brVnlEXp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/percpu-fixup
head:   d1bf23b2ad173d4e8810016cbc69f2fb8f33ca93
commit: ebdcfd6d03ef8e35fb0ea95e49d0fce1ce2ec4cd [9/17] arm64: percpu: Implement preemptible read/write ops
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260730/202607300237.brVnlEXp-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300237.brVnlEXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300237.brVnlEXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/spectre.h:17,
                    from ./arch/arm64/include/asm/processor.h:47,
                    from ./include/linux/sched.h:13,
                    from ./include/linux/ratelimit.h:6,
                    from ./include/linux/dev_printk.h:16,
                    from ./include/linux/device.h:15,
                    from ./include/linux/node.h:18,
                    from ./include/linux/cpu.h:17,
                    from ./include/linux/stop_machine.h:5,
                    from kernel/trace/ftrace.c:17:
   kernel/trace/ftrace.c: In function 'ftrace_filter_pid_sched_switch_probe':
>> ./arch/arm64/include/asm/percpu.h:267:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]
     267 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
   ./arch/arm64/include/asm/percpu.h:249:20: note: in definition of macro '_pcp_wrap'
     249 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   ./include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
     369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   ./include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
    8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/percpu.h:269:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
     269 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
   ./arch/arm64/include/asm/percpu.h:249:20: note: in definition of macro '_pcp_wrap'
     249 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   ./include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
     370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   ./include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
    8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/percpu.h:271:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     271 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
   ./arch/arm64/include/asm/percpu.h:249:20: note: in definition of macro '_pcp_wrap'
     249 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   ./include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   ./include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8628:17: note: in expansion of macro 'this_cpu_write'
    8628 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'ignore_task_cpu':
>> ./arch/arm64/include/asm/percpu.h:267:42: warning: conversion from 'long unsigned int' to 'u8' {aka 'unsigned char'} changes value from '18446744073709551615' to '255' [-Woverflow]
     267 |         _pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
   ./arch/arm64/include/asm/percpu.h:249:20: note: in definition of macro '_pcp_wrap'
     249 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   ./include/linux/percpu-defs.h:369:25: note: in expansion of macro 'this_cpu_write_1'
     369 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   ./include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
    8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/percpu.h:269:43: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '18446744073709551615' to '65535' [-Woverflow]
     269 |         _pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
   ./arch/arm64/include/asm/percpu.h:249:20: note: in definition of macro '_pcp_wrap'
     249 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   ./include/linux/percpu-defs.h:370:25: note: in expansion of macro 'this_cpu_write_2'
     370 |                 case 2: stem##2(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   ./include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
    8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~
>> ./arch/arm64/include/asm/percpu.h:271:43: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     271 |         _pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
   ./arch/arm64/include/asm/percpu.h:249:20: note: in definition of macro '_pcp_wrap'
     249 |         op(&(pcp), __VA_ARGS__);                                        \
         |                    ^~~~~~~~~~~
   ./include/linux/percpu-defs.h:371:25: note: in expansion of macro 'this_cpu_write_4'
     371 |                 case 4: stem##4(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   ./include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:8898:17: note: in expansion of macro 'this_cpu_write'
    8898 |                 this_cpu_write(tr->array_buffer.data->ftrace_ignore_pid,
         |                 ^~~~~~~~~~~~~~


vim +267 ./arch/arm64/include/asm/percpu.h

   256	
   257	#define this_cpu_read_1(pcp)		\
   258		_pcp_wrap_return(__percpu_read_8, pcp)
   259	#define this_cpu_read_2(pcp)		\
   260		_pcp_wrap_return(__percpu_read_16, pcp)
   261	#define this_cpu_read_4(pcp)		\
   262		_pcp_wrap_return(__percpu_read_32, pcp)
   263	#define this_cpu_read_8(pcp)		\
   264		_pcp_wrap_return(__percpu_read_64, pcp)
   265	
   266	#define this_cpu_write_1(pcp, val)	\
 > 267		_pcp_wrap(__percpu_write_8, pcp, (unsigned long)val)
   268	#define this_cpu_write_2(pcp, val)	\
 > 269		_pcp_wrap(__percpu_write_16, pcp, (unsigned long)val)
   270	#define this_cpu_write_4(pcp, val)	\
 > 271		_pcp_wrap(__percpu_write_32, pcp, (unsigned long)val)
   272	#define this_cpu_write_8(pcp, val)	\
   273		_pcp_wrap(__percpu_write_64, pcp, (unsigned long)val)
   274	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
