Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E863136
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709800194; cv=none; b=D0GmAVHrD5dRbVPFT/4GiyOTNI0gr7bqofjAhAYrNSDTvzSBGrqDl7dmTwJBl+5POKnxapFNqz9Z2h2oYoi7ERNZOeDbpC3HU0NqvAULqCU8uqKpywCGikFSDZEuuRrvMpOioin9CXaliIG7dNcXopYqGPNoOWOXZUfGBSlGNis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709800194; c=relaxed/simple;
	bh=D24u6NLdg7LDTxSrmeugWiZoFznDDZ5sgtalYze9xIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwmoOHjgXPFx+jZOAZy4lRqRyUzN9ldyo4L4iFL4JAkAxYHZEgIgCVXY5aKsqQGw4IhXBnUa5jTm6W5htVmHgNVPmkQbchDhy2Su1ZUZFJ62jHnhKYeOdGeSWD7fnzrDmiWxR2Rh0v+Dw9cIcQ8PcMLZ1YaVlZ3ta7YrgSFsyJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRAKUk8e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRAKUk8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709800192; x=1741336192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D24u6NLdg7LDTxSrmeugWiZoFznDDZ5sgtalYze9xIw=;
  b=NRAKUk8edN9+c85fXynYKjMpYrQZDqin33c+F2Uj69lBbSzt2j7+INHO
   vsjoCmLBSYuq/Ac0A6EcqBuCbscknziZoXa4DGK/WILaGPxWG01aDOIgt
   grbndmtWcJJU4CfhGwSsXMue3EHPh0kQxb3GESFOwZevHv0uz/ilEGiKd
   qQ8U9mRusVxtTcbNssbLb/IOZWhdU1gCV5A2EShClzbaCYaiwQA7nFpto
   Nv0gWuODJGfVle81hT0VkVnWarXZZk1AJcnPfd9OCfHL/DIfNuvOiLQR6
   Hyx+/C8k9zi3ku8hM6Q8C75xKMx28blluBadL2sXnb47TJyvYD/cdMmwH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="7396503"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="7396503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="10468997"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2024 00:29:51 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri98O-0004zt-1Y;
	Thu, 07 Mar 2024 08:29:48 +0000
Date: Thu, 7 Mar 2024 16:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 51/57] arch/arm64/kvm/iommu.c:63:15:
 warning: no previous prototype for 'kvm_get_iommu_id'
Message-ID: <202403071631.i2ZY9E8X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   6872638c2ef3e7439a7f074a8757cbf3060db80e
commit: 5bd3e9df88b8f755a3300c68fbad1b7facdaef86 [51/57] ANDROID: KVM: arm64: iommu: Add kernel wrapper for HOST_HVC PD
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240307/202403071631.i2ZY9E8X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071631.i2ZY9E8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071631.i2ZY9E8X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/iommu.c:63:15: warning: no previous prototype for 'kvm_get_iommu_id' [-Wmissing-prototypes]
      63 | pkvm_handle_t kvm_get_iommu_id(struct device *dev)
         |               ^~~~~~~~~~~~~~~~


vim +/kvm_get_iommu_id +63 arch/arm64/kvm/iommu.c

    62	
  > 63	pkvm_handle_t kvm_get_iommu_id(struct device *dev)
    64	{
    65		return iommu_driver->get_iommu_id(dev);
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
