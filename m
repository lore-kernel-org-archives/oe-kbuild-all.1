Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CDE356758
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 04:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782967530; cv=none; b=s70khh5zLo4DY+gwqhbBO2IeF9fCDHXHkzYObm1moQpDcLQ/bd+EjjFRVjH0cL65AG8Ht9hmozeTbd4MXxet2w+COGr2INyeris7vCEdpq05vUgw5V83f4aOsxhVk4tZDoOrRuoGSJOIM+npLnAZNoX/J9XzFtoprAjYvVZBA/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782967530; c=relaxed/simple;
	bh=y1DJF6uIYn9xduKrHI66Nd3Ode9m5vdn/6Zv1WBgVTs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V6OAdXMI+/7yojotuM/hfLoKrMwsKwQmsIoEb1hxFC3nNuLbYwMuYrDJ9Uv0akR8EZOqAUhq9uGPU90jSiXYlFbPZwUQVm9WT09irTp/AUSocH2gZN2fs3JQFJb4VY1Z3HcpchJ2CgkEed6fgkioZ8MUJ1NzBFJ/j12S5CSWfVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1dLQHi1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1dLQHi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782967530; x=1814503530;
  h=date:from:to:cc:subject:message-id;
  bh=y1DJF6uIYn9xduKrHI66Nd3Ode9m5vdn/6Zv1WBgVTs=;
  b=W1dLQHi1fg2j8vzCfuZ29a9Vf48/MvK0aCexVDXkGH6JE/vLw8EtWaAR
   Cyb4eekbZ8NDiOOc1J2AhkqJREsZxz/KQyIqEX2ctGfwTEhwQAV4fSkSa
   i8Dj7tytHqqnStCKnqHXP7hMmxAlIV2dccSPnum2Z3T3iBKjVrEKgNrAZ
   7pHoANCpM5acIlzYpN1moyPbW6xmmtyKCysdpkT++i0qqamfJkdwyB60D
   pHZF7ik2II3vShDMb4GFfbhF/+Km3//SXXRhzvEYP39b9FU7vYuy9h7Jc
   pcrk7QvwM52aJpw1urR7Q1Pz0iosd46cCzVEtIWYPrIZ5+9Uwkp7Dapzk
   g==;
X-CSE-ConnectionGUID: /PNPsCk6RneVsLG9nZEa1g==
X-CSE-MsgGUID: gE3m0TC6Q7yt+sLEd/sACA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83576693"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83576693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 21:45:29 -0700
X-CSE-ConnectionGUID: IVjphjwBTsOoaninrKfAiQ==
X-CSE-MsgGUID: vwCQRYEVS0mo2zUprYxwfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248295744"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jul 2026 21:45:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf9Ic-000000009zf-0tIp;
	Thu, 02 Jul 2026 04:45:20 +0000
Date: Thu, 02 Jul 2026 12:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kmalloc-no-objext-rfc-v1r2 3/3] mm/slab.h:397:24:
 error: 'KMALLOC_NO_OBJ_EXT' undeclared; did you mean 'SLAB_ALLOC_NO_OBJ_EXT'?
Message-ID: <202607021236.E9QSeOUu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kmalloc-no-objext-rfc-v1r2
head:   a734609d2f387a9e682d352e9f28599744cc300b
commit: a734609d2f387a9e682d352e9f28599744cc300b [3/3] mm/slab: prevent unbounded recursion in free path with new kmalloc type
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607021236.E9QSeOUu-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021236.E9QSeOUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021236.E9QSeOUu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:19:
   mm/slab.h: In function 'kmalloc_slab':
>> mm/slab.h:397:24: error: 'KMALLOC_NO_OBJ_EXT' undeclared (first use in this function); did you mean 'SLAB_ALLOC_NO_OBJ_EXT'?
     397 |                 type = KMALLOC_NO_OBJ_EXT;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        SLAB_ALLOC_NO_OBJ_EXT
   mm/slab.h:397:24: note: each undeclared identifier is reported only once for each function it appears in


vim +397 mm/slab.h

   381	
   382	/*
   383	 * Find the kmem_cache structure that serves a given size of
   384	 * allocation
   385	 *
   386	 * This assumes size is larger than zero and not larger than
   387	 * KMALLOC_MAX_CACHE_SIZE and the caller must check that.
   388	 */
   389	static inline struct kmem_cache *
   390	kmalloc_slab(size_t size, kmem_buckets *b, gfp_t flags, kmalloc_token_t token,
   391		     unsigned int alloc_flags)
   392	{
   393		unsigned int index;
   394		enum kmalloc_cache_type type = kmalloc_type(flags, token);
   395	
   396		if (alloc_flags & SLAB_ALLOC_NO_OBJ_EXT)
 > 397			type = KMALLOC_NO_OBJ_EXT;
   398	
   399		if (!b)
   400			b = &kmalloc_caches[type];
   401		if (size <= 192)
   402			index = kmalloc_size_index[size_index_elem(size)];
   403		else
   404			index = fls(size - 1);
   405	
   406		return (*b)[index];
   407	}
   408	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
