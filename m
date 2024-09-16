Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0C9443
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 21:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726523556; cv=none; b=lczcOV7ey8U/Fa69ApGEOr4O25+KQxt6dTHkCv2stBp6rA5bPREkDGoy3qPnTwDm0dJKnJpawh1Niwi8xGWXbb9mF7itCGGgyPoURqyhYVyiUzX6DvYtGFUqAPovtnDgKdB5ZDXLnlP2IZZ8Q6Mx+GrTfUL6d0xeO0qr0kuAAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726523556; c=relaxed/simple;
	bh=HlfY30AqFFbFzRcsp7uvncuFQYrwzy0Rq7Dv21iIGAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ynah2WU5V0ExtzE0PjB6cNqGKUeSityf3/KghwZi63pZkGriksRfwEt8oa6nb/JedbWMBGuOTDooz+awnxq2PHQXqVW0iw3UovjVQpdC7mPouT2OBWXQ33oNIiJVD0hn8d8o4b1VDrmCihetXarQgPiiDpZVWlWb76FCjem/4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUt2h1+A; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUt2h1+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726523555; x=1758059555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HlfY30AqFFbFzRcsp7uvncuFQYrwzy0Rq7Dv21iIGAg=;
  b=EUt2h1+AJSVKwSTaJViGqGXT4mDUBSRexXysSfi3tUUuTNRmKzOKzbht
   3wRv1GVcceKL6AzZCbz29BGz44iCOdJ44iC4KepXb3KHW9GkzqX8Leu5s
   gS0cTHjiGhxMtPdiS4UqpiWo/fz54oIUkS7Gm2xNAN6veSk+cCHZdaiiS
   2MBXFWCch1fhVonX1EqXo8cfEQqw0VOQulvkKlk8tawaWjdfTmNpLFhcb
   xbddM+tVuw/DTJ9+0Zp2u8EVljf9Cit29AuGdJYA4tDlxbNcb7px9RVk7
   l0BivQdTN4tqMVVYCctk2WjQ+SadHRpUaXi1u/EJnGfc4T1S0nlDmocMS
   g==;
X-CSE-ConnectionGUID: QPEtIf20Rei4Ph0SKePvHQ==
X-CSE-MsgGUID: vWdYfsVKT2m8mTwNtU6mog==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29112471"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29112471"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 14:52:33 -0700
X-CSE-ConnectionGUID: C6F41pKpTc2XUz/Jgy15zw==
X-CSE-MsgGUID: PAHpsv7SQnOj1LviKbyWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73819584"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2024 14:52:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqJdz-000AXG-0b;
	Mon, 16 Sep 2024 21:52:27 +0000
Date: Tue, 17 Sep 2024 05:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10800/10952] drivers/iommu/iommu.c:1107: undefined
 reference to `iova_reserve_domain_addr'
Message-ID: <202409170541.5pp0n4Xa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   df2c80fc64e69be0095e3315c470353b01ce0c31
commit: e1577467ecbc0e59577e1c31d15492c0401f8302 [10800/10952] iommu/vt-d: Add support for detecting ACPI namespace device in RMRR
config: x86_64-randconfig-003-20240916 (https://download.01.org/0day-ci/archive/20240917/202409170541.5pp0n4Xa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170541.5pp0n4Xa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170541.5pp0n4Xa-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `iommu_create_device_direct_mappings':
>> drivers/iommu/iommu.c:1107: undefined reference to `iova_reserve_domain_addr'


vim +1107 drivers/iommu/iommu.c

  1051	
  1052	static int iommu_create_device_direct_mappings(struct iommu_domain *domain,
  1053						       struct device *dev)
  1054	{
  1055		struct iommu_resv_region *entry;
  1056		struct list_head mappings;
  1057		unsigned long pg_size;
  1058		int ret = 0;
  1059	
  1060		pg_size = domain->pgsize_bitmap ? 1UL << __ffs(domain->pgsize_bitmap) : 0;
  1061		INIT_LIST_HEAD(&mappings);
  1062	
  1063		if (WARN_ON_ONCE(iommu_is_dma_domain(domain) && !pg_size))
  1064			return -EINVAL;
  1065	
  1066		iommu_get_resv_regions(dev, &mappings);
  1067	
  1068		/* We need to consider overlapping regions for different devices */
  1069		list_for_each_entry(entry, &mappings, list) {
  1070			dma_addr_t start, end, addr;
  1071			size_t map_size = 0;
  1072	
  1073			if (entry->type == IOMMU_RESV_DIRECT)
  1074				dev->iommu->require_direct = 1;
  1075	
  1076			if ((entry->type != IOMMU_RESV_DIRECT &&
  1077			     entry->type != IOMMU_RESV_DIRECT_RELAXABLE) ||
  1078			    !iommu_is_dma_domain(domain))
  1079				continue;
  1080	
  1081			start = ALIGN(entry->start, pg_size);
  1082			end   = ALIGN(entry->start + entry->length, pg_size);
  1083	
  1084			for (addr = start; addr <= end; addr += pg_size) {
  1085				phys_addr_t phys_addr;
  1086	
  1087				if (addr == end)
  1088					goto map_end;
  1089	
  1090				phys_addr = iommu_iova_to_phys(domain, addr);
  1091				if (!phys_addr) {
  1092					map_size += pg_size;
  1093					continue;
  1094				}
  1095	
  1096	map_end:
  1097				if (map_size) {
  1098					ret = iommu_map(domain, addr - map_size,
  1099							addr - map_size, map_size,
  1100							entry->prot, GFP_KERNEL);
  1101					if (ret)
  1102						goto out;
  1103					map_size = 0;
  1104				}
  1105			}
  1106			if (apply_zhaoxin_dmar_acpi_a_behavior())
> 1107				iova_reserve_domain_addr(domain, start, end);
  1108		}
  1109	
  1110		if (!list_empty(&mappings) && iommu_is_dma_domain(domain))
  1111			iommu_flush_iotlb_all(domain);
  1112	
  1113	out:
  1114		iommu_put_resv_regions(dev, &mappings);
  1115	
  1116		return ret;
  1117	}
  1118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
