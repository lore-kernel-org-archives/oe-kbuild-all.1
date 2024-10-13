Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E456A13D245
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728828233; cv=none; b=DM+1WeHWf0avWsdBG/jMVxqNRTk6Ev7KFtqN0etVaOwDOVVktSqVExpK8CKnRbv8xDbu7p/fCqOkKMG512UM3qPjQwQnOVLmnPALVqtdPeKRPmPN0KPxza8GWpX0peWpwOHhkTKwSIiGsiTlSwuIwbxJflCgiiZpYXqwL5wSoCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728828233; c=relaxed/simple;
	bh=a9MU0wNnjLVoUCv18GcJFPayp46wVYPuG32YMmH+toY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DD2DCOxy1WALlySCjAHvfTp6R1ALONzGeunwKryYV92zVvNto3Wpn65yt+9AkVg95twYHLg1ZNvP+a/2//YdjkbNjMUvq+55AObG1Dpyvkg74kswL1JJYDgByk7mEc1sWgZCRwzWZ7ioVEdIJ1cWo3hn0Y70dHkfcjeJD048czU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSHBoYKC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSHBoYKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728828231; x=1760364231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9MU0wNnjLVoUCv18GcJFPayp46wVYPuG32YMmH+toY=;
  b=QSHBoYKC2HJvrOLnzP7CCAKWaq2K8idS5Q9pzb7O36J71L1Z7/iljzpu
   9cANyQn8hBFJh5lTLeiWuvvaoF0VineGrHs+Ug+DWqBukb3u2FwtpN8uP
   TAe2vmoer08LkyBg8IZaigtiFq8sPfalE7KBqxTjgYGQJndmM3fBa9lE7
   FUldflqlfwsXgZkeb0KL0ShYtKZN8bRuWcQb3HbrZ8VhsYH8qLAniG6tS
   Mv0euKWruq0JiacC0b+txaA2L3MDHuQDdiPw4ooow9qZwwjIqzp0svtTm
   PpLCI/hq4ZG02QShMS+xlkzqVS7dfWth69Q/PtVQ+Ydk0V/MDBvtnUSs6
   w==;
X-CSE-ConnectionGUID: VwwmagO+RxKxgA/UIdZBJQ==
X-CSE-MsgGUID: 4lPN/0UeSaeqVsHgjV0W5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38736267"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38736267"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 07:03:50 -0700
X-CSE-ConnectionGUID: jJIShQyZR4SJXfS851Om5g==
X-CSE-MsgGUID: LKwdDhlCSxqg34V2gbEDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="77666299"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Oct 2024 07:03:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szzCF-000EPH-0p;
	Sun, 13 Oct 2024 14:03:47 +0000
Date: Sun, 13 Oct 2024 22:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9646/14354] drivers/iommu/iommu.c:1141: undefined
 reference to `iova_reserve_domain_addr'
Message-ID: <202410132114.NOaWoR8U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b52135712fc8eae0751505713e1caf086a1437d4
commit: 40c9fc02b0564bbcbc3fc6e14f3aea3639f0afa6 [9646/14354] iommu/vt-d: Add support for detecting ACPI namespace device in RMRR
config: x86_64-randconfig-003-20241013 (https://download.01.org/0day-ci/archive/20241013/202410132114.NOaWoR8U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410132114.NOaWoR8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410132114.NOaWoR8U-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/iommu.o: in function `iommu_create_device_direct_mappings':
>> drivers/iommu/iommu.c:1141: undefined reference to `iova_reserve_domain_addr'


vim +1141 drivers/iommu/iommu.c

  1085	
  1086	static int iommu_create_device_direct_mappings(struct iommu_domain *domain,
  1087						       struct device *dev)
  1088	{
  1089		struct iommu_resv_region *entry;
  1090		struct list_head mappings;
  1091		unsigned long pg_size;
  1092		int ret = 0;
  1093	
  1094		pg_size = domain->pgsize_bitmap ? 1UL << __ffs(domain->pgsize_bitmap) : 0;
  1095		INIT_LIST_HEAD(&mappings);
  1096	
  1097		if (WARN_ON_ONCE(iommu_is_dma_domain(domain) && !pg_size))
  1098			return -EINVAL;
  1099	
  1100		iommu_get_resv_regions(dev, &mappings);
  1101	
  1102		/* We need to consider overlapping regions for different devices */
  1103		list_for_each_entry(entry, &mappings, list) {
  1104			dma_addr_t start, end, addr;
  1105			size_t map_size = 0;
  1106	
  1107			if (entry->type == IOMMU_RESV_DIRECT)
  1108				dev->iommu->require_direct = 1;
  1109	
  1110			if ((entry->type != IOMMU_RESV_DIRECT &&
  1111			     entry->type != IOMMU_RESV_DIRECT_RELAXABLE) ||
  1112			    !iommu_is_dma_domain(domain))
  1113				continue;
  1114	
  1115			start = ALIGN(entry->start, pg_size);
  1116			end   = ALIGN(entry->start + entry->length, pg_size);
  1117	
  1118			for (addr = start; addr <= end; addr += pg_size) {
  1119				phys_addr_t phys_addr;
  1120	
  1121				if (addr == end)
  1122					goto map_end;
  1123	
  1124				phys_addr = iommu_iova_to_phys(domain, addr);
  1125				if (!phys_addr) {
  1126					map_size += pg_size;
  1127					continue;
  1128				}
  1129	
  1130	map_end:
  1131				if (map_size) {
  1132					ret = iommu_map(domain, addr - map_size,
  1133							addr - map_size, map_size,
  1134							entry->prot, GFP_KERNEL);
  1135					if (ret)
  1136						goto out;
  1137					map_size = 0;
  1138				}
  1139			}
  1140			if (apply_zhaoxin_dmar_acpi_a_behavior())
> 1141				iova_reserve_domain_addr(domain, start, end);
  1142		}
  1143	
  1144		if (!list_empty(&mappings) && iommu_is_dma_domain(domain))
  1145			iommu_flush_iotlb_all(domain);
  1146	
  1147	out:
  1148		iommu_put_resv_regions(dev, &mappings);
  1149	
  1150		return ret;
  1151	}
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
