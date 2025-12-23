Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC52D1940A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475308; cv=none; b=YCXorWlr3sWYnQTwbc2b3pkLHwvaTqLvzUPrripm1PKtYd06Y0QxFz+dIYhp98mhoa04ourmhLzrKbXv1h7SdyM+c5qaXypct01SHY6Xy2d0i/dqyqM7lXItI8X+OfCb70EhbqDHdYg7rttCFEjlMGRWm91pR9AfhmW0rIv4ZOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475308; c=relaxed/simple;
	bh=pK8QJ+c/vs6IPr1wxKM3suYvCalo+lvyaYwJ+6+oLys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9B5FKmgNWSjqKr1cRI5c6XIGkLrUk2YPnJUrogfxeRv4xJ6D7aBt8Adxq8INnVGwY2baz92AHBi0t+Sa4IwEEAQxQL9DNrPAgqVUPFZ/ySXN9vlTAINn8pfbF1C1E9bhKM1dIENU/HQ2ElCH2j+23J2U17qcrleh9wHZFEmHH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaAb9tzF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaAb9tzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766475307; x=1798011307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pK8QJ+c/vs6IPr1wxKM3suYvCalo+lvyaYwJ+6+oLys=;
  b=LaAb9tzF46+vlK1+Lq1z7SWASLbw0z8CM/X1YXmwDf+LfjNhpZuEJRnu
   vTc50WQ5ER2WhiSNsSY9ojbZvCJ8yWXONkAYkxAfRCAGsD45FaMePtvC/
   y3B2Ti4npXq3d5AqxJoIYTE4Dh8y+fChVbo35VCxsfH2q0FAGl4k5+DK8
   NabmpdB0kvqBGKWWB6438/CANBcsFQsnB7VPMhH/+KkkpWY65idiNgsnq
   BAvslOF3swUAnAyNNVQVy95JhtovSiYSU/+2ks7aseUfJGvnbR5Z7a7F2
   SbRlbx9q95+AsYJsKYi3zL+Abw1SFOkFlP0kjbetBjM9YLOk87uM96iVC
   Q==;
X-CSE-ConnectionGUID: 3XE2ejHJQ+OR0QERNyKv8Q==
X-CSE-MsgGUID: asr9aEEiSSODMnmZsQtlMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68398407"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68398407"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:35:06 -0800
X-CSE-ConnectionGUID: rT7ivN+SSFqIykkvK2Eomg==
X-CSE-MsgGUID: FW/3UmDNQ0yMFGedeQIJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204242235"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 23:35:05 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXwv7-000000001ax-3bm8;
	Tue, 23 Dec 2025 07:35:01 +0000
Date: Tue, 23 Dec 2025 15:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jerry Wu <w.7erry@foxmail.com>, vladimir.oltean@nxp.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jerry Wu <w.7erry@foxmail.com>
Subject: Re: [PATCH] Prevent crash when adding interface under a lag
Message-ID: <202512231521.giSxyLFY-lkp@intel.com>
References: <tencent_9E2B81D645D04DFE191C86F128212F842B05@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_9E2B81D645D04DFE191C86F128212F842B05@qq.com>

Hi Jerry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerry-Wu/Prevent-crash-when-adding-interface-under-a-lag/20251221-013514
base:   linus/master
patch link:    https://lore.kernel.org/r/tencent_9E2B81D645D04DFE191C86F128212F842B05%40qq.com
patch subject: [PATCH] Prevent crash when adding interface under a lag
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251223/202512231521.giSxyLFY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231521.giSxyLFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231521.giSxyLFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/netdevice.h:24,
                    from include/linux/if_bridge.h:12,
                    from include/linux/dsa/ocelot.h:8,
                    from drivers/net/ethernet/mscc/ocelot.c:7:
   drivers/net/ethernet/mscc/ocelot.c: In function 'ocelot_set_aggr_pgids':
   include/linux/find.h:586:63: error: passing argument 3 of 'find_next_bit' makes integer from pointer without a cast [-Wint-conversion]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct ocelot_port *
   drivers/net/ethernet/mscc/ocelot.c:2322:17: note: in expansion of macro 'for_each_set_bit'
    2322 |                 for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
         |                 ^~~~~~~~~~~~~~~~
   include/linux/find.h:61:43: note: expected 'long unsigned int' but argument is of type 'struct ocelot_port *'
      61 |                             unsigned long offset)
         |                             ~~~~~~~~~~~~~~^~~~~~
   include/linux/find.h:586:31: error: assignment to 'struct ocelot_port *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                               ^
   drivers/net/ethernet/mscc/ocelot.c:2322:17: note: in expansion of macro 'for_each_set_bit'
    2322 |                 for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
         |                 ^~~~~~~~~~~~~~~~
