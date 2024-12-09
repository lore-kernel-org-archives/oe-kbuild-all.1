Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E002323315A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 20:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733776284; cv=none; b=d+TZ/nPQFs444dqj5hUQEZm/jz5hWi9smHO1F/0B6uUaJU1GrnGKbl713UUgn5k+FigHpE6IFKCMhNOzxeBQmATeRP2zita2tK3LDfdQqyc3s5RHhBGCBKAmfilkxUIcfgFU6w4ZsDriI7DDyOHf9AGrx43YYTw/0qXAFIe9AqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733776284; c=relaxed/simple;
	bh=AFY0S9pXVO8hIvwBkgQ58s5+Qp0Zitw7Y5TH45QhJ9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r/I48tW/sPyQxWHpj5ASfh4PPnlojJqaE8DTsNsqHXEejij/0Aef1i814kWlrRdgdEqqDHkmovXji2iybIRQjt3Yysz865skLzfBaNuDDIMqqXaN8USLI4VbA3ImX9ksQVoA9ucO7F+WgoYpmnTI9vUY9T1wiLtoUtlyEqaFj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMhCoN2B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMhCoN2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733776283; x=1765312283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFY0S9pXVO8hIvwBkgQ58s5+Qp0Zitw7Y5TH45QhJ9Q=;
  b=XMhCoN2BPBldGR23IuM3hJZCO9zMkeg0HeHK121yupdub9QabfLolHDW
   Gyjjf95sWwgxoV/I92IJwmAgggRIUun8g5BrOaec0BvZw5mWzYTlbe+Mq
   w396129gaLDqHwJdU/eWlT5D3ml0lyvmXQmNDx4aggRNATRhui91UMeI3
   Bae97fY5pfVCdzV6KjE3XxJMT/bslSaHLHZW7X/+t5dMRStHo0sA4TE84
   o/2pTlpQZKG6AcyGArneVmQvzK6Dk2GZh4ipx1AB8qwxOwVGGH3Af2t7e
   Uh0tfnFgzFimpJHBagowF02VXsJ8weT/DuiMxxbh75ARTbZugIQGh7Rht
   Q==;
X-CSE-ConnectionGUID: 2hPPrInKQ6uunzyK0eVnWw==
X-CSE-MsgGUID: PPShX8YlQiGW60WCNvKGcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56575007"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="56575007"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:31:22 -0800
X-CSE-ConnectionGUID: WTUTJDFmT0+ceQh+/wFr/w==
X-CSE-MsgGUID: Cdi3eW9iTamHkUKBvGudNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95531531"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Dec 2024 12:31:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKkPW-0004n7-2v;
	Mon, 09 Dec 2024 20:31:18 +0000
Date: Tue, 10 Dec 2024 04:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] net/bridge/br_input.c:250:9:
 error: implicit declaration of function 'nf_hook_state_init'; did you mean
 'ethtool_stats_init'?
Message-ID: <202412100444.OpDmqPq0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   d8ccecb7c200eae3534aa3b56c84aba4045cc802
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: x86_64-buildonly-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100444.OpDmqPq0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100444.OpDmqPq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100444.OpDmqPq0-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bridge/br_input.c: In function 'nf_hook_bridge_pre':
>> net/bridge/br_input.c:250:9: error: implicit declaration of function 'nf_hook_state_init'; did you mean 'ethtool_stats_init'? [-Werror=implicit-function-declaration]
     250 |         nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
         |         ^~~~~~~~~~~~~~~~~~
         |         ethtool_stats_init
>> net/bridge/br_input.c:255:27: error: implicit declaration of function 'nf_hook_entry_hookfn' [-Werror=implicit-function-declaration]
     255 |                 verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
         |                           ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=n] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +250 net/bridge/br_input.c

971502d77faa50a Florian Westphal 2019-04-11  245  
bc4d82ee40515f0 Norihiko Hama    2023-12-15  246  	e = rcu_dereference(get_nf_hooks_bridge(net)[NF_BR_PRE_ROUTING]);
971502d77faa50a Florian Westphal 2019-04-11  247  	if (!e)
971502d77faa50a Florian Westphal 2019-04-11  248  		goto frame_finish;
971502d77faa50a Florian Westphal 2019-04-11  249  
971502d77faa50a Florian Westphal 2019-04-11 @250  	nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
971502d77faa50a Florian Westphal 2019-04-11  251  			   NFPROTO_BRIDGE, skb->dev, NULL, NULL,
971502d77faa50a Florian Westphal 2019-04-11  252  			   net, br_handle_frame_finish);
971502d77faa50a Florian Westphal 2019-04-11  253  
971502d77faa50a Florian Westphal 2019-04-11  254  	for (i = 0; i < e->num_hook_entries; i++) {
971502d77faa50a Florian Westphal 2019-04-11 @255  		verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
971502d77faa50a Florian Westphal 2019-04-11  256  		switch (verdict & NF_VERDICT_MASK) {
971502d77faa50a Florian Westphal 2019-04-11  257  		case NF_ACCEPT:
223fd0adfa8af36 Florian Westphal 2019-04-11  258  			if (BR_INPUT_SKB_CB(skb)->br_netfilter_broute) {
223fd0adfa8af36 Florian Westphal 2019-04-11  259  				*pskb = skb;
223fd0adfa8af36 Florian Westphal 2019-04-11  260  				return RX_HANDLER_PASS;
223fd0adfa8af36 Florian Westphal 2019-04-11  261  			}
971502d77faa50a Florian Westphal 2019-04-11  262  			break;
971502d77faa50a Florian Westphal 2019-04-11  263  		case NF_DROP:
971502d77faa50a Florian Westphal 2019-04-11  264  			kfree_skb(skb);
971502d77faa50a Florian Westphal 2019-04-11  265  			return RX_HANDLER_CONSUMED;
971502d77faa50a Florian Westphal 2019-04-11  266  		case NF_QUEUE:
0d9cb300acad29f Florian Westphal 2019-07-02  267  			ret = nf_queue(skb, &state, i, verdict);
971502d77faa50a Florian Westphal 2019-04-11  268  			if (ret == 1)
971502d77faa50a Florian Westphal 2019-04-11  269  				continue;
971502d77faa50a Florian Westphal 2019-04-11  270  			return RX_HANDLER_CONSUMED;
971502d77faa50a Florian Westphal 2019-04-11  271  		default: /* STOLEN */
971502d77faa50a Florian Westphal 2019-04-11  272  			return RX_HANDLER_CONSUMED;
971502d77faa50a Florian Westphal 2019-04-11  273  		}
971502d77faa50a Florian Westphal 2019-04-11  274  	}
971502d77faa50a Florian Westphal 2019-04-11  275  frame_finish:
971502d77faa50a Florian Westphal 2019-04-11  276  	net = dev_net(skb->dev);
971502d77faa50a Florian Westphal 2019-04-11  277  	br_handle_frame_finish(net, NULL, skb);
971502d77faa50a Florian Westphal 2019-04-11  278  #else
971502d77faa50a Florian Westphal 2019-04-11  279  	br_handle_frame_finish(dev_net(skb->dev), NULL, skb);
971502d77faa50a Florian Westphal 2019-04-11  280  #endif
971502d77faa50a Florian Westphal 2019-04-11  281  	return RX_HANDLER_CONSUMED;
971502d77faa50a Florian Westphal 2019-04-11  282  }
971502d77faa50a Florian Westphal 2019-04-11  283  

:::::: The code at line 250 was first introduced by commit
:::::: 971502d77faa50a37c89bc6d172450294ad9a5fd bridge: netfilter: unroll NF_HOOK helper in bridge input path

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
