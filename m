Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300681A682D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772972555; cv=none; b=tcLbrnwP6bKQozYklAfCukfpImjALeKwk/NlBpK/P/bnXoJhpm/TctINi3owyXLK1r/SFBjqswuQIN5+tK9m96jTi7eh48Ti2/XiUQ1W9KRw9xetuW+TdM6nQ1UP3I5Ce/quGOrCbDIDOPRALva7yEIpkpHomPd5922FecjkcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772972555; c=relaxed/simple;
	bh=nD/IH1td5O+ygwPyl3cWGy0UddxXjrvaacSkrgJhXC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Po3Qh9mUdiJKHi+9L+RSNIHMadKQTlf8qJL1NtJujvMXoUoNUmSFziJZE/iB187Ttn3+tBjV9mHK+FBCvJZ8JKySuhTrYaSSCOLhAZzag+anvDf4SDjEBwm2Atrh7bx9cXx2dkBKyKR06NleByxZp7m5Jngi6s0LhH7spTPYJcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMoWGNOE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMoWGNOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772972553; x=1804508553;
  h=date:from:to:cc:subject:message-id;
  bh=nD/IH1td5O+ygwPyl3cWGy0UddxXjrvaacSkrgJhXC8=;
  b=NMoWGNOE0/YXh/9qa77zbyURLVr/l6SwguYRew7maTadWOPn5TEssY/E
   xxvJ9vhy1gl21zwMJCdY7qGecWyxAh8fDLmrGSshgQnXzwxBTKUQoWzb8
   xEKf0touwADH38afyUyICyxarQJRRZK1hQRI29DYJVo2ADi+F/wVwQxzc
   sPss9xdgpv50m6Kp1BOOG+vKidt0cwc50PU3x1GjipCoMUt7BrtqY401f
   poRLtu7cCa5s4EF0+5TyLXvULdtYEomIXO6BHgUOgZOXP5RIGMSEA8MAa
   9P2IZgN9pC/C4F/mAvnw717AQVKkbMWsT4cUVTs4D3l9eA6b0CWBKHcMg
   Q==;
X-CSE-ConnectionGUID: +qF/Kv33Smaqa3mj8EmLkA==
X-CSE-MsgGUID: +0jXEbESQM+ITn0ePxtQDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="84727478"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="84727478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 05:22:32 -0700
X-CSE-ConnectionGUID: bdhi8iS/Qpm+EB6tLVIE2w==
X-CSE-MsgGUID: blt6h66rRv2XiPYCH8o3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223949358"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Mar 2026 05:22:30 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzD9P-00000000364-3Nc7;
	Sun, 08 Mar 2026 12:22:27 +0000
Date: Sun, 08 Mar 2026 20:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Westphal <fw@strlen.de>
Subject: net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to
 non-scalar
Message-ID: <202603082002.ACHbGTsI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c23719abc3308df7ed3ad35650ad211fb2d2003d
commit: 36a3200575642846a96436d503d46544533bb943 netfilter: nft_synproxy: avoid possible data-race on update operation
date:   9 weeks ago
config: alpha-randconfig-r132-20260308 (https://download.01.org/0day-ci/archive/20260308/202603082002.ACHbGTsI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082002.ACHbGTsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082002.ACHbGTsI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to non-scalar
>> net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast from non-scalar
   net/netfilter/nft_synproxy.c:82:40: sparse: sparse: cast to non-scalar
   net/netfilter/nft_synproxy.c:82:40: sparse: sparse: cast from non-scalar

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
