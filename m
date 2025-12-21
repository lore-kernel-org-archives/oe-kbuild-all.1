Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF622D785
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766339559; cv=none; b=Uw+5KggXbWAUkHfCQoMuZ5l9voyjykx307PiEDNw+ai3+dU0a5Rsjmknrp4C7YmhskRST95Zbcid1/q76+3zqcszwff0LwmOJCKecaflpq2ljwTfXpVfaKZjBtE1Qr3PxV7ThaqQakdYOar1DZKKSIkbJ+nUGovQIo1gg0ecl/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766339559; c=relaxed/simple;
	bh=TCSH8c7HByb17NGpPTrz9BNUpmRQA7ACBcGIB8yY71c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=my7GE8fUUpfHInnHwG+YWd02QTyGAc2/Od7rzMCNMkHIgSpiSddTBMZFTr7XON3lgDZ9+n21AibUnmsPc8a8YrcTBnnkWDvdxXsTywjgBksOS43v/VIeo2/VGFxRb+CWkug97B9dtuzBfTkPax5NcQf+vkCbpFD0VsFRXCn/qjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn5L1Ne/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn5L1Ne/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766339558; x=1797875558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCSH8c7HByb17NGpPTrz9BNUpmRQA7ACBcGIB8yY71c=;
  b=bn5L1Ne/H4rc3Yp4j1ysT1yBVE2Vy6bXK5K4DFVAvKc5oeCQdh87vBxy
   I5XvbrChsoSF1ZLIXmaS+O5/7t/IccmTbJCgmwu97OAK3cLTB9EmHzEZX
   L5k/hKfydHbZonWiL9HLKLfSd0B48i4l2OWy0JSCRIJQNMiaJJhsPaXY9
   eJed9UhWzG04iFRCMM13r/GPFP8ibU2noTraKilKbsVpVN+n6BVkgaOdT
   gglf4gkXnMgbwZOeUgyJRWVMIwF7IzIxyIhEge8uDrOFxbsKnuiCN7kZX
   75B7igsZtN5OWPShXTV8s83ieyYo4OZAkMhmxVUgZuxz0iw1AUGnI7MBK
   g==;
X-CSE-ConnectionGUID: z59R5ePGSB6eTSHVu9d+BQ==
X-CSE-MsgGUID: sZSHt2+yTtCOiZvys8+hzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68094925"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68094925"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 09:52:36 -0800
X-CSE-ConnectionGUID: gqsodMYFQdGHL1nQOQ2efA==
X-CSE-MsgGUID: ITxgmqtgQje6p+/yCVxYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="229997491"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 09:52:35 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXNbd-000000005up-2Baj;
	Sun, 21 Dec 2025 17:52:33 +0000
Date: Mon, 22 Dec 2025 01:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] mm/shmem.c:2541:12: warning: no
 previous prototype for 'shmem_fault'
Message-ID: <202512220107.G3wRxXU3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 5c1d7ef6718a61393212b8f7971d146d6e1c8e8f [1/1] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251222/202512220107.G3wRxXU3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220107.G3wRxXU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220107.G3wRxXU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2541:12: warning: no previous prototype for 'shmem_fault' [-Wmissing-prototypes]
    2541 | vm_fault_t shmem_fault(struct vm_fault *vmf)
         |            ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/shmem_fault +2541 mm/shmem.c

  2540	
> 2541	vm_fault_t shmem_fault(struct vm_fault *vmf)
  2542	{
  2543		struct inode *inode = file_inode(vmf->vma->vm_file);
  2544		gfp_t gfp = mapping_gfp_mask(inode->i_mapping);
  2545		struct folio *folio = NULL;
  2546		vm_fault_t ret = 0;
  2547		int err;
  2548	
  2549		/*
  2550		 * Trinity finds that probing a hole which tmpfs is punching can
  2551		 * prevent the hole-punch from ever completing: noted in i_private.
  2552		 */
  2553		if (unlikely(inode->i_private)) {
  2554			ret = shmem_falloc_wait(vmf, inode);
  2555			if (ret)
  2556				return ret;
  2557		}
  2558	
  2559		WARN_ON_ONCE(vmf->page != NULL);
  2560		err = shmem_get_folio_gfp(inode, vmf->pgoff, 0, &folio, SGP_CACHE,
  2561					  gfp, vmf, &ret);
  2562		if (err)
  2563			return vmf_error(err);
  2564		if (folio) {
  2565			vmf->page = folio_file_page(folio, vmf->pgoff);
  2566			ret |= VM_FAULT_LOCKED;
  2567		}
  2568		return ret;
  2569	}
  2570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
