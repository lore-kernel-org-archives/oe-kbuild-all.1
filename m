Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F17ED
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 02:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680748115; x=1712284115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xHn5JryssJlD2wJGZzY/L8AR+rTTNRB1RbxJVSmoSNQ=;
  b=gkuwQ3go11iDi8yCTNt3LGqbeGE3iW0US4WDRSIg9jzKEM+0UaOBeHsK
   Z3C9g0HTybzLMv1MCuZ86TTGf96jju8xGfLVROI34Xzea7/RSdvH9Uf4M
   oICouE3qL4Ox5rpGAln2X2MJTQKvdZXk8XAl9RSpBY5IWADWNzRJj/1Qo
   p87xqW8ZytaRdjGyBsVJOALA+bup6UpW+gDWyc9d0WoavRKW69uW5PgOA
   ZWn468s9bJwFnOgP1IqVHh9LE1xYZs8Gb5ktw5UqwkIQMdGyaarDNePvB
   +nRMeepwdJfiBZPOGLdGqAUIWiiHENyxwTItnB5LvttaZQ2hAiHcW/KA1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407711660"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="407711660"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 19:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="798153221"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="798153221"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2023 19:28:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkFMW-000Qys-2u;
	Thu, 06 Apr 2023 02:28:32 +0000
Date: Thu, 6 Apr 2023 10:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: dsa: replace
 NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
Message-ID: <202304061008.Hep5lPGA-lkp@intel.com>
References: <20230405165115.3744445-1-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405165115.3744445-1-vladimir.oltean@nxp.com>

Hi Vladimir,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
patch link:    https://lore.kernel.org/r/20230405165115.3744445-1-vladimir.oltean%40nxp.com
patch subject: [RFC PATCH net-next] net: dsa: replace NETDEV_PRE_CHANGE_HWTSTAMP notifier with a stub
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230406/202304061008.Hep5lPGA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/4788a6c004ab7f7210b1d27777e733eab85db17e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vladimir-Oltean/net-dsa-replace-NETDEV_PRE_CHANGE_HWTSTAMP-notifier-with-a-stub/20230406-005302
        git checkout 4788a6c004ab7f7210b1d27777e733eab85db17e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/google/gve/ net/dsa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061008.Hep5lPGA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/dsa/slave.c: In function 'dsa_slave_netdevice_event':
>> net/dsa/slave.c:3292:33: warning: unused variable 'extack' [-Wunused-variable]
    3292 |         struct netlink_ext_ack *extack = netdev_notifier_info_to_extack(ptr);
         |                                 ^~~~~~


vim +/extack +3292 net/dsa/slave.c

