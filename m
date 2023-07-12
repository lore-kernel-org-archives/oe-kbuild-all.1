Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F2362
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 02:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689128132; x=1720664132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HWIEknvbO4t5JVIiZbMABlzqtPuzyg2WCFafV5WQS3c=;
  b=OJtQJuZl7pkdukWJNBO1TOfWH1dxP/lUHUglOcJ2ANbWZtUFkdD1maI7
   S2is40sT7/1UgUqAz66M8tD+agCBUk0/0v7qrslhgqUzDqzmmDpqLUj1f
   5hDynGD2fgmvkNemROhRP2AQWSeXJI616SlbZVM8r4WrdOytVtXaeXeSI
   X/663ciHEOs+C5aLWEjMFdwa+GcFz39Q14i1KsMcjb1iWS/BmnuokbRPE
   Gup+s4XiWUyfw6ORnf19gt7ROjBrXMuqHU8Exmevldsse9NqSlo6fyEtg
   Z4ueyumfQlhypxh9FPAeacbFrcaQafXok8vAwMp1k3o9FE5WVq15haQE2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349634018"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="349634018"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 19:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="750998910"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="750998910"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2023 19:15:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJPO6-0005I1-13;
	Wed, 12 Jul 2023 02:15:30 +0000
Date: Wed, 12 Jul 2023 10:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 16/94] drivers/atm/fore200e.c:2531:17:
 error: implicit declaration of function 'of_match_device'; did you mean
 'of_match_node'?
Message-ID: <202307121046.tKsfUQIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   3fabe2c33fe8811c575713da027ca6bea22d7d5b
commit: 18c4d967401f1de3bea333dd95ec7e73d5364e03 [16/94] atm: fore200e: Explicitly include correct DT includes
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307121046.tKsfUQIY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121046.tKsfUQIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121046.tKsfUQIY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/atm/fore200e.c: In function 'fore200e_sba_probe':
>> drivers/atm/fore200e.c:2531:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
    2531 |         match = of_match_device(fore200e_sba_match, &op->dev);
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
   drivers/atm/fore200e.c:2531:15: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
