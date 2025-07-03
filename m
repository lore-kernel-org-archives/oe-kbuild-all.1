Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6984226888
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 03:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512402; cv=none; b=qOMlWjN7nR/IvhLbT5Vlw3+SdagO8zU921nqtNpWhIWPmFDTZrTRWc6KVtztozgzBHPeGbdY7a8FkdQ5XXD9pm0sMFUXRNsrwfrX9JwKmSRwB+ihKw21tKinpwp7r91FxsvUMn9Bf6y5BniOrwXHra3LvJ3ElusWTQveSLf90pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512402; c=relaxed/simple;
	bh=ID37U0b3QDZQf68lecOi7IpQMUh3R9EqKtzZiblr6Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Act4wz+YzknAEVtzdywEhWuvmb9hwTtLaZzOdd6+YsqHRwkydV5v8qlr9lrmx4ZYBb6E+of7ear5NHCVNMTMElmS/wee1F78RbALVdb7GJ64k+UcKk3gkTybOz1HRu+j3xRutLPkM5ViBnVspp2yCpMp8lWJTTmgx8vlRaeHAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRwF8EYr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRwF8EYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751512400; x=1783048400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ID37U0b3QDZQf68lecOi7IpQMUh3R9EqKtzZiblr6Kk=;
  b=NRwF8EYrbLNshw7LWGrJjDaX8fLccnr00PHkl94vWml6WUWmdmm+ts3I
   LzyIe/NN3E4cZ2I7XrF8fi3Qrx/ksgKJ9v1DNh9uMjUmX0qFwpGvky1As
   FGHwu2M2K5VPlKJKx7lmOVfP4JeoTTi643rzmGMzbMHRGTpEKY0AC8lqX
   9eATw+4eKBWXur0lrIUufvkF3IvW2jJwCyvZxsa0vKgnhlYheEhmhk8Yg
   U09TlqHTWbhUff6zr/r1CrQuDP1CDtMVi/GYatQqTrl0Z2nPh97r4H5hL
   r598GuC5PbCnPdgEk2Ily1lirk1JvX1zyLft2qOJ4fuLswEa/VwI4gv8w
   A==;
X-CSE-ConnectionGUID: Fs80yOFlRE2AgDKQOfMqAg==
X-CSE-MsgGUID: BeWsVKMmTaaU50ZTLqsrDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71261545"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="71261545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 20:13:19 -0700
X-CSE-ConnectionGUID: 1aizeRulSyKifUp8nrBspw==
X-CSE-MsgGUID: vMNhnjcDSNqbdR0Hz/CJuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="159756454"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 20:13:18 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXANw-0000OT-00;
	Thu, 03 Jul 2025 03:13:16 +0000
Date: Thu, 3 Jul 2025 05:13:07 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Wei <luwei32@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 net/netfilter/nf_conntrack_core.c:1017: warning: Function parameter or
 member 'reply_hash' not described in 'nf_ct_resolve_clash'
Message-ID: <202507030549.czVv179y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   382711115afc1197da2c288679079946650ef017
commit: cc12c927ac504e99fc176ea49e85226b6aeadcd5 [1605/1605] netfilter: conntrack: allow insertion of clashing entries
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250703/202507030549.czVv179y-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030549.czVv179y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030549.czVv179y-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
