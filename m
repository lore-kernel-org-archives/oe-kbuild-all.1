Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AB4155C9E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492702; cv=none; b=M4nD9UmXFPkJoFayABZwDN0n/jURgLEWwE8kPTIkpZkz1baE2aNQ/FozM+pfJzve+KuTa6KU+km7BMfoSJ3+F61ol90m6/PZWxP2DxV659U3Ihto2RE9Wvv4IIQKcga9fmA2MtGx3cKROfMNzQ2CsGL5SuO9MWq2jANIe45vLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492702; c=relaxed/simple;
	bh=zwlUavLcxSdqD6rbGAhx9PihJLTUbMfjo/Nnw22IiL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Am1wLcuc1yMzkR5Wn/Ik0uhMGh6B5GLjEjvsnqsrgfzbSSz+vOUnl9BftYiSsIEwUs03oKy6Xl11xFH4zPVajzD5p9dp1PylmB+AQ4D/YYs/Jd03lNG3bdq3WX2fjbpyHlNDp9HYwmR0HNLkwLbcfXHCed7wLNC2GfcnrjIm4wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/7zvGML; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/7zvGML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730492701; x=1762028701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwlUavLcxSdqD6rbGAhx9PihJLTUbMfjo/Nnw22IiL0=;
  b=f/7zvGMLV/o2Hvbo3Lg+eVfVqRH6TNlsRjgrgZaqehewtVQZ8qR7eurw
   50m/DEkgY+Aw5OOSvjqk+ucMG81oA2cNQqol4/QjCXv5AFWOaBI/yX63Z
   I77oqK6KD0bkI6O+k9HIGG+FWr1K8pGrbFF1BMtKOCPPY4Sta/WmnJQlO
   ojarC1AkiK3NvnWbdGSL3Jw7p7SH37lF05akIPuZpHIQoHpwtuIfytj0H
   CE7LZLtexW5NpOktt7DQRHk/xnhOwHD06QusXj+8N0jv34QYrqHyipnYF
   EZoMkGwPCNyPYcsyb9hYmBJp0TWpJJieDbtmVBrVbmExHf7P4Pm7iK6Ut
   g==;
X-CSE-ConnectionGUID: cTgaFBWDTtiozfEyAEPxzQ==
X-CSE-MsgGUID: 18uMz0DRTda1bjgHV7LwLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47720859"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47720859"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 13:25:00 -0700
X-CSE-ConnectionGUID: UMzSV89QTIqxNg7QE7KVPw==
X-CSE-MsgGUID: vh7CFGqcQRq5c1GuG93BFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87841657"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 13:24:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6yCW-000i0W-27;
	Fri, 01 Nov 2024 20:24:56 +0000
Date: Sat, 2 Nov 2024 04:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/wg 5/5] drivers/net/wireguard/socket.c:47:63: sparse:
 sparse: restricted __be16 degrades to integer
Message-ID: <202411020445.rsCK4K45-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/wg
head:   b3a46ba5516ec2c40cb67404cddd26207f661feb
commit: 4a1ce373cedb6551e598a2c946867f1fc90fa118 [5/5] sport hashing
config: loongarch-randconfig-r121-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020445.rsCK4K45-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241102/202411020445.rsCK4K45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020445.rsCK4K45-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireguard/socket.c:47:63: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/wireguard/socket.c:47:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sport @@     got int @@
   drivers/net/wireguard/socket.c:47:22: sparse:     expected restricted __be16 [usertype] sport
   drivers/net/wireguard/socket.c:47:22: sparse:     got int

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
