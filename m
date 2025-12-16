Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E80F318149
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765864575; cv=none; b=GPQvzgkHXJe5YKrvpN4LackI15VlszTBHaoZIdknQkqgvoRg7Fh9SRfd8g8RgCW/DgYb7MO/iXmsSIJsDBDRvjweUQVWQegv6NWaA3ArKG/vizomdyz1NP0Gdud4N4xWYDpZvxGv0GG7BT/d6Rz75ekv5LMEmUs+H3+19xgp4/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765864575; c=relaxed/simple;
	bh=B9O47wkLW84+sulhMWva+h4VblphMLdOOJ2jja6XBec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcZWIYPxqKFFWKeNrAxMJlDpYY3DCsSGRmyXc1PqeRyC31w/Xhe9yQrPGRgYgDB9s0yjOTwcX1M+3mAiPmsMOYK1IRAZtXq12rNr0jgpy/9YXmG9o3I74q6lgav8AA8vhYDusBA9fDGLXWAQ8LMe3f9OBlJTQm/tVipBDl6PURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a10HlGoy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a10HlGoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765864568; x=1797400568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B9O47wkLW84+sulhMWva+h4VblphMLdOOJ2jja6XBec=;
  b=a10HlGoyymV/IywzjbBXFGarEQ20yMuMPikiQanpZvdF7yIdvsDJhffA
   TB+U+pnuq8lj//Y56OSw7SUoa9SyXUCZ67+rCTOaxN5/qOpql74E0xvh6
   smnDRyHy1asLzuGwsBM288M8rpb0Y/sSMz6P1x3/qGSJiF9eYgpUE8LIT
   AXaobYmJMf4L4N0eliRZLXAgok+0egSPXtJqD8HrcMMDTMxZsb/FC7Sgn
   l7FODcwSZXDgWitR1AtHHtxO1IHzaJQE+uidCB04e4tBSxaKvvq0PKxB1
   Vp3fDv9zkZziI54afB8l8rhTepyfRacEdQy4keb/IxTOJ7Ys8V27yiiZ2
   w==;
X-CSE-ConnectionGUID: hpNJngDcRAOIpKgV3MFMUw==
X-CSE-MsgGUID: fmV23S0QTc+pDycUPdWsOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67715104"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67715104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:56:03 -0800
X-CSE-ConnectionGUID: fwba+DxbSyCqHWaRCkGcDQ==
X-CSE-MsgGUID: QPnZKw1DTTqfAJ+dwHLOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="228602209"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 21:56:02 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVO2S-000000001DF-0bQJ;
	Tue, 16 Dec 2025 05:56:00 +0000
Date: Tue, 16 Dec 2025 13:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/infiniband/hw/xsc/devx.c:13:28: warning:
 'xsc_ib_object_XSC_IB_OBJECT_DEVX' defined but not used
