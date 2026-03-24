Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8E389445
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376843; cv=none; b=p6yyzSS/AAJ0erEors5mvNFPrGUqbZRmDqNqRTLqq6mZTHqRzyCFTs37GCNFxV1l+zW/+dWIrAJAlhpRS7QXFgVAma1DX67XMzDvInBDdS3uJRB2hCqhivtaBvVsfQWOoE3HUIgnf7Jnf0POPAdIB9xRTMCZXKSv5FX1PALuh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376843; c=relaxed/simple;
	bh=0hs1I2TeWku5D54qXWqKIwlhOYprKS/EbWsqvLYaHzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNXFNGyJmtoFIxzwzWShV7FAmb/LGfYiEHxFzYgEwdXG6vcyUyMdtyV+Y8FrKB8GX2yV5WplInsNqWL6JrNtERn5gJXReifIF/liFaYfqyfMgVIK8Snvo5lncmlDDLRrW9mz9UIRcg9Z0+RogGuqBQXUw7R73cnfj/UiUF0e0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoAgyh72; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoAgyh72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774376841; x=1805912841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hs1I2TeWku5D54qXWqKIwlhOYprKS/EbWsqvLYaHzw=;
  b=EoAgyh72yi5iSSnDtZVttTlZKmLNffJ9Z6D8d8EcNtH/dqIuMJkSazI5
   Mht78iSN/58jHHtSHSci7mSDr9O2+iCsOdPP3Bp2jSZsWnsp4e1s+HWRv
   C7PWgP2FL+xv9klqHhv/aifZ3gb1d3QHTUzVsxOusoMYfCLAu1Jb8BQ8b
   dE01dngdDkTiODhF9DH5bqAeIyThYei0Bu4ATamxOhvHMBWdlX8/1mR2W
   /Jl1ffogUSyptePsP7f/ipdZ3B/8/uuubXKxK6LtXZ3KkikrQ//oN9axe
   npQ2HfUSEmfiNQ2XllbUXqF5BEcyaJUhP2gcs2lJtAEeDIMgh8pXv9wL3
   A==;
X-CSE-ConnectionGUID: pcAyWu6HTUmMQ6UmHLGI/A==
X-CSE-MsgGUID: mnRTAyM0TmGC+8KSBIFC7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79002777"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79002777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 11:26:10 -0700
X-CSE-ConnectionGUID: KSNJcsTeSZWruGaQSfHCVw==
X-CSE-MsgGUID: h/jh81IiS0qqQRBVlioShQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221552405"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2026 11:26:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w56S7-000000005CX-2LvI;
	Tue, 24 Mar 2026 18:26:07 +0000
Date: Wed, 25 Mar 2026 02:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 06/11] mm/truncate: use folio_split() in
 truncate_inode_partial_folio()
Message-ID: <202603250227.55j4syxm-lkp@intel.com>
References: <20260323190644.1714379-7-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323190644.1714379-7-ziy@nvidia.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to brauner-vfs/vfs.all kdave/for-next linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-remove-READ_ONLY_THP_FOR_FS-Kconfig-option/20260324-043510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260323190644.1714379-7-ziy%40nvidia.com
patch subject: [RFC PATCH 06/11] mm/truncate: use folio_split() in truncate_inode_partial_folio()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260325/202603250227.55j4syxm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250227.55j4syxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250227.55j4syxm-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/truncate.c: In function 'folio_split_or_unmap':
>> mm/truncate.c:189:15: error: implicit declaration of function 'folio_split'; did you mean 'folio_shift'? [-Werror=implicit-function-declaration]
     189 |         ret = folio_split(folio, min_order, split_at, NULL);
         |               ^~~~~~~~~~~
         |               folio_shift
   cc1: some warnings being treated as errors


vim +189 mm/truncate.c

   179	
   180	static int folio_split_or_unmap(struct folio *folio, struct page *split_at,
   181					    unsigned long min_order)
   182	{
   183		enum ttu_flags ttu_flags =
   184			TTU_SYNC |
   185			TTU_SPLIT_HUGE_PMD |
   186			TTU_IGNORE_MLOCK;
   187		int ret;
   188	
 > 189		ret = folio_split(folio, min_order, split_at, NULL);
   190	
   191		/*
   192		 * If the split fails, unmap the folio, so it will be refaulted
   193		 * with PTEs to respect SIGBUS semantics.
   194		 *
   195		 * Make an exception for shmem/tmpfs that for long time
   196		 * intentionally mapped with PMDs across i_size.
   197		 */
   198		if (ret && !shmem_mapping(folio->mapping)) {
   199			try_to_unmap(folio, ttu_flags);
   200			WARN_ON(folio_mapped(folio));
   201		}
   202	
   203		return ret;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
