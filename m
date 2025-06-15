Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE74F367
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 00:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749946915; cv=none; b=k69xa5eUiKI566KiWJcVm/9yW3xopZaNqstL103oBIv8kOCTIUmu9It/VILGdCMxpuiz3j9AKDd9PJw4ejwlcdzma/7RTh1QI0VTRAiN82wdXTZZCg5rvDCdDYixbclS6b4DCgcUFRocF7EO62vBibQRTXsbqmtEPDJzUX2C80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749946915; c=relaxed/simple;
	bh=YiXdw5ADsmd+XHB6Wufyz7YKBpMgNgCLAw8oLCueJxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1WkGwvT9cWmKfUbaWR7W1BbWCTl7Y7qVCGpOKARZb1ekIlwR1e2+4vDXHfqXx3KIVQtdwugxpxahsbQYI5SN7yPqEGRXNJ3TymGe4n1yrJy52HptgiIiRmo2YqFz+vFwvcJTgxViiB3dOXb92RjLidnKIZGeSFMCMu8K8BXryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mab4WPXA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mab4WPXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749946913; x=1781482913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YiXdw5ADsmd+XHB6Wufyz7YKBpMgNgCLAw8oLCueJxM=;
  b=mab4WPXA0BNVWcH435REHbu033ijlSLZHD1sIxdRKRAdcTLHA5MUAxoy
   fin4sD2ZWghCMp+QTwzkltfVJPtI7KrpanKG9u7UNWc/RNohZnvvPly2r
   f1XvsSlXq0oymKud84CnikEpxrg4Vfvq9dLYBx1LsJIErS21/K+J1WY6Z
   v9Vqy5ZGN4a6blICNQjjhZz2xGcL9U2sFEuu4QZ00oHvty8P+08BkwJre
   3Tda0PFyek9kfR5/JqA5pgeu7awZCcOrMX8sAHeKy6dPM401fin2s5VKs
   4WS7uzkCuV4GXaOBDAF4Wqns7pJDNh6q7VtV/hdBMVqVKzhSRHqfK8k+M
   Q==;
X-CSE-ConnectionGUID: g9TJdJiFRjuZooWdCrWDcQ==
X-CSE-MsgGUID: TSYY141oSfyQNyksTx9iew==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="69703431"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="69703431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 17:21:52 -0700
X-CSE-ConnectionGUID: O4Yy0EHDS+esRDG4/CDYXQ==
X-CSE-MsgGUID: aG3pIK46SxmTS06MC0epxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="149022121"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jun 2025 17:21:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQb88-000Dya-1y;
	Sun, 15 Jun 2025 00:21:48 +0000
Date: Sun, 15 Jun 2025 08:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 46/48]
 net/dsa/tag_mxl862xx_8021q.c:39:31: warning: initialization of 'struct
 dsa_port *' from 'int' makes pointer from integer without a cast
Message-ID: <202506150836.vukmEZ3l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   bd4df251cb270ee0b84d00c0b299ba975fa819e1
commit: 26735c484d3c2541d97c5f65e0ec69cec1592f0b [46/48] net-dsa-add-mxl862xx-special-tag-support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250615/202506150836.vukmEZ3l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150836.vukmEZ3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150836.vukmEZ3l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/dsa/tag_mxl862xx_8021q.c: In function 'mxl862_8021q_tag_xmit':
   net/dsa/tag_mxl862xx_8021q.c:39:31: error: implicit declaration of function 'dsa_slave_to_port'; did you mean 'dsa_user_to_port'? [-Werror=implicit-function-declaration]
      39 |         struct dsa_port *dp = dsa_slave_to_port(dev);
         |                               ^~~~~~~~~~~~~~~~~
         |                               dsa_user_to_port
