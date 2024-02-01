Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068426519D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 06:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706768382; cv=none; b=Q3PqY6C1y5lPKjGTyS51076+CLTsxJI42RA77YWjyeK1Bf4GyG1sbWaUQljsvl9KI/Deg9egVMXskxsMSA0bgl7J2kjjOnkCYb0IcuYVCD26UG+4VWXzbIRI+TfNs7xMu41HVKOkskq5Kv/UNfZwponmwfaw3MAQF9wpHtb3K9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706768382; c=relaxed/simple;
	bh=Ww7v/0MTZHy+Xp98ijQmjylvWOVoZsaNm2uNsYGZUk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhWmEqDFyvD4IW4vdKN2xoFBMA26I/9Jv8VSgK/K8S+4JRksf6KNXCCVAGKC1N9Ft5DCbCYgAvZvrPwrbOBZbTUIeO9sSAnW2oJEAqIcsac2OSZqtQdyUOwOiM0GJfVHOr1uE7bV3vR/T/Asb/LbbQkNnQNJmo+y+JiWshEwqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOgTE+f8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOgTE+f8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706768381; x=1738304381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ww7v/0MTZHy+Xp98ijQmjylvWOVoZsaNm2uNsYGZUk4=;
  b=KOgTE+f8Me6+l5XPdXaBJfF1aFSLcI/6sw/yhZe1u5CwuUJ7UCcDfrlH
   UgkeTPRSh2bCOrnGCMpxGTqhNG8L/O3n8Q3p+dQAsOtz6NJpDc8ME8xtX
   OD9x9SdarijHJK22lIyPbgWAojvIpP/9SQ13VkdrDn8V8f9ACKEK5xTv+
   BFOFbpmQ8lyYn1T5ar8mLXQjjbmcYc8T/b2m+H8Y8OJdd3bIVL8/y8g8P
   yMa4tNmCWia/IrPGT+m3k2RuakdntX7KrlMuh39dQgdut2OHAJD8NVKf5
   QM0dy/XFWUx7MGJM7jqr+CyQOpNnpW6XJ+3gTkZpMP4BQLxe4hHN7Unx6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="6784"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="6784"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 22:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822837399"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="822837399"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2024 22:19:36 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVQQ8-0002Ru-38;
	Thu, 01 Feb 2024 06:19:32 +0000
Date: Thu, 1 Feb 2024 14:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommu_cache_flush_refactor 8/8]
 drivers/iommu/intel/iommu.c:1463:12: warning: result of comparison of
 constant 18446744073709551615 with expression of type 'unsigned long' is
 always false
Message-ID: <202402011453.ETdeubJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommu_cache_flush_refactor
head:   f2fec66c24236299f6cd347135ac7b39ee5cc555
commit: f2fec66c24236299f6cd347135ac7b39ee5cc555 [8/8] iommu/vt-d: Wrap the cache flush for domain into a helper
config: i386-randconfig-016-20240201 (https://download.01.org/0day-ci/archive/20240201/202402011453.ETdeubJl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011453.ETdeubJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011453.ETdeubJl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:1463:12: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    1463 |         if (pages == U64_MAX)
         |             ~~~~~ ^  ~~~~~~~
   drivers/iommu/intel/iommu.c:1487:49: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    1487 |         domain_flush_caches(to_dmar_domain(domain), 0, U64_MAX, 0);
         |         ~~~~~~~~~~~~~~~~~~~                            ^~~~~~~
   include/linux/limits.h:25:19: note: expanded from macro 'U64_MAX'
      25 | #define U64_MAX         ((u64)~0ULL)
         |                          ^~~~~~~~~~
>> drivers/iommu/intel/iommu.c:3394:27: warning: unused variable 'drhd' [-Wunused-variable]
    3394 |                         struct dmar_drhd_unit *drhd;
         |                                                ^~~~
>> drivers/iommu/intel/iommu.c:3395:24: warning: unused variable 'iommu' [-Wunused-variable]
    3395 |                         struct intel_iommu *iommu;
         |                                             ^~~~~
   4 warnings generated.


vim +1463 drivers/iommu/intel/iommu.c

  1440	
  1441	/*
  1442	 * For a domain, when there is modification, needs to flush iotlb or piotlb
  1443	 * and devTLB. Today, domain tracks attached devices, pasids and iommus. To
  1444	 * invalidate iotlb, should loop all the attched iommus; To invalidate piotlb
  1445	 * loops all the attached iommus, and also loop iommus to invalidate piotlb
  1446	 * with RID_PASID (a.k.a. IOMMU_NO_PASID); To invalidate devTLB, loop all the
  1447	 * attached devices and pasids.
  1448	 */
  1449	void domain_flush_caches(struct dmar_domain *domain, unsigned long pfn,
  1450				 unsigned long pages, int ih)
  1451	{
  1452		struct iommu_domain_info *info;
  1453		unsigned long idx;
  1454		unsigned int mask;
  1455	
  1456		if (domain->use_first_level)
  1457			domain_flush_pasid_iotlb(domain, pfn << VTD_PAGE_SHIFT,
  1458						 pages, ih);
  1459		else
  1460			xa_for_each(&domain->iommu_array, idx, info)
  1461				iommu_flush_iotlb_psi(info->iommu, domain,
  1462						      pfn, pages, ih);
> 1463		if (pages == U64_MAX)
  1464			mask = MAX_AGAW_PFN_WIDTH;
  1465		else
  1466			mask = ilog2(__roundup_pow_of_two(pages));
  1467	
  1468		domain_flush_dev_iotlb(domain, pfn << VTD_PAGE_SHIFT, mask);
  1469	}
  1470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
