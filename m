Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BF1DF258
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 10:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742466618; cv=none; b=lDhU0GdmFqDJtDk7T/JQ2UHcFgMzCatokX5qfOe5ytJ5JneAaB4GariSHorqk5EIka/utWVcl2UjlqbOtf2/UZ+TOymDZiPlM7BgIebStcHivuHU9AKcieLTMev6nspPmIeTJKauvOE3pvaP4QUrirz0iNMFCwXFo4mlC32QyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742466618; c=relaxed/simple;
	bh=MDJ6Q+K9Cb53KDjZbAJOj9s/q4xdLzzvKQUJuE+AuFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzdeXGcvuHCmEQuQhx7UdimEoL/TpOrHbvrWMILQqMfyD/IyZp5ZS5jbZHNuL5OepgYaL9x4bgGKCYwPJVGdoF3T1tOgpr4etwXdpdq4MlTMZgxsWiM1TjTXazrAH1E9ffVmNPYTtVy+S20461oclQi6qHz9HATnxiNBQT9flDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqK1H4tn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqK1H4tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742466616; x=1774002616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDJ6Q+K9Cb53KDjZbAJOj9s/q4xdLzzvKQUJuE+AuFU=;
  b=cqK1H4tnzXRjeRVQ/o0TuFODwPh9WYi+pHIx5nAmMuNmYQ147o1JlqCx
   V31u7eL2wOGHpWdWI5HM9NXVByea3zPs01xEjjvRtyQH2yrGHknock/j1
   ztycy/WGx9c92+J4Lmn7ehxT6Go2B93j0Aussp2xfD5GPEX8nUX9NJcZm
   Xh0JGdxFkDOfwWNuyDsPUCcrImK5yssgGAMVJju11JGsQOCB2QQoUtYWz
   HOULjssjduhDVXa5NZNtAazkCmNrr9qiqxDPjdQLXRHRVQvfXAwUO6Lbm
   +8xxh2JFE40hcvdRFII2DuVPaMrTE3s/dXyFr8AFRm3wFtWrSilmpcuay
   w==;
X-CSE-ConnectionGUID: 1UlX1gYRSICKLx1HWT+8jQ==
X-CSE-MsgGUID: HNF3VutKTXaELfenMkghOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="66151326"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="66151326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 03:30:15 -0700
X-CSE-ConnectionGUID: Ye2nHJdFQsq7RgLue/bXnQ==
X-CSE-MsgGUID: 4A6Sz3qPRjesxf4kXpO/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="128146074"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2025 03:30:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvDA7-0000N9-0z;
	Thu, 20 Mar 2025 10:30:08 +0000
Date: Thu, 20 Mar 2025 18:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1509/1509]
 net/netfilter/ipvs/ip_vs_ctl.c:2480:9: warning: 'ret' may be used
 uninitialized in this function
Message-ID: <202503201839.XDDCG7DI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d54ba3f54612a8622df13d42bc1870048cb63d20
commit: 56ee6566622b8a8f58ec8d99e403d4ba9f29e693 [1509/1509] ipvs: Fix uninit-value in do_ip_vs_set_ctl()
config: arm64-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201839.XDDCG7DI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201839.XDDCG7DI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201839.XDDCG7DI-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_ctl.c: In function 'do_ip_vs_set_ctl':
>> net/netfilter/ipvs/ip_vs_ctl.c:2480:9: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
    2480 |  return ret;
         |         ^~~


vim +/ret +2480 net/netfilter/ipvs/ip_vs_ctl.c

