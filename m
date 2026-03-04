Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A085A35AC1F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639903; cv=none; b=rwW/AloK47OqgfybHp5b4dA/yWwWcGzt7ZI4YEmrzFcen+H46r2p2LjMFjFwk1PVC9StibxC12b3n/HlaE34/Gpuw+BwNV0QXn5HwFRbah2Qw+u/SX/dGxfhfFNK3dEXBPltDclI05mAVSn23ETg0nXM+7DEc4trSF1xrWaBdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639903; c=relaxed/simple;
	bh=ve/i1ovUikt4fchQnO2N10gdqtMlXSQie+WbwgtkGeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHYP3joT1WkH73EeRqN8v317R9bCQpJ0rhqAknMxJEcCEqBDeUOohZS/sLCkvJbUshOkH/T7V1236c9FuiESRS9/XVH6aSF8jezqMdMfGLNmlQYeIP4b2pyW4xMAMWTxfeV7R0MwwtTiZTy0/qIgQGmgh70tXhVYmB9XPg25CEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N83kT4uN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N83kT4uN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772639900; x=1804175900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ve/i1ovUikt4fchQnO2N10gdqtMlXSQie+WbwgtkGeY=;
  b=N83kT4uN+rFmPbLYfDdHWBLfsPXcMnMZmfr1GHAjkDQ/b8CCqn7AlanK
   9Q+QwOVnWqK4M1yRYt/aybR1wkH6AHAplDlFepkZYO6J+4u3SL/zBkCs6
   pOltgix6SgA09v8RyhC+NkFSIsJLqSw0E+zTIOdR3teik2lC9+wlMkFmN
   +dG3ZRC1AV3ysXbJDTSdZQhqSip0PODkAnE3xZjYTbcVDz/DyvMRZQ3Gb
   ZN1zv7yN/UT/C2rCivobB95XDlwepkcL444bziAkbhxUbMvHMT+snXccD
   cBQimCIvVY0zvqgzEiH0Snx9yTSZlk/byE9svu3Dlmh9zkBvA3w8GOjTR
   A==;
X-CSE-ConnectionGUID: ILWNnq5yTKOo9TOy5GNDrg==
X-CSE-MsgGUID: hdOKVHzuSPK6jcN4YZGL8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91276260"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="91276260"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 07:58:13 -0800
X-CSE-ConnectionGUID: qiM638BcQQqns2nKWZp60g==
X-CSE-MsgGUID: 9dWsxsm2T+CJptlk5rFkxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="215730108"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 07:58:02 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxobn-0000000040L-0Ums;
	Wed, 04 Mar 2026 15:57:59 +0000
Date: Wed, 4 Mar 2026 23:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Gerlach <lukas.gerlach@cispa.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Laight <david.laight.linux@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Daniel Weber <daniel.weber@cispa.de>,
	Michael Schwarz <michael.schwarz@cispa.de>,
	Marton Bognar <marton.bognar@kuleuven.be>,
	Jo Van Bulck <jo.vanbulck@kuleuven.be>,
	Lukas Gerlach <lukas.gerlach@cispa.de>
