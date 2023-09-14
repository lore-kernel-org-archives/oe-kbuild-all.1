Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A487F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 03:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694662435; x=1726198435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ENeSpnPoDobOF60EaIQbSDjNj7DXloOj57SxRWlGm8=;
  b=U9m7w0QsENugevWjVe89y1E0a3fPgJp/26dkk/PRnP1cBRYwkLTl9N4E
   O+bDzj2I7aTVhSjqGzrpyJ/IqMJHxtrZvmztSPgMZ9/aJe0sP9gLWq9Ej
   yEn6VTLNFRw+BoDspIJ5qG1gE0uGX6A3fLvy6V99ZXWI0bvPZ+YqHTdWX
   3QbgwJN3aRWshBzhjM9bvcKGEIE9/3N83B4+s6LFZFBfKrvOs/y0dMU+P
   mD8I7knblFROvfyhTeIMr81/NO/H/DTQ6YFFrEAkiabhjnI2k/2Agc/Mz
   t9nhx0seF+0dObUeW70Uxmz3A5bCSYmKnlcMi73jcnLUzR/BrXQNxY+qG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="359104467"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="359104467"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887616707"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887616707"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 20:33:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgd71-00016O-2W;
	Thu, 14 Sep 2023 03:33:51 +0000
Date: Thu, 14 Sep 2023 11:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 31/39] net/bridge/br_device.c:475:36:
 error: 'br_mdb_get' undeclared here (not in a function); did you mean
 'br_fdb_get'?
Message-ID: <202309141125.q4qUpMVj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   276da7943f9c1e44e4df24af66c36a9212fd9d44
commit: 3918d93e9aaa1d78e496dc6ad9fd863e23ade118 [31/39] bridge: mcast: Add MDB get support
config: arm-randconfig-002-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141125.q4qUpMVj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141125.q4qUpMVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141125.q4qUpMVj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bridge/br_device.c:475:36: error: 'br_mdb_get' undeclared here (not in a function); did you mean 'br_fdb_get'?
     475 |         .ndo_mdb_get             = br_mdb_get,
         |                                    ^~~~~~~~~~
         |                                    br_fdb_get


vim +475 net/bridge/br_device.c

   446	
   447	static const struct net_device_ops br_netdev_ops = {
   448		.ndo_open		 = br_dev_open,
   449		.ndo_stop		 = br_dev_stop,
   450		.ndo_init		 = br_dev_init,
   451		.ndo_uninit		 = br_dev_uninit,
   452		.ndo_start_xmit		 = br_dev_xmit,
   453		.ndo_get_stats64	 = dev_get_tstats64,
   454		.ndo_set_mac_address	 = br_set_mac_address,
   455		.ndo_set_rx_mode	 = br_dev_set_multicast_list,
   456		.ndo_change_rx_flags	 = br_dev_change_rx_flags,
   457		.ndo_change_mtu		 = br_change_mtu,
   458		.ndo_siocdevprivate	 = br_dev_siocdevprivate,
   459	#ifdef CONFIG_NET_POLL_CONTROLLER
   460		.ndo_netpoll_setup	 = br_netpoll_setup,
   461		.ndo_netpoll_cleanup	 = br_netpoll_cleanup,
   462		.ndo_poll_controller	 = br_poll_controller,
   463	#endif
   464		.ndo_add_slave		 = br_add_slave,
   465		.ndo_del_slave		 = br_del_slave,
   466		.ndo_fix_features        = br_fix_features,
   467		.ndo_fdb_add		 = br_fdb_add,
   468		.ndo_fdb_del		 = br_fdb_delete,
   469		.ndo_fdb_del_bulk	 = br_fdb_delete_bulk,
   470		.ndo_fdb_dump		 = br_fdb_dump,
   471		.ndo_fdb_get		 = br_fdb_get,
   472		.ndo_mdb_add		 = br_mdb_add,
   473		.ndo_mdb_del		 = br_mdb_del,
   474		.ndo_mdb_dump		 = br_mdb_dump,
 > 475		.ndo_mdb_get		 = br_mdb_get,
   476		.ndo_bridge_getlink	 = br_getlink,
   477		.ndo_bridge_setlink	 = br_setlink,
   478		.ndo_bridge_dellink	 = br_dellink,
   479		.ndo_features_check	 = passthru_features_check,
   480		.ndo_fill_forward_path	 = br_fill_forward_path,
   481	};
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
