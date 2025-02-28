Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BAB23F380
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740786815; cv=none; b=hwXCdTFj4iMnfgqF8VAiqpdn3eiWABhdRb/eNq4h360Ge1ytaEsipYMNLyEoNw14Xk4p8uOSjxn3m8vYIxIiqvIccbcpqds+GXPbF4O+agf7HctNlERE34kMsKUClC8liqVHMiUZD1c5VNFEufIpCEmJWqEhO2nVmDNpU+2duzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740786815; c=relaxed/simple;
	bh=VG0tnK+mYDLeTKu5WOfoF3o0n09G0RCGsDRRW1QbTFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXnG2yh14ZO6H3KNFiaymRQYicXLkEXXr2dDyLQc7xAX8YB9nXTnr+SfUwog3v1FD4mXzjWHFpAoqx/ZiKMI27jmmyU0Hf5fLp8Ydu05paG20NXlJjj5CQdaEFFw0Gspnordlp4+/Vm294e17p5uQ1dKN+m662KMX3f7QHxSHFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwhArhY5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwhArhY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740786813; x=1772322813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VG0tnK+mYDLeTKu5WOfoF3o0n09G0RCGsDRRW1QbTFs=;
  b=WwhArhY5UcNd0LZL0l4SZdAG3pmy5KqvUL7ufnyvT4TBftdpCdmC2nQc
   GVxC4gHkZSiuSCWO/NfSSD1bj9rPgk2EQwzOTAVoKOVO4UIRtT5rs1zdL
   DM0ZkI/xPa7IfW2E0A8MabKfKViCUgRUgt9nc2JHeuymAfz0kqDcZfvWw
   HHFr1YtU++P4/rNuyijn/mAs7QYtBvaX2xhQI3HhDoRN0qbRz5cHYRjtB
   048VPkNYS9fTi9a23OlXBBuEuy5fKKA+9mgyjUzYim5QQs14qj3n6YPLM
   QNlffLnjQMwSOIui6uHtwbgKlGnuFeeAop/b24c7AepbhAz/Ceqpns6H5
   Q==;
X-CSE-ConnectionGUID: HDURSq5ORhyYUGZrvJVxqA==
X-CSE-MsgGUID: ZcOfDfQSRYSSGDSv4ySZ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="59266698"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="59266698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 15:53:32 -0800
X-CSE-ConnectionGUID: l5g31aUWS2Wp5dP1FZrLFA==
X-CSE-MsgGUID: U7tEcT6xQe6RkYCIrrLc8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="148284889"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Feb 2025 15:53:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toAAb-000FeC-0z;
	Fri, 28 Feb 2025 23:53:29 +0000
Date: Sat, 1 Mar 2025 07:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] include/linux/iommu.h:1152:17:
 warning: 'iommu_get_pasid_from_domain' defined but not used
Message-ID: <202503010727.9vc1AgYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   b546d9695894905e1bc9de7646f89b06dbeae968
commit: ae98886a907851615758c891a5e488f1add0c69d [0/1] iommu: Add a helper to do PASID lookup from domain
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250301/202503010727.9vc1AgYl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010727.9vc1AgYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010727.9vc1AgYl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/pci-dma.c:4:
>> include/linux/iommu.h:1152:17: warning: 'iommu_get_pasid_from_domain' defined but not used [-Wunused-function]
    1152 | static ioasid_t iommu_get_pasid_from_domain(struct device *dev,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommu_get_pasid_from_domain +1152 include/linux/iommu.h

  1147	
  1148	static inline void iommu_detach_device_pasid(struct iommu_domain *domain,
  1149						     struct device *dev, ioasid_t pasid)
  1150	{
  1151	}
> 1152	static ioasid_t iommu_get_pasid_from_domain(struct device *dev,
  1153						    struct iommu_domain *domain)
  1154	{
  1155		return INVALID_IOASID;
  1156	}
  1157	#endif /* CONFIG_IOMMU_API */
  1158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
