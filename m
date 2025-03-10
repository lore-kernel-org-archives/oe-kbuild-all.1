Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60F1CAA8D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 23:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741651165; cv=none; b=NGCfKZTILvovat7AbOmhd4695mgKXgObYMLG8JzbxCNY1a2uOirsuRNZki6w4yyNEXarqTUuJh4iJSFBu+hTeI9mG3+i7Su1vhqvGPKEqip6iPpUNId02lW7UJb8TVmqh6Fz8637gtuyGGtihPQ3YxHCDMsNryIP+FPQ7M86fZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741651165; c=relaxed/simple;
	bh=RdWNqdjOYBcipwhVIpIK0ZyhEUwGVcCqyxWQfei2PaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iFivFB3jb8pdpkP4CW0B1/Z+39JzbDOBX/Uex0fjxa95x5z/5QoHsrU736bVIWwz1GttDMlhXN+gfzdsisMlP2K0y6olRZj6wKavEdb4W3Sy/wo5xT/KEbyNklQxn1nioEnsHcpLDopbMQld3kadCbAaC1pGACZKd3gdxX4oSz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lggllcBX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lggllcBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741651163; x=1773187163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RdWNqdjOYBcipwhVIpIK0ZyhEUwGVcCqyxWQfei2PaI=;
  b=lggllcBXZO2OOPjch9NLccNby0yJRsXtv+4GYsOVr89wqFeJpL79AJFn
   O0JkOSSjFsX7IvQEDpyX55gqv/ynAVvkExG6EBlljN7WSK2qt/Ct0aLPX
   c4twMQMP0TMK5TQ6MOQHsMrMS7wmV9ulyMGwOS+FFA+I/Jb2yHUZaIDkm
   /aC8nf1OdLOrjWxlOW34j7kmfzUX/tojqIvUwS0GKMM2vME9VSE71+/Tz
   r3W9JSy5atqsl3r9CLbJ9DWRbnhtRWslfbBsJ8qphtgd7wuf+ZnA6MAwd
   5AY3OC+917y/aOquDvYxNn74210t/PetoGfwBbXu1MCNGpzrLXw5JRQ9q
   A==;
X-CSE-ConnectionGUID: nKYVEU7pSmCAm3b02RmCvg==
X-CSE-MsgGUID: wiaJAAs0TdmbTdbiQbh87w==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46582224"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46582224"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 16:59:22 -0700
X-CSE-ConnectionGUID: RnZLrLu8SzSEM5Cv5PJdnA==
X-CSE-MsgGUID: huM8Ou4lSjCvqOiNkHn95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="124743922"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2025 16:59:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trn1j-0006CK-2N;
	Mon, 10 Mar 2025 23:59:19 +0000
Date: Tue, 11 Mar 2025 07:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/iommu/intel/svm.c:1283:29: warning: variable 'dmar_domain' set but
 not used
Message-ID: <202503110732.oWEIk9Hj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   772fd766e9f0e1213cbab5bb0210e434bddd000d
commit: 3f66daea93f887b85e6b0e98416a88b5e907b084 [1/1] iommu/vt-d: Check pasid ownership in intel_svm_page_response
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250311/202503110732.oWEIk9Hj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110732.oWEIk9Hj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110732.oWEIk9Hj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/intel/svm.c: In function 'intel_svm_page_response':
>> drivers/iommu/intel/svm.c:1283:29: warning: variable 'dmar_domain' set but not used [-Wunused-but-set-variable]
    1283 |         struct dmar_domain *dmar_domain;
         |                             ^~~~~~~~~~~


vim +/dmar_domain +1283 drivers/iommu/intel/svm.c

  1276	
  1277	int intel_svm_page_response(struct iommu_domain *domain,
  1278				    struct device *dev,
  1279				    struct iommu_fault_event *evt,
  1280				    struct iommu_page_response *msg)
  1281	{
  1282		struct iommu_fault_page_request *prm;
> 1283		struct dmar_domain *dmar_domain;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
