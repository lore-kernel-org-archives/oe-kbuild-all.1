Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F380E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 04:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689135582; x=1720671582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x15D498jzTEmUymDz7gDD/p99lA0LepqeBhHQBglj5g=;
  b=ccIYzXV9nyB9d4q9K5NaU2viD7K/a+2XmVa6Zj9mToANORnGLJCVUpxG
   GsFzQ0+ilqi4BonhovI9OMV/mfhE90VsGc/1sH+mI7GKQWSJwUag+N325
   GTEymz6wuRIQLaLpVLzVREcCk30lHbr5G+4VrbI/KdOs/qlsNTA/YTvjd
   lksGZFwsQTRbGW8E/nV4uzmyy522tQ8ZbvM8cUVzQNvBYT6Z7dq57ECe/
   /Z9CoN7glGGZDvn9rsBVPK7PWqQOuruwUhx1a5kU+qIIbu1cgqAB1QMNJ
   VHC/ant+FE+VBz21Owsi0UWqkAXVnjvK10BGIMWiFafQDdUfzkIrb06A3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="349649713"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="349649713"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 21:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834975723"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="834975723"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 21:19:39 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJRKE-0005NB-2v;
	Wed, 12 Jul 2023 04:19:38 +0000
Date: Wed, 12 Jul 2023 12:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 21/74]
 drivers/char/hw_random/n2-drv.c:390:25: error: implicit declaration of
 function 'dev_err'
