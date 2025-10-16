Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24BB24C068
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 05:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760593389; cv=none; b=BDa0kTCIjO9sakHAeV9cy9Aty2mN3dnonHoZnyyWhcx7biOajKyyq9hJwE4Yc0lhjh5JxgO05/tv6Lhi7KU1XAWbiWdeC2uJ/iDC59SaCdfSDhMoY2SM6hYWOzzyXCZEfpQJEmUXnRQhlVLsFx5ZKIJmhSdVR4JREhiS25W1zS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760593389; c=relaxed/simple;
	bh=TNnbLC4Z7UT3K+md/xXKycNZBfxs8G7TlbZWYpPqPlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntGez/CCuWsN5ITj8qL4TgHmiuEhNHvJ5EqdLZBfwGfDtLJ9xxsOjd8sszsb4yUHuZ+KH5wOlsZaSL0EylAToQyjNUC/r8Q39aLiU83T/WjjhxWozr51yM8c85notfEirgTM7SCgt3zJkxPVRQN6F3XPfVUBJdO2iMCkHlLtOYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWIlYO+1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWIlYO+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760593388; x=1792129388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TNnbLC4Z7UT3K+md/xXKycNZBfxs8G7TlbZWYpPqPlg=;
  b=kWIlYO+1nKyI8iahy5iCjoekNUzLPC7mAF+g3eq/hMPz6xR+JisJxeR7
   GtPHcp4ilZaN0ETPUsdO77x9O9hea+zaMy2TtN1n5nO1r1YCwZ5FNN+ue
   OmY3eKaSX1GuLStD/it8YZUjZzT/HqAbX6ErFak64c9x7/gL4oKf6lhnn
   7RB0to25ow0yTKKmZvLwdieDyLZrB1zX8rO8t5ZrrVxuPsZ9/UMC2V6Oq
   Py6SpLTovqa0YNvIqCrwrMLs5E8V04D1H6B4MZda8XrCzwBl8IuAHle2E
   BFVO/tmovM+vo5uf6xOf8rjiCmatbdDWZ8X7yjIq5olboDHc/GplznLVN
   A==;
X-CSE-ConnectionGUID: WLdzh59KQzSKqU8E4oWKsA==
X-CSE-MsgGUID: ct+w0qkVQ4eZSAXLymsTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62926562"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62926562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 22:43:08 -0700
X-CSE-ConnectionGUID: f1LTyEJDQAWZgOoRAFNM1g==
X-CSE-MsgGUID: ZRdnBHTySsygk0vzMWbhsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182764967"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2025 22:43:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9GlU-0004UP-0X;
	Thu, 16 Oct 2025 05:43:04 +0000
Date: Thu, 16 Oct 2025 13:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v10 mm-new 3/9] mm: thp: add support for BPF based
 THP order selection
Message-ID: <202510161305.1QPY83vr-lkp@intel.com>
References: <20251015141716.887-4-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015141716.887-4-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-thp-remove-vm_flags-parameter-from-khugepaged_enter_vma/20251015-222537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251015141716.887-4-laoar.shao%40gmail.com
patch subject: [RFC PATCH v10 mm-new 3/9] mm: thp: add support for BPF based THP order selection
config: x86_64-buildonly-randconfig-003-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161305.1QPY83vr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161305.1QPY83vr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161305.1QPY83vr-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mmap.c: In function 'dup_mmap':
>> mm/mmap.c:1844:17: error: implicit declaration of function 'bpf_thp_fork' [-Wimplicit-function-declaration]
    1844 |                 bpf_thp_fork(mm, oldmm);
         |                 ^~~~~~~~~~~~
--
   kernel/fork.c: In function '__mmput':
>> kernel/fork.c:1133:9: error: implicit declaration of function 'bpf_thp_exit_mm' [-Wimplicit-function-declaration]
    1133 |         bpf_thp_exit_mm(mm);
         |         ^~~~~~~~~~~~~~~
--
   fs/exec.c: In function 'exec_mmap':
>> fs/exec.c:893:9: error: implicit declaration of function 'bpf_thp_retain_mm' [-Wimplicit-function-declaration]
     893 |         bpf_thp_retain_mm(mm, old_mm);
         |         ^~~~~~~~~~~~~~~~~


