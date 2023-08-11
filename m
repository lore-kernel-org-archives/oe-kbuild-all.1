Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B1263B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691763072; x=1723299072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JUY3giJXfjrwBofmYpvNTTsoVy5N5DNKsbuqWvnqYM=;
  b=hbrQQVU+1E691iTCTzDaEXzEIhNplwKvV4/TbUvv8HC8vfwzCgYFvItO
   riB5lkwzQuqqF6mrQ7ArcPEJUnLexCE8WYuW8zsQ9M4Xd1ZsHT5LooglY
   0y8Sh6NSconeHbmKmfkenTviuVKA8fwUKo1eOSOiiHvI5qSQ6fs0ACWyT
   z+oyrt9UP27co2clVtrmrtr1T7ZWI1PfGJgC1tMMlFSut9qqgPFoRzz8+
   hfHyREBfHEwi+0ACt6QnKpCkxrI6/4raETcRdf0XikJRuzlfw4BNspZ3o
   MWS/z9t7UNw2MuXrSBZIYH0ioeY3PeVCWbWYjGLjQ+HUAeixuTXqGXJOU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369154128"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="369154128"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 07:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726274322"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="726274322"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Aug 2023 07:10:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUSqg-0007pI-2j;
	Fri, 11 Aug 2023 14:10:42 +0000
Date: Fri, 11 Aug 2023 22:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
	Soheil Hassas Yeganeh <soheil@google.com>, netdev@vger.kernel.org,
	eric.dumazet@gmail.com, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v2 net-next 07/15] inet: move inet->mc_loop to
 inet->inet_frags
Message-ID: <202308112211.xpcXWwEP-lkp@intel.com>
References: <20230811073621.2874702-8-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811073621.2874702-8-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/inet-introduce-inet-inet_flags/20230811-154157
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230811073621.2874702-8-edumazet%40google.com
patch subject: [PATCH v2 net-next 07/15] inet: move inet->mc_loop to inet->inet_frags
config: nios2-randconfig-r001-20230811 (https://download.01.org/0day-ci/archive/20230811/202308112211.xpcXWwEP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308112211.xpcXWwEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308112211.xpcXWwEP-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_sync.c: In function 'set_mcast_loop':
>> net/netfilter/ipvs/ip_vs_sync.c:1304:13: error: 'struct inet_sock' has no member named 'mc_loop'
    1304 |         inet->mc_loop = loop ? 1 : 0;
         |             ^~


vim +1304 net/netfilter/ipvs/ip_vs_sync.c

1c003b1580e20f net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1294  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1295  /*
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1296   *      Setup loopback of outgoing multicasts on a sending socket
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1297   */
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1298  static void set_mcast_loop(struct sock *sk, u_char loop)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1299  {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1300  	struct inet_sock *inet = inet_sk(sk);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1301  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1302  	/* setsockopt(sock, SOL_IP, IP_MULTICAST_LOOP, &loop, sizeof(loop)); */
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1303  	lock_sock(sk);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16 @1304  	inet->mc_loop = loop ? 1 : 0;
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1305  #ifdef CONFIG_IP_VS_IPV6
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1306  	if (sk->sk_family == AF_INET6) {
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1307  		struct ipv6_pinfo *np = inet6_sk(sk);
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1308  
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1309  		/* IPV6_MULTICAST_LOOP */
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1310  		np->mc_loop = loop ? 1 : 0;
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1311  	}
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1312  #endif
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1313  	release_sock(sk);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1314  }
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
