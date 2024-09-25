Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3C1714CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727271203; cv=none; b=nuc9MLJuDmJaajboVLNddY9FYyFHMCr3cMyzJ5ponFVMyudHoh3mTdJPiSfBTAoPqSdoXmlE8t5pqEiusoX9kAThnbxn7pt1/FJ/WmC2sRmd5Qa8b/wjyfG6+Xuu5OWOhIcintNDYbPTkKrFL6PGYS7bnBVznyFyoN0QOBClyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727271203; c=relaxed/simple;
	bh=CPgoKe5EGHT0sak6xTJumgC1j6F7u/YilwlL48kcl/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzMFZmwZxsfi6wsWklnwHM8kGjL9QBxgosG6OzmFKe0lbocDR3ipvyE85ZniHfqJSvATO0Y12h0TT09uoSz3wb17Pk7FYusKXx1v20fcqTWoj3vSC35NI0uxYduz0vogDpVryZrHTUj44OuR9cCh/XNFLL2C7fQl76WMjYyggNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5BfLH/r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5BfLH/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727271201; x=1758807201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CPgoKe5EGHT0sak6xTJumgC1j6F7u/YilwlL48kcl/U=;
  b=M5BfLH/rpCfSpA96dizPp8FvV8yJAuHT65389qK3zXkPfkrq74xV3XI0
   tAMCditM9LNBXQ7ojcVqvsaSyz9D0GCLmtADmfwyCjWkYeSk0LqGJX0VK
   vZgU+YMjT/hi6vCdT2i37Yf5qvEaLPEucNjTEeOElOu2arq0Kul4OlTvV
   LvHy1kXO0dP15PX5ootz4n7GH2JHvhnzSfFbGF99d48TVrWb/n0sBFcPD
   CKwzlpD785dtM8l8vTJt6eDKIwujInFQkjGtymTgfBw08Nal1IWyJetYe
   c318ofVrwaKgT5kuzFptA1kUrhq9Lmly3PC5IXDzryZCCm4DFROd2us0z
   A==;
X-CSE-ConnectionGUID: 8NZ7wwtFStaIR9ALAv7CuA==
X-CSE-MsgGUID: vv5rnX2oRiSmPBuLYspPJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="13941360"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="13941360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 06:33:20 -0700
X-CSE-ConnectionGUID: bPOW0TS9RhC7aKq/BnF48Q==
X-CSE-MsgGUID: qIY08UXUSOWaG8vcXUnilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72592936"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2024 06:33:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stS8r-000JZL-19;
	Wed, 25 Sep 2024 13:33:17 +0000
Date: Wed, 25 Sep 2024 21:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] net/bridge/br_input.c:250:2:
 error: call to undeclared function 'nf_hook_state_init'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202409252148.BfpmlLqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   03b93dc707ed9ffeff2aac734f578ba445b5f764
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: x86_64-randconfig-073-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252148.BfpmlLqx-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252148.BfpmlLqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252148.BfpmlLqx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bridge/br_input.c:250:2: error: call to undeclared function 'nf_hook_state_init'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
           ^
   net/bridge/br_input.c:250:2: note: did you mean 'ethtool_stats_init'?
   include/linux/ethtool.h:281:20: note: 'ethtool_stats_init' declared here
   static inline void ethtool_stats_init(u64 *stats, unsigned int n)
                      ^
>> net/bridge/br_input.c:255:13: error: call to undeclared function 'nf_hook_entry_hookfn'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
                             ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=y] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/nf_hook_state_init +250 net/bridge/br_input.c

971502d77faa50 Florian Westphal 2019-04-11  245  
bc4d82ee40515f Norihiko Hama    2023-12-15  246  	e = rcu_dereference(get_nf_hooks_bridge(net)[NF_BR_PRE_ROUTING]);
971502d77faa50 Florian Westphal 2019-04-11  247  	if (!e)
971502d77faa50 Florian Westphal 2019-04-11  248  		goto frame_finish;
971502d77faa50 Florian Westphal 2019-04-11  249  
971502d77faa50 Florian Westphal 2019-04-11 @250  	nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
971502d77faa50 Florian Westphal 2019-04-11  251  			   NFPROTO_BRIDGE, skb->dev, NULL, NULL,
971502d77faa50 Florian Westphal 2019-04-11  252  			   net, br_handle_frame_finish);
971502d77faa50 Florian Westphal 2019-04-11  253  
971502d77faa50 Florian Westphal 2019-04-11  254  	for (i = 0; i < e->num_hook_entries; i++) {
971502d77faa50 Florian Westphal 2019-04-11 @255  		verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
971502d77faa50 Florian Westphal 2019-04-11  256  		switch (verdict & NF_VERDICT_MASK) {
971502d77faa50 Florian Westphal 2019-04-11  257  		case NF_ACCEPT:
223fd0adfa8af3 Florian Westphal 2019-04-11  258  			if (BR_INPUT_SKB_CB(skb)->br_netfilter_broute) {
223fd0adfa8af3 Florian Westphal 2019-04-11  259  				*pskb = skb;
223fd0adfa8af3 Florian Westphal 2019-04-11  260  				return RX_HANDLER_PASS;
223fd0adfa8af3 Florian Westphal 2019-04-11  261  			}
971502d77faa50 Florian Westphal 2019-04-11  262  			break;
971502d77faa50 Florian Westphal 2019-04-11  263  		case NF_DROP:
971502d77faa50 Florian Westphal 2019-04-11  264  			kfree_skb(skb);
971502d77faa50 Florian Westphal 2019-04-11  265  			return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  266  		case NF_QUEUE:
0d9cb300acad29 Florian Westphal 2019-07-02  267  			ret = nf_queue(skb, &state, i, verdict);
971502d77faa50 Florian Westphal 2019-04-11  268  			if (ret == 1)
971502d77faa50 Florian Westphal 2019-04-11  269  				continue;
971502d77faa50 Florian Westphal 2019-04-11  270  			return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  271  		default: /* STOLEN */
971502d77faa50 Florian Westphal 2019-04-11  272  			return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  273  		}
971502d77faa50 Florian Westphal 2019-04-11  274  	}
971502d77faa50 Florian Westphal 2019-04-11  275  frame_finish:
971502d77faa50 Florian Westphal 2019-04-11  276  	net = dev_net(skb->dev);
971502d77faa50 Florian Westphal 2019-04-11  277  	br_handle_frame_finish(net, NULL, skb);
971502d77faa50 Florian Westphal 2019-04-11  278  #else
971502d77faa50 Florian Westphal 2019-04-11  279  	br_handle_frame_finish(dev_net(skb->dev), NULL, skb);
971502d77faa50 Florian Westphal 2019-04-11  280  #endif
971502d77faa50 Florian Westphal 2019-04-11  281  	return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  282  }
971502d77faa50 Florian Westphal 2019-04-11  283  

:::::: The code at line 250 was first introduced by commit
:::::: 971502d77faa50a37c89bc6d172450294ad9a5fd bridge: netfilter: unroll NF_HOOK helper in bridge input path

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
