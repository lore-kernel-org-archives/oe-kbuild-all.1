Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE7801
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 01:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710121694; cv=none; b=oq1M+Yj+NpoA9jlRxqs4k2+Q2aH7YjkriZF1HiU82yTK9KHW8o3OD9+hlpO6YS3VmFiJX6kOyqT6PUuoCx386zbDlBGIAPLCz9DboYL/fsoI1KwOKU4WAyeVed2yfM49KxiKwAq4F5NGPROWBI4wmsIS5K+9RVRRU07zYrJAv+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710121694; c=relaxed/simple;
	bh=yUB/ZVtBpdybZvKFdb5zbguk9kp1GlIp4Rt4tw3+xBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q52pjjXCCQct6CYA1akA+kheel7Ik6GhBSqmj9uR9K2YRpI0KAWmAe3r2/hWNRgEftUARswD7y18qvCr0GaY7OVVt8MQqwW1AgylxdZmhRjRIoO6+Mlfb1Pk5rAqpJuuNRJEyUT4/zyQYlQ66+N90kDqt/WCD+muqf6Bskk7riU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFwNy5Uu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFwNy5Uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710121690; x=1741657690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yUB/ZVtBpdybZvKFdb5zbguk9kp1GlIp4Rt4tw3+xBE=;
  b=IFwNy5UuXc59ESo2qft248RJGz+R5fqoHbLxi+aX+9hzh6irCbYIl7LE
   m0o92vI/QDVcYDwrrTQjxzAQ99jUjW9jxK7D97l3buubhkMg4zAy95nK4
   zbHTZaiX+Jebfq3k0of4ZZ0DvH5QWAuOvhf0JsCHZMSqA52E/AI+s6EVI
   l4MFo6Vm0ol3kq4n/L4A5f06CFaDJn+v3/3PSnsyCzQpSFjiniH9mQeC4
   7gwyZoYL6zVCLiGB3DKt4/PYf8QxcMmCLpryQLySVO7mHheoOU6Xn8VBR
   Rf1y4cr1CdWJRdU9yWHLpc7aZH5SS/DPT4GJb4WQU6V+9xA883roVhKuP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4649630"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4649630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 18:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11419575"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2024 18:48:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjUlp-0008nR-2q;
	Mon, 11 Mar 2024 01:48:05 +0000
Date: Mon, 11 Mar 2024 09:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 51/57] arch/arm64/kvm/iommu.c:63:15:
 sparse: sparse: symbol 'kvm_get_iommu_id' was not declared. Should it be
 static?
Message-ID: <202403110901.0vaGJWFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6b00f1b219465a71cb11664536629575c5312bd0
commit: 9d5e57d93b40eb389a4d67fc606dc62089e1cae6 [51/57] ANDROID: KVM: arm64: iommu: Add kernel wrapper for HOST_HVC PD
config: arm64-randconfig-r122-20240307 (https://download.01.org/0day-ci/archive/20240311/202403110901.0vaGJWFH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240311/202403110901.0vaGJWFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110901.0vaGJWFH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/iommu.c:63:15: sparse: sparse: symbol 'kvm_get_iommu_id' was not declared. Should it be static?

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
