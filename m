Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820A46025E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709573183; cv=none; b=V1k06bCuvdMsDmcCvGm7xOy+w44n846QwejO3usq1Yq+lkyWzOC9SAU92OJThKDGzyFAjgok2VP/oZx3vYpukDQVlQqy7tHrdEthpD7oIqxIfMiqq52ktRXsgcbH5Xa5lW4T7qyEdC2Kjy2yQ8umWlHFtG6hKxNSpCjb0pD0OCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709573183; c=relaxed/simple;
	bh=b2DJyprJHRoEHqrak+mwDXmC/sQLJaeDVHkOqD1IOnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hUQ9zR80KRn+pxKfQmVQaz0glLEF0481bWS5w3VnXmGty9qnoxf4ALgQuZ6F9FXVlcNb4DpuDn7tmKo2wrsFD5C0ICrZvTBIq3uI0QffmMtR50iz91zkVWjRZ/3htJKf7rxHz3XWEWAazGLM+G9htMxuZQ0V0JmvFgetmvovG5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsdTaQky; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsdTaQky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709573181; x=1741109181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b2DJyprJHRoEHqrak+mwDXmC/sQLJaeDVHkOqD1IOnM=;
  b=gsdTaQkyVKS+KFu/zEYPiAWKZ0lJWFO33pLbRk38ohNXBntEpVFLU0V6
   byA5+y0TWZg5z5d4S57b0c+UrXe8eFLAizzgEsncs/fqNrHSsSyjUZNsM
   cild3cPiZGmBUPJq3GKgMaajxI8Wba+9i1xyWj3pzVzIYU19BozaH36+N
   n6Ony1Zc7plMgP7BXgwnxTA5coH/zqKsaRdceKlXDIn82gNcL+jdI0tNZ
   tSz63zKTuvkO+4UBBtghNY3tFo7QsAG5zxsbS49T2Ln0kABFOpu8AnUKO
   fbhu7SaXVGMVkq+eGPc060H8t7gR/+A+75rQPqr7Hht3Z5GMCOMPgyAs8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3941189"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3941189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 09:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="32245954"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2024 09:26:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhC4t-0002f1-1k;
	Mon, 04 Mar 2024 17:26:15 +0000
Date: Tue, 5 Mar 2024 01:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] net/toa/toa.c:374:19: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202403050112.Wvia536F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240305/202403050112.Wvia536F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050112.Wvia536F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050112.Wvia536F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/toa/toa.c:28:24: sparse: sparse: symbol 'toa_stats' was not declared. Should it be static?
   net/toa/toa.c:122:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:122:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:122:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:126:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:126:47: sparse:     expected restricted __be16 [usertype] sin_port
   net/toa/toa.c:126:47: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:127:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:127:54: sparse:     expected restricted __be32 [usertype] s_addr
   net/toa/toa.c:127:54: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:129:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:129:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:129:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:134:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:134:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:134:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:137:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:137:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:137:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:162:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:162:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:162:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:163:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin6_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:163:48: sparse:     expected restricted __be16 [usertype] sin6_port
   net/toa/toa.c:163:48: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:164:94: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __be32 [usertype] w4 @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:164:94: sparse:     expected restricted __be32 [usertype] w4
   net/toa/toa.c:164:94: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:166:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:166:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:166:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:169:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:169:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:169:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:172:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:172:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:172:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:206:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:206:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:206:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:208:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:208:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:208:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:234:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:234:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:234:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:236:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:236:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:236:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:342:65: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:342:65: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:342:65: sparse:     got struct toa_stat_mib *
>> net/toa/toa.c:374:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats @@     got struct toa_stat_mib [noderef] __percpu * @@
   net/toa/toa.c:374:19: sparse:     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats
   net/toa/toa.c:374:19: sparse:     got struct toa_stat_mib [noderef] __percpu *
   net/toa/toa.c:389:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [toplevel] ext_stats @@
   net/toa/toa.c:389:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:389:29: sparse:     got struct toa_stat_mib *[addressable] [toplevel] ext_stats
   net/toa/toa.c:404:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats @@
   net/toa/toa.c:404:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:404:29: sparse:     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats

