Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1D829408
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Aug 2024 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724587480; cv=none; b=kPFvEdQ7565dInC4j5oQvirW4btaAG/yPsUOSg7ZMLcP3ipvQX3V2HFnGNnLOupAhwiKWvLJeizMmY2KI6mQaZMP8DiHiJ6RqSk63ILRBk3qdBCnZP561/OtJTV8HrdD16pVh0dnafapOUmPSzU44Q9nDmaxPTZ0Vvv/ExkQeyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724587480; c=relaxed/simple;
	bh=ljX6O1LISngyuR9z2dqNfXgoDDPn+ngs1dIKuglOj3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfDafb43lKGLXngw/FN/6KpvhFSTMka3C7nE6btvZ1Bpnz5Toe2fJoA6RvqbmWV7OnPjzRp8+qvJrLaNGdIExfYkKukcmJWZvSYS7YNDofo/4qYvU3Em9WcMYKaS07fFMuSsIGl9msNQmB13u3oCRXpy+xPBaMgqk0XaLD5iRi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jprSr6oA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jprSr6oA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724587479; x=1756123479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljX6O1LISngyuR9z2dqNfXgoDDPn+ngs1dIKuglOj3c=;
  b=jprSr6oA0JgyEe4olHBHkGUELplWojyiEG6s3Xwol/0eIqYS+8iLPXdc
   QKd11xJdykCpSuP5QloJdxEQSviDNVoo5Tz0t06e0inY2Q40UsYA/9vZ1
   +mn5NRtZXP5vkfxabpeuyF1uh8qYmLLeIsGMJqcJUa5YpM636uXBjfrq9
   5lQ9s2WS+xGyhHb3bM5Jj44g3D2mbQrnYqEgf0Mx4REOSZkIEQacrpQQK
   CKA/NrlfDgo8GjlYbY9NyIlw/GU9RxF1Zk9RWS9hpQDWY5pkdd9GS5y94
   Bt+QiiuCkvJZC3crSQE3P3bklu3urFfx/jxwtI0V/pTwOIWSlP/NiuNn5
   Q==;
X-CSE-ConnectionGUID: 5G4n+sg1QACQUVtc/dx/KQ==
X-CSE-MsgGUID: 1WJgBDMtSPiA1gry3TirKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="23189061"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="23189061"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 05:04:38 -0700
X-CSE-ConnectionGUID: WYcM/Q8nSe6+VnlYS/Piog==
X-CSE-MsgGUID: hJkO+QIDThygwoFHOmq42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="99742964"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Aug 2024 05:04:36 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siBz0-000F9b-1D;
	Sun, 25 Aug 2024 12:04:34 +0000
Date: Sun, 25 Aug 2024 20:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [krzk-mem-ctrl:mem-ctrl-next 25/25]
 drivers/memory/ti-aemif.c:382:54: error: 'child_np' undeclared
