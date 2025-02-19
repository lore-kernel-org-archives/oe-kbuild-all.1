Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3617CA12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 22:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740004252; cv=none; b=kZ95PIqG2MCtjy6SIVNw9lg7rb/BVkCgwLzjTM2YQIjA9WC/DnBWVmb4QbQ8l+Lic4ZK3YYemWi8IzAtISCfyNLcZm/rAx+aM/j3J2T7EAsOqCp5fRD7g2FcCYVvehYIyP1WyeWmF01coBQ/antgRmL65HLFKjCLG1VqQs9eEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740004252; c=relaxed/simple;
	bh=+PW51ABh6KAQI4EUXcACDHhDJ14739F68C4cquA6Q1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsR3B0r3A0pWWb0pjAJWFEJIXPqnCQ+iUMQwnAw11m1DeyZ5hHbin+wzCufhpmYbUrm00swiccj5yjgYaLhKQ0N8Vmf602Rw56wRyS1oIwpu07tRnqcVfj+v0tWu+RFEtOWgPLcxt9gwj7P0brBF7K6Db2oHQ4iZ41SntqrJit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVGpx6t8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVGpx6t8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740004250; x=1771540250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+PW51ABh6KAQI4EUXcACDHhDJ14739F68C4cquA6Q1s=;
  b=OVGpx6t8GPLgKNmBPHuZQkSwo/rwgtpf28jXGOQj+ujk5g1b7QBWB+aW
   bRavOD9RbB9zh5iTj7lm7LaP2emV/bP0ER0Q7I5cjSiVaQw0E85BdJOdX
   4jR6174VJ+PrcNjgqlGjsDBwX4OqVmnWr178LVd6t+temGGqlF9gwtx1C
   DxhhcdsUKa6jXk4MJuuDYTxrKqyz0P4bFWBg+PbK3nmNn3onEPXKN/5eX
   Unx1jyZ1D5icDhbgmaMCBpUCsVp/v7yAVFldtzgktB9d4oCEo1BjMCxEK
   /k1jWJ19sSvfwL5UxT5oerkE5DonbcKDEcqdZp/mHZG3sil0wl75RC3fb
   g==;
X-CSE-ConnectionGUID: Cgastxy8ROKcjZ93S9cnjQ==
X-CSE-MsgGUID: 6Jbn7r0rSZuASwEE8gDz+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44410414"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44410414"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 14:30:50 -0800
X-CSE-ConnectionGUID: Cs7PvCtBTK+ss0cNoxWvsw==
X-CSE-MsgGUID: IEMQO7DEQPWbCAEtJiqaAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120065455"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Feb 2025 14:29:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tksZF-0003Z1-2g;
	Wed, 19 Feb 2025 22:29:21 +0000
Date: Thu, 20 Feb 2025 06:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 32/33]
 include/acpi/platform/aclinuxex.h:106:1: warning: raw_spinlock 'lockp' is
 still held at the end of function
