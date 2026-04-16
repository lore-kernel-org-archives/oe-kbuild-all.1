Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DBF21A95D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776320132; cv=none; b=XdK5TzGNZTUVJK4XN9bQ+RcvNavtccLkcGoH5L2adG24jHDi0JHwOkH5VJt7CsJVoITR5vvARozu/NMRvTVxSKYK4ythkwa8fXtapTu+T8D3ejCKEIJht4KmgSCE2wv8WWk6oX5LyrKOT6FlqexEyWjBOqR53tTxu7wWAd6SsG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776320132; c=relaxed/simple;
	bh=DR+j6KLNEiyH6FvI4Vjv920MCUutAjbHZDLpavFQriI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ETv4bM579Nuhl2QVPRepN6kujPlpi5bHTJgPCih/Ana7g0WIbahpZSZv5vnTUlcso6hDDVDTzMpxFWf0YjXxycQv3adF0Pu401eVOniFwHJEnyi6038YwNK4fKSMR1ZB3BW9hH7G5bjRd3Em1rb33YDsHFzbEi/hOItEQks9EeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqUNS6Qy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqUNS6Qy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776320132; x=1807856132;
  h=date:from:to:cc:subject:message-id;
  bh=DR+j6KLNEiyH6FvI4Vjv920MCUutAjbHZDLpavFQriI=;
  b=BqUNS6QyuyTxnhaKGbvCRmTMHaaLvmnfg5nBPWaB1c7a4o0esAiABWyX
   6A99H/I1YxXJZEoc5/ydkoFSbopBAccy1zxDZad/7+fLe697rWdaW2/Rf
   8y6xwZ6P/9R8nDNgrWfozzCwvkRSMkHi7k9vFqlPhVVTKzx6mdhiMVVCC
   I72HfL60DIm+ZFYCpginnUgVaElZfByEGzlent7QhWm1PjmJ7a9bdtha5
   8K1oJg+P/9wFREfMCVNmh/YnxWQ8rIR1JVdiALX+i2xn/vy7gJdAwQ1KU
   RwAZ+qtnlEseO7nN5RP+ByOvxLFFLQzhN8yOzJdQrhCL7JN3F8lYxzgOR
   g==;
X-CSE-ConnectionGUID: z9Jo7Kg8RI+gDzYltnQlbQ==
X-CSE-MsgGUID: TlIx3DhFRMCx6IhJkQ4T2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88760904"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="88760904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 23:15:31 -0700
X-CSE-ConnectionGUID: cJoARmtIS36J/RtTmgQ5xQ==
X-CSE-MsgGUID: xhigS4aeSKGY5rQkj1pnVQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2026 23:15:29 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDG0d-000000001La-0z5G;
	Thu, 16 Apr 2026 06:15:27 +0000
Date: Thu, 16 Apr 2026 14:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Florian Westphal <fw@strlen.de>
Subject: [linux-next:master 2847/5095]
 net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to non-scalar
Message-ID: <202604161410.SDaInial-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   936c21068d7ade00325e40d82bfd2f3f29d9f659
commit: 36a3200575642846a96436d503d46544533bb943 [2847/5095] netfilter: nft_synproxy: avoid possible data-race on update operation
config: alpha-randconfig-r134-20260416 (https://download.01.org/0day-ci/archive/20260416/202604161410.SDaInial-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161410.SDaInial-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161410.SDaInial-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to non-scalar
>> net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast from non-scalar

vim +51 net/netfilter/nft_synproxy.c

    43	
    44	static void nft_synproxy_eval_v4(const struct nft_synproxy *priv,
    45					 struct nft_regs *regs,
    46					 const struct nft_pktinfo *pkt,
    47					 const struct tcphdr *tcp,
    48					 struct tcphdr *_tcph,
    49					 struct synproxy_options *opts)
    50	{
  > 51		struct nf_synproxy_info info = READ_ONCE(priv->info);
    52		struct net *net = nft_net(pkt);
    53		struct synproxy_net *snet = synproxy_pernet(net);
    54		struct sk_buff *skb = pkt->skb;
    55	
    56		if (tcp->syn) {
    57			/* Initial SYN from client */
    58			nft_synproxy_tcp_options(opts, tcp, snet, &info, priv);
    59			synproxy_send_client_synack(net, skb, tcp, opts);
    60			consume_skb(skb);
    61			regs->verdict.code = NF_STOLEN;
    62		} else if (tcp->ack) {
    63			/* ACK from client */
    64			if (synproxy_recv_client_ack(net, skb, tcp, opts,
    65						     ntohl(tcp->seq))) {
    66				consume_skb(skb);
    67				regs->verdict.code = NF_STOLEN;
    68			} else {
    69				regs->verdict.code = NF_DROP;
    70			}
    71		}
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
