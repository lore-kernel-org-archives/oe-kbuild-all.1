Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793073434;
	b=ZkY3Bolhn8YsrXbOHIt9Jj/05J6kNwCWH70sPgrBw2iim1BfD/ws4NgtLCtOwJi9Q6wR
	 GioRiv3YT5tMpKCFJitqvTn8Qg0HjURlJHFeESicAxlA1p6tF/hA5ilYAOikENa9AC4yG
	 ujAHZnNyGFp7H7ZhwXBMzQw5CLVX3ODs3aqEfD4tWqfmK2aBIFA2KZIzgnu3RmqAdL9KJ
	 SR0GQyyXDZsSkwvYCrPXgjUgNma//QKbSLWeTsSNwIUnt1igAYaSNGSvmM0NzzOSV5gJc
	 z6ZRKrK7etSNRqpqgEJ5m/BSmfvL0UapNVqZpuK6v/B47NbwSYZV5piY9Aqpjfrv/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793073434;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RCYyNi26HwHl5e/I9JNbZrfSyNUcpQp0et8Q0GKncaY=;
	b=epaQ0tO/LB3HFjjCQspTbQplHbnLzreD9s78JYcFMNGl8P+lm0JpTZcFQlI9GWkwSzSB
	 E5YeBhIlmugut7/yLhXdZHRxWjFtcFdZvypYzBgwggk7RY8h8bSr8k9DUk1Oay17raCbp
	 H+gn/sPBzqn7xMSFZCMgy6lyUBzaAlx2V4jYHDbDr3GKq7GxuzYvSO9ZzKKDLm+7g5r7z
	 pfXMFkXTD6+zBCESKmDww6V1+/KWebMxrQIP+kxIMeHG+t7qZ7Mr7AY5OWXWtMLoERXYg
	 1jCzYx+Tiicy+Fl10TvQ+QbpMQLpM1XRlaAJNgGZ6wP4TY4d9SzvvUIoTCoAfY+J0DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSB4Puqf;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7419606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 03:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7419606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSB4Puqf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793073433; x=1824609433;
  h=date:from:to:cc:subject:message-id;
  bh=gc72R0MNVdI+lxM3IVEynUykMvRGMXdTCERGq8pJuFo=;
  b=CSB4PuqfmGq2/XRnBFNlw7RGipy5K4eELO6yQpAvbWY6TJ+gPhUHu0ul
   ygqOzT1E9FzQcH6f89aMgIZiA08FVZ59kNfM8JNeHSFujVnQR4g7lg1mj
   kxb+p1KH3Rq9F3tW5F6aA94ro8ULZi3TM5YvpH5aAfdyX9jhZDRIgE/nL
   H0rRY69url5aUVKcl0mRGVcP9q67UraTFMkRbzd7rsVXWdZDXo6OhdeIt
   ywjG72k9Xk67dNIYtaI9NxZK4uKpHM70xozDrurfm/tJ6cI0yoxgUmG9o
   fh8H0WiwtosJBJkpQLPcgb2v7uuqNuL+dvKXXd9V40+5arXPLoLKRKo38
   A==;
X-CSE-ConnectionGUID: N7UozypdSJWzRLbibDRzlg==
X-CSE-MsgGUID: WRBgPaIdTtOGGvUtaErxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1639568"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1639568"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:57:13 -0700
X-CSE-ConnectionGUID: Ls12Jr8YQsqOqIzF3+uAoA==
X-CSE-MsgGUID: PRAB5nAOSky075pkHr8NCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4525401"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Oct 2026 20:57:12 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLYJB-000000004NT-0Unl;
	Tue, 27 Oct 2026 03:57:09 +0000
Date: Tue, 27 Oct 2026 04:56:22 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 net/bridge/br_input.c:232:9: error: implicit declaration of function
 'nf_hook_state_init'; did you mean 'ethtool_stats_init'?
Message-ID: <202610270452.4eGc30Yq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Norihiko,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   25504c55fe63ecca8633c10afcfdb58573e59571
commit: b37eb4523002250e2382e8c5e0d8380ad349c6b6 [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: arm-randconfig-r2107-20261027 (https://download.01.org/0day-ci/archive/20261027/202610270452.4eGc30Yq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270452.4eGc30Yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270452.4eGc30Yq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bridge/br_input.c: In function 'nf_hook_bridge_pre':
>> net/bridge/br_input.c:232:9: error: implicit declaration of function 'nf_hook_state_init'; did you mean 'ethtool_stats_init'? [-Werror=implicit-function-declaration]
     232 |         nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
         |         ^~~~~~~~~~~~~~~~~~
         |         ethtool_stats_init
>> net/bridge/br_input.c:237:27: error: implicit declaration of function 'nf_hook_entry_hookfn' [-Werror=implicit-function-declaration]
     237 |                 verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
         |                           ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=n] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +232 net/bridge/br_input.c

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
