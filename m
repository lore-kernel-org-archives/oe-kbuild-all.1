Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0664F203708
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523215; cv=none; b=BY2KIUbD9scaTTrMe0nrop087d0LakGgX4/R6R/+uc/jTZz4SuNj/KnkOmGbU/IXx7Zgq/i1p2eirNYmrxNrQN0FNGueSSVjVt3SXCXX8SB2gGsGmye5ncAOvBAjCOlyfUiOWe1B/Y1rKaqWD8ApZV88/bLI0/MyM2CMIrehEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523215; c=relaxed/simple;
	bh=G+dAwMPZAUIbcPLtoM1IStBbrqUTxNzeW96oDZ1Sl/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lr8K8gTUJ1HjT0azWi62U95F9dZ5OtkV7EQPr5X+edHtKpbKcCTYLX/5dWAda06zIkoThht/sgmJDWsL7xwaXM7TL6ViJ9dTT0HUp9AN8q7A2Lfa0WpEn4rnbd8oe6ntij6AT8OoOYGwdOr/k8cvyGQF/2TIUHWgrQnW17xpwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDXSd8Bl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDXSd8Bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731523213; x=1763059213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+dAwMPZAUIbcPLtoM1IStBbrqUTxNzeW96oDZ1Sl/k=;
  b=UDXSd8BlpCGYesSXOUxuBEehUKvIjLElTkIw2WvMSar3zdrq/7m2X0S3
   aaaxXk7cnpq9EuRzhahQF7/VwvX6UTErPlLDGQx04Nm3ALFuOdY84F3Nw
   5MmqKSsijixG+Z2xiyaLtaXtg3uedToPZHqIc6vpALP7n32tNfI29G+OA
   4hhyPbi+kRqPzZrbElWZiZ0IktHkM3Xs5pnu6LWdPUiikSlYVs7up5l1H
   sS52DzNkSGcBWazWIRiHQLxNH4eDChvmXpWtdO0oRrZgE/KhoPZyzbNxt
   p+vYsch5gy4FLYZTiLJngYdT298GNP6LsdOpbUiU/4/osO4WhnB2QydPD
   w==;
X-CSE-ConnectionGUID: 8mZXYX2cTz2ma6Uyw4c9wA==
X-CSE-MsgGUID: +Owf2eRwRGShUjJAmAPDmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48885855"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48885855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:40:10 -0800
X-CSE-ConnectionGUID: ylOOw9FERGS2shPJUWhmTQ==
X-CSE-MsgGUID: EgUBh5o+TO6LnRuc8PtCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88375992"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 10:40:09 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBIHe-0000d4-2V;
	Wed, 13 Nov 2024 18:40:06 +0000
Date: Thu, 14 Nov 2024 02:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241113 25/40]
 drivers/iommu/iommufd/device.c:297: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202411140243.8PNJ9kH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241113
head:   296f562717c8734c5e6226d4f5e7e5d815528f49
commit: f1b39d4265a81bc2f234b5a4660d7ac50832dbbf [25/40] iommufd: Move the iommufd_handle helpers to device.c
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241114/202411140243.8PNJ9kH5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140243.8PNJ9kH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140243.8PNJ9kH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:297: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This return the attach handle for the RID. Currently there is no


vim +297 drivers/iommu/iommufd/device.c

   295	
   296	/**
 > 297	 * This return the attach handle for the RID. Currently there is no
   298	 * locking to synchronize threads that access the returned handle
   299	 * with those attaching or replacing the domain which might change
   300	 * the handle. It's caller's duty to guarantee no use-after-free.
   301	 */
   302	struct iommufd_attach_handle *
   303	iommufd_device_get_attach_handle(struct iommufd_device *idev)
   304	{
   305		struct iommu_attach_handle *handle;
   306	
   307		handle = iommu_attach_handle_get(idev->igroup->group, IOMMU_NO_PASID, 0);
   308		if (IS_ERR(handle))
   309			return NULL;
   310	
   311		return to_iommufd_handle(handle);
   312	}
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
