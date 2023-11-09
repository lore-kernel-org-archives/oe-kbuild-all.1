Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D60BEEAC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSqY+Rk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699519192; x=1731055192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaRAt4RKF83uMGZHmIU9MkLJOLEeX+Z5TuHQydWa5/o=;
  b=HSqY+Rk7pzts5urX5kEbqSyMwthj3EtugDtL7sZLHjltP68B8+FgIxS2
   45gyt5lEp1rJFyDAF5mMlG7jsjcrPFZRi2mvPKtp+PydbVym38V1ALTr9
   CP+8Rt8gGjpFWq50aFp5qnJYxVP4A1RVamtfpJomasZglHaVq/WekxSuW
   1HgPQqkpkk36CYaT4IwIeHg2BR3oHCqeLwksytpicZE45iTq2fW4Bv90i
   cVkP6eGpZE9QXX6e6hUIHtnof29g0wERbCGWDzKEz1vcctRu3OsIQulV2
   T1yxKuDFE7j8MkCRPjhoUpz/OZ38905dFfJ220Rmo1NgfGvok3TEfDKsG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2909934"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2909934"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 00:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="756822088"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="756822088"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Nov 2023 00:39:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r10Zn-0008al-2Y;
	Thu, 09 Nov 2023 08:39:47 +0000
Date: Thu, 9 Nov 2023 16:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r3mini 17/19]
 drivers/net/phy/air_en8811h.c:898:13: warning: unused variable 'mask'
Message-ID: <202311091624.ifBP2fk6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r3mini
head:   796143376b6d67cadd89f7466e25a56b6ee48f34
commit: a9fdd653cabc7df77cd5a88e21797d7c677035bb [17/19] prepare interrupt for 2g5 phy
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231109/202311091624.ifBP2fk6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091624.ifBP2fk6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091624.ifBP2fk6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/phy/air_en8811h.c:792:5: warning: no previous prototype for 'en8811h_phy_modify_mmd_changed' [-Wmissing-prototypes]
     792 | int en8811h_phy_modify_mmd_changed(struct phy_device *phydev, int devad, u32 regnum,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/air_en8811h.c: In function 'airoha_config_intr':
>> drivers/net/phy/air_en8811h.c:898:13: warning: unused variable 'mask' [-Wunused-variable]
     898 |         u16 mask = 0;
         |             ^~~~
   drivers/net/phy/air_en8811h.c: At top level:
   drivers/net/phy/air_en8811h.c:952:12: warning: no previous prototype for 'en8811h_phy_driver_register' [-Wmissing-prototypes]
     952 | int __init en8811h_phy_driver_register(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/air_en8811h.c:963:13: warning: no previous prototype for 'en8811h_phy_driver_unregister' [-Wmissing-prototypes]
     963 | void __exit en8811h_phy_driver_unregister(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/air_en8811h.c: In function 'airoha_config_intr':
>> drivers/net/phy/air_en8811h.c:916:16: warning: 'err' is used uninitialized [-Wuninitialized]
     916 |         return err;
         |                ^~~
   drivers/net/phy/air_en8811h.c:899:13: note: 'err' was declared here
     899 |         int err;
         |             ^~~


vim +/mask +898 drivers/net/phy/air_en8811h.c

   895	
   896	static int airoha_config_intr(struct phy_device *phydev)
   897	{
 > 898		u16 mask = 0;
   899		int err;
   900	
   901		if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
   902			/*err = airoha_ack_interrupt(phydev);
   903			if (err)
   904				return err;
   905	
   906			mask = XWAY_MDIO_INIT_MASK;
   907			err = phy_write(phydev, XWAY_MDIO_IMASK, mask);*/
   908		} else {
   909			/*err = phy_write(phydev, XWAY_MDIO_IMASK, mask);
   910			if (err)
   911				return err;
   912	
   913			err = airoha_ack_interrupt(phydev);*/
   914		}
   915	
 > 916		return err;
   917	}
   918	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
