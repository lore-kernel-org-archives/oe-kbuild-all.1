Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459112EA146
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 21:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761169101; cv=none; b=Wc7ldOwccTkUSEE0HH30W6aHiHCcQopcMPrtY51jHKhUn5iuCi3TiFAKEktmdC//TNSAXHfduwFliUROLo3Ow7i+m5OwygIy0YUpD9dtmurx6zixS2hwnexN89aA29+AsNYmI5JyyRSY3woFK2591zRbSvuIDxNnkIRbt8oGMf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761169101; c=relaxed/simple;
	bh=4wN/NSPrJSn5giEmXsuWdrelnAOZPjiC4VPhOzm+6zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uw71qZ18d/xJZJEbJu62QbD2hYUn4TACItGpnWeedxHojSuZvSwlklPb/raHpVX1WeoQ22ST+1JPE1hFoUYeu0+yiVkRDbmBtQ9z0PF3ESaO9KYxfAzXoI6/fqHXFLxW/OdS2N/R9CzibkIXsQjdoFLvRzvVQKk27M4mwSRvn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVZwDNYP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVZwDNYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761169099; x=1792705099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4wN/NSPrJSn5giEmXsuWdrelnAOZPjiC4VPhOzm+6zo=;
  b=NVZwDNYPvRFjkvmp0x2aFknoWon3hlt1J8FoosQQZh2jdiIOIuJTMUac
   4cB8xF8okZI1RqzPbnDQaK/zy/TPf3WynTRLzWpWd48hCQxQe7ecoZrtI
   mC+hKnEUTOnMQ5E2qlPMULMGa7MUCC953ZCtJ+NwAPuXSdDwAo10NM2y3
   /V6xJEpdOR+Zxs18OefELwxqW8vdk/wWicG/VMwMgKpNsqbDZy4nNfLOC
   6/Kk3rxAbL4dYr1a1rhufEUmMk6BIIvsdWD3k7IIS0K31m2OtSHfYYLWu
   qgIusn7XdWI3SSbqVOMEY4tTy6Ovp/uP7ws+Y9P5SUUjDWkeGlLnTGruz
   Q==;
X-CSE-ConnectionGUID: MOg9qUDFSyqEedeW3/6fqA==
X-CSE-MsgGUID: E9ePRa+HQTC5ipqfwsxBDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65946021"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="65946021"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 14:38:18 -0700
X-CSE-ConnectionGUID: 7LvstlY3SlWiH0U4ejBUDg==
X-CSE-MsgGUID: /SBdI0mxRbGUrbLx8+UovQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188383015"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2025 14:38:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBgWe-000CkL-0N;
	Wed, 22 Oct 2025 21:37:57 +0000
Date: Thu, 23 Oct 2025 05:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1] net/bridge/br_input.c:232:2:
 error: implicit declaration of function 'nf_hook_state_init'
Message-ID: <202510230519.WzhkfI8Y-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ab09c22ea60b40436056b0e1f692e08de52d6a19
commit: b37eb4523002250e2382e8c5e0d8380ad349c6b6 [0/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: i386-buildonly-randconfig-005-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230519.WzhkfI8Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230519.WzhkfI8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230519.WzhkfI8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

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
