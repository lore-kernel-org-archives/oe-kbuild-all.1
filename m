Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17ED4437
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 02:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8uBHjbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700189156; x=1731725156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R/2TTujNWwu9UYcl83e+PQDpPswY5GrLLa94tCJDI9U=;
  b=M8uBHjbXGaVwBUmWXHYt1GLAKlLbDSp/8JL/u/VsVfNVLTZSz0qNkMpN
   HtAuFdHTDNpdux9FXle+xgDS8YKW+8d+ZjoqKQYWlBZfInjr1EwuvDNn6
   Pw8NrVNJUbhCzIwmSjL7NEwu2iqpeEntXYWyJG5GM4Q0HMpfyOONQj2Vb
   qBcO5u9/VmJTy8XQmOoUuHv94JJDgAt8WHA2AihmgfRmX04mbMsuiL5bO
   oDxw+095wk17DoFEGXmgA0KlRv/62jhXNpynw7Feo9jZGMdVaDOMSWyk/
   /8nppRx1JevZzKGoG/rJL/hDXzwQzCtiGN55RdCpRbgYFVpopVYyFgNkb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422322319"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="422322319"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 18:45:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1012799218"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="1012799218"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Nov 2023 18:45:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3oq7-0002Ix-22;
	Fri, 17 Nov 2023 02:45:06 +0000
Date: Fri, 17 Nov 2023 10:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Ertman <david.m.ertman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-net v2] ice: Fix VF Reset paths
 when interface in a failed over aggregate
Message-ID: <202311171035.lwDlhjHN-lkp@intel.com>
References: <20231116232842.1999143-1-david.m.ertman@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116232842.1999143-1-david.m.ertman@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc1 next-20231116]
[cannot apply to tnguy-net-queue/dev-queue tnguy-next-queue/dev-queue]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Ertman/ice-Fix-VF-Reset-paths-when-interface-in-a-failed-over-aggregate/20231117-072831
base:   linus/master
patch link:    https://lore.kernel.org/r/20231116232842.1999143-1-david.m.ertman%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-net v2] ice: Fix VF Reset paths when interface in a failed over aggregate
config: i386-randconfig-003-20231117 (https://download.01.org/0day-ci/archive/20231117/202311171035.lwDlhjHN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311171035.lwDlhjHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311171035.lwDlhjHN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_lag.c:577:6: warning: no previous prototype for 'ice_lag_build_netdev_list' [-Wmissing-prototypes]
     577 | void ice_lag_build_netdev_list(struct ice_lag *lag,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:602:6: warning: no previous prototype for 'ice_lag_destroy_netdev_list' [-Wmissing-prototypes]
     602 | void ice_lag_destroy_netdev_list(struct ice_lag *lag,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ice_lag_build_netdev_list +577 drivers/net/ethernet/intel/ice/ice_lag.c

   571	
   572	/**
   573	 * ice_lag_build_netdev_list - populate the lag struct's netdev list
   574	 * @lag: local lag struct
   575	 * @ndlist: pointer to netdev list to populate
   576	 */
 > 577	void ice_lag_build_netdev_list(struct ice_lag *lag,
   578				       struct ice_lag_netdev_list *ndlist)
   579	{
   580		struct ice_lag_netdev_list *nl;
   581		struct net_device *tmp_nd;
   582	
   583		INIT_LIST_HEAD(&ndlist->node);
   584		rcu_read_lock();
   585		for_each_netdev_in_bond_rcu(lag->upper_netdev, tmp_nd) {
   586			nl = kzalloc(sizeof(*nl), GFP_ATOMIC);
   587			if (!nl)
   588				break;
   589	
   590			nl->netdev = tmp_nd;
   591			list_add(&nl->node, &ndlist->node);
   592		}
   593		rcu_read_unlock();
   594		lag->netdev_head = &ndlist->node;
   595	}
   596	
   597	/**
   598	 * ice_lag_destroy_netdev_list - free lag struct's netdev list
   599	 * @lag: pointer to local lag struct
   600	 * @ndlist: pointer to lag struct netdev list
   601	 */
 > 602	void ice_lag_destroy_netdev_list(struct ice_lag *lag,
   603					 struct ice_lag_netdev_list *ndlist)
   604	{
   605		struct ice_lag_netdev_list *entry, *n;
   606	
   607		rcu_read_lock();
   608		list_for_each_entry_safe(entry, n, &ndlist->node, node) {
   609			list_del(&entry->node);
   610			kfree(entry);
   611		}
   612		rcu_read_unlock();
   613		lag->netdev_head = NULL;
   614	}
   615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
