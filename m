Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249322573
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 06:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694847100; x=1726383100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZZg8/cvKqf7zy61oEAPkOsw78LGnSaxZF6BHY4bzSg=;
  b=h6KpBR8R2P/kGVSBuhYQVseNJNIXyBW2HWZtjPmEUwao6WQTqoQdb1Mh
   j+Yu8Z9PRTeQ4swMpVl7VIQQ/evvEM3XYUMq0jWAPERNkA80PZ87SOeg3
   jRdSTW3ixT1iZ8B5nGlxOVR8Gfdj+b6RjLu/I+1f+E51rnWTIFIoTezMa
   rhrwfrE/r8vDcU3jZCmPglpFLZEfrynaV7CLE4cYJP25B2VyeOZpXidNN
   /ZOfDFLEiFsRyZDoT6vR6QnkFH9//HCPNPs70OnZ+9Ew6AFLJtJdsw1aI
   xtDZSmcuwBJfFYr+Ul8ZUPJJjVCH5uQNqVogjPZEx+mrgqS3i/dHqAAJS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364444464"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="364444464"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 23:51:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="738569926"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="738569926"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Sep 2023 23:51:38 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhP9T-0003zq-36;
	Sat, 16 Sep 2023 06:51:35 +0000
Date: Sat, 16 Sep 2023 14:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd-v5.19-rc5 93/104]
 drivers/iommu/intel/nested.c:288:22: warning: no previous prototype for
 function 'intel_nested_domain_alloc'
Message-ID: <202309161441.wgGCvggL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: 3d58f63f746cd38647d80d943335de4e5972bbf0 [93/104] iommu/vt-d: Add support for nested mode translation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230916/202309161441.wgGCvggL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161441.wgGCvggL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161441.wgGCvggL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/nested.c:288:22: warning: no previous prototype for function 'intel_nested_domain_alloc' [-Wmissing-prototypes]
   struct iommu_domain *intel_nested_domain_alloc(struct iommu_domain *s2_domain,
                        ^
   drivers/iommu/intel/nested.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct iommu_domain *intel_nested_domain_alloc(struct iommu_domain *s2_domain,
   ^
   static 
   1 warning generated.


vim +/intel_nested_domain_alloc +288 drivers/iommu/intel/nested.c

   287	
 > 288	struct iommu_domain *intel_nested_domain_alloc(struct iommu_domain *s2_domain,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
