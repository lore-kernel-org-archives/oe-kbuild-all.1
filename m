Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023BCC133
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754536190; cv=none; b=E5kLrOuB8Qw0TgVop8kE+tQN/IWWFWrW/KI4tP4UniwLfpex/NZihNxlcuxtd1BaaPItE5MK/07ZQTZisUwysFu70mqibldznNxw+DG/Pb0z4olUDzPmOeHMWnZKjoDgsNGyzYm82iTiQA17wRFngc0uVlhyuaO9R2EAqv10BjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754536190; c=relaxed/simple;
	bh=SvFEfI9yOKUM0tPgR535Np221mAY2ytg82o+/tbFvFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtXdidyltZoEugG+pZsPl9NMD6PXk8dlX6ixdP86/8/UkogFR/KIfAZqKehpnTNtoEGYZOW0nS5SAqoBru9QNRqzt+/NJt/17DhtKuA/ssVgQUOpM8r+UEFysvXiHkcPZm6v3Xyokm5FPxCoEEJ76jY/bIwO6ylkYaxUq/Eofr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaA4Ax9U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaA4Ax9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754536189; x=1786072189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SvFEfI9yOKUM0tPgR535Np221mAY2ytg82o+/tbFvFU=;
  b=FaA4Ax9Usb0Pp7NOwxH+oxJJmU0SWvVZXVmp1voU92PeXwKZ2Ppet3NL
   DvOCFfo2LuWXxGDIPxvJEYJFuOXArNRzi/NY4mAJxienNzsUFETLmMrn3
   tROd6XlTbXNTXrIYIQvb1gew8qocwogOEjWTRtLqitjz08Hb8W4ZdnB/i
   7izbi0UI2SS1szhkxJ2HnQyzQrQuhMCBhFmlgc4KykugTfX0s/J8dpDlO
   cLNQuihGDtJ1siUk3YCpU3X0QWm0HI0O3p2FnnhsUsTQeyZNlsMqFdPyb
   zcwfYYo81GjZe2gOpmkkFH6iKtK7w/YiH4sb2uD5zlG8Br8L8pW2GqZ7v
   A==;
X-CSE-ConnectionGUID: OrthslZPSDOWIN5M8D+IGg==
X-CSE-MsgGUID: +q6Ysm4yQLq6IGL6ypTZag==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="59478689"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="59478689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 20:09:48 -0700
X-CSE-ConnectionGUID: 7HI3pef7SSqgz+p3AQ+rvQ==
X-CSE-MsgGUID: fzgnhEQ1RYy1aFArf7sciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169063220"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2025 20:09:47 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujr0j-0002JH-1H;
	Thu, 07 Aug 2025 03:09:45 +0000
Date: Thu, 7 Aug 2025 05:08:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 38/38]
 include/linux/netlink.h:116:6: warning: ' for stack (total ' directive
 output truncated writing 18 bytes into a region of size between 0 and 14
Message-ID: <202508070538.E1gMP5XR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   304dd4f51e7360d53dace5bc86114f471aed1750
commit: 17e5530a74af3cd8a0f8af1d05651f271d61a58b [38/38] net: enetc: shorten enetc_setup_xdp_prog() error message to fit NETLINK_MAX_FMTMSG_LEN
config: arm64-randconfig-2005-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070538.E1gMP5XR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070538.E1gMP5XR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070538.E1gMP5XR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from drivers/net/ethernet/freescale/enetc/enetc.h:6,
                    from drivers/net/ethernet/freescale/enetc/enetc.c:4:
   drivers/net/ethernet/freescale/enetc/enetc.c: In function 'enetc_setup_bpf':
>> include/linux/netlink.h:116:6: warning: ' for stack (total ' directive output truncated writing 18 bytes into a region of size between 0 and 14 [-Wformat-truncation=]
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2771:3: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
   drivers/net/ethernet/freescale/enetc/enetc.c:2771:3: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
      NL_SET_ERR_MSG_FMT_MOD(extack,
      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:6: note: 'snprintf' output between 87 and 111 bytes into a destination of size 80
     if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,        \
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           "%s" fmt "%s", "", ##args, "") >=          \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:131:2: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
     NL_SET_ERR_MSG_FMT((extack), KBUILD_MODNAME ": " fmt, ##args)
     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/enetc/enetc.c:2771:3: note: in expansion of macro 'NL_SET_ERR_MSG_FMT_MOD'
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
