Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264507;
	b=153z7WvdfJJxi/JQHsqNaFlcv6QnKRbV85RI4ljyXVUolLsvpTUBQaP+/fnFYcfQt0vL
	 JPMzZGl2PCvmyIoQwHKkEdof0bys3krHXosf4EMV4wtXR/GW7GhTAhXNRQyGakomAqvqV
	 2dkbvDjRe7lfNDKYIxJ7w5Xb0auU6gE6Bp3ww/NucbZa7zUkFCnEhvlQ0KNQgjrs71HsR
	 zESfTYfGssjcgavniu8cxVDadj101WSTWhOcoVRGqhjyVHXGRMQHBeD2N+7M8dL4bVVnI
	 MPBQXTSFg1uMBnlFNYyBlXi5MWfGHzhWUT4C1LQayXy/dbrQCDJwMRQAymRDg9TcDBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fBkwQlFl2vWM+gdG/eBluNIppBZvQ8GGyv7pbzEeyOY=;
	b=PmK/m03wWZLUvfwvMtEjLfVyOmLK/p8f9Q7DFeGpzH+j/L7e29Gb1TbwVLRX+pFks9Fq
	 kXTsWwurbp59Px0pXeLyjW4iShvmnj5YfsFjIuB9c133Bo+FEYfL6ARhKOK1PuEzleqNP
	 FtjuBx0TGfvehcmzo61QonACVVxXFZS/K5rCiuT21GgghZ3BXPDIlp3S3Ncyek1Entgsa
	 BZboMnn3VtL6ldTD/Sy6y8IW9JGyRJ5lViUJNU3K0nuWuw8rQt1Yk5yAB2tNUcXvEoy5E
	 cF9Aqx5T1Yne8H3R8Djtuf6RD0blHTTYkgyuZ39a+RPodwsSg/MiYbT0aEVhd448DAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wi1uDYB3;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41E5606A32A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 12:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41E5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wi1uDYB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795264505; x=1826800505;
  h=date:from:to:cc:subject:message-id;
  bh=3pHWHaGiu8L/HiFUut6PAs/7MP/O64YwN1hV5D8+o5k=;
  b=Wi1uDYB3QvYVR/10HP6FTYiHVGz8+EUQqbo5D2DAVjZ19tAC06Xjb4Q/
   FanYA9+Ri2PeubzIML448yt9+4yUi8x1Dnc0hFqEwm2W9x1AYr9ewMGtI
   54IpND1Vdxl4fNsWIlcT3N/+awHthw3H0JoX6WgDWQ7mVp+FUc3hhdoI+
   E/6XCHFCzxzG96h1OoeRNEHnw0Sn8eA8M3aGijq315LuGheCnj6qvyzpV
   jo+h15OkfY8hCi6Nvbp8n0vxbyaZ7ZEkmtL3Nu4CK8o0vyVUWzZAyH8hd
   Pwcx7ht1zYAVCO36UD6JNnZfJczfMy+BsJUKfgwskMNeloVnMMO4wbcaY
   w==;
X-CSE-ConnectionGUID: AbX6AYGKSVeWrAfl58WSpQ==
X-CSE-MsgGUID: ogERm1QqR0Wfcqxq2oPXKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4126476"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4126476"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 04:35:04 -0800
X-CSE-ConnectionGUID: fZrGbwE3T5iY5fSQ0mtxUQ==
X-CSE-MsgGUID: 4dc95Z7DS0upIXG/FeJUDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11485324"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Nov 2026 04:35:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUkJ2-000000004Jp-1HUz;
	Sat, 21 Nov 2026 12:35:00 +0000
Date: Sat, 21 Nov 2026 13:34:45 +0100
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org, David Rientjes <rientjes@google.com>
Subject: [akpm-mm:mm-unstable 327/327]
 arch/arm64/include/asm/percpu.h:261:1: sparse: sparse: cast truncates bits
 from constant value (ffffffffffffd8f0 becomes f0)
Message-ID: <20261121133112.48w1QOqw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   7d1a16abe4cc5dccd21e3d6262e44433a5885d27
commit: 7d1a16abe4cc5dccd21e3d6262e44433a5885d27 [327/327] mm: vmstat_kunit: add synthetic benchmark for mm stats
config: arm64-randconfig-r2305-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121133112.48w1QOqw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121133112.48w1QOqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121133112.48w1QOqw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/tests/vmstat_kunit.c: note: in included file (through include/linux/irqflags.h, include/linux/spinlock.h, include/linux/kref.h, include/kunit/test.h):
>> arch/arm64/include/asm/percpu.h:261:1: sparse: sparse: cast truncates bits from constant value (ffffffffffffd8f0 becomes f0)

vim +261 arch/arm64/include/asm/percpu.h

535fdfc5a22852 Catalin Marinas 2025-11-06  254  
535fdfc5a22852 Catalin Marinas 2025-11-06  255  /*
535fdfc5a22852 Catalin Marinas 2025-11-06  256   * Use value-returning atomics for CPU-local ops as they are more likely
535fdfc5a22852 Catalin Marinas 2025-11-06  257   * to execute "near" to the CPU (e.g. in L1$).
535fdfc5a22852 Catalin Marinas 2025-11-06  258   *
535fdfc5a22852 Catalin Marinas 2025-11-06  259   * https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop
535fdfc5a22852 Catalin Marinas 2025-11-06  260   */
535fdfc5a22852 Catalin Marinas 2025-11-06 @261  PERCPU_OP(add, add, ldadd)
535fdfc5a22852 Catalin Marinas 2025-11-06  262  PERCPU_OP(andnot, bic, ldclr)
535fdfc5a22852 Catalin Marinas 2025-11-06  263  PERCPU_OP(or, orr, ldset)
959bf2fd03b59f Will Deacon     2018-09-13  264  PERCPU_RET_OP(add, add, ldadd)
959bf2fd03b59f Will Deacon     2018-09-13  265  

:::::: The code at line 261 was first introduced by commit
:::::: 535fdfc5a228524552ee8810c9175e877e127c27 arm64: Use load LSE atomics for the non-return per-CPU atomic operations

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
