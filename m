Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E94502F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723379287; cv=none; b=XoN2AE3Kf+1ZIRVakdr8ZNKu2H5Tya8onm6gw/7CqFDj+uiM94eVMllHi90hKVdwPnvmITMH9LTiP+bqj++R8QLQ8xwGueywfkkQWaXd72y7UDDifqd0oqs2gDtpLVWrG+2kUwnnB/br9c94gWKGJDGtnnsQ+o789U/tqeqritw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723379287; c=relaxed/simple;
	bh=+tsCjFNOjYVnNoAby6N5TiYfS4JA0LcE2voaZpFd9ik=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asXWMc4yCHwt2uEEaRlF6xRds7QrsmFfKtOHoLzqy/3L53ClSjv44Vh1Pzmafr8aKE5Oto4wFN9dgN4KzyfyMBR90aD6vp4IERLhUfWENyccyKgk5uAbfdbPRO5YOqekmxGh5LQDL1Eoa+78qq0fRWfzSyDgX2fuPRn7HQBeEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6OECPhs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6OECPhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723379286; x=1754915286;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+tsCjFNOjYVnNoAby6N5TiYfS4JA0LcE2voaZpFd9ik=;
  b=i6OECPhsHJu1qbdNu7czhQEJQY75ajyE91Pg3K9IsNP9nebem/sazZEC
   6eHUNWbIbjXFXSeqDWsTZNkgFJOQogg6GIf2SOVApfQYcNc0ORMwPa0Yb
   8zpvu5PODUiYWEJv34YYbDWrOV+KFeEhN1XQFOvLflpFZ9P45D7I/WZFx
   aPtvyVozZ0vDkEA+65pm7lhGRomGi2mtcQsBLyiLUiTzHKziIcsBZUQxF
   m9cRO4M1appuX09r9yvnJB60b7eabq6zni6Uv5mqi6SSnkZERic/KYCkw
   QqsUxx/kpkpT9sBr0SSeta9DwWd8vCUdeQfiVSiCMxF/wASuNG5LXkOmW
   g==;
X-CSE-ConnectionGUID: qZZPZoZETw6AZvjDb2hWgw==
X-CSE-MsgGUID: ZtFlbOA+RSafzF+4KlmjvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="46899075"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="46899075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 05:28:05 -0700
X-CSE-ConnectionGUID: uSF16fZETY2IMWAMGjMn4w==
X-CSE-MsgGUID: QbHeF1SWSgSBEN9Uiyv/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="81237432"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Aug 2024 05:28:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd7g1-000ApF-2p;
	Sun, 11 Aug 2024 12:28:01 +0000
Date: Sun, 11 Aug 2024 20:27:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.6.y-cicd 190/1221]
 drivers/net/ethernet/ti/am65-cpsw-qos.c:79:2: error: expected identifier or
 '('
