Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7241EDB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aw4K+GH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697345318; x=1728881318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWekX2Qj8+IwOIEXBxYcFbWVxiVUX/wA/uWt88Mcyzw=;
  b=aw4K+GH0a3k3LHuQLUgEx+maOZnx7r2RY34gRta7cPs5iN3fOvy+zlaA
   FsLV26CIRs8iwADG5tThO5GMV736W4iuuuOcBgA3aJ2lXm0oOb+rGF8fq
   aC8/56vdQKc6k1VsG36RN/VL6GKdX5gxOF8RIQo9hh1QjNKKANwrf+azk
   akyIJYW7Q/NwcBZ4seJINdDNc/4p2AsTsoB7TNhRJytU7kmGIe9/lpzGI
   Am+Ve2xcHykOMJclI5wKXZ0O3aldLs8Smgq88MkjGUnFZlH9mq4ymEEJV
   UCgbJ/RPJHqv1/dJUbS3iBeEe2hsHuY+b/CctkWR6tJdegtyGuR+eVaF5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="451842636"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="451842636"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 21:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086655292"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1086655292"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 21:48:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrt3J-00072d-2k;
	Sun, 15 Oct 2023 04:48:33 +0000
Date: Sun, 15 Oct 2023 12:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/amd/pds_core/core.c:156:2-7: WARNING: NULL
 check before some freeing functions is not needed.
Message-ID: <202310151223.hg8OrOsd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a3dad63edbe9a2ab2be1e7361a2133f519f855b
commit: ddbcb22055d136f58841c73ca2226dab79eb6101 pds_core: Kconfig and pds_core.rst
date:   6 months ago
config: x86_64-randconfig-103-20231015 (https://download.01.org/0day-ci/archive/20231015/202310151223.hg8OrOsd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151223.hg8OrOsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151223.hg8OrOsd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/amd/pds_core/core.c:156:2-7: WARNING: NULL check before some freeing functions is not needed.
   drivers/net/ethernet/amd/pds_core/core.c:159:2-7: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
