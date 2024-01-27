Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2F01DFCA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706395750; cv=none; b=MV8Cmc9Bd1M+7mfHTyeu7SpI9MipEFcYRBuB+mMxgVuJ1ezTc3W8Se2pzlkIEHqUEx54PFC3NwsDZTRDi9jwXfUKIE9tOEPucGPkLs1xyrzNHYL54ETMerp4eHLUviLySQFJDgR1IKZH2HTAut5gx1jmEA66LgvNmJjV9r1YJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706395750; c=relaxed/simple;
	bh=lU1LsnoY/AjObB6vlgiL4qIFVyJDnA7AnrXnRq0imGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+4trgBQCOq4y+4bN3SjD2K1Bt1jbxZB3musFQU7eDflwll5V7GARhPOLSxZ4FtCIqVQ1uPHSvDZmBMZAn2oXq2ZPYBXffOUibHyEgKY3O3cQoew+PbNveS4PmyMzkTk+LYaYWWX6z+dcDAPEg59IYbOWsLEe1wyfh+RPzW7LtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOExa3Mo; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOExa3Mo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706395748; x=1737931748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lU1LsnoY/AjObB6vlgiL4qIFVyJDnA7AnrXnRq0imGQ=;
  b=mOExa3MorebOKg0OKh7YJ9AfVAnJdse5KMlc5rzq1diawA+5BKnL/VYD
   lOH+RBf2rVsA07Wv57eDesdQQLJm1ApXSjnq/4Eo/+NySlsPbZejTgC6x
   Xi5EFScYRia1g8rkxSFEJbn8QTRzGHtZlirZXhvAGLGVcHYhj8GtKRyjH
   g5ntOpT6RH0Ndp57vVZB6KPiW8LxJeDdYBuJS2NE16MxRKxB/BikJzV/B
   ZsIVCdZem3NqK4wDuzq7vkLD32SapzKO2MmPXdQsR4FrMDKmGX1M211pg
   NlfKkWRHXsACHGf1pb4pF8LwslOj06jxn6mwTiYqxFvPJYID88PF3JTs/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="393147532"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393147532"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 14:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29152736"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jan 2024 14:49:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTrTx-0002oo-33;
	Sat, 27 Jan 2024 22:49:01 +0000
Date: Sun, 28 Jan 2024 06:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>, Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v7 1/4] netdevsim: allow two netdevsim ports to
 be connected
Message-ID: <202401280644.lnmk82jI-lkp@intel.com>
References: <20240127040354.944744-2-dw@davidwei.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240127040354.944744-2-dw@davidwei.uk>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Wei/netdevsim-allow-two-netdevsim-ports-to-be-connected/20240127-121234
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240127040354.944744-2-dw%40davidwei.uk
patch subject: [PATCH net-next v7 1/4] netdevsim: allow two netdevsim ports to be connected
config: x86_64-randconfig-r122-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280644.lnmk82jI-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280644.lnmk82jI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280644.lnmk82jI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/netdevsim/bus.c:349:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct netdevsim *peer @@     got struct netdevsim [noderef] __rcu *peer @@
   drivers/net/netdevsim/bus.c:349:14: sparse:     expected struct netdevsim *peer
   drivers/net/netdevsim/bus.c:349:14: sparse:     got struct netdevsim [noderef] __rcu *peer

vim +349 drivers/net/netdevsim/bus.c

   311	
   312	static ssize_t unlink_device_store(const struct bus_type *bus, const char *buf, size_t count)
   313	{
   314		struct netdevsim *nsim, *peer;
   315		unsigned int netnsid, ifidx;
   316		struct net_device *dev;
   317		struct net *ns;
   318		int err;
   319	
   320		err = sscanf(buf, "%u:%u", &netnsid, &ifidx);
   321		if (err != 2) {
   322			pr_err("Format for unlinking a device is \"netnsid:ifidx\" (uint uint).\n");
   323			return -EINVAL;
   324		}
   325	
   326		err = -EINVAL;
   327		rtnl_lock();
   328		ns = get_net_ns_by_id(current->nsproxy->net_ns, netnsid);
   329		if (!ns) {
   330			pr_err("Could not find netns with id: %u\n", netnsid);
   331			goto out_unlock_rtnl;
   332		}
   333	
   334		dev = __dev_get_by_index(ns, ifidx);
   335		if (!dev) {
   336			pr_err("Could not find device with ifindex %u in netnsid %u\n", ifidx, netnsid);
   337			goto out_put_netns;
   338		}
   339	
   340		if (!netdev_is_nsim(dev)) {
   341			pr_err("Device with ifindex %u in netnsid %u is not a netdevsim\n", ifidx, netnsid);
   342			goto out_put_netns;
   343		}
   344	
   345		err = 0;
   346		nsim = netdev_priv(dev);
   347		if (!nsim->peer)
   348			goto out_put_netns;
 > 349		peer = nsim->peer;
   350	
   351		RCU_INIT_POINTER(nsim->peer, NULL);
   352		RCU_INIT_POINTER(peer->peer, NULL);
   353	
   354	out_put_netns:
   355		put_net(ns);
   356	out_unlock_rtnl:
   357		rtnl_unlock();
   358	
   359		return !err ? count : err;
   360	}
   361	static BUS_ATTR_WO(unlink_device);
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
