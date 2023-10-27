Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B5168D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 22:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8CQPr7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698446341; x=1729982341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVpgXC0fmrBhW5ITiRvfxMOSrhoU3DtQwldB9WaGn2I=;
  b=j8CQPr7josI8l7gKvLUTgVjw4JrIbYEFMjAhaLfxSFY46J4yRNXkRcwT
   E8+zXl5osp9RizDWW9t85T/mZLsaGPLQDE49i6Qhitz0FInLojulCv4Xo
   yIt201SjxVjsxHqppm1i/l4PnZsdYYLDhtSA8lwapdqFSwRapRByVhx5G
   Zd+idxJDtRY3i2uzQHfFK06qiSJlfFW0xUn9bZjpo09fMOMFWicbPJ26F
   qJ/t1VBnG+I21e0nNfnvIxAzUlbb1qPN2Od1FyCMXqQOFK5aDD8SgsfyN
   RlStTijTS08mr7LzrOlRTNaHyjJ8BIK1HlfGUNBI+Z43usWtvmtspxAtr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="372913206"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="372913206"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 15:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763362551"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="763362551"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Oct 2023 15:38:59 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwVTl-000BFt-0r;
	Fri, 27 Oct 2023 22:38:57 +0000
Date: Sat, 28 Oct 2023 06:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit5 4/4] net/core/filter.c:2491:39: error:
 'netkit_peer_dev' undeclared
Message-ID: <202310280629.n0a9bsGX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/netkit5
head:   01705de46b546286f287b6e39e549d90d77f352d
commit: 01705de46b546286f287b6e39e549d90d77f352d [4/4] bpf, netkit: indirect call
config: i386-buildonly-randconfig-004-20231028 (https://download.01.org/0day-ci/archive/20231028/202310280629.n0a9bsGX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280629.n0a9bsGX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280629.n0a9bsGX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from net/core/filter.c:20:
   net/core/filter.c: In function 'skb_do_redirect':
>> net/core/filter.c:2491:39: error: 'netkit_peer_dev' undeclared (first use in this function)
    2491 |                                       netkit_peer_dev, dev);
         |                                       ^~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   net/core/filter.c:2490:23: note: in expansion of macro 'INDIRECT_CALL_1'
    2490 |                 dev = INDIRECT_CALL_1(ops->ndo_get_peer_dev,
         |                       ^~~~~~~~~~~~~~~
   net/core/filter.c:2491:39: note: each undeclared identifier is reported only once for each function it appears in
    2491 |                                       netkit_peer_dev, dev);
         |                                       ^~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   net/core/filter.c:2490:23: note: in expansion of macro 'INDIRECT_CALL_1'
    2490 |                 dev = INDIRECT_CALL_1(ops->ndo_get_peer_dev,
         |                       ^~~~~~~~~~~~~~~
   In file included from include/net/sock.h:62,
                    from include/linux/sock_diag.h:8,
                    from net/core/filter.c:27:
>> net/core/filter.c:2491:39: error: implicit declaration of function 'netkit_peer_dev' [-Werror=implicit-function-declaration]
    2491 |                                       netkit_peer_dev, dev);
         |                                       ^~~~~~~~~~~~~~~
   include/linux/indirect_call_wrapper.h:19:35: note: in definition of macro 'INDIRECT_CALL_1'
      19 |                 likely(f == f1) ? f1(__VA_ARGS__) : f(__VA_ARGS__);     \
         |                                   ^~
   cc1: some warnings being treated as errors


vim +/netkit_peer_dev +2491 net/core/filter.c

  2471	
  2472	int skb_do_redirect(struct sk_buff *skb)
  2473	{
  2474		struct bpf_redirect_info *ri = this_cpu_ptr(&bpf_redirect_info);
  2475		struct net *net = dev_net(skb->dev);
  2476		struct net_device *dev;
  2477		u32 flags = ri->flags;
  2478	
  2479		dev = dev_get_by_index_rcu(net, ri->tgt_index);
  2480		ri->tgt_index = 0;
  2481		ri->flags = 0;
  2482		if (unlikely(!dev))
  2483			goto out_drop;
  2484		if (flags & BPF_F_PEER) {
  2485			const struct net_device_ops *ops = dev->netdev_ops;
  2486	
  2487			if (unlikely(!ops->ndo_get_peer_dev ||
  2488				     !skb_at_tc_ingress(skb)))
  2489				goto out_drop;
  2490			dev = INDIRECT_CALL_1(ops->ndo_get_peer_dev,
> 2491					      netkit_peer_dev, dev);
  2492			if (unlikely(!dev ||
  2493				     !(dev->flags & IFF_UP) ||
  2494				     net_eq(net, dev_net(dev))))
  2495				goto out_drop;
  2496			skb->dev = dev;
  2497			return -EAGAIN;
  2498		}
  2499		return flags & BPF_F_NEIGH ?
  2500		       __bpf_redirect_neigh(skb, dev, flags & BPF_F_NEXTHOP ?
  2501					    &ri->nh : NULL) :
  2502		       __bpf_redirect(skb, dev, flags);
  2503	out_drop:
  2504		kfree_skb(skb);
  2505		return -EINVAL;
  2506	}
  2507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
