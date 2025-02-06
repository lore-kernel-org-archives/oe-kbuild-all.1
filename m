Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50854146A6F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 04:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738815087; cv=none; b=n1qs0kgHFVFtsmFa+pnbB/omJMTX8NuiA8oG35AuSU89Jj/0DGTI+10OibzFfP7tEyCGgJ76jY5vIS8f83OQA/uTHa7RyvUyNmebqX1aSXEYZCA03N5xgszH1nBHYUSMpdqLp4FzuURkOuTI96B8T+eS40A2mFr+VxK0ROXRRP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738815087; c=relaxed/simple;
	bh=kulShW134M8tJc5tD9EB28s9PGrHatWexRppieTp8VY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GYJEXxaPqlPMAkpDy+GCrCYRWmavrf7xvbOdzDtxwYMydZt+BDIfEoFv7GGQUZJ4uU5qI+QrSDzu3CJxWFhP/JHROJzBu9JyNi2GIJQiigT5bB9d2VXOCjJHUTDRhVOk4LXEGWfUIA5ffwPzMNnVtkVqjwSxHAyjZEnG1W5cFXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggj9nzXi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggj9nzXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738815085; x=1770351085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kulShW134M8tJc5tD9EB28s9PGrHatWexRppieTp8VY=;
  b=ggj9nzXi4vNCGm17FTiNZ2h67ex851rYXBi1RscUPByzbSKn8bqTtIzD
   L+PA0/miK0/ZkWo8Scd2aVUaTfBIkNc9yeVy+3BRGq2DtjbezJ5LL/F3r
   Cxf9rZYMPIip7HvoP2hyPZ1GWUXbwsHQIWLwgwinj7wO/RPNuqoC78ZSL
   IglB61slp9YjDc3bVuAqtnIY8qBos4rbuThbGF+BaTQX9/yqKh4COsaaq
   ASg5Iup/zD4pOr/Hp/fQBPHWJ1PsJ1pL9Mq+US1WK2DfzWoyiJtx5YZb5
   2PTHZDuENpCrD1remYKId9br4409fOW8Z4JDuhFboPyMbALhYtRyJr0oq
   w==;
X-CSE-ConnectionGUID: j0OShEY3STKJXi5vFJZqYg==
X-CSE-MsgGUID: OHvXvBwqScSAIazoTC4BxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39281289"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="39281289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 20:11:24 -0800
X-CSE-ConnectionGUID: QVJh80g8SBOgkl0pGM0fMw==
X-CSE-MsgGUID: lKo5Jdu5TVCnJ1VtKeNuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="111676319"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Feb 2025 20:11:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tftEV-000wQx-2o;
	Thu, 06 Feb 2025 04:11:19 +0000
Date: Thu, 6 Feb 2025 12:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 7/21] include/linux/spinlock_api_smp.h:113:2:
 warning: raw_spinlock 'lock' is not held on every path through here
Message-ID: <202502061248.C7deyXwk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   54cd719532c3784e74f9773c6be7005dec2c74bb
commit: 208bcaba5562fa1d9e9d417aca9f86680a320446 [7/21] locking/rwlock, spinlock: Support Clang's capability analysis
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250206/202502061248.C7deyXwk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061248.C7deyXwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061248.C7deyXwk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/test_capability-analysis.c:7:
   In file included from include/linux/spinlock.h:313:
>> include/linux/spinlock_api_smp.h:113:2: warning: raw_spinlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     113 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/spinlock_api_smp.h:113:44: note: raw_spinlock acquired here
     113 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |                                                   ^
>> include/linux/spinlock_api_smp.h:115:1: warning: expecting raw_spinlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     115 | }
         | ^
   include/linux/spinlock_api_smp.h:105:29: note: raw_spinlock acquired here
     105 | static inline unsigned long __raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                             ^
   include/linux/spinlock_api_smp.h:123:2: warning: raw_spinlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     123 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/spinlock_api_smp.h:123:44: note: raw_spinlock acquired here
     123 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |                                                   ^
   include/linux/spinlock_api_smp.h:124:1: warning: expecting raw_spinlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     124 | }
         | ^
   include/linux/spinlock_api_smp.h:117:20: note: raw_spinlock acquired here
     117 | static inline void __raw_spin_lock_irq(raw_spinlock_t *lock)
         |                    ^
   include/linux/spinlock_api_smp.h:131:2: warning: raw_spinlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     131 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/spinlock_api_smp.h:131:44: note: raw_spinlock acquired here
     131 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |                                                   ^
   include/linux/spinlock_api_smp.h:132:1: warning: expecting raw_spinlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     132 | }
         | ^
   include/linux/spinlock_api_smp.h:126:20: note: raw_spinlock acquired here
     126 | static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
         |                    ^
   include/linux/spinlock_api_smp.h:139:2: warning: raw_spinlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     139 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/spinlock_api_smp.h:139:44: note: raw_spinlock acquired here
     139 |         LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
         |                                                   ^
   include/linux/spinlock_api_smp.h:140:1: warning: expecting raw_spinlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     140 | }
         | ^
   include/linux/spinlock_api_smp.h:134:20: note: raw_spinlock acquired here
     134 | static inline void __raw_spin_lock(raw_spinlock_t *lock)
         |                    ^
   In file included from lib/test_capability-analysis.c:7:
   In file included from include/linux/spinlock.h:313:
   In file included from include/linux/spinlock_api_smp.h:193:
