Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAFDF72
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 21:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693950479; x=1725486479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0VysPjixuMPa7zlb/p8hJGQ90YC4qAm+a/KJMbXpyw0=;
  b=VL5PQ3c4QY2RkRkW3gatkgHdMWQi/95lB/mEQgWA3SjEWi9KDKHy7RUC
   C+zWrSzF8nFMo6i4BKepN7jwqRxPf5fn7ZisdYLd9VH+XepnAPQSYFAvQ
   dICJZQ45vVgziUsUgxYzICFbXWIn0re5ynIvbJoC1HuqLKbgOjtMZoWfQ
   i6QdOaM3cX3PqiR2mBUP38M2uHkWR8rMPKQZ5XnDbx4pHMtxkzI03Tvbs
   VpGRkau0RTa6BCzDa71a0cNG5Lm1iMNrgRr8tm/Pb5iD/orLloi+lhOwD
   8A6HLdYgtWsU6aVqvBIdsBCmomKL/6SvXp4+2Tde1vWCQ9Yfxf9Fwkh4K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380718153"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="380718153"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 14:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="717999587"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="717999587"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2023 14:47:57 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qddtY-00027J-2X;
	Tue, 05 Sep 2023 21:47:46 +0000
Date: Wed, 6 Sep 2023 05:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13888/13985] include/linux/netlink.h:116:6:
 warning: ') out of range, only support mangle action on ipv6.hop_limit'
 directive output truncated writing 60 bytes into a region of size between 46
 and 55
Message-ID: <202309060552.ukH1Mv8F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c50216cfa084d5eb67dc10e646a3283da1595bb6
commit: 6a5402d10e6e764e9341c7a57ee1e9cafb31a789 [13888/13985] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
config: x86_64-randconfig-014-20230906 (https://download.01.org/0day-ci/archive/20230906/202309060552.ukH1Mv8F-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060552.ukH1Mv8F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060552.ukH1Mv8F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/netlink.h:116:6: warning: ' conflicts with existing pseudo(MASK) entry for TOS mask ' directive output truncated writing 57 bytes into a region of size between 33 and 39 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:627:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: directive argument in the range [0, 2147483647]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:627:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: 'snprintf' output between 103 and 115 bytes into a destination of size 80
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:627:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: warning: ' conflicts with existing pseudo(MASK) entry for mask ' directive output truncated writing 53 bytes into a region of size between 24 and 33 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:634:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: directive argument in the range [0, 2147483647]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:634:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: 'snprintf' output between 102 and 120 bytes into a destination of size 80
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:634:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c: In function 'efx_tc_mangle':
   include/linux/netlink.h:116:6: warning: 'sfc: Unsupported: only support mangle ipv4.ttl when we have an exact match on ttl, mask used for match (' directive output truncated writing 104 bytes into a region of size 80 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1223:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: directive argument in the range [0, 254]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1223:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: 'snprintf' output between 107 and 110 bytes into a destination of size 80
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1223:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/netlink.h:116:6: warning: ') out of range, only support mangle action on ipv6.hop_limit' directive output truncated writing 60 bytes into a region of size between 46 and 55 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1271:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: 'snprintf' output between 86 and 95 bytes into a destination of size 80
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1271:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/netlink.h:116:6: warning: 'sfc: Unsupported: only support mangle ipv6.hop_limit when we have an exact match on ttl, mask used for match (' directive output truncated writing 110 bytes into a region of size 80 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1282:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: directive argument in the range [0, 254]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1282:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: 'snprintf' output between 113 and 116 bytes into a destination of size 80
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1282:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
