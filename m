Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B2375F9C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534197; cv=none; b=fWE3VDwy5+owX1hvr9RxIlV1NyEl+G/4ljCa3M/NfPPlxC773WqDLEWxZxslFQm4PYGdEW/zlXpjw9WFzPSgmSrIIQ4UxDtEDpUK67RarpkEvrfmDEYEx4LH4t8+bn5YUj1ius7xWIZHdcpDBrbjTm6iKamhKQJV9OPDRitNhqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534197; c=relaxed/simple;
	bh=2bGGmHIxh9X9AedvO3ChTGATKCMyScCyR7otr+dNe+g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r1+Otuzz0EJpSUalbnME9WX/8NGY7sZeONevzwpiI7FxxaqME9/vBVvbIwMfvWCosWmBv9aKg3ZB9Sdc/9bxCTpRST2r6h3Ght3n18JUmudv1v0gHKRt7Nj/7KwQPOFsc+5tny5JxzV6IwjKK5vnFNb/9xwxLI1JAxElk0dUK7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLx8qivd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLx8qivd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534197; x=1807070197;
  h=date:from:to:cc:subject:message-id;
  bh=2bGGmHIxh9X9AedvO3ChTGATKCMyScCyR7otr+dNe+g=;
  b=dLx8qivdFM9vek9ZZHmXHurZd9EsDp9D0AtpdwR+lySEW8vCYuieY1gw
   Zh+3nteXucHk030EANg/rx6ORPOJ7dFo30ISpixn0apoFGKp5A+sQXZzU
   mJs+udLcxCa6fAVShNbtedj9877OQ+pATIYX64aM/xAJTDL5XzCFJ7M4F
   2fH++bNoJqt6zguNCKpXj2BNTZJj5nOR+qznGATWmngSAJPJjX1nRnLpd
   eEfT/GTaxfJz9EduLqswJEVRBL89vaGPPHwN7xeKhZHx+YvLvIks5Oa63
   yYJ2NODLl66OUcqzqKgl7q87TzbRBqQehaKqwwr/WNO4cl7wAK17GSTsw
   w==;
X-CSE-ConnectionGUID: Tu1Dm5a7Si2KfPEs851p0Q==
X-CSE-MsgGUID: XlzkfsRjSJ+qK9W9835tUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081025"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:32 -0700
X-CSE-ConnectionGUID: O/cHFfMxRluXmiqmcjhPvQ==
X-CSE-MsgGUID: ddGn9ms5RZiRSk55I5HqJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995131"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:56:30 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xYA-0000000004z-1zJi;
	Tue, 07 Apr 2026 03:56:26 +0000
Date: Tue, 07 Apr 2026 11:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse:
 cast from restricted vm_fault_t
Message-ID: <202604041838.JNgwkTDB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ca6d1cfec80ebe46cc063f3284c5896c344d9a1
commit: 9db65489b87298f20baef683e70143c108959793 vfio/nvgrace-gpu: Add support for huge pfnmap
date:   4 months ago
config: sparc-randconfig-r111-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041838.JNgwkTDB-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041838.JNgwkTDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9db65489b872 ("vfio/nvgrace-gpu: Add support for huge pfnmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041838.JNgwkTDB-lkp@intel.com/

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
