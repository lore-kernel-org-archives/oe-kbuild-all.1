Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215302;
	b=D7z4KZcvZh7/rKLUYqlUzVOAFq7WJO0J2DsAEsyWld6fftPPVEpf2batlr+U08mA2Dbc
	 BTMwBh7iAcrdnowr5mO+k7tBZ55rsIXoD8qUvl8wQYE9xpg/2DfA0xX2ca22OafbuJrR3
	 lLjsdoGC8gzlehuOqZsf5iRU1+Fx4iNzeWTFAeF6VpLgtqdgbLUvu7FyaSq7J76aU6uAL
	 r3KAAz205RKpHxVKah4Z6xz7b5V9zHWIg2dklKO/xHXEs4hWyJ6+GZsuwhMG5pjvu4Y2G
	 PLY1ukLOW8DZwFPJFdei1uW7XUMFBZOWx4P1iMdyUMD73q25bNgEi5fsFTmNFW/HNCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215302;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WQYm4X1Ux25Z4pWOttanwbm7ixSARf4gwuHAw91ClSk=;
	b=HG0ZYTf4aohF4Qe5dUq3QXennefLxWpkYpvIxceQ4iJ0BGYtqC8gZHxEv18TLVDU5hk/
	 i6fcpyAa4GqlVyJUFGCOmcKK2WQELZ//tRpRoNVAqtFHJTU6KgcjP8VQhFUypVy5HgpVa
	 7vPYjX+2gyFtQm5ym4BLIykduHs9MFJFUltMA0a1YmFNZVdD3gEGlc14pV0AxbOQT706f
	 RbBVmPM0enIQNvf0GKjB0QZC4Wu0F8ZrnuY/WnWQW/JhjVTevKaOQyWwRwfpghwXzX6c8
	 MC+E9G/Wivvx1AeR5ouNHd6PT/lJuedRKnFgrMijWUVn/XB7M32VX9NNcp3RweglQwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSl8Rwan;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35511606A31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 19:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35511606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSl8Rwan
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793215302; x=1824751302;
  h=date:from:to:cc:subject:message-id;
  bh=MNCLUa+e6nqkal7MveVqCq5E9Eh1nmj0qNHGpd0kcuY=;
  b=cSl8RwannXhe6PGGejH7XFZ6fruB7OoZ38rADAOBhodLtY6rAez5g/NQ
   +s9zFYn0viXiD8WsjJfI2BJVAuKWTW+5vtckPoTLCzFMHrjdQPgL9M/eD
   zLUy7aLD9pst6ftdVovctuqqZnjZXNtkqOxZyxSoJ/IYVtViSnVArncsq
   21HECZJpGVUwZ1xLZE4j2xc8YF2UQDvxk6ltnyq4JBo4ARD0o4C0eURsr
   MuyxbbzVRnRr2go9l+Q3LfDoyrcIHYMXwTE6WtG5DufVcupBOJFU/A5NW
   k0AkKeq3zJIMuNaVpd/WopJQktAjVzPCCs7euwoEE7EVDVXJtP54YaGdJ
   w==;
X-CSE-ConnectionGUID: HnRlpdh4SneRRB3DUm2LOg==
X-CSE-MsgGUID: KdetVhZXTBmf6hbabvHbpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1833986"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1833986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:21:39 -0700
X-CSE-ConnectionGUID: AG93TLi/SleXLISJis4stQ==
X-CSE-MsgGUID: g2ipRbjdT1Krt/9Pdkl7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5451022"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2026 12:21:37 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM9DI-000000004xf-22ni;
	Wed, 28 Oct 2026 19:21:32 +0000
Date: Wed, 28 Oct 2026 20:20:47 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9]
 arch/x86/kernel/pci-dma.c:212:29: warning: unused variable 'domain'
Message-ID: <202610282005.sXO7aHhE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e404899677bc470e620572471a562f09ea3de082
commit: 8d155d8a7f748abf1ce6750a5a5e76a5bffaf1d2 [9/9] anolis: Fix streaming DMA writes disorder issue for Zhaoxin's KH-40000 platform
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261028/202610282005.sXO7aHhE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282005.sXO7aHhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282005.sXO7aHhE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/pci-dma.c: In function 'patch_check_paddr':
>> arch/x86/kernel/pci-dma.c:212:29: warning: unused variable 'domain' [-Wunused-variable]
     212 |         struct dmar_domain *domain;
         |                             ^~~~~~
>> arch/x86/kernel/pci-dma.c:211:33: warning: unused variable 'ops' [-Wunused-variable]
     211 |         const struct iommu_ops *ops;
         |                                 ^~~
   In file included from arch/x86/kernel/pci-dma.c:4:
   ./include/linux/iommu.h: At top level:
   ./include/linux/iommu.h:1263:17: warning: 'iommu_get_pasid_from_domain' defined but not used [-Wunused-function]
    1263 | static ioasid_t iommu_get_pasid_from_domain(struct device *dev,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/domain +212 arch/x86/kernel/pci-dma.c

   206	
   207	static int patch_check_paddr(struct device *dev, phys_addr_t paddr,
   208				     bool is_iommu)
   209	{
   210		unsigned long pfn;
 > 211		const struct iommu_ops *ops;
 > 212		struct dmar_domain *domain;
   213	
   214		if ((zhaoxin_patch_code & ZHAOXIN_P2CW_NODE_CHECK) == 0)
   215			return true;
   216	
   217		if (is_iommu) {
   218	#ifdef CONFIG_INTEL_IOMMU
   219			ops = pci_bus_type.iommu_ops;
   220			if (ops && ops->iova_to_phys) {
   221				domain = find_domain(dev);
   222				paddr = ops->iova_to_phys(&domain->domain, paddr);
   223			}
   224	#endif
   225		}
   226	
   227		pfn = PFN_DOWN(paddr);
   228		if (pfn_to_nid(pfn) != dev_to_node(dev))
   229			return true;
   230	
   231		return false;
   232	}
   233	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