>> include/linux/rwlock_api_smp.h:152:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     152 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/rwlock_api_smp.h:152:44: note: rwlock acquired here
     152 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |                                                   ^
>> include/linux/rwlock_api_smp.h:153:1: warning: expecting rwlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     153 | }
         | ^
   include/linux/rwlock_api_smp.h:147:20: note: rwlock acquired here
     147 | static inline void __raw_read_lock(rwlock_t *lock)
         |                    ^
   include/linux/rwlock_api_smp.h:163:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     163 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/rwlock_api_smp.h:163:44: note: rwlock acquired here
     163 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |                                                   ^
   include/linux/rwlock_api_smp.h:165:1: warning: expecting rwlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     165 | }
         | ^
   include/linux/rwlock_api_smp.h:155:29: note: rwlock acquired here
     155 | static inline unsigned long __raw_read_lock_irqsave(rwlock_t *lock)
         |                             ^
   include/linux/rwlock_api_smp.h:173:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     173 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/rwlock_api_smp.h:173:44: note: rwlock acquired here
     173 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |                                                   ^
   include/linux/rwlock_api_smp.h:174:1: warning: expecting rwlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     174 | }
         | ^
   include/linux/rwlock_api_smp.h:167:20: note: rwlock acquired here
     167 | static inline void __raw_read_lock_irq(rwlock_t *lock)
         |                    ^
   include/linux/rwlock_api_smp.h:181:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     181 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/rwlock_api_smp.h:181:44: note: rwlock acquired here
     181 |         LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
         |                                                   ^
   include/linux/rwlock_api_smp.h:182:1: warning: expecting rwlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     182 | }
         | ^
   include/linux/rwlock_api_smp.h:176:20: note: rwlock acquired here
     176 | static inline void __raw_read_lock_bh(rwlock_t *lock)
         |                    ^
   include/linux/rwlock_api_smp.h:192:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     192 |         LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/rwlock_api_smp.h:192:45: note: rwlock acquired here
     192 |         LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
         |                                                    ^
   include/linux/rwlock_api_smp.h:194:1: warning: expecting rwlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     194 | }
         | ^
   include/linux/rwlock_api_smp.h:184:29: note: rwlock acquired here
     184 | static inline unsigned long __raw_write_lock_irqsave(rwlock_t *lock)
         |                             ^
   include/linux/rwlock_api_smp.h:202:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     202 |         LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/rwlock_api_smp.h:202:45: note: rwlock acquired here
     202 |         LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
         |                                                    ^
   include/linux/rwlock_api_smp.h:203:1: warning: expecting rwlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     203 | }
         | ^
   include/linux/rwlock_api_smp.h:196:20: note: rwlock acquired here
     196 | static inline void __raw_write_lock_irq(rwlock_t *lock)
         |                    ^
   include/linux/rwlock_api_smp.h:210:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     210 |         LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \
         |         ^
   include/linux/rwlock_api_smp.h:210:45: note: rwlock acquired here
     210 |         LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
         |                                                    ^
   include/linux/rwlock_api_smp.h:211:1: warning: expecting rwlock 'lock' to be held at the end of function [-Wthread-safety-analysis]
     211 | }
         | ^
   include/linux/rwlock_api_smp.h:205:20: note: rwlock acquired here
     205 | static inline void __raw_write_lock_bh(rwlock_t *lock)
         |                    ^
   include/linux/rwlock_api_smp.h:218:2: warning: rwlock 'lock' is not held on every path through here [-Wthread-safety-analysis]
     218 |         LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
         |         ^
   include/linux/lockdep.h:447:2: note: expanded from macro 'LOCK_CONTENDED'
     447 |         lock_acquired(&(_lock)->dep_map, _RET_IP_);                     \


vim +/lock +113 include/linux/spinlock_api_smp.h

69d0ee7377eef8 Heiko Carstens  2009-08-31  104  
9c1721aa4994f6 Thomas Gleixner 2009-12-03  105  static inline unsigned long __raw_spin_lock_irqsave(raw_spinlock_t *lock)
208bcaba5562fa Marco Elver     2025-01-23  106  	__acquires(lock)
69d0ee7377eef8 Heiko Carstens  2009-08-31  107  {
69d0ee7377eef8 Heiko Carstens  2009-08-31  108  	unsigned long flags;
69d0ee7377eef8 Heiko Carstens  2009-08-31  109  
69d0ee7377eef8 Heiko Carstens  2009-08-31  110  	local_irq_save(flags);
69d0ee7377eef8 Heiko Carstens  2009-08-31  111  	preempt_disable();
69d0ee7377eef8 Heiko Carstens  2009-08-31  112  	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
9828ea9d75c38f Thomas Gleixner 2009-12-03 @113  	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
69d0ee7377eef8 Heiko Carstens  2009-08-31  114  	return flags;
69d0ee7377eef8 Heiko Carstens  2009-08-31 @115  }
69d0ee7377eef8 Heiko Carstens  2009-08-31  116  

:::::: The code at line 113 was first introduced by commit
:::::: 9828ea9d75c38fe3dce05d00566eed61c85732e6 locking: Further name space cleanups

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
