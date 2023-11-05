Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F612CA7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUOqcC5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699168570; x=1730704570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLcLuelFCVYvO9mDkJF8DMB0xsKO5rcDEG6g1qqQ8n0=;
  b=ZUOqcC5u7Cbdunt19LplRHl3ZTCDzuvtqaBqGEW4GL0fTY4wRLCuVY+u
   EeoimFXscvM9bhBEZKg/JK84TnmTVzN4conWYpRfVLg2YpxlcQF6/v2Ct
   WLKmaG7YFD9hJNu3gGVBtNtMY8LQKKnLSRFWSq75SD6+mIge34lJNs9e9
   Bzj7zCnCxfO+0pVejsA/mMCxM0Ww0WCaI3fKsZ8EpGF9xMYDOBnOANo/F
   0Ubn8yb7t33S/v9zRxcU6hPrD9JnBrR1fnL4Hks/S8ObJ347YWqjb3yFc
   1Sbbwy2QHNjlTVrjwCgXhv+17lU+6Ua+Ep1YhgNDo3NkyjNNmM3LmdHSJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="368464974"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="368464974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 00:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="762013632"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="762013632"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 00:16:07 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzXMb-00058m-0Y;
	Sun, 05 Nov 2023 07:16:05 +0000
Date: Sun, 5 Nov 2023 15:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Burton <paulburton@kernel.org>
Subject: arch/mips/sgi-ip30/ip30-setup.c:122:13: warning: no previous
 prototype for 'plat_mem_setup'
Message-ID: <202311051519.Wm6XIMdt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: 7505576d1c1ac0cfe85fdf90999433dd8b673012 MIPS: add support for SGI Octane (IP30)
date:   4 years ago
config: mips-randconfig-r016-20230221 (https://download.01.org/0day-ci/archive/20231105/202311051519.Wm6XIMdt-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051519.Wm6XIMdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051519.Wm6XIMdt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/mips/sgi-ip30/ip30-setup.c:122:13: warning: no previous prototype for 'plat_mem_setup' [-Wmissing-prototypes]
     122 | void __init plat_mem_setup(void)
         |             ^~~~~~~~~~~~~~


vim +/plat_mem_setup +122 arch/mips/sgi-ip30/ip30-setup.c

   118	
   119	/**
   120	 * plat_mem_setup - despite the name, misc setup happens here.
   121	 */
 > 122	void __init plat_mem_setup(void)
   123	{
   124		ip30_mem_init();
   125	
   126		/* XXX: Hard lock on /sbin/init if this flag isn't specified. */
   127		prom_flags |= PROM_FLAG_DONT_FREE_TEMP;
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
