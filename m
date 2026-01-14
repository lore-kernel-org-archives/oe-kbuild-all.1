Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238591B532F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399492; cv=none; b=NceCEpifD8XdE2ohkJYvGs0oKp0KvN3fikG3BXdZmvO8jTl9+PM6vr7bFKi4+5EWW1pt7VJ0xJ/bzH9TAXCD6xvSKH+EfDZYeXAuHfoM2mRor+1KOZ9OgczZEXY40LBqdTrRDmnx3t96Qb+GUZjKftKehxjaOeETTu1wSx4Yrvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399492; c=relaxed/simple;
	bh=ioWP9pm40EupLJ2iOmhKLaPcyX95N278QNDl1BG4yYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DPmH5wbFrjMpuSc+Gm7ALN+utuLccqT6MZb8hy7t5w/bX5OmL0fnNVJJV5oC9wvB/4XdfnJkfxR7pL89lp6CdhktD2DsQQxcY+7tt1+3UgDZMLjtbaqmpyUHQ77uSFpe1U+w1ljR6bhMz7GpOXj6kta+CT9suZVKWr/59EozL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmTcxlmx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmTcxlmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768399490; x=1799935490;
  h=date:from:to:cc:subject:message-id;
  bh=ioWP9pm40EupLJ2iOmhKLaPcyX95N278QNDl1BG4yYk=;
  b=VmTcxlmxOKO4tLFUaQHtgQh8n5TZmqR2RTCKP4gS6wjG8hixQQm/1xNn
   DcgV4R7rRkdFgAkESmrEHVz7osADWZysBGyniGUrOtaD3uu+y58iU5Ta0
   uXLzdkIYZpb2+eRMOgwWQPtElk1hIMd0laUH19lga+msGo3buXT1t++Im
   15SpciP9CTv6F68pyM7hCD9PCQi+FlEhSxaA2Q4GSo0+y19BOziuzfE3D
   FwfWmDmqpvXOg6OpX2B7pvfG+0WyNTlrC2+AeHvbD3781YAkROSS757FT
   lfQN0CJAvH/09rsThEAaKzf+9VEjDCJkwFnmL0lID4Hz2j9NwUJyyLCdC
   A==;
X-CSE-ConnectionGUID: rt1sJJ+lTrm5gynREUhoqQ==
X-CSE-MsgGUID: fHpch5l/S528kXec/TSu8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57253232"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="57253232"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 06:04:50 -0800
X-CSE-ConnectionGUID: PZgasixNTQGoL/CIWfXtMw==
X-CSE-MsgGUID: 09QoJsokRuei2ZrMathcdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204709195"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 06:04:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg1UL-00000000GT0-3R62;
	Wed, 14 Jan 2026 14:04:45 +0000
Date: Wed, 14 Jan 2026 22:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.6 12/15] include/linux/rcupdate.h:900:
 undefined reference to `bpf_handle_oom'
Message-ID: <202601142254.EbwYC0a1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.6
head:   0096e4611728d881621b8fa5bf9f6cd849c88d14
commit: f4b762602f70647180b0e465498e66d4dc0a6654 [12/15] mm: introduce bpf_out_of_memory() BPF kfunc
config: csky-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142254.EbwYC0a1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142254.EbwYC0a1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142254.EbwYC0a1-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: mm/oom_kill.o: in function `out_of_memory.part.0':
   mm/oom_kill.c:1187: undefined reference to `bpf_handle_oom'
   csky-linux-ld: mm/oom_kill.o: in function `out_of_memory.part.0':
>> include/linux/rcupdate.h:900: undefined reference to `bpf_handle_oom'


vim +900 include/linux/rcupdate.h

^1da177e4c3f41 Linus Torvalds          2005-04-16  871  
^1da177e4c3f41 Linus Torvalds          2005-04-16  872  /*
^1da177e4c3f41 Linus Torvalds          2005-04-16  873   * So where is rcu_write_lock()?  It does not exist, as there is no
^1da177e4c3f41 Linus Torvalds          2005-04-16  874   * way for writers to lock out RCU readers.  This is a feature, not
^1da177e4c3f41 Linus Torvalds          2005-04-16  875   * a bug -- this property is what provides RCU's performance benefits.
^1da177e4c3f41 Linus Torvalds          2005-04-16  876   * Of course, writers must coordinate with each other.  The normal
^1da177e4c3f41 Linus Torvalds          2005-04-16  877   * spinlock primitives work well for this, but any other technique may be
^1da177e4c3f41 Linus Torvalds          2005-04-16  878   * used as well.  RCU does not care how the writers keep out of each
^1da177e4c3f41 Linus Torvalds          2005-04-16  879   * others' way, as long as they do so.
^1da177e4c3f41 Linus Torvalds          2005-04-16  880   */
3d76c082907e8f Paul E. McKenney        2009-09-28  881  
3d76c082907e8f Paul E. McKenney        2009-09-28  882  /**
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  883   * rcu_read_unlock() - marks the end of an RCU read-side critical section.
3d76c082907e8f Paul E. McKenney        2009-09-28  884   *
0223846010750e Paul E. McKenney        2021-04-29  885   * In almost all situations, rcu_read_unlock() is immune from deadlock.
73298c7cf1b901 Paul E. McKenney        2025-01-09  886   * This deadlock immunity also extends to the scheduler's runqueue
73298c7cf1b901 Paul E. McKenney        2025-01-09  887   * and priority-inheritance spinlocks, courtesy of the quiescent-state
73298c7cf1b901 Paul E. McKenney        2025-01-09  888   * deferral that is carried out when rcu_read_unlock() is invoked with
73298c7cf1b901 Paul E. McKenney        2025-01-09  889   * interrupts disabled.
f27bc4873fa8b7 Paul E. McKenney        2014-05-04  890   *
3d76c082907e8f Paul E. McKenney        2009-09-28  891   * See rcu_read_lock() for more information.
3d76c082907e8f Paul E. McKenney        2009-09-28  892   */
bc33f24bdca8b6 Paul E. McKenney        2009-08-22  893  static inline void rcu_read_unlock(void)
bc33f24bdca8b6 Paul E. McKenney        2009-08-22  894  {
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  895  	RCU_LOCKDEP_WARN(!rcu_is_watching(),
bde23c6892878e Heiko Carstens          2012-02-01  896  			 "rcu_read_unlock() used illegally while idle");
058e87782c9169 Uladzislau Rezki (Sony  2024-02-14  897) 	rcu_lock_release(&rcu_lock_map); /* Keep acq info for rls diags. */
bc33f24bdca8b6 Paul E. McKenney        2009-08-22  898  	__release(RCU);
bc33f24bdca8b6 Paul E. McKenney        2009-08-22  899  	__rcu_read_unlock();
bc33f24bdca8b6 Paul E. McKenney        2009-08-22 @900  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  901  

:::::: The code at line 900 was first introduced by commit
:::::: bc33f24bdca8b6e97376e3a182ab69e6cdefa989 rcu: Consolidate sparse and lockdep declarations in include/linux/rcupdate.h

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
