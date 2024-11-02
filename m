Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D2D158546
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730589184; cv=none; b=Bi4FgMmoPddxS79cfkSPGCof8xe9lgGj/EBnIKZjkcc72gjMvutE2Kj4ZCePA0EO4TOFKXyPkW5fdq4LMPYJs7uszXxI2L2SHO2PhBKwkTof4yJKDNoTfrWBfBc7llT3SAlXsmN+hFxOTQggeFsi1pTw7XQTNtlOER8noGXuDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730589184; c=relaxed/simple;
	bh=a7xT+oYKbk+2P1TOOQUqlhCmrGYG4KfCMUXXZeE+Tzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cw6w+Y0HjARUfpLXF8T4aMmo84bIaeenr+54caxit+LujZJxV0FlSiiW8G1pukxXyKOoGGZ3n/Y5kO6gNpbpmM9yR2Ersu1v80MTHRDDneW6SDuWcFg2T+DOBZw841tyre8M7utCq/mQ4CYp6pTE1MrnomyePu1E6KA9XkJyS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GC+nuo4o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GC+nuo4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730589183; x=1762125183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a7xT+oYKbk+2P1TOOQUqlhCmrGYG4KfCMUXXZeE+Tzc=;
  b=GC+nuo4oySc5hFJ9lqWiV6kNCTfaIoC66CaMoDXGDypoV/zxGfIdb2cn
   TD6J3moqnnjLvXPQJWTOgtW82f3wyKKkczfnRweP3zKdCUi3DHIQXdYvT
   AmUupPU+yoi7pRqpbeBlQIm1fMeJZtqnPcHbLZWGS9pmkGfeVYIvN3vtY
   y5zDIN0EffiBG+yveLDSsym0BvJH9/3uP3HansliY1fC7SvdTaU4bY32r
   K+2TKIS8PC+wu13s9yo90O/DnzOEMShxSkvz7w5Gxh4jMCgMB+/sflc44
   2w+KlqpqPeBFUoUTZkn8WkKqsjfiE0rctIyaagIlgMw0j1xAwZYyfGMtm
   A==;
X-CSE-ConnectionGUID: eExrOte0RqW920ML6R0miA==
X-CSE-MsgGUID: xkCUdndnQiiG2mqnsAg3JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30274455"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30274455"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 16:13:02 -0700
X-CSE-ConnectionGUID: lprgfZWVS4uQyLkLD2goIw==
X-CSE-MsgGUID: zETVwrWRQtaaFOLvaWzcrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88050333"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2024 16:13:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7NIg-000jRB-1o;
	Sat, 02 Nov 2024 23:12:58 +0000
Date: Sun, 3 Nov 2024 07:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/wg 3/5] drivers/net/wireguard/socket.c:47:22: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411030708.t9BMAwkr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/wg
head:   f807c8a9aac35cdbf7d376d103fff33199256cbb
commit: 0c0b0e7e1d58afd7a45b2bc55898933cdd3a55d0 [3/5] sport hashing
config: loongarch-randconfig-r132-20241102 (https://download.01.org/0day-ci/archive/20241103/202411030708.t9BMAwkr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241103/202411030708.t9BMAwkr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030708.t9BMAwkr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireguard/socket.c:47:63: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/wireguard/socket.c:47:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [assigned] [usertype] sport @@     got int @@
   drivers/net/wireguard/socket.c:47:22: sparse:     expected restricted __be16 [assigned] [usertype] sport
   drivers/net/wireguard/socket.c:47:22: sparse:     got int
   drivers/net/wireguard/socket.c:126:63: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/wireguard/socket.c:126:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sport @@     got int @@
   drivers/net/wireguard/socket.c:126:22: sparse:     expected restricted __be16 [usertype] sport
   drivers/net/wireguard/socket.c:126:22: sparse:     got int

vim +47 drivers/net/wireguard/socket.c

    20	
    21	static int send4(struct wg_device *wg, struct sk_buff *skb,
    22			 struct endpoint *endpoint, u8 ds, struct dst_cache *cache)
    23	{
    24		struct flowi4 fl = {
    25			.saddr		= endpoint->src4.s_addr,
    26			.daddr		= endpoint->addr4.sin_addr.s_addr,
    27			.flowi4_mark	= wg->fwmark,
    28			.flowi4_proto	= IPPROTO_UDP,
    29		};
    30		struct rtable *rt = NULL;
    31		struct sock *sock;
    32		int ret = 0;
    33	
    34		skb_mark_not_on_list(skb);
    35		skb->dev = wg->dev;
    36		skb->mark = wg->fwmark;
    37	
    38		rcu_read_lock_bh();
    39		sock = rcu_dereference_bh(wg->sock4);
    40	
    41		if (unlikely(!sock)) {
    42			ret = -ENONET;
    43			goto err;
    44		}
    45	
    46		fl.fl4_dport = inet_sk(sock)->inet_sport;
  > 47		fl.fl4_sport = PACKET_CB(skb)->sport ? : inet_sk(sock)->inet_sport;
    48		if (cache)
    49			rt = dst_cache_get_ip4(cache, &fl.saddr);
    50	
    51		if (!rt) {
    52			security_sk_classify_flow(sock, flowi4_to_flowi_common(&fl));
    53			if (unlikely(!inet_confirm_addr(sock_net(sock), NULL, 0,
    54							fl.saddr, RT_SCOPE_HOST))) {
    55				endpoint->src4.s_addr = 0;
    56				endpoint->src_if4 = 0;
    57				fl.saddr = 0;
    58				if (cache)
    59					dst_cache_reset(cache);
    60			}
    61			rt = ip_route_output_flow(sock_net(sock), &fl, sock);
    62			if (unlikely(endpoint->src_if4 && ((IS_ERR(rt) &&
    63				     PTR_ERR(rt) == -EINVAL) || (!IS_ERR(rt) &&
    64				     rt->dst.dev->ifindex != endpoint->src_if4)))) {
    65				endpoint->src4.s_addr = 0;
    66				endpoint->src_if4 = 0;
    67				fl.saddr = 0;
    68				if (cache)
    69					dst_cache_reset(cache);
    70				if (!IS_ERR(rt))
    71					ip_rt_put(rt);
    72				rt = ip_route_output_flow(sock_net(sock), &fl, sock);
    73			}
    74			if (IS_ERR(rt)) {
    75				ret = PTR_ERR(rt);
    76				net_dbg_ratelimited("%s: No route to %pISpfsc, error %d\n",
    77						    wg->dev->name, &endpoint->addr, ret);
    78				goto err;
    79			}
    80			if (cache)
    81				dst_cache_set_ip4(cache, &rt->dst, fl.saddr);
    82		}
    83	
    84		skb->ignore_df = 1;
    85		udp_tunnel_xmit_skb(rt, sock, skb, fl.saddr, fl.daddr, ds,
    86				    ip4_dst_hoplimit(&rt->dst), 0, fl.fl4_sport,
    87				    fl.fl4_dport, false, false);
    88		goto out;
    89	
    90	err:
    91		kfree_skb(skb);
    92	out:
    93		rcu_read_unlock_bh();
    94		return ret;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
