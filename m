Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2FF11C9F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJ1cB094"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699096333; x=1730632333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q4ovWm5khkEZ8Q2Gsdjomm/t3+0IYX7rXUQcWXdLdKM=;
  b=JJ1cB094NIgtkc6wzyKMv3REqx8xLgfK9DLs8JpmvUfNiDnoBS/uA4l+
   oNFWp7BLHWMvuqDyxSWUmZCRc0kmV/uoTGtWobZCW4Lgq8yhVV8kfo89q
   rtnkaK0L6e+4C1gd5893tuCslBeXlkeqxs1YEYpQpzTnnkS4LpzDLCepS
   UCC1KtFksmSE3xBrAWT/0kOpHon0XTH6nbnTxN/k5xzHDhdV/zqGtgXhJ
   YXl37DzL87Qs3NZlmf1Jd04pVMOSNvwXfuwHp8vjnb6DxVOggGrs1QvEN
   ItW5kbEY8VCy2LmimVxBxrwptrVIDBl6S/9z6th/VdgK6ErJyYR/sb6kS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391946969"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="391946969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="3171606"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2023 04:12:11 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzEZU-0003wu-2k;
	Sat, 04 Nov 2023 11:12:08 +0000
Date: Sat, 4 Nov 2023 19:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] drivers/acpi/viot.c:373: warning:
 Function parameter or member 'fwspec' not described in
 'viot_iommu_configure'
Message-ID: <202311041905.QIDiMpkm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   a387bf414bfa3cc4e39cc07d1cfb257a13081c8e
commit: 82d63e7b3a55983a4ff9d4633c4f1f233f3e8853 [11/19] acpi: Do not use dev->iommu within acpi_iommu_configure()
config: i386-buildonly-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041905.QIDiMpkm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041905.QIDiMpkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041905.QIDiMpkm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/viot.c:373: warning: Function parameter or member 'fwspec' not described in 'viot_iommu_configure'


vim +373 drivers/acpi/viot.c

3cf485540e7b85 Jean-Philippe Brucker 2021-06-18  365  
3cf485540e7b85 Jean-Philippe Brucker 2021-06-18  366  /**
3cf485540e7b85 Jean-Philippe Brucker 2021-06-18  367   * viot_iommu_configure - Setup IOMMU ops for an endpoint described by VIOT
3cf485540e7b85 Jean-Philippe Brucker 2021-06-18  368   * @dev: the endpoint
3cf485540e7b85 Jean-Philippe Brucker 2021-06-18  369   *
3cf485540e7b85 Jean-Philippe Brucker 2021-06-18  370   * Return: 0 on success, <0 on failure
3cf485540e7b85 Jean-Philippe Brucker 2021-06-18  371   */
82d63e7b3a5598 Jason Gunthorpe       2023-11-03  372  int viot_iommu_configure(struct iommu_fwspec *fwspec, struct device *dev)
3cf485540e7b85 Jean-Philippe Brucker 2021-06-18 @373  {

:::::: The code at line 373 was first introduced by commit
:::::: 3cf485540e7b8550936ce3602edf2f58e4007304 ACPI: Add driver for the VIOT table

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
