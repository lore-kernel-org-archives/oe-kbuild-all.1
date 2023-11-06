Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF42F3D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 06:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKIZr0Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699250558; x=1730786558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J94d3adLLwcHoa/nKTfMcstsLEC/btfgBnboUxkyKOI=;
  b=RKIZr0UqQIutqEkmeaFR1Ie4T0t8mYQM9vwCuxRzsaM9XnN6bpKO820B
   L4gYIKIGAMuhqFYceOMmTLdGSuAyT4UpwsGaR5kA5HcZlr0DYSCW9/sLU
   l+E5+7GtpKXAmeIClOiv7BYKfPpVcoJuChNU7Gaza41VPbr9WzxH0z9C/
   kPF3owHC6wanJZN7YadLNirV+5AqCBTc9aUPtVx3Uf81M+oDJUl/AafbK
   3j/xO8HJ2hBDMnEObYryEe3cVKfRMuzpgVKG8cjr4L/bkPSwa/mZdQxJ7
   mc+yZhPWvTx5m2o5Ji6ALaKEjJFGpeBAcRy1esjOogSlwHMr+FaOdwSoU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455697648"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455697648"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 22:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3516923"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2023 22:02:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzsh0-0006Ai-35;
	Mon, 06 Nov 2023 06:02:34 +0000
Date: Mon, 6 Nov 2023 14:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH ipsec-next v2 1/3] xfrm: pass struct net to
 xfrm_decode_session wrappers
Message-ID: <202311061351.zQO62btd-lkp@intel.com>
References: <20230929125848.5445-2-fw@strlen.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929125848.5445-2-fw@strlen.de>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec-next/master]
[also build test WARNING on klassert-ipsec/master v6.6]
[cannot apply to netfilter-nf/main linus/master next-20231106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/xfrm-pass-struct-net-to-xfrm_decode_session-wrappers/20230929-210047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/20230929125848.5445-2-fw%40strlen.de
patch subject: [PATCH ipsec-next v2 1/3] xfrm: pass struct net to xfrm_decode_session wrappers
config: x86_64-randconfig-002-20230930 (https://download.01.org/0day-ci/archive/20231106/202311061351.zQO62btd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061351.zQO62btd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061351.zQO62btd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv6/icmp.c: In function 'icmpv6_route_lookup':
   net/ipv6/icmp.c:388:43: error: passing argument 1 of 'xfrm_decode_session_reverse' from incompatible pointer type [-Werror=incompatible-pointer-types]
     388 |         err = xfrm_decode_session_reverse(net, skb, flowi6_to_flowi(&fl2), AF_INET6);
         |                                           ^~~
         |                                           |
         |                                           struct net *
   In file included from net/ipv6/icmp.c:65:
   include/net/xfrm.h:1299:63: note: expected 'struct sk_buff *' but argument is of type 'struct net *'
    1299 | static inline int xfrm_decode_session_reverse(struct sk_buff *skb,
         |                                               ~~~~~~~~~~~~~~~~^~~
   net/ipv6/icmp.c:388:48: error: passing argument 2 of 'xfrm_decode_session_reverse' from incompatible pointer type [-Werror=incompatible-pointer-types]
     388 |         err = xfrm_decode_session_reverse(net, skb, flowi6_to_flowi(&fl2), AF_INET6);
         |                                                ^~~
         |                                                |
         |                                                struct sk_buff *
   include/net/xfrm.h:1300:61: note: expected 'struct flowi *' but argument is of type 'struct sk_buff *'
    1300 |                                               struct flowi *fl,
         |                                               ~~~~~~~~~~~~~~^~
>> net/ipv6/icmp.c:388:53: warning: passing argument 3 of 'xfrm_decode_session_reverse' makes integer from pointer without a cast [-Wint-conversion]
     388 |         err = xfrm_decode_session_reverse(net, skb, flowi6_to_flowi(&fl2), AF_INET6);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~
         |                                                     |
         |                                                     struct flowi *
   include/net/xfrm.h:1301:60: note: expected 'unsigned int' but argument is of type 'struct flowi *'
    1301 |                                               unsigned int family)
         |                                               ~~~~~~~~~~~~~^~~~~~
   net/ipv6/icmp.c:388:15: error: too many arguments to function 'xfrm_decode_session_reverse'
     388 |         err = xfrm_decode_session_reverse(net, skb, flowi6_to_flowi(&fl2), AF_INET6);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/xfrm.h:1299:19: note: declared here
    1299 | static inline int xfrm_decode_session_reverse(struct sk_buff *skb,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/xfrm_decode_session_reverse +388 net/ipv6/icmp.c

   349	
   350	static struct dst_entry *icmpv6_route_lookup(struct net *net,
   351						     struct sk_buff *skb,
   352						     struct sock *sk,
   353						     struct flowi6 *fl6)
   354	{
   355		struct dst_entry *dst, *dst2;
   356		struct flowi6 fl2;
   357		int err;
   358	
   359		err = ip6_dst_lookup(net, sk, &dst, fl6);
   360		if (err)
   361			return ERR_PTR(err);
   362	
   363		/*
   364		 * We won't send icmp if the destination is known
   365		 * anycast unless we need to treat anycast as unicast.
   366		 */
   367		if (!READ_ONCE(net->ipv6.sysctl.icmpv6_error_anycast_as_unicast) &&
   368		    ipv6_anycast_destination(dst, &fl6->daddr)) {
   369			net_dbg_ratelimited("icmp6_send: acast source\n");
   370			dst_release(dst);
   371			return ERR_PTR(-EINVAL);
   372		}
   373	
   374		/* No need to clone since we're just using its address. */
   375		dst2 = dst;
   376	
   377		dst = xfrm_lookup(net, dst, flowi6_to_flowi(fl6), sk, 0);
   378		if (!IS_ERR(dst)) {
   379			if (dst != dst2)
   380				return dst;
   381		} else {
   382			if (PTR_ERR(dst) == -EPERM)
   383				dst = NULL;
   384			else
   385				return dst;
   386		}
   387	
 > 388		err = xfrm_decode_session_reverse(net, skb, flowi6_to_flowi(&fl2), AF_INET6);
   389		if (err)
   390			goto relookup_failed;
   391	
   392		err = ip6_dst_lookup(net, sk, &dst2, &fl2);
   393		if (err)
   394			goto relookup_failed;
   395	
   396		dst2 = xfrm_lookup(net, dst2, flowi6_to_flowi(&fl2), sk, XFRM_LOOKUP_ICMP);
   397		if (!IS_ERR(dst2)) {
   398			dst_release(dst);
   399			dst = dst2;
   400		} else {
   401			err = PTR_ERR(dst2);
   402			if (err == -EPERM) {
   403				dst_release(dst);
   404				return dst2;
   405			} else
   406				goto relookup_failed;
   407		}
   408	
   409	relookup_failed:
   410		if (dst)
   411			return dst;
   412		return ERR_PTR(err);
   413	}
   414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
