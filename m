Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D91363C5B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 23:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284659; cv=none; b=ZwwO02i/5lvuHvNaGi+gkcrAi7Pr0ciyOIZk1Gift58yMwAb1RAyTDnko2Q9VtJWRrXKqkQ5MM5260DrQE3l02B0a/DjayrRMGAPM6uNqCpINosgzUZ1MsbvV9OmPa0CIOSLXH/nMkgNpDJeXzs1T+cBt42DZGU2P9IVVpp6x8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284659; c=relaxed/simple;
	bh=Aewt5sXfTN3/DOBVZcy2OL8cUUtt7LU70ro0UnyUtL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mAyiLqhYmg40ogHtztK/0FdZn3DQYYNPwwb1iRp8vh780xANcZmYm7MPcFtPvQiT/7wV0SFYRn4wzcUUI93AmflfRpZSHmMFoWtsjul1CRXlV9TPc3dIkwtuJ9BRiFV4+XWc8UAy4LipH3RFMrAjs2FAEp6KiFbRXVpaDTdGGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJGp7E0B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJGp7E0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778284657; x=1809820657;
  h=date:from:to:cc:subject:message-id;
  bh=Aewt5sXfTN3/DOBVZcy2OL8cUUtt7LU70ro0UnyUtL8=;
  b=nJGp7E0BhqGtW8l/xqnN/c1Qjz1cSBZB9KJ0kkzNKyvFyHC9zLrH/RIP
   M4NVXqJCXDKnU0UCSbe33GXAx5O3j/IN/Q7Wrip/Te3xsrFEmb2I/VJly
   DY7c1+mpx4NG4dYWKom6heiZ1o+PJM1mWMSsxKEKTHqCDWZqeK8D2GoAt
   bMaF7aWz63qdDA7N0Jdb1Kd8a/fmbonxGVMMzbGeJhYF8jdbQpzXyYlsA
   XBxRJN0njIivYZR0X+pqgkY4NFUqkwYEnbVW3lVM435+ipifSXe1zAKmD
   tjIBm3/AcSloseXPCSiHUqjgMyfPM75Afs6dkFDSeT6Jz18Y7YUytZDmr
   w==;
X-CSE-ConnectionGUID: cwcUEiTORACCOuO0HqBgxA==
X-CSE-MsgGUID: emG0TRkpQPGLt4+Pk4j0XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79252447"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="79252447"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 16:57:36 -0700
X-CSE-ConnectionGUID: HvBmBUtpRXGwobSFVXCZaw==
X-CSE-MsgGUID: BRkm9DcJSFy0EDFWID020w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="237013294"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2026 16:57:34 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLV4V-000000000VF-3idt;
	Fri, 08 May 2026 23:57:31 +0000
Date: Sat, 09 May 2026 07:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 9/23] include/linux/bottom_half.h:20:24:
 error: unknown register name '$ra' in asm
Message-ID: <202605090722.nIHNKlAS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   60ba32992f2b8fe14ebfd2b719ac54d8dfda000e
commit: cd54ce66f7a1aea322b6a742b40c9768916c33a4 [9/23] mips: Implement _THIS_IP_ using inline asm
config: mips-randconfig-r134-20260509 (https://download.01.org/0day-ci/archive/20260509/202605090722.nIHNKlAS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090722.nIHNKlAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090722.nIHNKlAS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:62:
>> include/linux/bottom_half.h:20:24: error: unknown register name '$ra' in asm
      20 |         __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFFSET);
         |                               ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:62:
   include/linux/bottom_half.h:33:23: error: unknown register name '$ra' in asm
      33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFFSET);
         |                              ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:304:
>> include/linux/spinlock_api_up.h:89:2: error: unknown register name '$ra' in asm
      89 |         __LOCK_BH(lock);
         |         ^
   include/linux/spinlock_api_up.h:37:30: note: expanded from macro '__LOCK_BH'
      37 |   do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                              ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
