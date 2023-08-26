Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475CD1094A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693083854; x=1724619854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5e7zvIDzt6MlPP27QgY6939QdtqRT4VbY0augrMUPQ=;
  b=gB9bf/QK5XAba3/2d0tMTtCJIWMs+wXq+PsQJe1Cu039iS9f8bxe1ahh
   ebW2Bv1hD4gab1znlAjIVvoCyglT/cSIeUOjXNSzJo2DShPdFKzxM/oDu
   YPEtAlcXvtNbbmKESK/1h2ktRu2RHHtcI02k4ozSYdcrr+y+QUVJrZgLd
   MlR4oCATfBnnjY9VLqhUMWm+lTysILBlcXOAMvACSXta+1gtMBqXyEYYq
   UAuFHnUi4DEdLyuzAMy7FzpMmRNsJHl520G1d/I69rWIAzO5rf29k/q7p
   E+xcNvLCnc8RInUlGWwoI0jKjEku/3EpsTwH+W2fz+yZ6/+VaXO727Edv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="372299180"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="372299180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 14:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="807876118"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="807876118"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2023 14:04:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa0Rt-00054z-23;
	Sat, 26 Aug 2023 21:04:04 +0000
Date: Sun, 27 Aug 2023 05:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 11/11]
 net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before
 'name'
Message-ID: <202308270409.tKukia85-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   ee8dbca703c8d81200c2be455c377bab893206c4
commit: ee8dbca703c8d81200c2be455c377bab893206c4 [11/11] kthread: Provide a mechanism to control kthread sched_attr
config: i386-randconfig-r026-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270409.tKukia85-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270409.tKukia85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270409.tKukia85-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:22,
                    from net/netfilter/ipvs/ip_vs_sync.c:38:
   net/netfilter/ipvs/ip_vs_sync.c: In function 'start_sync_thread':
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:17:9: note: in expansion of macro '__kthread_param'
      17 |         __kthread_param(name, unsigned long, sched_policy);             \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:18:9: note: in expansion of macro '__kthread_param'
      18 |         __kthread_param(name, long, sched_nice);                        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:19:9: note: in expansion of macro '__kthread_param'
      19 |         __kthread_param(name, unsigned long, sched_priority);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:20:9: note: in expansion of macro '__kthread_param'
      20 |         __kthread_param(name, unsigned long long, sched_runtime);       \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:21:9: note: in expansion of macro '__kthread_param'
      21 |         __kthread_param(name, unsigned long long, sched_deadline);      \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:22:9: note: in expansion of macro '__kthread_param'
      22 |         __kthread_param(name, unsigned long long, sched_period);        \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:23:9: note: in expansion of macro '__kthread_param'
      23 |         __kthread_param(name, unsigned long, sched_util_min);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~
