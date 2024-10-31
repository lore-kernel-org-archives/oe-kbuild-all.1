Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FE7198E61
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730376496; cv=none; b=St/5HppgWPZeFQROeq38Q/IiPC2eBPf0yis+dxE3FpEvnz2/ae5PT6V681AiWWkcd8TlmYRw7TcWksxAsQ7UdztQVefbR4B+Zv0kQWC8uyJEupUYDdsqTVhy57/LQAspJnhW6+/kAeE1T2NadhjBvjZ8TQ9vNlvPntdpX7F9TH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730376496; c=relaxed/simple;
	bh=dhuekx2f/dbx0ym+W5EbZYH6ZsscotIqkoFXPxbEI34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghYQO695VdWb/EH+K6LRkqpoO0XqDglPtfwuX21J7g4eS+B+yEkGY5NNc1y7stASMuTSOrbLNuXrRDjE2ARAGDX+k09oXVViWiugxTukjo9I29FBrIb4BGtV+DGPkGueXYLDnMrXSRR4cyQLti80L5cJdKy+2oOeog8jH3wVTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig8x6ol6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig8x6ol6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730376494; x=1761912494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dhuekx2f/dbx0ym+W5EbZYH6ZsscotIqkoFXPxbEI34=;
  b=Ig8x6ol6mXRDlUN7LfS5QNvmgkLJmlkLzzmOU2pehv/HqJlN3lJ6LgWg
   YPKWI2dIHCOyaVHx7VWqH5YLlMhkTtAqq8Ffmnl9ZyCvh6Miku8FvcNz7
   bJXAIZmNASDYIBmS1z3CK8UG1EBXUF1CuWRH0rfFWiYhdZk/IGRGI7HsO
   UP60s85sW1dc1e5fpbj4l3mWi404H7AzlGD6+xmx1jUki5mvoqgSkhIdt
   JC7uBPjMIki3eKd1KeDIktByoLp7XABfCy9qJf1g1aRKF/7qSxmCUyGhq
   l3X/1NiTriFSliw01yYBmGBxBwfsmQy6CKNZISu0QLoQiUcS3P36T7e7d
   g==;
X-CSE-ConnectionGUID: NUAx+j63TIOypmMuz4NhMQ==
X-CSE-MsgGUID: kcJb3tmkQtamqQAXlTU+wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30275101"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30275101"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 05:08:13 -0700
X-CSE-ConnectionGUID: sUDqDOXuTkqYNQ6yStW34w==
X-CSE-MsgGUID: JLuEjH3vQGKYGKre7xa27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113397106"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2024 05:08:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6TyD-000g48-1I;
	Thu, 31 Oct 2024 12:08:09 +0000
Date: Thu, 31 Oct 2024 20:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/wg 5/5] drivers/net/wireguard/socket.c:47:22: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202410312046.GbR2BUGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/wg
head:   9b148f25ed218ffbc73a3cdd9e91598c61082d32
commit: 9b148f25ed218ffbc73a3cdd9e91598c61082d32 [5/5] sport hashing
config: i386-randconfig-062-20241031 (https://download.01.org/0day-ci/archive/20241031/202410312046.GbR2BUGR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312046.GbR2BUGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312046.GbR2BUGR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireguard/socket.c:47:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sport @@     got unsigned short [usertype] sport @@
   drivers/net/wireguard/socket.c:47:22: sparse:     expected restricted __be16 [usertype] sport
   drivers/net/wireguard/socket.c:47:22: sparse:     got unsigned short [usertype] sport
   drivers/net/wireguard/socket.c:126:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sport @@     got unsigned short [usertype] sport @@
   drivers/net/wireguard/socket.c:126:22: sparse:     expected restricted __be16 [usertype] sport
   drivers/net/wireguard/socket.c:126:22: sparse:     got unsigned short [usertype] sport
--
>> drivers/net/wireguard/send.c:174:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] sport @@     got restricted __be16 @@
   drivers/net/wireguard/send.c:174:31: sparse:     expected unsigned short [usertype] sport
   drivers/net/wireguard/send.c:174:31: sparse:     got restricted __be16

vim +47 drivers/net/wireguard/socket.c

    20	
    21	static int send4(struct wg_device *wg, struct sk_buff *skb,
    22			 struct endpoint *endpoint, u8 ds, struct dst_cache *cache)
    23	{
    24		struct flowi4 fl = {
    25			.saddr = endpoint->src4.s_addr,
    26			.daddr = endpoint->addr4.sin_addr.s_addr,
    27			.fl4_dport = endpoint->addr4.sin_port,
    28			.flowi4_mark = wg->fwmark,
    29			.flowi4_proto = IPPROTO_UDP
    30		};
    31		struct rtable *rt = NULL;
    32		struct sock *sock;
    33		int ret = 0;
    34	
    35		skb_mark_not_on_list(skb);
    36		skb->dev = wg->dev;
    37		skb->mark = wg->fwmark;
    38	
    39		rcu_read_lock_bh();
    40		sock = rcu_dereference_bh(wg->sock4);
    41	
    42		if (unlikely(!sock)) {
    43			ret = -ENONET;
    44			goto err;
    45		}
    46	
  > 47		fl.fl4_sport = PACKET_CB(skb)->sport;
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
