Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424841DFED
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714931562; cv=none; b=IjcPJQxB60mrcER0PttPY9Bj0XDPyG2OwwYCyZGILCDsyH1mR15+Tye8WKVgMacmPr4yx7dny2D7cUMoqa6vH008VZVjTaIL+VtMuMs7KuUIJoAyGfbw+Dh5TBdwvsYQS88IqhA+vHVDM2ZsqAVZJMOauylpHJ3BeKsBHLtDB4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714931562; c=relaxed/simple;
	bh=F1rcTbHKFUtTt9tWyVskkmY8LWY3w5MqK0cR0M9CuZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=adhMCXrUVBL1l29Pm82/5P+Ow0sXSHiDFwKdY8l5pAHCoFTX46dG3shFvsN3CLRDobPV42g0rjJlnecZk2fXgNilk1f5z1t0gob1KKbAyUCBX6a+vlxCypuLo6GaPIDUh9Tf+RgRMxgPgfJ6qTImulQnhBXVkbdHeknNspuD21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GD2iBSsh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GD2iBSsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714931561; x=1746467561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1rcTbHKFUtTt9tWyVskkmY8LWY3w5MqK0cR0M9CuZs=;
  b=GD2iBSshB1OUkd9keCy31qlosUI7knI/3l1cR9E7wX7REmYkG9XTGHXQ
   QZeWYPBhZnwN0swqmg4B2jY8k6stPgtEl3Bh5nEqC/A5islbmzhUFuQG/
   QWFsgi4FOx/SpTdi9/iX0UAwZlRHnIwfx9LZdpUoJfsApnsn/Uh6j956W
   UQ+tCqKVsFaZAgSfg7zyYJ3tfE9jWvKosRw5b+7jUJsWxWBqh5WXEQX+7
   RZLlVzegWCQFjx+fw9f6OMpI0FFakJOCr+bEwHSMyGrSHC8Hkl79HetHc
   FBt2a7OOGbAiJqoBypRfM5SyENnYXrcIH9ueBLw6Kud+9FH/XY5p2z1QB
   A==;
X-CSE-ConnectionGUID: lYVnchmISnuza4ufjYTrSw==
X-CSE-MsgGUID: vFxkAGu5RxG21i0fv1qKiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14461757"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14461757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 10:52:40 -0700
X-CSE-ConnectionGUID: j3l0VUlzQAi/QABFPAPr3Q==
X-CSE-MsgGUID: m3CgOYNMThWesuZj9ShJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="28351068"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 May 2024 10:52:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3g2O-00006a-1G;
	Sun, 05 May 2024 17:52:36 +0000
Date: Mon, 6 May 2024 01:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 993/1143]
 drivers/net/can/aspeed_can.c:325:6: warning: no previous prototype for
 'aspeed_can_loopback_ext_conf'
Message-ID: <202405060124.tZmfUEyj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: d501da260baabbac9f35b566ce62e0917db53cd8 [993/1143] can: aspeed: CAN_FD support
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405060124.tZmfUEyj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060124.tZmfUEyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060124.tZmfUEyj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/can/aspeed_can.c:301:6: warning: no previous prototype for 'aspeed_can_err_init' [-Wmissing-prototypes]
     301 | void aspeed_can_err_init(struct net_device *ndev)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/net/can/aspeed_can.c:312:6: warning: no previous prototype for 'aspeed_can_interrupt_conf' [-Wmissing-prototypes]
     312 | void aspeed_can_interrupt_conf(struct net_device *ndev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/can/aspeed_can.c:325:6: warning: no previous prototype for 'aspeed_can_loopback_ext_conf' [-Wmissing-prototypes]
     325 | void aspeed_can_loopback_ext_conf(struct net_device *ndev, bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/can/aspeed_can.c:335:6: warning: no previous prototype for 'aspeed_can_loopback_int_conf' [-Wmissing-prototypes]
     335 | void aspeed_can_loopback_int_conf(struct net_device *ndev, bool enable)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/can/aspeed_can.c:345:6: warning: no previous prototype for 'aspeed_can_fd_init' [-Wmissing-prototypes]
     345 | void aspeed_can_fd_init(struct net_device *ndev)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/can/aspeed_can.c: In function 'aspeed_can_err_interrupt':
   drivers/net/can/aspeed_can.c:874:13: warning: variable 'tecnt' set but not used [-Wunused-but-set-variable]
     874 |         u32 tecnt;
         |             ^~~~~
   drivers/net/can/aspeed_can.c:873:13: warning: variable 'recnt' set but not used [-Wunused-but-set-variable]
     873 |         u32 recnt;
         |             ^~~~~


vim +/aspeed_can_loopback_ext_conf +325 drivers/net/can/aspeed_can.c

   324	
 > 325	void aspeed_can_loopback_ext_conf(struct net_device *ndev, bool enable)
   326	{
   327		struct aspeed_can_priv *priv = netdev_priv(ndev);
   328	
   329		if (enable)
   330			aspeed_can_set_bit(priv, CAN_CTRL, CAN_CTRL_LBMEMOD_BIT);
   331		else
   332			aspeed_can_clr_bit(priv, CAN_CTRL, CAN_CTRL_LBMEMOD_BIT);
   333	}
   334	
 > 335	void aspeed_can_loopback_int_conf(struct net_device *ndev, bool enable)
   336	{
   337		struct aspeed_can_priv *priv = netdev_priv(ndev);
   338	
   339		if (enable)
   340			aspeed_can_set_bit(priv, CAN_CTRL, CAN_CTRL_LBMIMOD_BIT);
   341		else
   342			aspeed_can_clr_bit(priv, CAN_CTRL, CAN_CTRL_LBMIMOD_BIT);
   343	}
   344	
 > 345	void aspeed_can_fd_init(struct net_device *ndev)
   346	{
   347		struct aspeed_can_priv *priv = netdev_priv(ndev);
   348	
   349		aspeed_can_set_bit(priv, CAN_MODE_CONFIG, BIT(0));
   350	}
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
