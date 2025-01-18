Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74A155327
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737188444; cv=none; b=Nbtkg/Gcfuh4Ab8CxDBGf5EYSfMpvzhu/1TusgMiucvc1b/MI+L8zOrs4MEgDtYoM6ZUyQPk5abJ6dhN13iGHhcp5O2dQ6mNOMhX0A5kDvTXr19mr4mj6vZkIzIB2r2XDgJdHiMRm+GXt7f9WuzA8wwsdpUmuv2juOSif0jYssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737188444; c=relaxed/simple;
	bh=JmZ+uZdPv6xzIA+piG/x2IkXY3yPOGJ0TNChBqDhdBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dlV6n21zksFxtd5teRnHiEVp81iK5U1lD7KRm5dk8NK33vyx5ZJheqbMJEPmGUPFedGon3A37QvCGsRBVwOyCDnC1TBEw43zgRXgmj8tUugVDvRsbUOOpnToN3Qg0ZHIBZtHtAUD6DJhmI3vuf/cnW6fe0pAFx8pB07JAx0Xan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEswXGG1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEswXGG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737188443; x=1768724443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JmZ+uZdPv6xzIA+piG/x2IkXY3yPOGJ0TNChBqDhdBc=;
  b=oEswXGG1EZhTpsXa69UsgUjHDXPD7GoWsh36rcJHC17hCoGuXjR5QvtK
   IhZ7sIfJwEbAkVh07nqEUAWOqujy3idEQP3we2LbovP99AKxBy3eo8Yr2
   lLx4ViPLrtd3+y089SXrDPPaMEPdkjILPiduVnXu/UdOh0j3eUuiOudJY
   w0lukwyRpsMzjGm2LAcGcnl/enT/paCy/gZANuUr5aSY0l7Vp+umXQ6wU
   HMag466tmER61LlbElDieDCYlRGe+GgXbU2tYd2ylKYeWoOAOM2A2cJLb
   i4C/x8guhq3CrgpnQ+SXQEXW4bK7AmF1dGX+bu33nHYtgMgCTcMiRKzFI
   A==;
X-CSE-ConnectionGUID: E2/bt5mRTQeTnNRbDkqgJA==
X-CSE-MsgGUID: 2WmhzCfcTrakFEV0U1eEEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37533824"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="37533824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 00:20:42 -0800
X-CSE-ConnectionGUID: OSXigp7VTmqNsPAMY46EUQ==
X-CSE-MsgGUID: FWvcxjtBQHKNHgl+UXQcHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136919071"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2025 00:20:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ44N-000UEN-0z;
	Sat, 18 Jan 2025 08:20:39 +0000
Date: Sat, 18 Jan 2025 16:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 4/4]
 include/linux/netlink.h:116:13: warning: ' for stack (total ' directive
 output truncated writing 18 bytes into a region of size between 0 and 14
Message-ID: <202501181655.fl9DWj4x-lkp@intel.com>
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
head:   f16662acb64a2666f1ea811ad39bd4eb5555c03e
commit: 17e5530a74af3cd8a0f8af1d05651f271d61a58b [4/4] net: enetc: shorten enetc_setup_xdp_prog() error message to fit NETLINK_MAX_FMTMSG_LEN
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501181655.fl9DWj4x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181655.fl9DWj4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181655.fl9DWj4x-lkp@intel.com/

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
