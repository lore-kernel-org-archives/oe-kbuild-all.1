Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248478;
	b=Tmqg3V3+QRq1O24wliqUxLpy2KK2NN6nhvavnKgKx918Y84WPywbzQP/wE1qBAskO+JY
	 NdTDGhoQRAZTyqLV2R8Ag64C02s59Nw4PbI4eNexWZ4Cw6jQHiwwWM94mHJp6XM49cc+/
	 8TriMNGcuHynEcDZ5mOFmsJe/u9Tk/8BySKxpKSctlYc3BdvFrY8+EAN15wugX8y6loBn
	 /+SoXkO1GDE3rd6YPA4v4jt7YQ/Xh2eLkeojT3zjvcV7GrT6WMlELI6/UiAm7EgTrcOLp
	 gz1C6EZIzToFj/L8QN0TNqPJsWU2x+3Dl07inFbr2/IvJ9RA+mJYAH6ZUIg/+pIKhew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248478;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=V7fiTvOhRwCrIEa94ENK3mj57JgcQP9TRsWAqIk8Tsc=;
	b=n9T4BnIAI2Pkxdx5bJg5OM4jQ2PVnPgJupJ6KgvPKhLkdlJoNbXOleM1TNrmsT4PWOK4
	 EH7tcdcr4PF2W5Z9rsu8+KeeFUedoOEiONTr/FikXVx3sS0Bh91pP1z2sse4l0Q5Le9gh
	 Yxbwq2EaiwVY+UPavm2x4CAK5fDp2sHHsyfcIzipS9tK7qzNA72eIt+hhO8ocgQdMbat9
	 kyzkTGRE1GSoE9ED2sjMIWAbLP+BUGCk48qP+St6YTiO7RkaskIqiWdJ0tA9cPpaU87WP
	 BEI8oIOwZQwAbFu+JCtsJR2J4+klfFO4iO8CC/0UQMjt72NuqDwBTGIdaZ+0aPy/YqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m0nnSl6I;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E2D606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 04:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E2D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m0nnSl6I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793248477; x=1824784477;
  h=date:from:to:cc:subject:message-id;
  bh=fQWHBLjwtUkApVoi1uPT8s+m4oq1KENvm1+ydIb2RFQ=;
  b=m0nnSl6IpMazL7nShUrIRFIFjFR6XXJcfbUZnGBlSdzSZvr4+M0WlmFN
   Oricq9wRC9BERjsjsRq9CN4NZNpTn2e/yHto5tJDx+iGMBdcSMmIE4GUK
   Smr5zpRCgHG9RkwltKSUWmJ9Q6IURH1fzRKUC7Qs8E8XJjDN9+4P+jKbs
   A9YD0wh1NTRfYE9t8ua8r6AIf+SWrv3BT5Prq0Z+jOTDbs8NiIW4DcULe
   3H48eUpECNoeOnBm83WZevP/E5d251QuZgGdFvHCxE81HmQZd5MUHX2z+
   YkB6SAy5Rma/LFP6CmEZQvGle+/RI+G8kzNmtYecQHXUKTpvEPf2f2rko
   g==;
X-CSE-ConnectionGUID: KW4IOnWrSjiAOu3LUJExYw==
X-CSE-MsgGUID: BvweaOueSUa3j0LZ8KVisA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1879689"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1879689"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 21:34:33 -0700
X-CSE-ConnectionGUID: mGrQ4/QEQ+6WuJcfelqxhw==
X-CSE-MsgGUID: EdqDb7x4TTaY8MjGU6cnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5043577"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Oct 2026 21:34:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMHqP-00000000Zbg-1jfM;
	Thu, 29 Oct 2026 04:34:29 +0000
Date: Thu, 29 Oct 2026 12:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 4/4]
 mm/shmem.c:2180:12: warning: no previous prototype for 'shmem_fault'
Message-ID: <202610291128.JsPIw1Qz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   16c3ec26766e69f67992c085e1fec7ed5ffb811f
commit: db302359ea1b5252a28abcb23a382be91c961ac0 [4/4] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261029/202610291128.JsPIw1Qz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291128.JsPIw1Qz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291128.JsPIw1Qz-lkp@intel.com/

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
