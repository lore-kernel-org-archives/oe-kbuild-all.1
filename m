Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6815189520
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733230195; cv=none; b=QTMWPUlPQ85bs9h9gJV7QukuHf5y5pkFnluvDnRP0s/+ycFAn252OHH5GmxNMbGxNRy/WxLm9GB8WgQhuj9rsJSvCTBRzjpLM/AaBJw5bKb5IHsZw0W6GA7pxu2e+yhGSm36TmX5aVma/V7a4zECLOqGahO6rJo2m9OagSlQNFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733230195; c=relaxed/simple;
	bh=KrVr3ne0+AjizP31VrUmtexusS7an8HBOByHUnE/txA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VklJHULL5E+sV1c6p/R7pubW5OgjNprpSZdQBlgM6oQajvAwflf0bKeSIJSAFak5aFjUr0vE4oWapuC7sP/bKILSEIsejr8QTiZwGgqzReZqV/rbgsSdE6K1JMXi7rYRdDoUbD+6i3Wu40Ym9s0oJknhWfdBBY4u2jEq8fCr3oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXAo1Fke; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXAo1Fke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733230193; x=1764766193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KrVr3ne0+AjizP31VrUmtexusS7an8HBOByHUnE/txA=;
  b=nXAo1Fke11hJt89ymWZPg7SOKZmDoJaKP4Cw8yt2Kp11TqVunULICIki
   yOyoYtI74R09V+i/Oc/l2OdmBdmVl9ajsobu3PCJUTJUPdajPsffBd1Lj
   PbN3f4T5xHJU491FiDPMJLme7xgbIXl6RhAWoH1dGFlnQUfOtA4QzIocN
   MleQDCMVWOWjyx9+B6iY1w9CQBnoAHgnTEgLFRordsLiY7Xlvj7TDMbbB
   8UWfAl/c3erivAPVNNWsZ8YT01KDxeRInkmiDOqABozh/D18/vFXH7jyO
   vXQSV0I9mQQwcFCjujLkamBhj/D+mqH1cdFEMhJ+Luc5uUsrTX1YkX1sr
   w==;
X-CSE-ConnectionGUID: +PJ/GE9CTj+mLJhl6hbl/Q==
X-CSE-MsgGUID: JM1bZ517SWKujrmCoAv16g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33186284"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33186284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 04:49:52 -0800
X-CSE-ConnectionGUID: j8eB7YH8SFWPLI62cMvHtg==
X-CSE-MsgGUID: rKuN8VvdRuyOqh7J0OC+jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="116674811"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2024 04:49:51 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tISLd-0000fp-0h;
	Tue, 03 Dec 2024 12:49:49 +0000
Date: Tue, 3 Dec 2024 20:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241203 11/27]
 drivers/iommu/iommufd/device.c:297: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202412032044.MTRNSNMe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241203
head:   09042d1f24b0dc9375b2357d36771b6997ef01cd
commit: 7f3cb770e52608fecf32524478384a883b8c3dcb [11/27] iommufd: Move the iommufd_handle helpers to device.c
config: i386-buildonly-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412032044.MTRNSNMe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412032044.MTRNSNMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412032044.MTRNSNMe-lkp@intel.com/

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
