Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C7E2F7F0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268475; cv=none; b=bpe4/TkC2IntzkVx8xLxnk8+lRjssXMTPyH9OH2gupYPG6jRFQN6hlhGIB9Brde6ptgAWQg+g1QKlBitzIp1o60OkZkfj/CwrqlLDN1v1XpfwA48NK8c3UvXJXIZ1mgzm+BVCFp4UnBQKOwscaGpW3cmgxAacN7d+hAYIwhFaxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268475; c=relaxed/simple;
	bh=++Cy3vwBnIcqfzgjtU0rf2goJUqQ0UdRHlTzVdbwc/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=drAARnuVDvYh7Ob0xU+0hU3ROZJteHe9/b2J3ec88g4Ifcq8rafVFxjG2xUagp2fIxn5p7PTIHSdcJkpiwpr7L+ngGoR467Ch8agFsBa5bS2kAV0UeNrGyDXzuVvJO/gehLjvtI93rCPMkEFI+JxQee1mEphxzYUmCJupyhCPe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeekL/tH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeekL/tH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782268473; x=1813804473;
  h=date:from:to:cc:subject:message-id;
  bh=++Cy3vwBnIcqfzgjtU0rf2goJUqQ0UdRHlTzVdbwc/U=;
  b=TeekL/tHuM6+x2fX4VkVzYTiYoyCz4mM9nayxLYzrMEINNwbEivdD6a5
   Ci8dvpXBhqHt1o2nKl8JL7m5osEbRAt754ZD2YknpVo0nuiA3M4S9Xuqm
   DUBJClyVLQQ1qKGWdiSza90CJEX8997ThDiVE6YkTVDpdjdgUeqxfBpkk
   a5Wr4N6v5wyhsyIb0fmmrud68F4SDmFanzeotCBTtWGMhIwijFcg+y1m5
   NldIbiOnvMbcipbDhs0ch8Qjs2cR7PrgOC4GTE9QBJlR8KXkelwqp0q+I
   j2pfQFOLx1ImaCqxOYNZfcTfOEf+WxMwdzx3et0Vt3MtHAhbKpsaWPsCz
   A==;
X-CSE-ConnectionGUID: 7bffCIapRf6iVdxHmXUmWg==
X-CSE-MsgGUID: n6Fe49LESOqXhskBrPdAWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86856189"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86856189"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:34:32 -0700
X-CSE-ConnectionGUID: x2S9RsLUR+utD7lnwTaHwg==
X-CSE-MsgGUID: SGlZZCWjSuG0Fy4PvuLc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="287819153"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Jun 2026 19:34:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcDRY-00000000349-3NZO;
	Wed, 24 Jun 2026 02:34:25 +0000
Date: Wed, 24 Jun 2026 10:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse:
 cast from restricted vm_fault_t
Message-ID: <202606241043.u5Fe3HZv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   840ef6c78e6a2f694b578ecb9063241c992aaa9e
commit: 9db65489b87298f20baef683e70143c108959793 vfio/nvgrace-gpu: Add support for huge pfnmap
date:   7 months ago
config: loongarch-randconfig-r134-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241043.u5Fe3HZv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241043.u5Fe3HZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9db65489b872 ("vfio/nvgrace-gpu: Add support for huge pfnmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241043.u5Fe3HZv-lkp@intel.com/

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
