Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83B68472
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745071418; cv=none; b=Xu54dZCQHcyywF7BuZ+JjBFEsdgFbKLnYvw7q7BwAr/9Jk88Wf064e8Sb6QWSuNaKH1ayUsShjkNnV0ta7qy4SIRJ5FY0bP9idwU3fWXSjIZECMbRde/9R9NSg20Rf5zOnaYmNZ2iNWlDpkTnBRl5fit9EclPogd3UHhjxo9RPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745071418; c=relaxed/simple;
	bh=MlNSGlYbpcYu0P5quqWKu7pPwKVYlV5JhGEsPA1teS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6enP7zJ+W0ivp4Xrgug5EpH5SFmUf79Xdn4HNRy9+wcv2vWRxsMb/48BP/gZWYFY2AqMNqCj20nByXHSwYfSstDqnAfIj3hqd2dSp6/MAxzmRIbFNBt5ddOQRc6Ubsx84IXjhnku5nbqJHaZjdj2WzTIwdto4W9Gk6eX18Zq/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vo2BRpg2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vo2BRpg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745071416; x=1776607416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlNSGlYbpcYu0P5quqWKu7pPwKVYlV5JhGEsPA1teS8=;
  b=Vo2BRpg2YaH+rir9OykavRM5zbzpXZnc7jcD/2No0dpfo5vDT8iF/w4R
   52YeIpy6E4tu0ajQ2jbm7IBnlaR4duAiD0ZXGGo0IV2oVE/bZNIB0Jxfl
   jDoPRPk9zB36Snc7MdjbUoQm/frzr0wvtvag6NaTw8+yvDwhoQMjZuP7f
   V6GnUFQNCiB8J6OlP0Dx3GKnVL3iGuQZxNGytelPts7fSyL1xhYpjnZ6L
   Ycd9DZ/JE+hZr7ZzzLlpSkcqeML8E3dnbGeHBqtvLr2KHFZEdWStqtaCO
   mDo2w++wfxXPcb9CcCm581xS9HN/MTaZJSVD9yEr+sTXlPm9hT9CaaCY0
   Q==;
X-CSE-ConnectionGUID: AwqGS1mjRpWoQEe0LRhaTA==
X-CSE-MsgGUID: rSm1hqLnSUGmguCuLe6HVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46566575"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46566575"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 07:03:35 -0700
X-CSE-ConnectionGUID: klVSIjakQYGEsusS3WkC0w==
X-CSE-MsgGUID: 47CjRMRUTneWYHh1eNRm0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131197017"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Apr 2025 07:03:34 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u68n5-0003uJ-2t;
	Sat, 19 Apr 2025 14:03:31 +0000
Date: Sat, 19 Apr 2025 22:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 06/10] iommu: Add a helper to check for user
 ownership
Message-ID: <202504192106.ned5rxJr-lkp@intel.com>
References: <20250418233409.3926715-7-praan@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418233409.3926715-7-praan@google.com>

Hi Pranjal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v6.15-rc2 next-20250417]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-arm-smmu-v3-Refactor-arm_smmu_setup_irqs/20250419-073729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20250418233409.3926715-7-praan%40google.com
patch subject: [RFC PATCH v2 06/10] iommu: Add a helper to check for user ownership
config: csky-randconfig-002-20250419 (https://download.01.org/0day-ci/archive/20250419/202504192106.ned5rxJr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504192106.ned5rxJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504192106.ned5rxJr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:3355: warning: expecting prototype for iommu_group_dma_owner_kernel(). Prototype was for iommu_group_dma_owner_user() instead


vim +3355 drivers/iommu/iommu.c

  3346	
  3347	/**
  3348	 * iommu_group_dma_owner_kernel() - Query if kernel owns the group dma
  3349	 * @group: The group.
  3350	 *
  3351	 * This provides status query on a given group. It is racy and only for
  3352	 * non-binding status reporting.
  3353	 */
  3354	bool iommu_group_dma_owner_user(struct iommu_group *group)
> 3355	{
  3356		void *user;
  3357	
  3358		mutex_lock(&group->mutex);
  3359		user = group->owner;
  3360		mutex_unlock(&group->mutex);
  3361	
  3362		return user ? true : false;
  3363	}
  3364	EXPORT_SYMBOL_GPL(iommu_group_dma_owner_user);
  3365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
