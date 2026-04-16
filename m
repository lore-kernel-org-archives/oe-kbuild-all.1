Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044426560B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346856; cv=none; b=NYdQvtGARODh4xzWMUW5GVB1BfGl8VQIhwcDtnp/nch3eyUqX7F3ARVCdqdMcr/iteJ23kmtahH0UoqHdfzdTMw/WC6zLX9IaTFMZbPd7ZApeoQctLl5cBVxP7g84GyZgWkc1qJT3HLdBVFRVcCHk4RI76qr3BvM6XK99dUy5ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346856; c=relaxed/simple;
	bh=hHbMYpRi+qK4RiC09PsJUoi31EZgghN1Lhe475woLOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KI9O2YawylR/w4tG78iK7NsNAJD7fTDDPkMo24daqN8Es1EV6trn6PwEmGNbjWOpYEGlSZMsO4uXxQvO0lQf6viReVOApO0Wb3Av0eFdBDjxJo0gQ/EMyEroO+SNJkORGVapLSuBIOOfKll9hKI4BWwHvl2VCVJekkoakeb20RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hg66dNLR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hg66dNLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776346855; x=1807882855;
  h=date:from:to:cc:subject:message-id;
  bh=hHbMYpRi+qK4RiC09PsJUoi31EZgghN1Lhe475woLOc=;
  b=Hg66dNLRjRrIMMXuMxxLaGu3aFG4lsZRuKEIHvn/3JKDKdrf0LQQY1kP
   rc06siX9H0HrMk4jetlUxRC3NpRpvoxOaUa/yeNaOIIZoTJX3m8NeBA8a
   /7m2xuSqA+LFYJjt1WvWHKsIQM6mIJmswE8mMiUyLVgysHYz4L5cA/bMO
   JRqhIvdjyM9QVZ461U1m267khOOCPhErQjJ15qSYElIEwxm1Poxv+Zlgh
   nDZQi9wPs6mDGTtXVt1hPaGFyQbmFhIODIxbTw/sMTFiiPDZQQ3A9OOm2
   qAoUvSrJGZW/cZZsKSydWQQ5t8iWDVYmvBd3iBiL/SWKbVzzEST0JA95Z
   Q==;
X-CSE-ConnectionGUID: TrXt1pOBTiyYZOpcit2LnA==
X-CSE-MsgGUID: ozdTELT6QCyw08PiK21agg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94751495"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94751495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 06:40:54 -0700
X-CSE-ConnectionGUID: wBx0LrgHSieMiBZDTJUK6Q==
X-CSE-MsgGUID: P/CJUxQcSoOyRb8fz2c9GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="253981064"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2026 06:40:52 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDMxd-000000001dW-2u4q;
	Thu, 16 Apr 2026 13:40:49 +0000
Date: Thu, 16 Apr 2026 21:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/bpf-tproxy 8/8]
 include/net/request_sock.h:117:50: error: 'sock_pfree_ref' undeclared; did
 you mean 'sock_kfree_s'?
Message-ID: <202604162149.Mbv9J6de-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-tproxy
head:   27d1eafb8d37f1b272a991077d3bd1bb312118a9
commit: 27d1eafb8d37f1b272a991077d3bd1bb312118a9 [8/8] bpf: Support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604162149.Mbv9J6de-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604162149.Mbv9J6de-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604162149.Mbv9J6de-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/inet_sock.h:24,
                    from include/net/inet_connection_sock.h:21,
                    from include/linux/tcp.h:20,
                    from include/linux/ipv6.h:103,
                    from include/net/ipv6.h:12,
                    from include/linux/sunrpc/clnt.h:29,
                    from include/linux/nfs_fs.h:32,
                    from init/do_mounts.c:23:
   include/net/request_sock.h: In function 'skb_steal_sock':
>> include/net/request_sock.h:117:50: error: 'sock_pfree_ref' undeclared (first use in this function); did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_ref;
         |                                                  ^~~~~~~~~~~~~~
         |                                                  sock_kfree_s
   include/net/request_sock.h:117:50: note: each undeclared identifier is reported only once for each function it appears in


vim +117 include/net/request_sock.h

    86	
    87	/**
    88	 * skb_steal_sock - steal a socket from an sk_buff
    89	 * @skb: sk_buff to steal the socket from
    90	 * @refcounted: is set to true if the socket is reference-counted
    91	 * @prefetched: is set to true if the socket was assigned from bpf
    92	 */
    93	static inline struct sock *skb_steal_sock(struct sk_buff *skb,
    94						  bool *refcounted, bool *prefetched)
    95	{
    96		struct sock *sk = skb->sk;
    97	
    98		if (!sk) {
    99			*prefetched = false;
   100			*refcounted = false;
   101			return NULL;
   102		}
   103	
   104		*prefetched = skb_sk_is_prefetched(skb);
   105		if (*prefetched) {
   106	#if IS_ENABLED(CONFIG_SYN_COOKIES)
   107			if (sk->sk_state == TCP_NEW_SYN_RECV && inet_reqsk(sk)->syncookie) {
   108				struct request_sock *req = inet_reqsk(sk);
   109	
   110				*refcounted = false;
   111				sk = req->rsk_listener;
   112				req->rsk_listener = NULL;
   113				return sk;
   114			}
   115	#endif
   116			*refcounted = sk_is_refcounted(sk) ||
 > 117				      skb->destructor == sock_pfree_ref;
   118		} else {
   119			*refcounted = true;
   120		}
   121	
   122		skb->destructor = NULL;
   123		skb->sk = NULL;
   124		return sk;
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
