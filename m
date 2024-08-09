Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7356723DE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723162885; cv=none; b=O6yA8YvlLhZkPHcR3lVZ/zXYL87f/xe2u7Zifxs5oooU3BtyfOQUYX0T/aRTKDqa9M6R3M/Fc4E5m+krDx5aw8xeog9Ts/Q0HTDxqgxITQr4shAPJUKmOp8y9+Ox9NVSPnP2Q1PdLsDrYS2fUqYc9AOoV5zX4BMePfafFjjrZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723162885; c=relaxed/simple;
	bh=jOlhRSmG8hVthJmBYfx300Ap8FrWtSMtxMwUhkqNwiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM3j4DUKrC9Qjhp2VGiV8zeG09HMwRarGQmrtsob7wudXzAP+M6exA2RRxGOsf8rBbe2SI5Qw986b3IKGj9hvx1bLVv0MvbT+OSIZ+ERq9ObKb4JqOJO0oWWwUu97Oyo8xllH7W9+dVgS45M0k3VTbbiFi0NH/E2Y4fEzAy0Ehg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdbsZXsH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdbsZXsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723162884; x=1754698884;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jOlhRSmG8hVthJmBYfx300Ap8FrWtSMtxMwUhkqNwiI=;
  b=JdbsZXsHImDRwvJU5FwbZ6C//DBTJqsdpoTHp9fnq5TxrtMFDBeLE4zo
   qTh46sMckuoMKDNOnNPTPOplSH2S7c8awVjcctMCDWrUl7ZTOWByZ8qKA
   Lm7GzPrjN18IZBhgPE0a0VvZKUTSUZLVHhZktNUpq5DPN249MuprYZ/P3
   WKd43atqv60clswYt/C+NP/2Z+/B2K79BBAXOjJIrAixi1fpiss40GdhO
   ChNaZ/7aPDc4/p6ruiu8singyVjANs0B7oROIL97Ed8tx8Npd4PPLXHdM
   rn3Q0+juIPgN3sPFm3+AQgzoAAKWR+fTCwEHRNNNmtVe5+BuGO+6ktPOD
   g==;
X-CSE-ConnectionGUID: LkeaX5e0R1CbR/smQxfZmQ==
X-CSE-MsgGUID: bF3D2HYkT5uqCKM5+oAjJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38777698"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="38777698"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:21:23 -0700
X-CSE-ConnectionGUID: CdoOqHn6TYq2DVlophwgXw==
X-CSE-MsgGUID: dlTKFZmbSMqnyycxv+FOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57956414"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2024 17:21:20 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scDNZ-0006fe-19;
	Fri, 09 Aug 2024 00:21:14 +0000
Date: Fri, 9 Aug 2024 08:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_jjohnson@quicinc.com,
	horms@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: hplance: use devm in probe
Message-ID: <202408090740.vJYOceuz-lkp@intel.com>
References: <20240808041109.6871-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808041109.6871-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/net-hplance-use-devm-in-probe/20240808-121217
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240808041109.6871-1-rosenp%40gmail.com
patch subject: [PATCH net-next] net: hplance: use devm in probe
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240809/202408090740.vJYOceuz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090740.vJYOceuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090740.vJYOceuz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/amd/hplance.c: In function 'hplance_init_one':
>> drivers/net/ethernet/amd/hplance.c:87:74: error: macro "devm_alloc_etherdev" requires 2 arguments, but only 1 given
      87 |         dev = devm_alloc_etherdev(sizeof(&d->dev, struct hplance_private));
         |                                                                          ^
   In file included from drivers/net/ethernet/amd/hplance.c:24:
   include/linux/etherdevice.h:64:9: note: macro "devm_alloc_etherdev" defined here
      64 | #define devm_alloc_etherdev(dev, sizeof_priv) devm_alloc_etherdev_mqs(dev, sizeof_priv, 1, 1)
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/amd/hplance.c:87:15: error: 'devm_alloc_etherdev' undeclared (first use in this function); did you mean 'devm_alloc_etherdev_mqs'?
      87 |         dev = devm_alloc_etherdev(sizeof(&d->dev, struct hplance_private));
         |               ^~~~~~~~~~~~~~~~~~~
         |               devm_alloc_etherdev_mqs
   drivers/net/ethernet/amd/hplance.c:87:15: note: each undeclared identifier is reported only once for each function it appears in


vim +/devm_alloc_etherdev +87 drivers/net/ethernet/amd/hplance.c

    80	
    81	/* Find all the HP Lance boards and initialise them... */
    82	static int hplance_init_one(struct dio_dev *d, const struct dio_device_id *ent)
    83	{
    84		struct net_device *dev;
    85		int err;
    86	
  > 87		dev = devm_alloc_etherdev(sizeof(&d->dev, struct hplance_private));
    88		if (!dev)
    89			return -ENOMEM;
    90	
    91		if (!devm_request_mem_region(&d->dev, dio_resource_start(d),
    92					dio_resource_len(d), d->name))
    93			return -EBUSY;
    94	
    95		hplance_init(dev, d);
    96		err = devm_register_netdev(&d->dev, dev);
    97		if (err)
    98			return err;
    99	
   100		dio_set_drvdata(d, dev);
   101	
   102		printk(KERN_INFO "%s: %s; select code %d, addr %pM, irq %d\n",
   103		       dev->name, d->name, d->scode, dev->dev_addr, d->ipl);
   104	
   105		return 0;
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
