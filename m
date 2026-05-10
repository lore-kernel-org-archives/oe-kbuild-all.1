Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955641DE2AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397462; cv=none; b=XaaGKs3GEuaAmQnJx8kLtqKTny0/TI+uTlflpFvCkWR6xBGvVaqmWrj5mQjcHrzBUM7GQPqB13eDE9lTnduV4mBHQmBcTV+l0hJk4dNXcL7Ku8Ykb4b+yREYIpihiNUKfvZJyLZRmXRLfmZmH7tcjcHhBgjV90/Hu9lNIp6dSoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397462; c=relaxed/simple;
	bh=MjoTFvHgTeYg95b+U3B8HxSKeKql3ewwdSi869ofLSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ghstYnBL75euwYUX5bPIEv5RfOl/2p2zLFVAmQXbBCfvvj6EkVUMl1zncVqaILiuXXKub2EarnyhevIYCEYo6pO6BfwXs+zSuo49cOCKs3Oz2IDfh6IaMFcd/vnDB1AH67/89EvfwneLGLeX9bFob9w65ps/Yb+7XhILRaYJrIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQOmJIPj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQOmJIPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778397461; x=1809933461;
  h=date:from:to:cc:subject:message-id;
  bh=MjoTFvHgTeYg95b+U3B8HxSKeKql3ewwdSi869ofLSE=;
  b=BQOmJIPjnSPgjzrIPKnhv7YfDio1iWR+68PWlqhqWziSqODgtxVNbtEw
   0Zrg/Lt1L8mZ3hwQ+hW6c3hYLuSGJtJdhymArdNepMmUyXiKET2J/InH2
   aZg2ekm9hujczbRYUVp+I5X7AfXES1Yi8K8SLqCiwkRiGmz963Gk/EN52
   WcbHbf0GJTHpLEKZWTKwzjMa68Yi5dsVhZw7dNehgYxKc3t0d8Ere9asL
   eNC9nxZd0T2BaP4Rp2Gp0iG+AdANREchynnI/PM+V/yHQA0p+5QK5tdBC
   0bbnh9NbrONkfjtlnFGA2VrAYOfU02sTdHjNJNvbunsi54h6B3X1JQQ6o
   A==;
X-CSE-ConnectionGUID: Rr4JnXKQQge+aOQW2LYsJg==
X-CSE-MsgGUID: pa1UF2x8Q/mB3zxAL62e/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="78346923"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="78346923"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 00:17:40 -0700
X-CSE-ConnectionGUID: RpI1QPFqQKGFUd2VwAU1Sw==
X-CSE-MsgGUID: m8CaBQo1TV+KjCOtsXCevA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="232684446"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 May 2026 00:17:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLyPw-000000007fP-3YU3;
	Sun, 10 May 2026 07:17:36 +0000
Date: Sun, 10 May 2026 09:16:37 +0200
From: kernel test robot <lkp@intel.com>
To: Lucas Poupeau <lucasp.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/llc/llc_input.c:181:17: error: implicit declaration of
 function 'dprintk'; did you mean '_printk'?
Message-ID: <202605100916.pl5Tckkm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lucas-Poupeau/llc-fix-coding-style-and-memory-barrier-documentation/20260510-102311
head:   846d7f9be892105f4931ceebe20cfc006f428697
commit: 846d7f9be892105f4931ceebe20cfc006f428697 llc: fix coding style and memory barrier documentation
date:   5 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260510/202605100916.pl5Tckkm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100916.pl5Tckkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100916.pl5Tckkm-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/llc/llc_input.c: In function 'llc_rcv':
>> net/llc/llc_input.c:181:17: error: implicit declaration of function 'dprintk'; did you mean '_printk'? [-Wimplicit-function-declaration]
     181 |                 dprintk("%s: PACKET_OTHERHOST\n", __func__);
         |                 ^~~~~~~
         |                 _printk


vim +181 net/llc/llc_input.c

