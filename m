Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD36249FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705521023; cv=none; b=qRJri2vb+fojMqxpoDOwioSzzMcNvCvUQGQZUVAFTHpe1GOKLOXaHGgasWUDutKAQLz7RtqrNsH8pYOqDyaOeLioY3j9QDtEnwgJaZdVWA9CJAs0SZ9lsM2NmJDyrOqVW78ztStoT0mxCFpUcaMJMrb+RDe1fag8+0DIBSVof2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705521023; c=relaxed/simple;
	bh=7uWsevCJg8hxIjynqHfTSYwg9Bcxoqr0Q2bfh3tEKlo=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=V2piW0L2Cgf6hYVhDOzQqKWf4a50Wv+kSUwVxHXqnKoY7Ivw5rwEFvKfTYczinutJtIE/u9W59TtiBlZzF7iTbouG7ey/uc3MdhQt2xQ/usQiHrHfOZRB/ZtiFz6K1CpDIljlxQiS8zrKDse0aEV6aB+3qLdAhslGn9buUtG41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUxtdAyH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUxtdAyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705521021; x=1737057021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7uWsevCJg8hxIjynqHfTSYwg9Bcxoqr0Q2bfh3tEKlo=;
  b=nUxtdAyHY8Y38rseNTFmbxlYEf0V4MZTFqgKbJaiip9l9OQjghKXiaOo
   LJlyVdF2ukRb7hg4tTKu3WEkaEFmNfQ1hdzn0c6AJ2I/z3KoBtCHxCUVl
   l/X9KXz7u1MFIxBMLhiXCp8BydjgKa5Y4iQcn3MY6nwBfw3klvIdhVo1a
   cFIyQu7FSvqNCQRKjuvgASnKGReYgd6zfbaGvqjYODMJ8liY0SppK22kY
   uTFakYG2zTvUzVluts6KMRKFL3rkQ13wCTdjR5/riSpxjcjKWGA/YIAfp
   fzkA+0UD/R/Yzo3MIaqobYpQF8G+lDPX3Vl8zIMzptz6EOyIefAzE5eZ5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7349225"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7349225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 11:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="18915506"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2024 11:50:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQBvR-0002Ic-1G;
	Wed, 17 Jan 2024 19:50:13 +0000
Date: Thu, 18 Jan 2024 03:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] net/bridge/br_input.c:250:2:
 error: call to undeclared function 'nf_hook_state_init'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202401180303.MilqE8p3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   899194d7e9095594e35bb0097dc0e3e2c7d8a0e6
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: x86_64-randconfig-123-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180303.MilqE8p3-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180303.MilqE8p3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180303.MilqE8p3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bridge/br_input.c:250:2: error: call to undeclared function 'nf_hook_state_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     250 |         nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
         |         ^
   net/bridge/br_input.c:250:2: note: did you mean 'ethtool_stats_init'?
   include/linux/ethtool.h:281:20: note: 'ethtool_stats_init' declared here
     281 | static inline void ethtool_stats_init(u64 *stats, unsigned int n)
         |                    ^
>> net/bridge/br_input.c:255:13: error: call to undeclared function 'nf_hook_entry_hookfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |                 verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
         |                           ^
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
