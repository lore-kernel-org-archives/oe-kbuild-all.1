Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB451849
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 04:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRXt6WIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702787721; x=1734323721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kd1Q9/h3mV2Hj2CHVXnCPUPErPQnSQ4MFywQv/l5KeU=;
  b=cRXt6WIvJpWjS7Rsr7SSKdbna8mB/5KQRZ6VW4ORCtE3hTUAqv3iDZaF
   wFymEeekQ0fyA2kZXNTtpL1RVQxJqEyaOD7VuGCwpAgJ3ZEg/Or7rEZGa
   P2xDmnZYPUTYD+oS0QZyx0SgcF2F/to7oeTnuhljNNXUWIWwO+mKbRIVx
   ypPHcxvyOXI9RHw5FPzpkjwgCDlyZk66JD83MmlsfhOeSky7eb4ScSRcp
   7C5EzdQznfduLWArq4oC1CsI+UgkUT0NoPfq/hluANgrdoKKAkdEZ+sbp
   Xt6vrvfJtpwQBjpflR71ZFzNDpbAjsbzfUBSt24GgZaoOKBb4JfqQJsfb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2251777"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2251777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:35:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768446999"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768446999"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 20:35:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEis1-0002du-0b;
	Sun, 17 Dec 2023 04:35:17 +0000
Date: Sun, 17 Dec 2023 12:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 32/50]
 include/asm-generic/qspinlock_types.h:44:3: error: conflicting types for
 'arch_spinlock_t'; have 'struct qspinlock'
Message-ID: <202312171246.6bDD0KZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 631d67d0997ba8606f0d3702de9d986a95429bfe [32/50] ipc: Kill bogus dependency on spinlock.h
config: i386-randconfig-015-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171246.6bDD0KZK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171246.6bDD0KZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171246.6bDD0KZK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/qspinlock.h:7,
                    from arch/x86/include/asm/spinlock.h:27,
                    from include/linux/sched.h:2142,
                    from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> include/asm-generic/qspinlock_types.h:44:3: error: conflicting types for 'arch_spinlock_t'; have 'struct qspinlock'
      44 | } arch_spinlock_t;
         |   ^~~~~~~~~~~~~~~
   In file included from include/linux/spinlock_types_raw.h:9,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/spinlock_types_up.h:19:3: note: previous declaration of 'arch_spinlock_t' with type 'arch_spinlock_t'
      19 | } arch_spinlock_t;
         |   ^~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49: warning: "__ARCH_SPIN_LOCK_UNLOCKED" redefined
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         | 
   include/linux/spinlock_types_up.h:21: note: this is the location of the previous definition
      21 | #define __ARCH_SPIN_LOCK_UNLOCKED { 1 }
         | 
   In file included from arch/x86/include/asm/qspinlock.h:107:
   include/asm-generic/qspinlock.h:143: warning: "arch_spin_is_locked" redefined
     143 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
         | 
   In file included from include/linux/spinlock.h:97:
   include/linux/spinlock_up.h:27: note: this is the location of the previous definition
      27 | #define arch_spin_is_locked(x)          ((x)->slock == 0)
         | 
   include/asm-generic/qspinlock.h:144: warning: "arch_spin_is_contended" redefined
     144 | #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
         | 
   include/linux/spinlock_up.h:69: note: this is the location of the previous definition
      69 | #define arch_spin_is_contended(lock)    (((void)(lock), 0))
         | 
   In file included from arch/x86/include/asm/qrwlock.h:5,
                    from arch/x86/include/asm/spinlock.h:43:
>> include/asm-generic/qrwlock_types.h:27:3: error: conflicting types for 'arch_rwlock_t'; have 'struct qrwlock'
      27 | } arch_rwlock_t;
         |   ^~~~~~~~~~~~~
   include/linux/spinlock_types_up.h:33:3: note: previous declaration of 'arch_rwlock_t' with type 'arch_rwlock_t'
      33 | } arch_rwlock_t;
         |   ^~~~~~~~~~~~~
   include/asm-generic/qrwlock_types.h:29: warning: "__ARCH_RW_LOCK_UNLOCKED" redefined
      29 | #define __ARCH_RW_LOCK_UNLOCKED {               \
         | 
   include/linux/spinlock_types_up.h:35: note: this is the location of the previous definition
      35 | #define __ARCH_RW_LOCK_UNLOCKED { }
         | 
   In file included from arch/x86/include/asm/qrwlock.h:6:
   include/asm-generic/qrwlock.h:139: warning: "arch_read_lock" redefined
     139 | #define arch_read_lock(l)               queued_read_lock(l)
         | 
   include/linux/spinlock_up.h:54: note: this is the location of the previous definition
      54 | #define arch_read_lock(lock)            do { barrier(); (void)(lock); } while (0)
         | 
   include/asm-generic/qrwlock.h:140: warning: "arch_write_lock" redefined
     140 | #define arch_write_lock(l)              queued_write_lock(l)
         | 
   include/linux/spinlock_up.h:55: note: this is the location of the previous definition
      55 | #define arch_write_lock(lock)           do { barrier(); (void)(lock); } while (0)
         | 
   include/asm-generic/qrwlock.h:141: warning: "arch_read_trylock" redefined
     141 | #define arch_read_trylock(l)            queued_read_trylock(l)
         | 
   include/linux/spinlock_up.h:56: note: this is the location of the previous definition
      56 | #define arch_read_trylock(lock) ({ barrier(); (void)(lock); 1; })
         | 
   include/asm-generic/qrwlock.h:142: warning: "arch_write_trylock" redefined
     142 | #define arch_write_trylock(l)           queued_write_trylock(l)
         | 
   include/linux/spinlock_up.h:57: note: this is the location of the previous definition
      57 | #define arch_write_trylock(lock)        ({ barrier(); (void)(lock); 1; })
         | 
   include/asm-generic/qrwlock.h:143: warning: "arch_read_unlock" redefined
     143 | #define arch_read_unlock(l)             queued_read_unlock(l)
         | 
   include/linux/spinlock_up.h:58: note: this is the location of the previous definition
      58 | #define arch_read_unlock(lock)          do { barrier(); (void)(lock); } while (0)
         | 
   include/asm-generic/qrwlock.h:144: warning: "arch_write_unlock" redefined
     144 | #define arch_write_unlock(l)            queued_write_unlock(l)
         | 
   include/linux/spinlock_up.h:59: note: this is the location of the previous definition
      59 | #define arch_write_unlock(lock) do { barrier(); (void)(lock); } while (0)
         | 
   In file included from include/linux/fs.h:25,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/semaphore.h: In function 'sema_init':
   include/linux/semaphore.h:40:24: warning: braces around scalar initializer
      40 |         *sem = (struct semaphore) __SEMAPHORE_INITIALIZER(*sem, val);
         |                        ^~~~~~~~~
   include/linux/semaphore.h:40:24: note: (near initialization for '(anonymous).raw_lock.slock')
   include/asm-generic/qspinlock_types.h:49:45: error: field name not in record or union initializer
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |                                             ^
   include/linux/spinlock_types_raw.h:64:21: note: in expansion of macro '__ARCH_SPIN_LOCK_UNLOCKED'
      64 |         .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types_raw.h:69:26: note: in expansion of macro '__RAW_SPIN_LOCK_INITIALIZER'
      69 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/semaphore.h:23:27: note: in expansion of macro '__RAW_SPIN_LOCK_UNLOCKED'
      23 |         .lock           = __RAW_SPIN_LOCK_UNLOCKED((name).lock),        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/semaphore.h:40:35: note: in expansion of macro '__SEMAPHORE_INITIALIZER'
      40 |         *sem = (struct semaphore) __SEMAPHORE_INITIALIZER(*sem, val);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/qspinlock_types.h:49:45: note: (near initialization for '(anonymous).raw_lock.slock')
      49 | #define __ARCH_SPIN_LOCK_UNLOCKED       { { .val = ATOMIC_INIT(0) } }
         |                                             ^
   include/linux/spinlock_types_raw.h:64:21: note: in expansion of macro '__ARCH_SPIN_LOCK_UNLOCKED'
      64 |         .raw_lock = __ARCH_SPIN_LOCK_UNLOCKED,  \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_types_raw.h:69:26: note: in expansion of macro '__RAW_SPIN_LOCK_INITIALIZER'
      69 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/semaphore.h:23:27: note: in expansion of macro '__RAW_SPIN_LOCK_UNLOCKED'
      23 |         .lock           = __RAW_SPIN_LOCK_UNLOCKED((name).lock),        \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/semaphore.h:40:35: note: in expansion of macro '__SEMAPHORE_INITIALIZER'
      40 |         *sem = (struct semaphore) __SEMAPHORE_INITIALIZER(*sem, val);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/semaphore.h:40:24: warning: braces around scalar initializer
      40 |         *sem = (struct semaphore) __SEMAPHORE_INITIALIZER(*sem, val);
         |                        ^~~~~~~~~
   include/linux/semaphore.h:40:24: note: (near initialization for '(anonymous).raw_lock.slock')
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=360127777
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2 shuffle=360127777
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=360127777
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=360127777


