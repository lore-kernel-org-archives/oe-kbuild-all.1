Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F23EE1EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 11:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796064; cv=none; b=mETtDm2Pa3mPouUV68/FMb29OaoPn+xPdnvHcy6Prh0XShv7fnhj3HJac0a20ZKZ/hs1zWTBLvw1Ub1oxhvIfaAjMMAHkxWMj98piwMDLtmBxadQ9vE9PRvQlpSsdvXzfVrWJ13ORNJXVhbZBXUHYoUGPt1x0wWDcjKThSzfKIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796064; c=relaxed/simple;
	bh=Hkml/jRjTPg4rtSAD5UhSNaFmIFVO41E0yXWO32n0pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sm4OOFZbPy07kxe8wvl+pFR8OEZ2bTSGDlBYc0HDBeORVnSLtXVwRWnf61uh4ZP2Qx6GeUY9T0KgJvZg7SEIvLmLBTMJdaTb0CDiJmwWfu7nF1nJ17L+tCtJ8Q7VbYYemFigMZ0+y8LKf5u2USit3Y+HveYVo7DYijvVUMFJxtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9eHpDLK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9eHpDLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779796059; x=1811332059;
  h=date:from:to:cc:subject:message-id;
  bh=Hkml/jRjTPg4rtSAD5UhSNaFmIFVO41E0yXWO32n0pw=;
  b=k9eHpDLKCw9HFcHmziPU4tZmC/7iRdQnb4umwuP25ohJt/GvVd9DIC4V
   zsdwF41+Q1MdTR8IbyO/+pxhvYIemBdMi7y1kDVlhw+fwJTynBL8BBnwy
   9gOL6sS87CdtsIYozIGj9mq/B719tYQ9qxyw4MvHcinnYQJwhtrshRdi5
   PML8u534972xzxrO93hH1JX39zm6w9Rh3ClXOb1rOJ/HhLGmZXuBQoFf5
   Uyy1SvCHByIlZn5HMb9N3OrxyRXKpEVd96xKEXHsMch0HoWLohalwDtEL
   Cu394Et9F++i9o7gCJE0DUSWvvVWFGXU3hP0kdM/+hm7wObc12S0pNL7k
   A==;
X-CSE-ConnectionGUID: s/T6P0BYRReNLCsp5pk5yQ==
X-CSE-MsgGUID: CFC0ybqWTcymCJO+hQPZ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80720299"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80720299"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:47:32 -0700
X-CSE-ConnectionGUID: Hr9v5PDQR4+i3pbh61SYdA==
X-CSE-MsgGUID: ff5zxh1GT+iJinwlcSPLUQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 May 2026 04:47:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRqFt-00000000COj-1rAp;
	Tue, 26 May 2026 11:47:29 +0000
Date: Tue, 26 May 2026 13:47:10 +0200
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/netfilter/nf_conntrack_ovs.c:31:19: error: 'const struct
 nf_conntrack_helper' has no member named 'tuple'
Message-ID: <202605261329.w7bYhBB8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/netfilter-nf_conntrack_helper-do-not-hash-by-tuple/20260522-130418
head:   883ccf421e36cd870e2b18fa94755528a668d3b9
commit: 4dc863a09204f9be74df2cfcc7568f4997ac6ec4 netfilter: conntrack: get rid of tuple in helper definitions
date:   4 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260526/202605261329.w7bYhBB8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261329.w7bYhBB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261329.w7bYhBB8-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/nf_conntrack_ovs.c: In function 'nf_ct_helper':
>> net/netfilter/nf_conntrack_ovs.c:31:19: error: 'const struct nf_conntrack_helper' has no member named 'tuple'
      31 |         if (helper->tuple.src.l3num != NFPROTO_UNSPEC &&
         |                   ^~
   net/netfilter/nf_conntrack_ovs.c:32:19: error: 'const struct nf_conntrack_helper' has no member named 'tuple'
      32 |             helper->tuple.src.l3num != proto)
         |                   ^~
   net/netfilter/nf_conntrack_ovs.c:60:19: error: 'const struct nf_conntrack_helper' has no member named 'tuple'
      60 |         if (helper->tuple.dst.protonum != proto)
         |                   ^~
--
   net/sched/act_ct.c: In function 'tcf_ct_dump_helper':
>> net/sched/act_ct.c:1527:57: error: 'const struct nf_conntrack_helper' has no member named 'tuple'
    1527 |             nla_put_u8(skb, TCA_CT_HELPER_FAMILY, helper->tuple.src.l3num) ||
         |                                                         ^~
   net/sched/act_ct.c:1528:56: error: 'const struct nf_conntrack_helper' has no member named 'tuple'
    1528 |             nla_put_u8(skb, TCA_CT_HELPER_PROTO, helper->tuple.dst.protonum))
         |                                                        ^~


vim +31 net/netfilter/nf_conntrack_ovs.c

