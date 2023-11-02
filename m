Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB412B87
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eisnu+EX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698920024; x=1730456024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rq/DXZe8GbyemZSoJINr0zWbB0Z3JrIktmqsnFWuB/c=;
  b=eisnu+EX1tQFDTBL/B08hPRLosWgFB9vD7OEBApuWm5V+KsFcN6EbMxo
   m1tpEgxOM2clmaMlg47D35dkuustQGTVtHBh4u3jDaSd0sMgh2yQsods2
   LJENHQUCyilyvzRjIGnJT4oeSRbakMobHGx1hu3Rk/5zWpFk06m05sO4M
   wTmxiVdRd5xJXjKlIJ3Kh4RS4YAxxnTA41mB5sxwQwOIsptK6EzoWlF7P
   +UT0owuL2CSlm9DYy3wQklJBcEcNR3Mvp1pG3GBZdJQDo+qkyTlbBnnfO
   hOHFRG2CRXKxBDLwIJ5ESsULMNNxRGiR8JmL3AOpTXuPVHQsoZmfFdmoN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1550592"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1550592"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 03:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="796191509"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="796191509"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Nov 2023 03:13:41 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyUhn-0001Nn-0W;
	Thu, 02 Nov 2023 10:13:39 +0000
Date: Thu, 2 Nov 2023 18:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: [drm-xe:drm-xe-next-rebase-6.4-v3 254/506]
 drivers/gpu/drm/xe/xe_pci.c:772:28: error: 'xe_pci_runtime_suspend'
 undeclared here (not in a function); did you mean 'xe_pm_runtime_suspend'?
Message-ID: <202311021848.EjCFjv9n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Francois,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-rebase-6.4-v3
head:   cb8c359d816115a3fe2bbd1c22f26c277e6ddcc2
commit: 391248864bb35ef855e275ffba53789cf3ec36d3 [254/506] drm/xe: Fix build without CONFIG_PM_SLEEP
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231102/202311021848.EjCFjv9n-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021848.EjCFjv9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021848.EjCFjv9n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:19,
                    from drivers/gpu/drm/xe/xe_pci.c:8:
>> drivers/gpu/drm/xe/xe_pci.c:772:28: error: 'xe_pci_runtime_suspend' undeclared here (not in a function); did you mean 'xe_pm_runtime_suspend'?
     772 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:337:28: note: in definition of macro 'RUNTIME_PM_OPS'
     337 |         .runtime_suspend = suspend_fn, \
         |                            ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_pci.c:772:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     772 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_pci.c:772:52: error: 'xe_pci_runtime_resume' undeclared here (not in a function); did you mean 'xe_pm_runtime_resume'?
     772 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |                                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:338:27: note: in definition of macro 'RUNTIME_PM_OPS'
     338 |         .runtime_resume = resume_fn, \
         |                           ^~~~~~~~~
   drivers/gpu/drm/xe/xe_pci.c:772:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     772 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_pci.c:772:75: error: 'xe_pci_runtime_idle' undeclared here (not in a function); did you mean 'xe_pm_runtime_init'?
     772 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |                                                                           ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:339:25: note: in definition of macro 'RUNTIME_PM_OPS'
     339 |         .runtime_idle = idle_fn,
         |                         ^~~~~~~
   drivers/gpu/drm/xe/xe_pci.c:772:9: note: in expansion of macro 'SET_RUNTIME_PM_OPS'
     772 |         SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
         |         ^~~~~~~~~~~~~~~~~~


vim +772 drivers/gpu/drm/xe/xe_pci.c

f4003219244f3a2 Matthew Brost   2023-03-30  769  
f4003219244f3a2 Matthew Brost   2023-03-30  770  static const struct dev_pm_ops xe_pm_ops = {
778b90c2c975305 Francois Dugast 2023-01-23  771  	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
778b90c2c975305 Francois Dugast 2023-01-23 @772  	SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
f4003219244f3a2 Matthew Brost   2023-03-30  773  };
f4003219244f3a2 Matthew Brost   2023-03-30  774  

:::::: The code at line 772 was first introduced by commit
:::::: 778b90c2c975305230bb9f37512c0a7e480ee79c drm/xe: Use global macros to set PM functions

:::::: TO: Francois Dugast <francois.dugast@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
