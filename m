Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EBC194A76
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 05:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765688684; cv=none; b=NRdLShR8V2pveNAds0HsSR/aP+qy9CScwMYUChXwowCh46vBmgtYlJ9llUqeqx0gf5EGnLxm0r9CzfhPazVTchL+/+3FbCwegLF+wZl2n0Tu9vF2SFmTXmOooS/1jiYhqjZLnUZonfJb/ZAPBZpprnMiWY76OuOShGFJWGeAPMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765688684; c=relaxed/simple;
	bh=cmpuNN+OS5SXB7h9A+ekQX9sY4MO9nthgbZtSbSc5wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPMlKYRIh6CIIhn9KiXnBR6LcX6NN8Cw4beeV87brzAqEvfag1+Wey+lwQ+zw/d7a3FFwFbj6FDoAUm6eQM7HxL5ZLMSPnyDqLIna+hRZ7Ku0JaqKA6RiRTY+ufR9Y/c1uAYwsPWMpNpOaNRdJDX+zLpxVRj5sBME253c1Sk1+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1IPIUMe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1IPIUMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765688682; x=1797224682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmpuNN+OS5SXB7h9A+ekQX9sY4MO9nthgbZtSbSc5wQ=;
  b=K1IPIUMesuFY0LoDBzQDQ2cP31jHbPO8EAsgno7L2e3b9ySffb7OjdvW
   29hV9oRfLIPZlGHTvawoWNDHAF2rDannYN3Q6tIAAr6c47xoHrOxb6nwW
   jji2SqayZXO3NPa5cvS73vO9bdIdH3yhfbc0iuLF17gsavahgVZ2FEZoc
   tH/IHx5aM7jPGA6UCe405K80mXFXX34aWPcOYuTaP9ag97ZA4wlTvd4H9
   db2N3PkQl+bPE6hWFjhHsAhppjxakvHMcyxGyGh9sY5xDTcLdlF+S8ylA
   zxspH2+f7D+6X+3fxPDZ1hFKpUL0y7iRgPy/k1e1c/w9+XF3nnUFg96+J
   g==;
X-CSE-ConnectionGUID: snq66MauRmWS7fqTD719kA==
X-CSE-MsgGUID: FnTapLN/RBae120IjeVHPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67592950"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67592950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:04:42 -0800
X-CSE-ConnectionGUID: ddtBIZnMRqaN3WM2fsbQfQ==
X-CSE-MsgGUID: TFvp3ThVRouxh2NV/35VYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202535762"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 21:04:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUeHe-000000002Ha-1Whz;
	Sun, 14 Dec 2025 05:04:38 +0000
Date: Sun, 14 Dec 2025 06:04:09 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Wei <luwei32@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 net/netfilter/nf_conntrack_core.c:1017: warning: Function parameter or
 member 'reply_hash' not described in 'nf_ct_resolve_clash'