Message-ID: <202408251935.ZJuB2dWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git mem-ctrl-next
head:   5a5ac96f9bcaaa5f04a0ab70252ea708fb9eb8b4
commit: 5a5ac96f9bcaaa5f04a0ab70252ea708fb9eb8b4 [25/25] memory: ti-aemif: simplify with scoped for each OF child loop
config: arc-randconfig-001-20240825 (https://download.01.org/0day-ci/archive/20240825/202408251935.ZJuB2dWz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408251935.ZJuB2dWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408251935.ZJuB2dWz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/memory/ti-aemif.c:17:
   drivers/memory/ti-aemif.c: In function 'aemif_probe':
>> drivers/memory/ti-aemif.c:382:54: error: 'child_np' undeclared (first use in this function)
     382 |                 for_each_available_child_of_node(np, child_np) {
         |                                                      ^~~~~~~~
   include/linux/of.h:1472:14: note: in definition of macro 'for_each_available_child_of_node'
    1472 |         for (child = of_get_next_available_child(parent, NULL); child != NULL; \
         |              ^~~~~
   drivers/memory/ti-aemif.c:382:54: note: each undeclared identifier is reported only once for each function it appears in
     382 |                 for_each_available_child_of_node(np, child_np) {
         |                                                      ^~~~~~~~
   include/linux/of.h:1472:14: note: in definition of macro 'for_each_available_child_of_node'
    1472 |         for (child = of_get_next_available_child(parent, NULL); child != NULL; \
         |              ^~~~~


vim +/child_np +382 drivers/memory/ti-aemif.c

5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  325  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  326  static int aemif_probe(struct platform_device *pdev)
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  327  {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  328  	int i;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  329  	int ret = -ENODEV;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  330  	struct device *dev = &pdev->dev;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  331  	struct device_node *np = dev->of_node;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  332  	struct aemif_device *aemif;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  333  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  334  	aemif = devm_kzalloc(dev, sizeof(*aemif), GFP_KERNEL);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  335  	if (!aemif)
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  336  		return -ENOMEM;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  337  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  338  	platform_set_drvdata(pdev, aemif);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  339  
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  340  	aemif->clk = devm_clk_get_enabled(dev, NULL);
6d9eebfdfe2431 Krzysztof Kozlowski 2024-08-16  341  	if (IS_ERR(aemif->clk))
6d9eebfdfe2431 Krzysztof Kozlowski 2024-08-16  342  		return dev_err_probe(dev, PTR_ERR(aemif->clk),
6d9eebfdfe2431 Krzysztof Kozlowski 2024-08-16  343  				     "cannot get clock 'aemif'\n");
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  344  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  345  	aemif->clk_rate = clk_get_rate(aemif->clk) / MSEC_PER_SEC;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  346  
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  347  	if (np && of_device_is_compatible(np, "ti,da850-aemif"))
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  348  		aemif->cs_offset = 2;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  349  
083008defd83cb Krzysztof Kozlowski 2022-04-19  350  	aemif->base = devm_platform_ioremap_resource(pdev, 0);
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  351  	if (IS_ERR(aemif->base))
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  352  		return PTR_ERR(aemif->base);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  353  
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  354  	if (np) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  355  		/*
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  356  		 * For every controller device node, there is a cs device node
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  357  		 * that describe the bus configuration parameters. This
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  358  		 * functions iterate over these nodes and update the cs data
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  359  		 * array.
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  360  		 */
5a5ac96f9bcaaa Krzysztof Kozlowski 2024-08-16  361  		for_each_available_child_of_node_scoped(np, child_np) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  362  			ret = of_aemif_parse_abus_config(pdev, child_np);
5a5ac96f9bcaaa Krzysztof Kozlowski 2024-08-16  363  			if (ret < 0)
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  364  				return ret;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  365  		}
94e9dd43cf3273 Pan Bian            2021-01-21  366  	}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  367  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  368  	for (i = 0; i < aemif->num_cs; i++) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  369  		ret = aemif_config_abus(pdev, i);
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  370  		if (ret < 0) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  371  			dev_err(dev, "Error configuring chip select %d\n",
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  372  				aemif->cs_data[i].cs);
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  373  			return ret;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  374  		}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  375  	}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  376  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  377  	/*
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  378  	 * Create a child devices explicitly from here to guarantee that the
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  379  	 * child will be probed after the AEMIF timing parameters are set.
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  380  	 */
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  381  	if (np) {
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24 @382  		for_each_available_child_of_node(np, child_np) {
8c38617722bdf5 Bartosz Golaszewski 2024-08-09  383  			ret = of_platform_populate(child_np, NULL, NULL, dev);
94e9dd43cf3273 Pan Bian            2021-01-21  384  			if (ret < 0) {
94e9dd43cf3273 Pan Bian            2021-01-21  385  				of_node_put(child_np);
f6ae541cc3355f Bartosz Golaszewski 2024-08-09  386  				return ret;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  387  			}
94e9dd43cf3273 Pan Bian            2021-01-21  388  		}
8af70cd2ca5080 Bartosz Golaszewski 2018-04-20  389  	}
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  390  
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  391  	return 0;
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  392  }
5a7c81547c1db7 Ivan Khoronzhuk     2014-02-24  393  

:::::: The code at line 382 was first introduced by commit
:::::: 5a7c81547c1db7563afc005a509d1ac38d9e0884 memory: ti-aemif: introduce AEMIF driver

:::::: TO: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
