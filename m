Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238D129B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633196; cv=none; b=YBybuQbxYXC6R9gD7YD7f9o40NDgFVFM0KrCf5CZqQmsiCCVrcmOR10Vfl14GpKX5+iWKZ5A4noH0yfzqLl8Y+8DyRWnn6LSLl+ExXTXwmaX+GjPhfx4C4xKomZvH0ofCovTdkBwOtxxSTQVi1G8HAuqKmkJW36vVY31UHbxHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633196; c=relaxed/simple;
	bh=dy4gfjqlEWNHWDjK4xcwy4FWORMoPCWJqoeqsdNU6Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQFdH2bZcY6/Wgf7K4PW2IkBBQf/FUV/euXZJtlZSKRiPUV54q0D5g2McfrUXWpRzKbHduD4Il2ThVsK0n78XUPAwwiAnP+vWaV4o/cxqlTrq5JusBawMGDeOwIy1vS+BFHmphHqkBK6joGw2c12zO0vJ4/MopwPIe9lZj2Cetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAjwShhx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAjwShhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737633194; x=1769169194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dy4gfjqlEWNHWDjK4xcwy4FWORMoPCWJqoeqsdNU6Ek=;
  b=AAjwShhxI/aGFMyeOgBymeBBmvSswR1TmDVPKfIOM7oLTnAqgVnt4jJY
   vUhdXkn0QncMNBiLhnnmJnyo5MCICP14f5i2MzTtRti038ar3dL5q+1Bn
   X29vjuKdSUKyXtjnvd64QxstCe5lgCKo2ZgVbIzSf3ZoDJ4ioZqGZY1aI
   Mj/IPsVj8EZhrglQp/SSjzGqazpOSt8lBMHSzQ7TCoSjbWBY6fQMB44Qv
   Sg8YmLeIMQrAnfN0RmmN8nuhQcgo+9wYci/omrUfqiH7lPQsQhfsCYJjm
   CH3i7aGh9HqBv6vq23L2qQ4ueujw6PS+GIjUCqDl5cG+jrYdOANXvsmRa
   Q==;
X-CSE-ConnectionGUID: fxpkfU0wQJqElPj6xoWGFg==
X-CSE-MsgGUID: Nmf/JMwLS6abLcQjhIZTZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="40951469"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="40951469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 03:53:13 -0800
X-CSE-ConnectionGUID: 3dITIqVaSa2IaBiW7OO4Sw==
X-CSE-MsgGUID: vORmu06ETBKlXG9x3Xz00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107247798"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 03:53:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tavlm-000b8R-2U;
	Thu, 23 Jan 2025 11:53:10 +0000
Date: Thu, 23 Jan 2025 19:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-tiny-kfree_rcu 6/7] kernel/rcu/tiny.c:88:23: warning:
 unused variable 'offset'
Message-ID: <202501231947.snu5IX3I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-tiny-kfree_rcu
head:   d8cf97ccfbdeb8f997ea14888a148a02384b3188
commit: b6e7bf34c8347b4d704e3758c8a8881516a1c76f [6/7] rcu, slab: use a regular callback function for kvfree_rcu
config: arc-randconfig-001-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231947.snu5IX3I-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231947.snu5IX3I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231947.snu5IX3I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/rcu/tiny.c: In function 'rcu_reclaim_tiny':
>> kernel/rcu/tiny.c:88:23: warning: unused variable 'offset' [-Wunused-variable]
      88 |         unsigned long offset = (unsigned long)head->func;
         |                       ^~~~~~


vim +/offset +88 kernel/rcu/tiny.c

9b1d82fa1611706 kernel/rcutiny.c  Paul E. McKenney        2009-10-25   80  
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   81) /*
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   82)  * Reclaim the specified callback, either by invoking it for non-kfree cases or
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   83)  * freeing it directly (for kfree). Return true if kfreeing, false otherwise.
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   84)  */
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   85) static inline bool rcu_reclaim_tiny(struct rcu_head *head)
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   86) {
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   87) 	rcu_callback_t f;
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30  @88) 	unsigned long offset = (unsigned long)head->func;
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   89) 
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   90) 	rcu_lock_acquire(&rcu_callback_map);
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   91) 
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   92) 	trace_rcu_invoke_callback("", head);
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   93) 	f = head->func;
2cbc482d325ee58 kernel/rcu/tiny.c Zhen Lei                2023-08-05   94  	debug_rcu_head_callback(head);
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   95) 	WRITE_ONCE(head->func, (rcu_callback_t)0L);
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   96) 	f(head);
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   97) 	rcu_lock_release(&rcu_callback_map);
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   98) 	return false;
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30   99) }
77a40f97030b27b kernel/rcu/tiny.c Joel Fernandes (Google  2019-08-30  100) 

:::::: The code at line 88 was first introduced by commit
:::::: 77a40f97030b27b3fc1640a3ed203870f0817f57 rcu: Remove kfree_rcu() special casing and lazy-callback handling

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
