Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC793D9F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 05:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJ+qO+WG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697692133; x=1729228133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vxobYSxO4RPb9d2jOsneaoppTdOcEHWRn5eVOBKfBYI=;
  b=JJ+qO+WGVsYqdzG+SxKQ599yMu3GtudeoyDED2g4JY309vq3TBHQicJh
   bxYzrBxk+U2T+kLmOMd5Cc3mXLyVNlhwXwvnwLZGEeRVTOz8UjPG8pugZ
   IWbAZfYiPpF+eI5ccI9uTdwmFM1jzV4gvmwwhZPxidQrwWexWqJn2Yzj5
   PKNpl5pGvRr+GO28D3PswGDuerBdPMtXjQTXEB+hq0gak+R5jgjBIoYYk
   VEho2BlD7KssbFoYHqWuLKgFFLV0nVSy1V7BqbBdp7UYHVTTxZ50Ux00c
   bVRXhizgU3FzHbpQKi11OqLSfRGHRzWF4gxCeQIEfAK3d8ENkzdgPzZlI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4765500"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4765500"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 22:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="847538653"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="847538653"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2023 22:08:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtLH5-0001eW-2Q;
	Thu, 19 Oct 2023 05:08:47 +0000
Date: Thu, 19 Oct 2023 13:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/netlink.h:115:13: warning: ' conflicts with existing
 pse...' directive output truncated writing 57 bytes into a region of size 39
Message-ID: <202310191216.FAnRacs5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd72f9c7e512da377074d47d990564959b772643
commit: 3c9561c0a5b988be3dfd24ea1de2301b95efc640 sfc: support TC decap rules matching on enc_ip_tos
date:   5 months ago
config: x86_64-randconfig-x013-20230730 (https://download.01.org/0day-ci/archive/20231019/202310191216.FAnRacs5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191216.FAnRacs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191216.FAnRacs5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:46,
                    from include/net/sch_generic.h:5,
                    from include/net/pkt_cls.h:7,
                    from drivers/net/ethernet/sfc/tc.c:12:
   drivers/net/ethernet/sfc/tc.c: In function 'efx_tc_flower_record_encap_match':
>> include/linux/netlink.h:115:13: warning: ' conflicts with existing pse...' directive output truncated writing 57 bytes into a region of size 39 [-Wformat-truncation=]
     115 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:130:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     130 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:507:33: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
     507 |                                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:115:13: note: directive argument in the range [0, 255]
     115 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:130:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     130 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:507:33: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
     507 |                                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:115:13: note: 'snprintf' output 103 bytes into a destination of size 80
     115 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:130:9: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     130 |         NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/tc.c:507:33: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
     507 |                                 NL_SET_ERR_MSG_FMT_MOD(extack,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~


vim +115 include/linux/netlink.h

2d4bc93368f5a0 Johannes Berg 2017-04-12  106  
51c352bdbcd23d Edward Cree   2022-10-18  107  /* We splice fmt with %s at each end even in the snprintf so that both calls
51c352bdbcd23d Edward Cree   2022-10-18  108   * can use the same string constant, avoiding its duplication in .ro
51c352bdbcd23d Edward Cree   2022-10-18  109   */
51c352bdbcd23d Edward Cree   2022-10-18  110  #define NL_SET_ERR_MSG_FMT(extack, fmt, args...) do {			       \
51c352bdbcd23d Edward Cree   2022-10-18  111  	struct netlink_ext_ack *__extack = (extack);			       \
51c352bdbcd23d Edward Cree   2022-10-18  112  									       \
51c352bdbcd23d Edward Cree   2022-10-18  113  	if (!__extack)							       \
51c352bdbcd23d Edward Cree   2022-10-18  114  		break;							       \
51c352bdbcd23d Edward Cree   2022-10-18 @115  	if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,	       \
51c352bdbcd23d Edward Cree   2022-10-18  116  		     "%s" fmt "%s", "", ##args, "") >=			       \
51c352bdbcd23d Edward Cree   2022-10-18  117  	    NETLINK_MAX_FMTMSG_LEN)					       \
51c352bdbcd23d Edward Cree   2022-10-18  118  		net_warn_ratelimited("%s" fmt "%s", "truncated extack: ",      \
51c352bdbcd23d Edward Cree   2022-10-18  119  				     ##args, "\n");			       \
51c352bdbcd23d Edward Cree   2022-10-18  120  									       \
51c352bdbcd23d Edward Cree   2022-10-18  121  	do_trace_netlink_extack(__extack->_msg_buf);			       \
51c352bdbcd23d Edward Cree   2022-10-18  122  									       \
51c352bdbcd23d Edward Cree   2022-10-18  123  	__extack->_msg = __extack->_msg_buf;				       \
51c352bdbcd23d Edward Cree   2022-10-18  124  } while (0)
51c352bdbcd23d Edward Cree   2022-10-18  125  

:::::: The code at line 115 was first introduced by commit
:::::: 51c352bdbcd23d7ce46b06c1e64c82754dc44044 netlink: add support for formatted extack messages

:::::: TO: Edward Cree <ecree.xilinx@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
