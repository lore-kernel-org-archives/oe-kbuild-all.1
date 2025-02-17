Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF2235359
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739816713; cv=none; b=jG/fCvGrDhvyCVUhAvxpC/qV0X4HuOFB1/QITHyubhlp6rQhdj/Qrgej8Vu/SDqDVrdBU7q+gaZeQnXQeTSXQmzAjqMohzqyhUfZyWmwI5Uj9wluT99boBdhPh+8q53s4Auqc/o9ywaFW7Id2zWYYdR8iuKYLbDdXj8PBQYVhNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739816713; c=relaxed/simple;
	bh=xZwEf4TDeJpy4oL6DRXsqwoq8oCcqP/RM2jfnU9dY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+TtiHTk6UcfXyNKd6VdHGT/jKlTngXFeBaP/uwnf6j69nPs3Cg5N1p+2z5YpMMAdJcgsJqvVfwybtseVfPbThgVrIWet6k8qL8vK0he6Uh+7BGM6toN8zsxnB558G/hXO1t9P+CI31cHmUCZUe1WaePk6I7sN6HxO1mMy1PM20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF1MN7/V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF1MN7/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739816712; x=1771352712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xZwEf4TDeJpy4oL6DRXsqwoq8oCcqP/RM2jfnU9dY2I=;
  b=CF1MN7/Vz+BIKiA46WlxKdxfrvqvqu0dL0F7Hh51orWXaaHPeHZBT3gx
   qHybscAPJ09RazqFmFtKZW889PyuXjc2sdbVdchDfBBH538Gjjals61L0
   26czvJYYBoQMTm/5+mK4j9vTtOOIb2HRrnIVKkl1bMdkPURMM6Kk4575D
   jqV4EWP8IbqB5pt9Tb1vB8bIDnYiyprHKok7b+/6M6H5B+oN2AtACiLip
   woAiQwd6uDwY+iZ4C8kyrnpv1e3Ot9QUNCuwxdLVzu609zji2y/+mfqah
   psT3hpvtWA5ruJDWxlxQ3vqYux9Y/y79qtgpZuIZvCz5f0C+Bqf9mwWxU
   g==;
X-CSE-ConnectionGUID: MLAVngVrTkOBPNROHT6MCg==
X-CSE-MsgGUID: lFrhspaWSwWRri6aMdJymA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="57908012"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="57908012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 10:25:12 -0800
X-CSE-ConnectionGUID: OvmH/daYRDqyE9D+UAvKwg==
X-CSE-MsgGUID: 4rtMdorrRI23XHcDyn368w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114055970"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Feb 2025 10:25:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk5nn-001DQd-2C;
	Mon, 17 Feb 2025 18:25:07 +0000
Date: Tue, 18 Feb 2025 02:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 16/26]
 include/asm-generic/rqspinlock.h:164: undefined reference to
 `rqspinlock_held_locks'
Message-ID: <202502180231.si28CWcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux res-lock-base
head:   f998e0817b8a89691123f4a4a6e1277c22523695
commit: 7f0cc0308b8d63b2da18c50836efb14fafd63c57 [16/26] rqspinlock: Add locktorture support
config: i386-buildonly-randconfig-005-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180231.si28CWcj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180231.si28CWcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180231.si28CWcj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/locking/locktorture.o: in function `res_spin_unlock':
>> include/asm-generic/rqspinlock.h:164: undefined reference to `rqspinlock_held_locks'
>> ld: include/asm-generic/rqspinlock.h:166: undefined reference to `rqspinlock_held_locks'
>> ld: include/asm-generic/rqspinlock.h:166: undefined reference to `rqspinlock_held_locks'
   ld: include/asm-generic/rqspinlock.h:168: undefined reference to `rqspinlock_held_locks'
>> ld: include/asm-generic/rqspinlock.h:164: undefined reference to `rqspinlock_held_locks'
   ld: kernel/locking/locktorture.o:include/asm-generic/rqspinlock.h:166: more undefined references to `rqspinlock_held_locks' follow
   ld: kernel/locking/locktorture.o: in function `res_spin_lock':
>> include/asm-generic/rqspinlock.h:151: undefined reference to `resilient_queued_spin_lock_slowpath'
   ld: kernel/locking/locktorture.o: in function `grab_held_lock_entry':
   include/asm-generic/rqspinlock.h:68: undefined reference to `rqspinlock_held_locks'
   ld: include/asm-generic/rqspinlock.h:81: undefined reference to `rqspinlock_held_locks'
   ld: kernel/locking/locktorture.o: in function `res_spin_lock':
>> include/asm-generic/rqspinlock.h:151: undefined reference to `resilient_queued_spin_lock_slowpath'


vim +164 include/asm-generic/rqspinlock.h

bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  138  
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  139  /**
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  140   * res_spin_lock - acquire a queued spinlock
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  141   * @lock: Pointer to queued spinlock structure
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  142   */
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  143  static __always_inline int res_spin_lock(rqspinlock_t *lock)
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  144  {
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  145  	int val = 0;
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  146  
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  147  	if (likely(atomic_try_cmpxchg_acquire(&lock->val, &val, _Q_LOCKED_VAL))) {
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  148  		grab_held_lock_entry(lock);
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  149  		return 0;
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  150  	}
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19 @151  	return resilient_queued_spin_lock_slowpath(lock, val, RES_DEF_TIMEOUT);
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  152  }
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  153  
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  154  #else
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  155  
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  156  #define res_spin_lock(lock) resilient_tas_spin_lock(lock, RES_DEF_TIMEOUT)
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  157  
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  158  #endif /* CONFIG_QUEUED_SPINLOCKS */
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  159  
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  160  static __always_inline void res_spin_unlock(rqspinlock_t *lock)
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  161  {
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  162  	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  163  
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19 @164  	if (unlikely(rqh->cnt > RES_NR_HELD))
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  165  		goto unlock;
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19 @166  	WRITE_ONCE(rqh->locks[rqh->cnt - 1], NULL);
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  167  unlock:
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  168  	this_cpu_dec(rqspinlock_held_locks.cnt);
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  169  	/*
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  170  	 * Release barrier, ensures correct ordering. See release_held_lock_entry
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  171  	 * for details.  Perform release store instead of queued_spin_unlock,
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  172  	 * since we use this function for test-and-set fallback as well. When we
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  173  	 * have CONFIG_QUEUED_SPINLOCKS=n, we clear the full 4-byte lockword.
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  174  	 */
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  175  	smp_store_release(&lock->locked, 0);
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  176  }
bf517b87ef8095 Kumar Kartikeya Dwivedi 2024-11-19  177  

:::::: The code at line 164 was first introduced by commit
:::::: bf517b87ef809536ea19882c2493ca986161e1a0 rqspinlock: Add macros for rqspinlock usage

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
