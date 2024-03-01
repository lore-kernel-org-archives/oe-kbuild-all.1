Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154FD39FF2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709318338; cv=none; b=MIBZ97X3tEcwTBKSGbC5waf3AsKx63AxdzOeJQHfCgKv6H8ErW4RGVj2Bc0CTXwjO20WBZaUVRELNXa2VLQ9lmaLUe7CfQK3HmfUAI8lSkNcIaWGz/qfnhhz8vq/gGiN0A/oQ0ubLvVXWev1oC9c0Oc6k9fnG2rF1FDgCAgkJgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709318338; c=relaxed/simple;
	bh=jRwGA/rv+7veOU4KYQwBsBLeYPZVRE2xRNTq6IvprOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gBmQNht2aeLNyb9xzXtDDW94y+F3pO6KpI8tQF+llrRlX0eaBL18IV9EA1MIeUoxy+E+jQRO8ztGehIFbv+07vgjS2P4NhY93xInEj4TrAcF9/ovocOJGkvWSDDrTr1mlkU62udbBPPGMP0Lg3VR8o6gf4RzIIiaSffhI9QIF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfDlsBpe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfDlsBpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709318336; x=1740854336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRwGA/rv+7veOU4KYQwBsBLeYPZVRE2xRNTq6IvprOc=;
  b=LfDlsBpeg16gP558wS+qjhXGW+gbLOkqF5oZu2diLekdotKXdnUudxF/
   8OO8osblcnV/T84QXXHh/J30Y3PgPKTAofs9G+Iw+r//KgMhSeclZoNB4
   ec1yPBhMf00AEDvPiGIt+5zVgBm6Rhh8bM2NCl6Fzj4Hl9SxJ/O729qc7
   gw0QHIVa7VMmU7sVx8+W1g31j3Hk7gYz57NsO8KQjkJbyGGZEv0uFWieG
   uWiWvoDxUEOpCVjFGNRpUhVIrUREYTFxOt54465aAdHtl6UTorxc1l+sB
   xjbpBg+Qm4scsCePzUHTMQnewIG8TNpVP5ropCvzkKpByuT5a4PDlWmu7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4038633"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="4038633"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 10:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8711292"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2024 10:38:54 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg7mV-000E2F-0H;
	Fri, 01 Mar 2024 18:38:51 +0000
Date: Sat, 2 Mar 2024 02:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 203/339]
 drivers/net/ethernet/ti/am65-cpsw-qos.c:79:15: error: use of undeclared
 identifier 'BYTES_PER_MBIT'
Message-ID: <202403020243.dFDidzsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   142648780df65f4985e75c962ada0f0e06dac85a
commit: f6a4257c2c593fb01628e8075061d436f3df1398 [203/339] net: ethernet: ti: am65-cpsw: add mqprio qdisc offload in channel mode
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240302/202403020243.dFDidzsP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020243.dFDidzsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020243.dFDidzsP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/am65-cpsw-qos.c:13:
   In file included from include/net/pkt_cls.h:7:
   In file included from include/net/sch_generic.h:5:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:79:15: error: use of undeclared identifier 'BYTES_PER_MBIT'
      79 |                 rate_mbps = TO_MBPS(mqprio->min_rate[tc]);
         |                             ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:79:15: error: use of undeclared identifier 'BYTES_PER_MBIT'
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:89:16: error: use of undeclared identifier 'BYTES_PER_MBIT'
      89 |                         rate_mbps = TO_MBPS(rate_mbps);
         |                                     ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:89:16: error: use of undeclared identifier 'BYTES_PER_MBIT'
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:173:19: error: use of undeclared identifier 'BYTES_PER_MBIT'
     173 |         min_rate_total = TO_MBPS(min_rate_total);
         |                          ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:173:19: error: use of undeclared identifier 'BYTES_PER_MBIT'
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:174:19: error: use of undeclared identifier 'BYTES_PER_MBIT'
     174 |         max_rate_total = TO_MBPS(max_rate_total);
         |                          ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:174:19: error: use of undeclared identifier 'BYTES_PER_MBIT'
   drivers/net/ethernet/ti/am65-cpsw-qos.c:20:38: note: expanded from macro 'TO_MBPS'
      20 | #define TO_MBPS(x)      DIV_ROUND_UP((x), BYTES_PER_MBIT)
         |                                           ^
   5 warnings and 8 errors generated.


vim +/BYTES_PER_MBIT +79 drivers/net/ethernet/ti/am65-cpsw-qos.c

    47	
    48	static void am65_cpsw_tx_pn_shaper_apply(struct am65_cpsw_port *port)
    49	{
    50		struct am65_cpsw_mqprio *p_mqprio = &port->qos.mqprio;
    51		struct am65_cpsw_common *common = port->common;
    52		struct tc_mqprio_qopt_offload *mqprio;
    53		bool enable, shaper_susp = false;
    54		u32 rate_mbps;
    55		int tc, prio;
    56	
    57		mqprio = &p_mqprio->mqprio_hw;
    58		/* takes care of no link case as well */
    59		if (p_mqprio->max_rate_total > port->qos.link_speed)
    60			shaper_susp = true;
    61	
    62		am65_cpsw_tx_pn_shaper_reset(port);
    63	
    64		enable = p_mqprio->shaper_en && !shaper_susp;
    65		if (!enable)
    66			return;
    67	
    68		/* Rate limit is specified per Traffic Class but
    69		 * for CPSW, rate limit can be applied per priority
    70		 * at port FIFO.
    71		 *
    72		 * We have assigned the same priority (TCn) to all queues
    73		 * of a Traffic Class so they share the same shaper
    74		 * bandwidth.
    75		 */
    76		for (tc = 0; tc < mqprio->qopt.num_tc; tc++) {
    77			prio = tc;
    78	
  > 79			rate_mbps = TO_MBPS(mqprio->min_rate[tc]);
    80			rate_mbps = am65_cpsw_qos_tx_rate_calc(rate_mbps,
    81							       common->bus_freq);
    82			writel(rate_mbps,
    83			       port->port_base + AM65_CPSW_PN_REG_PRI_CIR(prio));
    84	
    85			rate_mbps = 0;
    86	
    87			if (mqprio->max_rate[tc]) {
    88				rate_mbps = mqprio->max_rate[tc] - mqprio->min_rate[tc];
    89				rate_mbps = TO_MBPS(rate_mbps);
    90				rate_mbps = am65_cpsw_qos_tx_rate_calc(rate_mbps,
    91								       common->bus_freq);
    92			}
    93	
    94			writel(rate_mbps,
    95			       port->port_base + AM65_CPSW_PN_REG_PRI_EIR(prio));
    96		}
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
