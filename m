Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7ED18A924
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770308; cv=none; b=L7MX4RaptTwFoNon5pkfWgkX6m6/FyVvXH32di6Z5YrZPrv4VwOFplgXcUEO4tECLBp9v+V6L9zhTi9xLdeBMH2m7j4ECpB0SJ8iSyW9vYuxYZauXjwbXBxMNzhL+rE43yY46ePp6EOI4Iwqq8leqZ6JTAL50OFFBziWlz6wcgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770308; c=relaxed/simple;
	bh=UVMieo7qptkLWHL4RcB7Y7yQ6/hW/TTUUHocDYijdeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SB8fQMeuDJmbFtfvphTT80F3H/qtLYRSkOpD0Y3PRok41F09U0Z8yiih7lcn+krEpgYvO1G8F2ESjr0//hN1dbQsxNKItNMR6eZoKCJZJOOrroUFDm6Xyg0VTMfYLhocU30nWV3Xhe6o+OlqaBBcqPsBfDdWK7pLU2MeJ5yGc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXPZICrm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXPZICrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738770305; x=1770306305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVMieo7qptkLWHL4RcB7Y7yQ6/hW/TTUUHocDYijdeI=;
  b=UXPZICrm3eEZ2eTyoukO5UMAX+0spr+8FaqKkGtTRpdZfLFwgqRH7wx9
   WmCgubCueEI4nqkGeLCQ3NOWQz1sZmK3LTksLXaXJsLM/q/1SSQKQwlq5
   OPMLCcovs+6z7iO0ngI3/ZcjcpQn+12FhtOuPyXDAe4RFLzDOroXWTLoS
   s2Z+enYIIYCPMXihXBd68CvEkx26pnRlV7J5yfcLPp+uRMKVL3u/bT7uL
   ZOwPo4XVHqY9U4jJ+nIvvlCijTuXCl2dcR3ur6q4RrTGOYMncPze6QRn1
   PRSvMH+VW4UG0p/fNqH64iceyzZWmu6Az5g4u1V/iEgutkV8anNFjofca
   w==;
X-CSE-ConnectionGUID: 1TQWUxX3Q/Wk1KrALcg4Cw==
X-CSE-MsgGUID: ELADRiM9QxuRyhKLvmeGXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39237293"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39237293"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 07:45:05 -0800
X-CSE-ConnectionGUID: vghglgipT1O7uedTvhpOgQ==
X-CSE-MsgGUID: 3qMCeDsKTAmK15MCtvoy0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110833107"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2025 07:45:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfhaG-000viJ-3B;
	Wed, 05 Feb 2025 15:45:00 +0000
Date: Wed, 5 Feb 2025 23:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 2/4] net: Hold netdev instance lock during
 ndo_setup_tc
Message-ID: <202502052318.69Ey7176-lkp@intel.com>
References: <20250204230057.1270362-3-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204230057.1270362-3-sdf@fomichev.me>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/net-Hold-netdev-instance-lock-during-ndo_open-ndo_stop/20250205-070345
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250204230057.1270362-3-sdf%40fomichev.me
patch subject: [RFC net-next 2/4] net: Hold netdev instance lock during ndo_setup_tc
config: i386-buildonly-randconfig-002-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052318.69Ey7176-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052318.69Ey7176-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052318.69Ey7176-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/sch_taprio.c: In function 'taprio_disable_offload':
>> net/sched/sch_taprio.c:1567:38: warning: unused variable 'ops' [-Wunused-variable]
    1567 |         const struct net_device_ops *ops = dev->netdev_ops;
         |                                      ^~~


vim +/ops +1567 net/sched/sch_taprio.c

9c66d15646760e Vinicius Costa Gomes 2019-09-15  1562  
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1563  static int taprio_disable_offload(struct net_device *dev,
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1564  				  struct taprio_sched *q,
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1565  				  struct netlink_ext_ack *extack)
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1566  {
9c66d15646760e Vinicius Costa Gomes 2019-09-15 @1567  	const struct net_device_ops *ops = dev->netdev_ops;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1568  	struct tc_taprio_qopt_offload *offload;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1569  	int err;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1570  
db46e3a88a09c5 Vladimir Oltean      2022-09-15  1571  	if (!q->offloaded)
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1572  		return 0;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1573  
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1574  	offload = taprio_offload_alloc(0);
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1575  	if (!offload) {
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1576  		NL_SET_ERR_MSG(extack,
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1577  			       "Not enough memory to disable offload mode");
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1578  		return -ENOMEM;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1579  	}
2d800bc500fb3f Vladimir Oltean      2023-05-30  1580  	offload->cmd = TAPRIO_CMD_DESTROY;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1581  
4a7badd235a5c2 Stanislav Fomichev   2025-02-04  1582  	err = dev_setup_tc(dev, TC_SETUP_QDISC_TAPRIO, offload);
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1583  	if (err < 0) {
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1584  		NL_SET_ERR_MSG(extack,
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1585  			       "Device failed to disable offload");
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1586  		goto out;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1587  	}
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1588  
db46e3a88a09c5 Vladimir Oltean      2022-09-15  1589  	q->offloaded = false;
db46e3a88a09c5 Vladimir Oltean      2022-09-15  1590  
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1591  out:
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1592  	taprio_offload_free(offload);
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1593  
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1594  	return err;
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1595  }
9c66d15646760e Vinicius Costa Gomes 2019-09-15  1596  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
