Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE1320C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 20:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682715586; x=1714251586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbSfXwxmSyUXGnF7CchmLIhKSDNUNGCdduQZUe9EMUk=;
  b=OZbWLBBHUTsYB5aYqoJbQwsWPYn9sZxwjyDDbNkahSlNz12ZBnKvPrXL
   U86nscv7k/kuVnU4OU8sU8Em2Kaei0LjUkDdFLAr08GqV0DGjaPLwdVWj
   rCInlY0YdX9tsg9hVaXUlN/ejeRiVLUvAelddlYmEVwplQdjP2wCYaPdd
   u5TjJ1i1HLVDA3zFA6dwliKKjnLkD9B/bHc9+s8gCmoT8kbFJ/XtTmUEf
   13Xd3pXb/SuGOW/oiiKYv/n0pmu/bot8GvtCZ3FV/lItWN6mN8VyT+kyU
   jtdDMuApgHGDzW5b1gFKC8kra6e0QgkBqL6fkyXnLpD/rBHNvi3CNojy2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="336938674"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="336938674"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 13:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="645285814"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="645285814"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Apr 2023 13:59:44 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psVBv-0000gb-2v;
	Fri, 28 Apr 2023 20:59:43 +0000
Date: Sat, 29 Apr 2023 04:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Ahern <david@enfabrica.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dsahern:enfab-6.3 1/10] drivers/net/tun.c:2714:5: warning: no
 previous prototype for 'tun_set_iff'
Message-ID: <202304290453.8b84zzey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dsahern/linux enfab-6.3
head:   a036626ebabac8cfa59cb5f2a4306b20e4006af6
commit: 935668aa2697d813f514f5482b359299c4c670ee [1/10] enf: export tun_set_iff
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230429/202304290453.8b84zzey-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dsahern/linux/commit/935668aa2697d813f514f5482b359299c4c670ee
        git remote add dsahern https://github.com/dsahern/linux
        git fetch --no-tags dsahern enfab-6.3
        git checkout 935668aa2697d813f514f5482b359299c4c670ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290453.8b84zzey-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/tun.c:2714:5: warning: no previous prototype for 'tun_set_iff' [-Wmissing-prototypes]
    2714 | int tun_set_iff(struct net *net, struct file *file, struct ifreq *ifr)
         |     ^~~~~~~~~~~


vim +/tun_set_iff +2714 drivers/net/tun.c

  2713	
