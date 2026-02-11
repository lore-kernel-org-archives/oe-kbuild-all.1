Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CC1DF980
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822585; cv=none; b=LiffPQKIKGQAKALPqDomvzymZkHOHfFafwxh0v+sYL/QhY1LQAaN6ItocRIS6b0lC9E7NNj76lmlieakSmjGBBCyY3RXbBJxuBof4tLB7tX+7gDnTWhxP7UJ5m1S2QWTv5kV17FRvQ3pgqpS1cHk1VhpVkfhTxg42EwbuFjugNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822585; c=relaxed/simple;
	bh=rXSLyKsCar49lRKD+gy3mZfblQd8FLMd2JaFX+td4ws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oPj6MNGM/qMv7wZQk/2j/mU9Foavb6pzyJ9Vs3NHJNixz8ME+i6AtU+hpvoUahAYbvv2Fn1A+ZzgCBTdA+FeYPpQP3T0nqhJJ22OPhLR7f7mW/PDkXsuuKZHydzX1/654j/uoVuv1morwt278zAQmdvBsqkJw4pnJhYt7L4GP08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSdOisOC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSdOisOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770822583; x=1802358583;
  h=date:from:to:cc:subject:message-id;
  bh=rXSLyKsCar49lRKD+gy3mZfblQd8FLMd2JaFX+td4ws=;
  b=RSdOisOCyrczioqxaMNrNv3hvLN8kp91BMoDCs1qrJegjVNGOZ0xbdhl
   ythCdPYyF79oU7nXgsncXHkHorv4o4NHONloZE9rN0MAyRdc/sdJEuFQE
   ZNlpFOcNU34ya62XBc5irJjyVb+eYDLgOFRu3J2yOMRN+QN3xSNzCC2Zr
   6WZO5bHbbOnLEbGm24bsw6vHzNPRZd1vK52ZQlZFQ97DGtEWfhF9Odih3
   sEMzBoxg06sKshMsA9tLJYHcvtHeO0OO3XQhfOl+mPdn/xqUOsX5/3Xv0
   QSO3fJO3zecRr8IPJfAKdTEzz6ArH4XJwJ471UdSrtIq3zNGVLICaol18
   w==;
X-CSE-ConnectionGUID: 68IX/3xsRF+A+q7BQBXaWQ==
X-CSE-MsgGUID: 6HaymzR3RFCyJbLfuKvmVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71686085"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71686085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 07:09:38 -0800
X-CSE-ConnectionGUID: pFwO21bkQBKa15PRRM0hOQ==
X-CSE-MsgGUID: Qo/Ej41sRvq7stZXDGcPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216547001"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2026 07:09:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqBqP-00000000q5k-0rHd;
	Wed, 11 Feb 2026 15:09:33 +0000
Date: Wed, 11 Feb 2026 23:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 7/14]
 kernel/bpf/trampoline.c:64:13: warning: 'trampoline_unlock_all' defined but
 not used
Message-ID: <202602112254.4MEvLSrl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   e88de144ad6e264c1df0286d6a975136d7a059c2
commit: 5e011f72271142e5e37a81d4c8eb725d0092de20 [7/14] bpf: Add bpf_trampoline_multi_attach/detach functions
config: arm-randconfig-002-20260211 (https://download.01.org/0day-ci/archive/20260211/202602112254.4MEvLSrl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112254.4MEvLSrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112254.4MEvLSrl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'trampoline_locks_lookup':
   kernel/bpf/trampoline.c:43:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     return &trampoline_locks[hash_64((u64) tr, TRAMPOLINE_LOCKS_BITS)].mutex;
                                      ^
   At top level:
   kernel/bpf/trampoline.c:793:12: warning: 'bpf_trampoline_update' defined but not used [-Wunused-function]
    static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
               ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:64:13: warning: 'trampoline_unlock_all' defined but not used [-Wunused-function]
    static void trampoline_unlock_all(void)
                ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:56:13: warning: 'trampoline_lock_all' defined but not used [-Wunused-function]
    static void trampoline_lock_all(void)
                ^~~~~~~~~~~~~~~~~~~


vim +/trampoline_unlock_all +64 kernel/bpf/trampoline.c

    40	
    41	static struct mutex *trampoline_locks_lookup(struct bpf_trampoline *tr)
    42	{
  > 43		return &trampoline_locks[hash_64((u64) tr, TRAMPOLINE_LOCKS_BITS)].mutex;
    44	}
    45	
    46	static void trampoline_lock(struct bpf_trampoline *tr)
    47	{
    48		mutex_lock(trampoline_locks_lookup(tr));
    49	}
    50	
    51	static void trampoline_unlock(struct bpf_trampoline *tr)
    52	{
    53		mutex_unlock(trampoline_locks_lookup(tr));
    54	}
    55	
  > 56	static void trampoline_lock_all(void)
    57	{
    58		int i;
    59	
    60		for (i = 0; i < TRAMPOLINE_LOCKS_TABLE_SIZE; i++)
    61			mutex_lock(&trampoline_locks[i].mutex);
    62	}
    63	
  > 64	static void trampoline_unlock_all(void)
    65	{
    66		int i;
    67	
    68		for (i = 0; i < TRAMPOLINE_LOCKS_TABLE_SIZE; i++)
    69			mutex_unlock(&trampoline_locks[i].mutex);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
