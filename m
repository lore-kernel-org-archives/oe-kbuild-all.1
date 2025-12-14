Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754925F96D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 05:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765691867; cv=none; b=T0qRwoeZxV1cpwDgNiM6prlwj0AxuWeX082UfzWgS54qtb+N7nqFiH4cSDVB1kZ/PaF/LHIo/t9ufl1sEwnTpN64UyyTp3ylcgCHkj1rGuvF07yxkhr5RAF7U/Q94xwo0EXt3TfnvVEe1e8XHKOy6Z0p0Q0HYYHEj25cGRvudow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765691867; c=relaxed/simple;
	bh=TFZV228hUiJ64s0bLAdSFS8ZQRT4LfPrgWYZAAalLXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jgnw7DSHW3cuWSRKuVc/o9sXwoWo7gIJ+mAigQVvI5evjvvG457Jna5usq6ndif4Hf3jqVr8UO1mHKrra4Y9l256aDwqyq53+PnxU6eMQKg9NEiqBhSJxC+M9qCSVlyPPd//WC+CANFeHLCXnCPOVOK0qkeCxxBafy2Dzjd3cq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3bLgUtp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3bLgUtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765691865; x=1797227865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFZV228hUiJ64s0bLAdSFS8ZQRT4LfPrgWYZAAalLXk=;
  b=O3bLgUtpP9+eXRFtet2b6LmBPagmadcsEEAEoTQ23qL0sinU1RMkqyZm
   SE6OjifnXbVB382UHwURUveuRLPnEbGbt+Szn+ylnTKqj6V2rbMldCa8R
   Gj/6yNvCNQBzZk8FpCI/cFHeYX6CNBhFcTQMESM8O5fCO+h+4zxVY6wgX
   fI3dWxlMNSQywHpdXtXXmUCo4AuKNJVRdxmZjql+mryVHn5kp+kF0Tfv5
   6PiFEWG2K9vCb/i5Cwr0Jd7uvCrUra1TseW6Pw7Q8r7qp2SjXRENNTgTM
   iyIKYO8AG5BqiMvWwFuyjj7BX7orFcgbA3QCSZNUnGxrrQ+2dAs2f1kYM
   w==;
X-CSE-ConnectionGUID: EnENt58+TKylG5faeumGqg==
X-CSE-MsgGUID: otPavzgrT8G0ZgaCXYCsAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78271976"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78271976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:57:45 -0800
X-CSE-ConnectionGUID: 2iJwpn4BQjSnnWH1ZTjg3g==
X-CSE-MsgGUID: 9KwxRk1TStOZHnkIpHnOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202540755"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 21:57:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUf6x-000000008ds-3TVR;
	Sun, 14 Dec 2025 05:57:39 +0000
Date: Sun, 14 Dec 2025 13:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: drivers/hv/mshv_root_main.c:1341:14: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202512141339.791TCKnB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 621191d709b14882270dfd8ea5d7d6cdfebe2c35 Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
date:   9 months ago
config: x86_64-randconfig-r121-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141339.791TCKnB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141339.791TCKnB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141339.791TCKnB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hv/mshv_root_main.c:1341:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void const * @@
   drivers/hv/mshv_root_main.c:1341:14: sparse:     expected void const [noderef] __user *ptr
   drivers/hv/mshv_root_main.c:1341:14: sparse:     got void const *
>> drivers/hv/mshv_root_main.c:2192:23: sparse: sparse: symbol 'mshv_reboot_nb' was not declared. Should it be static?
--
>> drivers/hv/mshv_eventfd.c:493:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int events @@     got restricted __poll_t @@
   drivers/hv/mshv_eventfd.c:493:16: sparse:     expected unsigned int events
   drivers/hv/mshv_eventfd.c:493:16: sparse:     got restricted __poll_t

vim +1341 drivers/hv/mshv_root_main.c

  1317	
  1318	/*
  1319	 * This maps two things: guest RAM and for pci passthru mmio space.
  1320	 *
  1321	 * mmio:
  1322	 *  - vfio overloads vm_pgoff to store the mmio start pfn/spa.
  1323	 *  - Two things need to happen for mapping mmio range:
  1324	 *	1. mapped in the uaddr so VMM can access it.
  1325	 *	2. mapped in the hwpt (gfn <-> mmio phys addr) so guest can access it.
  1326	 *
  1327	 *   This function takes care of the second. The first one is managed by vfio,
  1328	 *   and hence is taken care of via vfio_pci_mmap_fault().
  1329	 */
  1330	static long
  1331	mshv_map_user_memory(struct mshv_partition *partition,
  1332			     struct mshv_user_mem_region mem)
  1333	{
  1334		struct mshv_mem_region *region;
  1335		struct vm_area_struct *vma;
  1336		bool is_mmio;
  1337		ulong mmio_pfn;
  1338		long ret;
  1339	
  1340		if (mem.flags & BIT(MSHV_SET_MEM_BIT_UNMAP) ||
> 1341		    !access_ok((const void *)mem.userspace_addr, mem.size))
  1342			return -EINVAL;
  1343	
  1344		mmap_read_lock(current->mm);
  1345		vma = vma_lookup(current->mm, mem.userspace_addr);
  1346		is_mmio = vma ? !!(vma->vm_flags & (VM_IO | VM_PFNMAP)) : 0;
  1347		mmio_pfn = is_mmio ? vma->vm_pgoff : 0;
  1348		mmap_read_unlock(current->mm);
  1349	
  1350		if (!vma)
  1351			return -EINVAL;
  1352	
  1353		ret = mshv_partition_create_region(partition, &mem, &region,
  1354						   is_mmio);
  1355		if (ret)
  1356			return ret;
  1357	
  1358		if (is_mmio)
  1359			ret = hv_call_map_mmio_pages(partition->pt_id, mem.guest_pfn,
  1360						     mmio_pfn, HVPFN_DOWN(mem.size));
  1361		else
  1362			ret = mshv_partition_mem_region_map(region);
  1363	
  1364		if (ret)
  1365			goto errout;
  1366	
  1367		/* Install the new region */
  1368		hlist_add_head(&region->hnode, &partition->pt_mem_regions);
  1369	
  1370		return 0;
  1371	
  1372	errout:
  1373		vfree(region);
  1374		return ret;
  1375	}
  1376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
