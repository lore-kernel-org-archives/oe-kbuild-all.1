Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB58B1BDC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buIAlSsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808376; x=1729344376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++ZVFcSAip2AZQaoqn4SR+SPZnQzBmuSbPUhK0GwyHQ=;
  b=buIAlSszdZ6olCi6MchiZygZkdD7dGk8JQDBqlNAd97W1ENT2bHVmLyq
   saXgWH9yhxkLhFTxWRsJSJkVhifw5vv+uTfNRT9oTRdLtbkpgYBmC4mU2
   77M6sRwpOfedp7KtDrrO9pJLaod4VzKcuTV3ynxGQfaZixNvInuo031lv
   PHf5ToihJFbdUD6WYNk1+O/NqeuaOJVcYwnRCg0Fw6Lzhn8VOjkQZAgwP
   Rj+0A8M85ndvg4Pwt2CgT68p/K7nYSZEsMBX4DiEKips+j6v1YEZWivAb
   +hYZBfsWsp+JNsjzfXejMkX7kDk8qkOZkf/QMfCpQa5xqxmHBgf/LZZTn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417625965"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417625965"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:26:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5389329"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 06:26:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtpVw-0003Yw-2s;
	Fri, 20 Oct 2023 13:26:08 +0000
Date: Fri, 20 Oct 2023 21:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Edward Cree <ecree.xilinx@gmail.com>
Subject: include/linux/netlink.h:116:6: warning: ') out of range, only
 support mangle action on ipv6.hop_limit' directive output truncated writing
 60 bytes into a region of size between 46 and 55
Message-ID: <202310202136.4u7bv0hp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pieter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce55c22ec8b223a90ff3e084d842f73cfba35588
commit: 9dbc8d2b9a02f938d32741297d56cc364dc0dce6 sfc: add decrement ipv6 hop limit by offloading set hop limit actions
date:   8 weeks ago
config: x86_64-randconfig-016-20231007 (https://download.01.org/0day-ci/archive/20231020/202310202136.4u7bv0hp-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202136.4u7bv0hp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202136.4u7bv0hp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/neighbour.h:6:0,
                    from include/linux/netdevice.h:45,
                    from include/net/sch_generic.h:5,
                    from include/net/pkt_cls.h:7,
                    from drivers/net/ethernet/sfc/tc.c:12:
   drivers/net/ethernet/sfc/tc.c: In function 'efx_tc_mangle.isra.17':
   include/linux/netlink.h:116:6: warning: 'sfc: Unsupported: only support mangle ipv4.ttl when we have an exact match on ttl, mask used for match (' directive output truncated writing 104 bytes into a region of size 80 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:1157:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/sfc/tc.c:1157:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/sfc/tc.c:1157:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/sfc/tc.c:1205:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/sfc/tc.c:1205:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/sfc/tc.c:1216:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/sfc/tc.c:1216:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/sfc/tc.c:1216:5: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
        NL_SET_ERR_MSG_FMT_MOD(extack,
        ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c: In function 'efx_tc_flower_record_encap_match':
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
