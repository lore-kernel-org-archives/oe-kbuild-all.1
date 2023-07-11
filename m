Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6E1EA90
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 23:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689119489; x=1720655489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uIspA5PzfmL+2DIqvivJCXmJ7FukG9b/hulDlty64ZE=;
  b=QpXyE/30PORM7sdZL/qadANqJMSWDAS8F3CZZ6ajE3ryqgf2hlu/DoxT
   /6AAl7OIuR11p3WbrAYfGqISU3mZQYEnTd2513rPlNlKuim0AK6VgB49X
   jhXXIdy+STJ2+XlHufBG8CyAJjJjbDwpQ63E/0+mb9qA7rctk8ShfWq+M
   1gzxQZmK24OjU8TtakQ52jcxVwF3NSFD3uaEO40PIwuiKkOySLSs4mYCB
   tinjbh3cR6EBwK/3kqfPlAK7Hb3dK0FESqRpVyu2zNTISRiaQ2hOLTuyT
   XHxelQZq04cj+WWJGU+uJGDFCpuDpJ9pw50DDaHSPaOovoA63Ca+uUNPz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="363627915"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="363627915"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 16:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1051972566"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="1051972566"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2023 16:51:26 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJN8g-0005CD-0J;
	Tue, 11 Jul 2023 23:51:26 +0000
Date: Wed, 12 Jul 2023 07:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 16/94] drivers/atm/fore200e.c:2531:15:
 warning: assignment to 'const struct of_device_id *' from 'int' makes
 pointer from integer without a cast
Message-ID: <202307120735.YNhs4WNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   a06a0a7290918c32601c858af488a504c5e39025
commit: 18c4d967401f1de3bea333dd95ec7e73d5364e03 [16/94] atm: fore200e: Explicitly include correct DT includes
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307120735.YNhs4WNt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120735.YNhs4WNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120735.YNhs4WNt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/atm/fore200e.c: In function 'fore200e_sba_probe':
   drivers/atm/fore200e.c:2531:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
    2531 |         match = of_match_device(fore200e_sba_match, &op->dev);
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
>> drivers/atm/fore200e.c:2531:15: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2531 |         match = of_match_device(fore200e_sba_match, &op->dev);
         |               ^
   cc1: some warnings being treated as errors


vim +2531 drivers/atm/fore200e.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  2521  
826b6cfcd5d4c3 David S. Miller    2008-08-27  2522  #ifdef CONFIG_SBUS
b1608d69cb804e Grant Likely       2011-05-18  2523  static const struct of_device_id fore200e_sba_match[];
6c44512d06d3f6 Greg Kroah-Hartman 2012-12-21  2524  static int fore200e_sba_probe(struct platform_device *op)
826b6cfcd5d4c3 David S. Miller    2008-08-27  2525  {
b1608d69cb804e Grant Likely       2011-05-18  2526  	const struct of_device_id *match;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2527  	struct fore200e *fore200e;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2528  	static int index = 0;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2529  	int err;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2530  
b1608d69cb804e Grant Likely       2011-05-18 @2531  	match = of_match_device(fore200e_sba_match, &op->dev);
b1608d69cb804e Grant Likely       2011-05-18  2532  	if (!match)
1c48a5c93da631 Grant Likely       2011-02-17  2533  		return -EINVAL;
1c48a5c93da631 Grant Likely       2011-02-17  2534  
826b6cfcd5d4c3 David S. Miller    2008-08-27  2535  	fore200e = kzalloc(sizeof(struct fore200e), GFP_KERNEL);
826b6cfcd5d4c3 David S. Miller    2008-08-27  2536  	if (!fore200e)
826b6cfcd5d4c3 David S. Miller    2008-08-27  2537  		return -ENOMEM;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2538  
0efe5523894a26 Christoph Hellwig  2018-10-09  2539  	fore200e->bus = &fore200e_sbus_ops;
aff9d262fbf021 Christoph Hellwig  2018-10-09  2540  	fore200e->dev = &op->dev;
1636f8ac2b0841 Grant Likely       2010-06-18  2541  	fore200e->irq = op->archdata.irqs[0];
826b6cfcd5d4c3 David S. Miller    2008-08-27  2542  	fore200e->phys_base = op->resource[0].start;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2543  
0efe5523894a26 Christoph Hellwig  2018-10-09  2544  	sprintf(fore200e->name, "SBA-200E-%d", index);
826b6cfcd5d4c3 David S. Miller    2008-08-27  2545  
d9ca676bcb26e1 Dan Williams       2010-12-08  2546  	err = fore200e_init(fore200e, &op->dev);
826b6cfcd5d4c3 David S. Miller    2008-08-27  2547  	if (err < 0) {
826b6cfcd5d4c3 David S. Miller    2008-08-27  2548  		fore200e_shutdown(fore200e);
826b6cfcd5d4c3 David S. Miller    2008-08-27  2549  		kfree(fore200e);
826b6cfcd5d4c3 David S. Miller    2008-08-27  2550  		return err;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2551  	}
826b6cfcd5d4c3 David S. Miller    2008-08-27  2552  
826b6cfcd5d4c3 David S. Miller    2008-08-27  2553  	index++;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2554  	dev_set_drvdata(&op->dev, fore200e);
826b6cfcd5d4c3 David S. Miller    2008-08-27  2555  
826b6cfcd5d4c3 David S. Miller    2008-08-27  2556  	return 0;
826b6cfcd5d4c3 David S. Miller    2008-08-27  2557  }
826b6cfcd5d4c3 David S. Miller    2008-08-27  2558  

:::::: The code at line 2531 was first introduced by commit
:::::: b1608d69cb804e414d0887140ba08a9398e4e638 drivercore: revert addition of of_match to struct device

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
