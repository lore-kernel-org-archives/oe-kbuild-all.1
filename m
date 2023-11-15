Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BBA28368
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKXJnQIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700072278; x=1731608278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AqYc73W3K5RewU2i/aHhzjYff1sNLrTSHrqVZwOLJQk=;
  b=PKXJnQImCLHU5MVX4+ybZTtTPXafLRA4MEvQsF4lioxVOMT53kbVsosA
   5ApOt3Jtq4LQtONODMNnfHNdzYaQzyD9FyRDc5Gl5nn/50rR3/jLjC0D3
   ZtmOJewDxVkOIsDWBRrN/4nZ4jUxqoxWcu37snyZg7Nmhh+LFkxtvar8d
   W1SG+Z8d/ax398cjJdjRXDeYGYdWlh99XGTPZMdOrJ8nNoWCuHVZ/dZ//
   MijiHOQtDo3y5gmlJbQ6/g1zitxhOXe/W0NtPKHeBqX4qU86S1zu8qXOS
   1Y0Yu8B33R/0HiFEWynPSKSxgY5Szt7vTXFrseSnXs1Kfd3FmZVc36U7K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370275593"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="370275593"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 10:17:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908849440"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908849440"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 10:17:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3KSY-0000hQ-28;
	Wed, 15 Nov 2023 18:17:54 +0000
Date: Thu, 16 Nov 2023 02:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 59/60] fs/xfs/libxfs/xfs_zones.c:131:1: warning:
 no previous prototype for 'xfs_zone_validate'
Message-ID: <202311160225.TuXaOzPH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   1f3ae3d354c278bed39a2951003c1411ebf428eb
commit: cfc6c2eb739956ca8d7e80867413d235c35c08b8 [59/60] xfs: support zoned RT devices
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231116/202311160225.TuXaOzPH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160225.TuXaOzPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160225.TuXaOzPH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_zones.c:131:1: warning: no previous prototype for 'xfs_zone_validate' [-Wmissing-prototypes]
     131 | xfs_zone_validate(
         | ^~~~~~~~~~~~~~~~~


vim +/xfs_zone_validate +131 fs/xfs/libxfs/xfs_zones.c

   129	
   130	int
 > 131	xfs_zone_validate(

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
