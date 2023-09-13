Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6B010F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 09:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694598382; x=1726134382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f9l1RiTaMDYkw5Zi0CZVNxrrp4Z5wbHguc5RdWojjz4=;
  b=XB+L3psTPJqx9wMQWm3+SGpou+fwq0Rkg4gExFO+vIYtIPvGzhmTzY1h
   6slEoQchiI3lAKINiROHqbo4QvD0UmzdoXRNX+6wMCMGYFgXtd6iNRaWe
   54xyhfhIsqUFiIYxiAqijQX3OJC6pgKv4z1EGoJDBtqgyd85QdgullIDX
   YpgxrzgGPlHVwIicnhErsZGNcx5SeEGE/lYaIGNBzVOOzwjoyoC+CedyM
   5LZdrTnkq8hTjBOjYOUwfTk2X2z6T2eTauDbQjGph/p7MMek4KSi7v9PM
   aOTzDeF53aM/Dq+EkaiVXXXnFvavGxiIXrcrNS2D62VxVNTkIOGNutxSF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464983641"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="464983641"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 02:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867722743"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="867722743"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2023 02:46:20 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgMRt-0000Lf-2O;
	Wed, 13 Sep 2023 09:46:17 +0000
Date: Wed, 13 Sep 2023 17:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/2] PM: Update EXPORT_*_DEV_PM_OPS() to
 EXPORT_*_RUNTIME_PM_OPS()
Message-ID: <202309131701.zgcZGf8F-lkp@intel.com>
References: <20230913074032.27927-3-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913074032.27927-3-raag.jadav@intel.com>

Hi Raag,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/PM-Introduce-export-macros-for-_SIMPLE_-variants-of-_PM_OPS/20230913-154244
base:   linus/master
patch link:    https://lore.kernel.org/r/20230913074032.27927-3-raag.jadav%40intel.com
patch subject: [RFC v1 2/2] PM: Update EXPORT_*_DEV_PM_OPS() to EXPORT_*_RUNTIME_PM_OPS()
config: riscv-randconfig-r005-20230913 (https://download.01.org/0day-ci/archive/20230913/202309131701.zgcZGf8F-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131701.zgcZGf8F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131701.zgcZGf8F-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/mfd/cs42l43.c:1180:1: warning: data definition has no type or storage class
    1180 | EXPORT_NS_GPL_DEV_PM_OPS(cs42l43_pm_ops, MFD_CS42L43) = {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/cs42l43.c:1180:1: error: type defaults to 'int' in declaration of 'EXPORT_NS_GPL_DEV_PM_OPS' [-Werror=implicit-int]
>> drivers/mfd/cs42l43.c:1180:1: warning: parameter names (without types) in function declaration
>> drivers/mfd/cs42l43.c:1180:1: error: function 'EXPORT_NS_GPL_DEV_PM_OPS' is initialized like a variable
>> drivers/mfd/cs42l43.c:1180:57: error: invalid initializer
    1180 | EXPORT_NS_GPL_DEV_PM_OPS(cs42l43_pm_ops, MFD_CS42L43) = {
         |                                                         ^
   drivers/mfd/cs42l43.c:1180:57: note: (near initialization for 'EXPORT_NS_GPL_DEV_PM_OPS')
   drivers/mfd/cs42l43.c:1138:12: warning: 'cs42l43_runtime_resume' defined but not used [-Wunused-function]
    1138 | static int cs42l43_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/cs42l43.c:1124:12: warning: 'cs42l43_runtime_suspend' defined but not used [-Wunused-function]
    1124 | static int cs42l43_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/cs42l43.c:1106:12: warning: 'cs42l43_resume' defined but not used [-Wunused-function]
    1106 | static int cs42l43_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
   drivers/mfd/cs42l43.c:1076:12: warning: 'cs42l43_suspend' defined but not used [-Wunused-function]
    1076 | static int cs42l43_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1180 drivers/mfd/cs42l43.c

ace6d14481386ec Charles Keepax 2023-08-04  1179  
ace6d14481386ec Charles Keepax 2023-08-04 @1180  EXPORT_NS_GPL_DEV_PM_OPS(cs42l43_pm_ops, MFD_CS42L43) = {
ace6d14481386ec Charles Keepax 2023-08-04  1181  	SET_SYSTEM_SLEEP_PM_OPS(cs42l43_suspend, cs42l43_resume)
ace6d14481386ec Charles Keepax 2023-08-04  1182  	SET_RUNTIME_PM_OPS(cs42l43_runtime_suspend, cs42l43_runtime_resume, NULL)
ace6d14481386ec Charles Keepax 2023-08-04  1183  };
ace6d14481386ec Charles Keepax 2023-08-04  1184  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
