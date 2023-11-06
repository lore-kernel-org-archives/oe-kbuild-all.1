Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C73944D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 05:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzviCzpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699248525; x=1730784525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZDjRjOlZgqSq9Mlo4aSlrh67c4fpUkVj/JMUHdCBoE=;
  b=QzviCzpzv+P+oPiuoU5p3njoLuVsmMGnBEgTHPNpeRTncNBNduHPqpBk
   KldBFmBgSdzB0c+SaWQ8ur/Yb7IxV81YA3uSOtTCnJvNTGiJGrRKOafF6
   sNXzNCFyKxd0n4ve6lq5CAbdE9ErBRL88II/23NKCdfyP5lV5BJyAp/zs
   yLuWF5YPgMESYSr7SHjN3gjiV4fXO/0x9U4t9EJH6BVZfUOOvIi0hzkm6
   /JLeXLbbBnxyXeCn03xTVxgHFJw7Tv5DZrySEll5opzqezO8k9kla8bWF
   U+8tCcFNV9c5sDTsu1m7+Qk/BGxzc7Zr2M8/zNxZ1r8LHLGZEDXqGFYdN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369416014"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="369416014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738697125"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="738697125"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2023 21:28:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzsAC-00068i-2x;
	Mon, 06 Nov 2023 05:28:40 +0000
Date: Mon, 6 Nov 2023 13:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>
Subject: include/linux/netlink.h:116:6: warning: ' TXQs for network stack
 (total ' directive output truncated writing 31 bytes into a region of size
 between 0 and 14
Message-ID: <202311061336.4dsWMT1h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 800db2d125c2bc22c448e2386c3518e663d6db71 net: enetc: ensure we always have a minimum number of TXQs for stack
date:   9 months ago
config: x86_64-buildonly-randconfig-006-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061336.4dsWMT1h-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061336.4dsWMT1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061336.4dsWMT1h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/neighbour.h:6:0,
                    from include/linux/netdevice.h:46,
                    from drivers/net/ethernet/freescale/enetc/enetc.h:6,
                    from drivers/net/ethernet/freescale/enetc/enetc.c:4:
   drivers/net/ethernet/freescale/enetc/enetc.c: In function 'enetc_setup_bpf':
>> include/linux/netlink.h:116:6: warning: ' TXQs for network stack (total ' directive output truncated writing 31 bytes into a region of size between 0 and 14 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2713:3: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
      NL_SET_ERR_MSG_FMT_MOD(extack,
      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: directive argument in the range [0, 65535]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2713:3: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
      NL_SET_ERR_MSG_FMT_MOD(extack,
      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: 'snprintf' output between 110 and 134 bytes into a destination of size 80
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2713:3: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
      NL_SET_ERR_MSG_FMT_MOD(extack,
      ^~~~~~~~~~~~~~~~~~~~~~


vim +116 include/linux/netlink.h

2d4bc93368f5a0 Johannes Berg 2017-04-12  107  
51c352bdbcd23d Edward Cree   2022-10-18  108  /* We splice fmt with %s at each end even in the snprintf so that both calls
51c352bdbcd23d Edward Cree   2022-10-18  109   * can use the same string constant, avoiding its duplication in .ro
51c352bdbcd23d Edward Cree   2022-10-18  110   */
51c352bdbcd23d Edward Cree   2022-10-18  111  #define NL_SET_ERR_MSG_FMT(extack, fmt, args...) do {			       \
51c352bdbcd23d Edward Cree   2022-10-18  112  	struct netlink_ext_ack *__extack = (extack);			       \
51c352bdbcd23d Edward Cree   2022-10-18  113  									       \
51c352bdbcd23d Edward Cree   2022-10-18  114  	if (!__extack)							       \
51c352bdbcd23d Edward Cree   2022-10-18  115  		break;							       \
51c352bdbcd23d Edward Cree   2022-10-18 @116  	if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,	       \
51c352bdbcd23d Edward Cree   2022-10-18  117  		     "%s" fmt "%s", "", ##args, "") >=			       \
51c352bdbcd23d Edward Cree   2022-10-18  118  	    NETLINK_MAX_FMTMSG_LEN)					       \
51c352bdbcd23d Edward Cree   2022-10-18  119  		net_warn_ratelimited("%s" fmt "%s", "truncated extack: ",      \
51c352bdbcd23d Edward Cree   2022-10-18  120  				     ##args, "\n");			       \
51c352bdbcd23d Edward Cree   2022-10-18  121  									       \
51c352bdbcd23d Edward Cree   2022-10-18  122  	do_trace_netlink_extack(__extack->_msg_buf);			       \
51c352bdbcd23d Edward Cree   2022-10-18  123  									       \
51c352bdbcd23d Edward Cree   2022-10-18  124  	__extack->_msg = __extack->_msg_buf;				       \
51c352bdbcd23d Edward Cree   2022-10-18  125  } while (0)
51c352bdbcd23d Edward Cree   2022-10-18  126  

:::::: The code at line 116 was first introduced by commit
:::::: 51c352bdbcd23d7ce46b06c1e64c82754dc44044 netlink: add support for formatted extack messages

:::::: TO: Edward Cree <ecree.xilinx@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
