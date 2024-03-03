Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FD8567D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 03:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709437032; cv=none; b=ueicCYudX5w79SkMPyuCO3YUoLxDmaR8gVWBzidQZpfTVaUZIQuI4UuvPYf9xzABxXzQOfa/v9x1W+iQPuaovGg7PKON1Qtt2Zn5IvTTiuiqxHrXtA6icE+QTb3zyF1VsIJkrthdOSXgRasGE2KZe7Ev+XeC6lDuhOXpa1IW29M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709437032; c=relaxed/simple;
	bh=bF7vFyDX5q2OU0jwqgNH0eLxV4EBMU9jpnjH9btEcdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cs0fJLe+/frN3aj/9Q4iPft5GsC/HVRQNBi83aFqP5NmT+1K194/OSkcbK8vNhnSi7G3LKs1kLlBnpNRUA+LsSVqaihDFotCX1g2zFRwfTmpCJYqwLHXzbD/TRAEegA2fKrAh9QDGaPrdwljfnK5Sa9sEXscbATgWjuRrZgyB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTTyqP82; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTTyqP82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709437030; x=1740973030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bF7vFyDX5q2OU0jwqgNH0eLxV4EBMU9jpnjH9btEcdw=;
  b=lTTyqP82mUKCxQ/qg5DTvJoSbZQsxFwE0ypmJkK07P8y4drOCXb9bCku
   7nEOVG8v6no/zox7kJ7woRe/hl93kEPhi/4srgxxXMpmY7LTa7s6XsUZm
   9ImAPaQwvJtjd1U6kMdU5cwCeVK0nhnpKjwc6+MxgxBfR0mQPUs+YRkDp
   mcBecViU2ij18Sn6mWzUDFXVqjlylOXY6byFH5zrTAR/KSMbGEzTNvah8
   B9k4eRhRWa6ilxYU+rMmmgjTD1x239G+zuqx+/wfDy+RTxiL9XLm6HgPu
   WHB7d7qqPZ6f+jqBxHQvv74jrGvU70f0iJSCBVVHAWj+fTzCRJfTwRNhg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4117907"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4117907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 19:37:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8559497"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Mar 2024 19:37:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgceu-0000U0-1D;
	Sun, 03 Mar 2024 03:37:04 +0000
Date: Sun, 3 Mar 2024 11:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Steven Price <steven.price@arm.com>
Subject: [drm-misc:drm-misc-next 12/14]
 drivers/gpu/drm/panthor/panthor_device.c:355:31: error: implicit declaration
 of function 'virt_to_pfn'; did you mean 'virt_to_kpte'?
Message-ID: <202403031142.Vl4pW7X6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Boris,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   216c1282dde38ca87ebdf1ccacee5a0682901574
commit: d72f049087d4f973f6332b599c92177e718107de [12/14] drm/panthor: Allow driver compilation
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403031142.Vl4pW7X6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031142.Vl4pW7X6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031142.Vl4pW7X6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_device.c: In function 'panthor_mmio_vm_fault':
>> drivers/gpu/drm/panthor/panthor_device.c:355:31: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_kpte'? [-Werror=implicit-function-declaration]
     355 |                         pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
         |                               ^~~~~~~~~~~
         |                               virt_to_kpte
   cc1: some warnings being treated as errors


vim +355 drivers/gpu/drm/panthor/panthor_device.c

5fe909cae118a7 Boris Brezillon 2024-02-29  332  
5fe909cae118a7 Boris Brezillon 2024-02-29  333  static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
5fe909cae118a7 Boris Brezillon 2024-02-29  334  {
5fe909cae118a7 Boris Brezillon 2024-02-29  335  	struct vm_area_struct *vma = vmf->vma;
5fe909cae118a7 Boris Brezillon 2024-02-29  336  	struct panthor_device *ptdev = vma->vm_private_data;
5fe909cae118a7 Boris Brezillon 2024-02-29  337  	u64 id = (u64)vma->vm_pgoff << PAGE_SHIFT;
5fe909cae118a7 Boris Brezillon 2024-02-29  338  	unsigned long pfn;
5fe909cae118a7 Boris Brezillon 2024-02-29  339  	pgprot_t pgprot;
5fe909cae118a7 Boris Brezillon 2024-02-29  340  	vm_fault_t ret;
5fe909cae118a7 Boris Brezillon 2024-02-29  341  	bool active;
5fe909cae118a7 Boris Brezillon 2024-02-29  342  	int cookie;
5fe909cae118a7 Boris Brezillon 2024-02-29  343  
5fe909cae118a7 Boris Brezillon 2024-02-29  344  	if (!drm_dev_enter(&ptdev->base, &cookie))
5fe909cae118a7 Boris Brezillon 2024-02-29  345  		return VM_FAULT_SIGBUS;
5fe909cae118a7 Boris Brezillon 2024-02-29  346  
5fe909cae118a7 Boris Brezillon 2024-02-29  347  	mutex_lock(&ptdev->pm.mmio_lock);
5fe909cae118a7 Boris Brezillon 2024-02-29  348  	active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
5fe909cae118a7 Boris Brezillon 2024-02-29  349  
5fe909cae118a7 Boris Brezillon 2024-02-29  350  	switch (panthor_device_mmio_offset(id)) {
5fe909cae118a7 Boris Brezillon 2024-02-29  351  	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
5fe909cae118a7 Boris Brezillon 2024-02-29  352  		if (active)
5fe909cae118a7 Boris Brezillon 2024-02-29  353  			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
5fe909cae118a7 Boris Brezillon 2024-02-29  354  		else
5fe909cae118a7 Boris Brezillon 2024-02-29 @355  			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
5fe909cae118a7 Boris Brezillon 2024-02-29  356  		break;
5fe909cae118a7 Boris Brezillon 2024-02-29  357  
5fe909cae118a7 Boris Brezillon 2024-02-29  358  	default:
5fe909cae118a7 Boris Brezillon 2024-02-29  359  		ret = VM_FAULT_SIGBUS;
5fe909cae118a7 Boris Brezillon 2024-02-29  360  		goto out_unlock;
5fe909cae118a7 Boris Brezillon 2024-02-29  361  	}
5fe909cae118a7 Boris Brezillon 2024-02-29  362  
5fe909cae118a7 Boris Brezillon 2024-02-29  363  	pgprot = vma->vm_page_prot;
5fe909cae118a7 Boris Brezillon 2024-02-29  364  	if (active)
5fe909cae118a7 Boris Brezillon 2024-02-29  365  		pgprot = pgprot_noncached(pgprot);
5fe909cae118a7 Boris Brezillon 2024-02-29  366  
5fe909cae118a7 Boris Brezillon 2024-02-29  367  	ret = vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot);
5fe909cae118a7 Boris Brezillon 2024-02-29  368  
5fe909cae118a7 Boris Brezillon 2024-02-29  369  out_unlock:
5fe909cae118a7 Boris Brezillon 2024-02-29  370  	mutex_unlock(&ptdev->pm.mmio_lock);
5fe909cae118a7 Boris Brezillon 2024-02-29  371  	drm_dev_exit(cookie);
5fe909cae118a7 Boris Brezillon 2024-02-29  372  	return ret;
5fe909cae118a7 Boris Brezillon 2024-02-29  373  }
5fe909cae118a7 Boris Brezillon 2024-02-29  374  

:::::: The code at line 355 was first introduced by commit
:::::: 5fe909cae118a757a77afb37174b99436a36d2e2 drm/panthor: Add the device logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