> 2714	int tun_set_iff(struct net *net, struct file *file, struct ifreq *ifr)
  2715	{
  2716		struct tun_struct *tun;
  2717		struct tun_file *tfile = file->private_data;
  2718		struct net_device *dev;
  2719		int err;
  2720	
  2721		if (tfile->detached)
  2722			return -EINVAL;
  2723	
  2724		if ((ifr->ifr_flags & IFF_NAPI_FRAGS)) {
  2725			if (!capable(CAP_NET_ADMIN))
  2726				return -EPERM;
  2727	
  2728			if (!(ifr->ifr_flags & IFF_NAPI) ||
  2729			    (ifr->ifr_flags & TUN_TYPE_MASK) != IFF_TAP)
  2730				return -EINVAL;
  2731		}
  2732	
  2733		dev = __dev_get_by_name(net, ifr->ifr_name);
  2734		if (dev) {
  2735			if (ifr->ifr_flags & IFF_TUN_EXCL)
  2736				return -EBUSY;
  2737			if ((ifr->ifr_flags & IFF_TUN) && dev->netdev_ops == &tun_netdev_ops)
  2738				tun = netdev_priv(dev);
  2739			else if ((ifr->ifr_flags & IFF_TAP) && dev->netdev_ops == &tap_netdev_ops)
  2740				tun = netdev_priv(dev);
  2741			else
  2742				return -EINVAL;
  2743	
  2744			if (!!(ifr->ifr_flags & IFF_MULTI_QUEUE) !=
  2745			    !!(tun->flags & IFF_MULTI_QUEUE))
  2746				return -EINVAL;
  2747	
  2748			if (tun_not_capable(tun))
  2749				return -EPERM;
  2750			err = security_tun_dev_open(tun->security);
  2751			if (err < 0)
  2752				return err;
  2753	
  2754			err = tun_attach(tun, file, ifr->ifr_flags & IFF_NOFILTER,
  2755					 ifr->ifr_flags & IFF_NAPI,
  2756					 ifr->ifr_flags & IFF_NAPI_FRAGS, true);
  2757			if (err < 0)
  2758				return err;
  2759	
  2760			if (tun->flags & IFF_MULTI_QUEUE &&
  2761			    (tun->numqueues + tun->numdisabled > 1)) {
  2762				/* One or more queue has already been attached, no need
  2763				 * to initialize the device again.
  2764				 */
  2765				netdev_state_change(dev);
  2766				return 0;
  2767			}
  2768	
  2769			tun->flags = (tun->flags & ~TUN_FEATURES) |
  2770				      (ifr->ifr_flags & TUN_FEATURES);
  2771	
  2772			netdev_state_change(dev);
  2773		} else {
  2774			char *name;
  2775			unsigned long flags = 0;
  2776			int queues = ifr->ifr_flags & IFF_MULTI_QUEUE ?
  2777				     MAX_TAP_QUEUES : 1;
  2778	
  2779			if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
  2780				return -EPERM;
  2781			err = security_tun_dev_create();
  2782			if (err < 0)
  2783				return err;
  2784	
  2785			/* Set dev type */
  2786			if (ifr->ifr_flags & IFF_TUN) {
  2787				/* TUN device */
  2788				flags |= IFF_TUN;
  2789				name = "tun%d";
  2790			} else if (ifr->ifr_flags & IFF_TAP) {
  2791				/* TAP device */
  2792				flags |= IFF_TAP;
  2793				name = "tap%d";
  2794			} else
  2795				return -EINVAL;
  2796	
  2797			if (*ifr->ifr_name)
  2798				name = ifr->ifr_name;
  2799	
  2800			dev = alloc_netdev_mqs(sizeof(struct tun_struct), name,
  2801					       NET_NAME_UNKNOWN, tun_setup, queues,
  2802					       queues);
  2803	
  2804			if (!dev)
  2805				return -ENOMEM;
  2806	
  2807			dev_net_set(dev, net);
  2808			dev->rtnl_link_ops = &tun_link_ops;
  2809			dev->ifindex = tfile->ifindex;
  2810			dev->sysfs_groups[0] = &tun_attr_group;
  2811	
  2812			tun = netdev_priv(dev);
  2813			tun->dev = dev;
  2814			tun->flags = flags;
  2815			tun->txflt.count = 0;
  2816			tun->vnet_hdr_sz = sizeof(struct virtio_net_hdr);
  2817	
  2818			tun->align = NET_SKB_PAD;
  2819			tun->filter_attached = false;
  2820			tun->sndbuf = tfile->socket.sk->sk_sndbuf;
  2821			tun->rx_batched = 0;
  2822			RCU_INIT_POINTER(tun->steering_prog, NULL);
  2823	
  2824			tun->ifr = ifr;
  2825			tun->file = file;
  2826	
  2827			tun_net_initialize(dev);
  2828	
  2829			err = register_netdevice(tun->dev);
  2830			if (err < 0) {
  2831				free_netdev(dev);
  2832				return err;
  2833			}
  2834			/* free_netdev() won't check refcnt, to avoid race
  2835			 * with dev_put() we need publish tun after registration.
  2836			 */
  2837			rcu_assign_pointer(tfile->tun, tun);
  2838		}
  2839	
  2840		if (ifr->ifr_flags & IFF_NO_CARRIER)
  2841			netif_carrier_off(tun->dev);
  2842		else
  2843			netif_carrier_on(tun->dev);
  2844	
  2845		/* Make sure persistent devices do not get stuck in
  2846		 * xoff state.
  2847		 */
  2848		if (netif_running(tun->dev))
  2849			netif_tx_wake_all_queues(tun->dev);
  2850	
  2851		strcpy(ifr->ifr_name, tun->dev->name);
  2852		return 0;
  2853	}
  2854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
