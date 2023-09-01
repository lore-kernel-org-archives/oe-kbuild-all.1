Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD315A6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 02:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693536982; x=1725072982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yo5vDexpzFV23G+7XbJhEu7NYpM1c9Lqn2dto1Bb6Lw=;
  b=QExSyl77Z7vcapnfg2vYtL2R7ehezC6iQWvYR4wREiSm+GMmeHZASmzT
   ENepVPvUKGrDZAGilr4/QsyFo4oWUM4fVBHz+LvQAqxfLH+eU9Tj1X7B6
   mtpKTb4KQT6VQyLtG3I2eVvXuDGt8iE/vpylbznw4cTOL90Xu3xWhAFwm
   PQXjsPIF//ReepUx9yjfiO3pGYlNcqFuA1pMbpnczcr1o686MLUE6yIDF
   Z1aF5ot7lgVSfI03lXrO7tYQI3oA3h1Sas2IXqZJmij6TH4ETU96S95Sy
   fwDYPYbFQ3P2mysv11ejpe1/RleXvTtSFRrZ20s5hXST/hWGvWa0N2awU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355617289"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="355617289"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 19:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739774838"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="739774838"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 19:56:19 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbuKX-0000nt-1m;
	Fri, 01 Sep 2023 02:56:17 +0000
Date: Fri, 1 Sep 2023 10:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1264/24603] drivers/gpu/drm/drm_of.c:206:
 warning: Function parameter or member 'm_ops' not described in
 'drm_of_component_probe'
Message-ID: <202309011034.JxTiMTDr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 28811ecda78cb50771f8c4f0f7804caa45f638de [1264/24603] MLK-16290 drm: Add drm_of_component_probe_with_match() helper
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011034.JxTiMTDr-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011034.JxTiMTDr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011034.JxTiMTDr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_of.c:206: warning: Function parameter or member 'm_ops' not described in 'drm_of_component_probe'
>> drivers/gpu/drm/drm_of.c:206: warning: Excess function parameter 'master_ops' description in 'drm_of_component_probe'


vim +206 drivers/gpu/drm/drm_of.c

   189	
   190	/**
   191	 * drm_of_component_probe - Generic probe function for a component based master
   192	 * @dev: master device containing the OF node
   193	 * @compare_of: compare function used for matching components
   194	 * @master_ops: component master ops to be used
   195	 *
   196	 * Parse the platform device OF node and bind all the components associated
   197	 * with the master. Interface ports are added before the encoders in order to
   198	 * satisfy their .bind requirements
   199	 * See Documentation/devicetree/bindings/graph.txt for the bindings.
   200	 *
   201	 * Returns zero if successful, or one of the standard error codes if it fails.
   202	 */
   203	int drm_of_component_probe(struct device *dev,
   204				   int (*compare_of)(struct device *, void *),
   205				   const struct component_master_ops *m_ops)
 > 206	{
   207		struct component_match *match = NULL;
   208	
   209		return drm_of_component_probe_with_match(dev, match, compare_of, m_ops);
   210	}
   211	EXPORT_SYMBOL(drm_of_component_probe);
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
