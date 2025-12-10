Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B261A27A123
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765362132; cv=none; b=VId0l6Z5nXTPbJl0kiFHTcO9BMvEkrHhuHQU617xD+EUReOHT+SZHDj0isZfKHfRd4iZjS7o7ejoKyHvMe70le6LFBpObS9D6Hi7efYPURPo0N4jK/QxqP00e7tiYVlyH8FY5vNeP0URYXKJzmnkK2dyqGZENcXzAtD3HJoxOc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765362132; c=relaxed/simple;
	bh=ULCIYiOYdyhw/nXcthd1qtDz81qhzoJOCuI4kMtlyLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kha6FwKdap75deODyH1HLCCidXGrC5mjL6SYbFv57unRwbelV2+rBrttVftJMtI/rIDlITLLBaZ0V1VCrcCzWMVmAY/YtvRdyEoSrVA6AQ04OKQ6mUDDF7Mqo15NY+GMLXbDf+NqbxGPcTOWcv+dkHFppnZyj9A6mc2RcoujPA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+AFm+Y2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+AFm+Y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765362129; x=1796898129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULCIYiOYdyhw/nXcthd1qtDz81qhzoJOCuI4kMtlyLw=;
  b=J+AFm+Y2TwN8LL1uD0nflfljMHp4fF6lh72zt1LqpVWkQgs9Hh7AO8+3
   7/4qnl95A4AL+j5HKCYFLoWPpBIPhKvu7xIaZ1ag5Ce4PqBYfOAv7n3mh
   WlMmqbCiaS4qBocH40fmypOVNawmTu48AB19ajosacuXW5x9GYAHplugG
   DP3u1uM9Bcx3R02pH4oazeET9Up/LHYoEDzM0XwcZiAq9i7jefH5AHPzX
   /26HRUc1oN384BOM9+DACCPDjhy7MH5HsgpDLOUWzAo51lmjLAfxQ5OiN
   6+r09xbVGCw1mkcI8qutFZwrG4a190EtH3Qe3SLZyC7hpTPHZ4c01lt+e
   w==;
X-CSE-ConnectionGUID: BRgYs53rTOi6tpJnwLnePA==
X-CSE-MsgGUID: VGoPvV5NQbaJSzLji3ojNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71177958"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="71177958"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 02:22:09 -0800
X-CSE-ConnectionGUID: 3NEyebmAShuFlHfj83EBXQ==
X-CSE-MsgGUID: 2EdTw0AWQ7a4T0Uj+Zh/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196082411"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2025 02:22:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTHKf-0000000035J-4659;
	Wed, 10 Dec 2025 10:22:05 +0000
Date: Wed, 10 Dec 2025 18:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubcore/net/ubcore_sock.c:73:39: sparse: sparse: restricted
 __be32 degrades to integer
Message-ID: <202512101830.7qQXxUnc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   56da8c1ec8638f6ad4df737a133a41b106a3ce42
commit: fa2cd1217a55bfd5ad96e991f64f72d9692844e1 [3508/3508] urma: add network framework facilities for ubcore.
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101830.7qQXxUnc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101830.7qQXxUnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101830.7qQXxUnc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/net/ubcore_sock.c:73:39: sparse: sparse: restricted __be32 degrades to integer
>> drivers/ub/urma/ubcore/net/ubcore_sock.c:78:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] s_addr @@     got unsigned int [usertype] addr @@
   drivers/ub/urma/ubcore/net/ubcore_sock.c:78:45: sparse:     expected restricted __be32 [usertype] s_addr
   drivers/ub/urma/ubcore/net/ubcore_sock.c:78:45: sparse:     got unsigned int [usertype] addr
>> drivers/ub/urma/ubcore/net/ubcore_sock.c:181:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __be32 [usertype] s_addr @@
   drivers/ub/urma/ubcore/net/ubcore_sock.c:181:35: sparse:     expected unsigned int [usertype] addr
   drivers/ub/urma/ubcore/net/ubcore_sock.c:181:35: sparse:     got restricted __be32 [usertype] s_addr
>> drivers/ub/urma/ubcore/net/ubcore_sock.c:348:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] _key @@     got int @@
   drivers/ub/urma/ubcore/net/ubcore_sock.c:348:24: sparse:     expected restricted __poll_t [usertype] _key
   drivers/ub/urma/ubcore/net/ubcore_sock.c:348:24: sparse:     got int
>> drivers/ub/urma/ubcore/net/ubcore_sock.c:527:29: sparse: sparse: restricted __poll_t degrades to integer
   drivers/ub/urma/ubcore/net/ubcore_sock.c:529:34: sparse: sparse: restricted __poll_t degrades to integer
--
>> drivers/ub/urma/ubcore/net/ubcore_session.c:38:31: sparse: sparse: symbol 'session_ctx' was not declared. Should it be static?