>> include/linux/spinlock.h:348:2: error: unknown register name '$ra' in asm
     348 |         raw_spin_lock_bh(&lock->rlock);
         |         ^
   include/linux/spinlock.h:276:33: note: expanded from macro 'raw_spin_lock_bh'
     276 | #define raw_spin_lock_bh(lock)          _raw_spin_lock_bh(lock)
         |                                         ^
   include/linux/spinlock_api_up.h:69:35: note: expanded from macro '_raw_spin_lock_bh'
      69 | #define _raw_spin_lock_bh(lock)                 __LOCK_BH(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:37:30: note: expanded from macro '__LOCK_BH'
      37 |   do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                              ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   include/linux/spinlock.h:396:2: error: unknown register name '$ra' in asm
     396 |         raw_spin_unlock_bh(&lock->rlock);
         |         ^
   include/linux/spinlock.h:285:34: note: expanded from macro 'raw_spin_unlock_bh'
     285 | #define raw_spin_unlock_bh(lock)        _raw_spin_unlock_bh(lock)
         |                                         ^
   include/linux/spinlock_api_up.h:131:36: note: expanded from macro '_raw_spin_unlock_bh'
     131 | #define _raw_spin_unlock_bh(lock)               __UNLOCK_BH(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:55:29: note: expanded from macro '__UNLOCK_BH'
      55 |   do { __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); \
         |                             ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   include/linux/spinlock.h:563:7: error: unknown register name '$ra' in asm
     563 |                     raw_spin_unlock_bh(_T->lock))
         |                     ^
   include/linux/spinlock.h:285:34: note: expanded from macro 'raw_spin_unlock_bh'
     285 | #define raw_spin_unlock_bh(lock)        _raw_spin_unlock_bh(lock)
         |                                         ^
   include/linux/spinlock_api_up.h:131:36: note: expanded from macro '_raw_spin_unlock_bh'
     131 | #define _raw_spin_unlock_bh(lock)               __UNLOCK_BH(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:55:29: note: expanded from macro '__UNLOCK_BH'
      55 |   do { __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); \
         |                             ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:9:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   include/linux/spinlock.h:562:7: error: unknown register name '$ra' in asm
     562 |                     raw_spin_lock_bh(_T->lock),
         |                     ^
   include/linux/spinlock.h:276:33: note: expanded from macro 'raw_spin_lock_bh'
     276 | #define raw_spin_lock_bh(lock)          _raw_spin_lock_bh(lock)
         |                                         ^
   include/linux/spinlock_api_up.h:69:35: note: expanded from macro '_raw_spin_lock_bh'
      69 | #define _raw_spin_lock_bh(lock)                 __LOCK_BH(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:37:30: note: expanded from macro '__LOCK_BH'
      37 |   do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                              ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
--
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:140:3: note: expanded from macro '_SIG_SET_BINOP'
     140 |                 r->sig[3] = op(a3, b3);                                 \
         |                 ^      ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
     141 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
>> include/linux/fs.h:2763:2: error: unknown register name '$ra' in asm
    2763 |         __sb_writers_release(inode->i_sb, SB_FREEZE_WRITE);
         |         ^
   include/linux/fs/super.h:30:59: note: expanded from macro '__sb_writers_release'
      30 |         percpu_rwsem_release(&(sb)->s_writers.rw_sem[(lev) - 1], _THIS_IP_)
         |                                                                  ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   include/linux/fs.h:2779:2: error: unknown register name '$ra' in asm
    2779 |         __sb_writers_acquired(inode->i_sb, SB_FREEZE_WRITE);
         |         ^
   include/linux/fs/super.h:28:62: note: expanded from macro '__sb_writers_acquired'
      28 |         percpu_rwsem_acquire(&(sb)->s_writers.rw_sem[(lev) - 1], 1, _THIS_IP_)
         |                                                                     ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
   include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:34:
>> include/linux/sockptr.h:126:12: error: unknown register name '$ra' in asm
     126 |         void *p = kmalloc_track_caller_noprof(len, GFP_USER | __GFP_NOWARN);
         |                   ^
   include/linux/slab.h:1258:3: note: expanded from macro 'kmalloc_track_caller_noprof'
    1258 |                 kmalloc_node_track_caller_noprof(__VA_ARGS__, NUMA_NO_NODE, _RET_IP_)
         |                 ^
   include/linux/slab.h:1243:69: note: expanded from macro 'kmalloc_node_track_caller_noprof'
    1243 |         __kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(size, NULL, __kmalloc_token(size)), flags, node, caller)
         |                                                                            ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _CODE_LOCATION_ })
         |                                                       ^
   include/linux/instruction_pointer.h:34:25: note: expanded from macro '_CODE_LOCATION_'
      34 | #define _CODE_LOCATION_ _THIS_IP_
         |                         ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:34:
   include/linux/sockptr.h:140:12: error: unknown register name '$ra' in asm
     140 |         char *p = kmalloc_track_caller_noprof(len + 1, GFP_KERNEL);
         |                   ^
   include/linux/slab.h:1258:3: note: expanded from macro 'kmalloc_track_caller_noprof'
    1258 |                 kmalloc_node_track_caller_noprof(__VA_ARGS__, NUMA_NO_NODE, _RET_IP_)
         |                 ^
   include/linux/slab.h:1243:69: note: expanded from macro 'kmalloc_node_track_caller_noprof'
    1243 |         __kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(size, NULL, __kmalloc_token(size)), flags, node, caller)
         |                                                                            ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _CODE_LOCATION_ })
         |                                                       ^
   include/linux/instruction_pointer.h:34:25: note: expanded from macro '_CODE_LOCATION_'
      34 | #define _CODE_LOCATION_ _THIS_IP_
         |                         ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:28:
