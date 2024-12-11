Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6041F0E4A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956826; cv=none; b=rx34pqW9FEema6HB5FKDyDAQqFMk6nNMNE+SWcUch6xfmHu+J4KfAonQyHvoXQGlJUeon17Mr7D99jPvnOtYUGwyL31Gf4AW4FUPJBhj8Gz/bFoPdbKwwdrDz/fBJd3OiU0nXyGwxxY4oJ1Phr/T71/J+QXgXOWA8qc34ll5OZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956826; c=relaxed/simple;
	bh=aHGyNlgkabMpEK+fqJTyDE7Dfs9xPIBo2jaB9qsBM3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WP5ERuZbQ2G/m2vzEKgYc0zjEfLgwPdW9xKQqmO8PDoUivnEziJ90I352nD7opoD9+/iXM9bGa5qRiF1Kbe3G6dQGKic86Zk7MATzT2R4lcW5NfXa9ws3gy1vbcWBxURRfOhk6+S3Qm8VjVrYVJcbkf57hzuui87+oEHF7kNNtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cq2YXJ4A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cq2YXJ4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733956825; x=1765492825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aHGyNlgkabMpEK+fqJTyDE7Dfs9xPIBo2jaB9qsBM3I=;
  b=Cq2YXJ4AHkYLEC8OIeQ7cG8rGTH9ZaaC85QBT7LvjBUGJFHQb1IUMhPv
   bWrIytz/cMb57LQHBnkLjv1Sw+AAAKHYpxRx+bV/YUmo++jOycJadpzt0
   YrPDFf3b/M8/PJBRH5OYsRjfo2uS6K6P7v39ta1vOExeirb66axvstU2N
   uDdCHnlEGUuwEDNHSXrQbmYBJzgc8ENjtbFjdlTFawNFVSnTKo1eTmJA7
   SGdAKJqNXftKnh0kPbNYKX61QMoHMsDgPi27JkuCeqx7H1J4kXCF78QYO
   jZBycfqT5vF3Los5mzN+6cHPrZIvjs4A31DqNk2kSdE+zGWJvrCFArqiv
   w==;
X-CSE-ConnectionGUID: 4XaZODFCQOy8cVZI0occGw==
X-CSE-MsgGUID: RxiajgUzR0ClN8D58qLsdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="37194662"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="37194662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 14:40:24 -0800
X-CSE-ConnectionGUID: zjMFfMwCQOaLHOwRQDOGyA==
X-CSE-MsgGUID: +7B+wdPBTn6jhNH9QEU+Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126953880"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2024 14:40:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLVNQ-0007AV-2j;
	Wed, 11 Dec 2024 22:40:16 +0000
Date: Thu, 12 Dec 2024 06:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Fan Ni <fan.ni@samsung.com>
Subject: [weiny2:dcd-v4-2024-12-10 19/22] drivers/cxl/core/mbox.c:1790:
 warning: expecting prototype for cxl_process_extent_list(). Prototype was
 for CXL_READ_EXTENT_LIST_RETRY() instead
Message-ID: <202412120644.GDLGXIzK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-12-10
head:   1cded0f798c0254ebe5d5e5fe20658dfb97bb1b3
commit: 54947cbd680460aa9a09c36e86f83b47a334c3a2 [19/22] cxl/region: Read existing extents on region creation
config: x86_64-buildonly-randconfig-003-20241211 (https://download.01.org/0day-ci/archive/20241212/202412120644.GDLGXIzK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120644.GDLGXIzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120644.GDLGXIzK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:1790: warning: expecting prototype for cxl_process_extent_list(). Prototype was for CXL_READ_EXTENT_LIST_RETRY() instead


vim +1790 drivers/cxl/core/mbox.c

  1779	
  1780	/**
  1781	 * cxl_process_extent_list() - Read existing extents
  1782	 * @cxled: Endpoint decoder which is part of a region
  1783	 *
  1784	 * Issue the Get Dynamic Capacity Extent List command to the device
  1785	 * and add existing extents if found.
  1786	 *
  1787	 * A retry of 10 is somewhat arbitrary, however, extent changes should be
  1788	 * relatively rare while bringing up a region.  So 10 should be plenty.
  1789	 */
> 1790	#define CXL_READ_EXTENT_LIST_RETRY 10
  1791	int cxl_process_extent_list(struct cxl_endpoint_decoder *cxled)
  1792	{
  1793		int retry = CXL_READ_EXTENT_LIST_RETRY;
  1794		int rc;
  1795	
  1796		do {
  1797			rc = __cxl_process_extent_list(cxled);
  1798		} while (rc == -EAGAIN && retry--);
  1799	
  1800		return rc;
  1801	}
  1802	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
