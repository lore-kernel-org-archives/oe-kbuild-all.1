Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648827055F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765548005; cv=none; b=tok0uXSgPDDEqI//sYVURW97Lh2bPpaziL0WCcft/9hdGhVEAiNzmTnXVWKoOlX1pzaby9vS01he38Ec7wgjupMN8BypCZxBvG8VQpapj7aGZrF2k/B2W2iXZxiDjZO/70zhn2G7xkrj0xmP3Z25AcwYvEv3Wo2IBL0BG1f6ACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765548005; c=relaxed/simple;
	bh=pOF+GJqPbdHiIug9q20lZcJpH6jgi/5UbTqrGyBAEH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrcSky4G27Uq7MjChC0d5glJFH+UdSkp08ZweR4NW5ooHELKVYiZklunf3QjEtC0FIujATV5KE9X1dmEkL1MGRzn3b66u9vmzLPCJVstvF1WolbvwlBj4LF4ZYoDyZsMcoxpq3xaP7cT8B/OkK+G5Ft4vNEYhDy5oQpf8KGTHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbUJ50UU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbUJ50UU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765548002; x=1797084002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOF+GJqPbdHiIug9q20lZcJpH6jgi/5UbTqrGyBAEH4=;
  b=nbUJ50UUV9Oz0bwSIjSTn3xy/W+ECoU3YJrP+3zDE6t4JOx7ZmmM52fr
   QwrEww0LRKxkvsv8ISBXDOcUD5W1Fo3o3zG0p+La8pZoRe57FXRg0IYyO
   SiPDyGvl37J53X/F3CUGwIKyVfXP5pP6EthFhNTgvYfke7INpHztcbL+w
   2OSJrXWMEjeNvO5UkWKahh5wcuotVZ3rIt6bvSeyFM9mymIGJ6LGW4UpF
   qkpvbhrfP++6JmiCR6AijTJwre2S9vquEHKKzse4shomDDAcITzlnSXZo
   hheggROytOgMWan67lmDiWHNEuue0cnn89uMW8bZ8PnJ3Z6Tt/oVgH43/
   g==;
X-CSE-ConnectionGUID: 80qSGsvkStqBa5suCZ8VIg==
X-CSE-MsgGUID: BVuSThanTEeE9oiC5F4ciQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67298843"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67298843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:00:00 -0800
X-CSE-ConnectionGUID: K1ZO1tx8SE2hPUVhCbSzDw==
X-CSE-MsgGUID: 6ZmWCvNiQxWVEmQxwwKp+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197000570"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 05:59:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU3ga-0000000068B-1bi5;
	Fri, 12 Dec 2025 13:59:56 +0000
Date: Fri, 12 Dec 2025 21:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for
 function 'atomic64_exchange'
Message-ID: <202512122101.aJqs71rj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: fe08767e3a083e73a72f08432bc6fbd864fa7179 [3541/3541] drivers/crypto/ccp: concurrent psp access support between user and kernel space
config: x86_64-randconfig-101-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122101.aJqs71rj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122101.aJqs71rj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122101.aJqs71rj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/psp-dev.c:18:
   In file included from drivers/crypto/ccp/hygon/psp-dev.h:17:
   In file included from drivers/crypto/ccp/hygon/sp-dev.h:14:
   In file included from include/linux/ccp.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for function 'atomic64_exchange' [-Wmissing-prototypes]
      25 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         |          ^
   drivers/crypto/ccp/hygon/psp-dev.c:25:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      25 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         | ^
         | static 
   drivers/crypto/ccp/hygon/psp-dev.c:30:5: warning: no previous prototype for function 'psp_mutex_init' [-Wmissing-prototypes]
      30 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^
   drivers/crypto/ccp/hygon/psp-dev.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | int psp_mutex_init(struct psp_mutex *mutex)
         | ^
         | static 
   drivers/crypto/ccp/hygon/psp-dev.c:38:5: warning: no previous prototype for function 'psp_mutex_trylock' [-Wmissing-prototypes]
      38 | int psp_mutex_trylock(struct psp_mutex *mutex)
         |     ^
   drivers/crypto/ccp/hygon/psp-dev.c:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | int psp_mutex_trylock(struct psp_mutex *mutex)
         | ^
         | static 
   8 warnings generated.


vim +/atomic64_exchange +25 drivers/crypto/ccp/hygon/psp-dev.c

    24	
  > 25	uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
    26	{
    27		return xchg(dst, val);
    28	}
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