Subject: Re: [PATCH v2] riscv: Limit uaccess speculation using guard page
Message-ID: <202603042332.krm6lzx8-lkp@intel.com>
References: <20260226-uaccess-guard-v2-v2-1-765a314839bc@cispa.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-uaccess-guard-v2-v2-1-765a314839bc@cispa.de>

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f4d0ec0aa20d49f09dc01d82894ce80d72de0560]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Gerlach/riscv-Limit-uaccess-speculation-using-guard-page/20260227-000028
base:   f4d0ec0aa20d49f09dc01d82894ce80d72de0560
patch link:    https://lore.kernel.org/r/20260226-uaccess-guard-v2-v2-1-765a314839bc%40cispa.de
patch subject: [PATCH v2] riscv: Limit uaccess speculation using guard page
config: riscv-randconfig-001-20260304 (https://download.01.org/0day-ci/archive/20260304/202603042332.krm6lzx8-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603042332.krm6lzx8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603042332.krm6lzx8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/mm.h:37,
                    from arch/riscv/kernel/asm-offsets.c:9:
   arch/riscv/include/asm/uaccess.h: In function '__uaccess_mask_ptr':
>> arch/riscv/include/asm/uaccess.h:86:65: warning: right shift count >= width of type [-Wshift-count-overflow]
     unsigned long mask = (unsigned long)((long)(TASK_SIZE - 1 - p) >> 63);
                                                                    ^~
--
   In file included from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/poll.h:10,
                    from fs/signalfd.c:22:
   arch/riscv/include/asm/uaccess.h: In function '__uaccess_mask_ptr':
>> arch/riscv/include/asm/uaccess.h:86:65: warning: right shift count >= width of type [-Wshift-count-overflow]
     unsigned long mask = (unsigned long)((long)(TASK_SIZE - 1 - p) >> 63);
                                                                    ^~
   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:95,
                    from fs/signalfd.c:32:
   fs/signalfd.c: At top level:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_signalfd4' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/signalfd.c:299:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(signalfd4, int, ufd, sigset_t __user *, user_mask,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/signalfd.c:299:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(signalfd4, int, ufd, sigset_t __user *, user_mask,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_signalfd' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/signalfd.c:311:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(signalfd, int, ufd, sigset_t __user *, user_mask,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/signalfd.c:311:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(signalfd, int, ufd, sigset_t __user *, user_mask,
    ^~~~~~~~~~~~~~~
--
   In file included from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/sync.c:6:
   arch/riscv/include/asm/uaccess.h: In function '__uaccess_mask_ptr':
>> arch/riscv/include/asm/uaccess.h:86:65: warning: right shift count >= width of type [-Wshift-count-overflow]
     unsigned long mask = (unsigned long)((long)(TASK_SIZE - 1 - p) >> 63);
                                                                    ^~
   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/blkdev.h:9,
                    from fs/sync.c:6:
   fs/sync.c: At top level:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_syncfs' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/sync.c:148:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(syncfs, int, fd)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/sync.c:148:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(syncfs, int, fd)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_sync_file_range2' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long long int,  long long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/sync.c:377:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(sync_file_range2, int, fd, unsigned int, flags,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/sync.c:377:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(sync_file_range2, int, fd, unsigned int, flags,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_sync_file_range' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long long int,  long long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/sync.c:360:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(sync_file_range, int, fd, loff_t, offset, loff_t, nbytes,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/sync.c:360:1: note: in expansion of macro 'SYSCALL_DEFINE4'
--
   In file included from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/namei.h:5,
                    from fs/utimes.c:4:
   arch/riscv/include/asm/uaccess.h: In function '__uaccess_mask_ptr':
>> arch/riscv/include/asm/uaccess.h:86:65: warning: right shift count >= width of type [-Wshift-count-overflow]
     unsigned long mask = (unsigned long)((long)(TASK_SIZE - 1 - p) >> 63);
                                                                    ^~
   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:95,
                    from fs/utimes.c:6:
   fs/utimes.c: At top level:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_utimensat' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/utimes.c:142:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(utimensat, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/utimes.c:142:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(utimensat, int, dfd, const char __user *, filename,
    ^~~~~~~~~~~~~~~
--
   In file included from include/linux/uaccess.h:13,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/namei.c:22:
   arch/riscv/include/asm/uaccess.h: In function '__uaccess_mask_ptr':
>> arch/riscv/include/asm/uaccess.h:86:65: warning: right shift count >= width of type [-Wshift-count-overflow]
     unsigned long mask = (unsigned long)((long)(TASK_SIZE - 1 - p) >> 63);
                                                                    ^~
   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/bpf.h:21,
                    from include/linux/security.h:35,
                    from fs/namei.c:29:
   fs/namei.c: At top level:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_mknodat' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namei.c:5169:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(mknodat, int, dfd, const char __user *, filename, umode_t, mode,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namei.c:5169:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(mknodat, int, dfd, const char __user *, filename, umode_t, mode,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_rename' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namei.c:6184:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(rename, const char __user *, oldname, const char __user *, newname)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namei.c:6184:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    SYSCALL_DEFINE2(rename, const char __user *, oldname, const char __user *, newname)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_renameat' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namei.c:6176:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(renameat, int, olddfd, const char __user *, oldname,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namei.c:6176:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(renameat, int, olddfd, const char __user *, oldname,
    ^~~~~~~~~~~~~~~
..


vim +86 arch/riscv/include/asm/uaccess.h

    58	
    59	#define __enable_user_access()							\
    60		__asm__ __volatile__ ("csrs sstatus, %0" : : "r" (SR_SUM) : "memory")
    61	#define __disable_user_access()							\
    62		__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
    63	
    64	/*
    65	 * This is the smallest unsigned integer type that can fit a value
    66	 * (up to 'long long')
    67	 */
    68	#define __inttype(x) __typeof__(		\
    69		__typefits(x, char,			\
    70		  __typefits(x, short,			\
    71		    __typefits(x, int,			\
    72		      __typefits(x, long, 0ULL)))))
    73	
    74	#define __typefits(x, type, not) \
    75		__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
    76	
    77	/*
    78	 * Sanitize a uaccess pointer such that it cannot reach any kernel address.
    79	 * Branchlessly clamp any address >= TASK_SIZE to the unmapped guard page
    80	 * at TASK_SIZE-1, which will always fault on access.
    81	 */
    82	#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
    83	static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
    84	{
    85		unsigned long p = (unsigned long)ptr;
  > 86		unsigned long mask = (unsigned long)((long)(TASK_SIZE - 1 - p) >> 63);
    87	
    88		return (void __user *)((p & ~mask) | ((TASK_SIZE - 1) & mask));
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
