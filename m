Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B438F259
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995850; cv=none; b=Mdu3OLSEkZHljovmOZtbdyA/zPIph9dmyM3exHGsbManwvw4J83b/P7h1GZcjEf5VskSuC1wVvp/rEHukrZvESv4soKjEp+a5s9FU0kjuK71zfvt5NXT0ZdH7nl8lqKexrk68agjLgI16hT0f3RXenRZfiOG01MOtE8cMf/KOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995850; c=relaxed/simple;
	bh=HduIh1jQgMDhDcp+hbiKDUUz281v2ajgZeUe8UwV5iI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gLrtI+VF064w8mGDtzKd/vV3pkiW9BqlRVLy04sejO7TNgbN9GvVV9Ncl6DyziGyKrY+YxrGxlUDyF5X/V0v8o2ojCnR4vMy/v2uOpMzBAKtMzn8Iynh7hUBhg4YB43PDykXyNsJlvKR7IaY2NC/LxdcgiVFgjNnU93lY60Jy2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PV/c/DhR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PV/c/DhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785995849; x=1817531849;
  h=date:from:to:cc:subject:message-id;
  bh=HduIh1jQgMDhDcp+hbiKDUUz281v2ajgZeUe8UwV5iI=;
  b=PV/c/DhRFaNSUGbPdDJkCnrn1KCWpZEjFJ69HCR+/bId1D27wgO2pByN
   qmNj1rCFcRPUwzOc4FH1pNlZIgv4BafVt1Y7w3vGhXLffCrvoYSjfGywD
   Hnj3CsWr4uIFiHvNM8vpePE4bKDY0AqG+JigfA83ddPAmsZwe22/u4kkm
   Vt1hLHMSadXDnOtVm1lLir8SPdsn9QLmGqo2MsP62KBkhP9uGxYgTDSCg
   3F+Apy8gzEp8Kf3JyeooDVmt4j87lAw63I8Zm+KsnZ/fAdQvPfTxTvDrs
   u3e3kTSxp7lq/vZ1INW0CGGesFhOsdkDIDUhHSYDWBs/wuseS0kKkT+Br
   A==;
X-CSE-ConnectionGUID: c8nF/dieQFCKxfUZO7MeLA==
X-CSE-MsgGUID: XcjWxrQkQkC6sl10A8L6BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97177121"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="97177121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 22:57:29 -0700
X-CSE-ConnectionGUID: iIHYcveBSkOuxso/4Oxngg==
X-CSE-MsgGUID: MBOaixE7R4iIyO11b4CzIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="267153538"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2026 22:57:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrr6a-00000000EJB-1tho;
	Thu, 06 Aug 2026 05:57:24 +0000
Date: Thu, 06 Aug 2026 13:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Westphal <fw@strlen.de>
Subject: net/netfilter/nft_synproxy.c:51:40: sparse: sparse: cast to
 non-scalar
Message-ID: <202608061318.wOHp4d3r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: 36a3200575642846a96436d503d46544533bb943 netfilter: nft_synproxy: avoid possible data-race on update operation
date:   7 months ago
config: alpha-randconfig-r111-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061318.wOHp4d3r-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061318.wOHp4d3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 36a320057564 ("netfilter: nft_synproxy: avoid possible data-race on update operation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061318.wOHp4d3r-lkp@intel.com/

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
