Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2321A435
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532484; cv=none; b=SgoTqvlTHzoP+m+jCOuSPocKowB4W3aVpBJKT5LqjIlCWUKfHbZTTQrrMY7HH/YWnMNbf/JxoaBanHeR14WeTekRW9eHIek5ZXuNyPTYVNKsaXb5dQxrMg0ZMw7zYq32sZ7QiDKWUFLrK5cqXCst58Yq9ZXmdJVP+bnQ7KI6czw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532484; c=relaxed/simple;
	bh=Bfp6q6XckVMACTaf/7cspoXCrbaH7mnDR8albklGoXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSxDfN9v0eMju07LG3MVqTihqm8CTTo2+L7wDIoM5AXv0jzVlvWZp+Gkf+zNmkx7X9WggfMARgvFM/9SP8kQuK4/Iq4AX1OkcESL4cbHH87kmmFA9Cy80Ugg05MuIULy6O0yCmrHRMArrfcnCaQtET9Bl9Ngzqnrkdq+5gDP8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Afjl3yHQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Afjl3yHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739532483; x=1771068483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bfp6q6XckVMACTaf/7cspoXCrbaH7mnDR8albklGoXc=;
  b=Afjl3yHQSSqKx1z+3hVS/Wcm+09VhcZJkbKLFbfhsYolarPYeEpiCwkh
   u5+RDolE5g6h6q3VIC5nGO7l8QJDAGvTF7kKcDVS9xrWhHJAqUFSQ1Hv9
   7OmkbLa0tBZ0wnhQzsua/IdWlJb4SyGGIT7DWceQiC1qhHaM35Pwv2ghX
   hGGjBgisP7+NnGcS+b8TiASWhNz+8/qlm2yQ/8FQcq6iX81xexOoFiScd
   PYJEEZFsV2QfMc0QZmDB8dPdBMAZXv2BdqQMx6NUAPJ7aJL1HJ7o56DnJ
   ywvn+GaM1SzXWdoUfoaYgxIrrojYmAoeoV6OzRc4kYWRmdeM46wN7JtIc
   Q==;
X-CSE-ConnectionGUID: Zx+D81djSVumESsCVvNfaA==
X-CSE-MsgGUID: HLDQH71LQEmSWngbeUuSPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39507590"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="39507590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:28:03 -0800
X-CSE-ConnectionGUID: rAnJDM9lRBS+Entu3jBIVw==
X-CSE-MsgGUID: 7QI2WpNeR7O/E/liCjfWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113412718"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2025 03:28:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1titrT-0019Rj-0m;
	Fri, 14 Feb 2025 11:27:59 +0000
Date: Fri, 14 Feb 2025 19:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] mm/shmem.c:2180:12: warning: no
 previous prototype for function 'shmem_fault'
Message-ID: <202502141908.8QNXt8EB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f5f3d8adea0b03d717cfae3142cf77d09cd2d041
commit: db302359ea1b5252a28abcb23a382be91c961ac0 [1/1] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250214/202502141908.8QNXt8EB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141908.8QNXt8EB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141908.8QNXt8EB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2180:12: warning: no previous prototype for function 'shmem_fault' [-Wmissing-prototypes]
    2180 | vm_fault_t shmem_fault(struct vm_fault *vmf)
         |            ^
   mm/shmem.c:2180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2180 | vm_fault_t shmem_fault(struct vm_fault *vmf)
         | ^
         | static 
   1 warning generated.


vim +/shmem_fault +2180 mm/shmem.c

  2179	
> 2180	vm_fault_t shmem_fault(struct vm_fault *vmf)
  2181	{
  2182		struct vm_area_struct *vma = vmf->vma;
  2183		struct inode *inode = file_inode(vma->vm_file);
  2184		gfp_t gfp = mapping_gfp_mask(inode->i_mapping);
  2185		struct folio *folio = NULL;
  2186		int err;
  2187		vm_fault_t ret = VM_FAULT_LOCKED;
  2188	
  2189		/*
  2190		 * Trinity finds that probing a hole which tmpfs is punching can
  2191		 * prevent the hole-punch from ever completing: which in turn
  2192		 * locks writers out with its hold on i_rwsem.  So refrain from
  2193		 * faulting pages into the hole while it's being punched.  Although
  2194		 * shmem_undo_range() does remove the additions, it may be unable to
  2195		 * keep up, as each new page needs its own unmap_mapping_range() call,
  2196		 * and the i_mmap tree grows ever slower to scan if new vmas are added.
  2197		 *
  2198		 * It does not matter if we sometimes reach this check just before the
  2199		 * hole-punch begins, so that one fault then races with the punch:
  2200		 * we just need to make racing faults a rare case.
  2201		 *
  2202		 * The implementation below would be much simpler if we just used a
  2203		 * standard mutex or completion: but we cannot take i_rwsem in fault,
  2204		 * and bloating every shmem inode for this unlikely case would be sad.
  2205		 */
  2206		if (unlikely(inode->i_private)) {
  2207			struct shmem_falloc *shmem_falloc;
  2208	
  2209			spin_lock(&inode->i_lock);
  2210			shmem_falloc = inode->i_private;
  2211			if (shmem_falloc &&
  2212			    shmem_falloc->waitq &&
  2213			    vmf->pgoff >= shmem_falloc->start &&
  2214			    vmf->pgoff < shmem_falloc->next) {
  2215				struct file *fpin;
  2216				wait_queue_head_t *shmem_falloc_waitq;
  2217				DEFINE_WAIT_FUNC(shmem_fault_wait, synchronous_wake_function);
  2218	
  2219				ret = VM_FAULT_NOPAGE;
  2220				fpin = maybe_unlock_mmap_for_io(vmf, NULL);
  2221				if (fpin)
  2222					ret = VM_FAULT_RETRY;
  2223	
  2224				shmem_falloc_waitq = shmem_falloc->waitq;
  2225				prepare_to_wait(shmem_falloc_waitq, &shmem_fault_wait,
  2226						TASK_UNINTERRUPTIBLE);
  2227				spin_unlock(&inode->i_lock);
  2228				schedule();
  2229	
  2230				/*
  2231				 * shmem_falloc_waitq points into the shmem_fallocate()
  2232				 * stack of the hole-punching task: shmem_falloc_waitq
  2233				 * is usually invalid by the time we reach here, but
  2234				 * finish_wait() does not dereference it in that case;
  2235				 * though i_lock needed lest racing with wake_up_all().
  2236				 */
  2237				spin_lock(&inode->i_lock);
  2238				finish_wait(shmem_falloc_waitq, &shmem_fault_wait);
  2239				spin_unlock(&inode->i_lock);
  2240	
  2241				if (fpin)
  2242					fput(fpin);
  2243				return ret;
  2244			}
  2245			spin_unlock(&inode->i_lock);
  2246		}
  2247	
  2248		err = shmem_get_folio_gfp(inode, vmf->pgoff, &folio, SGP_CACHE,
  2249					  gfp, vma, vmf, &ret);
  2250		if (err)
  2251			return vmf_error(err);
  2252		if (folio)
  2253			vmf->page = folio_file_page(folio, vmf->pgoff);
  2254		return ret;
  2255	}
  2256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
