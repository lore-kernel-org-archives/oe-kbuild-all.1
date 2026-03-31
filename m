Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524BD1925BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925277; cv=none; b=Ur0+isOgl6zxtNFJaa/cjd9jwIX62udHHGkXAoNdHkxIkSsM60ln40Hrd+5o3JncNwGnUUa5wQNLeBAo3EtZ8cgmI2OeaKD3DpaYgK0IjAsdRxC8lw+pz0AWxvcAV1ykHAj14dZ0sMKSLLrYNZRCcYCBfhrRStJu/KXm2EP1xRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925277; c=relaxed/simple;
	bh=bUw3tFezuQQJSdmrAQq6EFkK/MmVA5Qj8YDFZB556EI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k9Ojt0hIJ6qbRwCVwru2zR+wEQBR4a5+Wx7cLh10FUwmf7tIu6Wv3zdHH3Q8brj1dZGesFnADTtl7uGZgpifqSadHKGSOK44INdXQQTvUpwS6hpO1juClDiOVlWwbSrkyYEQpH21DpyBGDWiltVR/izEz3L9sPA+zlwb1CJ0qp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VB+On5h5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VB+On5h5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774925275; x=1806461275;
  h=date:from:to:cc:subject:message-id;
  bh=bUw3tFezuQQJSdmrAQq6EFkK/MmVA5Qj8YDFZB556EI=;
  b=VB+On5h5uWOQQo7jpzyoeymfIx67yBEutADd9iEm56PKoltkvsewBSUu
   9QLeKsm4/OhLH7pYL7yBixikA9g29uUfHkxYYXFb1YJGlmMWhxNsjt7lm
   f7VZl9Ual1jStcIJaNB5ffdgCe3BrbRP5ZsqBA1z0ljxEBbM/JVgtWLXH
   3JwXxQyP2mNRjVCSdqQVIjHErgB/dBFR9VejQSn8j0AGA+Lyr3lH9X0KI
   RNXnBebeo4BvXasFPpJcdL+DbvTvVoyzRndPtsZjnBWYugMyrTtO8ayCm
   4vBVRkP9cBEoXD1A3VkSokwlY7bouhkPFL9a7iA5kjlViM0YkXs7OrQ49
   A==;
X-CSE-ConnectionGUID: OkS4ioHfTC2bS05LsAD/fw==
X-CSE-MsgGUID: 4jBhX7ClQK2PvEbYt6fZjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79828184"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79828184"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:47:55 -0700
X-CSE-ConnectionGUID: DDKDQH1ySWKEotauEeH0HA==
X-CSE-MsgGUID: xmOds/+NTsSNQQywuQHJVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="219579406"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 19:47:53 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7P8x-0000000023f-0rwe;
	Tue, 31 Mar 2026 02:47:51 +0000
Date: Tue, 31 Mar 2026 10:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 3/14]
 include/linux/futex_types.h:51:50: error: expected ':', ',', ';', '}' or
 '__attribute__' before '*' token
Message-ID: <202603311022.cKb50nr9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   101e17624801c8d4b8d75e5b3fa3cd59e2e040d4
commit: 73d4b7679a4398f4e3f43b465b7f4de43a5d0683 [3/14] futex: Move futex related mm_struct data into a struct
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20260331/202603311022.cKb50nr9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311022.cKb50nr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311022.cKb50nr9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:19,
                    from arch/um/kernel/asm-offsets.c:4:
>> include/linux/futex_types.h:51:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      51 |         unsigned int                    __percpu *ref;
         |                                                  ^
   make[3]: *** [scripts/Makefile.build:184: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +51 include/linux/futex_types.h

    32	
    33	#ifdef CONFIG_FUTEX_PRIVATE_HASH
    34	/**
    35	 * struct futex_mm_phash - Futex private hash related per MM data
    36	 * @lock:	Mutex to protect the private hash operations
    37	 * @hash:	RCU managed pointer to the private hash
    38	 * @hash_new:	Pointer to a newly allocated private hash
    39	 * @batches:	Batch state for RCU synchronization
    40	 * @rcu:	RCU head for call_rcu()
    41	 * @atomic:	Aggregate value for @hash_ref
    42	 * @ref:	Per CPU reference counter for a private hash
    43	 */
    44	struct futex_mm_phash {
    45		struct mutex			lock;
    46		struct futex_private_hash	__rcu *hash;
    47		struct futex_private_hash	*hash_new;
    48		unsigned long			batches;
    49		struct rcu_head			rcu;
    50		atomic_long_t			atomic;
  > 51		unsigned int			__percpu *ref;
    52	};
    53	#else  /* CONFIG_FUTEX_ROBUST_UNLOCK */
    54	struct futex_mm_phash { };
    55	#endif /* !CONFIG_FUTEX_ROBUST_UNLOCK */
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
