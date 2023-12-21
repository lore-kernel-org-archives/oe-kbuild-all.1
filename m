Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5A06E2D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcszJB5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703162573; x=1734698573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVGT0evuWmsRqcq/pYtfhyq4uQiNum3hFH+oW905lfk=;
  b=LcszJB5A1WAmiXYT2FrDbtEAr0SVdrN9sJZOs8I+RXHsdJLDx5gHYuRy
   7i/O4GwTtVPruJA+ptB5OvIsD/yv0NJkAG45pmv60ylSVCOAu/d4Hl44v
   2JSrXdL4K3EaSOwhTVTg06VVb8hdFjaFcM72NWs3y6oLG2LWkbcOUaMhl
   D3PfDaSTsDY6EJJmYgTkh5r3Ceu/ykZJrV0CJhPIzQD12p6PMQyrKQvKk
   XLT36hFkHv2mH6NzQMyjUVjiqS6Anf6KtXzY2NmjP5o6VHIFB51IXWoc0
   SI4D+KNn/Ai1NgzopKmZaKa7T2McfH+wjlt7hKQB/E/qDnPOP6NTV2Ht9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="14653198"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="14653198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 04:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="920316273"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="920316273"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2023 04:42:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGIO1-0008Kt-0k;
	Thu, 21 Dec 2023 12:42:49 +0000
Date: Thu, 21 Dec 2023 20:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] net/bridge/br_input.c:232:2:
 error: implicit declaration of function 'nf_hook_state_init'
Message-ID: <202312212049.mzN3jH7K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0add751dfb191891de5e64494462c737870f879c
commit: b37eb4523002250e2382e8c5e0d8380ad349c6b6 [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: arm64-randconfig-003-20231221 (https://download.01.org/0day-ci/archive/20231221/202312212049.mzN3jH7K-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231221/202312212049.mzN3jH7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312212049.mzN3jH7K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bridge/br_input.c:232:2: error: implicit declaration of function 'nf_hook_state_init' [-Werror,-Wimplicit-function-declaration]
           nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
           ^
   net/bridge/br_input.c:232:2: note: did you mean 'ethtool_stats_init'?
   include/linux/ethtool.h:254:20: note: 'ethtool_stats_init' declared here
   static inline void ethtool_stats_init(u64 *stats, unsigned int n)
                      ^
>> net/bridge/br_input.c:237:13: error: implicit declaration of function 'nf_hook_entry_hookfn' [-Werror,-Wimplicit-function-declaration]
                   verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
                             ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=n] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/nf_hook_state_init +232 net/bridge/br_input.c

971502d77faa50 Florian Westphal 2019-04-11  227  
b37eb452300225 Norihiko Hama    2023-12-15  228  	e = rcu_dereference(get_nf_hooks_bridge(net)[NF_BR_PRE_ROUTING]);
971502d77faa50 Florian Westphal 2019-04-11  229  	if (!e)
971502d77faa50 Florian Westphal 2019-04-11  230  		goto frame_finish;
971502d77faa50 Florian Westphal 2019-04-11  231  
971502d77faa50 Florian Westphal 2019-04-11 @232  	nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
971502d77faa50 Florian Westphal 2019-04-11  233  			   NFPROTO_BRIDGE, skb->dev, NULL, NULL,
971502d77faa50 Florian Westphal 2019-04-11  234  			   net, br_handle_frame_finish);
971502d77faa50 Florian Westphal 2019-04-11  235  
971502d77faa50 Florian Westphal 2019-04-11  236  	for (i = 0; i < e->num_hook_entries; i++) {
971502d77faa50 Florian Westphal 2019-04-11 @237  		verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
971502d77faa50 Florian Westphal 2019-04-11  238  		switch (verdict & NF_VERDICT_MASK) {
971502d77faa50 Florian Westphal 2019-04-11  239  		case NF_ACCEPT:
223fd0adfa8af3 Florian Westphal 2019-04-11  240  			if (BR_INPUT_SKB_CB(skb)->br_netfilter_broute) {
223fd0adfa8af3 Florian Westphal 2019-04-11  241  				*pskb = skb;
223fd0adfa8af3 Florian Westphal 2019-04-11  242  				return RX_HANDLER_PASS;
223fd0adfa8af3 Florian Westphal 2019-04-11  243  			}
971502d77faa50 Florian Westphal 2019-04-11  244  			break;
971502d77faa50 Florian Westphal 2019-04-11  245  		case NF_DROP:
971502d77faa50 Florian Westphal 2019-04-11  246  			kfree_skb(skb);
971502d77faa50 Florian Westphal 2019-04-11  247  			return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  248  		case NF_QUEUE:
0d9cb300acad29 Florian Westphal 2019-07-02  249  			ret = nf_queue(skb, &state, i, verdict);
971502d77faa50 Florian Westphal 2019-04-11  250  			if (ret == 1)
971502d77faa50 Florian Westphal 2019-04-11  251  				continue;
971502d77faa50 Florian Westphal 2019-04-11  252  			return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  253  		default: /* STOLEN */
971502d77faa50 Florian Westphal 2019-04-11  254  			return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  255  		}
971502d77faa50 Florian Westphal 2019-04-11  256  	}
971502d77faa50 Florian Westphal 2019-04-11  257  frame_finish:
971502d77faa50 Florian Westphal 2019-04-11  258  	net = dev_net(skb->dev);
971502d77faa50 Florian Westphal 2019-04-11  259  	br_handle_frame_finish(net, NULL, skb);
971502d77faa50 Florian Westphal 2019-04-11  260  #else
971502d77faa50 Florian Westphal 2019-04-11  261  	br_handle_frame_finish(dev_net(skb->dev), NULL, skb);
971502d77faa50 Florian Westphal 2019-04-11  262  #endif
971502d77faa50 Florian Westphal 2019-04-11  263  	return RX_HANDLER_CONSUMED;
971502d77faa50 Florian Westphal 2019-04-11  264  }
971502d77faa50 Florian Westphal 2019-04-11  265  

:::::: The code at line 232 was first introduced by commit
:::::: 971502d77faa50a37c89bc6d172450294ad9a5fd bridge: netfilter: unroll NF_HOOK helper in bridge input path

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
