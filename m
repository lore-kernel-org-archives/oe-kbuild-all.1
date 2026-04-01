Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75C31E848
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 03:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775012438; cv=none; b=XPyqAMg5VYrHmJMGuCZFzPpymVOqI5JrVM5DrCwI5jNeyC9cPKlsGzDutYW6JGqUF6JpZOkBak6T6wk6VovxZqbKs7GFR/3ExPqVHPI3VtC0qMWwWhPeKYIdMkv9lyOgnDU6+H+rE9UX/0JI3mCtWlWzHg8PYIuIqOS76QBLe2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775012438; c=relaxed/simple;
	bh=Qyr2AImzDGX/VQNOutsnSKRor8JuJaab1emuU73Cgew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PR3z3sTbOxrCW4mbMQHo3p3qktK9fx+LutAZ4XyVMHU6T/CfnL5O52WK1TWHqomRha0KatpFT+oOtbnwTTw0l07Omhcez5V+GOkhfebNJ5hkRd1EMK8LYUBpQitpgJuZGvdzLKHt3gRyJGiigGkChLQldeW7PyTtC59tolIV2QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/1RNZvS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/1RNZvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775012433; x=1806548433;
  h=date:from:to:cc:subject:message-id;
  bh=Qyr2AImzDGX/VQNOutsnSKRor8JuJaab1emuU73Cgew=;
  b=O/1RNZvSe7IfbZ01ypHQO7O6/CKDkw7VdHiNjy5smNfXXzZNT8Al442A
   TH/7o6xPG/XTrkJ0HikYpfI55f93dSWjYoyxBT6FIMGXD6MqRT++q5uPw
   I9EmX6jHsk2Qo0uG4/eqXe+UQHv/o5gJV0TKYcyIvB4Ih6jZ4+oNAz4eU
   ZuxzwpX1Ec4Pcv5KgqZX/UiBkZ/2Z6N3Q4MzCEHWB6JauxkqPoZvl9rmS
   JcnV5svFnTvWTmEWIQiTcyjSh1+2U8OBWQ1MUZy3TOpVI10wtaPZ8njmE
   BAG0X3Wmlb13zArd1edB/WGxyMnWtrgRz8pInV2vMDLmxXU5hn2vAX8kt
   w==;
X-CSE-ConnectionGUID: 37WQKBQMTdqB1s/xCHb+jw==
X-CSE-MsgGUID: k8OmUDJGTbq4JX3mSCWnGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75212112"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75212112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 20:00:31 -0700
X-CSE-ConnectionGUID: O+7oSSHKS7ieF3IXNzzqtg==
X-CSE-MsgGUID: kDjbfrStTi2mlX/GvtCmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="228150604"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 20:00:29 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7loh-000000004gC-1SOh;
	Wed, 01 Apr 2026 03:00:27 +0000
Date: Wed, 01 Apr 2026 11:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:deprecate-legacy-ip 2/5] net/ipv4/af_inet.c:1898:23:
 warning: unused variable 'q'
Message-ID: <202604011023.v8729qEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux deprecate-legacy-ip
head:   562a6476c94f543c437ad125d73a624eda375dd1
commit: 4216f8ab4d6b8e3b434d33c9badbc6c8ef3b185d [2/5] net: Guard IPv4 entry points with CONFIG_LEGACY_IP
config: sparc64-randconfig-r134-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011023.v8729qEJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011023.v8729qEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011023.v8729qEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/af_inet.c:1898:23: warning: unused variable 'q' [-Wunused-variable]
    1898 |         struct inet_protosw *q;
         |                              ^