Message-ID: <202512161318.V9CxkqaB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 010d87517fe5ef837b847f17db54328aee3b6e07 [11/11] anolis: drivers: support for xsc drivers from Yunsilicon Technology
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512161318.V9CxkqaB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161318.V9CxkqaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161318.V9CxkqaB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/xsc/devx.c:14:
>> drivers/infiniband/hw/xsc/devx.c:13:28: warning: 'xsc_ib_object_XSC_IB_OBJECT_DEVX' defined but not used [-Wunused-const-variable=]
      13 | #define UVERBS_MODULE_NAME xsc_ib
         |                            ^~~~~~
   include/rdma/uverbs_named_ioctl.h:15:33: note: in definition of macro '_UVERBS_PASTE'
      15 | #define _UVERBS_PASTE(x, y)     x ## y
         |                                 ^
   include/rdma/uverbs_named_ioctl.h:19:33: note: in expansion of macro '_UVERBS_NAME'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                 ^~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:19:46: note: in expansion of macro 'UVERBS_MODULE_NAME'
      19 | #define UVERBS_OBJECT(id)       _UVERBS_NAME(UVERBS_MODULE_NAME, _object_##id)
         |                                              ^~~~~~~~~~~~~~~~~~
   include/rdma/uverbs_named_ioctl.h:67:47: note: in expansion of macro 'UVERBS_OBJECT'
      67 |         static const struct uverbs_object_def UVERBS_OBJECT(_object_id) = {    \
         |                                               ^~~~~~~~~~~~~
   drivers/infiniband/hw/xsc/devx.c:75:1: note: in expansion of macro 'DECLARE_UVERBS_GLOBAL_METHODS'
      75 | DECLARE_UVERBS_GLOBAL_METHODS(XSC_IB_OBJECT_DEVX,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:182:5: warning: no previous prototype for 'xsc_priv_flags_num' [-Wmissing-prototypes]
     182 | int xsc_priv_flags_num(void)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:187:13: warning: no previous prototype for 'xsc_priv_flags_name' [-Wmissing-prototypes]
     187 | const char *xsc_priv_flags_name(int flag)
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:213:5: warning: no previous prototype for 'xsc_set_priv_flags' [-Wmissing-prototypes]
     213 | int xsc_set_priv_flags(struct net_device *dev, u32 pflags)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:369:5: warning: no previous prototype for 'xsc_get_priv_flags' [-Wmissing-prototypes]
     369 | u32 xsc_get_priv_flags(struct net_device *dev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:849:5: warning: no previous prototype for 'xsc_get_rxnfc' [-Wmissing-prototypes]
     849 | int xsc_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *info, u32 *rule_locs)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:872:5: warning: no previous prototype for 'xsc_set_rxnfc' [-Wmissing-prototypes]
     872 | int xsc_set_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:901:5: warning: no previous prototype for 'xsc_get_rxfh' [-Wmissing-prototypes]
     901 | int xsc_get_rxfh(struct net_device *netdev, u32 *indir, u8 *key, u8 *hfunc)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:920:5: warning: no previous prototype for 'xsc_set_rxfh' [-Wmissing-prototypes]
     920 | int xsc_set_rxfh(struct net_device *dev, const u32 *indir, const u8 *key, const u8 hfunc)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:31:27: warning: 'pct_exp_name' defined but not used [-Wunused-const-variable=]
      31 | static const char * const pct_exp_name[] = {"N", "E" };
         |                           ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:30:27: warning: 'pp_tbl_dma_name' defined but not used [-Wunused-const-variable=]
      30 | static const char * const pp_tbl_dma_name[] = {"N", "D" };
         |                           ^~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:29:27: warning: 'anlt_fec_name' defined but not used [-Wunused-const-variable=]
      29 | static const char * const anlt_fec_name[] = {"N", "A" };
         |                           ^~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:28:27: warning: 'ma_xbar_name' defined but not used [-Wunused-const-variable=]
      28 | static const char * const ma_xbar_name[] = {"N", "X" };
         |                           ^~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:27:27: warning: 'rdma_icrc_name' defined but not used [-Wunused-const-variable=]
      27 | static const char * const rdma_icrc_name[] = {"N", "C" };
         |                           ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:26:27: warning: 'onchip_ft_name' defined but not used [-Wunused-const-variable=]
      26 | static const char * const onchip_ft_name[] = {"N", "O" };
         |                           ^~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:25:27: warning: 'hps_ddr_name' defined but not used [-Wunused-const-variable=]
      25 | static const char * const hps_ddr_name[] = {"1", "2", "4", "unknown"};
         |                           ^~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/xsc_eth_ethtool.c:24:27: warning: 'fpga_type_name' defined but not used [-Wunused-const-variable=]
      24 | static const char * const fpga_type_name[] = {"S", "L"};
         |                           ^~~~~~~~~~~~~~


vim +/xsc_ib_object_XSC_IB_OBJECT_DEVX +13 drivers/infiniband/hw/xsc/devx.c

  > 13	#define UVERBS_MODULE_NAME xsc_ib
    14	#include <rdma/uverbs_named_ioctl.h>
    15	#include "user.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
