Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E1A4D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679133223; x=1710669223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VmH662oN+gne21EQgdNZwPTv0sK0ILZOBKEoLStxfgM=;
  b=hXPvbp1adHLPgpLnP8Z3BAMOItkALXpVbzGdFNaF8+W9A/M2Db6Pf69R
   nsFY0vmH/94+idHBSa5GMP3ehJU6dTUk1FFzgp4QX+zl20tjk08V58lXj
   H11HZTUiuzBASO8pqA3dv68iZhNjkCiviPUZcK1weRd4Fr2KagClBITX0
   Yf0STrrMmP+ru7w3Udk4M+gXLA4dDdCJnvufeAAz+3I+lQFniip5wJEt2
   0wl3gmVCtC1Yu/yRp7UHjnzlwV2xqXQ2CHt/Telmq6vmEe+6E0gPVxJ76
   HhmW4XB6MbpLZUCkgMHvkJUL1JnAHJagp1PJKNwOjo2nygOtlCSqS/GZj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322270132"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="322270132"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 02:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="791033740"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="791033740"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2023 02:53:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdTFs-0009yw-1O;
	Sat, 18 Mar 2023 09:53:40 +0000
Date: Sat, 18 Mar 2023 17:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>, arnd@arndb.de
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
	1395428693sheep@gmail.com, alex000young@gmail.com,
	Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [PATCH RESEND] misc: ti-st: st_kim: Fix use after free bug in
 kim_remove due to race condition
Message-ID: <202303181753.kJU7eetL-lkp@intel.com>
References: <20230318081743.797531-1-zyytlz.wz@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318081743.797531-1-zyytlz.wz@163.com>

Hi Zheng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Wang/misc-ti-st-st_kim-Fix-use-after-free-bug-in-kim_remove-due-to-race-condition/20230318-161853
patch link:    https://lore.kernel.org/r/20230318081743.797531-1-zyytlz.wz%40163.com
patch subject: [PATCH RESEND] misc: ti-st: st_kim: Fix use after free bug in kim_remove due to race condition
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230318/202303181753.kJU7eetL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ecbe190b970112b4b10e2a1766da933168ae5fdd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zheng-Wang/misc-ti-st-st_kim-Fix-use-after-free-bug-in-kim_remove-due-to-race-condition/20230318-161853
        git checkout ecbe190b970112b4b10e2a1766da933168ae5fdd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/misc/ti-st/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181753.kJU7eetL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/ti-st/st_kim.c: In function 'kim_remove':
>> drivers/misc/ti-st/st_kim.c:788:27: warning: 'kim_gdata' is used uninitialized [-Wuninitialized]
     788 |         struct st_data_s *st_gdata = kim_gdata->core_data;
         |                           ^~~~~~~~


vim +/kim_gdata +788 drivers/misc/ti-st/st_kim.c

   782	
   783	static int kim_remove(struct platform_device *pdev)
   784	{
   785		/* free the GPIOs requested */
   786		struct ti_st_plat_data	*pdata = pdev->dev.platform_data;
   787		struct kim_data_s	*kim_gdata;
 > 788		struct st_data_s *st_gdata = kim_gdata->core_data;
   789	
   790		kim_gdata = platform_get_drvdata(pdev);
   791	
   792		cancel_work_sync(&st_gdata->work_write_wakeup);
   793	
   794		/*
   795		 * Free the Bluetooth/FM/GPIO
   796		 * nShutdown gpio from the system
   797		 */
   798		gpio_free(pdata->nshutdown_gpio);
   799		pr_info("nshutdown GPIO Freed");
   800	
   801		debugfs_remove_recursive(kim_debugfs_dir);
   802		sysfs_remove_group(&pdev->dev.kobj, &uim_attr_grp);
   803		pr_info("sysfs entries removed");
   804	
   805		kim_gdata->kim_pdev = NULL;
   806		st_core_exit(st_gdata);
   807	
   808		kfree(kim_gdata);
   809		kim_gdata = NULL;
   810		return 0;
   811	}
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
