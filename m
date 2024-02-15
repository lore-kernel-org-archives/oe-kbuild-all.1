Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5717E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 02:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707962857; cv=none; b=keN/UGxd8kAd8vl8lEuwuMCTeQY812sdLe6rMEeKlIOM4JETakRUXqdpOUQUgWt/3yswv06ADYLDwrCqFK3UBgdfsMjBPEcdRpLIKOc24DLMVzGrZOEAgffauTvHQMZ3yi+RcaOPXwDmFxkisZM4zIG0+CV2EJxRJUwb0gV+pjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707962857; c=relaxed/simple;
	bh=IAotLAYXlr5cFnMrSWUNTAWTi1vwllo6KU/mwqEA5cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lloywGftss9wBL9gd80o6eExKLyGZtvQazjJ3QmnWnUy+VzZNjklm4Iu7homZjv8ILpnynq5qECTewq5U22Y88rAX864v+t0MdClm42GHdbRcPxqMvxijw74AhYkfXosQ/V0OwHOC0r6Lpe6+wq7tsHdKxSns7BplOmP/txOivs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C633wi5O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C633wi5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707962854; x=1739498854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IAotLAYXlr5cFnMrSWUNTAWTi1vwllo6KU/mwqEA5cI=;
  b=C633wi5OvVaQEfzGynvdYvDUuj9ee99Op14lx9uJ1im0uiI0ES/FRu9d
   W6vhkbb7hvfRrDpOXe5yg7C73MT6+uLfok+knQRqf/f0uX82+11LVDJwu
   x/v7a1mVGkgMF9L9OgSNsRVN9Vcjov03VPVmBLsvyPAapBqXJi4R5ka2X
   x4wP8de3fUQVdXKUojPOsWuP5WYHHJp5/g9KNxIRqrL+2LAnEw/xvtHpr
   th8fH1jtVnDIGfDyDF1XMPIBoZM6pMBRXsPuT9HrKc1Tgx148D0+tJ0yn
   T6xanb2UGsFvN3W3Vj/NXMrUYliuLZ5ZCyApzY6BF8M/9ETrNTbfiillc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2183249"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2183249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 18:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3675448"
Received: from lkp-server02.sh.intel.com (HELO 94d82249bd8f) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2024 18:07:05 -0800
Received: from kbuild by 94d82249bd8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raR9Q-000068-2X;
	Thu, 15 Feb 2024 02:07:01 +0000
Date: Thu, 15 Feb 2024 10:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3 28/35] mm: percpu: enable per-cpu allocation tagging
Message-ID: <202402150930.GoWpjqXN-lkp@intel.com>
References: <20240212213922.783301-29-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-29-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-29-surenb%40google.com
patch subject: [PATCH v3 28/35] mm: percpu: enable per-cpu allocation tagging
config: x86_64-randconfig-123-20240214 (https://download.01.org/0day-ci/archive/20240215/202402150930.GoWpjqXN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240215/202402150930.GoWpjqXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402150930.GoWpjqXN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:302:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] vld_tid @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:302:22: sparse:     expected unsigned int [usertype] vld_tid
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:302:22: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:305:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pgsz_tag_clr @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:305:27: sparse:     expected unsigned int [usertype] pgsz_tag_clr
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:305:27: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:306:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_offset @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:306:25: sparse:     expected unsigned int [usertype] max_offset
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:306:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:307:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] page_offset @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:307:26: sparse:     expected unsigned int [usertype] page_offset
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:307:26: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:368:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cxgbi_ppm_pool *pools @@     got void [noderef] __percpu *[assigned] _res @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:368:15: sparse:     expected struct cxgbi_ppm_pool *pools
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:368:15: sparse:     got void [noderef] __percpu *[assigned] _res
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:374:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct cxgbi_ppm_pool * @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:374:48: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:374:48: sparse:     got struct cxgbi_ppm_pool *
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:484:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cxgbi_ppm_pool [noderef] __percpu *pool @@     got struct cxgbi_ppm_pool *[assigned] pool @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:484:19: sparse:     expected struct cxgbi_ppm_pool [noderef] __percpu *pool
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:484:19: sparse:     got struct cxgbi_ppm_pool *[assigned] pool
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:511:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct cxgbi_ppm_pool *[assigned] pool @@
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:511:21: sparse:     expected void [noderef] __percpu *__pdata
   drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:511:21: sparse:     got struct cxgbi_ppm_pool *[assigned] pool

vim +368 drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c

47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  344  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  345  static struct cxgbi_ppm_pool *ppm_alloc_cpu_pool(unsigned int *total,
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  346  						 unsigned int *pcpu_ppmax)
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  347  {
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  348  	struct cxgbi_ppm_pool *pools;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  349  	unsigned int ppmax = (*total) / num_possible_cpus();
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  350  	unsigned int max = (PCPU_MIN_UNIT_SIZE - sizeof(*pools)) << 3;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  351  	unsigned int bmap;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  352  	unsigned int alloc_sz;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  353  	unsigned int count = 0;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  354  	unsigned int cpu;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  355  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  356  	/* make sure per cpu pool fits into PCPU_MIN_UNIT_SIZE */
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  357  	if (ppmax > max)
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  358  		ppmax = max;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  359  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  360  	/* pool size must be multiple of unsigned long */
cc5a726c79158b drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c Varun Prakash 2019-04-03  361  	bmap = ppmax / BITS_PER_TYPE(unsigned long);
cc5a726c79158b drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c Varun Prakash 2019-04-03  362  	if (!bmap)
cc5a726c79158b drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c Varun Prakash 2019-04-03  363  		return NULL;
cc5a726c79158b drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c Varun Prakash 2019-04-03  364  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  365  	ppmax = (bmap * sizeof(unsigned long)) << 3;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  366  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  367  	alloc_sz = sizeof(*pools) + sizeof(unsigned long) * bmap;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14 @368  	pools = __alloc_percpu(alloc_sz, __alignof__(struct cxgbi_ppm_pool));
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  369  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  370  	if (!pools)
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  371  		return NULL;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  372  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  373  	for_each_possible_cpu(cpu) {
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  374  		struct cxgbi_ppm_pool *ppool = per_cpu_ptr(pools, cpu);
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  375  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  376  		memset(ppool, 0, alloc_sz);
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  377  		spin_lock_init(&ppool->lock);
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  378  		count += ppmax;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  379  	}
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  380  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  381  	*total = count;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  382  	*pcpu_ppmax = ppmax;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  383  
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  384  	return pools;
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  385  }
47da7e62b391a7 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ppm.c     Varun Prakash 2016-02-14  386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
