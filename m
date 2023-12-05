Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E2241F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8WCnC4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701773108; x=1733309108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/52dcC8YZO2910ghnnJnALEpsFh4wqjODV0/kLnGxPo=;
  b=B8WCnC4DdbY+gyuUNA+fz7YtjllHZ8ecSwZyNAkrMRA+PvLe9Hz3oQZi
   Sy845VFYjac2ezn18cUtIs7nwKdEOYFRLXGxWk8r4o3H279yZm4gS4rO5
   rAKlaZh8vUSRhvtNfGbMVmV9gflXtmy9+AZHKjnvG05C9QlPK0Ia/k0G2
   hmNDie/1fzzJpDzTwPxgxZ1/g1PPcBK9MhuGLHF3/eXNbjp0h+Inx8ZUJ
   UGHzFcEjNAaonMeiVR0ZxU7QX+8Ze+4+OjiJ5PGCgfYVoRYx8E28ZHACe
   C5rvLK08UdRIdv5ZBFCMvhA2TIHKRhtcm4ZFQzk9KxmkWYRHASrDIuP8Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="378901362"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="378901362"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 02:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018177799"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="1018177799"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 02:45:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rASvI-0008nf-0T;
	Tue, 05 Dec 2023 10:45:04 +0000
Date: Tue, 5 Dec 2023 18:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r3mini 25/34]
 drivers/net/phy/air_en8811h.c:792:5: warning: no previous prototype for
 function 'en8811h_phy_modify_mmd_changed'
Message-ID: <202312051845.2S2wmbPy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r3mini
head:   7a4da3bc9c1a2302ba8c22503865d1bbc0cdce1d
commit: d2b5b3c2c84adce7c4a2458bdd2b3a641b155cd0 [25/34] Add the Airoha EN8811H PHY driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051845.2S2wmbPy-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051845.2S2wmbPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051845.2S2wmbPy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/air_en8811h.c:792:5: warning: no previous prototype for function 'en8811h_phy_modify_mmd_changed' [-Wmissing-prototypes]
   int en8811h_phy_modify_mmd_changed(struct phy_device *phydev, int devad, u32 regnum,
       ^
   drivers/net/phy/air_en8811h.c:792:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int en8811h_phy_modify_mmd_changed(struct phy_device *phydev, int devad, u32 regnum,
   ^
   static 
   drivers/net/phy/air_en8811h.c:920:12: warning: no previous prototype for function 'en8811h_phy_driver_register' [-Wmissing-prototypes]
   int __init en8811h_phy_driver_register(void)
              ^
   drivers/net/phy/air_en8811h.c:920:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init en8811h_phy_driver_register(void)
   ^
   static 
   drivers/net/phy/air_en8811h.c:931:13: warning: no previous prototype for function 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
   void __exit en8811h_phy_driver_unregister(void)
               ^
   drivers/net/phy/air_en8811h.c:931:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit en8811h_phy_driver_unregister(void)
   ^
   static 
   3 warnings generated.


vim +/en8811h_phy_modify_mmd_changed +792 drivers/net/phy/air_en8811h.c

   791	
 > 792	int en8811h_phy_modify_mmd_changed(struct phy_device *phydev, int devad, u32 regnum,
   793				     u16 mask, u16 set)
   794	{
   795		int new, ret;
   796	
   797		ret = air_mii_cl45_read(phydev, devad, regnum);
   798		if (ret < 0)
   799			return ret;
   800	
   801		new = (ret & ~mask) | set;
   802		if (new == ret)
   803			return 0;
   804	
   805		ret = air_mii_cl45_write(phydev, devad, regnum, new);
   806	
   807		return ret < 0 ? ret : 1;
   808	}
   809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
