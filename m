Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE52328C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 22:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvpKMH6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700258730; x=1731794730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qXv1bnV19h0nwNBQJ8nBzcsqmaOGP38dEhMnFukmhGw=;
  b=cvpKMH6gErs4YsHl8d8rH9Nl6TqahWJfZhMDvYzhLdkUDUvqEVWLZ12i
   z8Kem2IFfD5PTQc06TyJ/tcKpBkQhKOux5hVof3QqMWJQNjPZDIrsZmHJ
   A7da9t8Rjtx/oP6YJ5E80tXqYvPw4ntUx61FCAk5kWOXnXu/1Vxkr4OBX
   O/LFzTNFKhYbZ/LgS7OI6mh77/8ZS4h+2pCA2Pj5ph9PlG6w1BhMCF/6D
   tF5NVtyJAuAGe1EuxbBfwHsBRzfWs4VHni4XQNOWcobClEo/r1GPFwK0I
   mU/RJTH7NGNluJd4jcFyuwjCe5MUzFiPFZvVGhBa8mEm/ZtJJWO3hQApv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422470007"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422470007"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 14:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765728308"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="765728308"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2023 14:05:28 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r46xo-0003CB-0v;
	Fri, 17 Nov 2023 22:05:24 +0000
Date: Sat, 18 Nov 2023 06:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Michalik <michal.michalik@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v3 1/2] netdevsim: implement DPLL for
 subsystem selftests
Message-ID: <202311180556.LcevG9P0-lkp@intel.com>
References: <20231117190505.7819-2-michal.michalik@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117190505.7819-2-michal.michalik@intel.com>

Hi Michal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 18de1e517ed37ebaf33e771e46faf052e966e163]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Michalik/netdevsim-implement-DPLL-for-subsystem-selftests/20231118-030755
base:   18de1e517ed37ebaf33e771e46faf052e966e163
patch link:    https://lore.kernel.org/r/20231117190505.7819-2-michal.michalik%40intel.com
patch subject: [PATCH RFC net-next v3 1/2] netdevsim: implement DPLL for subsystem selftests
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311180556.LcevG9P0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180556.LcevG9P0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180556.LcevG9P0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/netdevsim/dpll.c: In function 'nsim_rclk_init':
>> drivers/net/netdevsim/dpll.c:410:18: warning: variable 'devid' set but not used [-Wunused-but-set-variable]
     410 |         int err, devid;
         |                  ^~~~~


vim +/devid +410 drivers/net/netdevsim/dpll.c

   405	
   406	int nsim_rclk_init(struct netdevsim *ns)
   407	{
   408		struct nsim_dpll *dpll;
   409		unsigned int index;
 > 410		int err, devid;
   411		char *name;
   412	
   413		devid = ns->nsim_dev->nsim_bus_dev->dev.id;
   414		index = ns->nsim_dev_port->port_index;
   415		dpll = &ns->nsim_dev->dpll;
   416		err = -ENOMEM;
   417	
   418		name = kasprintf(GFP_KERNEL, "RCLK_%i", index);
   419		if (!name)
   420			goto err;
   421	
   422		/* Get EEC DPLL */
   423		if (IS_ERR(dpll->dpll_e))
   424			goto dpll;
   425	
   426		/* Get PPS DPLL */
   427		if (IS_ERR(dpll->dpll_p))
   428			goto dpll;
   429	
   430		/* Create Recovered clock pin (RCLK) */
   431		nsim_fill_pin_properties(&dpll->pp_rclk[index], name,
   432					 DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   433					 PIN_RCLK_CAPABILITIES, 1, 1e6, 125e6);
   434		dpll->p_rclk[index] = dpll_pin_get(dpll->dpll_e_pd.clock_id,
   435						   PIN_RCLK + index, THIS_MODULE,
   436						   &dpll->pp_rclk[index]);
   437		kfree(name);
   438		if (IS_ERR(dpll->p_rclk[index]))
   439			goto p_rclk;
   440		nsim_fill_pin_pd(&dpll->p_rclk_pd[index], DPLL_PIN_FREQUENCY_10_MHZ,
   441				 PIN_RCLK_PRIORITY, DPLL_PIN_DIRECTION_INPUT);
   442		err = dpll_pin_register(dpll->dpll_e, dpll->p_rclk[index],
   443					&nsim_pin_ops, &dpll->p_rclk_pd[index]);
   444		if (err)
   445			goto dpll_e_reg;
   446		err = dpll_pin_register(dpll->dpll_p, dpll->p_rclk[index],
   447					&nsim_pin_ops, &dpll->p_rclk_pd[index]);
   448		if (err)
   449			goto dpll_p_reg;
   450	
   451		netdev_dpll_pin_set(ns->netdev, dpll->p_rclk[index]);
   452	
   453		return 0;
   454	
   455	dpll_p_reg:
   456		dpll_pin_unregister(dpll->dpll_e, dpll->p_rclk[index], &nsim_pin_ops,
   457				    &dpll->p_rclk_pd[index]);
   458	dpll_e_reg:
   459		dpll_pin_put(dpll->p_rclk[index]);
   460	p_rclk:
   461		nsim_free_pin_properties(&dpll->pp_rclk[index]);
   462	dpll:
   463		kfree(name);
   464	err:
   465		return err;
   466	}
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
