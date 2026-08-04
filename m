Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D9B3F823F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832530; cv=none; b=rgi0L2yfIX72LMGeo0ElU5un3vkVeImmTuEzBqaPrcJImSNbXfQuT1rB4qom5VX+Ox08R5S9XB2lPJCYfZ5t/BdCLPiUaAiCULVUd+EbfRge0uZ3ZHr1xTGfA4JwgFxc5+HflFwggaX/vz/5CWngbH0ja0oH+CKIsypjB/u5C5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832530; c=relaxed/simple;
	bh=mulJONu60cb28rhmeexVVa6SuryVCns70GUJa1wjv5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mv9eOMkZcwUSx3K4eOCVych0dnK2ZN2UXspQRMlanknFV/Z5SRPbzc67um4toFGQXjlwydDJvCZIrfN5CxIhfCCYyNANAqiEW921QK9H7IyplkFJAsGO4u6hJuav7e2bkb2Dtbgyzp8RnAsGCz63q4A7AWG+JUvkQW/6Omy+01g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeaDD7xa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeaDD7xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785832529; x=1817368529;
  h=date:from:to:cc:subject:message-id;
  bh=mulJONu60cb28rhmeexVVa6SuryVCns70GUJa1wjv5g=;
  b=OeaDD7xazT0BBYVAAmMP07MSpxfJZEZnYpOkPmJ6SpsOdGGoEpUHHwRY
   fjmPSuS39K2MNgK6RcRNPCA8izGNXtVWdOCEdwa2ZXggOnRHqUGmZg2/z
   6GKcyk6M3SQTidBNdazEMVpTlT/N5quTG5hs3W6rV7JjtlX79I3MOrepS
   TpV/ldcYIvua8KFy/i6v5WHyumv7PJfPMn/9RUm74QluOWHdD2LVSk/Z8
   FJzY4q7XAbcdNeaElSdgwJ/bhNZlmO2YjPIS9k8H/mmVL+UcVon4PSZ48
   BZtVQVgPMkh8YDrFZT/qxai2/a0FCzYrtc/tOXidiZ3ZN+8o0jDynsqP6
   w==;
X-CSE-ConnectionGUID: aD7X5DoXRNyB2LJpIsztbQ==
X-CSE-MsgGUID: F7ig7kgxRBKakNgGxdNt3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97029691"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97029691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:35:27 -0700
X-CSE-ConnectionGUID: wxTV3UxuSWSWsBGbcEtaiw==
X-CSE-MsgGUID: uCczyNaATW6yQyZk8jMSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="260845610"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Aug 2026 01:35:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrAcM-000000009Qe-2zbD;
	Tue, 04 Aug 2026 08:35:22 +0000
Date: Tue, 04 Aug 2026 16:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse:
 cast from restricted vm_fault_t
Message-ID: <202608041648.WGMVLNzJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
commit: 9db65489b87298f20baef683e70143c108959793 vfio/nvgrace-gpu: Add support for huge pfnmap
date:   8 months ago
config: alpha-randconfig-r123-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041648.WGMVLNzJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041648.WGMVLNzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9db65489b872 ("vfio/nvgrace-gpu: Add support for huge pfnmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041648.WGMVLNzJ-lkp@intel.com/

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
