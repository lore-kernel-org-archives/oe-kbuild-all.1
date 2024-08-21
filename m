Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0571D1300
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724272260; cv=none; b=SW0KJVLmqQxXXjZTjjCEuMNusHg+mJn1/y0DrMC20eeuHKPkNtsvc38woD59hDIQga+DnBP2B0hAkfSfqm3zaRW9cWYTEg1FpbWCd/yAeCh570sWXgNzwriH7lQJ5ujvciLnub0qh5MYf4l5QbVB9KHov5PxZYC/sZ/l5TXcYMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724272260; c=relaxed/simple;
	bh=W13f11ME67/B1ubbvk5tb7n3rPnKX/zoRCAyzHVug2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XviqmqFdUgoY8SmxKRduwlNqAQLSdKa7nnq0HsSURzyKb9lVK3bQ5VnMqPlInUqXAbSSRNpJ2wjkNJK7KEMeYpC1QStF+XvRoFXqG/3Kswvougq1V6ijs/uzsJAKLapTG5gMkNfjtCojDSMtVaahzMfEse9Di/Z7lUHeanE9kHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0el8XIp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0el8XIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724272259; x=1755808259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W13f11ME67/B1ubbvk5tb7n3rPnKX/zoRCAyzHVug2I=;
  b=A0el8XIpbeYLM81UwQDTAK5jPVQzzsdqLjTHzJxG6uIIfnmJlfToI/6y
   9ROb1rpWyKtjFFCwetCDZ48oGDC55+LrGjaLQ5Zz9Gwt9Es7Yltqs9r6p
   jR38XoePnr1ahFElCdhcAh/ccxXq9jpYjLq6NyJVYxSdnvI7eJ13VK/x9
   d4IdcvgLCgyTe/JoyL9kjTMg2BhdBd6GtnnFUysV4PcWGHJ+cUfSp28y5
   5+sdFOoumbRX0x3aRxoo+TkyOzy7bxR0JIzBvk6Jqir7mkUBzCz0HbThl
   J62vFx7/hvOTnyXaPbMVdhTI4relLZmsJ+w84HJLjoBhsnQzR102xc/YO
   A==;
X-CSE-ConnectionGUID: nytzYEVmSwWr4PKotPDdQA==
X-CSE-MsgGUID: bvxjl4EWQkiXXOhg/TH0sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33226207"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="33226207"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 13:30:59 -0700
X-CSE-ConnectionGUID: DU5FV68IRTeykDiEUgbapQ==
X-CSE-MsgGUID: cm0G1NL+Rf2NdNL0rbKj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="65901779"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Aug 2024 13:30:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgryo-000BuS-2X;
	Wed, 21 Aug 2024 20:30:54 +0000
Date: Thu, 22 Aug 2024 04:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Guralnik <michaelgur@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next 6/7] RDMA/nldev: Add support for RDMA monitoring
Message-ID: <202408220447.expL9XcO-lkp@intel.com>
References: <20240821051017.7730-7-michaelgur@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821051017.7730-7-michaelgur@nvidia.com>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Guralnik/RDMA-mlx5-Check-RoCE-LAG-status-before-getting-netdev/20240821-131236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20240821051017.7730-7-michaelgur%40nvidia.com
patch subject: [PATCH rdma-next 6/7] RDMA/nldev: Add support for RDMA monitoring
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240822/202408220447.expL9XcO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220447.expL9XcO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220447.expL9XcO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/core/device.c:45:
>> include/rdma/rdma_netlink.h:120:33: warning: 'struct ib_device' declared inside parameter list will not be visible outside of this definition or declaration
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                 ^~~~~~~~~
   drivers/infiniband/core/device.c: In function 'ib_device_notify_register':
>> drivers/infiniband/core/device.c:1360:36: error: passing argument 1 of 'rdma_nl_notify_event' from incompatible pointer type [-Wincompatible-pointer-types]
    1360 |         ret = rdma_nl_notify_event(device, 0, RDMA_REGISTER_EVENT);
         |                                    ^~~~~~
         |                                    |
         |                                    struct ib_device *
   include/rdma/rdma_netlink.h:120:44: note: expected 'struct ib_device *' but argument is of type 'struct ib_device *'
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                          ~~~~~~~~~~~~~~~~~~^~
   drivers/infiniband/core/device.c:1369:44: error: passing argument 1 of 'rdma_nl_notify_event' from incompatible pointer type [-Wincompatible-pointer-types]
    1369 |                 ret = rdma_nl_notify_event(device, port,
         |                                            ^~~~~~
         |                                            |
         |                                            struct ib_device *
   include/rdma/rdma_netlink.h:120:44: note: expected 'struct ib_device *' but argument is of type 'struct ib_device *'
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                          ~~~~~~~~~~~~~~~~~~^~
   drivers/infiniband/core/device.c: In function '__ib_unregister_device':
   drivers/infiniband/core/device.c:1520:30: error: passing argument 1 of 'rdma_nl_notify_event' from incompatible pointer type [-Wincompatible-pointer-types]
    1520 |         rdma_nl_notify_event(ib_dev, 0, RDMA_UNREGISTER_EVENT);
         |                              ^~~~~~
         |                              |
         |                              struct ib_device *
   include/rdma/rdma_netlink.h:120:44: note: expected 'struct ib_device *' but argument is of type 'struct ib_device *'
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                          ~~~~~~~~~~~~~~~~~~^~
   drivers/infiniband/core/device.c: In function 'ib_device_set_netdev':
   drivers/infiniband/core/device.c:2227:38: error: passing argument 1 of 'rdma_nl_notify_event' from incompatible pointer type [-Wincompatible-pointer-types]
    2227 |                 rdma_nl_notify_event(ib_dev, port, etype);
         |                                      ^~~~~~
         |                                      |
         |                                      struct ib_device *
   include/rdma/rdma_netlink.h:120:44: note: expected 'struct ib_device *' but argument is of type 'struct ib_device *'
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                          ~~~~~~~~~~~~~~~~~~^~
--
   In file included from drivers/infiniband/core/netlink.c:41:
>> include/rdma/rdma_netlink.h:120:33: warning: 'struct ib_device' declared inside parameter list will not be visible outside of this definition or declaration
     120 | int rdma_nl_notify_event(struct ib_device *ib, u32 port_num,
         |                                 ^~~~~~~~~


vim +/rdma_nl_notify_event +1360 drivers/infiniband/core/device.c

  1353	
  1354	static void ib_device_notify_register(struct ib_device *device)
  1355	{
  1356		struct net_device *netdev;
  1357		u32 port;
  1358		int ret;
  1359	
> 1360		ret = rdma_nl_notify_event(device, 0, RDMA_REGISTER_EVENT);
  1361		if (ret)
  1362			return;
  1363	
  1364		rdma_for_each_port(device, port) {
  1365			netdev = ib_device_get_netdev(device, port);
  1366			if (!netdev)
  1367				continue;
  1368	
  1369			ret = rdma_nl_notify_event(device, port,
  1370						   RDMA_NETDEV_ATTACH_EVENT);
  1371			dev_put(netdev);
  1372			if (ret)
  1373				return;
  1374		}
  1375		return;
  1376	}
  1377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
