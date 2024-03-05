Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D91079D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 01:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709601333; cv=none; b=abiwMouJM9aSWLtun6hvAFFQRPkxj+7UvgmyZEaOY94nclfEGfMCCafI1pmzBFefws4zxPTovVdXV8i52TY+97zFCW085XhE63Jcb9G2WizDNFYr4/WhdJq5MbknrS7GlJzpzo6+G9faLhOjLX5wJPsJYMePGgRw9NTW94EoGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709601333; c=relaxed/simple;
	bh=HlQ6EdA4MiLj8uZT9pAg/aC5meqfejm/DqfV9Dwg4KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1gu77YzxynfXuE+u9jxGYPYBDNGco7DVmHvmHX9uws3P1eZ+S9xBw4ZALwuaYQvvrP814Jja5h2lTmoxyfZiyTj1UIuVOvDJxSHT4FmAgNHzKdp8Qqf819/sMBEii6euaybODXke1sIbQazhNfZRLvDOd8bKFdtWjiWfFjKvx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdYKCwP/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdYKCwP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709601332; x=1741137332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HlQ6EdA4MiLj8uZT9pAg/aC5meqfejm/DqfV9Dwg4KE=;
  b=kdYKCwP/wm0pbgEs6PiEtrrzMRKv0mNIRBFAybfO8Y5NEi4OBd1tSFVO
   VLYm9i5E6ae1xdcRqP8tuP1yhlmxcGH3JUZEidnz0csOjy8NnVq1OJY58
   Jk9k17ciFkhR80mJGFSdLWmLIF6qRtztK/Z0PFsRRA+S0J79w/A14Zfix
   M534WRMcnBgo6InL7iLw1Pd0BF7oilHTM6h6YbTyYof2aDXZYlKova7zx
   xEVQ/HLyDWVxw6rOR/J/FFLUI1h3HQpm2PUmrQizGJlnV70oCDTxxIAIH
   XMB65Tfpcsxgbp9cY9eQ13d0wIeMzVPiMwV0FkdBboeSk6e55CQV+w+QD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3988343"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="3988343"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 17:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="40178905"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2024 17:15:27 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJOu-0002tH-0X;
	Tue, 05 Mar 2024 01:15:24 +0000
Date: Tue, 5 Mar 2024 09:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/intel/iommu.c:3465:25: error: implicit declaration of
 function 'intel_svm_add_pasid_notifier'
Message-ID: <202403050951.HGHewB4p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 5828b25e7998a673ee4565f93fb1d782e074147f iommu/vt-d: Listen to IOASID notifications
date:   9 months ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240305/202403050951.HGHewB4p-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050951.HGHewB4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050951.HGHewB4p-lkp@intel.com/

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
