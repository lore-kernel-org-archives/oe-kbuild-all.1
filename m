Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C6225788
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753654476; cv=none; b=hvDcMVdOLXo0vSRQ+cM0iO0Ao5vBeTyKpp0AIYU1k938CtzCmiMjtFSwuTZInKVjQdF3CxUex/HBM1DbEm8lbE6wqF8bP9/QC7agQ7hxF/3voYjS0LWteP2Tcq76wENCum7v4VkOk4jwOXgF5xkg3m067SX7y5V7xqXEMr/1nj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753654476; c=relaxed/simple;
	bh=DRFeWCYkK16WIJjq0z7TSoJRJlulkm0mS5UDyr+cQyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgT090H7fop+67Vdc+y7SsdhZAKwXKSLB/o8tPwqQ4ThvjQjlIplcNfqIjHgssWKaz6AhpxIkeqURAmWyA5+pIXj8g4Dpm55wm2370eFKDgnccZH9G802xJ7Y5X5h3lDG53aNYH3dgNuxmAXkfrAKd2Bme7bAWDTsmcSCvJCvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceq4OGpw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceq4OGpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753654475; x=1785190475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DRFeWCYkK16WIJjq0z7TSoJRJlulkm0mS5UDyr+cQyM=;
  b=ceq4OGpwyk5KZVBgO9oXVfVvnt+0sDVW57I/A8ZblgvGFYjX1IdIkcH2
   6TmR/TBqGYaQf+dn+fVUEx+Ee9FFyHYs0f5PRz5qUJ+f1x3yNE12S2l6W
   AamwF3mkju4lYRafDbDzbZZ5C1HMYx1HeZ26/HWkiGhHq7uELuxrCLNAB
   mvwMC8vKXbBcW5c272OtxYoCnYLft1OPdt77Ml7veZByqN8OrQUdO6bBg
   Ekc/bjfU1Ex+K+MMo9ezcLg034AspJlSG3xdX5OJYuXdbqLhebQAAh5x0
   MCEEnGIJgTcJwhvdqHgfVj/bdUC/5Re88nfazV81d96VdSx0BhWRU1Ba5
   g==;
X-CSE-ConnectionGUID: fhN/1wqdTaOpOYBWjB/LYw==
X-CSE-MsgGUID: HLYmVxryQd2SAFaA5H2aVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56051310"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56051310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 15:14:34 -0700
X-CSE-ConnectionGUID: QIXOHlJ0SiG0jx/4nb14ig==
X-CSE-MsgGUID: e/o//1vbQ7avM5mEDJYj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="185874775"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jul 2025 15:14:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug9dW-00003r-1G;
	Sun, 27 Jul 2025 22:14:30 +0000
Date: Mon, 28 Jul 2025 06:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ujwal Kundur <ujwal.kundur@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] net: team: switch to spinlock in team_change_rx_flags
Message-ID: <202507280629.YWlCmGhM-lkp@intel.com>
References: <20250727180921.360-1-ujwal.kundur@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727180921.360-1-ujwal.kundur@gmail.com>

Hi Ujwal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on linus/master v6.16-rc7]
[cannot apply to net-next/main horms-ipvs/master next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ujwal-Kundur/net-team-switch-to-spinlock-in-team_change_rx_flags/20250728-021215
base:   net/main
patch link:    https://lore.kernel.org/r/20250727180921.360-1-ujwal.kundur%40gmail.com
patch subject: [RFC PATCH] net: team: switch to spinlock in team_change_rx_flags
config: sparc-randconfig-002-20250728 (https://download.01.org/0day-ci/archive/20250728/202507280629.YWlCmGhM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280629.YWlCmGhM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280629.YWlCmGhM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/team/team_core.c: In function 'team_change_rx_flags':
>> drivers/net/team/team_core.c:1781:19: error: passing argument 1 of 'spin_lock' from incompatible pointer type [-Wincompatible-pointer-types]
    1781 |         spin_lock(&team->lock);
         |                   ^~~~~~~~~~~
         |                   |
         |                   struct mutex *
   In file included from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/uio.h:9,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from include/linux/ethtool.h:17,
                    from drivers/net/team/team_core.c:7:
   include/linux/spinlock.h:349:51: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'struct mutex *'
     349 | static __always_inline void spin_lock(spinlock_t *lock)
         |                                       ~~~~~~~~~~~~^~~~
>> drivers/net/team/team_core.c:1792:21: error: passing argument 1 of 'spin_unlock' from incompatible pointer type [-Wincompatible-pointer-types]
    1792 |         spin_unlock(&team->lock);
         |                     ^~~~~~~~~~~
         |                     |
         |                     struct mutex *
   include/linux/spinlock.h:389:53: note: expected 'spinlock_t *' {aka 'struct spinlock *'} but argument is of type 'struct mutex *'
     389 | static __always_inline void spin_unlock(spinlock_t *lock)
         |                                         ~~~~~~~~~~~~^~~~


vim +/spin_lock +1781 drivers/net/team/team_core.c

  1774	
  1775	static void team_change_rx_flags(struct net_device *dev, int change)
  1776	{
  1777		struct team *team = netdev_priv(dev);
  1778		struct team_port *port;
  1779		int inc;
  1780	
> 1781		spin_lock(&team->lock);
  1782		list_for_each_entry(port, &team->port_list, list) {
  1783			if (change & IFF_PROMISC) {
  1784				inc = dev->flags & IFF_PROMISC ? 1 : -1;
  1785				dev_set_promiscuity(port->dev, inc);
  1786			}
  1787			if (change & IFF_ALLMULTI) {
  1788				inc = dev->flags & IFF_ALLMULTI ? 1 : -1;
  1789				dev_set_allmulti(port->dev, inc);
  1790			}
  1791		}
> 1792		spin_unlock(&team->lock);
  1793	}
  1794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