c0c3ab63de603b Xin Long 2023-02-07  10  
c0c3ab63de603b Xin Long 2023-02-07  11  /* 'skb' should already be pulled to nh_ofs. */
c0c3ab63de603b Xin Long 2023-02-07  12  int nf_ct_helper(struct sk_buff *skb, struct nf_conn *ct,
c0c3ab63de603b Xin Long 2023-02-07  13  		 enum ip_conntrack_info ctinfo, u16 proto)
c0c3ab63de603b Xin Long 2023-02-07  14  {
c0c3ab63de603b Xin Long 2023-02-07  15  	const struct nf_conntrack_helper *helper;
c0c3ab63de603b Xin Long 2023-02-07  16  	const struct nf_conn_help *help;
c0c3ab63de603b Xin Long 2023-02-07  17  	unsigned int protoff;
c0c3ab63de603b Xin Long 2023-02-07  18  	int err;
c0c3ab63de603b Xin Long 2023-02-07  19  
c0c3ab63de603b Xin Long 2023-02-07  20  	if (ctinfo == IP_CT_RELATED_REPLY)
c0c3ab63de603b Xin Long 2023-02-07  21  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  22  
c0c3ab63de603b Xin Long 2023-02-07  23  	help = nfct_help(ct);
c0c3ab63de603b Xin Long 2023-02-07  24  	if (!help)
c0c3ab63de603b Xin Long 2023-02-07  25  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  26  
c0c3ab63de603b Xin Long 2023-02-07  27  	helper = rcu_dereference(help->helper);
c0c3ab63de603b Xin Long 2023-02-07  28  	if (!helper)
c0c3ab63de603b Xin Long 2023-02-07  29  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  30  
c0c3ab63de603b Xin Long 2023-02-07 @31  	if (helper->tuple.src.l3num != NFPROTO_UNSPEC &&
c0c3ab63de603b Xin Long 2023-02-07  32  	    helper->tuple.src.l3num != proto)
c0c3ab63de603b Xin Long 2023-02-07  33  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  34  
c0c3ab63de603b Xin Long 2023-02-07  35  	switch (proto) {
c0c3ab63de603b Xin Long 2023-02-07  36  	case NFPROTO_IPV4:
c0c3ab63de603b Xin Long 2023-02-07  37  		protoff = ip_hdrlen(skb);
c0c3ab63de603b Xin Long 2023-02-07  38  		proto = ip_hdr(skb)->protocol;
c0c3ab63de603b Xin Long 2023-02-07  39  		break;
c0c3ab63de603b Xin Long 2023-02-07  40  	case NFPROTO_IPV6: {
c0c3ab63de603b Xin Long 2023-02-07  41  		u8 nexthdr = ipv6_hdr(skb)->nexthdr;
c0c3ab63de603b Xin Long 2023-02-07  42  		__be16 frag_off;
c0c3ab63de603b Xin Long 2023-02-07  43  		int ofs;
c0c3ab63de603b Xin Long 2023-02-07  44  
c0c3ab63de603b Xin Long 2023-02-07  45  		ofs = ipv6_skip_exthdr(skb, sizeof(struct ipv6hdr), &nexthdr,
c0c3ab63de603b Xin Long 2023-02-07  46  				       &frag_off);
c0c3ab63de603b Xin Long 2023-02-07  47  		if (ofs < 0 || (frag_off & htons(~0x7)) != 0) {
c0c3ab63de603b Xin Long 2023-02-07  48  			pr_debug("proto header not found\n");
c0c3ab63de603b Xin Long 2023-02-07  49  			return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  50  		}
c0c3ab63de603b Xin Long 2023-02-07  51  		protoff = ofs;
c0c3ab63de603b Xin Long 2023-02-07  52  		proto = nexthdr;
c0c3ab63de603b Xin Long 2023-02-07  53  		break;
c0c3ab63de603b Xin Long 2023-02-07  54  	}
c0c3ab63de603b Xin Long 2023-02-07  55  	default:
c0c3ab63de603b Xin Long 2023-02-07  56  		WARN_ONCE(1, "helper invoked on non-IP family!");
c0c3ab63de603b Xin Long 2023-02-07  57  		return NF_DROP;
c0c3ab63de603b Xin Long 2023-02-07  58  	}
c0c3ab63de603b Xin Long 2023-02-07  59  
c0c3ab63de603b Xin Long 2023-02-07  60  	if (helper->tuple.dst.protonum != proto)
c0c3ab63de603b Xin Long 2023-02-07  61  		return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  62  
c0c3ab63de603b Xin Long 2023-02-07  63  	err = helper->help(skb, protoff, ct, ctinfo);
c0c3ab63de603b Xin Long 2023-02-07  64  	if (err != NF_ACCEPT)
c0c3ab63de603b Xin Long 2023-02-07  65  		return err;
c0c3ab63de603b Xin Long 2023-02-07  66  
c0c3ab63de603b Xin Long 2023-02-07  67  	/* Adjust seqs after helper.  This is needed due to some helpers (e.g.,
c0c3ab63de603b Xin Long 2023-02-07  68  	 * FTP with NAT) adusting the TCP payload size when mangling IP
c0c3ab63de603b Xin Long 2023-02-07  69  	 * addresses and/or port numbers in the text-based control connection.
c0c3ab63de603b Xin Long 2023-02-07  70  	 */
c0c3ab63de603b Xin Long 2023-02-07  71  	if (test_bit(IPS_SEQ_ADJUST_BIT, &ct->status) &&
c0c3ab63de603b Xin Long 2023-02-07  72  	    !nf_ct_seq_adjust(skb, ct, ctinfo, protoff))
c0c3ab63de603b Xin Long 2023-02-07  73  		return NF_DROP;
c0c3ab63de603b Xin Long 2023-02-07  74  	return NF_ACCEPT;
c0c3ab63de603b Xin Long 2023-02-07  75  }
c0c3ab63de603b Xin Long 2023-02-07  76  EXPORT_SYMBOL_GPL(nf_ct_helper);
c0c3ab63de603b Xin Long 2023-02-07  77  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
