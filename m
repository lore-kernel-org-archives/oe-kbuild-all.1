Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05DC17D8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 03:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693624867; x=1725160867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HVMV0vTBwm18Oi7nCIL2LC+mK3+zXF2kZb6NnplIELg=;
  b=SiqLsoEvYPYApqjBX4wofmSS5VzE0+tJc3BkVuJG2Y54GKND3mq23IRD
   Sp3SC9q6N8x7db7P3bO60H3OTfs+lRaNRN0Na2abJnItd+G8v7XlHAGee
   NB+6uwfSxFWdqWF3ZvJsDXt98tla5WOpvr14+v0ZXLn5yIfSt7rH1fObr
   dQkrIq2z+wQSnfcskT50av7OUHdUn0tYqSrINEeUnHioj8L1m4T5zlgMe
   FYI6Ps76bgOOUe24My5gfTJWQpdD57DxCGoBpIiJfbp6nt40OPsa63tHW
   T1ep1rR9FmIVtnzQY6i2nmiMigogd61xAeNglAhjBwRk8oZIYSQ7QzK5h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442745201"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="442745201"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986884705"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="986884705"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Sep 2023 20:21:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcHC2-0001uZ-1k;
	Sat, 02 Sep 2023 03:21:02 +0000
Date: Sat, 2 Sep 2023 11:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3282/24603]
 drivers/input/touchscreen/elan_ts.c:438:32: warning: 'elan_dev_pm_ops'
 defined but not used
Message-ID: <202309021144.ibk2mRwU-lkp@intel.com>
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
commit: 54fcaa7e7c4edc52b07400f297d45ca1035ab134 [3282/24603] MLK-10142-1 touchscreen: elan: add elan touch screen driver support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230902/202309021144.ibk2mRwU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021144.ibk2mRwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021144.ibk2mRwU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/elan_ts.c:438:32: warning: 'elan_dev_pm_ops' defined but not used [-Wunused-const-variable=]
     438 | static const struct dev_pm_ops elan_dev_pm_ops = {
         |                                ^~~~~~~~~~~~~~~


vim +/elan_dev_pm_ops +438 drivers/input/touchscreen/elan_ts.c

   437	
 > 438	static const struct dev_pm_ops elan_dev_pm_ops = {
   439		.suspend = elan_suspend,
   440		.resume  = elan_resume,
   441	};
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