vim +374 net/toa/toa.c

   214	
   215	#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
   216	static struct sock *
   217	tcp_v6_syn_recv_sock_toa(const struct sock *sk, struct sk_buff *skb,
   218						 struct request_sock *req,
   219						 struct dst_entry *dst,
   220						 struct request_sock *req_unhash,
   221						 bool *own_req)
   222	{
   223		struct sock *newsock = NULL;
   224	
   225		//TOA_DBG("tcp_v4_syn_recv_sock_toa called\n");
   226	
   227		/* call orginal one */
   228		newsock = tcp_v6_syn_recv_sock(sk, skb, req, dst, req_unhash, own_req);
   229	
   230		/* set our value if need */
   231		if (NULL != newsock && NULL == newsock->sk_user_data) {
   232			newsock->sk_user_data = get_toa_data(skb);
   233			if (NULL != newsock->sk_user_data) {
 > 234				TOA_INC_STATS(ext_stats, SYN_RECV_SOCK_TOA_CNT);
   235			} else {
   236				TOA_INC_STATS(ext_stats, SYN_RECV_SOCK_NO_TOA_CNT);
   237			}
   238		}
   239		return newsock;
   240	}
   241	#endif
   242	
   243	/*
   244	 * HOOK FUNCS
   245	 */
   246	
   247	/* replace the functions with our functions */
   248	static inline int hook_toa_functions(void)
   249	{
   250		struct proto_ops *inet_stream_ops_p;
   251		struct proto_ops *inet6_stream_ops_p;
   252		struct inet_connection_sock_af_ops *ipv4_specific_p;
   253		struct inet_connection_sock_af_ops *ipv6_specific_p;
   254	
   255		/* hook inet_getname for ipv4 */
   256		inet_stream_ops_p = (struct proto_ops *)&inet_stream_ops;
   257		inet_stream_ops_p->getname = inet_getname_toa;
   258		TOA_INFO("CPU [%u] hooked inet_getname <%p> --> <%p>\n", smp_processor_id(), inet_getname,
   259			 inet_stream_ops_p->getname);
   260	
   261	#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
   262		/* hook inet6_getname for ipv6 */
   263		inet6_stream_ops_p = (struct proto_ops *)&inet6_stream_ops;
   264		inet6_stream_ops_p->getname = inet6_getname_toa;
   265		TOA_INFO("CPU [%u] hooked inet6_getname <%p> --> <%p>\n", smp_processor_id(), inet6_getname,
   266			 inet6_stream_ops_p->getname);
   267	#endif
   268	
   269		/* hook tcp_v4_syn_recv_sock for ipv4 */
   270		ipv4_specific_p = (struct inet_connection_sock_af_ops *)&ipv4_specific;
   271		ipv4_specific_p->syn_recv_sock = tcp_v4_syn_recv_sock_toa;
   272		TOA_INFO("CPU [%u] hooked tcp_v4_syn_recv_sock <%p> --> <%p>\n", smp_processor_id(), tcp_v4_syn_recv_sock,
   273			 ipv4_specific_p->syn_recv_sock);
   274	
   275	#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
   276		/* hook tcp_v6_syn_recv_sock for ipv6 */
   277		ipv6_specific_p = (struct inet_connection_sock_af_ops *)&ipv6_specific;
   278		ipv6_specific_p->syn_recv_sock = tcp_v6_syn_recv_sock_toa;
   279		TOA_INFO("CPU [%u] hooked tcp_v6_syn_recv_sock <%p> --> <%p>\n", smp_processor_id(), tcp_v6_syn_recv_sock,
   280			 ipv6_specific_p->syn_recv_sock);
   281	#endif
   282	
   283		return 0;
   284	}
   285	
   286	/* replace the functions to original ones */
   287	static int
   288	unhook_toa_functions(void)
   289	{
   290		struct proto_ops *inet_stream_ops_p;
   291		struct proto_ops *inet6_stream_ops_p;
   292		struct inet_connection_sock_af_ops *ipv4_specific_p;
   293		struct inet_connection_sock_af_ops *ipv6_specific_p;
   294	
   295		/* unhook inet_getname for ipv4 */
   296		inet_stream_ops_p = (struct proto_ops *)&inet_stream_ops;
   297		inet_stream_ops_p->getname = inet_getname;
   298		TOA_INFO("CPU [%u] unhooked inet_getname\n", smp_processor_id());
   299	
   300	#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
   301		/* unhook inet6_getname for ipv6 */
   302		inet6_stream_ops_p = (struct proto_ops *)&inet6_stream_ops;
   303		inet6_stream_ops_p->getname = inet6_getname;
   304		TOA_INFO("CPU [%u] unhooked inet6_getname\n", smp_processor_id());
   305	#endif
   306	
   307		/* unhook tcp_v4_syn_recv_sock for ipv4 */
   308		ipv4_specific_p = (struct inet_connection_sock_af_ops *)&ipv4_specific;
   309		ipv4_specific_p->syn_recv_sock = tcp_v4_syn_recv_sock;
   310		TOA_INFO("CPU [%u] unhooked tcp_v4_syn_recv_sock\n", smp_processor_id());
   311	
   312	#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)
   313		/* unhook tcp_v6_syn_recv_sock for ipv6 */
   314		ipv6_specific_p = (struct inet_connection_sock_af_ops *)&ipv6_specific;
   315		ipv6_specific_p->syn_recv_sock = tcp_v6_syn_recv_sock;
   316		TOA_INFO("CPU [%u] unhooked tcp_v6_syn_recv_sock\n", smp_processor_id());
   317	#endif
   318	
   319		return 0;
   320	}
   321	
   322	/*
   323	 * Statistics of toa in proc /proc/net/toa_stats
   324	 */
   325	static int toa_stats_show(struct seq_file *seq, void *v)
   326	{
   327		int i, j;
   328	
   329		/* print CPU first */
   330		seq_printf(seq, "                                  ");
   331		for (i = 0; i < NR_CPUS; i++)
   332			if (cpu_online(i))
   333				seq_printf(seq, "CPU%d       ", i);
   334		seq_putc(seq, '\n');
   335	
   336		i = 0;
   337		while (NULL != toa_stats[i].name) {
   338			seq_printf(seq, "%-25s:", toa_stats[i].name);
   339			for (j = 0; j < NR_CPUS; j++) {
   340				if (cpu_online(j)) {
   341					seq_printf(seq, "%10lu ",
   342						   *(((unsigned long *) per_cpu_ptr(ext_stats, j)) + toa_stats[i].entry));
   343				}
   344			}
   345			seq_putc(seq, '\n');
   346			i++;
   347		}
   348		return 0;
   349	}
   350	
   351	static int toa_stats_seq_open(struct inode *inode, struct file *file)
   352	{
   353		return single_open(file, toa_stats_show, NULL);
   354	}
   355	
   356	static const struct proc_ops toa_stats_ops = {
   357		.proc_open = toa_stats_seq_open,
   358		.proc_read = seq_read,
   359		.proc_lseek = seq_lseek,
   360		.proc_release = single_release,
   361	};
   362	
   363	/*
   364	 * TOA module init and destory
   365	 */
   366	
   367	/* module init */
   368	static int __init toa_init(void)
   369	{
   370	
   371		TOA_INFO("TOA " TOA_VERSION " by pukong.wjm\n");
   372	
   373		/* alloc statistics array for toa */
 > 374		ext_stats = alloc_percpu(struct toa_stat_mib);
   375		if (NULL == ext_stats)
   376			return 1;
   377		proc_create("toa_stats", 0, init_net.proc_net, &toa_stats_ops);
   378	
   379		/* hook funcs for parse and get toa */
   380		if (!hook_toa_functions())
   381			goto err;
   382	
   383		TOA_INFO("toa loaded\n");
   384		return 0;
   385	
   386	err:
   387		remove_proc_entry("toa_stats", init_net.proc_net);
   388		if (NULL != ext_stats) {
   389			free_percpu(ext_stats);
   390			ext_stats = NULL;
   391		}
   392	
   393		return 1;
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
