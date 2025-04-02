Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94573469D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 12:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596462; cv=none; b=Fgx5J9eehmk4KuOOIqkOd+sphD8Ri5OlIqYKlyIpOKvvBbS2EXT++XWpOt98npwGHiwFyRN5JSN/UKw47Z7pN1mCMA7akRfXFsyR4YULwMSOG+2v3YPMbwe2YYZIQKXJm6xIEHE1lZPLBO71a/2zaS2CKvoeWdRRgXGN/qfJzeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596462; c=relaxed/simple;
	bh=HFmkqUAoEzXGQRRzC6FD/GXKKaeCq7x+eELVu3Lf60c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4ReuoaYaA4ncu3RxNUB+PxAkATJFQSCArVPU7XEz8uqd5SqBKobUVCUt+Zi5lDfGUft5u6CMldxF+S0JOdiqP9we/I4PLcSDRM2uaaUALbevBFdh5ZuogqPjJbswFf3R8AQTkteHibTzbciyqehhl8pzka7tH0psgRK32XvHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/7wlCNG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/7wlCNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743596460; x=1775132460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFmkqUAoEzXGQRRzC6FD/GXKKaeCq7x+eELVu3Lf60c=;
  b=L/7wlCNG4PQbMVcZkR30GIxzleyQD5fND1GAOozmtJCIRxWbW54/E4c+
   4PFCsA8dp6Kz3rRrxMonWHTShhNEA04hXUagbK1BE3+IVsowDApzoI/Tv
   onx55YLPDYXxsjCaLu5NKsxUAnJ/dv5/pxUFOhJi8NhgEno8KNxLccUEK
   F7CpTld7wuwBaEg2x8qHSATi0k9rF5jCatz4t3YWZkqudekEUz7P8LAOm
   Mz0OIpjV8Jx1P/l7Jq3tYYqsz8Ys/s4iboz82TjNw/UksBFQSklSwcpC3
   QtLfHE0h8x/HW4wFFVq0dCM03FxBuHgVLYdvRRoOfaodPggZqnXQNA4nt
   Q==;
X-CSE-ConnectionGUID: CZ87ht/FRya3rLD6fmohZw==
X-CSE-MsgGUID: wH3DAbitTW68HojHIpEDSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44841029"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="44841029"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:21:00 -0700
X-CSE-ConnectionGUID: 5ypRmTwGSSCE3++TarhTSQ==
X-CSE-MsgGUID: iNEpyZqzQ4KEzt1IrZ1ocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="163910116"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2025 05:20:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzx5U-000AgS-1l;
	Wed, 02 Apr 2025 12:20:56 +0000
Date: Wed, 2 Apr 2025 20:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:keys-graveyard 16/16] security/keys/gc.c:209:48:
 error: 'flags' undeclared
Message-ID: <202504022005.kyikMYqP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git keys-graveyard
head:   ca5b76e45c384d9a7e84116d2c4524642eda3273
commit: ca5b76e45c384d9a7e84116d2c4524642eda3273 [16/16] KEYS: Add a list for unreferenced keys
config: csky-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504022005.kyikMYqP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504022005.kyikMYqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504022005.kyikMYqP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from security/keys/gc.c:8:
   security/keys/gc.c: In function 'key_garbage_collector':
>> security/keys/gc.c:209:48: error: 'flags' undeclared (first use in this function)
     209 |         spin_lock_irqsave(&key_graveyard_lock, flags);
         |                                                ^~~~~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:209:9: note: in expansion of macro 'spin_lock_irqsave'
     209 |         spin_lock_irqsave(&key_graveyard_lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   security/keys/gc.c:209:48: note: each undeclared identifier is reported only once for each function it appears in
     209 |         spin_lock_irqsave(&key_graveyard_lock, flags);
         |                                                ^~~~~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:209:9: note: in expansion of macro 'spin_lock_irqsave'
     209 |         spin_lock_irqsave(&key_graveyard_lock, flags);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/spinlock.h:243:17: note: in expansion of macro 'typecheck'
     243 |                 typecheck(unsigned long, flags);        \
         |                 ^~~~~~~~~
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   security/keys/gc.c:209:9: note: in expansion of macro 'spin_lock_irqsave'
     209 |         spin_lock_irqsave(&key_graveyard_lock, flags);
         |         ^~~~~~~~~~~~~~~~~


vim +/flags +209 security/keys/gc.c

   188	
   189		struct rb_node *cursor;
   190		struct key *key;
   191		time64_t new_timer, limit, expiry;
   192	
   193		kenter("[%lx,%x]", key_gc_flags, gc_state);
   194	
   195		limit = ktime_get_real_seconds();
   196	
   197		/* Work out what we're going to be doing in this pass */
   198		gc_state &= KEY_GC_REAPING_DEAD_1 | KEY_GC_REAPING_DEAD_2;
   199		gc_state <<= 1;
   200		if (test_and_clear_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags))
   201			gc_state |= KEY_GC_REAPING_LINKS;
   202	
   203		if (test_and_clear_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags))
   204			gc_state |= KEY_GC_REAPING_DEAD_1;
   205		kdebug("new pass %x", gc_state);
   206	
   207		new_timer = TIME64_MAX;
   208	
 > 209		spin_lock_irqsave(&key_graveyard_lock, flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
