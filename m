Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5F251795
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766243477; cv=none; b=sso9b6rLNnD96MAM3WfWXo6GPJCDlxJh6LPNVWZGWEw7uSnBGP/qH+apwFGFnqgHhSg7HXrh9Gzevcw8GfZphOOU+7yvCggkeCDodQ4cwfL44qRV40TG0pVgJhRMGVLa8qskmMImlAwodGOudDkj0567TI6gZ9bMiAQqssoPpfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766243477; c=relaxed/simple;
	bh=xx5ytOyXBVhkH40FyF4rSJDlPnecxSy8xwkE/NqdEVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUl/CAE7+ica6Y3UebdT9ucyUduJqPrVicDlZhVUGdHGDFJ6Cv296PqAmw3OxJcUxAsnUThv0npsT72bk6ddTjt01m5K1hF1wD9AJhe6rnKIW2HfGPJs25/s4giT6xx41jzbHW1ClTAkxBE6EVuXfnkT22Wsh0DEy0aJjZHROC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FawqUOQV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FawqUOQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766243476; x=1797779476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xx5ytOyXBVhkH40FyF4rSJDlPnecxSy8xwkE/NqdEVU=;
  b=FawqUOQV7JrOkFPZEFkQa4k+QgEXPKUPTPVezUvJkwpNAxeZgY52zbCQ
   anTwvRXx3M8TvM1RB8+IA50eMV/OKMpDcap95WWkZFepTvdW1PLhzN2tg
   16p4P1QrcqJjK8XUS7tFdIBH3pNuteF4aag/n2kOw+f/t/nykcHRoicNA
   xRV5oE/3u9XxPR23uvTmgQ+VWdlGcJoZF1KnwAwlIVhbxviCvuoqMe35K
   yFRj3Dhr+PQXos5gVl9Ha9o9pWWv+7bhCfxG7pP4u5B/9Jv7K8FfY3jyO
   zhQml/nvkXOcg89pTK8gJKCMovd6EaLtZ9AwCOpbrFfRMTbkR2UYg3nyv
   A==;
X-CSE-ConnectionGUID: 0hFlLBs3QaWfkSqOOIsfjA==
X-CSE-MsgGUID: L1wNUpE4T5qHQYxGsY6jCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68255133"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68255133"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:11:14 -0800
X-CSE-ConnectionGUID: H0J4RXczSBer7DsYavHYfQ==
X-CSE-MsgGUID: vWXD9Jx+R0+BRnuQcpXMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199103074"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 07:11:13 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWybu-000000004ix-1FY3;
	Sat, 20 Dec 2025 15:11:10 +0000
Date: Sat, 20 Dec 2025 23:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547] include/net/sock.h:392:45: error:
 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean
 'skc_daddr'?
