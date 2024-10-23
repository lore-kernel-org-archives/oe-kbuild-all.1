Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4AC1531F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729682331; cv=none; b=f8AQkiaawQUCboSxn1ilihqPrPancArwF0YCFfJOEnU2x9udHmPp5wUO1deUQ0IUNOPscHutphJ5RMJLuslMp86zyIVCpLFSkHn6nOtvAeNL9qxmG6tbcTHy00WXerfUlKwkTKdXHLl5rvc57VgYlAe9IZg9nI6MS4CPcWu3c7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729682331; c=relaxed/simple;
	bh=1ESt2VU6MdD7MAX0SmTeVftr4cR5tTrnB+Ke2KLrTTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MlrcmrChRlRZ+VO9mqlPHD9KAyVPHz1CyR0a+mbXww84Wc1BAjKmKIifRaEMK0AO/DKtXUFh8V8DzAup2tAMiw8kSiIaLhcLayax2EIhoUB2Ph9e6mY1tTS5lfH+xeaNlyFmy9arKgQIMbg15Q5alNpmw02/Z2ru3G1h6COqRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvRLBUX3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvRLBUX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729682329; x=1761218329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ESt2VU6MdD7MAX0SmTeVftr4cR5tTrnB+Ke2KLrTTc=;
  b=LvRLBUX3G9z+B//wD3xee/HRcEmgLOczsYmn2ho/1TsoBnAMv9fZd17U
   i5ReHujDcobHvTMQropu+iVuwKMkyE/CsuefN+VEtTtpiNmoZiEtopfEt
   L5j/PIjB8SyO5wrIUCuOc1Sthim8ALwS3R/oTxTEceNeN8OuCWElRYNc+
   AIP4pdELNWeFpIEurBXuk8r/Qt7bAfPl7rLsO4GdFyvkzQ4n4cSV2fIJB
   gTqQ819/CHxiBVPRNcW3ZDVIbm7/K6AhYwpjtZJtcrdHCMRx5MnKgKt8X
   fZ5gmKFZpsuW0SqkCfiGE5OJ9jGUGwFZ0qottOsR7o6NtphVx2/mfM9Ju
   g==;
X-CSE-ConnectionGUID: Vih/39FBRgaxyV/zqzPy3g==
X-CSE-MsgGUID: OY4Zb4XtSFaxrtFfQloBYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="16883168"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="16883168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:18:49 -0700
X-CSE-ConnectionGUID: LnSFdKAJSKWscgkHIwfzPw==
X-CSE-MsgGUID: yWFcp/DTQDy1Z8A14b2otw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84967947"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 04:18:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3ZO1-000Upq-0c;
	Wed, 23 Oct 2024 11:18:45 +0000
Date: Wed, 23 Oct 2024 19:17:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14662/15255]
 arch/x86/kvm/../../../virt/kvm/vfio.c:184: warning: Function parameter or
 member 'kv' not described in 'cvm_vfio_add_kvm_to_smmu_domain'
Message-ID: <202410231921.YFrtM1y8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e7bc79687a034a22f94328123d5cf8c4d4436c35
commit: a8078c65197c6f2034431a431780538c7c324f79 [14662/15255] virtcca feature: bind the kvm handle of cvm with smmu domain
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231921.YFrtM1y8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231921.YFrtM1y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231921.YFrtM1y8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/vfio.c:184: warning: Function parameter or member 'kv' not described in 'cvm_vfio_add_kvm_to_smmu_domain'
>> arch/x86/kvm/../../../virt/kvm/vfio.c:184: warning: Excess function parameter 'kvm' description in 'cvm_vfio_add_kvm_to_smmu_domain'


vim +184 arch/x86/kvm/../../../virt/kvm/vfio.c

   172	
   173	/**
   174	 * cvm_vfio_add_kvm_to_smmu_domain - Bind the confidential
   175	 * virtual machine to smmu domain
   176	 * @filp: The handle of file
   177	 * @kvm: The kvm belone to confidential virtual machine
   178	 *
   179	 * Returns:
   180	 * %-ENXIO if set kvm failed or iommu group is null
   181	 * %0 if set kvm success
   182	 */
   183	static int cvm_vfio_add_kvm_to_smmu_domain(struct file *filp, struct kvm_vfio *kv)
 > 184	{
   185		struct iommu_group *iommu_group;
   186		int ret = 0;
   187	
   188		if (!is_virtcca_cvm_enable())
   189			return ret;
   190	
   191		mutex_unlock(&kv->lock);
   192		iommu_group = cvm_vfio_file_iommu_group(filp);
   193		if (!iommu_group) {
   194			ret = -ENXIO;
   195			goto out_lock;
   196		}
   197		if (cvm_arm_smmu_domain_set_kvm((void *)iommu_group)) {
   198			ret = -ENXIO;
   199			goto out_lock;
   200		}
   201	
   202	out_lock:
   203		mutex_lock(&kv->lock);
   204		return ret;
   205	}
   206	#endif
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
