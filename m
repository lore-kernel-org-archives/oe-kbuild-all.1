Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE39037CD45
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205663; cv=none; b=j+nuXSmhqNIq6V0HldNB5/BJfz1oCFl/vkRRq5Yp936QFfrQMxfERUzz+Cb1ULLX11Q9qdt9y51C9YeinaCZYcNKwq56mMLojA306EBN8AmTqHfKyEFnOm+QfkiHBo3U1xu7wpknFyY9N65WwEeZ4Hbo/GD8UNhOVODBxw7fPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205663; c=relaxed/simple;
	bh=NJH5xJb3K2/IN9WndHJbafHNsAc9dYLiniDWCdO+iPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PYGXyOkgxyxulzUBzaONsA1O9PpCvpRFzXmZaStc/TeidQqIsCUt6Kj+JU944UmX1sjnxyxAJ47s7EGDRf4lDHJER2l0ot6IuOPSYIzOd9N+zxmT5AFOlnA+7vKHG0F6ifLpWviW09bvdi7Za09ja1MKixDkaHyExTGTStpHr6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgbJohLM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgbJohLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205661; x=1806741661;
  h=date:from:to:cc:subject:message-id;
  bh=NJH5xJb3K2/IN9WndHJbafHNsAc9dYLiniDWCdO+iPs=;
  b=MgbJohLMAbyVzrESuhCo5j7zeWeObhCy6qPr4A/OzD/TiopUaoxebuqx
   9TvUksqNGc8wx5+ntvhK0X/pcZX5E5t+7+/L3an/yjx7WpHV/Ns4mzqhB
   eAak+lNDZ0riPGMXBJdoF16CSV+SUvCnYSoM8IN0Myah0fcw5ySxNll3R
   dZrH2MffNQwPPlgHJK5ySzzbmJGFk7jzZ2l07eeKllyGN9tB+eMbFdZOA
   MHG0Lj/6gi8rsy3GhnJcH4xvHlryFkiYIe5Rn1H2h0d6u1NSGTUvDbIP/
   b9k/Oxr67Xbh6Odz/rVSSBfJlX+7TKaGfUTzJfxzrXI8n0tM3naMjpk3m
   A==;
X-CSE-ConnectionGUID: Do8oo1rdTJ64WAHUq4w6Dw==
X-CSE-MsgGUID: ESvzvYriQUKVokq7jjCl9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156632"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156632"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:40:59 -0700
X-CSE-ConnectionGUID: W5Lgkf4jQFq3DgK1qqlDKA==
X-CSE-MsgGUID: 00Uc7kUmTpuh2ajM+7+RLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="224370758"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2026 01:40:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a5G-0000000012J-0vzp;
	Fri, 03 Apr 2026 08:40:54 +0000
Date: Fri, 03 Apr 2026 16:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4] mm/shmem.c:2180:12:
 warning: no previous prototype for 'shmem_fault'
Message-ID: <202604021955.LUxI0AqU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ce5b4e244a9fd35566b8e44e12a938b63923fcec
commit: db302359ea1b5252a28abcb23a382be91c961ac0 [4/4] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260402/202604021955.LUxI0AqU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021955.LUxI0AqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021955.LUxI0AqU-lkp@intel.com/

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
