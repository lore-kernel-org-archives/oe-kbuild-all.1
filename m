Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C65B674
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743554922; cv=none; b=dmwq0HeiY5U2YwoBt1470qns0Fi5qvVKRF+mqk7KSfH5xwzB1G/4kSxd94ktAEg9epWW0DH9OitXhsoaYy9lKikU/8wfxTvH8DmyCMsWXEg0UjuGh+IMIIpSJjC4RGAkk30o6tjYYdDXaj2O4fC5Q1iNC8QTG/LQq7GiiizpBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743554922; c=relaxed/simple;
	bh=8ETY+Dan+UkianXEienbuvl10xPfm3HoQaDGwRiOHBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DousdGuyKTA9DCLWETPA0zENNNMJN0Um3v1sOJ7Oz6VAOtQLPSO8y+6NrxowyZ5QY5SQ4RhXv84ZzrUG62ksocH1onD1G6TC5XulzKB0CiJ8RNDeCAipkhYdM1oo1uwtzjHZUv2prZU+4z1ne8+DZF1uqmO83MK6svSKacIjpzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCxOIqqA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCxOIqqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743554921; x=1775090921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ETY+Dan+UkianXEienbuvl10xPfm3HoQaDGwRiOHBU=;
  b=BCxOIqqAsRcPa+15BmTGzcs4ZAVfISyjo1aPE0qFQL4BCVS6aSrYFIWe
   KRSfvxUA3IH8JDGEcLVSMjh6KvvA3meO8h55nnoiAj24DhiEtTwmUJ7C8
   7ma91GmBOWT1uKD+Hqd0GCqbbFJAIjqxm6ebVHsGqaJJb6dZBDz2tV3P6
   zCs8MHtXEmIj7lSqxibPAvKvwrE+buVRZ1yvZ8TAedK0BLYLLLwHOvOIz
   XfXk7Hy1qewonBdGqeTSgCROSyoKVJ0/GXkKs4+GR39unGpNvGVEOJtti
   pENF02GeQ7amlW8G6lL+hgyUlJOO0YV6lpGE/E9cCtVSbfPPb/iGn1SWX
   A==;
X-CSE-ConnectionGUID: DRojPE3pTDGWTba1S55sww==
X-CSE-MsgGUID: Q4KM/TR9RrKW8Pqe0Yl9SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45073470"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="45073470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 17:48:40 -0700
X-CSE-ConnectionGUID: pVXNCBo7TG6TfR8iKgOtFA==
X-CSE-MsgGUID: ylugMa00SGGGHPnPPFioWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="127059326"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Apr 2025 17:48:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzmHU-000AIa-2B;
	Wed, 02 Apr 2025 00:48:36 +0000
Date: Wed, 2 Apr 2025 08:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:keys-graveyard 16/16] security/keys/proc.c:118:45:
 error: 'irqflags' undeclared; did you mean 'ifr_flags'?
Message-ID: <202504020822.hqShwarn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git keys-graveyard
head:   13c6debc9b86b8bec9747d10085092d3149dce3b
commit: 13c6debc9b86b8bec9747d10085092d3149dce3b [16/16] KEYS: Add a list for unreferenced keys
config: csky-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020822.hqShwarn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020822.hqShwarn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020822.hqShwarn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:7,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from security/keys/proc.c:9:
   security/keys/proc.c: In function 'proc_keys_start':
>> security/keys/proc.c:118:45: error: 'irqflags' undeclared (first use in this function); did you mean 'ifr_flags'?
     118 |         spin_lock_irqsave(&key_serial_lock, irqflags);
         |                                             ^~~~~~~~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   security/keys/proc.c:118:9: note: in expansion of macro 'spin_lock_irqsave'
     118 |         spin_lock_irqsave(&key_serial_lock, irqflags);
         |         ^~~~~~~~~~~~~~~~~
   security/keys/proc.c:118:45: note: each undeclared identifier is reported only once for each function it appears in
     118 |         spin_lock_irqsave(&key_serial_lock, irqflags);
         |                                             ^~~~~~~~
   include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                ^
   include/linux/spinlock.h:381:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   security/keys/proc.c:118:9: note: in expansion of macro 'spin_lock_irqsave'
     118 |         spin_lock_irqsave(&key_serial_lock, irqflags);
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
   security/keys/proc.c:118:9: note: in expansion of macro 'spin_lock_irqsave'
     118 |         spin_lock_irqsave(&key_serial_lock, irqflags);
         |         ^~~~~~~~~~~~~~~~~
   security/keys/proc.c: In function 'proc_keys_stop':
   security/keys/proc.c:150:50: error: 'irqflags' undeclared (first use in this function); did you mean 'ifr_flags'?
     150 |         spin_unlock_irqrestore(&key_serial_lock, irqflags);
         |                                                  ^~~~~~~~
         |                                                  ifr_flags


vim +118 security/keys/proc.c

   111	
   112	static void *proc_keys_start(struct seq_file *p, loff_t *_pos)
   113		__acquires(key_serial_lock)
   114	{
   115		key_serial_t pos = *_pos;
   116		struct key *key;
   117	
 > 118		spin_lock_irqsave(&key_serial_lock, irqflags);
   119	
   120		if (*_pos > INT_MAX)
   121			return NULL;
   122		key = find_ge_key(p, pos);
   123		if (!key)
   124			return NULL;
   125		*_pos = key->serial;
   126		return &key->serial_node;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
