Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B9E2940D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 01:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742953250; cv=none; b=jhlltn2ohFwgv9T9t/dC5WbmCjzBPMs1H0m95u54JujXnVt7qlgkEJAm6ipGqsTqg69LcWb115LT+XJXD/BxF409yeQT/q6VxGVebumUYAc5QWODXKUZ3nd65JXsmD9VhFYA+3aZIqVu+fGsf9orgH+bkitxMtfuKDC6bNDwdLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742953250; c=relaxed/simple;
	bh=T3Zd6UMaC0xMzQuUKhPQJ6tIpaCMv9XFMPH2XytQIf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8ynTGe/aePhOwUoyIkOqvrNLD9s4yA7WDT3YTiUsUgbPRokjoWUmqdPq1DK0SIq1v5X2rPHEKR+20sbZSoBGBQRTKv1zO6YP0L4H6QuHcrBuULjcxwvVSjjxbxzJA7soxwUQP2AyaOrwWa64JVZ9kslTmYh5u5BF5w/fIhiHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=At5Fy516; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="At5Fy516"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742953248; x=1774489248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3Zd6UMaC0xMzQuUKhPQJ6tIpaCMv9XFMPH2XytQIf4=;
  b=At5Fy516joZmtqyUGdhxR1X6EKOk2QhTad5J+p4tv4vixUBJx/osP1pU
   HfRzP0jiENeJSqbv5Trj7FBCDCwWs7ArgfhU134+R804H/+ywuYEv9fJp
   10Ltw8jgSge2IgGaOdy2DXmWJMuh7SGBcIyhKskwE5SWGrNYDbv5xCb0e
   TFVmes+4lSlaWWtnKIakdAEOCVi+rCkrn6mPQ2j+FOz9tjSgzwSZMs6IN
   gfX2vTQmwCX4/owAx/WrXfz+SvezwgzHgNCVG7cAG65QgDx700qTcY4y9
   cbxDKB7pe/w3gV1yvDPV0FESaqT33IrMPYRva2n9PZn3RkwVpavHMEpUH
   w==;
X-CSE-ConnectionGUID: O9coD4qLRfucer+MfJsx6w==
X-CSE-MsgGUID: H5f/OYjYSeuePQgw1Xouww==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46962799"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="46962799"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:34:46 -0700
X-CSE-ConnectionGUID: EOgmfTdbQZGYcb6/zGz3nw==
X-CSE-MsgGUID: 1NWhBeD+Rm+Af4KmT05sjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="155479560"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2025 18:34:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txFfG-0005Mh-1B;
	Wed, 26 Mar 2025 01:34:42 +0000
Date: Wed, 26 Mar 2025 09:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-05 13/13]
 net/bridge/br_input.c:250:2: error: implicit declaration of function
 'nf_hook_state_init'; did you mean 'ethtool_stats_init'?
Message-ID: <202503260955.2YCdJnUU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Norihiko,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-05
head:   21c4eb1762f0c7d1daf1a88227bd5f101bcfdf78
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [13/13] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: arm64-randconfig-003-20250326 (https://download.01.org/0day-ci/archive/20250326/202503260955.2YCdJnUU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260955.2YCdJnUU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260955.2YCdJnUU-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=y] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
