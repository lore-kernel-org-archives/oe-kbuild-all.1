Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3051AAC4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727279909; cv=none; b=ioVNcNgTs1rlZRQ/vrX5nEiwB/9T6Hk7z0ocetiipqhbYcKf4FifTi0oAaAX0wdQyhd9vt9+HjEa6mXkcaX685tVhThZEj2zgQErydTa10IYFD2ybiqJ7NOJZlFs2uPMdWSbvd/UYb3RMOmTLBYcPEkYwuPBKO6dM0ebmTwqz1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727279909; c=relaxed/simple;
	bh=eH6JJ3Yp02tm9KiF3Ben/1KE/7chHkVw9QduzBXDbMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLZTiI8a3DqmCx84aqXzir5tl8M28mX+cy1bhuZE+2igPsyKdIDfJXkxvzu2aDNcpjomR6QNJQfSA8WbP/hQgc4/hkrdGjm0c6IJb6tYJ69RL+H4sjwGFPS7YLlyEIII3O4Q8IFmbzeDVttl5lBxVYzDWIlU+6ZcRSLaFv6dx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVr06nbM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVr06nbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727279907; x=1758815907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eH6JJ3Yp02tm9KiF3Ben/1KE/7chHkVw9QduzBXDbMM=;
  b=UVr06nbMhRofcjvt3l3BNSItIqhbcUe9TLlpekdnxnbrh141TmNYP4sn
   q7rbqzSBmMpFlqqBN9wGJudieFu22OMMs0DkgEfPGoalpx5Aww1GDMh8Q
   CouLctZff79AxGoRE9INKO4j2VxDK4eAQyeNyGWUl4NWKzZZzIAFz+aTf
   z6TecwqGpdWrH+eA1Sg0+x+qmDke18pNCydYNGvkmOvUw7ropcUU15jtT
   r5XRqN/ob4KnGLSQgKi0gCRf2+mZjKTZzuYv2Oks051M3Rx22MjzIrxL1
   6Vzur9QvTKpMHqlqMTPG4L+y3v5nUsmPRcAdALsenxLmLuaTtn5DE+FPk
   w==;
X-CSE-ConnectionGUID: Kdt9E9gqTzGKzzBM1nWYfg==
X-CSE-MsgGUID: 2U9Ss2MvR+eyxpywrLnUwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43815599"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="43815599"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 08:58:27 -0700
X-CSE-ConnectionGUID: nF3nFZzBRb+GWiWc45aJaQ==
X-CSE-MsgGUID: W0Ldu736RGCuXco05IUSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="71826536"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Sep 2024 08:58:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stUPE-000Jff-2f;
	Wed, 25 Sep 2024 15:58:20 +0000
Date: Wed, 25 Sep 2024 23:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] net/toa/toa.c:257: undefined reference to
 `inet_stream_ops'
Message-ID: <202409252337.JGp2Dkhw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a0fc99df5429b7eacab84a2a88f1f482f61c717b
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
config: x86_64-buildonly-randconfig-001-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252337.JGp2Dkhw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409252337.JGp2Dkhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409252337.JGp2Dkhw-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `inet_getname_toa':
   net/toa/toa.c:115: undefined reference to `inet_getname'
   ld: vmlinux.o: in function `tcp_v4_syn_recv_sock_toa':
   net/toa/toa.c:200: undefined reference to `tcp_v4_syn_recv_sock'
   ld: vmlinux.o: in function `hook_toa_functions':
>> net/toa/toa.c:257: undefined reference to `inet_stream_ops'
>> ld: net/toa/toa.c:271: undefined reference to `ipv4_specific'
   ld: vmlinux.o: in function `unhook_toa_functions':
   net/toa/toa.c:297: undefined reference to `inet_stream_ops'
>> ld: net/toa/toa.c:297: undefined reference to `inet_getname'
   ld: net/toa/toa.c:309: undefined reference to `ipv4_specific'
>> ld: net/toa/toa.c:309: undefined reference to `tcp_v4_syn_recv_sock'


vim +257 net/toa/toa.c

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
 > 257		inet_stream_ops_p->getname = inet_getname_toa;
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
 > 271		ipv4_specific_p->syn_recv_sock = tcp_v4_syn_recv_sock_toa;
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
 > 297		inet_stream_ops_p->getname = inet_getname;
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
 > 309		ipv4_specific_p->syn_recv_sock = tcp_v4_syn_recv_sock;
   310		TOA_INFO("CPU [%u] unhooked tcp_v4_syn_recv_sock\n", smp_processor_id());
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
