Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8EA2940D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742953252; cv=none; b=HC2V97ikK8sMjCR7b912OSIGnsn3mSGAMi3lSgYDG14aQL4Z+V1At08cTWyA1qzmUSctmoRBCDT5ko9tn0kgW5lWcwj6cMwINE3ggPt/qcvhmsNjaihXhC3T2s4XbjHJjcLhqUg7jZvrKMl9iMWedMhAAMLS8yeeXj4txVl/PNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742953252; c=relaxed/simple;
	bh=zZdVDQWRc0cckNqgv6G7QQDfZ80r9WFuuveH0n7oU4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmnY3p98Hs+fZ+eA1Akz2Vh27TsZCAL/q3Ei+kKVvl+cBwwD8HR1QeuO+9tQoq60dri/KxArmGf7Ei8Unm9jW0hxQUO6SsZ8sX3DUZAQ6QlRIsThbeBWehbdG/aR/uaC6jZTfFljfV8vR/yinRgdQkMZ4ECh5iM8p066rx1d3vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PL9qSddv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PL9qSddv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742953251; x=1774489251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zZdVDQWRc0cckNqgv6G7QQDfZ80r9WFuuveH0n7oU4I=;
  b=PL9qSddvMx+n8M5JotWX4Tg7fu3d6tA++S/ljQVUZRMKCLabICH830ZD
   8LjbJy2R6Q3RQFp2fABu1HXmW5MIY+h1VOaGFUdsGuORsDQMdvuX3x+9D
   xAfL8uTAuZ5EtNoJCn4XpxPPdoEcXA0AZGFAs7nb1dcXoX+8lZFPGKTUG
   si6TPtJ9hO3kw+AEsdKBJ5Mu7qMTDGjEvrCS+nCRx6vzcUI4tasDw4lYt
   +em6pmSseU+j8XdcWzMlFXQP/x3P7vrgPPvURGncIIZdHevp4W6yu9rZ0
   Z5PItSoO0f6qqSIiV8yF42YfZb8F4N+dyZ+lSMgZXxqBSa/wwvIv66C/o
   g==;
X-CSE-ConnectionGUID: 0yyySwE/R6qakte0Xmo3NQ==
X-CSE-MsgGUID: LSEgJxh5TxCbNJZFNOQ/wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46962803"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="46962803"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:34:46 -0700
X-CSE-ConnectionGUID: tR/4LslCRNaPDPY8NZhwvg==
X-CSE-MsgGUID: +ZuxDDorTkmOBx0qnDP39w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="155479561"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2025 18:34:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txFfG-0005Mj-1F;
	Wed, 26 Mar 2025 01:34:42 +0000
Date: Wed, 26 Mar 2025 09:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2] net/bridge/br_input.c:250:2:
 error: implicit declaration of function 'nf_hook_state_init'; did you mean
 'ethtool_stats_init'?
Message-ID: <202503260910.Ns6XCMY5-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b18db21117e28ab165172b815f106006a87eb7d9
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [2/2] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: arm64-randconfig-003-20250326 (https://download.01.org/0day-ci/archive/20250326/202503260910.Ns6XCMY5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260910.Ns6XCMY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260910.Ns6XCMY5-lkp@intel.com/

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
