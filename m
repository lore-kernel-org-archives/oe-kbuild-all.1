Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F361E29B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732152006; cv=none; b=IBbuAg5qrnOt4KRM8ZCkDbzZoVo9TCFl+MRJ//j6gS6Vq59pYe+KvrwflzJ/Ui73uf46JCSEkuLlMuY2QuI0kWZshhSW1113+bLW3koOoIbfMj2O1Ml9Ja1mqzm6AjymK4gXoEg5w83vpjOG/oUlS6o+M7hVsyWZ6ubCWIaOcEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732152006; c=relaxed/simple;
	bh=HbPYGIq+Rix6gMdTwevLzr+4oAjUftNhj6KNqxSqVlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZy8H4oTrWBD+WNBlPd93eUZoqAhugo3hPemKARMSNyx/loySyuUStIhpu22UuTuoFp7KjqCPn+LLgPcOpLjUp/69RfkkOSVkkMYHNkSA7AMkjcfOllY/LPcbcvhqKNAsXGe3ynxLEnMSLGa40O/RAz91qBrVv1tlqvslM3H9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1G1U0Is; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1G1U0Is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732152005; x=1763688005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HbPYGIq+Rix6gMdTwevLzr+4oAjUftNhj6KNqxSqVlc=;
  b=a1G1U0Is7TlHQmniZ53++gZi7uSG/0TsFPohY62nxcd8K8VnxSdruezM
   A7n1YCDRIuOl5fYS8LQcPsHt5OSY9/vCx3sX5dLPeCaKRQOxBkr/8xSpK
   J8vE2nA6uont8tYQKJGX20MKMVdC3z3Tu4XERhX7pyIMqIuLBoLTvpMzt
   Xr9fEqaDuJ4jz5v42X1hW0MQ5npPuq7t4+iN0/yZ9iG1sbWPfy1IQQOjl
   tkZVj0PUInG08jnKPSbV0LjbIGyI31HDnO8oSqfH0/qn6t3smyxAyzbQK
   0XnkpMPPyaayc1hVdK1UW9VT0O/nUGX2UmubkP6BVGFRgVgJ+gZFK2E63
   A==;
X-CSE-ConnectionGUID: HH6SCqV6Qw6UA2hRQyiIaA==
X-CSE-MsgGUID: ZTr0NQ29Ryuwvg4XChnbQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31606586"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="31606586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 17:20:05 -0800
X-CSE-ConnectionGUID: TdC7sww/RQOf3P01bRBEUA==
X-CSE-MsgGUID: Vgv/Do4GTAepf9uqwkrWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90076891"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2024 17:20:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDvrV-0001H5-0q;
	Thu, 21 Nov 2024 01:20:01 +0000
Date: Thu, 21 Nov 2024 09:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 3/4] mm/memory.c:5450:27: error:
 'NUMA_HINT_FAULTS' undeclared
Message-ID: <202411210932.8wgnp6gH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   22a918e8984faca048ec24295ed20e91b682a03e
commit: 425aa488c12121665243fbb89d75a0f6312fa28a [3/4] vmstat: add page-cache numa hints
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241121/202411210932.8wgnp6gH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210932.8wgnp6gH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210932.8wgnp6gH-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'numa_migrate_check':
>> mm/memory.c:5450:27: error: 'NUMA_HINT_FAULTS' undeclared (first use in this function)
    5450 |         int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
         |                           ^~~~~~~~~~~~~~~~
   mm/memory.c:5450:27: note: each undeclared identifier is reported only once for each function it appears in
>> mm/memory.c:5450:46: error: 'NUMA_HINT_PAGE_CACHE' undeclared (first use in this function)
    5450 |         int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
         |                                              ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/NUMA_HINT_FAULTS +5450 mm/memory.c

  5445	
  5446	int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
  5447			      unsigned long addr, int *flags,
  5448			      bool writable, int *last_cpupid)
  5449	{
> 5450		int event = vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE;
  5451	
  5452		if (vmf) {
  5453			struct vm_area_struct *vma = vmf->vma;
  5454			const vm_flags_t vmflags = vma->vm_flags;
  5455	
  5456			/*
  5457			 * Flag if the folio is shared between multiple address spaces.
  5458			 * This used later when determining whether to group tasks.
  5459			 */
  5460			if (folio_likely_mapped_shared(folio))
  5461				*flags |= vmflags & VM_SHARED ? TNF_SHARED : 0;
  5462	
  5463			/* Record the current PID acceesing VMA */
  5464			vma_set_access_pid_bit(vma);
  5465		}
  5466	
  5467		/*
  5468		 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
  5469		 * much anyway since they can be in shared cache state. This misses
  5470		 * the case where a mapping is writable but the process never writes
  5471		 * to it but pte_write gets cleared during protection updates and
  5472		 * pte_dirty has unpredictable behaviour between PTE scan updates,
  5473		 * background writeback, dirty balancing and application behaviour.
  5474		 */
  5475		if (!writable)
  5476			*flags |= TNF_NO_GROUP;
  5477	
  5478		/*
  5479		 * For memory tiering mode, cpupid of slow memory page is used
  5480		 * to record page access time.  So use default value.
  5481		 */
  5482		if (folio_use_access_time(folio))
  5483			*last_cpupid = (-1 & LAST_CPUPID_MASK);
  5484		else
  5485			*last_cpupid = folio_last_cpupid(folio);
  5486	
  5487		numa_migrate_hint_event(folio, event, flags);
  5488	
  5489		return mpol_misplaced(folio, vmf, addr);
  5490	}
  5491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
