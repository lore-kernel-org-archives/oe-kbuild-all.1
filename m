Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85B81BDC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723295837; cv=none; b=ToKeB+PzrrNARqCjEBgQgTavOkg2TntaE2dIksDVaTRthbWgXsvcx6rSEkYLsGQEfv3NdM5pK1R8/pNdKmxS7HWA7UKaKC+o7+SKaKwzXf90xjdQYq5iJjkXfDDR3XLFW5z6AIE7w6azGIXH4VwN96Iyuxr+7NqDRNyYzC1fFjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723295837; c=relaxed/simple;
	bh=uF/znA5BDj/9r+RFxkoZl19ioZy/Ah/9R0VoZNna2n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nErAhDs+QK+tKMFk4OpAt1mDs9PiW8Y9rp6Ura7TcR8UsZnjWeo2qTvjogya62RXfql3uKFp16ghJDyIgk/CTfORDMlrGqHtyhT285VDtdWUsWTwhbDns/PmvangPtq7656UBg5PsrC/N2VAdr9tq8hLiZ4ahMOXB6uqbuADtEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgeZP54m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgeZP54m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723295835; x=1754831835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uF/znA5BDj/9r+RFxkoZl19ioZy/Ah/9R0VoZNna2n0=;
  b=kgeZP54mhnLK0JdGJnwrnCVLXpqOG2Zghv3HX7gnRot4HUMN33pz/aI9
   uMh1aesCB2bI5wXEV6rXXQipIhf3o0CifTyHCTeTPtm5GN1+K3qMDShEU
   LuyVYKhjfWDLWgpmxDir1qH8IeD27++9TLCDO/VeK7sknlw50Fwn5X+RT
   O73gQve2nA0auFKNcG29P3ME1moaSv0NoriEH3b/GirMaU/NunhUw1h0k
   z+0s4gzi7bB8G05UL1PwwP3xNCkAo/tdPexYOdfDngMzAvdfItB2fPg0t
   x8kxFlQb7vDluXgPIsZ9mMFQVqOBJd140A5X5PaEikrybNqU0bP6ntWkh
   Q==;
X-CSE-ConnectionGUID: Gt36q8OqSYGBrS0wUd9jag==
X-CSE-MsgGUID: vitPtmjPRYW/fbRpr0sTkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32608771"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="32608771"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 06:17:14 -0700
X-CSE-ConnectionGUID: ZAkCaMTvTW+1izSEtRPrLQ==
X-CSE-MsgGUID: s+G0lDqhRdeM2aVqWIz4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57726140"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 10 Aug 2024 06:17:14 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scly0-0009xF-1N;
	Sat, 10 Aug 2024 13:17:10 +0000
Date: Sat, 10 Aug 2024 21:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: kaiyang2@cs.cmu.edu
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm,memcg: provide per-cgroup counters for NUMA balancing
 operations
Message-ID: <202408102151.wgqnH7OW-lkp@intel.com>
References: <20240809212115.59291-1-kaiyang2@cs.cmu.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809212115.59291-1-kaiyang2@cs.cmu.edu>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/kaiyang2-cs-cmu-edu/mm-memcg-provide-per-cgroup-counters-for-NUMA-balancing-operations/20240810-115614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240809212115.59291-1-kaiyang2%40cs.cmu.edu
patch subject: [PATCH] mm,memcg: provide per-cgroup counters for NUMA balancing operations
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240810/202408102151.wgqnH7OW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408102151.wgqnH7OW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408102151.wgqnH7OW-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'numa_migrate_prep':
>> mm/memory.c:5376:41: error: 'NUMA_HINT_FAULTS' undeclared (first use in this function)
    5376 |         count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
         |                                         ^~~~~~~~~~~~~~~~
   mm/memory.c:5376:41: note: each undeclared identifier is reported only once for each function it appears in


vim +/NUMA_HINT_FAULTS +5376 mm/memory.c

  5366	
  5367	int numa_migrate_prep(struct folio *folio, struct vm_fault *vmf,
  5368			      unsigned long addr, int page_nid, int *flags)
  5369	{
  5370		struct vm_area_struct *vma = vmf->vma;
  5371	
  5372		/* Record the current PID acceesing VMA */
  5373		vma_set_access_pid_bit(vma);
  5374	
  5375		count_vm_numa_event(NUMA_HINT_FAULTS);
> 5376		count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
  5377		if (page_nid == numa_node_id()) {
  5378			count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
  5379			*flags |= TNF_FAULT_LOCAL;
  5380		}
  5381	
  5382		return mpol_misplaced(folio, vmf, addr);
  5383	}
  5384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
