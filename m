Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9758A193079
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 00:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699734; cv=none; b=UCiycmDF0IY0SBJk247Z20KCD1AM7lMwXLMKG8MNa5jLSADLF6amy/iPmD0eDKFghlNxoxW32XPquDOzmpQNZ7zXkvaYNmVEHZrRsVVooF8dD6wvZ5jVhLSQVhXw/LXS+EcT22+KyG+eTyQ2dId6MDhgjnWV5ssh8iXJANd1n0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699734; c=relaxed/simple;
	bh=SiJdWKM27ZOXVu0kDKEF8w7dQSNkXjZJTZve908vh+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c1rQUkfiLCwOo/4vQzkz97OJOFhvV9ww4bioVJn76LLQGDvr8YBGR5ULFrm4PT94AO8bCbENBKJ6M0VobpMJ5lbXynnfWKmdVQgWipms1w4JXzVdUkewqTEelPHMBWjwTNcmMLHJM6vugzuKJkXiFeOiBfT4pqhKEgg0+lSdADU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4YbFX3o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4YbFX3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754699732; x=1786235732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SiJdWKM27ZOXVu0kDKEF8w7dQSNkXjZJTZve908vh+o=;
  b=S4YbFX3oaeBPh7iY/VyYMvSMF7BHSNiU+3HjW0kMZQ3wCwB8hP6lANrz
   nXk7b2bWPLgfGdrdqJh25MvUpWwf+jPKmD4N7MRCGcSj/jpRXgbcIb3Bd
   SGi7VN39M/ebOPvSaYpyVqj3qSxIGoPPJqCP0mPcSTGIHCiWw48wiZX6L
   2yX3AIzp+YOEdkq9vNH5zzYJFYOj312vKvesaVCIAhCzMPk375rQ9w9SO
   eJthzZTM5I40y6j6qSFj1p+ZsR8Du1SbKysVFxjaqjHUBaED0SkxZgGbO
   TrxhOgzVRK1QO0uo6G5+t0tFs1tlCT//lgQsXt0PEEW1MhydPcY/H14rh
   A==;
X-CSE-ConnectionGUID: at+nzNUQQB2R/vagjncrWA==
X-CSE-MsgGUID: fjcppERjT1uLLlRSBNAazw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68133084"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68133084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 17:35:32 -0700
X-CSE-ConnectionGUID: Kghh4k5IR0OzB1c2lQY5KA==
X-CSE-MsgGUID: WK56bjtiR3qsk5ckg9UibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166242019"
Received: from unknown (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 08 Aug 2025 17:35:31 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukXYW-0002hv-2f;
	Sat, 09 Aug 2025 00:35:28 +0000
Date: Sat, 9 Aug 2025 02:35:05 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753]
 net/rxrpc/local_object.c:152:20: warning: this statement may fall through