Message-ID: <202307121214.qG8yp0xM-lkp@intel.com>
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
commit: e021c9bba8832d578239ae8c3438926d8724bf87 [21/74] char: Explicitly include correct DT includes
config: sparc-randconfig-r001-20230710 (https://download.01.org/0day-ci/archive/20230712/202307121214.qG8yp0xM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121214.qG8yp0xM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121214.qG8yp0xM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/hw_random/n2-drv.c: In function 'n2rng_grab_diag_control':
>> drivers/char/hw_random/n2-drv.c:390:25: error: implicit declaration of function 'dev_err' [-Werror=implicit-function-declaration]
     390 |                         dev_err(&np->op->dev,
         |                         ^~~~~~~
>> drivers/char/hw_random/n2-drv.c:390:40: error: invalid use of undefined type 'struct platform_device'
     390 |                         dev_err(&np->op->dev,
         |                                        ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_data_read':
   drivers/char/hw_random/n2-drv.c:438:40: error: invalid use of undefined type 'struct platform_device'
     438 |                         dev_err(&np->op->dev, "RNG error, retesting\n");
         |                                        ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_dump_test_buffer':
   drivers/char/hw_random/n2-drv.c:516:32: error: invalid use of undefined type 'struct platform_device'
     516 |                 dev_err(&np->op->dev, "Test buffer slot %d [0x%016llx]\n",
         |                                ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_check_selftest_buffer':
   drivers/char/hw_random/n2-drv.c:548:32: error: invalid use of undefined type 'struct platform_device'
     548 |                 dev_err(&np->op->dev, "Selftest failed on unit %lu\n", unit);
         |                                ^~
>> drivers/char/hw_random/n2-drv.c:551:17: error: implicit declaration of function 'dev_info' [-Werror=implicit-function-declaration]
     551 |                 dev_info(&np->op->dev, "Selftest passed on unit %lu\n", unit);
         |                 ^~~~~~~~
   drivers/char/hw_random/n2-drv.c:551:33: error: invalid use of undefined type 'struct platform_device'
     551 |                 dev_info(&np->op->dev, "Selftest passed on unit %lu\n", unit);
         |                                 ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_work':
   drivers/char/hw_random/n2-drv.c:677:33: error: invalid use of undefined type 'struct platform_device'
     677 |                 dev_info(&np->op->dev, "RNG ready\n");
         |                                 ^~
   drivers/char/hw_random/n2-drv.c:681:32: error: invalid use of undefined type 'struct platform_device'
     681 |                 dev_err(&np->op->dev, "Self-test retries failed, RNG not ready\n");
         |                                ^~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_probe':
>> drivers/char/hw_random/n2-drv.c:701:17: error: implicit declaration of function 'of_match_device'; did you mean 'of_match_node'? [-Werror=implicit-function-declaration]
     701 |         match = of_match_device(n2rng_match, &op->dev);
         |                 ^~~~~~~~~~~~~~~
         |                 of_match_node
   drivers/char/hw_random/n2-drv.c:701:49: error: invalid use of undefined type 'struct platform_device'
     701 |         match = of_match_device(n2rng_match, &op->dev);
         |                                                 ^~
>> drivers/char/hw_random/n2-drv.c:706:14: error: implicit declaration of function 'devm_kzalloc' [-Werror=implicit-function-declaration]
     706 |         np = devm_kzalloc(&op->dev, sizeof(*np), GFP_KERNEL);
         |              ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:706:30: error: invalid use of undefined type 'struct platform_device'
     706 |         np = devm_kzalloc(&op->dev, sizeof(*np), GFP_KERNEL);
         |                              ^~
   drivers/char/hw_random/n2-drv.c:726:36: error: invalid use of undefined type 'struct platform_device'
     726 |                         dev_err(&op->dev, "Cannot register suitable "
         |                                    ^~
   drivers/char/hw_random/n2-drv.c:734:36: error: invalid use of undefined type 'struct platform_device'
     734 |                         dev_err(&op->dev, "multi-unit-capable RNG requires "
         |                                    ^~
   drivers/char/hw_random/n2-drv.c:739:57: error: invalid use of undefined type 'struct platform_device'
     739 |                 np->num_units = of_getintprop_default(op->dev.of_node,
         |                                                         ^~
   drivers/char/hw_random/n2-drv.c:742:36: error: invalid use of undefined type 'struct platform_device'
     742 |                         dev_err(&op->dev, "VF RNG lacks rng-#units property\n");
         |                                    ^~
   drivers/char/hw_random/n2-drv.c:749:21: error: invalid use of undefined type 'struct platform_device'
     749 |         dev_info(&op->dev, "Registered RNG HVAPI major %lu minor %lu\n",
         |                     ^~
>> drivers/char/hw_random/n2-drv.c:751:21: error: implicit declaration of function 'devm_kcalloc' [-Werror=implicit-function-declaration]
     751 |         np->units = devm_kcalloc(&op->dev, np->num_units, sizeof(*np->units),
         |                     ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:751:37: error: invalid use of undefined type 'struct platform_device'
     751 |         np->units = devm_kcalloc(&op->dev, np->num_units, sizeof(*np->units),
         |                                     ^~
   drivers/char/hw_random/n2-drv.c:761:21: error: invalid use of undefined type 'struct platform_device'
     761 |         dev_info(&op->dev, "Found %s RNG, units: %d\n",
         |                     ^~
   drivers/char/hw_random/n2-drv.c:770:38: error: invalid use of undefined type 'struct platform_device'
     770 |         err = devm_hwrng_register(&op->dev, &np->hwrng);
         |                                      ^~
>> drivers/char/hw_random/n2-drv.c:774:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
     774 |         platform_set_drvdata(op, np);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c: In function 'n2rng_remove':
>> drivers/char/hw_random/n2-drv.c:789:28: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     789 |         struct n2rng *np = platform_get_drvdata(op);
         |                            ^~~~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/n2-drv.c:789:28: warning: initialization of 'struct n2rng *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/char/hw_random/n2-drv.c: At top level:
>> drivers/char/hw_random/n2-drv.c:860:15: error: variable 'n2rng_driver' has initializer but incomplete type
     860 | static struct platform_driver n2rng_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/char/hw_random/n2-drv.c:861:10: error: 'struct platform_driver' has no member named 'driver'
     861 |         .driver = {
         |          ^~~~~~
>> drivers/char/hw_random/n2-drv.c:861:19: error: extra brace group at end of initializer
     861 |         .driver = {
         |                   ^
   drivers/char/hw_random/n2-drv.c:861:19: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:861:19: warning: excess elements in struct initializer
   drivers/char/hw_random/n2-drv.c:861:19: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:865:10: error: 'struct platform_driver' has no member named 'probe'
     865 |         .probe          = n2rng_probe,
         |          ^~~~~
   drivers/char/hw_random/n2-drv.c:865:27: warning: excess elements in struct initializer
     865 |         .probe          = n2rng_probe,
         |                           ^~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:865:27: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:866:10: error: 'struct platform_driver' has no member named 'remove'
     866 |         .remove         = n2rng_remove,
         |          ^~~~~~
   drivers/char/hw_random/n2-drv.c:866:27: warning: excess elements in struct initializer
     866 |         .remove         = n2rng_remove,
         |                           ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:866:27: note: (near initialization for 'n2rng_driver')
>> drivers/char/hw_random/n2-drv.c:869:1: warning: data definition has no type or storage class
     869 | module_platform_driver(n2rng_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/n2-drv.c:869:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/char/hw_random/n2-drv.c:869:1: warning: parameter names (without types) in function declaration
>> drivers/char/hw_random/n2-drv.c:860:31: error: storage size of 'n2rng_driver' isn't known
     860 | static struct platform_driver n2rng_driver = {
         |                               ^~~~~~~~~~~~
   drivers/char/hw_random/n2-drv.c:860:31: warning: 'n2rng_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +/dev_err +390 drivers/char/hw_random/n2-drv.c

ce087150211412 David S. Miller 2008-06-03  378  
ce087150211412 David S. Miller 2008-06-03  379  static int n2rng_grab_diag_control(struct n2rng *np)
ce087150211412 David S. Miller 2008-06-03  380  {
ce087150211412 David S. Miller 2008-06-03  381  	int i, busy_count, err = -ENODEV;
ce087150211412 David S. Miller 2008-06-03  382  
ce087150211412 David S. Miller 2008-06-03  383  	busy_count = 0;
ce087150211412 David S. Miller 2008-06-03  384  	for (i = 0; i < 100; i++) {
ce087150211412 David S. Miller 2008-06-03  385  		err = n2rng_try_read_ctl(np);
ce087150211412 David S. Miller 2008-06-03  386  		if (err != -EAGAIN)
ce087150211412 David S. Miller 2008-06-03  387  			break;
ce087150211412 David S. Miller 2008-06-03  388  
ce087150211412 David S. Miller 2008-06-03  389  		if (++busy_count > 100) {
ce087150211412 David S. Miller 2008-06-03 @390  			dev_err(&np->op->dev,
ce087150211412 David S. Miller 2008-06-03  391  				"Grab diag control timeout.\n");
ce087150211412 David S. Miller 2008-06-03  392  			return -ENODEV;
ce087150211412 David S. Miller 2008-06-03  393  		}
ce087150211412 David S. Miller 2008-06-03  394  
ce087150211412 David S. Miller 2008-06-03  395  		udelay(1);
ce087150211412 David S. Miller 2008-06-03  396  	}
ce087150211412 David S. Miller 2008-06-03  397  
ce087150211412 David S. Miller 2008-06-03  398  	return err;
ce087150211412 David S. Miller 2008-06-03  399  }
ce087150211412 David S. Miller 2008-06-03  400  
ce087150211412 David S. Miller 2008-06-03  401  static int n2rng_init_control(struct n2rng *np)
ce087150211412 David S. Miller 2008-06-03  402  {
ce087150211412 David S. Miller 2008-06-03  403  	int err = n2rng_grab_diag_control(np);
ce087150211412 David S. Miller 2008-06-03  404  
ce087150211412 David S. Miller 2008-06-03  405  	/* Not in the control domain, that's OK we are only a consumer
ce087150211412 David S. Miller 2008-06-03  406  	 * of the RNG data, we don't setup and program it.
ce087150211412 David S. Miller 2008-06-03  407  	 */
ce087150211412 David S. Miller 2008-06-03  408  	if (err == -EPERM)
ce087150211412 David S. Miller 2008-06-03  409  		return 0;
ce087150211412 David S. Miller 2008-06-03  410  	if (err)
ce087150211412 David S. Miller 2008-06-03  411  		return err;
ce087150211412 David S. Miller 2008-06-03  412  
ce087150211412 David S. Miller 2008-06-03  413  	n2rng_control_swstate_init(np);
ce087150211412 David S. Miller 2008-06-03  414  
ce087150211412 David S. Miller 2008-06-03  415  	return 0;
ce087150211412 David S. Miller 2008-06-03  416  }
ce087150211412 David S. Miller 2008-06-03  417  
ce087150211412 David S. Miller 2008-06-03  418  static int n2rng_data_read(struct hwrng *rng, u32 *data)
ce087150211412 David S. Miller 2008-06-03  419  {
50b6e71ae83714 Herbert Xu      2010-08-09  420  	struct n2rng *np = (struct n2rng *) rng->priv;
ce087150211412 David S. Miller 2008-06-03  421  	unsigned long ra = __pa(&np->test_data);
ce087150211412 David S. Miller 2008-06-03  422  	int len;
ce087150211412 David S. Miller 2008-06-03  423  
ce087150211412 David S. Miller 2008-06-03  424  	if (!(np->flags & N2RNG_FLAG_READY)) {
ce087150211412 David S. Miller 2008-06-03  425  		len = 0;
ce087150211412 David S. Miller 2008-06-03  426  	} else if (np->flags & N2RNG_FLAG_BUFFER_VALID) {
ce087150211412 David S. Miller 2008-06-03  427  		np->flags &= ~N2RNG_FLAG_BUFFER_VALID;
ce087150211412 David S. Miller 2008-06-03  428  		*data = np->buffer;
ce087150211412 David S. Miller 2008-06-03  429  		len = 4;
ce087150211412 David S. Miller 2008-06-03  430  	} else {
ce087150211412 David S. Miller 2008-06-03  431  		int err = n2rng_generic_read_data(ra);
ce087150211412 David S. Miller 2008-06-03  432  		if (!err) {
07e25d43be8502 Shannon Nelson  2017-01-12  433  			np->flags |= N2RNG_FLAG_BUFFER_VALID;
ce087150211412 David S. Miller 2008-06-03  434  			np->buffer = np->test_data >> 32;
ce087150211412 David S. Miller 2008-06-03  435  			*data = np->test_data & 0xffffffff;
ce087150211412 David S. Miller 2008-06-03  436  			len = 4;
ce087150211412 David S. Miller 2008-06-03  437  		} else {
57f5bfebe3b106 Colin Ian King  2018-05-08  438  			dev_err(&np->op->dev, "RNG error, retesting\n");
ce087150211412 David S. Miller 2008-06-03  439  			np->flags &= ~N2RNG_FLAG_READY;
ce087150211412 David S. Miller 2008-06-03  440  			if (!(np->flags & N2RNG_FLAG_SHUTDOWN))
ce087150211412 David S. Miller 2008-06-03  441  				schedule_delayed_work(&np->work, 0);
ce087150211412 David S. Miller 2008-06-03  442  			len = 0;
ce087150211412 David S. Miller 2008-06-03  443  		}
ce087150211412 David S. Miller 2008-06-03  444  	}
ce087150211412 David S. Miller 2008-06-03  445  
ce087150211412 David S. Miller 2008-06-03  446  	return len;
ce087150211412 David S. Miller 2008-06-03  447  }
ce087150211412 David S. Miller 2008-06-03  448  
ce087150211412 David S. Miller 2008-06-03  449  /* On a guest node, just make sure we can read random data properly.
ce087150211412 David S. Miller 2008-06-03  450   * If a control node reboots or reloads it's n2rng driver, this won't
ce087150211412 David S. Miller 2008-06-03  451   * work during that time.  So we have to keep probing until the device
ce087150211412 David S. Miller 2008-06-03  452   * becomes usable.
ce087150211412 David S. Miller 2008-06-03  453   */
ce087150211412 David S. Miller 2008-06-03  454  static int n2rng_guest_check(struct n2rng *np)
ce087150211412 David S. Miller 2008-06-03  455  {
ce087150211412 David S. Miller 2008-06-03  456  	unsigned long ra = __pa(&np->test_data);
ce087150211412 David S. Miller 2008-06-03  457  
ce087150211412 David S. Miller 2008-06-03  458  	return n2rng_generic_read_data(ra);
ce087150211412 David S. Miller 2008-06-03  459  }
ce087150211412 David S. Miller 2008-06-03  460  
ce087150211412 David S. Miller 2008-06-03  461  static int n2rng_entropy_diag_read(struct n2rng *np, unsigned long unit,
ce087150211412 David S. Miller 2008-06-03  462  				   u64 *pre_control, u64 pre_state,
ce087150211412 David S. Miller 2008-06-03  463  				   u64 *buffer, unsigned long buf_len,
ce087150211412 David S. Miller 2008-06-03  464  				   u64 *post_control, u64 post_state)
ce087150211412 David S. Miller 2008-06-03  465  {
ce087150211412 David S. Miller 2008-06-03  466  	unsigned long post_ctl_ra = __pa(post_control);
ce087150211412 David S. Miller 2008-06-03  467  	unsigned long pre_ctl_ra = __pa(pre_control);
ce087150211412 David S. Miller 2008-06-03  468  	unsigned long buffer_ra = __pa(buffer);
ce087150211412 David S. Miller 2008-06-03  469  	int err;
ce087150211412 David S. Miller 2008-06-03  470  
ce087150211412 David S. Miller 2008-06-03  471  	err = n2rng_generic_write_control(np, pre_ctl_ra, unit, pre_state);
ce087150211412 David S. Miller 2008-06-03  472  	if (err)
ce087150211412 David S. Miller 2008-06-03  473  		return err;
ce087150211412 David S. Miller 2008-06-03  474  
ce087150211412 David S. Miller 2008-06-03  475  	err = n2rng_generic_read_diag_data(np, unit,
ce087150211412 David S. Miller 2008-06-03  476  					   buffer_ra, buf_len);
ce087150211412 David S. Miller 2008-06-03  477  
ce087150211412 David S. Miller 2008-06-03  478  	(void) n2rng_generic_write_control(np, post_ctl_ra, unit,
ce087150211412 David S. Miller 2008-06-03  479  					   post_state);
ce087150211412 David S. Miller 2008-06-03  480  
ce087150211412 David S. Miller 2008-06-03  481  	return err;
ce087150211412 David S. Miller 2008-06-03  482  }
ce087150211412 David S. Miller 2008-06-03  483  
ce087150211412 David S. Miller 2008-06-03  484  static u64 advance_polynomial(u64 poly, u64 val, int count)
ce087150211412 David S. Miller 2008-06-03  485  {
ce087150211412 David S. Miller 2008-06-03  486  	int i;
ce087150211412 David S. Miller 2008-06-03  487  
ce087150211412 David S. Miller 2008-06-03  488  	for (i = 0; i < count; i++) {
ce087150211412 David S. Miller 2008-06-03  489  		int highbit_set = ((s64)val < 0);
ce087150211412 David S. Miller 2008-06-03  490  
ce087150211412 David S. Miller 2008-06-03  491  		val <<= 1;
ce087150211412 David S. Miller 2008-06-03  492  		if (highbit_set)
ce087150211412 David S. Miller 2008-06-03  493  			val ^= poly;
ce087150211412 David S. Miller 2008-06-03  494  	}
ce087150211412 David S. Miller 2008-06-03  495  
ce087150211412 David S. Miller 2008-06-03  496  	return val;
ce087150211412 David S. Miller 2008-06-03  497  }
ce087150211412 David S. Miller 2008-06-03  498  
ce087150211412 David S. Miller 2008-06-03  499  static int n2rng_test_buffer_find(struct n2rng *np, u64 val)
ce087150211412 David S. Miller 2008-06-03  500  {
ce087150211412 David S. Miller 2008-06-03  501  	int i, count = 0;
ce087150211412 David S. Miller 2008-06-03  502  
ce087150211412 David S. Miller 2008-06-03  503  	/* Purposefully skip over the first word.  */
ce087150211412 David S. Miller 2008-06-03  504  	for (i = 1; i < SELFTEST_BUFFER_WORDS; i++) {
ce087150211412 David S. Miller 2008-06-03  505  		if (np->test_buffer[i] == val)
ce087150211412 David S. Miller 2008-06-03  506  			count++;
ce087150211412 David S. Miller 2008-06-03  507  	}
ce087150211412 David S. Miller 2008-06-03  508  	return count;
ce087150211412 David S. Miller 2008-06-03  509  }
ce087150211412 David S. Miller 2008-06-03  510  
ce087150211412 David S. Miller 2008-06-03  511  static void n2rng_dump_test_buffer(struct n2rng *np)
ce087150211412 David S. Miller 2008-06-03  512  {
ce087150211412 David S. Miller 2008-06-03  513  	int i;
ce087150211412 David S. Miller 2008-06-03  514  
ce087150211412 David S. Miller 2008-06-03  515  	for (i = 0; i < SELFTEST_BUFFER_WORDS; i++)
3f4528d6e91cff Sam Ravnborg    2009-01-06 @516  		dev_err(&np->op->dev, "Test buffer slot %d [0x%016llx]\n",
ce087150211412 David S. Miller 2008-06-03  517  			i, np->test_buffer[i]);
ce087150211412 David S. Miller 2008-06-03  518  }
ce087150211412 David S. Miller 2008-06-03  519  
ce087150211412 David S. Miller 2008-06-03  520  static int n2rng_check_selftest_buffer(struct n2rng *np, unsigned long unit)
ce087150211412 David S. Miller 2008-06-03  521  {
07e25d43be8502 Shannon Nelson  2017-01-12  522  	u64 val;
ce087150211412 David S. Miller 2008-06-03  523  	int err, matches, limit;
ce087150211412 David S. Miller 2008-06-03  524  
07e25d43be8502 Shannon Nelson  2017-01-12  525  	switch (np->data->id) {
07e25d43be8502 Shannon Nelson  2017-01-12  526  	case N2_n2_rng:
07e25d43be8502 Shannon Nelson  2017-01-12  527  	case N2_vf_rng:
07e25d43be8502 Shannon Nelson  2017-01-12  528  	case N2_kt_rng:
07e25d43be8502 Shannon Nelson  2017-01-12  529  	case N2_m4_rng:  /* yes, m4 uses the old value */
07e25d43be8502 Shannon Nelson  2017-01-12  530  		val = RNG_v1_SELFTEST_VAL;
07e25d43be8502 Shannon Nelson  2017-01-12  531  		break;
07e25d43be8502 Shannon Nelson  2017-01-12  532  	default:
07e25d43be8502 Shannon Nelson  2017-01-12  533  		val = RNG_v2_SELFTEST_VAL;
07e25d43be8502 Shannon Nelson  2017-01-12  534  		break;
07e25d43be8502 Shannon Nelson  2017-01-12  535  	}
07e25d43be8502 Shannon Nelson  2017-01-12  536  
ce087150211412 David S. Miller 2008-06-03  537  	matches = 0;
ce087150211412 David S. Miller 2008-06-03  538  	for (limit = 0; limit < SELFTEST_LOOPS_MAX; limit++) {
ce087150211412 David S. Miller 2008-06-03  539  		matches += n2rng_test_buffer_find(np, val);
ce087150211412 David S. Miller 2008-06-03  540  		if (matches >= SELFTEST_MATCH_GOAL)
ce087150211412 David S. Miller 2008-06-03  541  			break;
ce087150211412 David S. Miller 2008-06-03  542  		val = advance_polynomial(SELFTEST_POLY, val, 1);
ce087150211412 David S. Miller 2008-06-03  543  	}
ce087150211412 David S. Miller 2008-06-03  544  
ce087150211412 David S. Miller 2008-06-03  545  	err = 0;
ce087150211412 David S. Miller 2008-06-03  546  	if (limit >= SELFTEST_LOOPS_MAX) {
ce087150211412 David S. Miller 2008-06-03  547  		err = -ENODEV;
ce087150211412 David S. Miller 2008-06-03  548  		dev_err(&np->op->dev, "Selftest failed on unit %lu\n", unit);
ce087150211412 David S. Miller 2008-06-03  549  		n2rng_dump_test_buffer(np);
ce087150211412 David S. Miller 2008-06-03  550  	} else
ce087150211412 David S. Miller 2008-06-03 @551  		dev_info(&np->op->dev, "Selftest passed on unit %lu\n", unit);
ce087150211412 David S. Miller 2008-06-03  552  
ce087150211412 David S. Miller 2008-06-03  553  	return err;
ce087150211412 David S. Miller 2008-06-03  554  }
ce087150211412 David S. Miller 2008-06-03  555  

:::::: The code at line 390 was first introduced by commit
:::::: ce087150211412afd901a3fa16b1aab5b54d1bcb sparc64: Add Niagara2 RNG driver.

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
