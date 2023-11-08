Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05EB18E04
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRrHHCn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699448922; x=1730984922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJQnjAedbk5tPjWpE6NNNnAojqxt9sB/FI70TDeVx90=;
  b=MRrHHCn9yzQWIsrVb8wxBgj2r0SJvzRnXBWzKMzNtTp1GdQHz2PBfkNf
   pZS5IIVo9QLsZGYWSEjtiWi7oaB6Vuty4IoVf5pfi5CqL+koflU2Be2GM
   6eY1bcysHXsJdilbj9skzaQw+DkdfCVvQ7B3bI9DI3ti8qFTwCOE2KR3s
   IsRBMF3ve/SRyOjrrsai2OSiFeeRolPMxs1Km1ELQpkorDQ2UlT7Eh8t4
   WfCHylzOpEzfL8LhvV0knCep+0hd6d9I27rI8ZJLtyjUxp3I7Q+Bwmo6m
   OxWbeeIBcnV1FEBFf3tLpOyz/yZhlH3qZ4XlQmNBqQuBb8DP90t6z2qp8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="420865186"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="420865186"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 05:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712917934"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="712917934"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Nov 2023 05:08:14 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0iHz-0007wy-2u;
	Wed, 08 Nov 2023 13:08:11 +0000
Date: Wed, 8 Nov 2023 21:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [netdev-net:main 3/3] include/linux/netlink.h:116:13: warning: ' for
 stack (total ' directive output truncated writing 18 bytes into a region of
 size between 0 and 14
Message-ID: <202311082143.5EQPMhVU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
head:   f968c56417f00be4cb62eadeed042a1e3c80dc53
commit: f968c56417f00be4cb62eadeed042a1e3c80dc53 [3/3] net: enetc: shorten enetc_setup_xdp_prog() error message to fit NETLINK_MAX_FMTMSG_LEN
config: s390-randconfig-002-20231108 (https://download.01.org/0day-ci/archive/20231108/202311082143.5EQPMhVU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311082143.5EQPMhVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311082143.5EQPMhVU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/enetc/enetc.c: In function 'enetc_setup_irqs':
   drivers/net/ethernet/freescale/enetc/enetc.c:2306:60: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 4 and 19 [-Wformat-truncation=]
    2306 |                 snprintf(v->name, sizeof(v->name), "%s-rxtx%d",
         |                                                            ^~
   drivers/net/ethernet/freescale/enetc/enetc.c:2306:52: note: directive argument in the range [-2147483641, 2147483646]
    2306 |                 snprintf(v->name, sizeof(v->name), "%s-rxtx%d",
         |                                                    ^~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2306:17: note: 'snprintf' output between 7 and 32 bytes into a destination of size 24
    2306 |                 snprintf(v->name, sizeof(v->name), "%s-rxtx%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2307 |                          priv->ndev->name, i);
         |                          ~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from drivers/net/ethernet/freescale/enetc/enetc.h:6,
                    from drivers/net/ethernet/freescale/enetc/enetc.c:4:
   In function 'enetc_setup_xdp_prog',
       inlined from 'enetc_setup_bpf' at drivers/net/ethernet/freescale/enetc/enetc.c:2791:10:
>> include/linux/netlink.h:116:13: warning: ' for stack (total ' directive output truncated writing 18 bytes into a region of size between 0 and 14 [-Wformat-truncation=]
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2771:17: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
    2771 |                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:13: note: directive argument in the range [0, 65535]
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2771:17: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
    2771 |                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:13: note: 'snprintf' output between 87 and 111 bytes into a destination of size 80
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     131 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2771:17: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
    2771 |                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                 ^~~~~~~~~~~~~~~~~~~~~~


vim +116 include/linux/netlink.h

2d4bc93368f5a0d Johannes Berg 2017-04-12  107  
51c352bdbcd23d7 Edward Cree   2022-10-18  108  /* We splice fmt with %s at each end even in the snprintf so that both calls
51c352bdbcd23d7 Edward Cree   2022-10-18  109   * can use the same string constant, avoiding its duplication in .ro
51c352bdbcd23d7 Edward Cree   2022-10-18  110   */
51c352bdbcd23d7 Edward Cree   2022-10-18  111  #define NL_SET_ERR_MSG_FMT(extack, fmt, args...) do {			       \
51c352bdbcd23d7 Edward Cree   2022-10-18  112  	struct netlink_ext_ack *__extack = (extack);			       \
51c352bdbcd23d7 Edward Cree   2022-10-18  113  									       \
51c352bdbcd23d7 Edward Cree   2022-10-18  114  	if (!__extack)							       \
51c352bdbcd23d7 Edward Cree   2022-10-18  115  		break;							       \
51c352bdbcd23d7 Edward Cree   2022-10-18 @116  	if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,	       \
51c352bdbcd23d7 Edward Cree   2022-10-18  117  		     "%s" fmt "%s", "", ##args, "") >=			       \
51c352bdbcd23d7 Edward Cree   2022-10-18  118  	    NETLINK_MAX_FMTMSG_LEN)					       \
51c352bdbcd23d7 Edward Cree   2022-10-18  119  		net_warn_ratelimited("%s" fmt "%s", "truncated extack: ",      \
51c352bdbcd23d7 Edward Cree   2022-10-18  120  				     ##args, "\n");			       \
51c352bdbcd23d7 Edward Cree   2022-10-18  121  									       \
51c352bdbcd23d7 Edward Cree   2022-10-18  122  	do_trace_netlink_extack(__extack->_msg_buf);			       \
51c352bdbcd23d7 Edward Cree   2022-10-18  123  									       \
51c352bdbcd23d7 Edward Cree   2022-10-18  124  	__extack->_msg = __extack->_msg_buf;				       \
51c352bdbcd23d7 Edward Cree   2022-10-18  125  } while (0)
51c352bdbcd23d7 Edward Cree   2022-10-18  126  

:::::: The code at line 116 was first introduced by commit
:::::: 51c352bdbcd23d7ce46b06c1e64c82754dc44044 netlink: add support for formatted extack messages

:::::: TO: Edward Cree <ecree.xilinx@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