vim +44 include/asm-generic/qspinlock_types.h

a33fda35e3a7655 Waiman Long 2015-04-24  13  
a33fda35e3a7655 Waiman Long 2015-04-24  14  typedef struct qspinlock {
625e88be1f41b53 Will Deacon 2018-04-26  15  	union {
a33fda35e3a7655 Waiman Long 2015-04-24  16  		atomic_t val;
625e88be1f41b53 Will Deacon 2018-04-26  17  
625e88be1f41b53 Will Deacon 2018-04-26  18  		/*
625e88be1f41b53 Will Deacon 2018-04-26  19  		 * By using the whole 2nd least significant byte for the
625e88be1f41b53 Will Deacon 2018-04-26  20  		 * pending bit, we can allow better optimization of the lock
625e88be1f41b53 Will Deacon 2018-04-26  21  		 * acquisition for the pending bit holder.
625e88be1f41b53 Will Deacon 2018-04-26  22  		 */
625e88be1f41b53 Will Deacon 2018-04-26  23  #ifdef __LITTLE_ENDIAN
625e88be1f41b53 Will Deacon 2018-04-26  24  		struct {
625e88be1f41b53 Will Deacon 2018-04-26  25  			u8	locked;
625e88be1f41b53 Will Deacon 2018-04-26  26  			u8	pending;
625e88be1f41b53 Will Deacon 2018-04-26  27  		};
625e88be1f41b53 Will Deacon 2018-04-26  28  		struct {
625e88be1f41b53 Will Deacon 2018-04-26  29  			u16	locked_pending;
625e88be1f41b53 Will Deacon 2018-04-26  30  			u16	tail;
625e88be1f41b53 Will Deacon 2018-04-26  31  		};
625e88be1f41b53 Will Deacon 2018-04-26  32  #else
625e88be1f41b53 Will Deacon 2018-04-26  33  		struct {
625e88be1f41b53 Will Deacon 2018-04-26  34  			u16	tail;
625e88be1f41b53 Will Deacon 2018-04-26  35  			u16	locked_pending;
625e88be1f41b53 Will Deacon 2018-04-26  36  		};
625e88be1f41b53 Will Deacon 2018-04-26  37  		struct {
625e88be1f41b53 Will Deacon 2018-04-26  38  			u8	reserved[2];
625e88be1f41b53 Will Deacon 2018-04-26  39  			u8	pending;
625e88be1f41b53 Will Deacon 2018-04-26  40  			u8	locked;
625e88be1f41b53 Will Deacon 2018-04-26  41  		};
625e88be1f41b53 Will Deacon 2018-04-26  42  #endif
625e88be1f41b53 Will Deacon 2018-04-26  43  	};
a33fda35e3a7655 Waiman Long 2015-04-24 @44  } arch_spinlock_t;
a33fda35e3a7655 Waiman Long 2015-04-24  45  

:::::: The code at line 44 was first introduced by commit
:::::: a33fda35e3a7655fb7df756ed67822afb5ed5e8d locking/qspinlock: Introduce a simple generic 4-byte queued spinlock

:::::: TO: Waiman Long <Waiman.Long@hp.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
