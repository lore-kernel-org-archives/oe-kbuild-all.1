Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E2919E83C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612342; cv=none; b=ZPvWkEB14eJhrVNHNEa69xfK/TcDaT5jAxLPFrV2asKdSbECH4+jeegfln/+FMAzvfMN6F/Ho5QsFJRcez6KzA3v4gL0EH89naaJKFKEqeExKPOek17lAP6ZI/DO+Cu7u9DTjO0KQVLX8FOohXNydjSG/pN7jNGn1gAexBJvDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612342; c=relaxed/simple;
	bh=CB/YBPNbEL0xtwkpnIOBS5V6zMB3DOFtd7RM4y8AEXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Znb1L+cqHATU+nHEi4yPYpjZVEGBQkI67YkBCKFHtAokWQwY69fH617DF37f7a2cnrNVubu69QfosErcx5/JhuHFXQZAtl63128d7mvfBYKtGFrmEzz9lCj9vun1MbXkZKbKWpTiJw6/KuE+L+34G3sNP6ubChjp1S5ky7NMqko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOGHVBvr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOGHVBvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752612340; x=1784148340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CB/YBPNbEL0xtwkpnIOBS5V6zMB3DOFtd7RM4y8AEXo=;
  b=GOGHVBvrqpdLqqG+QsOf5VhM4U+sYKjoJXjmYHn2KZAUZRyT9S0kyAhz
   w/ij5kkt0bpmKtnH79tHUryMNz4epJwf0pJ40S8q8OfJmdb0jWuljL7n9
   CNTlvOWHKdytJO7ss5ti2wVSKhu2NQct2BN/0zerYGl3ODTL3CSr1+sKB
   xdC9Gx19kIlyinS5F7xlTNmiv9xzP/VJ/jmWLoV5rSescnKWPK3D8GQEs
   E849cmQCqVRvbavCqWPRbNYvjZo3IWBDljgL9veGxZSNOUPDLgD6VxYT5
   wk1504WNS5ZUZnp1r25YOAzNqVo75903rynKKs4QcuHo6ACz6lQ4zdZMX
   g==;
X-CSE-ConnectionGUID: H2p30i0eTBudZTXkqUbuXA==
X-CSE-MsgGUID: kotmeHWjQbCtoVpl4M3SPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54971597"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="54971597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 13:45:38 -0700
X-CSE-ConnectionGUID: 5SPVyE1wQn2+8XfEyh8vQw==
X-CSE-MsgGUID: vo2b1Az7Tcmqei9x3XQ+xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="157823864"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jul 2025 13:45:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubmWs-000BWs-10;
	Tue, 15 Jul 2025 20:45:34 +0000
Date: Wed, 16 Jul 2025 04:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhengchuan <zhengchuan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1730/1730]
 include/linux/uaccess.h:112:17: warning: 'cap' may be used uninitialized