vim +73 drivers/ub/urma/ubcore/net/ubcore_sock.c

    68	
    69	static void k_parse_addr(union ubcore_net_addr_union *ub_addr, uint16_t port,
    70				 struct sockaddr *sk_addr, int *sk_addr_size)
    71	{
    72		if (ub_addr->in4.reserved1 == 0 &&
  > 73		    ub_addr->in4.reserved2 == htonl(IPV4_MAP_IPV6_PREFIX)) {
    74			struct sockaddr_in *sk_addr_in = (struct sockaddr_in *)sk_addr;
    75	
    76			sk_addr_in->sin_family = AF_INET;
    77			sk_addr_in->sin_port = htons(port);
  > 78			sk_addr_in->sin_addr.s_addr = ub_addr->in4.addr;
    79	
    80			*sk_addr_size = (int)sizeof(*sk_addr_in);
    81		} else {
    82			struct sockaddr_in6 *sk_addr_in6 =
    83				(struct sockaddr_in6 *)sk_addr;
    84	
    85			sk_addr_in6->sin6_family = AF_INET6;
    86			sk_addr_in6->sin6_port = htons(port);
    87			memcpy(&sk_addr_in6->sin6_addr, &ub_addr->in6,
    88			       sizeof(ub_addr->in6));
    89	
    90			*sk_addr_size = (int)sizeof(*sk_addr_in6);
    91		}
    92	}
    93	
    94	static int k_setsockopt_keepalive(struct socket *sock)
    95	{
    96		int keepidle = 5;
    97		int keepcnt = 3;
    98	
    99		sock_set_keepalive(sock->sk);
   100		tcp_sock_set_keepcnt(sock->sk, keepcnt);
   101		tcp_sock_set_keepidle(sock->sk, keepidle);
   102		tcp_sock_set_keepintvl(sock->sk, keepidle);
   103	
   104		return 0;
   105	}
   106	
   107	static inline void k_setsockopt_reuse(struct socket *sock)
   108	{
   109		sock->sk->sk_reuse = true;
   110	}
   111	
   112	static inline void k_close(struct socket *sock)
   113	{
   114		sock_release(sock);
   115	}
   116	
   117	static struct socket *k_listen(union ubcore_net_addr_union *ub_addr,
   118				       uint16_t port)
   119	{
   120		struct socket *sock = NULL;
   121		struct sockaddr_in6 sk_addr_inner = { 0 };
   122		struct sockaddr *sk_addr = (struct sockaddr *)&sk_addr_inner;
   123		int sk_addr_size, backlog = 128;
   124		int ret;
   125	
   126		k_parse_addr(ub_addr, port, sk_addr, &sk_addr_size);
   127	
   128		ret = sock_create(sk_addr->sa_family, SOCK_STREAM, 0, &sock);
   129		if (ret < 0) {
   130			ubcore_log_err("Failed to create socket");
   131			return NULL;
   132		}
   133	
   134		k_setsockopt_reuse(sock);
   135	
   136		ret = kernel_bind(sock, sk_addr, sk_addr_size);
   137		if (ret < 0) {
   138			ubcore_log_err("Failed to call kernel_bind, ret: %d.\n", ret);
   139			goto destroy_sock;
   140		}
   141	
   142		ret = kernel_listen(sock, backlog);
   143		if (ret < 0) {
   144			ubcore_log_err("Failed to call kernel_listen");
   145			goto destroy_sock;
   146		}
   147	
   148		return sock;
   149	
   150	destroy_sock:
   151		k_close(sock);
   152		return NULL;
   153	}
   154	
   155	static struct socket *k_accept(struct socket *sock,
   156				       union ubcore_net_addr_union *ub_addr)
   157	{
   158		struct socket *newsock = NULL;
   159		struct sockaddr_in6 sk_addr_inner = { 0 };
   160		struct sockaddr *sk_addr = (struct sockaddr *)&sk_addr_inner;
   161		int ret;
   162	
   163		ret = kernel_accept(sock, &newsock, 0);
   164		if (ret < 0) {
   165			ubcore_log_err("Failed to call kernel_accept");
   166			return NULL;
   167		}
   168	
   169		ret = kernel_getpeername(newsock, sk_addr);
   170		if (ret == sizeof(struct sockaddr_in6) &&
   171		    sk_addr->sa_family == AF_INET6) {
   172			struct sockaddr_in6 *sk_addr_in6 =
   173				(struct sockaddr_in6 *)sk_addr;
   174	
   175			memcpy(&ub_addr->in6, &sk_addr_in6->sin6_addr,
   176			       sizeof(sk_addr_in6->sin6_addr));
   177		} else if (ret == sizeof(struct sockaddr_in) &&
   178			   sk_addr->sa_family == AF_INET) {
   179			struct sockaddr_in *sk_addr_in = (struct sockaddr_in *)sk_addr;
   180	
 > 181			ub_addr->in4.addr = sk_addr_in->sin_addr.s_addr;
   182			ub_addr->in4.reserved2 = IPV4_MAP_IPV6_PREFIX;
   183		} else {
   184			ubcore_log_err("Failed to call kernel_getpeername");
   185			goto destroy_sock;
   186		}
   187	
   188		ret = k_setsockopt_keepalive(newsock);
   189		if (ret < 0) {
   190			ubcore_log_err("Failed to set socket keepalive");
   191			goto destroy_sock;
   192		}
   193	
   194		return newsock;
   195	
   196	destroy_sock:
   197		k_close(newsock);
   198		return NULL;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
