Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632CF3932E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882717; cv=none; b=nuVDMST6QOzdvWE0ExOstGQVRSuo73wXiMqONL3EMKPgOrdx+C1tjLBbsMLJMORZQKO0iFPjNbQIWo/9iMX9uTPY5TiFv+eeOol3UuHJKuwBWmOSUREDwryNXEz20dYUKNUyJV4vmBmCejFWOvMkvToOteaK7/HWBSNTWsete6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882717; c=relaxed/simple;
	bh=+o677MN9TyTD9fD5sGdXby3ElJkrym1iEnksnT1YP2M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HSXZW768PLA1RpxHQLA35RHJtfpvhW7oqF1wB7I8L8SFnQ/qZe0xn9ptGMyzVvs4c/3RWfV7NAtRsBLnuSamZRFdUGw4Ql9CnP7WYcBr5p3F4+SzA9hKInzXdlABZXnlOHTn0BV0XYdCPBEgetsQGUUFCJKvbHvEcg1QwN5efn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbUi8Oh/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbUi8Oh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779882716; x=1811418716;
  h=date:from:to:cc:subject:message-id;
  bh=+o677MN9TyTD9fD5sGdXby3ElJkrym1iEnksnT1YP2M=;
  b=hbUi8Oh/p1+rgt9c3NpB+7wTC8SutSPUa5n1AWAKFK77zpoUORp6fzAd
   cddiDlSzaoZQ1to9qEBW31/881ZetCL/y9cNGt9NoWKAaOO5FLVEYL91a
   OuZxfwD8o7KyvIs6QdiToSEFIjI1MnI8DXgGANRp2ZRixB/z8s75Kp6TV
   AEenqQtEvtzcmkAcs8d1K6h5zgB4DRicumvU5uGISv81WWsBbadLieAN+
   m233UBjiWuwOMo7tzkT8bUMO1nef5AUHSIbBYBKb/rljRgxkp5pj5lCsI
   DQHsPbmNpFD8Y22GTrQKriW23DbX8VoHvsPyn9kVIXF6/uDxEuYXN1Rsw
   A==;
X-CSE-ConnectionGUID: X94K9yxwTy2d+KhrjbRuwQ==
X-CSE-MsgGUID: kAexMVd+QmOszGm39bS0Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84600458"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="84600458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:51:55 -0700
X-CSE-ConnectionGUID: qdeuMK7aR7urTjgbHsxyjQ==
X-CSE-MsgGUID: XdxRoAjqSzalCbeNxVINlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="266100251"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2026 04:51:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSCnf-000000003ty-1iTH;
	Wed, 27 May 2026 11:51:51 +0000
Date: Wed, 27 May 2026 19:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 net/bridge/br_input.c:232:2: error: implicit declaration of function
 'nf_hook_state_init'
Message-ID: <202605271954.sxtrCsLy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Norihiko,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   34b1c4bebdb448e83e391a070c324430ab524626
commit: b37eb4523002250e2382e8c5e0d8380ad349c6b6 [2/2] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: i386-buildonly-randconfig-003-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271954.sxtrCsLy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271954.sxtrCsLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271954.sxtrCsLy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/bridge/br_input.c:23:
   In file included from net/bridge/br_private.h:17:
   include/net/ip6_fib.h:278:10: warning: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     278 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:106:3: note: expanded from macro 'time_after'
     106 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> net/bridge/br_input.c:232:2: error: implicit declaration of function 'nf_hook_state_init' [-Werror,-Wimplicit-function-declaration]
     232 |         nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
         |         ^
   net/bridge/br_input.c:232:2: note: did you mean 'ethtool_stats_init'?
   include/linux/ethtool.h:254:20: note: 'ethtool_stats_init' declared here
     254 | static inline void ethtool_stats_init(u64 *stats, unsigned int n)
         |                    ^
>> net/bridge/br_input.c:237:13: error: implicit declaration of function 'nf_hook_entry_hookfn' [-Werror,-Wimplicit-function-declaration]
     237 |                 verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
         |                           ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=y] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
