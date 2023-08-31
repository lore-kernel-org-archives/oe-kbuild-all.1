Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01D6FA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693490544; x=1725026544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=236xKG3N3LrkYpJ0ryMub/85JanESgWF4A6ZTNFD5V0=;
  b=Y8zdcjI9w5gThmfvZfiSxfMVE104ZPYDieJLPKtnEMpHIwPB+6bY2e6W
   E6uiwZN0AZ/OjGBJ/hVUGhNG6UGTm4PkMLEkBE4X9QVTRXiApA0UuXz/Y
   j+zp0y4U+lmvmJR0/HMYAEMri1Wsqk1dLBGquaxXN+TufaCZs3zq+gykG
   XglshhkD9gdXY2tkQZj8BOhNX/4bu+eXw7fZnHBNlQ3biKyU2RZNXWu/J
   MJko4/vTDhVD+xp0KKC+MC8l+PbA0AImvV+sGV3XkgkgvoBY6NZQxz1PL
   Rxp9YeovXFYF2Es+PgSYpCy2A0rgKFPOd9TTNWZCg9NOB5Tiagqhh5vOO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355452049"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="355452049"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="689367105"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="689367105"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Aug 2023 07:01:52 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbiF3-0000DY-2r;
	Thu, 31 Aug 2023 14:01:49 +0000
Date: Thu, 31 Aug 2023 22:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 135/24603]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function
 definition
Message-ID: <202308312118.vFBgHwsr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viorel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 63a55b587dc56c1621aeea7bed86c56c75f98fa5 [135/24603] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312118.vFBgHwsr-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312118.vFBgHwsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312118.vFBgHwsr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/fsl/fsl_xcvr_sysfs.c: In function 'fsl_xcvr_get_attr_grp':
>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:31: warning: old-style function definition [-Wold-style-definition]
     106 | const struct attribute_group *fsl_xcvr_get_attr_grp()
         |                               ^~~~~~~~~~~~~~~~~~~~~


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
