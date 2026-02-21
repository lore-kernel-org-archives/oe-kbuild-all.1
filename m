Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB31F419A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771659661; cv=none; b=UeeeSXxUW2CqnfwhM4gOKD0mf6EWYHz5+ZNiN8O61u9snyeoguvJNyHwiu29d9FjxC3XWGZhnACW3g7Qu8lDR8efWyigQLlBx37H7C+wtZqAQGHGXJ7JAEL3VwZY7uHUvljdHhOsMsiUA2p4yQcrOG2++O9FlfyF4F/We2uG9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771659661; c=relaxed/simple;
	bh=izP/bmoi7lWOZXQuoIiAji/dI43688F0DB4avjp0qGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sbBDF0sEpSSwJZ+8HNpUzKqaQIXSWQ8pAwgEusU/T2OntXfvGp5EBQIzHTVaWN32KmmfrgiS0nG+FLbgbAH+rDUCI1PxAhlZh7MCCT/5CpKdCY/UwYbTNWsn8c5f/pBSYiOgje5pgqfD71h7Vf7tf9RWa5IvYjxLzvMkUPZ/+XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOVY2vms; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOVY2vms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771659660; x=1803195660;
  h=date:from:to:cc:subject:message-id;
  bh=izP/bmoi7lWOZXQuoIiAji/dI43688F0DB4avjp0qGI=;
  b=WOVY2vmsm+04uBqDT+lfIV3KgogzdKoRRT//wpB7v6U2LmUATpAmsIJf
   yW/m30uVgPRK6QOxLLyo+UrPuDC3EELAKMAmOUyRPdArPm0SHutNEKGVZ
   /vZ1Ru6NPVEPF2YJjEN99VxNxSqg2ZFtqRThuJ4F77D2VjLCBYDAyhXcF
   03xoNDge/thA6fgtNys1Y79sTaKTv7b+Ya+MQy+yb5B+ceveCtD3ILfQb
   UOPgSK/X/KkwE543edK9fAT4R9Hd6ppGmEIOePqYFsSxM4vOQz5SBwzt+
   9LWzaz2XHxboGackUMl6H/FHJL6ZX632hCJNsu0oFfnf/l5g+G860JfNE
   Q==;
X-CSE-ConnectionGUID: CWNS3yJdSkerZ7oSEcx7yw==
X-CSE-MsgGUID: fnVEZ9rxSo2lUdZupbFrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72444441"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72444441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 23:40:59 -0800
X-CSE-ConnectionGUID: MhxGgPeNTKaO8OLIaAqb7A==
X-CSE-MsgGUID: OSagnfdTReKRk+EPyct5EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219196817"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Feb 2026 23:40:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vthbj-000000014mu-37OP;
	Sat, 21 Feb 2026 07:40:55 +0000
Date: Sat, 21 Feb 2026 15:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 net/bridge/br_input.c:250:2: error: implicit declaration of function
 'nf_hook_state_init'; did you mean 'ethtool_stats_init'?
Message-ID: <202602211526.kmZL6yCq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Norihiko,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8494a7f300ccb411a478c4833c50b5333703bb2b
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: arm-randconfig-002-20260221 (https://download.01.org/0day-ci/archive/20260221/202602211526.kmZL6yCq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211526.kmZL6yCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211526.kmZL6yCq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bridge/br_input.c: In function 'nf_hook_bridge_pre':
>> net/bridge/br_input.c:250:2: error: implicit declaration of function 'nf_hook_state_init'; did you mean 'ethtool_stats_init'? [-Werror=implicit-function-declaration]
     nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
     ^~~~~~~~~~~~~~~~~~
     ethtool_stats_init
>> net/bridge/br_input.c:255:13: error: implicit declaration of function 'nf_hook_entry_hookfn' [-Werror=implicit-function-declaration]
      verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
                ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=y] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=y] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]


vim +250 net/bridge/br_input.c

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