Message-ID: <202507160405.SS3T4FhD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paolo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   eabd480503b5c662a59778c9fa8c1a8f611d724e
commit: 5694b2e450d4ad76c3314ad8ac73025bc616930e [1730/1730] kvm: make KVM_CAP_ENABLE_CAP_VM architecture agnostic
config: arm64-randconfig-001-20250714 (https://download.01.org/0day-ci/archive/20250716/202507160405.SS3T4FhD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160405.SS3T4FhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160405.SS3T4FhD-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'kvm_dying_cpu' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3447:2:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'raw_spinlock_t[1]' {aka 'struct raw_spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_dying_cpu':
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:97:28: note: object 'kvm_count_lock' of size 4
      97 | static DEFINE_RAW_SPINLOCK(kvm_count_lock);
         |                            ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:59:48: note: in definition of macro 'DEFINE_RAW_SPINLOCK'
      59 | #define DEFINE_RAW_SPINLOCK(x)  raw_spinlock_t x = __RAW_SPIN_LOCK_UNLOCKED(x)
         |                                                ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'hardware_disable_all' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3465:2:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'raw_spinlock_t[1]' {aka 'struct raw_spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: In function 'hardware_disable_all':
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:97:28: note: object 'kvm_count_lock' of size 4
      97 | static DEFINE_RAW_SPINLOCK(kvm_count_lock);
         |                            ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:59:48: note: in definition of macro 'DEFINE_RAW_SPINLOCK'
      59 | #define DEFINE_RAW_SPINLOCK(x)  raw_spinlock_t x = __RAW_SPIN_LOCK_UNLOCKED(x)
         |                                                ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'hardware_disable_all' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3465:2:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'raw_spinlock_t[1]' {aka 'struct raw_spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: In function 'hardware_disable_all':
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:97:28: note: object 'kvm_count_lock' of size 4
      97 | static DEFINE_RAW_SPINLOCK(kvm_count_lock);
         |                            ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:59:48: note: in definition of macro 'DEFINE_RAW_SPINLOCK'
      59 | #define DEFINE_RAW_SPINLOCK(x)  raw_spinlock_t x = __RAW_SPIN_LOCK_UNLOCKED(x)
         |                                                ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'hardware_enable_all' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3474:2,
       inlined from 'kvm_create_vm' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:688:6:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'raw_spinlock_t[1]' {aka 'struct raw_spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_create_vm':
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:97:28: note: object 'kvm_count_lock' of size 4
      97 | static DEFINE_RAW_SPINLOCK(kvm_count_lock);
         |                            ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:59:48: note: in definition of macro 'DEFINE_RAW_SPINLOCK'
      59 | #define DEFINE_RAW_SPINLOCK(x)  raw_spinlock_t x = __RAW_SPIN_LOCK_UNLOCKED(x)
         |                                                ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'hardware_enable_all' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3474:2,
       inlined from 'kvm_create_vm' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:688:6:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'raw_spinlock_t[1]' {aka 'struct raw_spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_create_vm':
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:97:28: note: object 'kvm_count_lock' of size 4
      97 | static DEFINE_RAW_SPINLOCK(kvm_count_lock);
         |                            ^~~~~~~~~~~~~~
   include/linux/spinlock_types.h:59:48: note: in definition of macro 'DEFINE_RAW_SPINLOCK'
      59 | #define DEFINE_RAW_SPINLOCK(x)  raw_spinlock_t x = __RAW_SPIN_LOCK_UNLOCKED(x)
         |                                                ^
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3097:7:
>> include/linux/uaccess.h:112:17: warning: 'cap' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3094:39: note: 'cap' declared here
    3094 |                 struct kvm_enable_cap cap;
         |                                       ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3106:7:
   include/linux/uaccess.h:112:17: warning: 'kvm_userspace_mem' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3103:52: note: 'kvm_userspace_mem' declared here
    3103 |                 struct kvm_userspace_memory_region kvm_userspace_mem;
         |                                                    ^~~~~~~~~~~~~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3117:7:
   include/linux/uaccess.h:112:17: warning: 'log' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3114:38: note: 'log' declared here
    3114 |                 struct kvm_dirty_log log;
         |                                      ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3127:7:
   include/linux/uaccess.h:112:17: warning: 'zone' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3124:48: note: 'zone' declared here
    3124 |                 struct kvm_coalesced_mmio_zone zone;
         |                                                ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3136:7:
   include/linux/uaccess.h:112:17: warning: 'zone' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3133:48: note: 'zone' declared here
    3133 |                 struct kvm_coalesced_mmio_zone zone;
         |                                                ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3146:7:
   include/linux/uaccess.h:112:17: warning: 'data' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3143:34: note: 'data' declared here
    3143 |                 struct kvm_irqfd data;
         |                                  ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3155:7:
   include/linux/uaccess.h:112:17: warning: 'data' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3152:38: note: 'data' declared here
    3152 |                 struct kvm_ioeventfd data;
         |                                      ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'kvm_vm_ioctl' at arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3165:7:
   include/linux/uaccess.h:112:17: warning: 'msi' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'kvm_vm_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/../../../virt/kvm/kvm_main.c:3162:32: note: 'msi' declared here
    3162 |                 struct kvm_msi msi;
         |                                ^~~


vim +/cap +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
