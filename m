Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FC1171C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 23:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694562439; x=1726098439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oegqHBd9gIManV+PGJsyg1LW2DBbl03BJ/pg+xNqkik=;
  b=izyIgJW2BuWAks9a7In5YYulVzd7EjPTD3vH/10pnpLO4s2o3mIpPZjr
   +qoRWdZhE1scgpKQUGFiTfS9vKbncUe6d+1tcqcn/xxl2prdmEoCbjdNR
   qmVa+K0k/S3K2RF0RFw+MabRcwDkx9ccOhlrHJATwgkLIWfu6xAh8OXfT
   O8Eqlnql5GMdKIHfyBclt6ID0GLX4lxk6N9YldKl2TT+FdI0fMijgLkGa
   XOWHaZ711u5F85lIRMODnE8NDaFk4kgz9hQ5WnEE3ghAJfO9eSzQD20LJ
   H7ZOf4qxj/ZIGH0efD5v6jIyph0zrKBcZbHWiAk9+O+1LY6lapv1E7nVQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="375852981"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="375852981"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 16:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867560538"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="867560538"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Sep 2023 16:47:16 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgD6A-0000TR-0g;
	Tue, 12 Sep 2023 23:47:14 +0000
Date: Wed, 13 Sep 2023 07:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 571/6555]
 drivers/pkglist/pkglist_none.c:45:12: warning: no previous declaration for
 'pkglist_init'
Message-ID: <202309130744.SjCL8tPt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 23f2bb7927c105fe2dd9d82410183013695317bd [571/6555] CHROMIUM: drivers: Create pkglist for configuration
config: i386-buildonly-randconfig-005-20230913 (https://download.01.org/0day-ci/archive/20230913/202309130744.SjCL8tPt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130744.SjCL8tPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130744.SjCL8tPt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pkglist/pkglist_none.c:45:12: warning: no previous declaration for 'pkglist_init' [-Wmissing-declarations]
    int __init pkglist_init(void)
               ^~~~~~~~~~~~
>> drivers/pkglist/pkglist_none.c:51:6: warning: no previous declaration for 'pkglist_exit' [-Wmissing-declarations]
    void pkglist_exit(void) { }
         ^~~~~~~~~~~~


vim +/pkglist_init +45 drivers/pkglist/pkglist_none.c

    44	
  > 45	int __init pkglist_init(void)
    46	{
    47		return 0;
    48	}
    49	module_init(pkglist_init);
    50	
  > 51	void pkglist_exit(void) { }
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
