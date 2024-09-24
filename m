Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E081A726D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187988; cv=none; b=RBEGPp1NH8jzG+wQeJ7KSR21c5Z58oskACfso2ypMhmqfNDfdr438Gph9cuFsIpVCMwocFEMOiIQc6zJqRtMYlsZxmZTKeUUEYPzT6iSSu0Xw7KZWDzEgzeet4hqSoQlcNzBVM2m8s2L8F6fBIZGXCQ5Qsf6WSAQwN0nww0D3Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187988; c=relaxed/simple;
	bh=3LMJAcYxJNKHurl6O+d8ujdKU3DOW4RVDMS0/cpf8Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afP4qHyTW4Mf1vcQn7HJ9lHOPLQU3nk/5QbNTrOskQ8QkrnnNxlxn49Zk8yULK0uW0hly4Wl0NG5yQXB1FWaUvdkdsQWs1AAD+1qMplNrKgEOJ1a1Z9WG+Pmwc5xwhDutdN0ahb0Yq/1bOBz91dzUWXVd7RQpsGh/bWqqTM4opI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATwzjEXr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATwzjEXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727187985; x=1758723985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LMJAcYxJNKHurl6O+d8ujdKU3DOW4RVDMS0/cpf8Q8=;
  b=ATwzjEXrCmsWMonxXEQPe9tkkDfS8eqkXeyDsLuCplVGhWlGsmpSrSAL
   LQDPPWHjDuiO76RpgiJOhPzVXW212O5Jp3BD5xbiudkfGmgYj26lul2BY
   JqYJkTzwJwb/Y0BZSLwsii7k+eLJ1gics4O/8Iq1hslpmmtl+1FOnrfu7
   jYy8spuFPC76svBNkvKnAeJknvb5q1Uf3ugYIcMtBlE8Oan0ojgyOIxfF
   x3ATcgkFbLLWnZ0cd9WXYmStb6eOQqHZ6Cf+NedaovhsvpmySlZ7jJFF4
   ioLdnG5ymsXbMhVN6q3tH9nR2orxXauZPrhOi45rjCD8LEmhJG5Y/S1Tl
   Q==;
X-CSE-ConnectionGUID: uRpBC/dhRcOlxelkDJuyFQ==
X-CSE-MsgGUID: b0xP2uA1RSCpO9mt/zd7kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26332879"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="26332879"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 07:26:25 -0700
X-CSE-ConnectionGUID: GvFfgXY+SLCS0kapL0rFPg==
X-CSE-MsgGUID: vfe5yD5SSzyJwgiJB1BXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71573259"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2024 07:26:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st6Ud-000IS1-1g;
	Tue, 24 Sep 2024 14:26:19 +0000
Date: Tue, 24 Sep 2024 22:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1445/2441]
 drivers/iommu/intel/iommu.c:3465:25: error: implicit declaration of function
 'intel_svm_add_pasid_notifier'
Message-ID: <202409242225.XZJFT33m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 8f38c592c86070d845b998402d61acac9a1f1cbb [1445/2441] iommu/vt-d: Listen to IOASID notifications
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240924/202409242225.XZJFT33m-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409242225.XZJFT33m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409242225.XZJFT33m-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/iommu.c: In function 'init_dmars':
>> drivers/iommu/intel/iommu.c:3465:25: error: implicit declaration of function 'intel_svm_add_pasid_notifier' [-Werror=implicit-function-declaration]
    3465 |                         intel_svm_add_pasid_notifier();
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/intel_svm_add_pasid_notifier +3465 drivers/iommu/intel/iommu.c

  3444	
  3445		if (!dmar_map_gfx)
  3446			iommu_identity_mapping |= IDENTMAP_GFX;
  3447	
  3448		check_tylersburg_isoch();
  3449	
  3450		ret = si_domain_init(hw_pass_through);
  3451		if (ret)
  3452			goto free_iommu;
  3453	
  3454		/* PASID is needed for scalable mode irrespective to SVM */
  3455		if (scalable_mode_support()) {
  3456			ioasid_install_capacity(intel_pasid_max_id);
  3457			/* We should not run out of IOASIDs at boot */
  3458			host_pasid_set = ioasid_set_alloc(NULL, PID_MAX_DEFAULT,
  3459							  IOASID_SET_TYPE_NULL);
  3460			if (IS_ERR_OR_NULL(host_pasid_set)) {
  3461				pr_err("Failed to allocate host PASID set %lu\n",
  3462					PTR_ERR(host_pasid_set));
  3463				intel_iommu_sm = 0;
  3464			} else {
> 3465				intel_svm_add_pasid_notifier();
  3466			}
  3467		}
  3468	
  3469		/*
  3470		 * for each drhd
  3471		 *   enable fault log
  3472		 *   global invalidate context cache
  3473		 *   global invalidate iotlb
  3474		 *   enable translation
  3475		 */
  3476		for_each_iommu(iommu, drhd) {
  3477			if (drhd->ignored) {
  3478				/*
  3479				 * we always have to disable PMRs or DMA may fail on
  3480				 * this device
  3481				 */
  3482				if (force_on)
  3483					iommu_disable_protect_mem_regions(iommu);
  3484				continue;
  3485			}
  3486	
  3487			iommu_flush_write_buffer(iommu);
  3488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
