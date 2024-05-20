Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0780134404
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716209844; cv=none; b=Dnxt7JGhncd63Qq85JlLYDGSgEAueYZSocaZFjkZ986SXfOxB2nKrL4KWJby+YXRkP/k4mAsCquU8y3XQagSG7dptZqpMSLl9fEEFJF+leVcTrgvkzHsP/CXL7f+kghxLu622xSDNF6flsTcj4EyEkWCTgX9ffhCba4R5TPrc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716209844; c=relaxed/simple;
	bh=lYXNVxccHgj0zLve1ykCIDsodpCZgm2POalzqyoEOCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3e/KHD1qQi74TOau2xtUU0htnAN7KU5RDUiWK0hshobWS4iP1szhizr5mUwzHk5Z97JY9jxczshXB77kuPmoQsAD6S9+DnN+r7Uxk42D1gTsnqH6WtYvmtWk+QuxUX4EHuLvpzInsKPcYY2jKeiILWnZjvESFuqQBiirfdncXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAmlSUaT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAmlSUaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716209842; x=1747745842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lYXNVxccHgj0zLve1ykCIDsodpCZgm2POalzqyoEOCU=;
  b=iAmlSUaTy5URJgLGQBYv3X580uXj+tSpd6fL67C98B/7iheHtXTRm1M6
   BTkOg110iuNlZxA+mea9jmSWpL8a0iTTNzsJDEYE2lkGkWBzOpQR27Dgy
   +NU9ewnS8sddrOJlQncNUM4WVe574GVfRALb1gCXszRUdKkrV+R78ojTd
   Fhd4voF6i/JjjTvXUON63R8XTV3p7Rtu5SH3Cm3BncOB4qg97oJcdPjdx
   08s4S9v2VcFigBK58drZHQxFds5MwScqGGsYxsLtk2xER0DcwYW62vOob
   Q0VaiKzCvLrNXgxZcZeVoSW3Gup+pkEwCgiRF6076n8OZuO4tAemL7Pc+
   A==;
X-CSE-ConnectionGUID: W+7hhyiKT1uwx68KX2fyng==
X-CSE-MsgGUID: OjFX701RQQyp+Qjz8vPSlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23007596"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="23007596"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:57:20 -0700
X-CSE-ConnectionGUID: OOpTo2uBTMiLhB40k3fY/A==
X-CSE-MsgGUID: 2Zer2kwJTcK9RVJYdhgoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="55754992"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2024 05:57:19 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s92Zn-0004rc-24;
	Mon, 20 May 2024 12:57:15 +0000
Date: Mon, 20 May 2024 20:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9639/9669] drivers/iommu/iommu.c:1141:undefined
 reference to `iova_reserve_domain_addr'
Message-ID: <202405202025.9w8wgmwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb74bc369fd2ab5f41a32c4ddc2e23bc76c3c550
commit: 40c9fc02b0564bbcbc3fc6e14f3aea3639f0afa6 [9639/9669] iommu/vt-d: Add support for detecting ACPI namespace device in RMRR
config: x86_64-randconfig-161-20240520 (https://download.01.org/0day-ci/archive/20240520/202405202025.9w8wgmwQ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405202025.9w8wgmwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405202025.9w8wgmwQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iommu/iommu.o: in function `iommu_create_device_direct_mappings':
>> drivers/iommu/iommu.c:1141:(.text+0x263a): undefined reference to `iova_reserve_domain_addr'


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
