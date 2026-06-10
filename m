Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517D1271A94
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781063171; cv=none; b=mbJVxFPVS/0UuNpPYg/fjhkAnY8pUAE7v1fIgFRoDVeM85XuUgBlpVNYTVKCgUcSahMJb2/4zQv5wHEwNquU0chhU5uvJPL+10mLklXs729oCOxoAVVDSnNV1FEid6algKUr2SnKvUeQJgZa0bShQHcp0zE11kOw/kdtJVpKDgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781063171; c=relaxed/simple;
	bh=WZH1kB944GfLo/FzNL5Y2xZGz2ZKOpjpuNU4HyBtkaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bSiwtgVE8B0TJxMSRx3+gzJhn6PFFrGVNRupehJ9imksFevK6ZXcc2TcTly0THt9cIx6cF+h5LeNmq7PQwGXICXBOxOYLXl6fG5Cn0qrcjtBaS29oyK1Pm6WvJquIHMydznCqDRyJCqHF5+z3XhwC9ojxBHFspG8WQ96p6ZtFIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGxtieor; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGxtieor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781063170; x=1812599170;
  h=date:from:to:cc:subject:message-id;
  bh=WZH1kB944GfLo/FzNL5Y2xZGz2ZKOpjpuNU4HyBtkaI=;
  b=DGxtieor8ZiQOnWJTOheOd/fHoGLjPwIoqf9na0tpp572B/q0apunssB
   +8etWTav/o26993MK849GjxW2Xq+dRBwTCqjsoqWOFcnwA3GXbpQFH5DI
   99OiT66qNbM5zQ6j62RQJg/tNSYOcyOONWBKCZm1zZot2bLPG/ohpgURq
   h+QgqtCfFkRNxVLoQOQ8K73gsgv97xrKe32AkKUjAU+mmHSqcWU5Auwbr
   iegnEx11aIW2aZoAs2apyI0ZlU5R87VV4D3OKtXO1S5Wgk3ZmZxniGXIt
   W7qceQP6aPN1/c26aDg1E3jB7khlNfhf9P04CGcXkTlbZGvHGNCrP/azu
   A==;
X-CSE-ConnectionGUID: IwjoxVIBS8e9JAlBay1HrQ==
X-CSE-MsgGUID: jeQwoOvaRSWlK7mTtbRcLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85474430"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85474430"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:46:10 -0700
X-CSE-ConnectionGUID: 0hP+sgP3TrGMYbgJ/VF2WQ==
X-CSE-MsgGUID: YLtZTY/SSiy662bTLs1aOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="249973097"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2026 20:46:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX9tG-00000000KsC-0i7e;
	Wed, 10 Jun 2026 03:46:06 +0000
Date: Wed, 10 Jun 2026 11:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10849/12670]
 net/netfilter/nf_conntrack_proto.c:181:35: sparse: sparse: incorrect type in
 assignment (different modifiers)
Message-ID: <202606101159.Vu84QuuO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: ac46f3f35b6e68fb062ae7cf780d516c0cf4c00a [10849/12670] netfilter: nf_conntrack_helper: add refcounting from datapath
config: x86_64-randconfig-123-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101159.Vu84QuuO-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101159.Vu84QuuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101159.Vu84QuuO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_conntrack_proto.c:181:35: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *helper_cb )( ... ) @@     got int ( [noderef] * )( ... ) @@
   net/netfilter/nf_conntrack_proto.c:181:35: sparse:     expected int ( *helper_cb )( ... )
   net/netfilter/nf_conntrack_proto.c:181:35: sparse:     got int ( [noderef] * )( ... )
--
>> net/netfilter/nf_conntrack_ovs.c:66:19: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *helper_cb )( ... ) @@     got int ( [noderef] * )( ... ) @@
   net/netfilter/nf_conntrack_ovs.c:66:19: sparse:     expected int ( *helper_cb )( ... )
   net/netfilter/nf_conntrack_ovs.c:66:19: sparse:     got int ( [noderef] * )( ... )

vim +181 net/netfilter/nf_conntrack_proto.c

   127	
   128	unsigned int nf_confirm(void *priv,
   129				struct sk_buff *skb,
   130				const struct nf_hook_state *state)
   131	{
   132		int (*helper_cb)(struct sk_buff *skb, unsigned int protoff,
   133				 struct nf_conn *ct,
   134				 enum ip_conntrack_info conntrackinfo);
   135		const struct nf_conn_help *help;
   136		enum ip_conntrack_info ctinfo;
   137		unsigned int protoff;
   138		struct nf_conn *ct;
   139		bool seqadj_needed;
   140		__be16 frag_off;
   141		int start;
   142		u8 pnum;
   143	
   144		ct = nf_ct_get(skb, &ctinfo);
   145		if (!ct || in_vrf_postrouting(state))
   146			return NF_ACCEPT;
   147	
   148		help = nfct_help(ct);
   149	
   150		seqadj_needed = test_bit(IPS_SEQ_ADJUST_BIT, &ct->status) && !nf_is_loopback_packet(skb);
   151		if (!help && !seqadj_needed)
   152			return nf_conntrack_confirm(skb);
   153	
   154		/* helper->help() do not expect ICMP packets */
   155		if (ctinfo == IP_CT_RELATED_REPLY)
   156			return nf_conntrack_confirm(skb);
   157	
   158		switch (nf_ct_l3num(ct)) {
   159		case NFPROTO_IPV4:
   160			protoff = skb_network_offset(skb) + ip_hdrlen(skb);
   161			break;
   162		case NFPROTO_IPV6:
   163			pnum = ipv6_hdr(skb)->nexthdr;
   164			start = ipv6_skip_exthdr(skb, sizeof(struct ipv6hdr), &pnum, &frag_off);
   165			if (start < 0 || (frag_off & htons(~0x7)) != 0)
   166				return nf_conntrack_confirm(skb);
   167	
   168			protoff = start;
   169			break;
   170		default:
   171			return nf_conntrack_confirm(skb);
   172		}
   173	
   174		if (help) {
   175			const struct nf_conntrack_helper *helper;
   176			int ret;
   177	
   178			/* rcu_read_lock()ed by nf_hook */
   179			helper = rcu_dereference(help->helper);
   180			if (helper) {
 > 181				helper_cb = rcu_dereference(helper->help);
   182				if (helper_cb) {
   183					ret = helper_cb(skb, protoff,
   184							ct, ctinfo);
   185					if (ret != NF_ACCEPT)
   186						return ret;
   187				}
   188			}
   189		}
   190	
   191		if (seqadj_needed &&
   192		    !nf_ct_seq_adjust(skb, ct, ctinfo, protoff)) {
   193			NF_CT_STAT_INC_ATOMIC(nf_ct_net(ct), drop);
   194			return NF_DROP;
   195		}
   196	
   197		/* We've seen it coming out the other side: confirm it */
   198		return nf_conntrack_confirm(skb);
   199	}
   200	EXPORT_SYMBOL_GPL(nf_confirm);
   201	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