Message-ID: <202408112038.dJoTNvJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-6.6.y-cicd
head:   2541807a1ef54deb9241788913a930d9558d38fd
commit: ea4e243ed74442617a6d44268756fda7cfa4d5c5 [190/1221] BACKPORT: net: ethernet: ti: am65-cpsw-qos: Add Frame Preemption MAC Merge support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240811/202408112038.dJoTNvJj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408112038.dJoTNvJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408112038.dJoTNvJj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/am65-cpsw-qos.c:12:
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
   In file included from include/linux/mm.h:2224:
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
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:79:2: error: expected identifier or '('
      79 |         for (prio = 0; prio < AM65_CPSW_PN_FIFO_PRIO_NUM; prio++) {
         |         ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:83:1: error: extraneous closing brace ('}')
      83 | }
         | ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:99:2: error: call to undeclared function 'am65_cpsw_tx_pn_shaper_reset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      99 |         am65_cpsw_tx_pn_shaper_reset(port);
         |         ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:99:2: note: did you mean 'am65_cpsw_tx_pn_shaper_apply'?
   drivers/net/ethernet/ti/am65-cpsw-qos.c:85:13: note: 'am65_cpsw_tx_pn_shaper_apply' declared here
      85 | static void am65_cpsw_tx_pn_shaper_apply(struct am65_cpsw_port *port)
         |             ^
      86 | {
      87 |         struct am65_cpsw_mqprio *p_mqprio = &port->qos.mqprio;
      88 |         struct am65_cpsw_common *common = port->common;
      89 |         struct tc_mqprio_qopt_offload *mqprio;
      90 |         bool enable, shaper_susp = false;
      91 |         u32 rate_mbps;
      92 |         int tc, prio;
      93 | 
      94 |         mqprio = &p_mqprio->mqprio_hw;
      95 |         /* takes care of no link case as well */
      96 |         if (p_mqprio->max_rate_total > port->qos.link_speed)
      97 |                 shaper_susp = true;
      98 | 
      99 |         am65_cpsw_tx_pn_shaper_reset(port);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         am65_cpsw_tx_pn_shaper_apply
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:116:15: error: call to undeclared function 'TO_MBPS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     116 |                 rate_mbps = TO_MBPS(mqprio->min_rate[tc]);
         |                             ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:210:19: error: call to undeclared function 'TO_MBPS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |         min_rate_total = TO_MBPS(min_rate_total);
         |                          ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:227:2: error: call to undeclared function 'am65_cpsw_tx_pn_shaper_reset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     227 |         am65_cpsw_tx_pn_shaper_reset(port);
         |         ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:313:14: error: use of undeclared identifier 'HZ_PER_MHZ'
     313 |         val = 125 * HZ_PER_MHZ; /* assuming 125MHz wireside clock */
         |                     ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:315:9: error: use of undeclared identifier 'MILLIHZ_PER_HZ'
     315 |         val /= MILLIHZ_PER_HZ;          /* count per ms timeout */
         |                ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:1287:13: error: redefinition of 'am65_cpsw_tx_pn_shaper_apply'
    1287 | static void am65_cpsw_tx_pn_shaper_apply(struct am65_cpsw_port *port)
         |             ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:85:13: note: previous definition is here
      85 | static void am65_cpsw_tx_pn_shaper_apply(struct am65_cpsw_port *port)
         |             ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1376:49: error: expression is not assignable
    1376 | +                               p_mqprio->tc0_q = mqprio->qopt.offset[i];
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1377:45: error: expression is not assignable
    1377 | +                               rx_prio_map &= ~(0x7 << (4 * p_mqprio->tc0_q));
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1353:6: warning: no previous prototype for function 'am65_cpsw_qos_mqprio_init' [-Wmissing-prototypes]
    1353 | void am65_cpsw_qos_mqprio_init(struct am65_cpsw_port *port)
         |      ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1353:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1353 | void am65_cpsw_qos_mqprio_init(struct am65_cpsw_port *port)
         | ^
         | static 
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:1414:12: error: conflicting types for 'am65_cpsw_mqprio_verify_shaper'
    1414 | static int am65_cpsw_mqprio_verify_shaper(struct am65_cpsw_port *port,
         |            ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:136:12: note: previous definition is here
     136 | static int am65_cpsw_mqprio_verify_shaper(struct am65_cpsw_port *port,
         |            ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:1510:12: error: redefinition of 'am65_cpsw_setup_mqprio'
    1510 | static int am65_cpsw_setup_mqprio(struct net_device *ndev, void *type_data)
         |            ^
   drivers/net/ethernet/ti/am65-cpsw-qos.c:236:12: note: previous definition is here
     236 | static int am65_cpsw_setup_mqprio(struct net_device *ndev, void *type_data)
         |            ^
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:1540:59: error: too many arguments to function call, expected 2, have 3
    1540 |        ret = am65_cpsw_mqprio_verify_shaper(port, mqprio, &max_rate);
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~               ^~~~~~~~~
   drivers/net/ethernet/ti/am65-cpsw-qos.c:136:12: note: 'am65_cpsw_mqprio_verify_shaper' declared here
     136 | static int am65_cpsw_mqprio_verify_shaper(struct am65_cpsw_port *port,
         |            ^                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     137 |                                           struct tc_mqprio_qopt_offload *mqprio)
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 14 errors generated.


vim +79 drivers/net/ethernet/ti/am65-cpsw-qos.c

    78	
  > 79		for (prio = 0; prio < AM65_CPSW_PN_FIFO_PRIO_NUM; prio++) {
    80			writel(0, port->port_base + AM65_CPSW_PN_REG_PRI_CIR(prio));
    81			writel(0, port->port_base + AM65_CPSW_PN_REG_PRI_EIR(prio));
    82		}
  > 83	}
    84	
    85	static void am65_cpsw_tx_pn_shaper_apply(struct am65_cpsw_port *port)
    86	{
    87		struct am65_cpsw_mqprio *p_mqprio = &port->qos.mqprio;
    88		struct am65_cpsw_common *common = port->common;
    89		struct tc_mqprio_qopt_offload *mqprio;
    90		bool enable, shaper_susp = false;
    91		u32 rate_mbps;
    92		int tc, prio;
    93	
    94		mqprio = &p_mqprio->mqprio_hw;
    95		/* takes care of no link case as well */
    96		if (p_mqprio->max_rate_total > port->qos.link_speed)
    97			shaper_susp = true;
    98	
  > 99		am65_cpsw_tx_pn_shaper_reset(port);
   100	
   101		enable = p_mqprio->shaper_en && !shaper_susp;
   102		if (!enable)
   103			return;
   104	
   105		/* Rate limit is specified per Traffic Class but
   106		 * for CPSW, rate limit can be applied per priority
   107		 * at port FIFO.
   108		 *
   109		 * We have assigned the same priority (TCn) to all queues
   110		 * of a Traffic Class so they share the same shaper
   111		 * bandwidth.
   112		 */
   113		for (tc = 0; tc < mqprio->qopt.num_tc; tc++) {
   114			prio = tc;
   115	
 > 116			rate_mbps = TO_MBPS(mqprio->min_rate[tc]);
   117			rate_mbps = am65_cpsw_qos_tx_rate_calc(rate_mbps,
   118							       common->bus_freq);
   119			writel(rate_mbps,
   120			       port->port_base + AM65_CPSW_PN_REG_PRI_CIR(prio));
   121	
   122			rate_mbps = 0;
   123	
   124			if (mqprio->max_rate[tc]) {
   125				rate_mbps = mqprio->max_rate[tc] - mqprio->min_rate[tc];
   126				rate_mbps = TO_MBPS(rate_mbps);
   127				rate_mbps = am65_cpsw_qos_tx_rate_calc(rate_mbps,
   128								       common->bus_freq);
   129			}
   130	
   131			writel(rate_mbps,
   132			       port->port_base + AM65_CPSW_PN_REG_PRI_EIR(prio));
   133		}
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
