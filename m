Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C2D6FB8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044003; x=1726580003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yETM9NGorKgm2BAk1U/ScZc9/I8edOcF13fqnXkbVJo=;
  b=gf8M8DUHDWGOoIsC6qBtMnEEhxCwfNUUIC9TmAPDPd8zUNo8S1u5fK8X
   EtmDuKgIsqUWYmW1iajykgx7kUw3BgZAVH9JRj+8IG3lRQ0DFgFbDgOVb
   U+vFn1ZeR8nz6wqo1fMnqEZn8Z9zrlb72yrN6bGGdYQZC+znOyCoLvbbX
   uCAV8UYMS0wA54o8jgkOwrND4Rv+qGDix7Uvq4n/Ak9YdBR2mxG2NzA8h
   VkchVf1pIsI001pp8QX3hw3pCbhEYZLxlXnpRPrMmlZX6N8pIsoCSMLS2
   j/FO6Og4tqhw9QQv0DgDyBpWblru56TiH+1BYOP3no1GSuRERhx0hxWcH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443728660"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="443728660"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="1076592550"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="1076592550"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2023 06:33:21 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiENJ-00068G-2Q;
	Mon, 18 Sep 2023 13:33:18 +0000
Date: Mon, 18 Sep 2023 21:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] net: ethernet: ti: am65-cpsw: add mqprio qdisc
 offload in channel mode
Message-ID: <202309182129.HOXw54CA-lkp@intel.com>
References: <20230918075358.5878-1-rogerq@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918075358.5878-1-rogerq@kernel.org>

Hi Roger,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-Quadros/net-ethernet-ti-am65-cpsw-add-mqprio-qdisc-offload-in-channel-mode/20230918-155554
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20230918075358.5878-1-rogerq%40kernel.org
patch subject: [PATCH v2] net: ethernet: ti: am65-cpsw: add mqprio qdisc offload in channel mode
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230918/202309182129.HOXw54CA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309182129.HOXw54CA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309182129.HOXw54CA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/am65-cpsw-qos.c: In function 'am65_cpsw_tx_pn_shaper_apply':
>> drivers/net/ethernet/ti/am65-cpsw-qos.c:938:32: warning: variable 'qopt' set but not used [-Wunused-but-set-variable]
     938 |         struct tc_mqprio_qopt *qopt;
         |                                ^~~~
   In file included from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from include/net/sch_generic.h:5,
                    from include/net/pkt_cls.h:7,
                    from drivers/net/ethernet/ti/am65-cpsw-qos.c:11:
   drivers/net/ethernet/ti/am65-cpsw-qos.c: In function 'am65_cpsw_mqprio_verify_shaper':
>> include/linux/netlink.h:116:13: warning: 'ti_am65_cpsw_nuss: TX max ra...' directive output truncated writing 89 bytes into a region of size 80 [-Wformat-truncation=]
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1080:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
    1080 |                         NL_SET_ERR_MSG_FMT_MOD(extack,
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:13: note: 'snprintf' output between 92 and 99 bytes into a destination of size 80
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1080:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
    1080 |                         NL_SET_ERR_MSG_FMT_MOD(extack,
         |                         ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/netlink.h:116:13: warning: 'ti_am65_cpsw_nuss: TX min ra...' directive output truncated writing 89 bytes into a region of size 80 [-Wformat-truncation=]
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1073:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
    1073 |                         NL_SET_ERR_MSG_FMT_MOD(extack,
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:13: note: 'snprintf' output between 92 and 99 bytes into a destination of size 80
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/am65-cpsw-qos.c:1073:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
    1073 |                         NL_SET_ERR_MSG_FMT_MOD(extack,
         |                         ^~~~~~~~~~~~~~~~~~~~~~


vim +/qopt +938 drivers/net/ethernet/ti/am65-cpsw-qos.c

   931	
   932	static void am65_cpsw_tx_pn_shaper_apply(struct am65_cpsw_port *port)
   933	{
   934		struct am65_cpsw_mqprio *p_mqprio = &port->qos.mqprio;
   935		struct am65_cpsw_common *common = port->common;
   936		struct tc_mqprio_qopt_offload *mqprio;
   937		bool enable, shaper_susp = false;
 > 938		struct tc_mqprio_qopt *qopt;
   939		u32 rate_mbps;
   940		int tc, prio;
   941	
   942		mqprio = &p_mqprio->mqprio_hw;
   943		qopt = &mqprio->qopt;
   944		/* takes care of no link case as well */
   945		if (p_mqprio->max_rate_total > port->qos.link_speed)
   946			shaper_susp = true;
   947	
   948		am65_cpsw_tx_pn_shaper_reset(port);
   949	
   950		enable = p_mqprio->shaper_en && !shaper_susp;
   951		if (!enable)
   952			return;
   953	
   954		/* Rate limit is specified per Traffic Class but
   955		 * for CPSW, rate limit can be applied per priority
   956		 * at port FIFO.
   957		 *
   958		 * We have assigned the same priority (TCn) to all queues
   959		 * of a Traffic Class so they share the same shaper
   960		 * bandwidth.
   961		 */
   962		for (tc = 0; tc < mqprio->qopt.num_tc; tc++) {
   963			prio = tc;
   964	
   965			rate_mbps = mqprio->min_rate[tc] * 8 / 1000000;
   966			rate_mbps = am65_cpsw_qos_tx_rate_calc(rate_mbps,
   967							       common->bus_freq);
   968			writel(rate_mbps,
   969			       port->port_base + AM65_CPSW_PN_REG_PRI_CIR(prio));
   970	
   971			rate_mbps = 0;
   972	
   973			if (mqprio->max_rate[tc]) {
   974				rate_mbps = mqprio->max_rate[tc] - mqprio->min_rate[tc];
   975				rate_mbps = rate_mbps * 8 / 1000000;
   976				rate_mbps = am65_cpsw_qos_tx_rate_calc(rate_mbps,
   977								       common->bus_freq);
   978			}
   979	
   980			writel(rate_mbps,
   981			       port->port_base + AM65_CPSW_PN_REG_PRI_EIR(prio));
   982		}
   983	}
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