Message-ID: <202502200607.thzMGdcW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   e064f46a74e53c4986a0acc07a4c60dbea0b0aa5
commit: d40fe03e8f6b4bca895c8a9695e3e858d4be19d1 [32/33] crypto: Enable capability analysis
config: hexagon-randconfig-002-20250220 (https://download.01.org/0day-ci/archive/20250220/202502200607.thzMGdcW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200607.thzMGdcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200607.thzMGdcW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/crypto/if_alg.h:17:
   In file included from include/net/sock.h:46:
   include/linux/netdevice.h:4611:1: warning: spinlock 'txq->_xmit_lock' is still held at the end of function [-Wthread-safety-analysis]
    4611 | }
         | ^
   include/linux/netdevice.h:4608:2: note: spinlock acquired here
    4608 |         spin_lock_bh(&txq->_xmit_lock);
         |         ^
   include/linux/netdevice.h:4621:9: warning: spinlock 'txq->_xmit_lock' is not held on every path through here [-Wthread-safety-analysis]
    4621 |         return ok;
         |                ^
   include/linux/netdevice.h:4615:12: note: spinlock acquired here
    4615 |         bool ok = spin_trylock(&txq->_xmit_lock);
         |                   ^
   include/linux/netdevice.h:4628:2: warning: releasing spinlock 'txq->_xmit_lock' that was not held [-Wthread-safety-analysis]
    4628 |         spin_unlock(&txq->_xmit_lock);
         |         ^
   include/linux/netdevice.h:4635:2: warning: releasing spinlock 'txq->_xmit_lock' that was not held [-Wthread-safety-analysis]
    4635 |         spin_unlock_bh(&txq->_xmit_lock);
         |         ^
   include/linux/netdevice.h:4733:1: warning: raw_spinlock 'spinlock_check(dev->addr_list_lock)' is still held at the end of function [-Wthread-safety-analysis]
    4733 | }
         | ^
   include/linux/netdevice.h:4732:2: note: raw_spinlock acquired here
    4732 |         spin_lock_nested(&dev->addr_list_lock, nest_level);
         |         ^
   include/linux/spinlock.h:361:2: note: expanded from macro 'spin_lock_nested'
     361 |         raw_spin_lock_nested(spinlock_check(lock), subclass);   \
         |         ^
   include/linux/spinlock.h:236:2: note: expanded from macro 'raw_spin_lock_nested'
     236 |         _raw_spin_lock(((void)(subclass), (lock)))
         |         ^
   include/linux/spinlock_api_up.h:64:32: note: expanded from macro '_raw_spin_lock'
      64 | #define _raw_spin_lock(lock)                    __LOCK(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:34:27: note: expanded from macro '__LOCK'
      34 |   do { preempt_disable(); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                           ^
   include/linux/spinlock_api_up.h:28:8: note: expanded from macro '___LOCK_'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-capability-analysis.h:283:23: note: expanded from macro '__acquire'
     283 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   In file included from crypto/af_alg.c:11:
   In file included from include/crypto/if_alg.h:17:
   In file included from include/net/sock.h:46:
   include/linux/netdevice.h:4744:1: warning: raw_spinlock 'spinlock_check(dev->addr_list_lock)' is still held at the end of function [-Wthread-safety-analysis]
    4744 | }
         | ^
   include/linux/netdevice.h:4743:2: note: raw_spinlock acquired here
    4743 |         spin_lock_nested(&dev->addr_list_lock, nest_level);
         |         ^
   include/linux/spinlock.h:361:2: note: expanded from macro 'spin_lock_nested'
     361 |         raw_spin_lock_nested(spinlock_check(lock), subclass);   \
         |         ^
   include/linux/spinlock.h:236:2: note: expanded from macro 'raw_spin_lock_nested'
     236 |         _raw_spin_lock(((void)(subclass), (lock)))
         |         ^
   include/linux/spinlock_api_up.h:64:32: note: expanded from macro '_raw_spin_lock'
      64 | #define _raw_spin_lock(lock)                    __LOCK(lock)
         |                                                 ^
   include/linux/spinlock_api_up.h:34:27: note: expanded from macro '__LOCK'
      34 |   do { preempt_disable(); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                           ^
   include/linux/spinlock_api_up.h:28:8: note: expanded from macro '___LOCK_'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-capability-analysis.h:283:23: note: expanded from macro '__acquire'
     283 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   In file included from crypto/af_alg.c:11:
   In file included from include/crypto/if_alg.h:17:
   In file included from include/net/sock.h:46:
   include/linux/netdevice.h:4748:2: warning: releasing spinlock 'dev->addr_list_lock' that was not held [-Wthread-safety-analysis]
    4748 |         spin_unlock(&dev->addr_list_lock);
         |         ^
   include/linux/netdevice.h:4753:2: warning: releasing spinlock 'dev->addr_list_lock' that was not held [-Wthread-safety-analysis]
    4753 |         spin_unlock_bh(&dev->addr_list_lock);
         |         ^
   In file included from crypto/af_alg.c:11:
   In file included from include/crypto/if_alg.h:17:
   include/net/sock.h:1659:1: warning: spinlock 'sk->sk_lock.slock' is still held at the end of function [-Wthread-safety-analysis]
    1659 | }
         | ^
   include/net/sock.h:1658:9: note: spinlock acquired here
    1658 |         return __lock_sock_fast(sk);
         |                ^
   include/net/sock.h:1667:1: warning: spinlock 'sk->sk_lock.slock' is still held at the end of function [-Wthread-safety-analysis]
    1667 | }
         | ^
   include/net/sock.h:1666:9: note: spinlock acquired here
    1666 |         return __lock_sock_fast(sk);
         |                ^
   In file included from crypto/af_alg.c:26:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:21:
   In file included from include/linux/acpi.h:26:
   In file included from include/acpi/acpi.h:28:
   In file included from include/acpi/platform/acenvex.h:23:
