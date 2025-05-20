Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4F8281525
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769368; cv=none; b=PRzt6BOhaPUwuqUFkL1k986uhTKg9gSgsXFiavK6kfDwNrB6Emyc6WcUs6egh7RttDEk4A4aPEKyVq6K/XUKUITxdI96E42byvwgdGZgvPaIOJdMR5AGNLqEGi2fqsgxNgsE9Z/TXJZaKzGrNPbNho07s/CZhMMVWQWjBN0N9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769368; c=relaxed/simple;
	bh=lTYpza9yt5+8QnZBOV26bZqla+6vl3LKFg0nbqXL6EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUsRdl0mgmRlEwHi9nc3vNGFCvBrYsSWz82CzSQZuFnKQdZmKzQ1Yl6/OVOc5RqqMcYH5ktgBYzM4ZetnDxprAaNJTgMdWWwF0OKKy7ZDIiBpHcSz5toGYpj7wERTzJoHu43mOiyLxA0F9dH/+36niXu5FFuxUS8j6nvpC6WYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7GEpF6T; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7GEpF6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747769366; x=1779305366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lTYpza9yt5+8QnZBOV26bZqla+6vl3LKFg0nbqXL6EQ=;
  b=U7GEpF6T9SRvcyVG7GEeZAu+L07GrhAq1lD7HRyGhsN39BDjvNd6CkfJ
   3AsCqjZkLzq0YM3dR2m9Ij7LXHxW5sb9lCNwN9minUUTPX8HrS83Nrw8i
   m+FCV+rgFhTGN5EEb3lFJnadQ1IX8qPq0hizKBMkeTR6lfdj90h3g+2ii
   73pva2qzPvF7IdfgeExc2L5w1EPMrLaFfQp8gTOk6sPf7Vsn9GWmRC0nl
   MWUNz3bkHXtGcmMWm14zaC3znhJV99VqdT5vKq1a2WPz9ks+IXU2rHrhW
   tQHVg4tmfC20VQnubWdRrldrdL0XiX7hZg4BOXb840bmQS0dPR0BW3F1S
   A==;
X-CSE-ConnectionGUID: k5OB04n+Rqy4+1TsF++GLQ==
X-CSE-MsgGUID: M0sajs6NSJ2eZmK7+GSftg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67279144"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67279144"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 12:29:26 -0700
X-CSE-ConnectionGUID: Vhl9NGuIQaWWu/8qmuKAlw==
X-CSE-MsgGUID: nVoZzUJmTcqVa+28WpN/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="145047299"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2025 12:29:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHSeR-000NV2-09;
	Tue, 20 May 2025 19:29:23 +0000
Date: Wed, 21 May 2025 03:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/5] mm/madvise: add PMADV_NO_ERROR_ON_UNMAPPED
 process_madvise() flag
Message-ID: <202505210322.vb8tP6T7-lkp@intel.com>
References: <0e7d82b8e8f4ac58d51c18fc059ea2ca235df47c.1747686021.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7d82b8e8f4ac58d51c18fc059ea2ca235df47c.1747686021.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20250516]
[cannot apply to linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-madvise-refactor-madvise_populate/20250520-045528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/0e7d82b8e8f4ac58d51c18fc059ea2ca235df47c.1747686021.git.lorenzo.stoakes%40oracle.com
patch subject: [RFC PATCH 3/5] mm/madvise: add PMADV_NO_ERROR_ON_UNMAPPED process_madvise() flag
config: parisc-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210322.vb8tP6T7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210322.vb8tP6T7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210322.vb8tP6T7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'madvise_populate':
   mm/madvise.c:969:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
     969 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c:969:48: note: each undeclared identifier is reported only once for each function it appears in
   mm/madvise.c: In function 'madvise_vma_behavior':
   mm/madvise.c:1374:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1374 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'madvise_inject_error':
   mm/madvise.c:1393:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1393 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'madvise_do_behavior':
>> mm/madvise.c:1755:57: error: 'PMADV_NO_ERROR_ON_UNMAPPED' undeclared (first use in this function)
    1755 |         bool err_on_unmapped = !(madv_behavior->flags & PMADV_NO_ERROR_ON_UNMAPPED);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'vector_madvise':
   mm/madvise.c:1884:33: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1884 |         bool can_skip = flags & PMADV_SKIP_ERRORS;
         |                                 ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'check_process_madvise_flags':
   mm/madvise.c:1954:29: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1954 |         unsigned int mask = PMADV_SKIP_ERRORS | PMADV_NO_ERROR_ON_UNMAPPED;
         |                             ^~~~~~~~~~~~~~~~~
   mm/madvise.c:1954:49: error: 'PMADV_NO_ERROR_ON_UNMAPPED' undeclared (first use in this function)
    1954 |         unsigned int mask = PMADV_SKIP_ERRORS | PMADV_NO_ERROR_ON_UNMAPPED;
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/PMADV_NO_ERROR_ON_UNMAPPED +1755 mm/madvise.c

  1746	
  1747	static int madvise_do_behavior(struct mm_struct *mm,
  1748			unsigned long start, size_t len_in,
  1749			struct madvise_behavior *madv_behavior)
  1750	{
  1751		int behavior = madv_behavior->behavior;
  1752		struct blk_plug plug;
  1753		unsigned long end;
  1754		int error;
> 1755		bool err_on_unmapped = !(madv_behavior->flags & PMADV_NO_ERROR_ON_UNMAPPED);
  1756	
  1757		if (is_memory_failure(behavior))
  1758			return madvise_inject_error(madv_behavior, start,
  1759						    start + len_in);
  1760		start = untagged_addr_remote(mm, start);
  1761		end = start + PAGE_ALIGN(len_in);
  1762	
  1763		blk_start_plug(&plug);
  1764		if (is_madvise_populate(behavior))
  1765			error = madvise_populate(mm, start, end, madv_behavior);
  1766		else
  1767			error = madvise_walk_vmas(mm, start, end, err_on_unmapped,
  1768						  madv_behavior, madvise_vma_behavior);
  1769		blk_finish_plug(&plug);
  1770		return error;
  1771	}
  1772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
