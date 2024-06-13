Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8318B133406
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 03:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718249854; cv=none; b=Ah+20YE80rlDYoxVcJVYFc8vDnkOw1k2+OkIMhZZX4338+Uw+SOLmMR+ZVoaqNt2PV4niJJn4Oq+w0yaQHCBognRlIqbAezspQ8xPaBcFXD4N+0o3FfziO+KLQf6sM5Lijah3EgI8c8kZp0eayDm+IRTHVe01Jk1J3i+Ap7k2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718249854; c=relaxed/simple;
	bh=yvwWecIztumJYSts0bzlLL/1htbHU0On99/E7NxnK8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtJyfmrrw4wJAeoUPkWYGvmGxLG9DctCEt/VViWqS3pHfEmaoo/Y1eDtOoDPQ7W5d2ZQM54fmsegTEoqrq/18jnK5gA1YDq6rYFVH9ATBFtTKkMDYL3lpnXpbo+oxUi3umT5Le6ltScG3Vhfv6KnY7zGMZ9hOfFpKvlrxieR7BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4JDfP3i; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4JDfP3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718249853; x=1749785853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvwWecIztumJYSts0bzlLL/1htbHU0On99/E7NxnK8s=;
  b=l4JDfP3iD1EiNjvXYYiPxdDJyiKPzNIIaJGWqUvGsX3ggzqTYcdukPu3
   8E36BydKgllq4WnN0ln6KIvEkRGwdDOW8UItXfI8XUmoBzBmG9vyTQddH
   1lJhgJK8+/RsCdTE84UwX6PpqGcx7ZfxyMQKDq35rO+oKjjHz5lrJkpYi
   7thKIaHR9IBQPV5zx3gH9fqS0KYDWmwAyb4lsK+DyTLgo1KxVnffaPY6M
   bsFrBn2q0Q26xtbLzo/pmvr4jP7Vg3d3TMtNbcnP8PRP94170UGrXrD6I
   tWcCNwiUjDRkytIoCkLNfnstNjUt/yvzNzlhCOlCnMFUM/mpk0MmnG3Uf
   w==;
X-CSE-ConnectionGUID: V50Vi0xkTnqi7UfnOVqLWA==
X-CSE-MsgGUID: Qulv3TFeRv+g7NVPV27ozQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15172830"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15172830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:37:32 -0700
X-CSE-ConnectionGUID: noEsmwLeTBylcr3cVEOG4w==
X-CSE-MsgGUID: KDfuEsssRAK24D+5a8xAQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="39857884"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2024 20:37:29 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbHD-0002BU-1C;
	Thu, 13 Jun 2024 03:37:27 +0000
Date: Thu, 13 Jun 2024 11:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 176/2439]
 drivers/iommu/exynos-iommu.c:1334:16: error: initialization of 'int
 (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,
  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long
 unsigned int,  long unsigned int,  i...
Message-ID: <202406131138.M8nkV9Vm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   220ab143d3d2e3e85057a532bee9dd887a1858e7
commit: 4f80a833819c98921d4b01c6a4ad2e8d98d2f8c3 [176/2439] iommu: Add gfp parameter to iommu_ops::map
config: arm64-randconfig-001-20240612 (https://download.01.org/0day-ci/archive/20240613/202406131138.M8nkV9Vm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131138.M8nkV9Vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131138.M8nkV9Vm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/exynos-iommu.c:1334:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1334 |         .map = exynos_iommu_map,
         |                ^~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:1334:16: note: (near initialization for 'exynos_iommu_ops.map')
   cc1: some warnings being treated as errors


vim +1334 drivers/iommu/exynos-iommu.c

aa759fd376fbbfc Marek Szyprowski 2015-05-19  1328  
0b9a36947c6bfa4 Arvind Yadav     2017-08-28  1329  static const struct iommu_ops exynos_iommu_ops = {
e1fd1eaa3323b3e Joerg Roedel     2015-03-26  1330  	.domain_alloc = exynos_iommu_domain_alloc,
e1fd1eaa3323b3e Joerg Roedel     2015-03-26  1331  	.domain_free = exynos_iommu_domain_free,
ba5fa6f65215188 Bjorn Helgaas    2014-05-08  1332  	.attach_dev = exynos_iommu_attach_device,
ba5fa6f65215188 Bjorn Helgaas    2014-05-08  1333  	.detach_dev = exynos_iommu_detach_device,
ba5fa6f65215188 Bjorn Helgaas    2014-05-08 @1334  	.map = exynos_iommu_map,
ba5fa6f65215188 Bjorn Helgaas    2014-05-08  1335  	.unmap = exynos_iommu_unmap,
ba5fa6f65215188 Bjorn Helgaas    2014-05-08  1336  	.iova_to_phys = exynos_iommu_iova_to_phys,
6d7cf02a8660cf5 Robin Murphy     2018-01-24  1337  	.device_group = generic_device_group,
ba5fa6f65215188 Bjorn Helgaas    2014-05-08  1338  	.add_device = exynos_iommu_add_device,
ba5fa6f65215188 Bjorn Helgaas    2014-05-08  1339  	.remove_device = exynos_iommu_remove_device,
2a96536e77b43cf KyongHo Cho      2012-05-12  1340  	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
aa759fd376fbbfc Marek Szyprowski 2015-05-19  1341  	.of_xlate = exynos_iommu_of_xlate,
2a96536e77b43cf KyongHo Cho      2012-05-12  1342  };
2a96536e77b43cf KyongHo Cho      2012-05-12  1343  

:::::: The code at line 1334 was first introduced by commit
:::::: ba5fa6f652151882ee630c70373365cf5c043df7 iommu/exynos: Remove unnecessary "&" from function pointers

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
