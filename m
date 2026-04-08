Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4AD3358BE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 05:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775625296; cv=none; b=SGj+plcpq0tBuWkYzf0N69bZl16oYkQkSjhsI6Qh0ETtOrHuDFfhOC1GAFUbXM/aXViE+9dj0I6DubCk2908/dJxzbxxPrgbUvIQDHxJSZeqXvkbK1pR9Lb+j9Hi1o7wnejM9prFIKSOVNNdW6EkiPmREOVq95V5eJROl7ffMDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775625296; c=relaxed/simple;
	bh=T/cSBb1+oKF5ocSs6xXtIlZFf3MWnYz3St2fh9qlosI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s+9zg8gtnshKzNDDad/oMQVskkp4matip9k9qt2zG+UXuwHZYt0XG1XfTN5QlBl+vUat3uMXcMfx5idpFiOUiXeaHzpTU0GDsmYbsGHmoPMWbyfssxeDLXSKNdCnmTjd0+zshGqRvX7KHlxRf9goVMyaYIU7o6n0gClRrhmkmew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9Sjcpg6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9Sjcpg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775625295; x=1807161295;
  h=date:from:to:cc:subject:message-id;
  bh=T/cSBb1+oKF5ocSs6xXtIlZFf3MWnYz3St2fh9qlosI=;
  b=A9Sjcpg6KVrI56P9B0eJ/Aus/lYvLFqTr3L1YQUjmaZdnxQi71WRaian
   ZkARkCNphGdR4I9p5L3kbIRN2J3rUiI55BXv03iNX67yL+bpuNXO03nwX
   LaFUkHRmkX5LGfQOTG6VThjtmFI1GyDiTA1kcrlvWZtWYiBV7dYz39aIE
   htqOw6G0Y4CkMTuMPR9obDp1+PPle73vK7NpT2iYWgmkscSjO20Prv5xn
   djMMhjqCiD3sSeNytj+coQgpACDTQFw5ywcGyZ3jEp1pFO8i3bwoL7ApU
   NNF4KXgcYhs/O05bvjvQPCOfKtlAyRi3f0yfx7x/gEzCCvBJ8UQT6en2Q
   A==;
X-CSE-ConnectionGUID: U5IP5OVVS2mJ5vTSZLt6TQ==
X-CSE-MsgGUID: 8crZ71I9ReiRJSDrIIM+7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75636470"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="75636470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 22:14:54 -0700
X-CSE-ConnectionGUID: szr8qhewS/O+ypuCxTo0bg==
X-CSE-MsgGUID: 7VL920g/RM+5ddO8LMshfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228263750"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2026 22:14:53 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wALFa-000000001SJ-0QTO;
	Wed, 08 Apr 2026 05:14:50 +0000
Date: Wed, 08 Apr 2026 13:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next 2/9] net/ipv4/af_inet.c:1523:49:
 sparse: sparse: restricted __be32 degrades to integer
Message-ID: <202604081313.ceFDMEFQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   bc8a19a194d5a72df5982c04f8a9e7bcff1306ca
commit: 595407f94f5e5b778a349bd5a323c5051920b864 [2/9] net: Avoid unaligned access in inet_gro_receive()
config: i386-randconfig-r111-20260408 (https://download.01.org/0day-ci/archive/20260408/202604081313.ceFDMEFQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604081313.ceFDMEFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604081313.ceFDMEFQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/af_inet.c:1523:49: sparse: sparse: restricted __be32 degrades to integer
   net/ipv4/af_inet.c:1524:49: sparse: sparse: restricted __be32 degrades to integer

vim +1523 net/ipv4/af_inet.c

  1473	
  1474	struct sk_buff *inet_gro_receive(struct list_head *head, struct sk_buff *skb)
  1475	{
  1476		const struct net_offload *ops;
  1477		struct sk_buff *pp = NULL;
  1478		const struct iphdr *iph;
  1479		struct sk_buff *p;
  1480		unsigned int hlen;
  1481		unsigned int off;
  1482		__u16 flush;
  1483		int proto;
  1484	
  1485		off = skb_gro_offset(skb);
  1486		hlen = off + sizeof(*iph);
  1487		iph = skb_gro_header(skb, hlen, off);
  1488		if (unlikely(!iph))
  1489			goto out;
  1490	
  1491		proto = iph->protocol;
  1492	
  1493		ops = rcu_dereference(inet_offloads[proto]);
  1494		if (!ops || !ops->callbacks.gro_receive)
  1495			goto out;
  1496	
  1497		if (*(u8 *)iph != 0x45)
  1498			goto out;
  1499	
  1500		if (ip_is_fragment(iph))
  1501			goto out;
  1502	
  1503		if (unlikely(ip_fast_csum((u8 *)iph, 5)))
  1504			goto out;
  1505	
  1506		NAPI_GRO_CB(skb)->proto = proto;
  1507		flush = (get_unaligned_be16(&iph->tot_len) ^ skb_gro_len(skb)) |
  1508		        (get_unaligned_be16(&iph->frag_off) & ~IP_DF);
  1509	
  1510		list_for_each_entry(p, head, list) {
  1511			struct iphdr *iph2;
  1512	
  1513			if (!NAPI_GRO_CB(p)->same_flow)
  1514				continue;
  1515	
  1516			iph2 = (struct iphdr *)(p->data + off);
  1517			/* The above works because, with the exception of the top
  1518			 * (inner most) layer, we only aggregate pkts with the same
  1519			 * hdr length so all the hdrs we'll need to verify will start
  1520			 * at the same offset.
  1521			 */
  1522			if ((iph->protocol ^ iph2->protocol) |
> 1523			    (get_unaligned(&iph->saddr) ^ get_unaligned(&iph2->saddr)) |
  1524			    (get_unaligned(&iph->daddr) ^ get_unaligned(&iph2->daddr))) {
  1525				NAPI_GRO_CB(p)->same_flow = 0;
  1526				continue;
  1527			}
  1528		}
  1529	
  1530		NAPI_GRO_CB(skb)->flush |= flush;
  1531		NAPI_GRO_CB(skb)->network_offsets[NAPI_GRO_CB(skb)->encap_mark] = off;
  1532	
  1533		/* Note : No need to call skb_gro_postpull_rcsum() here,
  1534		 * as we already checked checksum over ipv4 header was 0
  1535		 */
  1536		skb_gro_pull(skb, sizeof(*iph));
  1537		skb_set_transport_header(skb, skb_gro_offset(skb));
  1538	
  1539		pp = indirect_call_gro_receive(tcp4_gro_receive, udp4_gro_receive,
  1540					       ops->callbacks.gro_receive, head, skb);
  1541	
  1542	out:
  1543		skb_gro_flush_final(skb, pp, flush);
  1544	
  1545		return pp;
  1546	}
  1547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
