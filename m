Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364B33B1EC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050191; cv=none; b=QM9Ifj1bWT4dWFt4DYJb805kb1hMtnYIvDbGXW8JjmIGMPDJS3Vpjp7ljfSo/fRIEpQ32N3cFuVDveZ6zauXcPrzBUsT6JyYG3qA5lri8evv9Zqp/Hz2fF+kVIxY5fteSBQHcn/2OfpO6rJQ2PxDQ2eHD4ceE4TTnDmwU2TKJ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050191; c=relaxed/simple;
	bh=1CsWUzLYsTnXW+ohKN9w5pWqqmuIqHdEUfzg4v2Iak8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pdmo5/0oAotGnQPQTeTawOXnaCbU1M21Bk5qdiffnxxeVRCrDaIxdGNyjGURcj/G/YpipQd8An8ctBqpy+GigTGJeCZhtLV+5FTSNHFSMcFh8+MR25vrzqeSX3gf63vujdqsnIfM6Qkj4KJf595PyWeUYo0ylfjJxiTFbSd2Bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D091wvFj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D091wvFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780050188; x=1811586188;
  h=date:from:to:cc:subject:message-id;
  bh=1CsWUzLYsTnXW+ohKN9w5pWqqmuIqHdEUfzg4v2Iak8=;
  b=D091wvFjIPeGlPXv3SXmnldt9DFnucy2onibLBoVdmcjovADYA0bvwSr
   DjT/p+VeE8umM+Oqr7U/tfs43j4MlKPzmCyR8hEX63GU+3nyJmC3twN0I
   HbCCvzdESVIah4k465ldqh2o0KebtULwC4IryhwfsUyIXuEqql45NCtAf
   HdbwFOt6g8hUhHR0oXM9BU2onpCfhKkrdgElKN/5nF0432VQ5v+OYhLe0
   nFGkoPGumNDB2nQa1Bx6nIFfUfMf4eCpY/Ex1UYlEkeQkz7s8HoXhwIN+
   2Aas18Yf8ZcfNrDlrOt4z/gFm4dWAsPk00jewYtwEeTRyyvEhgHOTrOsL
   Q==;
X-CSE-ConnectionGUID: Mp/2tsAnQ+mOxSQeU6LgLQ==
X-CSE-MsgGUID: PHLLD+DDRLKLWOYeqhhJLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80929255"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80929255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 03:23:07 -0700
X-CSE-ConnectionGUID: gxmc00etTCKJxJgSP1L/6w==
X-CSE-MsgGUID: upJc++yxTu2411FI3Prqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="247092451"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 May 2026 03:23:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSuMp-0000000075w-2JZa;
	Fri, 29 May 2026 10:23:03 +0000
Date: Fri, 29 May 2026 18:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena/tmp-slab-nofix 2/2] mm/slab.h:389:29:
 warning: array subscript 536870911 is above array bounds of 'u8[24]' {aka
 'unsigned char[24]'}
Message-ID: <202605291852.Bq7zEnlW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux arena/tmp-slab-nofix
head:   8e98bca9b3d9cd5861cf495a9f7c85256fbeed4c
commit: 8e98bca9b3d9cd5861cf495a9f7c85256fbeed4c [2/2] bpf,slab: Add slub-backed allocator for bpf_arena
config: s390-randconfig-001-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291852.Bq7zEnlW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291852.Bq7zEnlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291852.Bq7zEnlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/slub.c:23:
   mm/slub.c: In function 'alloc_slab_obj_exts':
>> mm/slab.h:389:29: warning: array subscript 536870911 is above array bounds of 'u8[24]' {aka 'unsigned char[24]'} [-Warray-bounds]
      index = kmalloc_size_index[size_index_elem(size)];
              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~


vim +389 mm/slab.h

5a9d31d980cbc9 Vlastimil Babka 2023-11-13  373  
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  374  /*
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  375   * Find the kmem_cache structure that serves a given size of
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  376   * allocation
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  377   *
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  378   * This assumes size is larger than zero and not larger than
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  379   * KMALLOC_MAX_CACHE_SIZE and the caller must check that.
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  380   */
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  381  static inline struct kmem_cache *
67f2df3b82d091 Kees Cook       2024-07-01  382  kmalloc_slab(size_t size, kmem_buckets *b, gfp_t flags, unsigned long caller)
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  383  {
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  384  	unsigned int index;
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  385  
67f2df3b82d091 Kees Cook       2024-07-01  386  	if (!b)
67f2df3b82d091 Kees Cook       2024-07-01  387  		b = &kmalloc_caches[kmalloc_type(flags, caller)];
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  388  	if (size <= 192)
5a9d31d980cbc9 Vlastimil Babka 2023-11-13 @389  		index = kmalloc_size_index[size_index_elem(size)];
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  390  	else
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  391  		index = fls(size - 1);
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  392  
67f2df3b82d091 Kees Cook       2024-07-01  393  	return (*b)[index];
5a9d31d980cbc9 Vlastimil Babka 2023-11-13  394  }
ed4cd17eb26d7f Harry Yoo       2022-08-17  395  

:::::: The code at line 389 was first introduced by commit
:::::: 5a9d31d980cbc9cefcee18e186bd4c5d51f3cba2 mm/slab: move kmalloc_slab() to mm/slab.h

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
