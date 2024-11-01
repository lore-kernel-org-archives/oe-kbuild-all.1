Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BF7125D5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730423224; cv=none; b=JFLLt0XzgWoxCadgW19Re6nVbT3S20bC5DJeCiBg7SnKCqlQOIvQM57O1EO7wVM4JIYLrP7i6JEdl4y6uZFXldG3yrQluSido/VTg3lmk98EjQ6VAZrgnbgUzPTnvyI3iMwhBvwjqhV5cbXTAbXqzBT2DbKsIT5J7FzzDRBPpd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730423224; c=relaxed/simple;
	bh=+lNwN2op3r5+VnkfV7LgD392OWzoTg0SLbkcbC1/YM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KT6FFJjywd7KhvPV3wZg0X4TtgSW1aZ8Ltodt0gvnsNiRiy6fNxmduSXqLUENSto+kxn3ifkD0xkLxKRPQr9SiCgzDPhtMKB7ng9qzGAtzoRmQrjpyl5n49rQOyuvVHh/eq7JmQYXDvfAAq1M2rLI2vyff1rAGxjALjaX7EO2GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2xwXfag; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2xwXfag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730423218; x=1761959218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+lNwN2op3r5+VnkfV7LgD392OWzoTg0SLbkcbC1/YM4=;
  b=P2xwXfaghAhrMiGAMPjjneZUKJx97u3ktTByURtF3x8kIg8Zj1IHJvBo
   wa2+DENQxr6uZ5QHRtFI7y8jacI2AwG/XsfBSlXVJ+G2bP/qyzuzV8PcM
   voWLEzGHbvBlzHkB64huFoiWAeewQx2c5shYFXlub3kbmaD9GxZ25B23y
   bwmhHwsv5SJ9wP5hMy4vMuyn+16WjaaAwaGW1wxx0edNr9BiBP7r0V6DA
   b9t/3uB/JRUv+cM+f6Fakh99BUBS7IeD5b+NdNgSeFiHx1NLB33J8IbO5
   Rba0gOK/QOWQlS1+V8+zTFLhcmwlB5h5eRBLLHgf/9KzwzHEISLH8Rx54
   A==;
X-CSE-ConnectionGUID: nwJEnNbAQvSfLxaDFzQTsQ==
X-CSE-MsgGUID: W7BpyUwwS4WeI/no8s05hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29608935"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="29608935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 18:06:58 -0700
X-CSE-ConnectionGUID: uwdPcnIJS1iqH/GYmXlwzQ==
X-CSE-MsgGUID: ioLnf3cJScefOlySxukcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82929787"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 18:06:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6g7q-000gxY-21;
	Fri, 01 Nov 2024 01:06:54 +0000
Date: Fri, 1 Nov 2024 09:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 07/13] iommufd: Allow pt_id to carry viommu_id for
 IOMMU_HWPT_ALLOC
Message-ID: <202411010855.z6PCnINk-lkp@intel.com>
References: <41800674501340c4503cc3ad79affd19449a9ee1.1730313237.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41800674501340c4503cc3ad79affd19449a9ee1.1730313237.git.nicolinc@nvidia.com>

Hi Nicolin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241030]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes linus/master v6.12-rc5 v6.12-rc4 v6.12-rc3 v6.12-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommufd-Move-struct-iommufd_object-to-public-iommufd-header/20241031-053737
base:   next-20241030
patch link:    https://lore.kernel.org/r/41800674501340c4503cc3ad79affd19449a9ee1.1730313237.git.nicolinc%40nvidia.com
patch subject: [PATCH v6 07/13] iommufd: Allow pt_id to carry viommu_id for IOMMU_HWPT_ALLOC
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241101/202411010855.z6PCnINk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010855.z6PCnINk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010855.z6PCnINk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/hw_pagetable.c:277: warning: Function parameter or struct member 'flags' not described in 'iommufd_viommu_alloc_hwpt_nested'


vim +277 drivers/iommu/iommufd/hw_pagetable.c

   265	
   266	/**
   267	 * iommufd_viommu_alloc_hwpt_nested() - Get a hwpt_nested for a vIOMMU
   268	 * @viommu: vIOMMU ojbect to associate the hwpt_nested/domain with
   269	 * @user_data: user_data pointer. Must be valid
   270	 *
   271	 * Allocate a new IOMMU_DOMAIN_NESTED for a vIOMMU and return it as a NESTED
   272	 * hw_pagetable.
   273	 */
   274	static struct iommufd_hwpt_nested *
   275	iommufd_viommu_alloc_hwpt_nested(struct iommufd_viommu *viommu, u32 flags,
   276					 const struct iommu_user_data *user_data)
 > 277	{
   278		struct iommufd_hwpt_nested *hwpt_nested;
   279		struct iommufd_hw_pagetable *hwpt;
   280		int rc;
   281	
   282		if ((flags & ~IOMMU_HWPT_FAULT_ID_VALID) || !user_data->len)
   283			return ERR_PTR(-EOPNOTSUPP);
   284		if (!viommu->ops || !viommu->ops->alloc_domain_nested)
   285			return ERR_PTR(-EOPNOTSUPP);
   286	
   287		hwpt_nested = __iommufd_object_alloc(
   288			viommu->ictx, hwpt_nested, IOMMUFD_OBJ_HWPT_NESTED, common.obj);
   289		if (IS_ERR(hwpt_nested))
   290			return ERR_CAST(hwpt_nested);
   291		hwpt = &hwpt_nested->common;
   292	
   293		hwpt_nested->viommu = viommu;
   294		refcount_inc(&viommu->obj.users);
   295		hwpt_nested->parent = viommu->hwpt;
   296	
   297		hwpt->domain =
   298			viommu->ops->alloc_domain_nested(viommu, flags, user_data);
   299		if (IS_ERR(hwpt->domain)) {
   300			rc = PTR_ERR(hwpt->domain);
   301			hwpt->domain = NULL;
   302			goto out_abort;
   303		}
   304		hwpt->domain->owner = viommu->iommu_dev->ops;
   305	
   306		if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
   307			rc = -EINVAL;
   308			goto out_abort;
   309		}
   310		return hwpt_nested;
   311	
   312	out_abort:
   313		iommufd_object_abort_and_destroy(viommu->ictx, &hwpt->obj);
   314		return ERR_PTR(rc);
   315	}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
