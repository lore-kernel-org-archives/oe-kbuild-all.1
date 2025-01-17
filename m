Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AAF1FBC81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737111210; cv=none; b=ErHpK9NvC6lRXKRX8Q3h+PMfcURMX1HolFG5MIJQicT6KqMC1kV/94FKyyNh374K8Gb07vXTwh9JesIPFydJ4WFaiBKnEKuF3zSuv/6KZ2jQRfMhAh286Pm3eYIOUkbVrDHRl8biJqY+FdbktdCiqBFTEDQx61+vSQKz2hBYqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737111210; c=relaxed/simple;
	bh=r/LKNmg9TMwt60KMbh1ZXHE/n4pUCMtsBAW4xRZb17c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OS+q3NNvXIgKKTUeKlVvPGgO1gEP4VMAI9FsY3M52dL8YDXaY4+KGKOdnJe8Qpnd7n4fflDxES3kwTLr6313c+9sQkJj6T+eaIr0U8m3nC9gCDS8IgG0V4VVsA2k4oLD3a8KO0Pp59O1sdhs2yJUA1h1dLKu+5cYb1CGDxWps4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjINYvKo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjINYvKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737111208; x=1768647208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/LKNmg9TMwt60KMbh1ZXHE/n4pUCMtsBAW4xRZb17c=;
  b=PjINYvKou47LRIeMKrqUf2B0TgxUimQlnd214ofR4AvW4HA98iTrzMP0
   3bR/XKqGEDWgUvitUQtpvZUtVP2VUJ1RI0NzYBOf8df6i4VwvqO3z+Jw6
   E2rg57YurrZhiaDAExGq1H1o2Vjp8kHACSpeBZnyCGi3ImUkRn5vwMbW6
   stF+sVxC8BVpTpt0l8XRsUuC4QDl4kCguxeZk2ZBIkLSZ9rW7rZT5H8SG
   QaPn8VS4neWIObL5xGwgT3Z1QpB5X0ZqulvBP+3T1LkJKl6Ft9FmT18Ck
   N5GDW3uBb359n+cyuJqL6L2uw3fLNJNdcTHJez0C+cL7pFGqbBBLNip/K
   g==;
X-CSE-ConnectionGUID: B2M3rik7QXSmKWAjDECrKw==
X-CSE-MsgGUID: KhdSb4vlT7mwSnpBZgrwjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37233077"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37233077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 02:53:28 -0800
X-CSE-ConnectionGUID: JwP1pFwKTQqWJL2JKnyUgA==
X-CSE-MsgGUID: iOCNUV88QFeLq3okrDW5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143059701"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 02:53:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYjyd-000T5b-1L;
	Fri, 17 Jan 2025 10:53:23 +0000
Date: Fri, 17 Jan 2025 18:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:ipsec-fixes 11/11] net/xfrm/xfrm_output.c:851:49: error:
 implicit declaration of function 'ip6_skb_dst_mtu'; did you mean
 'ip_skb_dst_mtu'?
