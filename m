Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7341E376E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 05:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742535657; cv=none; b=NOYQ8HJP5wDsVWKUtnXGP0T3/ShLLgKqmy4/otvST/7UFXyr0dylzveRtP3ObHZ//0sUBY6i0r+l2zlBm+qk2L9IMxxOXDapGgu2IEWvc2nZuJ05HjjTOCDKOCub0oa6t4LenPoqsMnZWzdhpMhcbwyIeoiQeL5ONiUuk67vpJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742535657; c=relaxed/simple;
	bh=/B9FxNEaN1VRwQCz4DOZ9M/u7US8lorFSbGeg+J69W8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iwepni+G+0fplmt2reA1ltPMwnvqAmXsCW/vb85gmllOcNCbFwQTqYea2AqJOMH5xKZwC+5XAOaDRmOvIHTTIHX+Fv5eL8aSPZ2lvVsRhWkBkkvHn1MccNIw2b9XQt7ryAWZYz77gE0nZo4gOj7DaroUBw0JcATzsDRVohl0rfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASRDZSUp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASRDZSUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742535656; x=1774071656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/B9FxNEaN1VRwQCz4DOZ9M/u7US8lorFSbGeg+J69W8=;
  b=ASRDZSUpV1H3KinEcHT766sEovA9U7si9wt7IZ/D79S7Nf2HL/1qbsu0
   A/wyoOWJcm6ek3U1GcWl7jNpki8I1RhTloxgfiKNMX66/BZzyGNWIzAuz
   8RDECNu4uANGGwhXJ74USD196o+emxPCEORhIaoFVuktpH7XgS9BctNB5
   hHyeIRWXuNM6+qJJ6zIGh38vODTI3Q0zY+/4izt8VeE4Q1O4wuZKoXIlA
   sHnQOF8CRRUzTPpbo4fJPVPS93ukojV/jSe/JxGNaUTIeXRFL2dSgekJV
   cWGzMkJhFHpsqgB1tIwwRaKUULT+rKAFmUyKrIR+ZINdAsnmqcLIsRNvO
   Q==;
X-CSE-ConnectionGUID: 75OAFGqQQ9ag+nUBvhQvhA==
X-CSE-MsgGUID: dtw5vz1ESAarGofk2BneFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43524321"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="43524321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 22:40:54 -0700
X-CSE-ConnectionGUID: Bs8DV+XMSa6DrynWWqzzMg==
X-CSE-MsgGUID: TkHJP8/3R3KS7Mx5p7fk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="128530273"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2025 22:40:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvV5P-00014V-1Z;
	Fri, 21 Mar 2025 05:40:33 +0000
Date: Fri, 21 Mar 2025 13:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 42/42] include/linux/ratelimit.h:44:33: error:
 incompatible type for argument 1 of '_raw_spin_lock_irqsave'
Message-ID: <202503211321.hs5OjZIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   eb8edf55ec5fb6db81f970bb09e9aefa17fc49f4
commit: eb8edf55ec5fb6db81f970bb09e9aefa17fc49f4 [42/42] squash! drm/amd/pm: Avoid open-coded use of ratelimit_state structure's ->missed field
config: arc-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211321.hs5OjZIa-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211321.hs5OjZIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211321.hs5OjZIa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:2186,
                    from arch/arc/kernel/asm-offsets.c:6:
   include/linux/ratelimit.h: In function 'ratelimit_state_reset_interval':
>> include/linux/ratelimit.h:44:33: error: incompatible type for argument 1 of '_raw_spin_lock_irqsave'
      44 |         raw_spin_lock_irqsave(rs->lock, flags);
         |                               ~~^~~~~~
         |                                 |
         |                                 raw_spinlock_t {aka struct raw_spinlock}
   include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   In file included from include/linux/spinlock.h:312,
                    from include/linux/sched.h:2186,
                    from arch/arc/kernel/asm-offsets.c:6:
   include/linux/spinlock_api_smp.h:32:65: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'raw_spinlock_t' {aka 'struct raw_spinlock'}
      32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
         |                                                 ~~~~~~~~~~~~~~~~^~~~
   make[3]: *** [scripts/Makefile.build:102: arch/arc/kernel/asm-offsets.s] Error 1 shuffle=16458656
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=16458656
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=16458656
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=16458656
   make: Target 'prepare' not remade because of errors.


vim +/_raw_spin_lock_irqsave +44 include/linux/ratelimit.h

    39	
    40	static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, int interval_init)
    41	{
    42		unsigned long flags;
    43	
  > 44		raw_spin_lock_irqsave(rs->lock, flags);
    45		rs->interval = interval_init;
    46		rs->begin = 0;
    47		rs->printed = 0;
    48		ratelimit_state_reset_miss(rs);
    49		raw_spin_unlock_irqrestore(&rs->lock, flags);
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
