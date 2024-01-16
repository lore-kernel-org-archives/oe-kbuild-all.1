Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2021B97E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 23:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705449162; cv=none; b=fgGFGlXJAjz1aJrCSYXgh8S9n3ImIuYhQfKImUp/yTmnEemb7Bl7AySoPFG2Xfb6o9iqF9V6khIGCfQJEZO9px1wEVM1yxlUfXkKb05BT+G57gL6y2d/8mnh6IUWu139orwYMhjrQpLn/vlHHZhAxYmY8Lko5g/8u1ZJxNt8+ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705449162; c=relaxed/simple;
	bh=URJhacSD7lh63FOCtFrxgm2Vci5ZAPOIQZcvEf0S328=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=Uh5Rz48GgYsnAultISGC3+QzqK5sAb5WpYHNsk+8PA8mIlApRC2G/gi6fEVbhIrttBJz+daFfJ2ZONDwhaGgjojBGIJ8M8zuyOFhkLA+wodxNetT8QIkY+AUjmpS+Ku/Qupxy6x/3zz+uq1NLaoiD3ZrmtmDQm0l/lWqTFLXfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYUL/NT4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYUL/NT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705449161; x=1736985161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URJhacSD7lh63FOCtFrxgm2Vci5ZAPOIQZcvEf0S328=;
  b=jYUL/NT41//Cp3oa6sI9os8pr0suokCgdhpHurZU61zc/K4my37bd8rG
   MDBGpOE3/Jbwx2HC/Un/aDnYncAFCOD9hE11w4fkvcGtyUIfkxlwwRnS6
   qdx4rpPVrXW8BrCGUsx6WAkce6JOEHFACW2jbhu80mJBxa5p7f3lG2nmF
   PJSEDY0Rk0LvlvTWmUnQmw3mA9JpDEbkLDNRqXl1Z/ADktP8jZoo7e3Yg
   P7pwnEwxlmZID8b0B6+v/2AwtEsbpnss7L07nSzO8OsLd0NbrcW0xz7AS
   FD8b4YOywIJNGoyvi2RiXi8xr3UWJAToH4dHRHZs6JGisZgcIb3WO8Ipe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6780399"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6780399"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 15:52:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874642718"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="874642718"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2024 15:52:37 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPtEP-0001NG-2M;
	Tue, 16 Jan 2024 23:52:33 +0000
Date: Wed, 17 Jan 2024 07:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] net/bridge/br_input.c:232:2:
 error: implicit declaration of function 'nf_hook_state_init'; did you mean
 'ethtool_stats_init'?
Message-ID: <202401170704.n0YZr6Wm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d4919ef797973ac0667b03e8221c4e233e904f21
commit: b37eb4523002250e2382e8c5e0d8380ad349c6b6 [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: x86_64-randconfig-102-20240117 (https://download.01.org/0day-ci/archive/20240117/202401170704.n0YZr6Wm-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170704.n0YZr6Wm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170704.n0YZr6Wm-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bridge/br_input.c: In function 'nf_hook_bridge_pre':
>> net/bridge/br_input.c:232:2: error: implicit declaration of function 'nf_hook_state_init'; did you mean 'ethtool_stats_init'? [-Werror=implicit-function-declaration]
     232 |  nf_hook_state_init(&state, NF_BR_PRE_ROUTING,
         |  ^~~~~~~~~~~~~~~~~~
         |  ethtool_stats_init
>> net/bridge/br_input.c:237:13: error: implicit declaration of function 'nf_hook_entry_hookfn' [-Werror=implicit-function-declaration]
     237 |   verdict = nf_hook_entry_hookfn(&e->hooks[i], skb, &state);
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=y] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
