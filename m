Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8117717BA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349315; cv=none; b=gqnX/wWJ6zZ6oJJvtKz5xq9NCJwUovjvHMA3a4CIOLK/zZKEcTpvOXD1Zz4QCOkwTuIao3AHlpwUxlajpfeNBMYoEKEg4y3bkiGsc756yHwFE95jUcJtfZvEv0nW3f613Exd/4h1sjDyvw0w1dC9O7eWcG+T58g9BjJ1pufMXOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349315; c=relaxed/simple;
	bh=fO0hE1GXEVvVnMx/+4SfDnLFgWeyva6jw1KnApT7t2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g5uJYCh1XlL+1iM2C7jDMNZi+K6mPl6mApSMKtcUCyfwKLKwWkmg/1HQnejFe5rGARE2kKrjTtozg2gmi6D5qm5yk7wSeAYUsdfBceCq1UcGJLj9p7a8JeA38LapnTssHS36/P/b113CJRay2DR9PeLgw9bgxM8GHk8yJnbXZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSjRyBku; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSjRyBku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748349313; x=1779885313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fO0hE1GXEVvVnMx/+4SfDnLFgWeyva6jw1KnApT7t2A=;
  b=KSjRyBkuuNdlP7Pd9shmBO8EgMGTH7oylUEzg0pUmE7ks+ugAm1Bc2RV
   5i00NFOXhUjaXwz3vYoGTIuKwoLPPhAHe6+E0w5jCYwWq6bJnM8NL0NMd
   ObRCG1XK94ZZ55o78BWuZfRWJ0FWTmlCLmphGs0VPkNepp69OTuFC5ibJ
   Xk3q5MWdqPcmZ7CUOstLDdDJS1C6nrpVw729Q6KsjxMCZ4Uhbpud6sI2z
   gmMdCf0IcqWHNVKT7j7ZD2qKfdWCslF13ACFwZMTImhmFXlqSSIa+OOKJ
   EluWOAJ/PkyXe17496AT6YCRoZYma8bweE/7SlooWFLtqQmmdgSQ+4t+Z
   w==;
X-CSE-ConnectionGUID: Uy4ksNkPTyiKpm6HLtQJEQ==
X-CSE-MsgGUID: 16CQ7AWZRnCbKeDpw/aCmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60587972"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="60587972"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 05:35:13 -0700
X-CSE-ConnectionGUID: NLB77F5pSuOw/sLVhAsrgg==
X-CSE-MsgGUID: 777RLlRGSmOJ2LrYr7E0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="179996022"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 May 2025 05:35:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJtWP-000TCy-2v;
	Tue, 27 May 2025 12:35:09 +0000
Date: Tue, 27 May 2025 20:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/23] mm/shmem.c:2541:12:
 warning: no previous prototype for 'shmem_fault'
Message-ID: <202505272057.xxUI5Tvk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4cfcf654e0b4c7a13c03d5e834171ca2e4ac3274
commit: 5c1d7ef6718a61393212b8f7971d146d6e1c8e8f [0/23] ANDROID: 16K: Handle pgoff > file_size for shmem and file backed VMAs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250527/202505272057.xxUI5Tvk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505272057.xxUI5Tvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505272057.xxUI5Tvk-lkp@intel.com/

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