>> include/acpi/platform/aclinuxex.h:106:1: warning: raw_spinlock 'lockp' is still held at the end of function [-Wthread-safety-analysis]
     106 | }
         | ^
   include/acpi/platform/aclinuxex.h:104:2: note: raw_spinlock acquired here
     104 |         raw_spin_lock_irqsave(lockp, flags);
         |         ^
   include/linux/spinlock.h:267:3: note: expanded from macro 'raw_spin_lock_irqsave'
     267 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                 ^
   include/linux/spinlock_api_up.h:75:45: note: expanded from macro '_raw_spin_lock_irqsave'
      75 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                 ^
   include/linux/spinlock_api_up.h:43:31: note: expanded from macro '__LOCK_IRQSAVE'
      43 |   do { local_irq_save(flags); __LOCK(lock, ##__VA_ARGS__); } while (0)
         |                               ^
   include/linux/spinlock_api_up.h:34:27: note: expanded from macro '__LOCK'
      34 |   do { preempt_disable(); ___LOCK_##__VA_ARGS__(lock); } while (0)
         |                           ^
   include/linux/spinlock_api_up.h:28:8: note: expanded from macro '___LOCK_'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-capability-analysis.h:283:23: note: expanded from macro '__acquire'
     283 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   In file included from crypto/af_alg.c:26:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:21:
   In file included from include/linux/acpi.h:26:
   In file included from include/acpi/acpi.h:28:
   In file included from include/acpi/platform/acenvex.h:23:
>> include/acpi/platform/aclinuxex.h:111:2: warning: releasing raw_spinlock 'lockp' that was not held [-Wthread-safety-analysis]
     111 |         raw_spin_unlock_irqrestore(lockp, flags);
         |         ^
   include/linux/spinlock.h:283:3: note: expanded from macro 'raw_spin_unlock_irqrestore'
     283 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                 ^
   include/linux/spinlock_api_up.h:138:6: note: expanded from macro '_raw_spin_unlock_irqrestore'
     138 |                                         __UNLOCK_IRQRESTORE(lock, flags)
         |                                         ^
   include/linux/spinlock_api_up.h:62:34: note: expanded from macro '__UNLOCK_IRQRESTORE'
      62 |   do { local_irq_restore(flags); __UNLOCK(lock, ##__VA_ARGS__); } while (0)
         |                                  ^
   include/linux/spinlock_api_up.h:52:26: note: expanded from macro '__UNLOCK'
      52 |   do { preempt_enable(); ___UNLOCK_##__VA_ARGS__(lock); } while (0)
         |                          ^
   include/linux/spinlock_api_up.h:46:8: note: expanded from macro '___UNLOCK_'
      46 |   do { __release(lock); (void)(lock); } while (0)
         |        ^
   include/linux/compiler-capability-analysis.h:291:23: note: expanded from macro '__release'
     291 | #define __release(x)            __release_cap(x)
         |                                 ^
   61 warnings generated.


vim +/lockp +106 include/acpi/platform/aclinuxex.h

d13bd5a602982c Lv Zheng                  2014-05-12   71  
d13bd5a602982c Lv Zheng                  2014-05-12   72  /*
d13bd5a602982c Lv Zheng                  2014-05-12   73   * When lockdep is enabled, the spin_lock_init() macro stringifies it's
d13bd5a602982c Lv Zheng                  2014-05-12   74   * argument and uses that as a name for the lock in debugging.
d13bd5a602982c Lv Zheng                  2014-05-12   75   * By executing spin_lock_init() in a macro the key changes from "lock" for
d13bd5a602982c Lv Zheng                  2014-05-12   76   * all locks to the name of the argument of acpi_os_create_lock(), which
d13bd5a602982c Lv Zheng                  2014-05-12   77   * prevents lockdep from reporting false positives for ACPICA locks.
d13bd5a602982c Lv Zheng                  2014-05-12   78   */
d13bd5a602982c Lv Zheng                  2014-05-12   79  #define acpi_os_create_lock(__handle) \
d13bd5a602982c Lv Zheng                  2014-05-12   80  	({ \
d13bd5a602982c Lv Zheng                  2014-05-12   81  		spinlock_t *lock = ACPI_ALLOCATE(sizeof(*lock)); \
d13bd5a602982c Lv Zheng                  2014-05-12   82  		if (lock) { \
d13bd5a602982c Lv Zheng                  2014-05-12   83  			*(__handle) = lock; \
d13bd5a602982c Lv Zheng                  2014-05-12   84  			spin_lock_init(*(__handle)); \
d13bd5a602982c Lv Zheng                  2014-05-12   85  		} \
d13bd5a602982c Lv Zheng                  2014-05-12   86  		lock ? AE_OK : AE_NO_MEMORY; \
d13bd5a602982c Lv Zheng                  2014-05-12   87  	})
d13bd5a602982c Lv Zheng                  2014-05-12   88  
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   89  
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   90  #define acpi_os_create_raw_lock(__handle) \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   91  	({ \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   92  		raw_spinlock_t *lock = ACPI_ALLOCATE(sizeof(*lock)); \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   93  		if (lock) { \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   94  			*(__handle) = lock; \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   95  			raw_spin_lock_init(*(__handle)); \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   96  		} \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   97  		lock ? AE_OK : AE_NO_MEMORY; \
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   98  	})
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25   99  
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  100  static inline acpi_cpu_flags acpi_os_acquire_raw_lock(acpi_raw_spinlock lockp)
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  101  {
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  102  	acpi_cpu_flags flags;
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  103  
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  104  	raw_spin_lock_irqsave(lockp, flags);
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  105  	return flags;
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25 @106  }
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  107  
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  108  static inline void acpi_os_release_raw_lock(acpi_raw_spinlock lockp,
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  109  					    acpi_cpu_flags flags)
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  110  {
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25 @111  	raw_spin_unlock_irqrestore(lockp, flags);
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  112  }
c3052594c8ded9 Sebastian Andrzej Siewior 2018-04-25  113  

:::::: The code at line 106 was first introduced by commit
:::::: c3052594c8ded984ceab3725f63990dfdea1e58f ACPICA: provide abstraction for raw_spinlock_t

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
