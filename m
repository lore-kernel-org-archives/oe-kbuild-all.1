Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C6014A4DB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405914; cv=none; b=PXvlfeMciwXOlnAUGyUAc3rW6zbAXkgMh9CGOyPaEp8pzSpwkSXBzLx81NPEhwDUlT0uNEVfB2ygoBuXHvle5x5l4eI1G8nNvNBzwdP6gFDO3DgKpXcIZdyFAlbY9MgRkNhR99UAEUAngWpo1AJpZAQljBacHIhBuhkJCaGY2Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405914; c=relaxed/simple;
	bh=33/J1KNl7ZG4EYU8rXr/N3ZcMUmkxkPdIE7PjROGMjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ixUgiOE5CVIprVZIty0SfA8zQE7KbLmQQSkcUZUbAOl/60tuGijfdyk5W60h7H6Rc0tuHABxBGzqVn76DKFiXC7aX9lDVZxjVwPc7KJZb+pNIz2maUDzaO1kNZqoXtg0izVcckF5m5szgjLA2I0QtiwGmS1If0hnCJTjBtPwfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCNuhlvs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCNuhlvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757405913; x=1788941913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33/J1KNl7ZG4EYU8rXr/N3ZcMUmkxkPdIE7PjROGMjc=;
  b=KCNuhlvsJlCIWGwCyL1fKWEj55K3EEWCJ/1FRyfSKzcDlOGwq2pciR33
   C3uYFQ89iEAIaTk+uoPq4xgewvw/Sdn/T7AWTLlU97ufu2X53UgQzhSXz
   bMixji1EpKD16XUztu+IUx7vxzTmxzDhdJBsp6D0UteCRVkpOLILeAjxw
   mLF5mjm5sxhwHtsyu/MjcqHcbsrkcb1NGTJoglOC6sGH2a1eFxEsvIFHV
   ed6GBBg5cjabTesB2+qAfe2n0vr40n7jxa/a25PdJBHwQYujyo2/vFD+i
   11KuqYcCJ4gSPX0Z/G4Wq4Pnx+92RObyrlBGNo0a4YHJmMnA1fFbgL1n2
   g==;
X-CSE-ConnectionGUID: E8jc0H2QQuuI/LhB0ESEqw==
X-CSE-MsgGUID: 951m8FBFT1egF48ns9WMlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59617533"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59617533"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:18:31 -0700
X-CSE-ConnectionGUID: opvIE0+lS5+Ic5F68rQqUw==
X-CSE-MsgGUID: eQK4b9WyT3S04E24Kjhg6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172944273"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2025 01:18:31 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvtYa-0004df-1f;
	Tue, 09 Sep 2025 08:18:28 +0000
Date: Tue, 9 Sep 2025 16:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1] mm/shmem.c:2541:12:
 warning: no previous prototype for 'shmem_fault'
Message-ID: <202509091543.B34ccC2h-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   0e0503085be8e8b2970bfd5ebafba849d43ea14d
commit: 5c1d7ef6718a61393212b8f7971d146d6e1c8e8f [0/1] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250909/202509091543.B34ccC2h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091543.B34ccC2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091543.B34ccC2h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2541:12: warning: no previous prototype for 'shmem_fault' [-Wmissing-prototypes]
    2541 | vm_fault_t shmem_fault(struct vm_fault *vmf)
         |            ^~~~~~~~~~~


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