c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2337  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2338  static int
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2339  do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2340  {
fc723250c9cb04 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-01-03  2341  	struct net *net = sock_net(sk);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2342  	int ret;
5fcf0cf6073d4a net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2014-09-03  2343  	unsigned char arg[MAX_SET_ARGLEN];
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2344  	struct ip_vs_service_user *usvc_compat;
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2345  	struct ip_vs_service_user_kern usvc;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2346  	struct ip_vs_service *svc;
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2347  	struct ip_vs_dest_user *udest_compat;
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2348  	struct ip_vs_dest_user_kern udest;
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2349  	struct netns_ipvs *ipvs = net_ipvs(net);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2350  
5fcf0cf6073d4a net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2014-09-03  2351  	BUILD_BUG_ON(sizeof(arg) > 255);
df008c91f83583 net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2012-11-16  2352  	if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2353  		return -EPERM;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2354  
04bcef2a83f40c net/netfilter/ipvs/ip_vs_ctl.c Arjan van de Ven    2010-01-04  2355  	if (cmd < IP_VS_BASE_CTL || cmd > IP_VS_SO_SET_MAX)
04bcef2a83f40c net/netfilter/ipvs/ip_vs_ctl.c Arjan van de Ven    2010-01-04  2356  		return -EINVAL;
5fcf0cf6073d4a net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2014-09-03  2357  	if (len != set_arglen[CMDID(cmd)]) {
5fcf0cf6073d4a net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2014-09-03  2358  		IP_VS_DBG(1, "set_ctl: len %u != %u\n",
5fcf0cf6073d4a net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2014-09-03  2359  			  len, set_arglen[CMDID(cmd)]);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2360  		return -EINVAL;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2361  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2362  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2363  	if (copy_from_user(arg, user, len) != 0)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2364  		return -EFAULT;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2365  
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2366  	/* Handle daemons since they have another lock */
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2367  	if (cmd == IP_VS_SO_SET_STARTDAEMON ||
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2368  	    cmd == IP_VS_SO_SET_STOPDAEMON) {
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2369  		struct ip_vs_daemon_user *dm = (struct ip_vs_daemon_user *)arg;
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2370  
e0b26cc997d573 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2015-07-26  2371  		if (cmd == IP_VS_SO_SET_STARTDAEMON) {
e4ff67513096e6 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2015-07-26  2372  			struct ipvs_sync_daemon_cfg cfg;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2015-07-26  2373  
e4ff67513096e6 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2015-07-26  2374  			memset(&cfg, 0, sizeof(cfg));
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2375  			ret = -EINVAL;
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2376  			if (strscpy(cfg.mcast_ifn, dm->mcast_ifn,
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2377  				    sizeof(cfg.mcast_ifn)) <= 0)
e2eda307807970 net/netfilter/ipvs/ip_vs_ctl.c Davide Caratti      2019-11-13  2378  				return ret;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2015-07-26  2379  			cfg.syncid = dm->syncid;
6ac121d710697c net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2380  			ret = start_sync_thread(ipvs, &cfg, dm->state);
e0b26cc997d573 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2015-07-26  2381  		} else {
b3cf3cbfb57c27 net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2382  			ret = stop_sync_thread(ipvs, dm->state);
e0b26cc997d573 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2015-07-26  2383  		}
e2eda307807970 net/netfilter/ipvs/ip_vs_ctl.c Davide Caratti      2019-11-13  2384  		return ret;
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2385  	}
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_ctl.c Hans Schillstrom    2011-10-11  2386  
7926dbfa4bc14e net/netfilter/ipvs/ip_vs_ctl.c Pablo Neira Ayuso   2014-07-31  2387  	mutex_lock(&__ip_vs_mutex);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2388  	if (cmd == IP_VS_SO_SET_FLUSH) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2389  		/* Flush the virtual service */
ef7c599d91172d net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2390  		ret = ip_vs_flush(ipvs, false);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2391  		goto out_unlock;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2392  	} else if (cmd == IP_VS_SO_SET_TIMEOUT) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2393  		/* Set timeout values for (tcp tcpfin udp) */
f1faa1e7495445 net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2394  		ret = ip_vs_set_timeout(ipvs, (struct ip_vs_timeout_user *)arg);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2395  		goto out_unlock;
56ee6566622b8a net/netfilter/ipvs/ip_vs_ctl.c Peilin Ye           2020-11-04  2396  	} else if (!len) {
56ee6566622b8a net/netfilter/ipvs/ip_vs_ctl.c Peilin Ye           2020-11-04  2397  		/* No more commands with len == 0 below */
56ee6566622b8a net/netfilter/ipvs/ip_vs_ctl.c Peilin Ye           2020-11-04  2398  		ret = -EINVAL;
56ee6566622b8a net/netfilter/ipvs/ip_vs_ctl.c Peilin Ye           2020-11-04  2399  		goto out_unlock;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2400  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2401  
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2402  	usvc_compat = (struct ip_vs_service_user *)arg;
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2403  	udest_compat = (struct ip_vs_dest_user *)(usvc_compat + 1);
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2404  
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2405  	/* We only use the new structs internally, so copy userspace compat
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2406  	 * structs to extended internal versions */
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2407  	ip_vs_copy_usvc_compat(&usvc, usvc_compat);
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2408  	ip_vs_copy_udest_compat(&udest, udest_compat);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2409  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2410  	if (cmd == IP_VS_SO_SET_ZERO) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2411  		/* if no service address is set, zero counters in all */
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2412  		if (!usvc.fwmark && !usvc.addr.ip && !usvc.port) {
c60856c687d601 net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2413  			ret = ip_vs_zero_all(ipvs);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2414  			goto out_unlock;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2415  		}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2416  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2417  
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2418  	if ((cmd == IP_VS_SO_SET_ADD || cmd == IP_VS_SO_SET_EDIT) &&
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2419  	    strnlen(usvc.sched_name, IP_VS_SCHEDNAME_MAXLEN) ==
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2420  	    IP_VS_SCHEDNAME_MAXLEN) {
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2421  		ret = -EINVAL;
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2422  		goto out_unlock;
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2423  	}
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2424  
2906f66a5682e5 net/netfilter/ipvs/ip_vs_ctl.c Venkata Mohan Reddy 2010-02-18  2425  	/* Check for valid protocol: TCP or UDP or SCTP, even for fwmark!=0 */
2906f66a5682e5 net/netfilter/ipvs/ip_vs_ctl.c Venkata Mohan Reddy 2010-02-18  2426  	if (usvc.protocol != IPPROTO_TCP && usvc.protocol != IPPROTO_UDP &&
2906f66a5682e5 net/netfilter/ipvs/ip_vs_ctl.c Venkata Mohan Reddy 2010-02-18  2427  	    usvc.protocol != IPPROTO_SCTP) {
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2428  		pr_err("set_ctl: invalid protocol: %d %pI4:%d\n",
14d5e834f6b366 net/netfilter/ipvs/ip_vs_ctl.c Harvey Harrison     2008-10-31  2429  		       usvc.protocol, &usvc.addr.ip,
52f96757905bbf net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2018-05-19  2430  		       ntohs(usvc.port));
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2431  		ret = -EFAULT;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2432  		goto out_unlock;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2433  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2434  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2435  	/* Lookup the exact service by <protocol, addr, port> or fwmark */
ceec4c38168184 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2013-03-22  2436  	rcu_read_lock();
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2437  	if (usvc.fwmark == 0)
bb2e2a8c957fd1 net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2438  		svc = __ip_vs_service_find(ipvs, usvc.af, usvc.protocol,
b18610de9ec272 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2439  					   &usvc.addr, usvc.port);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2440  	else
1ed8b947806155 net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2441  		svc = __ip_vs_svc_fwm_find(ipvs, usvc.af, usvc.fwmark);
ceec4c38168184 net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2013-03-22  2442  	rcu_read_unlock();
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2443  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2444  	if (cmd != IP_VS_SO_SET_ADD
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2445  	    && (svc == NULL || svc->protocol != usvc.protocol)) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2446  		ret = -ESRCH;
26c15cfd291f8b net/netfilter/ipvs/ip_vs_ctl.c Julian Anastasov    2010-09-21  2447  		goto out_unlock;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2448  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2449  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2450  	switch (cmd) {
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2451  	case IP_VS_SO_SET_ADD:
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2452  		if (svc != NULL)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2453  			ret = -EEXIST;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2454  		else
5060bd8307fcfb net/netfilter/ipvs/ip_vs_ctl.c Eric W. Biederman   2015-09-21  2455  			ret = ip_vs_add_service(ipvs, &usvc, &svc);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2456  		break;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2457  	case IP_VS_SO_SET_EDIT:
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2458  		ret = ip_vs_edit_service(svc, &usvc);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2459  		break;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2460  	case IP_VS_SO_SET_DEL:
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2461  		ret = ip_vs_del_service(svc);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2462  		if (!ret)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2463  			goto out_unlock;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2464  		break;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2465  	case IP_VS_SO_SET_ZERO:
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2466  		ret = ip_vs_zero_service(svc);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2467  		break;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2468  	case IP_VS_SO_SET_ADDDEST:
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2469  		ret = ip_vs_add_dest(svc, &udest);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2470  		break;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2471  	case IP_VS_SO_SET_EDITDEST:
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2472  		ret = ip_vs_edit_dest(svc, &udest);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2473  		break;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2474  	case IP_VS_SO_SET_DELDEST:
c860c6b1479992 net/ipv4/ipvs/ip_vs_ctl.c      Julius Volz         2008-09-02  2475  		ret = ip_vs_del_dest(svc, &udest);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2476  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2477  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2478    out_unlock:
14cc3e2b633bb6 net/ipv4/ipvs/ip_vs_ctl.c      Ingo Molnar         2006-03-26  2479  	mutex_unlock(&__ip_vs_mutex);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16 @2480  	return ret;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2481  }
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_ctl.c      Linus Torvalds      2005-04-16  2482  

:::::: The code at line 2480 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