Message-ID: <202512202305.zGRxHl6E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b [3547/3547] net:nebula-matrix:Add S1000 SNIC driver support
config: x86_64-randconfig-074-20251216 (https://download.01.org/0day-ci/archive/20251220/202512202305.zGRxHl6E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202305.zGRxHl6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202305.zGRxHl6E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:15,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:12,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ktls.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ktls.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:348:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     348 |         int (*ieee_setets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:349:62: warning: 'struct ieee_ets' declared inside parameter list will not be visible outside of this definition or declaration
     349 |         int (*ieee_getets)(struct net_device *netdev, struct ieee_ets *ets);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:350:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     350 |         int (*ieee_setpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:351:62: warning: 'struct ieee_pfc' declared inside parameter list will not be visible outside of this definition or declaration
     351 |         int (*ieee_getpfc)(struct net_device *netdev, struct ieee_pfc *pfc);
         |                                                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:352:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     352 |         int (*ieee_setapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_def_service.h:353:62: warning: 'struct dcb_app' declared inside parameter list will not be visible outside of this definition or declaration
     353 |         int (*ieee_delapp)(struct net_device *netdev, struct dcb_app *app);
         |                                                              ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:285:24: error: array type has incomplete element type 'struct dcb_app'
     285 |         struct dcb_app app[NBL_DSCP_MAX];
         |                        ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_service.h:287:25: error: field 'ets' has incomplete type
     287 |         struct ieee_ets ets;
         |                         ^~~
   In file included from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:100,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:17,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_product_base.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ktls.c: In function 'nbl_ktls_add_rx_flow':
>> include/net/sock.h:392:45: error: 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean 'skc_daddr'?
     392 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
         |                                             ^~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ktls.c:230:44: note: in expansion of macro 'sk_v6_daddr'
     230 |                 be32_to_cpu_array(sip, sk->sk_v6_daddr.s6_addr32, NBL_KTLS_FLOW_IP_LEN);
         |                                            ^~~~~~~~~~~


vim +392 include/net/sock.h

4dc6dc7162c08b Eric Dumazet             2009-07-15  372  
68835aba4d9b74 Eric Dumazet             2010-11-30  373  #define sk_dontcopy_begin	__sk_common.skc_dontcopy_begin
68835aba4d9b74 Eric Dumazet             2010-11-30  374  #define sk_dontcopy_end		__sk_common.skc_dontcopy_end
4dc6dc7162c08b Eric Dumazet             2009-07-15  375  #define sk_hash			__sk_common.skc_hash
5080546682bae3 Eric Dumazet             2013-10-02  376  #define sk_portpair		__sk_common.skc_portpair
05dbc7b59481ca Eric Dumazet             2013-10-03  377  #define sk_num			__sk_common.skc_num
05dbc7b59481ca Eric Dumazet             2013-10-03  378  #define sk_dport		__sk_common.skc_dport
5080546682bae3 Eric Dumazet             2013-10-02  379  #define sk_addrpair		__sk_common.skc_addrpair
5080546682bae3 Eric Dumazet             2013-10-02  380  #define sk_daddr		__sk_common.skc_daddr
5080546682bae3 Eric Dumazet             2013-10-02  381  #define sk_rcv_saddr		__sk_common.skc_rcv_saddr
^1da177e4c3f41 Linus Torvalds           2005-04-16  382  #define sk_family		__sk_common.skc_family
^1da177e4c3f41 Linus Torvalds           2005-04-16  383  #define sk_state		__sk_common.skc_state
^1da177e4c3f41 Linus Torvalds           2005-04-16  384  #define sk_reuse		__sk_common.skc_reuse
055dc21a1d1d21 Tom Herbert              2013-01-22  385  #define sk_reuseport		__sk_common.skc_reuseport
9fe516ba3fb29b Eric Dumazet             2014-06-27  386  #define sk_ipv6only		__sk_common.skc_ipv6only
26abe14379f8e2 Eric W. Biederman        2015-05-08  387  #define sk_net_refcnt		__sk_common.skc_net_refcnt
^1da177e4c3f41 Linus Torvalds           2005-04-16  388  #define sk_bound_dev_if		__sk_common.skc_bound_dev_if
^1da177e4c3f41 Linus Torvalds           2005-04-16  389  #define sk_bind_node		__sk_common.skc_bind_node
8feaf0c0a5488b Arnaldo Carvalho de Melo 2005-08-09  390  #define sk_prot			__sk_common.skc_prot
07feaebfcc10cd Eric W. Biederman        2007-09-12  391  #define sk_net			__sk_common.skc_net
efe4208f47f907 Eric Dumazet             2013-10-03 @392  #define sk_v6_daddr		__sk_common.skc_v6_daddr
efe4208f47f907 Eric Dumazet             2013-10-03  393  #define sk_v6_rcv_saddr	__sk_common.skc_v6_rcv_saddr
33cf7c90fe2f97 Eric Dumazet             2015-03-11  394  #define sk_cookie		__sk_common.skc_cookie
70da268b569d32 Eric Dumazet             2015-10-08  395  #define sk_incoming_cpu		__sk_common.skc_incoming_cpu
8e5eb54d303b7c Eric Dumazet             2015-10-08  396  #define sk_flags		__sk_common.skc_flags
ed53d0ab761f5c Eric Dumazet             2015-10-08  397  #define sk_rxhash		__sk_common.skc_rxhash
efe4208f47f907 Eric Dumazet             2013-10-03  398  
43f51df4172955 Eric Dumazet             2021-11-15  399  	/* early demux fields */
8b3f91332291fa Jakub Kicinski           2021-12-23  400  	struct dst_entry __rcu	*sk_rx_dst;
43f51df4172955 Eric Dumazet             2021-11-15  401  	int			sk_rx_dst_ifindex;
43f51df4172955 Eric Dumazet             2021-11-15  402  	u32			sk_rx_dst_cookie;
43f51df4172955 Eric Dumazet             2021-11-15  403  
^1da177e4c3f41 Linus Torvalds           2005-04-16  404  	socket_lock_t		sk_lock;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  405  	atomic_t		sk_drops;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  406  	int			sk_rcvlowat;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  407  	struct sk_buff_head	sk_error_queue;
b178bb3dfc30d9 Eric Dumazet             2010-11-16  408  	struct sk_buff_head	sk_receive_queue;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  409  	/*
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  410  	 * The backlog queue is special, it is always used with
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  411  	 * the per-socket spinlock held and requires low latency
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  412  	 * access. Therefore we special case it's implementation.
b178bb3dfc30d9 Eric Dumazet             2010-11-16  413  	 * Note : rmem_alloc is in this structure to fill a hole
b178bb3dfc30d9 Eric Dumazet             2010-11-16  414  	 * on 64bit arches, not because its logically part of
b178bb3dfc30d9 Eric Dumazet             2010-11-16  415  	 * backlog.
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  416  	 */
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  417  	struct {
b178bb3dfc30d9 Eric Dumazet             2010-11-16  418  		atomic_t	rmem_alloc;
b178bb3dfc30d9 Eric Dumazet             2010-11-16  419  		int		len;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  420  		struct sk_buff	*head;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  421  		struct sk_buff	*tail;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  422  	} sk_backlog;
f35f821935d8df Eric Dumazet             2021-11-15  423  

:::::: The code at line 392 was first introduced by commit
:::::: efe4208f47f907b86f528788da711e8ab9dea44d ipv6: make lookups simpler and faster

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