>> include/linux/bpfptr.h:70:12: error: unknown register name '$ra' in asm
      70 |         void *p = kvmalloc_node_align_noprof(len, 1, GFP_USER | __GFP_NOWARN, NUMA_NO_NODE);
         |                   ^
   include/linux/slab.h:1301:58: note: expanded from macro 'kvmalloc_node_align_noprof'
    1301 |         __kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, NULL, __kmalloc_token(_size)), _align, _flags, _node)
         |                                                                 ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _CODE_LOCATION_ })
         |                                                       ^
   include/linux/instruction_pointer.h:34:25: note: expanded from macro '_CODE_LOCATION_'
      34 | #define _CODE_LOCATION_ _THIS_IP_
         |                         ^
   arch/mips/include/asm/linkage.h:18:26: note: expanded from macro '_THIS_IP_'
      18 |                      : "=r" (__ip) : : "$ra"    \
         |                                        ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
>> include/linux/bpf.h:2308:9: error: unknown register name '$ra' in asm
    2308 |         return kzalloc_obj(*map->owner, GFP_ATOMIC);
         |                ^
   include/linux/slab.h:1131:15: note: expanded from macro 'kzalloc_obj'
    1131 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |                      ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
>> include/linux/bpf.h:2308:9: error: unknown register name '$ra' in asm
   include/linux/slab.h:1131:15: note: expanded from macro 'kzalloc_obj'
    1131 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |                      ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
   In file included from include/linux/kvm_host.h:5:
   In file included from include/linux/entry-virt.h:7:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
>> include/linux/bpf.h:2308:9: error: unknown register name '$ra' in asm
   include/linux/slab.h:1131:15: note: expanded from macro 'kzalloc_obj'
    1131 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |                      ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
>> include/linux/kvm_host.h:1679:9: error: unknown register name '$ra' in asm
    1679 |         return kzalloc_obj(struct kvm, GFP_KERNEL_ACCOUNT);
         |                ^
   include/linux/slab.h:1131:15: note: expanded from macro 'kzalloc_obj'
    1131 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |                      ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
>> include/linux/kvm_host.h:1679:9: error: unknown register name '$ra' in asm
   include/linux/slab.h:1131:15: note: expanded from macro 'kzalloc_obj'
    1131 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |                      ^
   In file included from arch/mips/kernel/asm-offsets.c:26:
>> include/linux/kvm_host.h:1679:9: error: unknown register name '$ra' in asm
   include/linux/slab.h:1131:15: note: expanded from macro 'kzalloc_obj'
    1131 |         __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
         |                      ^
   30 warnings and 18 errors generated.
   make[3]: *** [scripts/Makefile.build:184: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'missing-syscalls' not remade because of errors.
   make[2]: *** [arch/mips/Makefile:424: archprepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +20 include/linux/bottom_half.h

0bd3a173d71185 Peter Zijlstra 2013-11-19  17  
0bd3a173d71185 Peter Zijlstra 2013-11-19  18  static inline void local_bh_disable(void)
0bd3a173d71185 Peter Zijlstra 2013-11-19  19  {
0bd3a173d71185 Peter Zijlstra 2013-11-19 @20  	__local_bh_disable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFFSET);
0bd3a173d71185 Peter Zijlstra 2013-11-19  21  }
0bd3a173d71185 Peter Zijlstra 2013-11-19  22  

:::::: The code at line 20 was first introduced by commit
:::::: 0bd3a173d711857fc9f583eb5825386cc08f3948 sched/preempt, locking: Rework local_bh_{dis,en}able()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
