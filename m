Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC9414A4F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749943067; cv=none; b=GE9/PULy3VU6GLOESYxzVcc47APtbLLZY3sGLB/hg39cJqIuCYuDJSVj37GZ/ABeaWbDvH66BNLNnD8wBMJBb/+eCpxRwmMv/xha6IRHAv5KJb/n64cqplNaBG9CyZsB28vrHDrBw5G9n3ApPLFSGQJBjJvWiphBQ0j/iRfV6d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749943067; c=relaxed/simple;
	bh=AxNzb6XQ9TiNSvDtI8Jhh5bDATml4jdli45RtWbWcd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GD0nlpY6o+1fk4i75TB2PrYMr9jl2Nx84/s4+EhVJ7pDhxjqVb3FVAEUyQsl6n7uxvg1rxYIV2iJMxJit4uvRkgrBHP26srUqn3nnQ901QTfORlJRci86qX0VwHvKUtTIroxYglbNsw922KJbxEZOjvLS5x7/hx0DzyexgFhq8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGpOzXCJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGpOzXCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749943066; x=1781479066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AxNzb6XQ9TiNSvDtI8Jhh5bDATml4jdli45RtWbWcd4=;
  b=EGpOzXCJK5kccU1kGV+z8/RwVCeatuEQZG3BLPKv88Rw5CrwnjwTag1B
   9UslqEocFbHBTm8oYqU65jsUbmVqKtKGIE3hW0f1V81OU7NPTnKdYGcDN
   LM8V5An+iuPz93mvyOe06nlrVx8gyr5lIlZG9de25vY4OivAVBTMXHE3H
   GN6m1POvCXpIZPpg2outICcKvhKUtpWasJnB4lh6uencWyTYhYpEsLOmO
   kwiwJ3yI3jrVV1Atig/5HUhh9c9Ya3lboJm8+p8P7DJN3w18kgITfFcNz
   YNg/iPktiMRLw4siwD7Ubv8avFLZqTSbz3cMr3W67Vx4g1Yb2dgPv2ylv
   Q==;
X-CSE-ConnectionGUID: 2hp/oaeKS/C9OkJlkucoOQ==
X-CSE-MsgGUID: Qw7zAMf/TyevXHnSgYWacw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="63158758"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="63158758"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 16:17:45 -0700
X-CSE-ConnectionGUID: qW9DAi0LTIGl8T1n5cOIWg==
X-CSE-MsgGUID: gyFtVnaBTWykWaOYzeX48w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="153099133"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2025 16:17:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQa85-000DwS-1l;
	Sat, 14 Jun 2025 23:17:41 +0000
Date: Sun, 15 Jun 2025 07:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 46/48]
 net/dsa/tag_mxl862xx_8021q.c:39:31: error: implicit declaration of function
 'dsa_slave_to_port'; did you mean 'dsa_user_to_port'?
Message-ID: <202506150758.svn13sJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   bd4df251cb270ee0b84d00c0b299ba975fa819e1
commit: 26735c484d3c2541d97c5f65e0ec69cec1592f0b [46/48] net-dsa-add-mxl862xx-special-tag-support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250615/202506150758.svn13sJT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150758.svn13sJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150758.svn13sJT-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/dsa/tag_mxl862xx_8021q.c: In function 'mxl862_8021q_tag_xmit':
>> net/dsa/tag_mxl862xx_8021q.c:39:31: error: implicit declaration of function 'dsa_slave_to_port'; did you mean 'dsa_user_to_port'? [-Wimplicit-function-declaration]
      39 |         struct dsa_port *dp = dsa_slave_to_port(dev);
         |                               ^~~~~~~~~~~~~~~~~
         |                               dsa_user_to_port
>> net/dsa/tag_mxl862xx_8021q.c:39:31: error: initialization of 'struct dsa_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   net/dsa/tag_mxl862xx_8021q.c: In function 'mxl862_8021q_tag_rcv':
>> net/dsa/tag_mxl862xx_8021q.c:53:9: error: too few arguments to function 'dsa_8021q_rcv'; expected 5, have 4
      53 |         dsa_8021q_rcv(skb, &src_port, &switch_id, NULL);
         |         ^~~~~~~~~~~~~
   In file included from net/dsa/tag_mxl862xx_8021q.c:23:
   net/dsa/tag_8021q.h:16:6: note: declared here
      16 | void dsa_8021q_rcv(struct sk_buff *skb, int *source_port, int *switch_id,
         |      ^~~~~~~~~~~~~
>> net/dsa/tag_mxl862xx_8021q.c:58:20: error: implicit declaration of function 'dsa_master_find_slave' [-Wimplicit-function-declaration]
      58 |         skb->dev = dsa_master_find_slave(dev, switch_id, src_port);
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> net/dsa/tag_mxl862xx_8021q.c:58:18: error: assignment to 'struct net_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      58 |         skb->dev = dsa_master_find_slave(dev, switch_id, src_port);
         |                  ^
   net/dsa/tag_mxl862xx_8021q.c: At top level:
>> net/dsa/tag_mxl862xx_8021q.c:72:10: error: 'const struct dsa_device_ops' has no member named 'promisc_on_master'
      72 |         .promisc_on_master      = true,
         |          ^~~~~~~~~~~~~~~~~


vim +39 net/dsa/tag_mxl862xx_8021q.c

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
594c8e2819ea1f Frank Wunderlich 2025-06-13 @53  	dsa_8021q_rcv(skb, &src_port, &switch_id, NULL);
594c8e2819ea1f Frank Wunderlich 2025-06-13  54  	if (src_port == -1 || switch_id == -1) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  55  		dev_warn_ratelimited(&dev->dev, "Dropping packet due to invalid outer 802.1Q tag: switch %d port %d\n", switch_id, src_port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  56  		return NULL;
594c8e2819ea1f Frank Wunderlich 2025-06-13  57  	}
594c8e2819ea1f Frank Wunderlich 2025-06-13 @58  	skb->dev = dsa_master_find_slave(dev, switch_id, src_port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  59  	if (!skb->dev) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  60  		dev_warn_ratelimited(&dev->dev, "Dropping packet due to invalid source port: %d\n", src_port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  61  		return NULL;
594c8e2819ea1f Frank Wunderlich 2025-06-13  62  	}
594c8e2819ea1f Frank Wunderlich 2025-06-13  63  	dsa_default_offload_fwd_mark(skb);
594c8e2819ea1f Frank Wunderlich 2025-06-13  64  	return skb;
594c8e2819ea1f Frank Wunderlich 2025-06-13  65  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  66  static const struct dsa_device_ops mxl862_8021q_netdev_ops = {
594c8e2819ea1f Frank Wunderlich 2025-06-13  67  	.name = "mxl862_8021q",
594c8e2819ea1f Frank Wunderlich 2025-06-13  68  	.proto = DSA_TAG_PROTO_MXL862_8021Q,
594c8e2819ea1f Frank Wunderlich 2025-06-13  69  	.xmit = mxl862_8021q_tag_xmit,
594c8e2819ea1f Frank Wunderlich 2025-06-13  70  	.rcv = mxl862_8021q_tag_rcv,
594c8e2819ea1f Frank Wunderlich 2025-06-13  71  	.needed_headroom	= VLAN_HLEN,
594c8e2819ea1f Frank Wunderlich 2025-06-13 @72  	.promisc_on_master	= true,

:::::: The code at line 39 was first introduced by commit
:::::: 594c8e2819ea1ff1397f9572a5c8d15228d27586 net: dsa: add mxl862xx driver

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