>> include/linux/find.h:586:77: warning: comparison between pointer and integer
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                             ^
   drivers/net/ethernet/mscc/ocelot.c:2322:17: note: in expansion of macro 'for_each_set_bit'
    2322 |                 for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:2323:72: error: array subscript is not an integer
    2323 |                         struct ocelot_port *ocelot_port = ocelot->ports[port];
         |                                                                        ^
   In file included from include/soc/mscc/ocelot_vcap.h:9,
                    from drivers/net/ethernet/mscc/ocelot.c:13:
   include/soc/mscc/ocelot.h:923:55: error: invalid operands to binary * (have 'int' and 'struct ocelot_port *')
     923 |         __ocelot_write_ix(ocelot, val, reg, reg##_RSZ * (ri))
         |                                                       ^
   drivers/net/ethernet/mscc/ocelot.c:2329:25: note: in expansion of macro 'ocelot_write_rix'
    2329 |                         ocelot_write_rix(ocelot, bond_mask,
         |                         ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:2333:62: error: assignment to 'u8' {aka 'unsigned char'} from 'struct ocelot_port *' makes integer from pointer without a cast [-Wint-conversion]
    2333 |                                 aggr_idx[num_active_ports++] = port;
         |                                                              ^
   drivers/net/ethernet/mscc/ocelot.c:2352:27: error: assignment to 'struct ocelot_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2352 |                 for (port = lag; port < ocelot->num_phys_ports; port++) {
         |                           ^
>> drivers/net/ethernet/mscc/ocelot.c:2352:39: warning: comparison between pointer and integer
    2352 |                 for (port = lag; port < ocelot->num_phys_ports; port++) {
         |                                       ^
   drivers/net/ethernet/mscc/ocelot.c:2353:72: error: array subscript is not an integer
    2353 |                         struct ocelot_port *ocelot_port = ocelot->ports[port];
         |                                                                        ^
   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/parisc/include/asm/bug.h:97,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6:
   include/vdso/bits.h:7:40: error: invalid operands to binary << (have 'long unsigned int' and 'struct ocelot_port *')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/net/ethernet/mscc/ocelot.c:2359:44: note: in expansion of macro 'BIT'
    2359 |                                 visited |= BIT(port);
         |                                            ^~~


vim +2352 drivers/net/ethernet/mscc/ocelot.c

a556c76adc052c Alexandre Belloni 2018-05-14  2277  
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2278  static void ocelot_set_aggr_pgids(struct ocelot *ocelot)
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2279  {
528d3f190c98c8 Vladimir Oltean   2021-02-06  2280  	unsigned long visited = GENMASK(ocelot->num_phys_ports - 1, 0);
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2281  	int i, port, lag;
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2282  
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2283  	/* Reset destination and aggregation PGIDS */
96b029b004942e Vladimir Oltean   2020-06-21  2284  	for_each_unicast_dest_pgid(ocelot, port)
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2285  		ocelot_write_rix(ocelot, BIT(port), ANA_PGID_PGID, port);
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2286  
96b029b004942e Vladimir Oltean   2020-06-21  2287  	for_each_aggr_pgid(ocelot, i)
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2288  		ocelot_write_rix(ocelot, GENMASK(ocelot->num_phys_ports - 1, 0),
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2289  				 ANA_PGID_PGID, i);
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2290  
528d3f190c98c8 Vladimir Oltean   2021-02-06  2291  	/* The visited ports bitmask holds the list of ports offloading any
528d3f190c98c8 Vladimir Oltean   2021-02-06  2292  	 * bonding interface. Initially we mark all these ports as unvisited,
528d3f190c98c8 Vladimir Oltean   2021-02-06  2293  	 * then every time we visit a port in this bitmask, we know that it is
528d3f190c98c8 Vladimir Oltean   2021-02-06  2294  	 * the lowest numbered port, i.e. the one whose logical ID == physical
528d3f190c98c8 Vladimir Oltean   2021-02-06  2295  	 * port ID == LAG ID. So we mark as visited all further ports in the
528d3f190c98c8 Vladimir Oltean   2021-02-06  2296  	 * bitmask that are offloading the same bonding interface. This way,
528d3f190c98c8 Vladimir Oltean   2021-02-06  2297  	 * we set up the aggregation PGIDs only once per bonding interface.
528d3f190c98c8 Vladimir Oltean   2021-02-06  2298  	 */
528d3f190c98c8 Vladimir Oltean   2021-02-06  2299  	for (port = 0; port < ocelot->num_phys_ports; port++) {
528d3f190c98c8 Vladimir Oltean   2021-02-06  2300  		struct ocelot_port *ocelot_port = ocelot->ports[port];
528d3f190c98c8 Vladimir Oltean   2021-02-06  2301  
528d3f190c98c8 Vladimir Oltean   2021-02-06  2302  		if (!ocelot_port || !ocelot_port->bond)
528d3f190c98c8 Vladimir Oltean   2021-02-06  2303  			continue;
528d3f190c98c8 Vladimir Oltean   2021-02-06  2304  
528d3f190c98c8 Vladimir Oltean   2021-02-06  2305  		visited &= ~BIT(port);
528d3f190c98c8 Vladimir Oltean   2021-02-06  2306  	}
528d3f190c98c8 Vladimir Oltean   2021-02-06  2307  
528d3f190c98c8 Vladimir Oltean   2021-02-06  2308  	/* Now, set PGIDs for each active LAG */
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2309  	for (lag = 0; lag < ocelot->num_phys_ports; lag++) {
16bd8173225f07 Jerry Wu          2025-12-20  2310  		struct ocelot_port *port = ocelot->ports[lag];
23ca3b727ee6b4 Vladimir Oltean   2021-02-06  2311  		int num_active_ports = 0;
16bd8173225f07 Jerry Wu          2025-12-20  2312  		struct net_device *bond;
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2313  		unsigned long bond_mask;
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2314  		u8 aggr_idx[16];
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2315  
16bd8173225f07 Jerry Wu          2025-12-20  2316  		if (!port || !port->bond || (visited & BIT(lag)))
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2317  			continue;
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2318  
16bd8173225f07 Jerry Wu          2025-12-20  2319  		bond = port->bond;
a14e6b69f393d6 Vladimir Oltean   2022-01-07  2320  		bond_mask = ocelot_get_bond_mask(ocelot, bond);
528d3f190c98c8 Vladimir Oltean   2021-02-06  2321  
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2322  		for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
a14e6b69f393d6 Vladimir Oltean   2022-01-07  2323  			struct ocelot_port *ocelot_port = ocelot->ports[port];
a14e6b69f393d6 Vladimir Oltean   2022-01-07  2324  
16bd8173225f07 Jerry Wu          2025-12-20  2325  			if (!port)
16bd8173225f07 Jerry Wu          2025-12-20  2326  				continue;
16bd8173225f07 Jerry Wu          2025-12-20  2327  
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2328  			// Destination mask
dc96ee3730fc41 Alexandre Belloni 2018-06-26 @2329  			ocelot_write_rix(ocelot, bond_mask,
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2330  					 ANA_PGID_PGID, port);
a14e6b69f393d6 Vladimir Oltean   2022-01-07  2331  
a14e6b69f393d6 Vladimir Oltean   2022-01-07  2332  			if (ocelot_port->lag_tx_active)
23ca3b727ee6b4 Vladimir Oltean   2021-02-06  2333  				aggr_idx[num_active_ports++] = port;
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2334  		}
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2335  
96b029b004942e Vladimir Oltean   2020-06-21  2336  		for_each_aggr_pgid(ocelot, i) {
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2337  			u32 ac;
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2338  
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2339  			ac = ocelot_read_rix(ocelot, ANA_PGID_PGID, i);
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2340  			ac &= ~bond_mask;
23ca3b727ee6b4 Vladimir Oltean   2021-02-06  2341  			/* Don't do division by zero if there was no active
23ca3b727ee6b4 Vladimir Oltean   2021-02-06  2342  			 * port. Just make all aggregation codes zero.
23ca3b727ee6b4 Vladimir Oltean   2021-02-06  2343  			 */
23ca3b727ee6b4 Vladimir Oltean   2021-02-06  2344  			if (num_active_ports)
23ca3b727ee6b4 Vladimir Oltean   2021-02-06  2345  				ac |= BIT(aggr_idx[i % num_active_ports]);
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2346  			ocelot_write_rix(ocelot, ac, ANA_PGID_PGID, i);
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2347  		}
528d3f190c98c8 Vladimir Oltean   2021-02-06  2348  
528d3f190c98c8 Vladimir Oltean   2021-02-06  2349  		/* Mark all ports in the same LAG as visited to avoid applying
528d3f190c98c8 Vladimir Oltean   2021-02-06  2350  		 * the same config again.
528d3f190c98c8 Vladimir Oltean   2021-02-06  2351  		 */
528d3f190c98c8 Vladimir Oltean   2021-02-06 @2352  		for (port = lag; port < ocelot->num_phys_ports; port++) {
528d3f190c98c8 Vladimir Oltean   2021-02-06  2353  			struct ocelot_port *ocelot_port = ocelot->ports[port];
528d3f190c98c8 Vladimir Oltean   2021-02-06  2354  
528d3f190c98c8 Vladimir Oltean   2021-02-06  2355  			if (!ocelot_port)
528d3f190c98c8 Vladimir Oltean   2021-02-06  2356  				continue;
528d3f190c98c8 Vladimir Oltean   2021-02-06  2357  
528d3f190c98c8 Vladimir Oltean   2021-02-06  2358  			if (ocelot_port->bond == bond)
528d3f190c98c8 Vladimir Oltean   2021-02-06  2359  				visited |= BIT(port);
528d3f190c98c8 Vladimir Oltean   2021-02-06  2360  		}
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2361  	}
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2362  }
dc96ee3730fc41 Alexandre Belloni 2018-06-26  2363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
