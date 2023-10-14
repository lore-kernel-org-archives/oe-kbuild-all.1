Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD941FBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lnwn2MEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697315356; x=1728851356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYSnjuIJDXmiDWfX5fHvvBcrlSWiLpmC0VO+MVYWxec=;
  b=Lnwn2MEttHQ3DX0Et93J+F4dc+xYRvnhyaV1vOE+JrxrJzFraSp3Ibvv
   /hWyjvyGWkw/4j26x8J0T0Qjab4+VDnBNwdyfnKwbR+GNgW0qgM/nPN6x
   lIRWx2sy+moSbbwhPRIodS2GK3vhixWa2USyaAqbkxwCzCOUDSMqbPx61
   0k2kWTFTzSMerqgSYMTGtToepQGfEoyityfOF/LjuYg7Gt9MmP1GG3BMF
   9c9ZDZ+3wsG7Xh8AE9Fq964PUO5Cdf/SmUPUjfcQuH6cVweNAvigYQSlx
   0+nSAA6AVpUv57Q8+D+ngdtb5g6w6+EQEbsVvdGlH3eaZsuSGfnviO9Mh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389206625"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389206625"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 13:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002385327"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002385327"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 13:29:13 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrlG3-0006cX-2f;
	Sat, 14 Oct 2023 20:29:11 +0000
Date: Sun, 15 Oct 2023 04:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10132023-yi 20/85]
 checkpatch: WARNING: Missing a blank line after declarations
Message-ID: <202310150437.74DXYlUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10132023-yi
head:   3f226b487e64cd6f04258236e83eb403526d3d0a
commit: 167e0ce73adbb88a2ca6e360b1b06eb9ac7847e2 [20/85] iommufd/selftest: Add nested domain allocation for mock domain
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150437.74DXYlUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150437.74DXYlUJ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#191: FILE: drivers/iommu/iommufd/selftest.c:265:
+		int rc = iommu_copy_struct_from_user(&data, user_data, iotlb);
+		if (rc)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
