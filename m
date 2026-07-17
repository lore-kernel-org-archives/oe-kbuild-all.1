Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA2F384242
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 10:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282748; cv=none; b=gaPK0TVDqCZyzwLup/qWd5hD/juVA/JUQyj9KPvPCnjBM17otcpQai2ejdqrbnS/ViqaAJR0s5EmaaGRuoA9tbvEbTepHkuKQAPICpJm1Ec8wPTcUz12r97+7igJkzCupjlOQZw82Ea8cZbWsNCpcP+fH+EYsPwAFzS0zbIHSxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282748; c=relaxed/simple;
	bh=sSW+NxtQkCg44YDW3fBQaMLK6HgEM0HZFMNZzZ4TI/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cmd6maQsg/e40s/sOMGMb1sT8xOuPkR10lJ4o3LW1zRGP58NKgyAxSEed8WajEj4aXD8AJ1Ehts9Ixwt1j/XEpKybpOKBrr+HTMR4+STQOrje4QJ2HN7H/Az6C8zTB8fVhB/O3pPbhcIK6C2dr/7i1liNNi7N93irl81gD3d5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvAKGlPH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvAKGlPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784282746; x=1815818746;
  h=date:from:to:cc:subject:message-id;
  bh=sSW+NxtQkCg44YDW3fBQaMLK6HgEM0HZFMNZzZ4TI/w=;
  b=gvAKGlPHB6HUd8+VKagL+wjZd+RCpCFOr4H37PdjQhb54eNCTVyK1xtK
   bpBBOrnggO5nTaO8j04Ec5k23acbrO9u+9gfTV39+uiPh+FsdbWPlHPYv
   mEk1vgo6J7GVdQ7n8WO6v9ZSOcbDfFWLQDeDjHU+h7RgXVDcF9HZWEJrL
   1u34Oy0qYHw6iesB/S2muy8xwtOfiJ4idxQ4VXOj0X8nqF/qo3VWONMyu
   vVcFweKqL8ZSLM/4cA5nTjbooRS5KRkA90z+ooBVUSwjdkQ5fgcB5StCv
   9iNMdtwH4PYHJyLdlLgkt7S4Ea/4dL8NLvarnXMlIoDsuplS5xxjgBwuh
   A==;
X-CSE-ConnectionGUID: 8bpzsjn6R9CEow+Ucue36w==
X-CSE-MsgGUID: Yr2RGIk/TRGjP0Z73enVfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="72487399"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="72487399"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:05:46 -0700
X-CSE-ConnectionGUID: XZz7J2nQRN+FX8lVQWLAMA==
X-CSE-MsgGUID: N/JxftixQfaNwUTuUji6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="286828960"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Jul 2026 03:05:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkfRk-00000000ScO-0E3n;
	Fri, 17 Jul 2026 10:05:36 +0000
Date: Fri, 17 Jul 2026 18:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: net/netfilter/nf_conntrack_ovs.c:66:19: sparse: sparse:
 incorrect type in assignment (different modifiers)
Message-ID: <202607171742.63buVftr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
commit: ac46f3f35b6e68fb062ae7cf780d516c0cf4c00a netfilter: nf_conntrack_helper: add refcounting from datapath
date:   6 weeks ago
config: x86_64-randconfig-r134-20260717 (https://download.01.org/0day-ci/archive/20260717/202607171742.63buVftr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171742.63buVftr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac46f3f35b6e ("netfilter: nf_conntrack_helper: add refcounting from datapath")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171742.63buVftr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_conntrack_ovs.c:66:19: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *helper_cb )( ... ) @@     got int ( [noderef] * )( ... ) @@
   net/netfilter/nf_conntrack_ovs.c:66:19: sparse:     expected int ( *helper_cb )( ... )
   net/netfilter/nf_conntrack_ovs.c:66:19: sparse:     got int ( [noderef] * )( ... )

vim +66 net/netfilter/nf_conntrack_ovs.c

    10	
    11	/* 'skb' should already be pulled to nh_ofs. */
    12	int nf_ct_helper(struct sk_buff *skb, struct nf_conn *ct,
    13			 enum ip_conntrack_info ctinfo, u16 proto)
    14	{
    15		int (*helper_cb)(struct sk_buff *skb, unsigned int protoff,
    16				 struct nf_conn *ct,
    17				 enum ip_conntrack_info conntrackinfo);
    18		const struct nf_conntrack_helper *helper;
    19		const struct nf_conn_help *help;
    20		unsigned int protoff;
    21		int err;
    22	
    23		if (ctinfo == IP_CT_RELATED_REPLY)
    24			return NF_ACCEPT;
    25	
    26		help = nfct_help(ct);
    27		if (!help)
    28			return NF_ACCEPT;
    29	
    30		helper = rcu_dereference(help->helper);
    31		if (!helper)
    32			return NF_ACCEPT;
    33	
    34		if (helper->tuple.src.l3num != NFPROTO_UNSPEC &&
    35		    helper->tuple.src.l3num != proto)
    36			return NF_ACCEPT;
    37	
    38		switch (proto) {
    39		case NFPROTO_IPV4:
    40			protoff = ip_hdrlen(skb);
    41			proto = ip_hdr(skb)->protocol;
    42			break;
    43		case NFPROTO_IPV6: {
    44			u8 nexthdr = ipv6_hdr(skb)->nexthdr;
    45			__be16 frag_off;
    46			int ofs;
    47	
    48			ofs = ipv6_skip_exthdr(skb, sizeof(struct ipv6hdr), &nexthdr,
    49					       &frag_off);
    50			if (ofs < 0 || (frag_off & htons(~0x7)) != 0) {
    51				pr_debug("proto header not found\n");
    52				return NF_ACCEPT;
    53			}
    54			protoff = ofs;
    55			proto = nexthdr;
    56			break;
    57		}
    58		default:
    59			WARN_ONCE(1, "helper invoked on non-IP family!");
    60			return NF_DROP;
    61		}
    62	
    63		if (helper->tuple.dst.protonum != proto)
    64			return NF_ACCEPT;
    65	
  > 66		helper_cb = rcu_dereference(helper->help);
    67		if (!helper_cb)
    68			return NF_ACCEPT;
    69	
    70		err = helper_cb(skb, protoff, ct, ctinfo);
    71		if (err != NF_ACCEPT)
    72			return err;
    73	
    74		/* Adjust seqs after helper.  This is needed due to some helpers (e.g.,
    75		 * FTP with NAT) adusting the TCP payload size when mangling IP
    76		 * addresses and/or port numbers in the text-based control connection.
    77		 */
    78		if (test_bit(IPS_SEQ_ADJUST_BIT, &ct->status) &&
    79		    !nf_ct_seq_adjust(skb, ct, ctinfo, protoff))
    80			return NF_DROP;
    81		return NF_ACCEPT;
    82	}
    83	EXPORT_SYMBOL_GPL(nf_ct_helper);
    84	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