Message-ID: <202501171845.KqSQG9v9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git ipsec-fixes
head:   3bbb0d5d23db82d8493191fc103c4c2b26decc13
commit: 3bbb0d5d23db82d8493191fc103c4c2b26decc13 [11/11] xfrm: check for PMTU in tunnel mode for packet offload
config: riscv-randconfig-001-20250116 (https://download.01.org/0day-ci/archive/20250117/202501171845.KqSQG9v9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171845.KqSQG9v9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171845.KqSQG9v9-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/xfrm/xfrm_output.c:837:5: error: redefinition of 'xfrm6_tunnel_check_size'
     837 | int xfrm6_tunnel_check_size(struct sk_buff *skb)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/xfrm/xfrm_output.c:19:
   include/net/xfrm.h:1789:19: note: previous definition of 'xfrm6_tunnel_check_size' with type 'int(struct sk_buff *)'
    1789 | static inline int xfrm6_tunnel_check_size(struct sk_buff *skb)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_output.c: In function 'xfrm6_tunnel_check_size':
>> net/xfrm/xfrm_output.c:851:49: error: implicit declaration of function 'ip6_skb_dst_mtu'; did you mean 'ip_skb_dst_mtu'? [-Wimplicit-function-declaration]
     851 |              !skb_gso_validate_network_len(skb, ip6_skb_dst_mtu(skb)))) {
         |                                                 ^~~~~~~~~~~~~~~
         |                                                 ip_skb_dst_mtu
>> net/xfrm/xfrm_output.c:855:21: error: implicit declaration of function 'xfrm6_local_dontfrag'; did you mean 'xfrm6_local_error'? [-Wimplicit-function-declaration]
     855 |                 if (xfrm6_local_dontfrag(skb->sk))
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     xfrm6_local_error


vim +851 net/xfrm/xfrm_output.c

6d64be3da28290 Florian Westphal 2020-05-04  836  
3bbb0d5d23db82 Leon Romanovsky  2025-01-16  837  int xfrm6_tunnel_check_size(struct sk_buff *skb)
f3075f48ddb2c4 Florian Westphal 2020-05-04  838  {
f3075f48ddb2c4 Florian Westphal 2020-05-04  839  	int mtu, ret = 0;
f3075f48ddb2c4 Florian Westphal 2020-05-04  840  	struct dst_entry *dst = skb_dst(skb);
f3075f48ddb2c4 Florian Westphal 2020-05-04  841  
f3075f48ddb2c4 Florian Westphal 2020-05-04  842  	if (skb->ignore_df)
f3075f48ddb2c4 Florian Westphal 2020-05-04  843  		goto out;
f3075f48ddb2c4 Florian Westphal 2020-05-04  844  
f3075f48ddb2c4 Florian Westphal 2020-05-04  845  	mtu = dst_mtu(dst);
f3075f48ddb2c4 Florian Westphal 2020-05-04  846  	if (mtu < IPV6_MIN_MTU)
f3075f48ddb2c4 Florian Westphal 2020-05-04  847  		mtu = IPV6_MIN_MTU;
f3075f48ddb2c4 Florian Westphal 2020-05-04  848  
f3075f48ddb2c4 Florian Westphal 2020-05-04  849  	if ((!skb_is_gso(skb) && skb->len > mtu) ||
f3075f48ddb2c4 Florian Westphal 2020-05-04  850  	    (skb_is_gso(skb) &&
f3075f48ddb2c4 Florian Westphal 2020-05-04 @851  	     !skb_gso_validate_network_len(skb, ip6_skb_dst_mtu(skb)))) {
f3075f48ddb2c4 Florian Westphal 2020-05-04  852  		skb->dev = dst->dev;
f3075f48ddb2c4 Florian Westphal 2020-05-04  853  		skb->protocol = htons(ETH_P_IPV6);
f3075f48ddb2c4 Florian Westphal 2020-05-04  854  
f3075f48ddb2c4 Florian Westphal 2020-05-04 @855  		if (xfrm6_local_dontfrag(skb->sk))
f3075f48ddb2c4 Florian Westphal 2020-05-04  856  			ipv6_stub->xfrm6_local_rxpmtu(skb, mtu);
f3075f48ddb2c4 Florian Westphal 2020-05-04  857  		else if (skb->sk)
f3075f48ddb2c4 Florian Westphal 2020-05-04  858  			xfrm_local_error(skb, mtu);
f3075f48ddb2c4 Florian Westphal 2020-05-04  859  		else
f3075f48ddb2c4 Florian Westphal 2020-05-04  860  			icmpv6_send(skb, ICMPV6_PKT_TOOBIG, 0, mtu);
f3075f48ddb2c4 Florian Westphal 2020-05-04  861  		ret = -EMSGSIZE;
f3075f48ddb2c4 Florian Westphal 2020-05-04  862  	}
f3075f48ddb2c4 Florian Westphal 2020-05-04  863  out:
f3075f48ddb2c4 Florian Westphal 2020-05-04  864  	return ret;
f3075f48ddb2c4 Florian Westphal 2020-05-04  865  }
3bbb0d5d23db82 Leon Romanovsky  2025-01-16  866  EXPORT_SYMBOL_GPL(xfrm6_tunnel_check_size);
f3075f48ddb2c4 Florian Westphal 2020-05-04  867  

:::::: The code at line 851 was first introduced by commit
:::::: f3075f48ddb2c4d076aeda36fa0939163e4b2816 xfrm: remove extract_output indirection from xfrm_state_afinfo

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: Steffen Klassert <steffen.klassert@secunet.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
