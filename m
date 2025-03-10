Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414322D4C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741628537; cv=none; b=QppSl3lkGAyecb77uwZ9cHCEq8cHZCjdx0TPhnjBFgKbFbYOGKbmLU+CE63IZ22fzdO5j476DcGYXuoL6XQ+pH01MtIuRYNvQfha80Nk/cCQ3nvnieajUYQFlxEK4H8MiGGHzxHv3eAzRAt0cXLkRIKoXG7yZkmLy8eLgraHXiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741628537; c=relaxed/simple;
	bh=ZSEpsi3JZ3IDi+KWJbnuUPkHk2VsJtx2+aJMYcPNwSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJdRMhL4EKMg+a3h6zyB38mSFZ1TY5qq3Tv0Lm6NUp3AnJw2rvl5qpd7YUJKI986cLD8kzRlxcRaHbeyMIkfLLaRQSJ5fHVurVYbVVPWtlHAi1StoZ/RE9heBajrvLB3b0mGrWy1ZlDUBVuxKp1Pr0zLhx40o54LX6gqT7PcZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKUBNKmW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKUBNKmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741628536; x=1773164536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSEpsi3JZ3IDi+KWJbnuUPkHk2VsJtx2+aJMYcPNwSo=;
  b=bKUBNKmWF9wk4IOYfAfyXFoYZJnHKuBhdeVbdfoOj0eVnO8wemMWD+f1
   PgtHdgmI4HMOk7ocnXc8SsnyEv67DubCAOgqO9lrTDpDVYFTwUzf6CJDx
   eCDp5hTsy5LlDcSMHuRw8pjOZ5hls8O0rfSHcv24UsfY69Uh7QRtcxeAd
   skJAy71jjDXYUy9bj17bTCdSRV+PLYjEm8WOyydi51zwja9o7h/hsf2GJ
   5MmodvqC8B4ialRdbafkUwCE7U8Zka/H8bCiCwVKrW7EM/xoAxGpQ3v6o
   YYBAbgquStwAT5AXxPk9zlgr5rIfWvMuEQFeububj9oI36JxLfed7Kg0D
   g==;
X-CSE-ConnectionGUID: zzSoqyEdTEGLKQ5hpaAKlw==
X-CSE-MsgGUID: nKgPTc9VQcim8uzE4pensA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41804667"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="41804667"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 10:42:15 -0700
X-CSE-ConnectionGUID: AJswfFMVRhKrklRXdZHfmg==
X-CSE-MsgGUID: 8JnsJ15VT1u7/xpTAQkrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="119892505"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2025 10:42:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trh8l-0005DM-0q;
	Mon, 10 Mar 2025 17:42:11 +0000
Date: Tue, 11 Mar 2025 01:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:pasid 12/30] drivers/iommu/iommu.c:3471:37:
 warning: variable 'entry' set but not used
Message-ID: <202503110143.Ybff0YIN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git pasid
head:   dad57f206143dd85d79ab1041cd3a8b747bc1a8c
commit: c8cfac063e159e290c41b9b961e9b1efb788e721 [12/30] iommu: Introduce a replace API for device pasid
config: s390-randconfig-002-20250311 (https://download.01.org/0day-ci/archive/20250311/202503110143.Ybff0YIN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110143.Ybff0YIN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110143.Ybff0YIN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommu.c: In function 'iommu_replace_device_pasid':
>> drivers/iommu/iommu.c:3471:37: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
    3471 |         struct iommu_attach_handle *entry;
         |                                     ^~~~~


vim +/entry +3471 drivers/iommu/iommu.c

  3451	
  3452	/**
  3453	 * iommu_replace_device_pasid - Replace the domain that a pasid
  3454	 *                              is attached to
  3455	 * @domain: the new iommu domain
  3456	 * @dev: the attached device.
  3457	 * @pasid: the pasid of the device.
  3458	 * @handle: the attach handle.
  3459	 *
  3460	 * This API allows the pasid to switch domains. The @pasid should have been
  3461	 * attached. Otherwise, this fails.
  3462	 * The pasid will keep the old configuration if replacement failed.
  3463	 * Return 0 on success, or an error.
  3464	 */
  3465	int iommu_replace_device_pasid(struct iommu_domain *domain,
  3466				       struct device *dev, ioasid_t pasid,
  3467				       struct iommu_attach_handle *handle)
  3468	{
  3469		/* Caller must be a probed driver on dev */
  3470		struct iommu_group *group = dev->iommu_group;
> 3471		struct iommu_attach_handle *entry;
  3472		struct iommu_domain *curr_domain;
  3473		void *curr;
  3474		int ret;
  3475	
  3476		if (!group)
  3477			return -ENODEV;
  3478	
  3479		if (!domain->ops->set_dev_pasid)
  3480			return -EOPNOTSUPP;
  3481	
  3482		if (dev_iommu_ops(dev) != domain->owner ||
  3483		    pasid == IOMMU_NO_PASID || !handle)
  3484			return -EINVAL;
  3485	
  3486		mutex_lock(&group->mutex);
  3487		entry = iommu_tag_pasid_array_entry(domain, handle);
  3488		curr = xa_cmpxchg(&group->pasid_array, pasid, NULL,
  3489				  XA_ZERO_ENTRY, GFP_KERNEL);
  3490		if (xa_is_err(curr)) {
  3491			ret = xa_err(curr);
  3492			goto out_unlock;
  3493		}
  3494	
  3495		/*
  3496		 * No domain (with or without handle) attached, hence not
  3497		 * a replace case.
  3498		 */
  3499		if (!curr) {
  3500			xa_release(&group->pasid_array, pasid);
  3501			ret = -EINVAL;
  3502			goto out_unlock;
  3503		}
  3504	
  3505		curr_domain = pasid_array_entry_to_domain(curr);
  3506		ret = 0;
  3507	
  3508		if (curr_domain != domain) {
  3509			ret = __iommu_set_group_pasid(domain, group,
  3510						      pasid, curr_domain);
  3511			if (ret)
  3512				goto out_unlock;
  3513		}
  3514	
  3515		/*
  3516		 * The above xa_cmpxchg() reserved the memory, and the
  3517		 * group->mutex is held, this cannot fail.
  3518		 */
  3519		iommu_group_pasid_store(group, pasid, domain, handle);
  3520	
  3521	out_unlock:
  3522		mutex_unlock(&group->mutex);
  3523		return ret;
  3524	}
  3525	EXPORT_SYMBOL_NS_GPL(iommu_replace_device_pasid, "IOMMUFD_INTERNAL");
  3526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
