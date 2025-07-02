Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3723D284
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447921; cv=none; b=atIB9mEYix9gr3e5YJ7c5wmJhBX6q8nvtfIvmrKuQG4Cg+1dVLH1DNbAwhwjE1QPxXD6hbZbj1Dba9OAjGvWsT8whe3Fs4gm3hk2LqbjgaTUkTfcAjYS+R2GOR+FmhOGOjsCiqW2KJioaQf5lZ43qHdcrPW3OSiyOSvEQ4Q7svY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447921; c=relaxed/simple;
	bh=liRGv2JXt0ZOWTwzTO76tGwQsi5J2E/46kE6kSzYOoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QE5q2Q69iUUDkBcm+k2onHonu37RVNkreH/SRPhRgnASUZTByibnfKky6+tGuK/jlZrrQqhEkiIRWvwgWihVRW5gRpM3gJWygow6DAVeprxj83U/kb+caArqQkdPsrGr3wc+9BRkLrv36Pg6j5/LLEZJlvwbhp6hdWbVOBt2W08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEQibgvQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEQibgvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751447919; x=1782983919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=liRGv2JXt0ZOWTwzTO76tGwQsi5J2E/46kE6kSzYOoA=;
  b=fEQibgvQFH3E3RFx02kdiZCkfJpDCeJ/2M2I8M3E/AGvoeNLPT8nbJVD
   OjOlRea1/EoAStFGmUx65zZjAkXVWwI2III6fCuCYtTuLcA4XiMJIpV2/
   WOx+/3q9zDHZlzx8onwCN7nVgCfiMxINjkv7a1lWrZKnMdPjWxx508rZa
   TjYTNnSUzuJVSQ6lyTmwDA0ZozYgfbTlIrvpHHBjKok9IGV/bu4oQgtI1
   vGxfSxRVRcQXWDBqoVgn119jBwR3LAh9x+ERlFHBHynPlO6qQ/okMJ56F
   nN9vCaoXO+VpAoAaaGJ/sMcRuZmDmO/bsRyYxvPEO8evJfUxV3lZ1Ee96
   Q==;
X-CSE-ConnectionGUID: hZfy8N5PSCSrSaSjZCfroA==
X-CSE-MsgGUID: yfWF/Jf3Qye3tX6fPS3zpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427958"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64427958"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 02:18:37 -0700
X-CSE-ConnectionGUID: j+osDaD7TsCb3+We9fqH/w==
X-CSE-MsgGUID: HadrsusLTWm/vJ45K8VxaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159538618"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:18:36 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWtbu-0000Rb-0b;
	Wed, 02 Jul 2025 09:18:34 +0000
Date: Wed, 2 Jul 2025 17:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 36/36]
 include/linux/netlink.h:116:13: warning: ' for stack (total ' directive
 output truncated writing 18 bytes into a region of size between 0 and 14
Message-ID: <202507021710.b0ZxeP2T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   e46d8eec80ca529b65ede6df00d9219e17665b1e
commit: 17e5530a74af3cd8a0f8af1d05651f271d61a58b [36/36] net: enetc: shorten enetc_setup_xdp_prog() error message to fit NETLINK_MAX_FMTMSG_LEN
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507021710.b0ZxeP2T-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021710.b0ZxeP2T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021710.b0ZxeP2T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/enetc/enetc.c: In function 'enetc_setup_irqs':
   drivers/net/ethernet/freescale/enetc/enetc.c:2306:60: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 4 and 19 [-Wformat-truncation=]
    2306 |                 snprintf(v->name, sizeof(v->name), "%s-rxtx%d",
         |                                                            ^~
   drivers/net/ethernet/freescale/enetc/enetc.c:2306:52: note: directive argument in the range [-2147483638, 2147483646]
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
