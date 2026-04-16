Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8D37E2FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 11:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340068; cv=none; b=XCJl7nmKJaR6jLcDzGk/SHmcLsUQM6t2Vm9Yn2MExt+6idkE6K+i88SyuAEgJdl3lTkhsVMVilSA5FMRedCr7ekCuUUCdYUqN+YWgxvZ96/QqizADUMEFPDQcSE8zcY2kws4unfM6QwgIF8SIp3RUCywXwrG8Stv52yFm8x3zew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340068; c=relaxed/simple;
	bh=YzQYP8uczO8KVVB9fohaO5QOvL1Pd2LbV37xu/2XoHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ntKC3VxPDbMAf0KaG0bq6HypxwvV1FHdE2zQHKDYR5V5cGbnExILIqinlq3dpAqSG563nhmvcjZajpTpjstp5M62lOB3tbfwMyxKbVm4Bx2+3sLi/jXOHi+Ih4N1A0NEWe7nil8JShB8QsXOnOwQ+ddY1PaIZDLqNB9ZHyOl94s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqzww/gJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqzww/gJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776340067; x=1807876067;
  h=date:from:to:cc:subject:message-id;
  bh=YzQYP8uczO8KVVB9fohaO5QOvL1Pd2LbV37xu/2XoHo=;
  b=bqzww/gJdLEJTiUPLzKyrsbSsFt5iMh7sLNN1flfpLs+8vZFNiF2B3Jb
   w6016uU+2vfDHFj9q1xhTRVxOJazmraIL3VotZcth83fam0gWIOsv6rzF
   XeTUfYUkWhBNSuwxeU4uXKAbEpXfAjs8erG/c4gl2bS6YJSBsgVmLqp25
   A4FMYGWsdYKW2IWkQ/te6CW1HgKiaI/l4emGbA8s+l2gaSnqkskyG1fhP
   +FKZNnLlyPkYd3IR/J5JRwBF7Q/9rYxVvwy6ySJNp47pT3O8xdCAXfv5u
   GS1ISC1uledlgUjDMC01HRmEHsGCsE5bRNmJa32ZyWbv1g1OFfjc/DkDA
   Q==;
X-CSE-ConnectionGUID: KSV40cjOTbqd5JcEBUUR3w==
X-CSE-MsgGUID: TPYGwpyAQkWI+micB52C0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77210264"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77210264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:47:46 -0700
X-CSE-ConnectionGUID: yeIQTPBcSxq8fHYp93I++w==
X-CSE-MsgGUID: /E++rE2JSoOiiRPk+wMMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="228049769"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2026 04:47:44 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDLCA-000000001Xa-2Rb1;
	Thu, 16 Apr 2026 11:47:42 +0000
Date: Thu, 16 Apr 2026 19:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/bpf-tproxy 8/8]
 include/net/request_sock.h:117:50: error: 'sock_pfree_cnt' undeclared; did
 you mean 'sock_kfree_s'?
Message-ID: <202604161942.lzHNaai0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/bpf-tproxy
head:   df7aabea1249e933d8d0f5caff085026de1cd217
commit: df7aabea1249e933d8d0f5caff085026de1cd217 [8/8] bpf: Support SOCK_RCU_FREE sockets in bpf_sk_assign on egress
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604161942.lzHNaai0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161942.lzHNaai0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161942.lzHNaai0-lkp@intel.com/

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
>> include/net/request_sock.h:117:50: error: 'sock_pfree_cnt' undeclared (first use in this function); did you mean 'sock_kfree_s'?
     117 |                               skb->destructor == sock_pfree_cnt;
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
 > 117				      skb->destructor == sock_pfree_cnt;
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
