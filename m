Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE78189915
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879904; cv=none; b=S10mXDRPyjMk5jht5xcHgZB4W/9V4I10ELVg5Ru/YROSb2eLpzzWZ/MaDEF/3zOFEjnR4pL9M3qdbE1/bRnsvsTvwDO6No+TwJKrY/SOmuYNnfD9yn7+gVvNyZFuusAQCl+mrQb+JANgvq3/4rWwbTOsdKKTssjAyUa7dLVGALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879904; c=relaxed/simple;
	bh=MZmqR1VnO7ijhlHc94D3PvzmsWrrTupnZpQ9daZ6gmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLzIaQ/gBlApW4eZ8+E8SnneiECeqHzQv8g5pYfwYEiJhjhSbF3xuoyA/CG6qs3eNFV5OhzEU1hseDTyj5W3GiV6MbZiGlOYscneIkmPjIZiypO3KcJH7GbMF/A9RHaeu3Otoz2r5xHbXpTkA50gPX7L3+w5NNF40ELkUWiM6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvF9my6F; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvF9my6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744879902; x=1776415902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZmqR1VnO7ijhlHc94D3PvzmsWrrTupnZpQ9daZ6gmo=;
  b=XvF9my6FWoPara7IvapFV2NHw5qEbHa+vpVuVTdo1BiPSv8w2INX09Uj
   PH9OxCkv52e2vABd6fuLFW5nH7jOESr2lR3S2lrqmNC+fVh1/Qd2Rfrli
   F3TpNO3wmZRtSdmmZu1A0CBarhOHNSgtRV6D+sEdNkTTax64Fo2l4lbXh
   CazUOALwaPm5H6pAhGo/POaFuY56a5EearPKnzutogGwgBt8px65XJdJr
   0/49cHaV5z6ifR/XMhK2QeMRoMjoEYg56a4zRbuaQ9AUjeohdvL8CZ+QP
   bS3FP5zsJaQ19SS0qyEUsNVZunv5Y/lnD2PBLkeVm97FuMOTBLR6zbDvr
   Q==;
X-CSE-ConnectionGUID: oxcFMUeHS8aDqdximYVNzg==
X-CSE-MsgGUID: i6jbSFWsShmSmK6SmrBO0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57099669"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57099669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:51:41 -0700
X-CSE-ConnectionGUID: o2aSyOTJS0OpX20xrNM7SA==
X-CSE-MsgGUID: 01nc9iRpTlCi26F3W4MxDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135598636"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Apr 2025 01:51:40 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Ky9-000M2S-2V;
	Thu, 17 Apr 2025 08:51:37 +0000
Date: Thu, 17 Apr 2025 16:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/pgtable_share.c:436: warning:
 Function parameter or member 'mm' not described in
 'pgtable_share_find_intersection'
Message-ID: <202504171659.yijpmZhs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6d3fcc04dd313b838903cccf189d2d5a10313d80
commit: 03741e356083b8405ba50152e2d2fc988fafbc1e [9/9] anolis: mm: pgtable_share: skip m{bind,lock,remap}
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250417/202504171659.yijpmZhs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171659.yijpmZhs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171659.yijpmZhs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/pgtable_share.c:355: warning: Function parameter or member 'start' not described in 'pgtable_share_dontneed_single_vma'
   mm/pgtable_share.c:355: warning: Function parameter or member 'end' not described in 'pgtable_share_dontneed_single_vma'
>> mm/pgtable_share.c:436: warning: Function parameter or member 'mm' not described in 'pgtable_share_find_intersection'
>> mm/pgtable_share.c:436: warning: Function parameter or member 'start' not described in 'pgtable_share_find_intersection'
>> mm/pgtable_share.c:436: warning: Function parameter or member 'end' not described in 'pgtable_share_find_intersection'


vim +436 mm/pgtable_share.c

   347	
   348	/**
   349	 * pgtable_share_dontneed_single_vma - free page cache and flush
   350	 * TLB for all corresponding tasks.
   351	 * @vma: aboriginal vma which pgtable is sharable.
   352	 */
   353	long pgtable_share_dontneed_single_vma(struct vm_area_struct *vma,
   354					       unsigned long start, unsigned long end)
 > 355	{
   356		struct pgtable_share_struct *info;
   357		struct address_space *mapping;
   358		struct file *file;
   359		int error;
   360		loff_t offset;
   361	
   362		file = vma->vm_file;
   363		if ((!file) || (!file->f_mapping))
   364			return 0;
   365	
   366		/* Check pgtable share data */
   367		info = vma_get_pgtable_share_data(vma);
   368		if (!info) {
   369			pr_warn("the pgtable share data has been released!");
   370			return -EINVAL;
   371		}
   372	
   373		/*
   374		 * Each shared vma has private file mapping, nice
   375		 * to back early if no pages attached.
   376		 */
   377		mapping = file->f_mapping;
   378		if (unlikely(!mapping->nrpages))
   379			return 0;
   380	
   381		offset = (loff_t)(start - vma->vm_start)
   382				+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
   383	
   384		/*
   385		 * zap_page_range_single() will be called during
   386		 * vfs_fallocate(). It will flush each related tlb.
   387		 * This refers to MADV_REMOVE.
   388		 */
   389		get_file(file);
   390		mmap_read_unlock(vma->vm_mm);
   391		error = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
   392				      offset, end - start);
   393		fput(file);
   394		mmap_read_lock(vma->vm_mm);
   395	
   396		return 0;
   397	}
   398	
   399	bool page_is_pgtable_shared(struct page *page)
   400	{
   401		struct vm_area_struct *vma;
   402		struct address_space *mapping;
   403		pgoff_t pgoff;
   404	
   405		page = compound_head(page);
   406		if (!page_mapped(page))
   407			return false;
   408	
   409		mapping = page_mapping(page);
   410		if (!mapping)
   411			return false;
   412	
   413		pgoff = page_to_index(page);
   414	
   415		i_mmap_lock_read(mapping);
   416		vma = vma_interval_tree_iter_first(&mapping->i_mmap, pgoff, pgoff);
   417		while (vma) {
   418			if (vma_is_pgtable_shared(vma)) {
   419				i_mmap_unlock_read(mapping);
   420				return true;
   421			}
   422	
   423			vma = vma_interval_tree_iter_next(vma, pgoff, pgoff);
   424		}
   425		i_mmap_unlock_read(mapping);
   426	
   427		return false;
   428	}
   429	
   430	/**
   431	 * pgtable_share_find_intersection - check whether a range area overlap
   432	 * pgtable shared vmas exists.
   433	 */
   434	bool pgtable_share_find_intersection(struct mm_struct *mm, unsigned long start,
   435					     unsigned long end)
 > 436	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
