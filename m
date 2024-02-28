Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46FC15D5AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709134981; cv=none; b=UgmCgc37M55TBW+LER+Iy3BHAoouOWEVaDWh0q+P5BfR7VM7cOCrHNf6BPf2zgjcotCCw3Oq636Xvds1vRrKQk554FwiMVJ1W34Io/1n5GdvaiN8DQvyLBSH1FR0iXBF1qa879TQe/nx/znH5KhOnbLATjqzcR2rtauptvRijms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709134981; c=relaxed/simple;
	bh=vl8PYl/LWXp0ABSUZmMfsFs74W9PLzppKnRl9I1Aqfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l79LldQQeVM9Tn5BnLTYJ2PgTaMgd1RQKYvBwit+bc89nIWb/IAdPFA7h8+26MhUAomb5aS92HVoKfyeIpXaZH0uFrWcGCNJ9hrAw9nRkFdrKluMs+jMm3umLsM8Xb/1ad8rKX3PY7FrmALaNieAItGFvtVvs8pdzd1YVBICkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6NryrjM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6NryrjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709134980; x=1740670980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vl8PYl/LWXp0ABSUZmMfsFs74W9PLzppKnRl9I1Aqfc=;
  b=S6NryrjMXtxFi6IgJybFW2HfVXln3LSErJPYAy8phYXHEOoRNgKJ3YR4
   SH2orgKV7sVw1fthW5yD/7A82IZbsoClrJLzGpmzZd7tboVqNsW343YGu
   aj3alizYdMcVx4aMT4jj8tx7Shjfb0Kdy+8qUzFlYlSZvPRN70VxdWooi
   EM0tbb6LCRChH9gtTT0bbAKLUrsh06p3HEBufooFM9snVEtEfVV7UlPOW
   j8CHDANecrgBheINxPXbQlbcwZ6+7lL9FXHgtZIH+6CDrhez8xCDFHX83
   aysmSqghldX2+8AFZ8duBDRT2TX17TZDVfF0aOWSYiPkhVqFiwyc/ODfs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3659971"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3659971"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 07:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="38492991"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Feb 2024 07:42:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfM59-000CBH-1t;
	Wed, 28 Feb 2024 15:42:55 +0000
Date: Wed, 28 Feb 2024 23:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] net/bridge/br_input.c:250:2:
 error: implicit declaration of function 'nf_hook_state_init' is invalid in
 C99
Message-ID: <202402282314.aLcjaIWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   34cf02fef9dac23a59f87d70744be09b1d11cdde
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: arm64-randconfig-001-20240227 (https://download.01.org/0day-ci/archive/20240228/202402282314.aLcjaIWt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282314.aLcjaIWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282314.aLcjaIWt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bridge/br_input.c:250:2: error: implicit declaration of function 'nf_hook_state_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
           ^
   net/bridge/br_input.c:250:2: note: did you mean 'ethtool_stats_init'?
   include/linux/ethtool.h:281:20: note: 'ethtool_stats_init' declared here
   static inline void ethtool_stats_init(u64 *stats, unsigned int n)
                      ^
>> net/bridge/br_input.c:255:13: error: implicit declaration of function 'nf_hook_entry_hookfn' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
                             ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=n] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=m] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


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