Message-ID: <202512140639.YUx3bpbN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: cc12c927ac504e99fc176ea49e85226b6aeadcd5 [1941/1941] netfilter: conntrack: allow insertion of clashing entries
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140639.YUx3bpbN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140639.YUx3bpbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140639.YUx3bpbN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nf_conntrack_core.c: In function '__nf_conntrack_alloc':
   net/netfilter/nf_conntrack_core.c:1497:16: warning: array subscript 0 is outside the bounds of an interior zero-length array 'u8[0]' {aka 'unsigned char[]'} [-Wzero-length-bounds]
    1497 |         memset(&ct->__nfct_init_offset[0], 0,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/netfilter/nf_conntrack_core.c:40:
   ./include/net/netfilter/nf_conntrack.h:88:12: note: while referencing '__nfct_init_offset'
      88 |         u8 __nfct_init_offset[0];
         |            ^~~~~~~~~~~~~~~~~~
>> net/netfilter/nf_conntrack_core.c:1017: warning: Function parameter or member 'reply_hash' not described in 'nf_ct_resolve_clash'
>> net/netfilter/nf_conntrack_core.c:1017: warning: Excess function parameter 'hash_reply' description in 'nf_ct_resolve_clash'


vim +1017 net/netfilter/nf_conntrack_core.c

cc12c927ac504e Florian Westphal  2023-11-02   980  
6199b71796bcaa Florian Westphal  2023-11-02   981  /**
6199b71796bcaa Florian Westphal  2023-11-02   982   * nf_ct_resolve_clash - attempt to handle clash without packet drop
6199b71796bcaa Florian Westphal  2023-11-02   983   *
6199b71796bcaa Florian Westphal  2023-11-02   984   * @skb: skb that causes the clash
6199b71796bcaa Florian Westphal  2023-11-02   985   * @h: tuplehash of the clashing entry already in table
cc12c927ac504e Florian Westphal  2023-11-02   986   * @hash_reply: hash slot for reply direction
6199b71796bcaa Florian Westphal  2023-11-02   987   *
6199b71796bcaa Florian Westphal  2023-11-02   988   * A conntrack entry can be inserted to the connection tracking table
6199b71796bcaa Florian Westphal  2023-11-02   989   * if there is no existing entry with an identical tuple.
6199b71796bcaa Florian Westphal  2023-11-02   990   *
6199b71796bcaa Florian Westphal  2023-11-02   991   * If there is one, @skb (and the assocated, unconfirmed conntrack) has
6199b71796bcaa Florian Westphal  2023-11-02   992   * to be dropped.  In case @skb is retransmitted, next conntrack lookup
6199b71796bcaa Florian Westphal  2023-11-02   993   * will find the already-existing entry.
6199b71796bcaa Florian Westphal  2023-11-02   994   *
6199b71796bcaa Florian Westphal  2023-11-02   995   * The major problem with such packet drop is the extra delay added by
6199b71796bcaa Florian Westphal  2023-11-02   996   * the packet loss -- it will take some time for a retransmit to occur
6199b71796bcaa Florian Westphal  2023-11-02   997   * (or the sender to time out when waiting for a reply).
6199b71796bcaa Florian Westphal  2023-11-02   998   *
6199b71796bcaa Florian Westphal  2023-11-02   999   * This function attempts to handle the situation without packet drop.
6199b71796bcaa Florian Westphal  2023-11-02  1000   *
6199b71796bcaa Florian Westphal  2023-11-02  1001   * If @skb has no NAT transformation or if the colliding entries are
6199b71796bcaa Florian Westphal  2023-11-02  1002   * exactly the same, only the to-be-confirmed conntrack entry is discarded
6199b71796bcaa Florian Westphal  2023-11-02  1003   * and @skb is associated with the conntrack entry already in the table.
6199b71796bcaa Florian Westphal  2023-11-02  1004   *
cc12c927ac504e Florian Westphal  2023-11-02  1005   * Failing that, the new, unconfirmed conntrack is still added to the table
cc12c927ac504e Florian Westphal  2023-11-02  1006   * provided that the collision only occurs in the ORIGINAL direction.
cc12c927ac504e Florian Westphal  2023-11-02  1007   * The new entry will be added after the existing one in the hash list,
cc12c927ac504e Florian Westphal  2023-11-02  1008   * so packets in the ORIGINAL direction will continue to match the existing
cc12c927ac504e Florian Westphal  2023-11-02  1009   * entry.  The new entry will also have a fixed timeout so it expires --
cc12c927ac504e Florian Westphal  2023-11-02  1010   * due to the collision, it will not see bidirectional traffic.
cc12c927ac504e Florian Westphal  2023-11-02  1011   *
6199b71796bcaa Florian Westphal  2023-11-02  1012   * Returns NF_DROP if the clash could not be resolved.
6199b71796bcaa Florian Westphal  2023-11-02  1013   */
115dffa33ea6f5 Florian Westphal  2023-11-02  1014  static __cold noinline int
cc12c927ac504e Florian Westphal  2023-11-02  1015  nf_ct_resolve_clash(struct sk_buff *skb, struct nf_conntrack_tuple_hash *h,
cc12c927ac504e Florian Westphal  2023-11-02  1016  		    u32 reply_hash)
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01 @1017  {
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1018  	/* This is the conntrack entry already in hashes that won race. */
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1019  	struct nf_conn *ct = nf_ct_tuplehash_to_ctrack(h);
b3480fe059ac91 Florian Westphal  2017-08-12  1020  	const struct nf_conntrack_l4proto *l4proto;
6199b71796bcaa Florian Westphal  2023-11-02  1021  	enum ip_conntrack_info ctinfo;
6199b71796bcaa Florian Westphal  2023-11-02  1022  	struct nf_conn *loser_ct;
6199b71796bcaa Florian Westphal  2023-11-02  1023  	struct net *net;
94ebb264459f97 Florian Westphal  2023-11-02  1024  	int ret;
6199b71796bcaa Florian Westphal  2023-11-02  1025  
6199b71796bcaa Florian Westphal  2023-11-02  1026  	loser_ct = nf_ct_get(skb, &ctinfo);
94ebb264459f97 Florian Westphal  2023-11-02  1027  	net = nf_ct_net(loser_ct);
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1028  
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1029  	l4proto = __nf_ct_l4proto_find(nf_ct_l3num(ct), nf_ct_protonum(ct));
6199b71796bcaa Florian Westphal  2023-11-02  1030  	if (!l4proto->allow_clash)
6199b71796bcaa Florian Westphal  2023-11-02  1031  		goto drop;
6199b71796bcaa Florian Westphal  2023-11-02  1032  
94ebb264459f97 Florian Westphal  2023-11-02  1033  	ret = __nf_ct_resolve_clash(skb, h);
94ebb264459f97 Florian Westphal  2023-11-02  1034  	if (ret == NF_ACCEPT)
94ebb264459f97 Florian Westphal  2023-11-02  1035  		return ret;
6199b71796bcaa Florian Westphal  2023-11-02  1036  
cc12c927ac504e Florian Westphal  2023-11-02  1037  	ret = nf_ct_resolve_clash_harder(skb, reply_hash);
cc12c927ac504e Florian Westphal  2023-11-02  1038  	if (ret == NF_ACCEPT)
cc12c927ac504e Florian Westphal  2023-11-02  1039  		return ret;
cc12c927ac504e Florian Westphal  2023-11-02  1040  
6199b71796bcaa Florian Westphal  2023-11-02  1041  drop:
94ebb264459f97 Florian Westphal  2023-11-02  1042  	nf_ct_add_to_dying_list(loser_ct);
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1043  	NF_CT_STAT_INC(net, drop);
94ebb264459f97 Florian Westphal  2023-11-02  1044  	NF_CT_STAT_INC(net, insert_failed);
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1045  	return NF_DROP;
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1046  }
71d8c47fc65371 Pablo Neira Ayuso 2016-05-01  1047  

:::::: The code at line 1017 was first introduced by commit
:::::: 71d8c47fc653711c41bc3282e5b0e605b3727956 netfilter: conntrack: introduce clash resolution on insertion race

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
