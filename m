Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E7C18EDF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 23:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLBT5zeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702682971; x=1734218971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4pssi2m7MqGO2PgJ7jLD5FXCCNAlm3/D84DFIQ7nEQ=;
  b=kLBT5zebOsetkDnachCJGTsZW9UuO0Yg0H2KMMvg3fD4Dcpdj/PP24ld
   K0jrFAGdWGY0RLyy6bm1n6MPqz3kXd9tp3Ex7RnlWlC3Itc4YbzxOSwhW
   8vu3qQSfTzHDdKqVKgOhUJBj2NsjHct56M/q4B015zsfC4d4oZtgJAtZ6
   fJJKHpqSEOtsBg+yAIv5QVZV3UXIZcFDUKZEfhcH0zHq++fny8UjxyjWp
   QoU5XKcb5iCToOna53TcJk9zaLblmMxDb4CpIgO2L/RXlvbR7JE23zP41
   lzh2yZCxq9l2Id7Fk7v7pTNj2JZxE5c2bq1X7575r6tNg5fevoYUx6fbp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="394215457"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="394215457"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 15:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="751096026"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="751096026"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Dec 2023 15:29:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEHcV-0000tG-0z;
	Fri, 15 Dec 2023 23:29:27 +0000
Date: Sat, 16 Dec 2023 07:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-12152023-yi 11/11]
 drivers/iommu/intel/nested.c:118:13: warning: result of comparison of
 constant 18446744073709551615 with expression of type 'unsigned long' is
 always false
Message-ID: <202312160738.yWwXcu4g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-12152023-yi
head:   1fc6dd7d3f558b016c19bb58593a9ae01e833766
commit: 1fc6dd7d3f558b016c19bb58593a9ae01e833766 [11/11] iommu/vt-d: Add iotlb flush for nested domain
config: i386-randconfig-011-20231216 (https://download.01.org/0day-ci/archive/20231216/202312160738.yWwXcu4g-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160738.yWwXcu4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160738.yWwXcu4g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/nested.c:118:13: warning: result of comparison of constant 18446744073709551615 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
           if (npages == U64_MAX)
               ~~~~~~ ^  ~~~~~~~
   1 warning generated.


vim +118 drivers/iommu/intel/nested.c

   110	
   111	static int intel_nested_flush_cache(struct dmar_domain *domain, u64 addr,
   112					    unsigned long npages, u32 *fault)
   113	{
   114		struct iommu_domain_info *info;
   115		unsigned long i;
   116		unsigned mask;
   117	
 > 118		if (npages == U64_MAX)
   119			mask = 64 - VTD_PAGE_SHIFT;
   120		else
   121			mask = ilog2(__roundup_pow_of_two(npages));
   122	
   123		xa_for_each(&domain->iommu_array, i, info) {
   124			nested_flush_pasid_iotlb(info->iommu, domain, addr, npages, 0);
   125	
   126			if (domain->has_iotlb_device)
   127				continue;
   128	
   129			nested_flush_dev_iotlb(domain, addr, mask, fault);
   130			if (fault)
   131				return -EIO;
   132		}
   133	
   134		return 0;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