Message-ID: <202508090248.C7MgyZmS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   748957057cef2d3b3e35d749c9a1ade66e2b5e73
commit: 37a675e768d7606fe8a53e0c459c9b53e121ac20 [1753/1753] rxrpc: Fix transport sockopts to get IPv4 errors on an IPv6 socket
config: x86_64-buildonly-randconfig-2002-20250806 (https://download.01.org/0day-ci/archive/20250809/202508090248.C7MgyZmS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090248.C7MgyZmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090248.C7MgyZmS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/rxrpc/local_object.c: In function 'rxrpc_open_socket':
>> net/rxrpc/local_object.c:152:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     152 |                 if (ret < 0) {
         |                    ^
   net/rxrpc/local_object.c:161:9: note: here
     161 |         case AF_INET:
         |         ^~~~


vim +152 net/rxrpc/local_object.c

17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  104  
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  105  /*
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  106   * create the local socket
4f95dd78a77edc net/rxrpc/local_object.c David Howells   2016-04-04  107   * - must be called with rxrpc_local_mutex locked
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  108   */
2baec2c3f854d1 net/rxrpc/local_object.c David Howells   2017-05-24  109  static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  110  {
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  111  	struct sock *sock;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  112  	int ret, opt;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  113  
75b54cb57ca34c net/rxrpc/local_object.c David Howells   2016-09-13  114  	_enter("%p{%d,%d}",
75b54cb57ca34c net/rxrpc/local_object.c David Howells   2016-09-13  115  	       local, local->srx.transport_type, local->srx.transport.family);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  116  
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  117  	/* create a socket to represent the local endpoint */
2baec2c3f854d1 net/rxrpc/local_object.c David Howells   2017-05-24  118  	ret = sock_create_kern(net, local->srx.transport.family,
aaa31cbc667333 net/rxrpc/local_object.c David Howells   2016-09-13  119  			       local->srx.transport_type, 0, &local->socket);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  120  	if (ret < 0) {
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  121  		_leave(" = %d [socket]", ret);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  122  		return ret;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  123  	}
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  124  
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  125  	/* if a local address was supplied then bind it */
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  126  	if (local->srx.transport_len > sizeof(sa_family_t)) {
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  127  		_debug("bind");
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  128  		ret = kernel_bind(local->socket,
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  129  				  (struct sockaddr *)&local->srx.transport,
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  130  				  local->srx.transport_len);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  131  		if (ret < 0) {
4f95dd78a77edc net/rxrpc/local_object.c David Howells   2016-04-04  132  			_debug("bind failed %d", ret);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  133  			goto error;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  134  		}
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  135  	}
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  136  
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  137  	switch (local->srx.transport.family) {
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  138  	case AF_INET6:
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  139  		/* we want to receive ICMPv6 errors */
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  140  		opt = 1;
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  141  		ret = kernel_setsockopt(local->socket, SOL_IPV6, IPV6_RECVERR,
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  142  					(char *) &opt, sizeof(opt));
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  143  		if (ret < 0) {
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  144  			_debug("setsockopt failed");
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  145  			goto error;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  146  		}
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  147  
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  148  		/* we want to set the don't fragment bit */
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  149  		opt = IPV6_PMTUDISC_DO;
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  150  		ret = kernel_setsockopt(local->socket, SOL_IPV6, IPV6_MTU_DISCOVER,
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  151  					(char *) &opt, sizeof(opt));
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26 @152  		if (ret < 0) {
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  153  			_debug("setsockopt failed");
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  154  			goto error;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  155  		}
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  156  
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  157  		/* Fall through and set IPv4 options too otherwise we don't get
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  158  		 * errors from IPv4 packets sent through the IPv6 socket.
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  159  		 */
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  160  
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  161  	case AF_INET:
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  162  		/* we want to receive ICMP errors */
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  163  		opt = 1;
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  164  		ret = kernel_setsockopt(local->socket, SOL_IP, IP_RECVERR,
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  165  					(char *) &opt, sizeof(opt));
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  166  		if (ret < 0) {
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  167  			_debug("setsockopt failed");
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  168  			goto error;
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  169  		}
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  170  
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  171  		/* we want to set the don't fragment bit */
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  172  		opt = IP_PMTUDISC_DO;
37a675e768d760 net/rxrpc/local_object.c David Howells   2018-09-27  173  		ret = kernel_setsockopt(local->socket, SOL_IP, IP_MTU_DISCOVER,
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  174  					(char *) &opt, sizeof(opt));
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  175  		if (ret < 0) {
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  176  			_debug("setsockopt failed");
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  177  			goto error;
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  178  		}
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  179  
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  180  		/* We want receive timestamps. */
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  181  		opt = 1;
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  182  		ret = kernel_setsockopt(local->socket, SOL_SOCKET, SO_TIMESTAMPNS,
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  183  					(char *)&opt, sizeof(opt));
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  184  		if (ret < 0) {
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  185  			_debug("setsockopt failed");
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  186  			goto error;
b604dd9883f783 net/rxrpc/local_object.c David Howells   2018-09-27  187  		}
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  188  		break;
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  189  
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  190  	default:
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  191  		BUG();
f2aeed3a591ff2 net/rxrpc/local_object.c David Howells   2018-05-10  192  	}
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  193  
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  194  	/* set the socket up */
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  195  	sock = local->socket->sk;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  196  	sock->sk_user_data	= local;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  197  	sock->sk_data_ready	= rxrpc_data_ready;
abe89ef0ed1a50 net/rxrpc/local_object.c David Howells   2016-04-04  198  	sock->sk_error_report	= rxrpc_error_report;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  199  	_leave(" = 0");
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  200  	return 0;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  201  
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  202  error:
91cf45f02af5c8 net/rxrpc/ar-local.c     Trond Myklebust 2007-11-12  203  	kernel_sock_shutdown(local->socket, SHUT_RDWR);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  204  	local->socket->sk->sk_user_data = NULL;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  205  	sock_release(local->socket);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  206  	local->socket = NULL;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  207  
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  208  	_leave(" = %d", ret);
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  209  	return ret;
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  210  }
17926a79320afa net/rxrpc/ar-local.c     David Howells   2007-04-26  211  

:::::: The code at line 152 was first introduced by commit
:::::: 17926a79320afa9b95df6b977b40cca6d8713cea [AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