^1da177e4c3f41 Linus Torvalds           2005-04-16  151  
^1da177e4c3f41 Linus Torvalds           2005-04-16  152  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  153   *	llc_rcv - 802.2 entry point from net lower layers
^1da177e4c3f41 Linus Torvalds           2005-04-16  154   *	@skb: received pdu
^1da177e4c3f41 Linus Torvalds           2005-04-16  155   *	@dev: device that receive pdu
^1da177e4c3f41 Linus Torvalds           2005-04-16  156   *	@pt: packet type
74c950c966c180 Andrew Lunn              2020-07-13  157   *	@orig_dev: the original receive net device
^1da177e4c3f41 Linus Torvalds           2005-04-16  158   *
^1da177e4c3f41 Linus Torvalds           2005-04-16  159   *	When the system receives a 802.2 frame this function is called. It
^1da177e4c3f41 Linus Torvalds           2005-04-16  160   *	checks SAP and connection of received pdu and passes frame to
^1da177e4c3f41 Linus Torvalds           2005-04-16  161   *	llc_{station,sap,conn}_rcv for sending to proper state machine. If
^1da177e4c3f41 Linus Torvalds           2005-04-16  162   *	the frame is related to a busy connection (a connection is sending
^1da177e4c3f41 Linus Torvalds           2005-04-16  163   *	data now), it queues this frame in the connection's backlog.
^1da177e4c3f41 Linus Torvalds           2005-04-16  164   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  165  int llc_rcv(struct sk_buff *skb, struct net_device *dev,
f2ccd8fa06c8e3 David S. Miller          2005-08-09  166  	    struct packet_type *pt, struct net_device *orig_dev)
^1da177e4c3f41 Linus Torvalds           2005-04-16  167  {
^1da177e4c3f41 Linus Torvalds           2005-04-16  168  	struct llc_sap *sap;
^1da177e4c3f41 Linus Torvalds           2005-04-16  169  	struct llc_pdu_sn *pdu;
^1da177e4c3f41 Linus Torvalds           2005-04-16  170  	int dest;
846d7f9be89210 Lucas Poupeau            2026-05-05  171  	int (*rcv)(struct sk_buff *skb, struct net_device *dev,
846d7f9be89210 Lucas Poupeau            2026-05-05  172  		   struct packet_type *pt, struct net_device *orig_dev);
aadf31de16a7b2 Ben Hutchings            2012-08-13  173  	void (*sta_handler)(struct sk_buff *skb);
aadf31de16a7b2 Ben Hutchings            2012-08-13  174  	void (*sap_handler)(struct llc_sap *sap, struct sk_buff *skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  175  
^1da177e4c3f41 Linus Torvalds           2005-04-16  176  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  177  	 * When the interface is in promisc. mode, drop all the crap that it
^1da177e4c3f41 Linus Torvalds           2005-04-16  178  	 * receives, do not try to analyse it.
^1da177e4c3f41 Linus Torvalds           2005-04-16  179  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  180  	if (unlikely(skb->pkt_type == PACKET_OTHERHOST)) {
0dc47877a3de00 Harvey Harrison          2008-03-05 @181  		dprintk("%s: PACKET_OTHERHOST\n", __func__);
^1da177e4c3f41 Linus Torvalds           2005-04-16  182  		goto drop;
^1da177e4c3f41 Linus Torvalds           2005-04-16  183  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  184  	skb = skb_share_check(skb, GFP_ATOMIC);
^1da177e4c3f41 Linus Torvalds           2005-04-16  185  	if (unlikely(!skb))
^1da177e4c3f41 Linus Torvalds           2005-04-16  186  		goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  187  	if (unlikely(!llc_fixup_skb(skb)))
^1da177e4c3f41 Linus Torvalds           2005-04-16  188  		goto drop;
^1da177e4c3f41 Linus Torvalds           2005-04-16  189  	pdu = llc_pdu_sn_hdr(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  190  	if (unlikely(!pdu->dsap)) /* NULL DSAP, refer to station */
^1da177e4c3f41 Linus Torvalds           2005-04-16  191  	       goto handle_station;
^1da177e4c3f41 Linus Torvalds           2005-04-16  192  	sap = llc_sap_find(pdu->dsap);
^1da177e4c3f41 Linus Torvalds           2005-04-16  193  	if (unlikely(!sap)) {/* unknown SAP */
0dc47877a3de00 Harvey Harrison          2008-03-05  194  		dprintk("%s: llc_sap_find(%02X) failed!\n", __func__,
^1da177e4c3f41 Linus Torvalds           2005-04-16  195  			pdu->dsap);
^1da177e4c3f41 Linus Torvalds           2005-04-16  196  		goto drop;
^1da177e4c3f41 Linus Torvalds           2005-04-16  197  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  198  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  199  	 * First the upper layer protocols that don't need the full
^1da177e4c3f41 Linus Torvalds           2005-04-16  200  	 * LLC functionality
^1da177e4c3f41 Linus Torvalds           2005-04-16  201  	 */
23dbe7912dad6b Stephen Hemminger        2006-05-25  202  	rcv = rcu_dereference(sap->rcv_func);
696ea472e19c6d Changli Gao              2011-02-22  203  	dest = llc_pdu_type(skb);
6aa7de059173a9 Mark Rutland             2017-10-23  204  	sap_handler = dest ? READ_ONCE(llc_type_handlers[dest - 1]) : NULL;
aadf31de16a7b2 Ben Hutchings            2012-08-13  205  	if (unlikely(!sap_handler)) {
696ea472e19c6d Changli Gao              2011-02-22  206  		if (rcv)
696ea472e19c6d Changli Gao              2011-02-22  207  			rcv(skb, dev, pt, orig_dev);
696ea472e19c6d Changli Gao              2011-02-22  208  		else
696ea472e19c6d Changli Gao              2011-02-22  209  			kfree_skb(skb);
696ea472e19c6d Changli Gao              2011-02-22  210  	} else {
23dbe7912dad6b Stephen Hemminger        2006-05-25  211  		if (rcv) {
8f182b494f8779 Stephen Hemminger        2006-05-25  212  			struct sk_buff *cskb = skb_clone(skb, GFP_ATOMIC);
846d7f9be89210 Lucas Poupeau            2026-05-05  213  
8f182b494f8779 Stephen Hemminger        2006-05-25  214  			if (cskb)
8f182b494f8779 Stephen Hemminger        2006-05-25  215  				rcv(cskb, dev, pt, orig_dev);
^1da177e4c3f41 Linus Torvalds           2005-04-16  216  		}
aadf31de16a7b2 Ben Hutchings            2012-08-13  217  		sap_handler(sap, skb);
696ea472e19c6d Changli Gao              2011-02-22  218  	}
6e2144b76840be Arnaldo Carvalho de Melo 2005-09-22  219  	llc_sap_put(sap);
^1da177e4c3f41 Linus Torvalds           2005-04-16  220  out:
^1da177e4c3f41 Linus Torvalds           2005-04-16  221  	return 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  222  drop:
^1da177e4c3f41 Linus Torvalds           2005-04-16  223  	kfree_skb(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  224  	goto out;
846d7f9be89210 Lucas Poupeau            2026-05-05  225  
^1da177e4c3f41 Linus Torvalds           2005-04-16  226  handle_station:
6aa7de059173a9 Mark Rutland             2017-10-23  227  	sta_handler = READ_ONCE(llc_station_handler);
aadf31de16a7b2 Ben Hutchings            2012-08-13  228  	if (!sta_handler)
^1da177e4c3f41 Linus Torvalds           2005-04-16  229  		goto drop;
aadf31de16a7b2 Ben Hutchings            2012-08-13  230  	sta_handler(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  231  	goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  232  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  233  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