>> net/netfilter/ipvs/ip_vs_sync.c:1874:53: error: expected ',' or ';' before 'name'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                                                     ^~~~
   include/linux/moduleparam.h:289:50: note: in definition of macro '__module_param_call'
     289 |         static const char __param_str_##name[] = prefix #name;          \
         |                                                  ^~~~~~
   include/linux/kthread.h:14:9: note: in expansion of macro '___kthread_param'
      14 |         ___kthread_param(name, type, attr, 0644)        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/kthread.h:24:9: note: in expansion of macro '__kthread_param'
      24 |         __kthread_param(name, unsigned long, sched_util_max);           \
         |         ^~~~~~~~~~~~~~~
   include/linux/kthread.h:80:9: note: in expansion of macro 'kthread_param'
      80 |         kthread_param(namefmt);                                                 \
         |         ^~~~~~~~~~~~~
   include/linux/kthread.h:109:19: note: in expansion of macro 'kthread_create'
     109 |                 = kthread_create(threadfn, data, namefmt, ## __VA_ARGS__); \
         |                   ^~~~~~~~~~~~~~
   net/netfilter/ipvs/ip_vs_sync.c:1874:24: note: in expansion of macro 'kthread_run'
    1874 |                 task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
         |                        ^~~~~~~~~~~


vim +1874 net/netfilter/ipvs/ip_vs_sync.c

^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1743  
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1744  
6ac121d710697c net/netfilter/ipvs/ip_vs_sync.c Eric W. Biederman 2015-09-21  1745  int start_sync_thread(struct netns_ipvs *ipvs, struct ipvs_sync_daemon_cfg *c,
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1746  		      int state)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1747  {
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1748  	struct ip_vs_sync_thread_data *ti = NULL, *tinfo;
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1749  	struct task_struct *task;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1750  	struct net_device *dev;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1751  	char *name;
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1752  	int (*threadfn)(void *data);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1753  	int id = 0, count, hlen;
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1754  	int result = -ENOMEM;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1755  	u16 mtu, min_mtu;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1756  
1e3e238e9c4bf9 net/netfilter/ipvs/ip_vs_sync.c Hannes Eder       2009-08-02  1757  	IP_VS_DBG(7, "%s(): pid %d\n", __func__, task_pid_nr(current));
5b5e0928f742cf net/netfilter/ipvs/ip_vs_sync.c Alexey Dobriyan   2017-02-27  1758  	IP_VS_DBG(7, "Each ip_vs_sync_conn entry needs %zd bytes\n",
2981bc9a634565 net/netfilter/ipvs/ip_vs_sync.c Hans Schillstrom  2010-11-19  1759  		  sizeof(struct ip_vs_sync_conn_v0));
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1760  
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1761  	/* increase the module use count */
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1762  	if (!ip_vs_use_count_inc())
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1763  		return -ENOPROTOOPT;
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1764  
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1765  	/* Do not hold one mutex and then to block on another */
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1766  	for (;;) {
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1767  		rtnl_lock();
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1768  		if (mutex_trylock(&ipvs->sync_mutex))
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1769  			break;
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1770  		rtnl_unlock();
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1771  		mutex_lock(&ipvs->sync_mutex);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1772  		if (rtnl_trylock())
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1773  			break;
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1774  		mutex_unlock(&ipvs->sync_mutex);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1775  	}
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1776  
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1777  	if (!ipvs->sync_state) {
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1778  		count = clamp(sysctl_sync_ports(ipvs), 1, IPVS_SYNC_PORTS_MAX);
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1779  		ipvs->threads_mask = count - 1;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1780  	} else
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1781  		count = ipvs->threads_mask + 1;
ae1d48b23d5e79 net/netfilter/ipvs/ip_vs_sync.c Hans Schillstrom  2011-10-11  1782  
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1783  	if (c->mcast_af == AF_UNSPEC) {
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1784  		c->mcast_af = AF_INET;
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1785  		c->mcast_group.ip = cpu_to_be32(IP_VS_SYNC_GROUP);
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1786  	}
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1787  	if (!c->mcast_port)
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1788  		c->mcast_port = IP_VS_SYNC_PORT;
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1789  	if (!c->mcast_ttl)
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1790  		c->mcast_ttl = 1;
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1791  
6ac121d710697c net/netfilter/ipvs/ip_vs_sync.c Eric W. Biederman 2015-09-21  1792  	dev = __dev_get_by_name(ipvs->net, c->mcast_ifn);
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1793  	if (!dev) {
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1794  		pr_err("Unknown mcast interface: %s\n", c->mcast_ifn);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1795  		result = -ENODEV;
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1796  		goto out_early;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1797  	}
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1798  	hlen = (AF_INET6 == c->mcast_af) ?
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1799  	       sizeof(struct ipv6hdr) + sizeof(struct udphdr) :
d33288172e72c4 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1800  	       sizeof(struct iphdr) + sizeof(struct udphdr);
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1801  	mtu = (state == IP_VS_STATE_BACKUP) ?
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1802  		  clamp(dev->mtu, 1500U, 65535U) : 1500U;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1803  	min_mtu = (state == IP_VS_STATE_BACKUP) ? 1024 : 1;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1804  
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1805  	if (c->sync_maxlen)
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1806  		c->sync_maxlen = clamp_t(unsigned int,
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1807  					 c->sync_maxlen, min_mtu,
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1808  					 65535 - hlen);
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1809  	else
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1810  		c->sync_maxlen = mtu - hlen;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1811  
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1812  	if (state == IP_VS_STATE_MASTER) {
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1813  		result = -EEXIST;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1814  		if (ipvs->ms)
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1815  			goto out_early;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1816  
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1817  		ipvs->mcfg = *c;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1818  		name = "ipvs-m:%d:%d";
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1819  		threadfn = sync_thread_master;
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1820  	} else if (state == IP_VS_STATE_BACKUP) {
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1821  		result = -EEXIST;
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1822  		if (ipvs->backup_tinfo)
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1823  			goto out_early;
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1824  
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1825  		ipvs->bcfg = *c;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1826  		name = "ipvs-b:%d:%d";
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1827  		threadfn = sync_thread_backup;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1828  	} else {
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1829  		result = -EINVAL;
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1830  		goto out_early;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1831  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1832  
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1833  	if (state == IP_VS_STATE_MASTER) {
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1834  		struct ipvs_master_sync_state *ms;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1835  
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1836  		result = -ENOMEM;
848850a3e9161e net/netfilter/ipvs/ip_vs_sync.c Varsha Rao        2017-03-28  1837  		ipvs->ms = kcalloc(count, sizeof(ipvs->ms[0]), GFP_KERNEL);
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1838  		if (!ipvs->ms)
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1839  			goto out;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1840  		ms = ipvs->ms;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1841  		for (id = 0; id < count; id++, ms++) {
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1842  			INIT_LIST_HEAD(&ms->sync_queue);
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1843  			ms->sync_queue_len = 0;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1844  			ms->sync_queue_delay = 0;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1845  			INIT_DELAYED_WORK(&ms->master_wakeup_work,
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1846  					  master_wakeup_work_handler);
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1847  			ms->ipvs = ipvs;
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1848  		}
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1849  	}
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1850  	result = -ENOMEM;
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1851  	ti = kcalloc(count, sizeof(struct ip_vs_sync_thread_data),
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1852  		     GFP_KERNEL);
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1853  	if (!ti)
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1854  		goto out;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1855  
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1856  	for (id = 0; id < count; id++) {
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1857  		tinfo = &ti[id];
37b68e6ded49c0 net/netfilter/ipvs/ip_vs_sync.c Eric W. Biederman 2015-09-21  1858  		tinfo->ipvs = ipvs;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1859  		if (state == IP_VS_STATE_BACKUP) {
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1860  			result = -ENOMEM;
e4ff67513096e6 net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2015-07-26  1861  			tinfo->buf = kmalloc(ipvs->bcfg.sync_maxlen,
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1862  					     GFP_KERNEL);
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1863  			if (!tinfo->buf)
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1864  				goto out;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1865  		}
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1866  		tinfo->id = id;
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1867  		if (state == IP_VS_STATE_MASTER)
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1868  			result = make_send_sock(ipvs, id, dev, &tinfo->sock);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1869  		else
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1870  			result = make_receive_sock(ipvs, id, dev, &tinfo->sock);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1871  		if (result < 0)
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1872  			goto out;
cc0191aeef73e5 net/ipv4/ipvs/ip_vs_sync.c      Neil Horman       2007-06-18  1873  
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08 @1874  		task = kthread_run(threadfn, tinfo, name, ipvs->gen, id);
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1875  		if (IS_ERR(task)) {
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1876  			result = PTR_ERR(task);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1877  			goto out;
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1878  		}
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1879  		tinfo->task = task;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1880  	}
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1881  
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1882  	/* mark as active */
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1883  
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1884  	if (state == IP_VS_STATE_MASTER)
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1885  		ipvs->master_tinfo = ti;
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1886  	else
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1887  		ipvs->backup_tinfo = ti;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1888  	spin_lock_bh(&ipvs->sync_buff_lock);
f131315fa272d3 net/netfilter/ipvs/ip_vs_sync.c Hans Schillstrom  2011-01-03  1889  	ipvs->sync_state |= state;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1890  	spin_unlock_bh(&ipvs->sync_buff_lock);
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1891  
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1892  	mutex_unlock(&ipvs->sync_mutex);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1893  	rtnl_unlock();
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1894  
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1895  	return 0;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1896  
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1897  out:
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1898  	/* We do not need RTNL lock anymore, release it here so that
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1899  	 * sock_release below can use rtnl_lock to leave the mcast group.
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1900  	 */
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1901  	rtnl_unlock();
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1902  	id = min(id, count - 1);
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1903  	if (ti) {
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1904  		for (tinfo = ti + id; tinfo >= ti; tinfo--) {
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1905  			if (tinfo->task)
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1906  				kthread_stop(tinfo->task);
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1907  		}
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1908  	}
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1909  	if (!(ipvs->sync_state & IP_VS_STATE_MASTER)) {
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1910  		kfree(ipvs->ms);
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1911  		ipvs->ms = NULL;
f73181c8288fc3 net/netfilter/ipvs/ip_vs_sync.c Pablo Neira Ayuso 2012-05-08  1912  	}
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1913  	mutex_unlock(&ipvs->sync_mutex);
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1914  
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1915  	/* No more mutexes, release socks */
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1916  	if (ti) {
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1917  		for (tinfo = ti + id; tinfo >= ti; tinfo--) {
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1918  			if (tinfo->sock)
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1919  				sock_release(tinfo->sock);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1920  			kfree(tinfo->buf);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1921  		}
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1922  		kfree(ti);
5db7c8b9f9fc2a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2019-06-18  1923  	}
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1924  
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1925  	/* decrease the module use count */
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1926  	ip_vs_use_count_dec();
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1927  	return result;
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1928  
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1929  out_early:
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1930  	mutex_unlock(&ipvs->sync_mutex);
5c64576a77894a net/netfilter/ipvs/ip_vs_sync.c Julian Anastasov  2018-04-07  1931  	rtnl_unlock();
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1932  
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1933  	/* decrease the module use count */
62931f59ce9cba net/netfilter/ipvs/ip_vs_sync.c Davide Caratti    2019-10-19  1934  	ip_vs_use_count_dec();
998e7a76804b7a net/ipv4/ipvs/ip_vs_sync.c      Sven Wegener      2008-07-16  1935  	return result;
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1936  }
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_sync.c      Linus Torvalds    2005-04-16  1937  

:::::: The code at line 1874 was first introduced by commit
:::::: f73181c8288fc38747ec4f0f3e8a9052ab785cd5 ipvs: add support for sync threads

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