>> net/ipv4/af_inet.c:1158:38: warning: unused variable 'inet_family_ops' [-Wunused-const-variable]
    1158 | static const struct net_proto_family inet_family_ops = {
         |                                      ^~~~~~~~~~~~~~~
>> net/ipv4/af_inet.c:1167:28: warning: unused variable 'inetsw_array' [-Wunused-variable]
    1167 | static struct inet_protosw inetsw_array[] =
         |                            ^~~~~~~~~~~~
>> net/ipv4/af_inet.c:1711:34: warning: unused variable 'icmp_protocol' [-Wunused-const-variable]
    1711 | static const struct net_protocol icmp_protocol = {
         |                                  ^~~~~~~~~~~~~
   net/ipv4/af_inet.c:2049:19: warning: unused function 'ipv4_proc_init' [-Wunused-function]
    2049 | static int __init ipv4_proc_init(void)
         |                   ^~~~~~~~~~~~~~
>> net/ipv4/af_inet.c:1890:27: warning: unused variable 'ip_packet_type' [-Wunused-variable]
    1890 | static struct packet_type ip_packet_type __read_mostly = {
         |                           ^~~~~~~~~~~~~~
   6 warnings generated.


vim +/q +1898 net/ipv4/af_inet.c

^1da177e4c3f41 Linus Torvalds                 2005-04-16  1710  
32613090a96dba Alexey Dobriyan                2009-09-14 @1711  static const struct net_protocol icmp_protocol = {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1712  	.handler =	icmp_rcv,
5b0520425e5ea8 Li Wei                         2013-02-21  1713  	.err_handler =	icmp_err,
8b7817f3a959ed Herbert Xu                     2007-12-12  1714  	.no_policy =	1,
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1715  };
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1716  
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1717  static __net_init int ipv4_mib_init_net(struct net *net)
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1718  {
827da44c61419f John Stultz                    2013-10-07  1719  	int i;
827da44c61419f John Stultz                    2013-10-07  1720  
698365fa1874aa WANG Cong                      2014-05-05  1721  	net->mib.tcp_statistics = alloc_percpu(struct tcp_mib);
698365fa1874aa WANG Cong                      2014-05-05  1722  	if (!net->mib.tcp_statistics)
57ef42d59d1c1d Pavel Emelyanov                2008-07-18  1723  		goto err_tcp_mib;
698365fa1874aa WANG Cong                      2014-05-05  1724  	net->mib.ip_statistics = alloc_percpu(struct ipstats_mib);
698365fa1874aa WANG Cong                      2014-05-05  1725  	if (!net->mib.ip_statistics)
a20f5799ca7ceb Pavel Emelyanov                2008-07-18  1726  		goto err_ip_mib;
827da44c61419f John Stultz                    2013-10-07  1727  
827da44c61419f John Stultz                    2013-10-07  1728  	for_each_possible_cpu(i) {
827da44c61419f John Stultz                    2013-10-07  1729  		struct ipstats_mib *af_inet_stats;
698365fa1874aa WANG Cong                      2014-05-05  1730  		af_inet_stats = per_cpu_ptr(net->mib.ip_statistics, i);
827da44c61419f John Stultz                    2013-10-07  1731  		u64_stats_init(&af_inet_stats->syncp);
827da44c61419f John Stultz                    2013-10-07  1732  	}
827da44c61419f John Stultz                    2013-10-07  1733  
698365fa1874aa WANG Cong                      2014-05-05  1734  	net->mib.net_statistics = alloc_percpu(struct linux_mib);
698365fa1874aa WANG Cong                      2014-05-05  1735  	if (!net->mib.net_statistics)
61a7e26028b948 Pavel Emelyanov                2008-07-18  1736  		goto err_net_mib;
698365fa1874aa WANG Cong                      2014-05-05  1737  	net->mib.udp_statistics = alloc_percpu(struct udp_mib);
698365fa1874aa WANG Cong                      2014-05-05  1738  	if (!net->mib.udp_statistics)
2f275f91a438ab Pavel Emelyanov                2008-07-18  1739  		goto err_udp_mib;
698365fa1874aa WANG Cong                      2014-05-05  1740  	net->mib.udplite_statistics = alloc_percpu(struct udp_mib);
698365fa1874aa WANG Cong                      2014-05-05  1741  	if (!net->mib.udplite_statistics)
386019d3514b3e Pavel Emelyanov                2008-07-18  1742  		goto err_udplite_mib;
698365fa1874aa WANG Cong                      2014-05-05  1743  	net->mib.icmp_statistics = alloc_percpu(struct icmp_mib);
698365fa1874aa WANG Cong                      2014-05-05  1744  	if (!net->mib.icmp_statistics)
b60538a0d73760 Pavel Emelyanov                2008-07-18  1745  		goto err_icmp_mib;
32a92f8c893269 Linus Torvalds                 2026-02-21  1746  	net->mib.icmpmsg_statistics = kzalloc_obj(struct icmpmsg_mib);
acb32ba3dee66d Eric Dumazet                   2011-11-08  1747  	if (!net->mib.icmpmsg_statistics)
923c6586b0dc0a Pavel Emelyanov                2008-07-18  1748  		goto err_icmpmsg_mib;
57ef42d59d1c1d Pavel Emelyanov                2008-07-18  1749  
57ef42d59d1c1d Pavel Emelyanov                2008-07-18  1750  	tcp_mib_init(net);
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1751  	return 0;
57ef42d59d1c1d Pavel Emelyanov                2008-07-18  1752  
923c6586b0dc0a Pavel Emelyanov                2008-07-18  1753  err_icmpmsg_mib:
698365fa1874aa WANG Cong                      2014-05-05  1754  	free_percpu(net->mib.icmp_statistics);
b60538a0d73760 Pavel Emelyanov                2008-07-18  1755  err_icmp_mib:
698365fa1874aa WANG Cong                      2014-05-05  1756  	free_percpu(net->mib.udplite_statistics);
386019d3514b3e Pavel Emelyanov                2008-07-18  1757  err_udplite_mib:
698365fa1874aa WANG Cong                      2014-05-05  1758  	free_percpu(net->mib.udp_statistics);
2f275f91a438ab Pavel Emelyanov                2008-07-18  1759  err_udp_mib:
698365fa1874aa WANG Cong                      2014-05-05  1760  	free_percpu(net->mib.net_statistics);
61a7e26028b948 Pavel Emelyanov                2008-07-18  1761  err_net_mib:
698365fa1874aa WANG Cong                      2014-05-05  1762  	free_percpu(net->mib.ip_statistics);
a20f5799ca7ceb Pavel Emelyanov                2008-07-18  1763  err_ip_mib:
698365fa1874aa WANG Cong                      2014-05-05  1764  	free_percpu(net->mib.tcp_statistics);
57ef42d59d1c1d Pavel Emelyanov                2008-07-18  1765  err_tcp_mib:
57ef42d59d1c1d Pavel Emelyanov                2008-07-18  1766  	return -ENOMEM;
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1767  }
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1768  
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1769  static __net_exit void ipv4_mib_exit_net(struct net *net)
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1770  {
acb32ba3dee66d Eric Dumazet                   2011-11-08  1771  	kfree(net->mib.icmpmsg_statistics);
698365fa1874aa WANG Cong                      2014-05-05  1772  	free_percpu(net->mib.icmp_statistics);
698365fa1874aa WANG Cong                      2014-05-05  1773  	free_percpu(net->mib.udplite_statistics);
698365fa1874aa WANG Cong                      2014-05-05  1774  	free_percpu(net->mib.udp_statistics);
698365fa1874aa WANG Cong                      2014-05-05  1775  	free_percpu(net->mib.net_statistics);
698365fa1874aa WANG Cong                      2014-05-05  1776  	free_percpu(net->mib.ip_statistics);
698365fa1874aa WANG Cong                      2014-05-05  1777  	free_percpu(net->mib.tcp_statistics);
fc518953bc9c8d Florian Westphal               2020-03-27  1778  #ifdef CONFIG_MPTCP
fc518953bc9c8d Florian Westphal               2020-03-27  1779  	/* allocated on demand, see mptcp_init_sock() */
fc518953bc9c8d Florian Westphal               2020-03-27  1780  	free_percpu(net->mib.mptcp_statistics);
fc518953bc9c8d Florian Westphal               2020-03-27  1781  #endif
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1782  }
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1783  
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1784  static __net_initdata struct pernet_operations ipv4_mib_ops = {
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1785  	.init = ipv4_mib_init_net,
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1786  	.exit = ipv4_mib_exit_net,
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1787  };
9b4661bd6e5437 Pavel Emelyanov                2008-07-18  1788  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1789  static int __init init_ipv4_mibs(void)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1790  {
d89cbbb1e69a3b Pavel Emelyanov                2008-07-18  1791  	return register_pernet_subsys(&ipv4_mib_ops);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1792  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1793  
c9d8f1a64225df Cong Wang                      2014-05-06  1794  static __net_init int inet_init_net(struct net *net)
c9d8f1a64225df Cong Wang                      2014-05-06  1795  {
c9d8f1a64225df Cong Wang                      2014-05-06  1796  	/*
c9d8f1a64225df Cong Wang                      2014-05-06  1797  	 * Set defaults for local port range
c9d8f1a64225df Cong Wang                      2014-05-06  1798  	 */
d9f28735af8781 David Laight                   2023-12-06  1799  	net->ipv4.ip_local_ports.range = 60999u << 16 | 32768u;
ba6b918ab23418 Cong Wang                      2014-05-06  1800  
ba6b918ab23418 Cong Wang                      2014-05-06  1801  	seqlock_init(&net->ipv4.ping_group_range.lock);
ba6b918ab23418 Cong Wang                      2014-05-06  1802  	/*
ba6b918ab23418 Cong Wang                      2014-05-06  1803  	 * Sane defaults - nobody may create ping sockets.
ba6b918ab23418 Cong Wang                      2014-05-06  1804  	 * Boot scripts should set this to distro-specific group.
ba6b918ab23418 Cong Wang                      2014-05-06  1805  	 */
ba6b918ab23418 Cong Wang                      2014-05-06  1806  	net->ipv4.ping_group_range.range[0] = make_kgid(&init_user_ns, 1);
ba6b918ab23418 Cong Wang                      2014-05-06  1807  	net->ipv4.ping_group_range.range[1] = make_kgid(&init_user_ns, 0);
049bbf589ec651 Ezequiel Garcia                2016-05-20  1808  
049bbf589ec651 Ezequiel Garcia                2016-05-20  1809  	/* Default values for sysctl-controlled parameters.
049bbf589ec651 Ezequiel Garcia                2016-05-20  1810  	 * We set them here, in case sysctl is not compiled.
049bbf589ec651 Ezequiel Garcia                2016-05-20  1811  	 */
049bbf589ec651 Ezequiel Garcia                2016-05-20  1812  	net->ipv4.sysctl_ip_default_ttl = IPDEFTTL;
432e05d328921c Petr Machata                   2018-08-01  1813  	net->ipv4.sysctl_ip_fwd_update_priority = 1;
049bbf589ec651 Ezequiel Garcia                2016-05-20  1814  	net->ipv4.sysctl_ip_dynaddr = 0;
049bbf589ec651 Ezequiel Garcia                2016-05-20  1815  	net->ipv4.sysctl_ip_early_demux = 1;
dddb64bcb34615 Subash Abhinov Kasiviswanathan 2017-03-23  1816  	net->ipv4.sysctl_udp_early_demux = 1;
dddb64bcb34615 Subash Abhinov Kasiviswanathan 2017-03-23  1817  	net->ipv4.sysctl_tcp_early_demux = 1;
4f80116d3df3b2 Roopa Prabhu                   2020-04-27  1818  	net->ipv4.sysctl_nexthop_compat_mode = 1;
4548b683b78137 Krister Johansen               2017-01-20  1819  #ifdef CONFIG_SYSCTL
4548b683b78137 Krister Johansen               2017-01-20  1820  	net->ipv4.sysctl_ip_prot_sock = PROT_SOCK;
4548b683b78137 Krister Johansen               2017-01-20  1821  #endif
049bbf589ec651 Ezequiel Garcia                2016-05-20  1822  
1714020e42b171 Nikolay Borisov                2017-08-09  1823  	/* Some igmp sysctl, whose values are always used */
1714020e42b171 Nikolay Borisov                2017-08-09  1824  	net->ipv4.sysctl_igmp_max_memberships = 20;
1714020e42b171 Nikolay Borisov                2017-08-09  1825  	net->ipv4.sysctl_igmp_max_msf = 10;
1714020e42b171 Nikolay Borisov                2017-08-09  1826  	/* IGMP reports for link-local multicast groups are enabled by default */
1714020e42b171 Nikolay Borisov                2017-08-09  1827  	net->ipv4.sysctl_igmp_llm_reports = 1;
1714020e42b171 Nikolay Borisov                2017-08-09  1828  	net->ipv4.sysctl_igmp_qrv = 2;
1714020e42b171 Nikolay Borisov                2017-08-09  1829  
680aea08e78c00 Amit Cohen                     2021-02-01  1830  	net->ipv4.sysctl_fib_notify_on_flag_change = 0;
680aea08e78c00 Amit Cohen                     2021-02-01  1831  
c9d8f1a64225df Cong Wang                      2014-05-06  1832  	return 0;
c9d8f1a64225df Cong Wang                      2014-05-06  1833  }
c9d8f1a64225df Cong Wang                      2014-05-06  1834  
c9d8f1a64225df Cong Wang                      2014-05-06  1835  static __net_initdata struct pernet_operations af_inet_ops = {
c9d8f1a64225df Cong Wang                      2014-05-06  1836  	.init = inet_init_net,
c9d8f1a64225df Cong Wang                      2014-05-06  1837  };
c9d8f1a64225df Cong Wang                      2014-05-06  1838  
c9d8f1a64225df Cong Wang                      2014-05-06  1839  static int __init init_inet_pernet_ops(void)
c9d8f1a64225df Cong Wang                      2014-05-06  1840  {
c9d8f1a64225df Cong Wang                      2014-05-06  1841  	return register_pernet_subsys(&af_inet_ops);
c9d8f1a64225df Cong Wang                      2014-05-06  1842  }
c9d8f1a64225df Cong Wang                      2014-05-06  1843  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1844  static int ipv4_proc_init(void);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1845  
30e224d76f34e0 Herbert Xu                     2005-07-05  1846  /*
30e224d76f34e0 Herbert Xu                     2005-07-05  1847   *	IP protocol layer initialiser
30e224d76f34e0 Herbert Xu                     2005-07-05  1848   */
30e224d76f34e0 Herbert Xu                     2005-07-05  1849  
30e224d76f34e0 Herbert Xu                     2005-07-05  1850  
cb32f511a70be8 Eric Dumazet                   2013-10-19  1851  static const struct net_offload ipip_offload = {
cb32f511a70be8 Eric Dumazet                   2013-10-19  1852  	.callbacks = {
418e897e0716b2 Willem de Bruijn               2019-02-20  1853  		.gso_segment	= ipip_gso_segment,
fac8e0f579695a Jesse Gross                    2016-03-19  1854  		.gro_receive	= ipip_gro_receive,
b8cba75bdf6a48 Jesse Gross                    2016-03-19  1855  		.gro_complete	= ipip_gro_complete,
cb32f511a70be8 Eric Dumazet                   2013-10-19  1856  	},
cb32f511a70be8 Eric Dumazet                   2013-10-19  1857  };
cb32f511a70be8 Eric Dumazet                   2013-10-19  1858  
93b1b31f87ae7c Tonghao Zhang                  2017-08-02  1859  static int __init ipip_offload_init(void)
93b1b31f87ae7c Tonghao Zhang                  2017-08-02  1860  {
93b1b31f87ae7c Tonghao Zhang                  2017-08-02  1861  	return inet_add_offload(&ipip_offload, IPPROTO_IPIP);
93b1b31f87ae7c Tonghao Zhang                  2017-08-02  1862  }
93b1b31f87ae7c Tonghao Zhang                  2017-08-02  1863  
808a8f884554f9 Vlad Yasevich                  2012-11-15  1864  static int __init ipv4_offload_init(void)
808a8f884554f9 Vlad Yasevich                  2012-11-15  1865  {
808a8f884554f9 Vlad Yasevich                  2012-11-15  1866  	/*
808a8f884554f9 Vlad Yasevich                  2012-11-15  1867  	 * Add offloads
808a8f884554f9 Vlad Yasevich                  2012-11-15  1868  	 */
da5bab079f9b7d Daniel Borkmann                2013-06-08  1869  	if (udpv4_offload_init() < 0)
808a8f884554f9 Vlad Yasevich                  2012-11-15  1870  		pr_crit("%s: Cannot add UDP protocol offload\n", __func__);
28850dc7c71da9 Daniel Borkmann                2013-06-07  1871  	if (tcpv4_offload_init() < 0)
28850dc7c71da9 Daniel Borkmann                2013-06-07  1872  		pr_crit("%s: Cannot add TCP protocol offload\n", __func__);
93b1b31f87ae7c Tonghao Zhang                  2017-08-02  1873  	if (ipip_offload_init() < 0)
93b1b31f87ae7c Tonghao Zhang                  2017-08-02  1874  		pr_crit("%s: Cannot add IPIP protocol offload\n", __func__);
808a8f884554f9 Vlad Yasevich                  2012-11-15  1875  
61a0be1a534204 Eric Dumazet                   2024-03-06  1876  	net_hotdata.ip_packet_offload = (struct packet_offload) {
61a0be1a534204 Eric Dumazet                   2024-03-06  1877  		.type = cpu_to_be16(ETH_P_IP),
61a0be1a534204 Eric Dumazet                   2024-03-06  1878  		.callbacks = {
61a0be1a534204 Eric Dumazet                   2024-03-06  1879  			.gso_segment = inet_gso_segment,
61a0be1a534204 Eric Dumazet                   2024-03-06  1880  			.gro_receive = inet_gro_receive,
61a0be1a534204 Eric Dumazet                   2024-03-06  1881  			.gro_complete = inet_gro_complete,
61a0be1a534204 Eric Dumazet                   2024-03-06  1882  		},
61a0be1a534204 Eric Dumazet                   2024-03-06  1883  	};
61a0be1a534204 Eric Dumazet                   2024-03-06  1884  	dev_add_offload(&net_hotdata.ip_packet_offload);
808a8f884554f9 Vlad Yasevich                  2012-11-15  1885  	return 0;
808a8f884554f9 Vlad Yasevich                  2012-11-15  1886  }
808a8f884554f9 Vlad Yasevich                  2012-11-15  1887  
808a8f884554f9 Vlad Yasevich                  2012-11-15  1888  fs_initcall(ipv4_offload_init);
808a8f884554f9 Vlad Yasevich                  2012-11-15  1889  
808a8f884554f9 Vlad Yasevich                  2012-11-15 @1890  static struct packet_type ip_packet_type __read_mostly = {
808a8f884554f9 Vlad Yasevich                  2012-11-15  1891  	.type = cpu_to_be16(ETH_P_IP),
808a8f884554f9 Vlad Yasevich                  2012-11-15  1892  	.func = ip_rcv,
17266ee939849c Edward Cree                    2018-07-02  1893  	.list_func = ip_list_rcv,
808a8f884554f9 Vlad Yasevich                  2012-11-15  1894  };
808a8f884554f9 Vlad Yasevich                  2012-11-15  1895  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1896  static int __init inet_init(void)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1897  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16 @1898  	struct inet_protosw *q;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1899  	struct list_head *r;
b6246f4d8d0778 Colin Ian King                 2020-04-20  1900  	int rc;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1901  
b4772ef879a8f7 Eyal Birger                    2015-03-01  1902  	sock_skb_cb_check_size(sizeof(struct inet_skb_parm));
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1903  
0daf07e527095e Eric Dumazet                   2022-06-17  1904  	raw_hashinfo_init(&raw_v4_hashinfo);
0daf07e527095e Eric Dumazet                   2022-06-17  1905  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1906  	rc = proto_register(&tcp_prot, 1);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1907  	if (rc)
122ff243f5f104 WANG Cong                      2014-05-12  1908  		goto out;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1909  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1910  	rc = proto_register(&udp_prot, 1);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1911  	if (rc)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1912  		goto out_unregister_tcp_proto;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1913  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1914  	rc = proto_register(&raw_prot, 1);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1915  	if (rc)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1916  		goto out_unregister_udp_proto;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1917  
c319b4d76b9e58 Vasiliy Kulikov                2011-05-13  1918  	rc = proto_register(&ping_prot, 1);
c319b4d76b9e58 Vasiliy Kulikov                2011-05-13  1919  	if (rc)
c319b4d76b9e58 Vasiliy Kulikov                2011-05-13  1920  		goto out_unregister_raw_proto;
c319b4d76b9e58 Vasiliy Kulikov                2011-05-13  1921  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1922  	/*
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1923  	 *	Tell SOCKET that we are alive...
^1da177e4c3f41 Linus Torvalds                 2005-04-16  1924  	 */
4216f8ab4d6b8e David Woodhouse                2026-03-30  1925  	/* Initialize the socket-side protocol switch tables. */
4216f8ab4d6b8e David Woodhouse                2026-03-30  1926  	for (r = &inetsw[0]; r < &inetsw[SOCK_MAX]; ++r)
4216f8ab4d6b8e David Woodhouse                2026-03-30  1927  		INIT_LIST_HEAD(r);
4216f8ab4d6b8e David Woodhouse                2026-03-30  1928  

:::::: The code at line 1898 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
