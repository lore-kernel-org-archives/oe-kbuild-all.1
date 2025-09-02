Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4302E2846
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756842405; cv=none; b=rQf21QypDA2or5tMX4JcerOZWJXegGlBWvmix+rNFI02XWNCion4uChe9746tOZUs4+ybN6BKNurM+2Uhd8ATIwovAogk+/6qr1vRg0aI6iS11oQxR5X7R0ipGGAaDkV4GTkBKyTA1NLHt06qJAtm69r6A2mdjPvy0fGhppDGjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756842405; c=relaxed/simple;
	bh=zRy0DAZFgMiP7GYmxbyjuD/eGzMInt5FBbU+Nye7QrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7VwR8HDqpJ+jpsCMDsOv40H7w3hXdWhjdO0dY3TlSLjuy5zsKnqD8CyHuhJ/zLeyGha8vM2mgN+AYnFcnPl6HHNw7ckCqX0ysEhopg9825381O6wOUshXbgrIK0FS6JAxLAkRpaZ90ZLkD2IBNS3QqAYqzwDu3ugtwcDpJvAPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcLzSiSU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcLzSiSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756842404; x=1788378404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zRy0DAZFgMiP7GYmxbyjuD/eGzMInt5FBbU+Nye7QrI=;
  b=bcLzSiSUMwJRaI1uzTO4m0jAeX/unXW5AAkNVR9rj1qllRSaoRcunEwg
   TeJZxAmiqzthQj8o7teKDi8BBvGCVgeCgQrAmH51qRd/40Gf9fD3sUzUF
   5IgMvdZqIPEzDdA3W/34iYHdNRFi2dApdRWSl84NiFRGXjtfArwDZISgG
   x/hoE5zXPQycFhi5dmycMHrauIa3zym4L5G/VAnYn+NWKKoq0IA5nVYLO
   N8NQV3i4nWURNh/xPOEgyNhNZcou21Cy9if8sLW5P9lB7TECteWcXcqWa
   5d9AvPf/HZjasndXt7K8LqZKTnw8b8Oo4hpN6cAR1Wf2Tr97Lhlg69azo
   w==;
X-CSE-ConnectionGUID: La76vP5GT5WLy8OuEUVS7g==
X-CSE-MsgGUID: TzxKcUKtTY63o0v0A9gJkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62966112"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62966112"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 12:46:43 -0700
X-CSE-ConnectionGUID: x2st/9FlRMSZvdRndu6cOw==
X-CSE-MsgGUID: uZoPtHYqQOGE70FRtVBomA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="170645854"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 12:46:39 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utWxf-0002yb-2t;
	Tue, 02 Sep 2025 19:46:35 +0000
Date: Wed, 3 Sep 2025 03:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	david@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
	peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, willy@infradead.org, raghavendra.kt@amd.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	ankur.a.arora@oracle.com
Subject: Re: [PATCH v6 13/15] mm: memory: support clearing page ranges
Message-ID: <202509030344.SZCI0AIf-lkp@intel.com>
References: <20250902080816.3715913-14-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902080816.3715913-14-ankur.a.arora@oracle.com>

Hi Ankur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankur-Arora/perf-bench-mem-Remove-repetition-around-time-measurement/20250902-161417
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250902080816.3715913-14-ankur.a.arora%40oracle.com
patch subject: [PATCH v6 13/15] mm: memory: support clearing page ranges
config: i386-randconfig-014-20250903 (https://download.01.org/0day-ci/archive/20250903/202509030344.SZCI0AIf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030344.SZCI0AIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030344.SZCI0AIf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'clear_contig_highpages':
   mm/memory.c:7165:38: error: implicit declaration of function 'nth_page'; did you mean 'pte_page'? [-Werror=implicit-function-declaration]
    7165 |                 clear_user_highpages(nth_page(page, i),
         |                                      ^~~~~~~~
         |                                      pte_page
>> mm/memory.c:7165:38: warning: passing argument 1 of 'clear_user_highpages' makes pointer from integer without a cast [-Wint-conversion]
    7165 |                 clear_user_highpages(nth_page(page, i),
         |                                      ^~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/mm_inline.h:8,
                    from mm/memory.c:44:
   include/linux/highmem.h:211:54: note: expected 'struct page *' but argument is of type 'int'
     211 | static inline void clear_user_highpages(struct page *page, unsigned long vaddr,
         |                                         ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/clear_user_highpages +7165 mm/memory.c

  7151	
  7152	/*
  7153	 * Clear contiguous pages chunking them up when running under
  7154	 * non-preemptible models.
  7155	 */
  7156	static void clear_contig_highpages(struct page *page, unsigned long addr,
  7157					   unsigned int npages)
  7158	{
  7159		unsigned int i, count, unit;
  7160	
  7161		unit = preempt_model_preemptible() ? npages : PAGE_CONTIG_NR;
  7162	
  7163		for (i = 0; i < npages; ) {
  7164			count = min(unit, npages - i);
> 7165			clear_user_highpages(nth_page(page, i),
  7166					     addr + i * PAGE_SIZE, count);
  7167			i += count;
  7168			cond_resched();
  7169		}
  7170	}
  7171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
