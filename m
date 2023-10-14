Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D962628A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 22:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLG0dkVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697323553; x=1728859553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hTtv7cQaNZwIYm7ZbJVqmYt+OWUnr8vqE9w7nzAvDn0=;
  b=JLG0dkVfvz74t7AaB+RE2n6ppq0A10sx9Fb9Q77QvY1LcCFOFprCmLhV
   oZd3YMgJz0jQZtsGI/zIa8TM5nalGV909D7S3xB5+tDcY1Pu6Pmic6dgR
   3elwuK/HhqthcBCWqfhRcgvFnhoCPz2Jg4osX72KzlQhugGOGPUGqlKoW
   cIz6hXrUQgis0zPYwdM7VaqZppWnDYjGRa7BlGIPrqrUMjYxeoMANQ9li
   27j3x0TviPcYxdvEMzAbNx41UCkeRpCUTTwcjwz/F3fU0OWPPPpcmCT0c
   uiS1QJCCfWYtXtKCHYkCXGhUzt8brDys5X4UF/HZ2iipQ7tZq3h/ULRW7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385191760"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="385191760"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 15:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790300312"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790300312"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2023 15:45:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrnOG-0006l9-14;
	Sat, 14 Oct 2023 22:45:48 +0000
Date: Sun, 15 Oct 2023 06:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10132023-yi 58/85]
 checkpatch: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
Message-ID: <202310150644.xxkwQ6ZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10132023-yi
head:   3f226b487e64cd6f04258236e83eb403526d3d0a
commit: d91730a7bd27f5f50439fd50cd05193c8417b8ee [58/85] iommu/arm-smmu-v3: Add arm_smmu_domain_alloc_user
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150644.xxkwQ6ZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150644.xxkwQ6ZQ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#97: FILE: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2925:
+__arm_smmu_domain_alloc(unsigned type,

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#143: FILE: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2971:
+static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#156: FILE: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:2984:
+	unsigned type = IOMMU_DOMAIN_UNMANAGED;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