vim +/bpf_thp_fork +1844 mm/mmap.c

  1715	
  1716	__latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
  1717	{
  1718		struct vm_area_struct *mpnt, *tmp;
  1719		int retval;
  1720		unsigned long charge = 0;
  1721		LIST_HEAD(uf);
  1722		VMA_ITERATOR(vmi, mm, 0);
  1723	
  1724		if (mmap_write_lock_killable(oldmm))
  1725			return -EINTR;
  1726		flush_cache_dup_mm(oldmm);
  1727		uprobe_dup_mmap(oldmm, mm);
  1728		/*
  1729		 * Not linked in yet - no deadlock potential:
  1730		 */
  1731		mmap_write_lock_nested(mm, SINGLE_DEPTH_NESTING);
  1732	
  1733		/* No ordering required: file already has been exposed. */
  1734		dup_mm_exe_file(mm, oldmm);
  1735	
  1736		mm->total_vm = oldmm->total_vm;
  1737		mm->data_vm = oldmm->data_vm;
  1738		mm->exec_vm = oldmm->exec_vm;
  1739		mm->stack_vm = oldmm->stack_vm;
  1740	
  1741		/* Use __mt_dup() to efficiently build an identical maple tree. */
  1742		retval = __mt_dup(&oldmm->mm_mt, &mm->mm_mt, GFP_KERNEL);
  1743		if (unlikely(retval))
  1744			goto out;
  1745	
  1746		mt_clear_in_rcu(vmi.mas.tree);
  1747		for_each_vma(vmi, mpnt) {
  1748			struct file *file;
  1749	
  1750			vma_start_write(mpnt);
  1751			if (mpnt->vm_flags & VM_DONTCOPY) {
  1752				retval = vma_iter_clear_gfp(&vmi, mpnt->vm_start,
  1753							    mpnt->vm_end, GFP_KERNEL);
  1754				if (retval)
  1755					goto loop_out;
  1756	
  1757				vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
  1758				continue;
  1759			}
  1760			charge = 0;
  1761			/*
  1762			 * Don't duplicate many vmas if we've been oom-killed (for
  1763			 * example)
  1764			 */
  1765			if (fatal_signal_pending(current)) {
  1766				retval = -EINTR;
  1767				goto loop_out;
  1768			}
  1769			if (mpnt->vm_flags & VM_ACCOUNT) {
  1770				unsigned long len = vma_pages(mpnt);
  1771	
  1772				if (security_vm_enough_memory_mm(oldmm, len)) /* sic */
  1773					goto fail_nomem;
  1774				charge = len;
  1775			}
  1776	
  1777			tmp = vm_area_dup(mpnt);
  1778			if (!tmp)
  1779				goto fail_nomem;
  1780			retval = vma_dup_policy(mpnt, tmp);
  1781			if (retval)
  1782				goto fail_nomem_policy;
  1783			tmp->vm_mm = mm;
  1784			retval = dup_userfaultfd(tmp, &uf);
  1785			if (retval)
  1786				goto fail_nomem_anon_vma_fork;
  1787			if (tmp->vm_flags & VM_WIPEONFORK) {
  1788				/*
  1789				 * VM_WIPEONFORK gets a clean slate in the child.
  1790				 * Don't prepare anon_vma until fault since we don't
  1791				 * copy page for current vma.
  1792				 */
  1793				tmp->anon_vma = NULL;
  1794			} else if (anon_vma_fork(tmp, mpnt))
  1795				goto fail_nomem_anon_vma_fork;
  1796			vm_flags_clear(tmp, VM_LOCKED_MASK);
  1797			/*
  1798			 * Copy/update hugetlb private vma information.
  1799			 */
  1800			if (is_vm_hugetlb_page(tmp))
  1801				hugetlb_dup_vma_private(tmp);
  1802	
  1803			/*
  1804			 * Link the vma into the MT. After using __mt_dup(), memory
  1805			 * allocation is not necessary here, so it cannot fail.
  1806			 */
  1807			vma_iter_bulk_store(&vmi, tmp);
  1808	
  1809			mm->map_count++;
  1810	
  1811			if (tmp->vm_ops && tmp->vm_ops->open)
  1812				tmp->vm_ops->open(tmp);
  1813	
  1814			file = tmp->vm_file;
  1815			if (file) {
  1816				struct address_space *mapping = file->f_mapping;
  1817	
  1818				get_file(file);
  1819				i_mmap_lock_write(mapping);
  1820				if (vma_is_shared_maywrite(tmp))
  1821					mapping_allow_writable(mapping);
  1822				flush_dcache_mmap_lock(mapping);
  1823				/* insert tmp into the share list, just after mpnt */
  1824				vma_interval_tree_insert_after(tmp, mpnt,
  1825						&mapping->i_mmap);
  1826				flush_dcache_mmap_unlock(mapping);
  1827				i_mmap_unlock_write(mapping);
  1828			}
  1829	
  1830			if (!(tmp->vm_flags & VM_WIPEONFORK))
  1831				retval = copy_page_range(tmp, mpnt);
  1832	
  1833			if (retval) {
  1834				mpnt = vma_next(&vmi);
  1835				goto loop_out;
  1836			}
  1837		}
  1838		/* a new mm has just been created */
  1839		retval = arch_dup_mmap(oldmm, mm);
  1840	loop_out:
  1841		vma_iter_free(&vmi);
  1842		if (!retval) {
  1843			mt_set_in_rcu(vmi.mas.tree);
> 1844			bpf_thp_fork(mm, oldmm);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
