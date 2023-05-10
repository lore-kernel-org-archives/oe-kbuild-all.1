Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFD420B34
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683729340; x=1715265340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/YYkUuVrytEBSDSN21goy5zE9oMhyjGHrNUsBcNBHos=;
  b=P4d0k2O8TbTs5XNIXJPUnERUDTpWDVvKXNS32W0VBskT1/KPd3KhmSVt
   DmQzm9UBaSFqgY2IFF5Ss7ubf2TYXBgVZXw9wXv/pJYVOVSzsfyEkLKrB
   xt6hN6mulQmo5mAgTMeAOGuraXcrvFqzRaxXuGJZLifer0nGH4SaBYbjm
   4bEy7Ih/nDWHvF72Pua6D3EZeTcVP/o3l9zqoPaCMNyrHN0y4a3m8reVr
   uHM5JREDgWHQ9ATUd41H6XQfVTpwoz2fBtmC7tLrGN17lEMWcXKm75vaP
   vvRDrEEEKz9lEt3/B3rbc32W/RHLUAezVQaYmsGfh1RziJ8Mh3jE2cEuA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339473669"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="339473669"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 07:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873593778"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="873593778"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 07:35:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwkuk-0003Mc-0k;
	Wed, 10 May 2023 14:35:34 +0000
Date: Wed, 10 May 2023 22:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: [mlankhorst:dumpcg 16850/16889] drivers/gpu/drm/xe/xe_pci.c:779:28:
 error: 'xe_pci_runtime_suspend' undeclared here (not in a function); did you
 mean 'xe_pm_runtime_suspend'?
Message-ID: <202305102208.58zidMZk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~mlankhorst/linux dumpcg
head:   169b450351c6705039540a916fccb470d26ec34c
commit: b69d5cd42aad1f36db18f01778aac982f69a6889 [16850/16889] drm/xe: Fix build without CONFIG_PM_SLEEP
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305102208.58zidMZk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add mlankhorst git://people.freedesktop.org/~mlankhorst/linux
        git fetch --no-tags mlankhorst dumpcg
        git checkout b69d5cd42aad1f36db18f01778aac982f69a6889
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102208.58zidMZk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:19,
                    from drivers/gpu/drm/xe/xe_pci.c:8:
>> drivers/gpu/drm/xe/xe_pci.c:779:28: error: 'xe_pci_runtime_suspend' undeclared here (not in a function); did you mean 'xe_pm_runtime_suspend'?
     779 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:337:28: note: in definition of macro 'RUNTIME_PM_OPS'
     337 |         .runtime_suspend = suspend_fn, \
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_pci.c:779:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     779 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_pci.c:779:52: error: 'xe_pci_runtime_resume' undeclared here (not in a function); did you mean 'xe_pm_runtime_resume'?
     779 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:338:27: note: in definition of macro 'RUNTIME_PM_OPS'
     338 |         .runtime_resume = resume_fn, \
         |                           ^~~~~~~~~
   drivers/gpu/drm/xe/xe_pci.c:779:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     779 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_pci.c:779:75: error: 'xe_pci_runtime_idle' undeclared here (not in a function); did you mean 'xe_pm_runtime_init'?
     779 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |                                                                           ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:339:25: note: in definition of macro 'RUNTIME_PM_OPS'
     339 |         .runtime_idle = idle_fn,
         |                         ^~~~~~~
   drivers/gpu/drm/xe/xe_pci.c:779:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     779 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |         ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +779 drivers/gpu/drm/xe/xe_pci.c

e5f8e18d13b6e9 Matthew Brost   2023-03-30  776  
e5f8e18d13b6e9 Matthew Brost   2023-03-30  777  static const struct dev_pm_ops xe_pm_ops = {
4567252b055b92 Francois Dugast 2023-01-23  778  	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
4567252b055b92 Francois Dugast 2023-01-23 @779  	SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
e5f8e18d13b6e9 Matthew Brost   2023-03-30  780  };
e5f8e18d13b6e9 Matthew Brost   2023-03-30  781  

:::::: The code at line 779 was first introduced by commit
:::::: 4567252b055b92b0b730360e3932caa7add7aeee drm/xe: Use global macros to set PM functions

:::::: TO: Francois Dugast <francois.dugast@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
