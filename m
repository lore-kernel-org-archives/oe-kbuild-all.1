Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B513156898
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721973462; cv=none; b=e5DLVprTdAa+iMoPCyNGGraAfcODPQsrYmcf7c+sQrzH+Aj0PasWolYPYlyNPrqI3d4fZOOofwielPIo3QWmpJbZEgVgcN5/zMRkaJdtqXsdsGQb2INFWKSHsIcg6VMTpT7H4AMBg33WZDp9JD/BKKOc0Na3n1jiu3kX1xcWuuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721973462; c=relaxed/simple;
	bh=rheDKsTIXZ1KE37ri1w4FlcM8ejQI6muYm6qarVLyos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzFra6dxH2d0B1oelTrkubRHVLFZSBG5GufS+3E2iQMFyQBCK2ebhDF2TLxwCvaNe/XwdWQajbDxA1Oek6U9z222bs5qaW4GXXXAUr3bn+yYScPuOUjxjN7IDpKoDRr7Nh2SIzx6qgjzKO6UR/ckZvMrH9KAEQSWFI9489y/06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZDhlY+X; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZDhlY+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721973460; x=1753509460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rheDKsTIXZ1KE37ri1w4FlcM8ejQI6muYm6qarVLyos=;
  b=iZDhlY+X81rNHlhpbT4spBT0w26I12gxL52W610TIpzh5AVeFDqq6KVh
   jVuAkac+Fds8nZlpVmMWq/E1hdxPcFZYTIX9rI4ZOZ7g+s923DGB1zTNe
   2sL8KZ/fx2ScQ5MUUrPLtIFuoaTD+NrTenm1whwVQVHzkO9JOJOE5XrDR
   iAxd7eutLK+97CpYEybRCLWj4buBnl++hLeoDpelmi+jrm0px94EKgh8M
   TWnCYPXsaj6c49DP1Tw+7Ivs1NDVzuicbmQqK6rikSVwaQZOxVcBs5CP6
   JcuUUHewksFIWYY6/IQLvgZt6OuRfG9jXoGXtHk9KvS0W1rq0YTlKTDJR
   A==;
X-CSE-ConnectionGUID: n47pGK7qTW+oh278dRMAIA==
X-CSE-MsgGUID: NPUr+pYWTlun3Y9bER5zSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19937351"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="19937351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 22:57:39 -0700
X-CSE-ConnectionGUID: v/XbL3Q4RjC0P8oIZD3/0A==
X-CSE-MsgGUID: bN2uGdOYQtSCmuArX+QM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="53070182"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jul 2024 22:57:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXDxQ-000oqS-2p;
	Fri, 26 Jul 2024 05:57:36 +0000
Date: Fri, 26 Jul 2024 13:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 10/10] fsnotify: generate pre-content permission event on
 page fault
Message-ID: <202407261354.JlXopMXz-lkp@intel.com>
References: <1bc2855779e7ba1d80592be7d6257b43f1a91886.1721931241.git.josef@toxicpanda.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bc2855779e7ba1d80592be7d6257b43f1a91886.1721931241.git.josef@toxicpanda.com>

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jack-fs/fsnotify]
[also build test WARNING on pcmoore-selinux/next akpm-mm/mm-everything linus/master v6.10 next-20240726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/fanotify-don-t-skip-extra-event-info-if-no-info_mode-is-set/20240726-055009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/1bc2855779e7ba1d80592be7d6257b43f1a91886.1721931241.git.josef%40toxicpanda.com
patch subject: [PATCH 10/10] fsnotify: generate pre-content permission event on page fault
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240726/202407261354.JlXopMXz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261354.JlXopMXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407261354.JlXopMXz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/filemap.c: In function 'filemap_map_pages':
>> mm/filemap.c:3636:23: warning: unused variable 'inode' [-Wunused-variable]
    3636 |         struct inode *inode = mapping->host;
         |                       ^~~~~


vim +/inode +3636 mm/filemap.c

  3629	
  3630	vm_fault_t filemap_map_pages(struct vm_fault *vmf,
  3631				     pgoff_t start_pgoff, pgoff_t end_pgoff)
  3632	{
  3633		struct vm_area_struct *vma = vmf->vma;
  3634		struct file *file = vma->vm_file;
  3635		struct address_space *mapping = file->f_mapping;
> 3636		struct inode *inode = mapping->host;
  3637		pgoff_t last_pgoff = start_pgoff;
  3638		unsigned long addr;
  3639		XA_STATE(xas, &mapping->i_pages, start_pgoff);
  3640		struct folio *folio;
  3641		vm_fault_t ret = 0;
  3642		unsigned long rss = 0;
  3643		unsigned int nr_pages = 0, mmap_miss = 0, mmap_miss_saved, folio_type;
  3644	
  3645		/*
  3646		 * We are under RCU, we can't emit events here, we need to force a
  3647		 * normal fault to make sure the events get sent.
  3648		 */
  3649		if (fsnotify_file_has_content_watches(file))
  3650			return ret;
  3651	
  3652		rcu_read_lock();
  3653		folio = next_uptodate_folio(&xas, mapping, end_pgoff);
  3654		if (!folio)
  3655			goto out;
  3656	
  3657		if (filemap_map_pmd(vmf, folio, start_pgoff)) {
  3658			ret = VM_FAULT_NOPAGE;
  3659			goto out;
  3660		}
  3661	
  3662		addr = vma->vm_start + ((start_pgoff - vma->vm_pgoff) << PAGE_SHIFT);
  3663		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, addr, &vmf->ptl);
  3664		if (!vmf->pte) {
  3665			folio_unlock(folio);
  3666			folio_put(folio);
  3667			goto out;
  3668		}
  3669	
  3670		folio_type = mm_counter_file(folio);
  3671		do {
  3672			unsigned long end;
  3673	
  3674			addr += (xas.xa_index - last_pgoff) << PAGE_SHIFT;
  3675			vmf->pte += xas.xa_index - last_pgoff;
  3676			last_pgoff = xas.xa_index;
  3677			end = folio_next_index(folio) - 1;
  3678			nr_pages = min(end, end_pgoff) - xas.xa_index + 1;
  3679	
  3680			if (!folio_test_large(folio))
  3681				ret |= filemap_map_order0_folio(vmf,
  3682						folio, addr, &rss, &mmap_miss);
  3683			else
  3684				ret |= filemap_map_folio_range(vmf, folio,
  3685						xas.xa_index - folio->index, addr,
  3686						nr_pages, &rss, &mmap_miss);
  3687	
  3688			folio_unlock(folio);
  3689			folio_put(folio);
  3690		} while ((folio = next_uptodate_folio(&xas, mapping, end_pgoff)) != NULL);
  3691		add_mm_counter(vma->vm_mm, folio_type, rss);
  3692		pte_unmap_unlock(vmf->pte, vmf->ptl);
  3693	out:
  3694		rcu_read_unlock();
  3695	
  3696		mmap_miss_saved = READ_ONCE(file->f_ra.mmap_miss);
  3697		if (mmap_miss >= mmap_miss_saved)
  3698			WRITE_ONCE(file->f_ra.mmap_miss, 0);
  3699		else
  3700			WRITE_ONCE(file->f_ra.mmap_miss, mmap_miss_saved - mmap_miss);
  3701	
  3702		return ret;
  3703	}
  3704	EXPORT_SYMBOL(filemap_map_pages);
  3705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
