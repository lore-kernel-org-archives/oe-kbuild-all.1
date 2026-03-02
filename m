Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3946394483
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447249; cv=none; b=P6Ed0X2Nth4AiL4mv1OYnLTHUv72TQsOv6lfUhgHoZu7IzR+pV2jJZvZv+1+Ipl9Ik+SA/fm1iXVGIxE5jwzcdwKJMv02N8c3+VXcMiDi68dWlAgqxnbOMHCydnaCy6iHs++RvQIXn8zedLiuOA8Vr3wFGy02mcajmG1C2E35Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447249; c=relaxed/simple;
	bh=w35KvVbA/Kw8b1TRnd18xvdEF+Z3yRhcm4dEgrNzswg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XKJeiP0plYRsV3Qo5SiIj3JeBt+UWbglmLLWxvDOagELXPFaOJb6gQuxeBGijJi21nBaoPdoHVBqn3QELymxJG/+BvHeRLUUAbRIAMnRbXEt8DAoYjD7L56igWGdcyWYc5uSCggfhJpM+JiMPuCuV6/gNsTBNQm/EJdlp9izSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPpcyhlw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPpcyhlw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772447248; x=1803983248;
  h=date:from:to:cc:subject:message-id;
  bh=w35KvVbA/Kw8b1TRnd18xvdEF+Z3yRhcm4dEgrNzswg=;
  b=BPpcyhlwkPpu+uLA4R49sk/WOkareD5e5Dlhr8/ykkWmqRsmkWTI4cj9
   KJtXOWIUESNzrG6tce3RZdpGkR3Y2s+XonSCQyP4ZlyFaocFkQfJ4tKaP
   Il2e6GUjdAvVaMQo77elRkJnmzuRYIFryWXER1xKFjDShsgZYHAoj4U1V
   fAZjhPgjTMPj7A3chb+QPXKGdgX7t3JAlbIEmrXoxZ/3V3JDHJWm2Wk4V
   efPMP8vgve+fQnVKwVrjWH8SUbKcLlXFF4XBiEv9EDL9H1N/mAb6PyOmv
   f6oi/dYYcJ9anZRBpyUra9x2m7k5yJSTJtSah0LLjDpnApu9OkTLPEOaO
   w==;
X-CSE-ConnectionGUID: YdB4NY64QF+t5Pw3OojOaQ==
X-CSE-MsgGUID: Sn1xANmbSZir90K4vr4Q+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77289433"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="77289433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:27:28 -0800
X-CSE-ConnectionGUID: X9K0Z+l8RO6plZ4EMe08Wg==
X-CSE-MsgGUID: rKZoWgVuT9mMFZUeNb7sBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217636058"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2026 02:27:26 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx0Ul-000000000jZ-00p8;
	Mon, 02 Mar 2026 10:27:23 +0000
Date: Mon, 02 Mar 2026 18:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse:
 cast from restricted vm_fault_t
Message-ID: <202603021851.Tj2pQDEI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: 9db65489b87298f20baef683e70143c108959793 vfio/nvgrace-gpu: Add support for huge pfnmap
date:   3 months ago
config: um-randconfig-r121-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021851.Tj2pQDEI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021851.Tj2pQDEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021851.Tj2pQDEI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse: cast from restricted vm_fault_t
   drivers/vfio/pci/nvgrace-gpu/main.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/vfio/pci/nvgrace-gpu/main.c:371:40: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/vfio/pci/nvgrace-gpu/main.c:410:42: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/vfio/pci/nvgrace-gpu/main.c:556:23: sparse: signed value source

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
