Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6C270552
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 04:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778991077; cv=none; b=rYfHUEPOPWqRi1IBscRaLIH7cggV7y2+VNDFWfKYnNBCXQk+DLskL6noXBPW+rycGXefI0d0eTApqgbTaaDt4JiCMw+9ltzNkq+azuDIggROLCw+3ChJ1Ux8RyPFRlcJOK8aND44xWN+0XuSk9bVPK/6MvQJ7ZgItG7auPl1rug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778991077; c=relaxed/simple;
	bh=qSit08IJbcxQi7SJjhQLF2MyL4FepNo3aDR4epnJOEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OlhNUXTx0CTow3S7nSSL/p1AxhiFOh97szWhjt8lmqzRifUkfZQjXVEzHKsCWeRPWeOpBL2ugREs2mzqfu1zgo++jhToR3gbNZgyIXLRMbNs0BfPvUuQHwJ15dmwf5GiQMiLmfRq00PClRMtMXg8P0vFrSFKAlXFn+QlNdrcv/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp0D9Mw+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp0D9Mw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778991076; x=1810527076;
  h=date:from:to:cc:subject:message-id;
  bh=qSit08IJbcxQi7SJjhQLF2MyL4FepNo3aDR4epnJOEY=;
  b=Fp0D9Mw+1crgnWkJmqtUKH6o3H8PgW4WiHLH9nHDlhELxk3dl4k/b5ny
   PTVEGMpuRaSfFfJwDX4k8MVe62E9bzf6I7+mKWkpllIWLxyw3whxL025A
   O3szkbxx5TigSfcTiFWvRCYKseYuG8yxesTuGkOxlUwdLFqLfrlfm+H3H
   4GnxXIYgRe1k0wTesuRN0dpigEtjd2oBiPh+sgNQw681tSgpXV03XwpxW
   kx5aZmjYLMMsKUtVyg5zbVCJFfzFiTmxmyNFvliY9P57FSoTHt2MDw3q4
   hZWcrgo6MakcBmrLnL7lQYxoE8jYTjoi75WOJyFUKwtzbCaQwa+q1rNFY
   A==;
X-CSE-ConnectionGUID: VMjtSwaQS/OR4yIgBGscuw==
X-CSE-MsgGUID: Gvh8SwDkSDm/sZTGEAoxNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83756455"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="83756455"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 21:11:16 -0700
X-CSE-ConnectionGUID: 4oc1zpSDSQmXTMdms51LQg==
X-CSE-MsgGUID: 9YL0KQYyTqyVqdvqycQcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="269438553"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2026 21:11:14 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOSqN-000000001LS-34F7;
	Sun, 17 May 2026 04:11:11 +0000
Date: Sun, 17 May 2026 12:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse:
 cast from restricted vm_fault_t
Message-ID: <202605171249.rG1OgNsd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6916d5703ddf9a38f1f6c2cc793381a24ee914c6
commit: 9db65489b87298f20baef683e70143c108959793 vfio/nvgrace-gpu: Add support for huge pfnmap
date:   6 months ago
config: powerpc64-randconfig-r111-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171249.rG1OgNsd-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171249.rG1OgNsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9db65489b872 ("vfio/nvgrace-gpu: Add support for huge pfnmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171249.rG1OgNsd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse: cast from restricted vm_fault_t

vim +167 drivers/vfio/pci/nvgrace-gpu/main.c

   142	
   143	static vm_fault_t nvgrace_gpu_vfio_pci_huge_fault(struct vm_fault *vmf,
   144							  unsigned int order)
   145	{
   146		struct vm_area_struct *vma = vmf->vma;
   147		struct nvgrace_gpu_pci_core_device *nvdev = vma->vm_private_data;
   148		struct vfio_pci_core_device *vdev = &nvdev->core_device;
   149		unsigned int index =
   150			vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
   151		vm_fault_t ret = VM_FAULT_FALLBACK;
   152		struct mem_region *memregion;
   153		unsigned long pfn, addr;
   154	
   155		memregion = nvgrace_gpu_memregion(index, nvdev);
   156		if (!memregion)
   157			return VM_FAULT_SIGBUS;
   158	
   159		addr = ALIGN_DOWN(vmf->address, PAGE_SIZE << order);
   160		pfn = PHYS_PFN(memregion->memphys) + addr_to_pgoff(vma, addr);
   161	
   162		if (is_aligned_for_order(vma, addr, pfn, order)) {
   163			scoped_guard(rwsem_read, &vdev->memory_lock)
   164				ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
   165		}
   166	
 > 167		dev_dbg_ratelimited(&vdev->pdev->dev,
   168				    "%s order = %d pfn 0x%lx: 0x%x\n",
   169				    __func__, order, pfn,
   170				    (unsigned int)ret);
   171	
   172		return ret;
   173	}
   174	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
