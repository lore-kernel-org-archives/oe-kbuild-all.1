Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A741509BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725002641; cv=none; b=lWJtGYxGv4P2BM5e4Ph6krS21pWreyl6Zt8gsIGznhX7vwWG0lTCfx37tJpgZLYhHPGdBTHacDS7IoivBGQv4yL9N8oOHi00mRyhw+9xtHJMG8dzmrFhQkHNcr0kOU8qm8kWWWiyiK2XyNvmx479jHQqfwr6sAtnvjTYVb+tozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725002641; c=relaxed/simple;
	bh=/Op7KTD3vSbDNbG+X7x36mVWMqkVdeNfPHjZqfvpeq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgu2Jo0rN/+YjS7gejO8gPsH6F2eCH8MwFeFEKFMF4mG32+jlemcd7MLSw8Mb4Pb++D5hSgnXmSQQ5fkQwpZLh4J8zI+ZNvAHkFoq1lxQnbBEepCQgUMFqFpiqXWKeZvOfHyvMj0scQ/L88YNe4DuV6Zo8LIgQNvn7FJAcIjuI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMumq2Hy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMumq2Hy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725002639; x=1756538639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Op7KTD3vSbDNbG+X7x36mVWMqkVdeNfPHjZqfvpeq8=;
  b=TMumq2Hy5Wr4nCUK6w5atcdmp57RL1Q2SrrymbQvu4P3C+Lrf2vIqAyT
   O4Ty2XK+AGZWH9ganUqfLTYupAJdADSt4FQ3S3aBZpsQOtUCBv10J9AdK
   hr7kMvQ6BONEhxAeA13sm/Jfp+TuPTDVb/Pn2ElIH1FH+uESRWkmQFNS3
   RanRAfcwYNDuRpRefFk5/QyFk/n2JCd9AeLdx9Dd90LqT+zYsrjaaWgNG
   5dFyfzI+ZU39kg3IExGnVI+gFk6J5IAyGR89aVSJE8IsjqTffhvzSGYPL
   +JzUn/GcXPJAEA9Fh2dE/jaY6JqAoXc8RUhmTJabhFhlvVKgIdwLD70xL
   g==;
X-CSE-ConnectionGUID: EGy4w/DDQsum5GZ4zMRZiA==
X-CSE-MsgGUID: mq3U7suaQvGKzcP9MAGHzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="35007737"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="35007737"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 00:23:59 -0700
X-CSE-ConnectionGUID: QYmRifueRayeDg2oSKroLA==
X-CSE-MsgGUID: +A4RtvQ2TWmxLJOHQt45CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="87053762"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2024 00:23:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjvz9-0001C8-1N;
	Fri, 30 Aug 2024 07:23:55 +0000
Date: Fri, 30 Aug 2024 15:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC PREVIEW 4/6] iommu: init pasid array while doing
 domain_replace and iopf is active
Message-ID: <202408301533.Re9SdBUG-lkp@intel.com>
References: <20240826-iopf-for-all-v1-4-59174e6a7528@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-iopf-for-all-v1-4-59174e6a7528@samsung.com>

Hi Klaus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 3d5f968a177d468cd13568ef901c5be84d83d32b]

url:    https://github.com/intel-lab-lkp/linux/commits/Klaus-Jensen/iommu-vt-d-Separate-page-request-queue-from-SVM/20240826-194355
base:   3d5f968a177d468cd13568ef901c5be84d83d32b
patch link:    https://lore.kernel.org/r/20240826-iopf-for-all-v1-4-59174e6a7528%40samsung.com
patch subject: [PATCH RFC PREVIEW 4/6] iommu: init pasid array while doing domain_replace and iopf is active
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240830/202408301533.Re9SdBUG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301533.Re9SdBUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301533.Re9SdBUG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:3511: warning: Function parameter or struct member 'domain' not described in 'iommu_init_pasid_array'
>> drivers/iommu/iommu.c:3511: warning: Function parameter or struct member 'group' not described in 'iommu_init_pasid_array'
>> drivers/iommu/iommu.c:3511: warning: Function parameter or struct member 'handle' not described in 'iommu_init_pasid_array'


vim +3511 drivers/iommu/iommu.c

  3500	
  3501	/**
  3502	 * iommu_init_pasid_array - Initialize pasid array in the domain group
  3503	 *
  3504	 * Returns 0 on success. Error code on failure
  3505	 *
  3506	 * An IOMMU_NO_PASID element is *NOT* replaced if there is one already there.
  3507	 */
  3508	int iommu_init_pasid_array(struct iommu_domain *domain,
  3509				   struct iommu_group *group,
  3510				   struct iommu_attach_handle *handle)
> 3511	{
  3512		int ret;
  3513	
  3514		if (handle)
  3515			handle->domain = domain;
  3516	
  3517		mutex_lock(&group->mutex);
  3518		ret = xa_insert(&group->pasid_array, IOMMU_NO_PASID, handle, GFP_KERNEL);
  3519		mutex_unlock(&group->mutex);
  3520	
  3521		if (ret == -EBUSY)
  3522			ret = 0;
  3523	
  3524		return ret;
  3525	}
  3526	EXPORT_SYMBOL_NS_GPL(iommu_init_pasid_array, IOMMUFD_INTERNAL);
  3527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