>> net/dsa/tag_mxl862xx_8021q.c:39:31: warning: initialization of 'struct dsa_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   net/dsa/tag_mxl862xx_8021q.c: In function 'mxl862_8021q_tag_rcv':
   net/dsa/tag_mxl862xx_8021q.c:53:9: error: too few arguments to function 'dsa_8021q_rcv'
      53 |         dsa_8021q_rcv(skb, &src_port, &switch_id, NULL);
         |         ^~~~~~~~~~~~~
   In file included from net/dsa/tag_mxl862xx_8021q.c:23:
   net/dsa/tag_8021q.h:16:6: note: declared here
      16 | void dsa_8021q_rcv(struct sk_buff *skb, int *source_port, int *switch_id,
         |      ^~~~~~~~~~~~~
   net/dsa/tag_mxl862xx_8021q.c:58:20: error: implicit declaration of function 'dsa_master_find_slave' [-Werror=implicit-function-declaration]
      58 |         skb->dev = dsa_master_find_slave(dev, switch_id, src_port);
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> net/dsa/tag_mxl862xx_8021q.c:58:18: warning: assignment to 'struct net_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      58 |         skb->dev = dsa_master_find_slave(dev, switch_id, src_port);
         |                  ^
   net/dsa/tag_mxl862xx_8021q.c: At top level:
   net/dsa/tag_mxl862xx_8021q.c:72:10: error: 'const struct dsa_device_ops' has no member named 'promisc_on_master'
      72 |         .promisc_on_master      = true,
         |          ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +39 net/dsa/tag_mxl862xx_8021q.c

594c8e2819ea1f Frank Wunderlich 2025-06-13 @23  #include "tag_8021q.h"
594c8e2819ea1f Frank Wunderlich 2025-06-13  24  #include "tag.h"
594c8e2819ea1f Frank Wunderlich 2025-06-13  25  #define MXL862_NAME	"mxl862xx"
594c8e2819ea1f Frank Wunderlich 2025-06-13  26  /* To define the outgoing port and to discover the incoming port
594c8e2819ea1f Frank Wunderlich 2025-06-13  27   * a special 4-byte outer VLAN tag is used by the MxL862xx.
594c8e2819ea1f Frank Wunderlich 2025-06-13  28   *
594c8e2819ea1f Frank Wunderlich 2025-06-13  29   *       Dest MAC       Src MAC    special   optional  EtherType
594c8e2819ea1f Frank Wunderlich 2025-06-13  30   *                                 outer     inner
594c8e2819ea1f Frank Wunderlich 2025-06-13  31   *                                 VLAN tag  tag(s)
594c8e2819ea1f Frank Wunderlich 2025-06-13  32   * ...| 1 2 3 4 5 6 | 1 2 3 4 5 6 | 1 2 3 4 | 1 2 3 4 | 1 2 |...
594c8e2819ea1f Frank Wunderlich 2025-06-13  33   *                                |<------->|
594c8e2819ea1f Frank Wunderlich 2025-06-13  34   */
594c8e2819ea1f Frank Wunderlich 2025-06-13  35  /* special tag in TX path header */
594c8e2819ea1f Frank Wunderlich 2025-06-13  36  static struct sk_buff *mxl862_8021q_tag_xmit(struct sk_buff *skb,
594c8e2819ea1f Frank Wunderlich 2025-06-13  37  				      struct net_device *dev)
594c8e2819ea1f Frank Wunderlich 2025-06-13  38  {
594c8e2819ea1f Frank Wunderlich 2025-06-13 @39  	struct dsa_port *dp = dsa_slave_to_port(dev);
594c8e2819ea1f Frank Wunderlich 2025-06-13  40  	u16 tx_vid = dsa_tag_8021q_standalone_vid(dp);
594c8e2819ea1f Frank Wunderlich 2025-06-13  41  	u16 queue_mapping = skb_get_queue_mapping(skb);
594c8e2819ea1f Frank Wunderlich 2025-06-13  42  	u8 pcp = netdev_txq_to_tc(dev, queue_mapping);
594c8e2819ea1f Frank Wunderlich 2025-06-13  43  	dsa_8021q_xmit(skb, dev, ETH_P_8021Q,
594c8e2819ea1f Frank Wunderlich 2025-06-13  44  			      ((pcp << VLAN_PRIO_SHIFT) | tx_vid));
594c8e2819ea1f Frank Wunderlich 2025-06-13  45  	return skb;
594c8e2819ea1f Frank Wunderlich 2025-06-13  46  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  47  static struct sk_buff *mxl862_8021q_tag_rcv(struct sk_buff *skb,
594c8e2819ea1f Frank Wunderlich 2025-06-13  48  				      struct net_device *dev)
594c8e2819ea1f Frank Wunderlich 2025-06-13  49  {
594c8e2819ea1f Frank Wunderlich 2025-06-13  50  	int src_port = -1;
594c8e2819ea1f Frank Wunderlich 2025-06-13  51  	int switch_id = -1;
594c8e2819ea1f Frank Wunderlich 2025-06-13  52  	/* removes Outer VLAN tag */
594c8e2819ea1f Frank Wunderlich 2025-06-13  53  	dsa_8021q_rcv(skb, &src_port, &switch_id, NULL);
594c8e2819ea1f Frank Wunderlich 2025-06-13  54  	if (src_port == -1 || switch_id == -1) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  55  		dev_warn_ratelimited(&dev->dev, "Dropping packet due to invalid outer 802.1Q tag: switch %d port %d\n", switch_id, src_port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  56  		return NULL;
594c8e2819ea1f Frank Wunderlich 2025-06-13  57  	}
594c8e2819ea1f Frank Wunderlich 2025-06-13 @58  	skb->dev = dsa_master_find_slave(dev, switch_id, src_port);

:::::: The code at line 39 was first introduced by commit
:::::: 594c8e2819ea1ff1397f9572a5c8d15228d27586 net: dsa: add mxl862xx driver

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
