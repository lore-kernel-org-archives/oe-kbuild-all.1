Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC973250E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 23:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtjpUVxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697327463; x=1728863463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJHtb6xjnMaQJ9ZKP7qNdaoISNem8IfvHyz9NgI3Y2s=;
  b=FtjpUVxOzAQP4mekKH+sUNep0DxaK1NSDDVmI5GoZy94Y/5cP3JCqwIv
   p3xNetYzMg8mn4AYGaVjukuKskcnAiFvQlPsAyFcVJS1Q0jFNLtOx6x3e
   LTqd8dA9i4nQ0AVgJT8b+sgNgsqz1YC3NxFHmIXnK3gvkH0tpNmilBK5Y
   sKXPuAkrAumvijT/F+wmRw9C/vzZ93tDPuXAxQ2IzieWs4MLRo3sa/bkb
   q9brHNg4vclI3AACZSN1f56844ClcMpXs8ioLZceJBg8W4ri5v1BsR5eH
   NuT+gaDmNQB4ydYn13r9JxDFmzyWXwfy1oE1t+UcfVDzy+rdaZc8KiZmy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375706668"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375706668"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 16:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="928881429"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="928881429"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2023 16:50:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qroPI-0006ot-1U;
	Sat, 14 Oct 2023 23:50:56 +0000
Date: Sun, 15 Oct 2023 07:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10132023-yi 78/85]
 checkpatch: WARNING: quoted string split across lines
Message-ID: <202310150750.2zCEukdU-lkp@intel.com>
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
commit: e03c995af149b5bb7250999c8aada22586c298ff [78/85] iommufd: Handle unsafe interrupts in a separate function
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150750.2zCEukdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150750.2zCEukdU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#37: FILE: drivers/iommu/iommufd/device.c:162:
+		"MSI interrupts are not secure, they cannot be isolated by the platform. "
+		"Check that platform features like interrupt remapping are enabled. "

WARNING:SPLIT_STRING: quoted string split across lines
#38: FILE: drivers/iommu/iommufd/device.c:163:
+		"Check that platform features like interrupt remapping are enabled. "
+		"Use the \"allow_unsafe_interrupts\" module parameter to override\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
