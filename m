Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB44CA58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693056543; x=1724592543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6esqsmPbc2c2yPfztSqjmTOUkRA+PWVm2YJJXIiKYPc=;
  b=DoBLXPi6y/TlN7rO3CyLA4wL84/qyk4xH5fBY5txIipt1jYVBlNgKLUc
   UzqwBEQ6u19qcJP5515mBSFPlGwPZ7H0lwDxpKvwybV1MMqs9BlJoptkT
   xEL8XgnTiTgMC7YEMtPvcGz7LbN0FdVkMtR2tRJu56SiSkeRmuesr4+Pc
   m2pv7qldL5ylhPNNNPRZNf75dCRxwNU8l3jsLFtWQITWsRrQsjtXGWkl+
   3N29hiaVWD5u7i7wIZOA4yuem2akte0guRBLlqyDyEn/wLD4m6tdVaNaZ
   8hoFxGOZjIPiA7rnWU0NYfg8L7Obstgn3DKZ/IlNxxxT9XhG1zvXmjLeb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="377610295"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="377610295"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 06:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="1068540622"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068540622"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 06:29:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZtLR-0004jf-37;
	Sat, 26 Aug 2023 13:28:57 +0000
Date: Sat, 26 Aug 2023 21:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 1221/12466] include/drm/drm_of.h:85:12:
 warning: 'drm_of_component_probe_with_match' defined but not used
Message-ID: <202308262155.4ALxx9r0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: 8c692185192065cbc4c5e1358fcc1abe5356149a [1221/12466] MLK-16290 drm: Add drm_of_component_probe_with_match() helper
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230826/202308262155.4ALxx9r0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262155.4ALxx9r0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262155.4ALxx9r0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_bridge.c:32:
>> include/drm/drm_of.h:85:12: warning: 'drm_of_component_probe_with_match' defined but not used [-Wunused-function]
      85 | static int drm_of_component_probe_with_match(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_of_component_probe_with_match +85 include/drm/drm_of.h

    84	
  > 85	static int drm_of_component_probe_with_match(struct device *dev,
    86				   struct component_match *match,
    87				   int (*compare_of)(struct device *, void *),
    88				   const struct component_master_ops *m_ops)
    89	{
    90		return -EINVAL;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
