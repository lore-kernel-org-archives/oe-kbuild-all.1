Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA7B23A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 04:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694406994; x=1725942994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mK26OcjDwdwsJGwcaaJnBQH13bbTPAv3DbSCxDGji50=;
  b=TH3+3g0B63CseGtTr44rMXOhyOsYJE49EJkNfjSDOXcHvui41h/dbqyE
   UKjwtH0YjpchXyQGov1BM8oNZmK3MIDrhdIFuEAu/rbcgXUfa6GGtCBCj
   hjuBG9o5UivI0WteQPYwncGP/jS6Zd71ph2qvkoXp+Hs7R8d5XPKMBo5e
   iAJVImxjgWTOEOGhJc7kgYdf66JzbG348qxt7v+ZZOKXsaWjyxDkRaKOm
   ZFUdINleKlld1h+U3QFXHaZNZ4fXb447FZw7drDUdkCUqBahJIaCh4UUT
   U4YLc66nPpAn89oHSDQLpRLJbKEHbgB5ec8CyDJSukbvIMruoTR/s7Mcp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="444407256"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="444407256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 21:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916897206"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="916897206"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Sep 2023 21:36:33 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfYf1-0005nY-0x;
	Mon, 11 Sep 2023 04:36:31 +0000
Date: Mon, 11 Sep 2023 12:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: Marian Postevca <posteuca@mutex.one>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20230830_posteuca_asoc_amd_acp_add_sound_support_for_a_line_of_huawei_laptops
 5/5] sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c:436:6: warning: no
 previous prototype for 'acp3x_es83xx_init_ops'
Message-ID: <202309111220.g63yHDfH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20230830_posteuca_asoc_amd_acp_add_sound_support_for_a_line_of_huawei_laptops
head:   54fcd9dd44b2c82a0262e29b288c2d0b36c6bba5
commit: 54fcd9dd44b2c82a0262e29b288c2d0b36c6bba5 [5/5] ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec
config: i386-randconfig-006-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111220.g63yHDfH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111220.g63yHDfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111220.g63yHDfH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c:436:6: warning: no previous prototype for 'acp3x_es83xx_init_ops' [-Wmissing-prototypes]
     436 | void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/acp3x_es83xx_init_ops +436 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c

   434	
   435	
 > 436	void acp3x_es83xx_init_ops(struct acp_mach_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
