Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710F409617
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197867; cv=none; b=Xc+FPQGbHqWjigwUGhLFjjRhK9Xy9XG46UDWnkHby4vMkIyoSLmgenxFv+A686W9vOG3fS1ghNK4iMZoB9rerkfzBLdaep0MVRHZY7qbe/f42g+EgrKPTqizuyzf5CoYIDa0mHJKhTCyueBjostbbVK46msJ27hP6GolrJwnGD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197867; c=relaxed/simple;
	bh=vK1uVMOyzbtJGlDWgSE+jBHnjRliiq4i2WfmFH0FAa4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzXfnYByl4iYWQmhr5fYJ7cUwUcHBRu25lwJV76IrrKYg+LyBW0HBUdfVMYZRltBBVmD1v02RnR2B/hYXa42cJRbfiq68E6365lU79kmfosCR5PPvP0KpaxRv9i+KGMXzxBN8XAh2h3QsDd9mG59/11dJGSUdQr8mN78pHzj3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cN3BQxJw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cN3BQxJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784197865; x=1815733865;
  h=date:from:to:cc:subject:message-id;
  bh=vK1uVMOyzbtJGlDWgSE+jBHnjRliiq4i2WfmFH0FAa4=;
  b=cN3BQxJwGS9F9r8ncNehATdzFyZCaooOWrBksrvDMwTOX/tfldVj3f/K
   JtgT0w28cFpI99PMFgEb8KLnqVS9WPBlHl9zrmesudTXsl1V27BfY+/vT
   2erjm/US2w3vFVuA23o7ANPNtI0KPdAGLxSgZsiZBniaP04EQOx3mvux7
   zX7zfF0kHt9/uIDZtAZTr8aQrmrsHhwHNCQIRSfSPr5lqL5Lo2Ch5svmu
   O51nRnHTAdBfmNstgIO2s8EG+G/SbwPvvLddVAIl2SIGedRgTIhAFwhXn
   uSAhoEgi+I2qLNOpP0Xa2Qry4kX5vV5gHheWa7L2s5YR/3gT8OwN2RuGT
   A==;
X-CSE-ConnectionGUID: xSEdexEEQB6xKF2hcdWMjg==
X-CSE-MsgGUID: mfLv8i22RNivdCYxvfvEGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88530027"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88530027"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:31:04 -0700
X-CSE-ConnectionGUID: wsDQsrHiTv2+CcARpBpplQ==
X-CSE-MsgGUID: /cmkNjSySIKkRO3D7DgOrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255941353"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2026 03:31:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkJMn-00000000Oga-2Ivt;
	Thu, 16 Jul 2026 10:30:58 +0000
Date: Thu, 16 Jul 2026 18:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 1/1]
 mm/shmem.c:2180:12: warning: no previous prototype for 'shmem_fault'
Message-ID: <202607161816.yDP17zCi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   33b6171ad078b267e1bfa3617dbe417681d7d02f
commit: db302359ea1b5252a28abcb23a382be91c961ac0 [1/1] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260716/202607161816.yDP17zCi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161816.yDP17zCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161816.yDP17zCi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2180:12: warning: no previous prototype for 'shmem_fault' [-Wmissing-prototypes]
    2180 | vm_fault_t shmem_fault(struct vm_fault *vmf)
         |            ^~~~~~~~~~~


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