acc43b7bf52a01 Vladimir Oltean   2022-09-11  3288  
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3289  static int dsa_slave_netdevice_event(struct notifier_block *nb,
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3290  				     unsigned long event, void *ptr)
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3291  {
88c0a6b503b7f4 Vladimir Oltean   2023-04-02 @3292  	struct netlink_ext_ack *extack = netdev_notifier_info_to_extack(ptr);
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3293  	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3294  
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3295  	switch (event) {
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3296  	case NETDEV_PRECHANGEUPPER: {
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3297  		struct netdev_notifier_changeupper_info *info = ptr;
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3298  		int err;
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3299  
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3300  		err = dsa_slave_prechangeupper_sanity_check(dev, info);
0498277ee17bb4 Vladimir Oltean   2022-08-19  3301  		if (notifier_to_errno(err))
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3302  			return err;
4ede74e73b5b54 Vladimir Oltean   2021-06-27  3303  
4f03dcc6b9a073 Vladimir Oltean   2022-08-19  3304  		err = dsa_master_prechangeupper_sanity_check(dev, info);
4f03dcc6b9a073 Vladimir Oltean   2022-08-19  3305  		if (notifier_to_errno(err))
4f03dcc6b9a073 Vladimir Oltean   2022-08-19  3306  			return err;
4f03dcc6b9a073 Vladimir Oltean   2022-08-19  3307  
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3308  		err = dsa_lag_master_prechangelower_sanity_check(dev, info);
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3309  		if (notifier_to_errno(err))
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3310  			return err;
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3311  
920a33cd72314f Vladimir Oltean   2022-08-19  3312  		err = dsa_bridge_prechangelower_sanity_check(dev, info);
920a33cd72314f Vladimir Oltean   2022-08-19  3313  		if (notifier_to_errno(err))
920a33cd72314f Vladimir Oltean   2022-08-19  3314  			return err;
920a33cd72314f Vladimir Oltean   2022-08-19  3315  
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3316  		err = dsa_slave_prechangeupper(dev, ptr);
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3317  		if (notifier_to_errno(err))
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3318  			return err;
7491894532341c Vladimir Oltean   2021-06-27  3319  
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3320  		err = dsa_slave_lag_prechangeupper(dev, ptr);
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3321  		if (notifier_to_errno(err))
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3322  			return err;
7491894532341c Vladimir Oltean   2021-06-27  3323  
8350129930d2d7 Vladimir Oltean   2020-09-21  3324  		break;
2b13840672340e Vladimir Oltean   2020-09-21  3325  	}
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3326  	case NETDEV_CHANGEUPPER: {
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3327  		int err;
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3328  
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3329  		err = dsa_slave_changeupper(dev, ptr);
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3330  		if (notifier_to_errno(err))
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3331  			return err;
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3332  
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3333  		err = dsa_slave_lag_changeupper(dev, ptr);
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3334  		if (notifier_to_errno(err))
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3335  			return err;
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3336  
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3337  		err = dsa_master_changeupper(dev, ptr);
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3338  		if (notifier_to_errno(err))
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3339  			return err;
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3340  
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3341  		break;
4c3f80d22b2eca Vladimir Oltean   2022-08-19  3342  	}
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3343  	case NETDEV_CHANGELOWERSTATE: {
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3344  		struct netdev_notifier_changelowerstate_info *info = ptr;
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3345  		struct dsa_port *dp;
0a6d58a70a39d9 Dan Carpenter     2022-10-14  3346  		int err = 0;
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3347  
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3348  		if (dsa_slave_dev_check(dev)) {
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3349  			dp = dsa_slave_to_port(dev);
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3350  
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3351  			err = dsa_port_lag_change(dp, info->lower_state_info);
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3352  		}
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3353  
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3354  		/* Mirror LAG port events on DSA masters that are in
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3355  		 * a LAG towards their respective switch CPU ports
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3356  		 */
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3357  		if (netdev_uses_dsa(dev)) {
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3358  			dp = dev->dsa_ptr;
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3359  
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3360  			err = dsa_port_lag_change(dp, info->lower_state_info);
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3361  		}
acc43b7bf52a01 Vladimir Oltean   2022-09-11  3362  
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3363  		return notifier_from_errno(err);
058102a6e9eb19 Tobias Waldekranz 2021-01-13  3364  	}
295ab96f478d0f Vladimir Oltean   2022-02-02  3365  	case NETDEV_CHANGE:
295ab96f478d0f Vladimir Oltean   2022-02-02  3366  	case NETDEV_UP: {
295ab96f478d0f Vladimir Oltean   2022-02-02  3367  		/* Track state of master port.
295ab96f478d0f Vladimir Oltean   2022-02-02  3368  		 * DSA driver may require the master port (and indirectly
295ab96f478d0f Vladimir Oltean   2022-02-02  3369  		 * the tagger) to be available for some special operation.
295ab96f478d0f Vladimir Oltean   2022-02-02  3370  		 */
295ab96f478d0f Vladimir Oltean   2022-02-02  3371  		if (netdev_uses_dsa(dev)) {
295ab96f478d0f Vladimir Oltean   2022-02-02  3372  			struct dsa_port *cpu_dp = dev->dsa_ptr;
295ab96f478d0f Vladimir Oltean   2022-02-02  3373  			struct dsa_switch_tree *dst = cpu_dp->ds->dst;
295ab96f478d0f Vladimir Oltean   2022-02-02  3374  
295ab96f478d0f Vladimir Oltean   2022-02-02  3375  			/* Track when the master port is UP */
295ab96f478d0f Vladimir Oltean   2022-02-02  3376  			dsa_tree_master_oper_state_change(dst, dev,
295ab96f478d0f Vladimir Oltean   2022-02-02  3377  							  netif_oper_up(dev));
295ab96f478d0f Vladimir Oltean   2022-02-02  3378  
295ab96f478d0f Vladimir Oltean   2022-02-02  3379  			/* Track when the master port is ready and can accept
295ab96f478d0f Vladimir Oltean   2022-02-02  3380  			 * packet.
295ab96f478d0f Vladimir Oltean   2022-02-02  3381  			 * NETDEV_UP event is not enough to flag a port as ready.
295ab96f478d0f Vladimir Oltean   2022-02-02  3382  			 * We also have to wait for linkwatch_do_dev to dev_activate
295ab96f478d0f Vladimir Oltean   2022-02-02  3383  			 * and emit a NETDEV_CHANGE event.
295ab96f478d0f Vladimir Oltean   2022-02-02  3384  			 * We check if a master port is ready by checking if the dev
295ab96f478d0f Vladimir Oltean   2022-02-02  3385  			 * have a qdisc assigned and is not noop.
295ab96f478d0f Vladimir Oltean   2022-02-02  3386  			 */
295ab96f478d0f Vladimir Oltean   2022-02-02  3387  			dsa_tree_master_admin_state_change(dst, dev,
295ab96f478d0f Vladimir Oltean   2022-02-02  3388  							   !qdisc_tx_is_noop(dev));
295ab96f478d0f Vladimir Oltean   2022-02-02  3389  
295ab96f478d0f Vladimir Oltean   2022-02-02  3390  			return NOTIFY_OK;
295ab96f478d0f Vladimir Oltean   2022-02-02  3391  		}
295ab96f478d0f Vladimir Oltean   2022-02-02  3392  
295ab96f478d0f Vladimir Oltean   2022-02-02  3393  		return NOTIFY_DONE;
295ab96f478d0f Vladimir Oltean   2022-02-02  3394  	}
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3395  	case NETDEV_GOING_DOWN: {
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3396  		struct dsa_port *dp, *cpu_dp;
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3397  		struct dsa_switch_tree *dst;
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3398  		LIST_HEAD(close_list);
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3399  
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3400  		if (!netdev_uses_dsa(dev))
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3401  			return NOTIFY_DONE;
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3402  
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3403  		cpu_dp = dev->dsa_ptr;
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3404  		dst = cpu_dp->ds->dst;
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3405  
295ab96f478d0f Vladimir Oltean   2022-02-02  3406  		dsa_tree_master_admin_state_change(dst, dev, false);
295ab96f478d0f Vladimir Oltean   2022-02-02  3407  
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3408  		list_for_each_entry(dp, &dst->ports, list) {
d0004a020bb502 Vladimir Oltean   2021-10-20  3409  			if (!dsa_port_is_user(dp))
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3410  				continue;
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3411  
7136097e119964 Vladimir Oltean   2022-08-19  3412  			if (dp->cpu_dp != cpu_dp)
7136097e119964 Vladimir Oltean   2022-08-19  3413  				continue;
7136097e119964 Vladimir Oltean   2022-08-19  3414  
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3415  			list_add(&dp->slave->close_list, &close_list);
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3416  		}
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3417  
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3418  		dev_close_many(&close_list, true);
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3419  
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3420  		return NOTIFY_OK;
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3421  	}
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3422  	default:
c0a8a9c2749365 Vladimir Oltean   2021-02-05  3423  		break;
cc1d5bda17c8eb Florian Fainelli  2019-02-20  3424  	}
6debb68a2d1acd Vivien Didelot    2016-03-13  3425  
b73adef67765b7 Florian Fainelli  2015-02-24  3426  	return NOTIFY_DONE;
b73adef67765b7 Florian Fainelli  2015-02-24  3427  }
88e4f0ca4e4e77 Vivien Didelot    2017-02-03  3428  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
