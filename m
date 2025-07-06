Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375B51D63FC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751789791; cv=none; b=ED0E/L5epm7S6qzokMNxHYNFJPS+Z3gBxnv3pX7dfn2WzOjlXfDLJZ4jAzaaefB57dgt9jG7FtI+WnBfzoYWrwp/6ZlZYWl80d459mS5AI4wsX/Ql/ri97XuOXurGrWdqHo6aspNNDL0l8QpxdHH0V+4wfJ468GheNv7NGcjOlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751789791; c=relaxed/simple;
	bh=PwO5n1nYCsnr1bAbCWg1A+Dvg1pG7yjtlr5R5Elbp9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JUWQy8fEU4SZ1g5l+iqyZ6ntng9fWU8aq3y5TqUbdgE2HHl+QGJLgF9JTkur+R8cEI8xLmt+U1Iu0BjahNOyvSreUAnzdVun4PZ8RQl+pL3YNecVT0UEaLmJL5yuowUgkjnjmfZTYdLYHMmGl0a39tt6Sesa+xk+6DvWkrj46j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0BCWUxt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0BCWUxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751789788; x=1783325788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwO5n1nYCsnr1bAbCWg1A+Dvg1pG7yjtlr5R5Elbp9E=;
  b=Q0BCWUxt+vfdmu21iKPqUdxddo8Jl0x1mDuqghuBxfl81okcBti3paUw
   Ij4NcCc0CRkhbzAfxudksYyotMEU1FR27hDagwjYFo2BGw0tF1Y4FsGiH
   M2ZajhvL4M27zhuWJGjtkPiL6cfDBZuChZ+pM4ylkVxHsPLnmZ9GUnupA
   WsJ1vO0YmMW4m9m5sjinl5lHZM5sZNlhjRrVlhOSi31TYgmWhZIj7Hk2b
   ou6GZ5NF8OTvQAvrsVKhjPPaX3g/Eh1LP4+nMlDEvcNpVe/9t2R0vS5iv
   JqYB9Sfa/Mnsrn1DUjMmyVguhr/GOF8A0NcFTQgAykh6pnn30e6Y1SrMB
   w==;
X-CSE-ConnectionGUID: UKoPHIzYSIC2G2VB252xFw==
X-CSE-MsgGUID: BxdMVPESTjaB7Kjrn9TsBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54133029"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54133029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 01:16:28 -0700
X-CSE-ConnectionGUID: E1PKuGE8R+OWvdapcQk3HQ==
X-CSE-MsgGUID: ztNXRJWSR9u9QqiREQCGPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="155531045"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jul 2025 01:16:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYKXw-0004xX-1u;
	Sun, 06 Jul 2025 08:16:24 +0000
Date: Sun, 6 Jul 2025 16:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2467/2467] fs/nfs/enfs/shard_route.c:1619:60:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202507061642.3MzghacU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9f7917e90ec872036160e2cb3a1d3c1856cb406
commit: 9ef9b8c08d762983f8b1f94deb6b115d2967c497 [2467/2467] fix enfs bug
config: x86_64-randconfig-121-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061642.3MzghacU-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061642.3MzghacU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061642.3MzghacU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs/enfs/shard_route.c:327:5: sparse: sparse: symbol 'enfs_query_lif_info' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:434:5: sparse: sparse: symbol 'enfs_update_fsshard' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:530:5: sparse: sparse: symbol 'enfs_update_lsinfo' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:555:5: sparse: sparse: symbol 'enfs_update_lif_info' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:639:5: sparse: sparse: symbol 'enfs_delete_shard' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:776:21: sparse: sparse: symbol 'nfs3_parse_ops' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:801:5: sparse: sparse: symbol 'nfs3_parse_ops_size' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:972:6: sparse: sparse: symbol 'check_cpuid_invalid' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:1045:17: sparse: sparse: symbol 'enfs_choose_shard_xport' was not declared. Should it be static?
   fs/nfs/enfs/shard_route.c:1124:17: sparse: sparse: symbol 'enfs_get_shard_xport' was not declared. Should it be static?
>> fs/nfs/enfs/shard_route.c:1619:60: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct rpc_xprt *xprt @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
   fs/nfs/enfs/shard_route.c:1619:60: sparse:     expected struct rpc_xprt *xprt
   fs/nfs/enfs/shard_route.c:1619:60: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
   fs/nfs/enfs/shard_route.c:1674:34: sparse: sparse: cast removes address space '__rcu' of expression
   fs/nfs/enfs/shard_route.c:1683:34: sparse: sparse: cast removes address space '__rcu' of expression
   fs/nfs/enfs/shard_route.c:1896:24: sparse: sparse: symbol 'enfs_shard_ctrl_init' was not declared. Should it be static?

vim +1619 fs/nfs/enfs/shard_route.c

  1615	
  1616	static int enfs_traverse_nlm_xprt(struct nfs_server *server)
  1617	{
  1618		char remoteip[IP_ADDRESS_LEN_MAX] = { "*" };
> 1619		struct rpc_xprt *xprt = server->nlm_host->h_rpcclnt->cl_xprt;
  1620		struct enfs_xprt_context *ctx = NULL;
  1621	
  1622		server->nlm_host->enfs_flag |= ENFS_NEED_REBUILD_NLM_XPRT;
  1623		rpc_clnt_iterate_for_each_xprt(server->nfs_client->cl_rpcclient,
  1624							EnfsChooseNewNlmXprt,
  1625							(void *)xprt);
  1626	
  1627		sockaddr_ip_to_str((struct sockaddr *)&xprt->addr, remoteip,
  1628					sizeof(remoteip));
  1629		strscpy(server->nlm_host->h_name, remoteip, IP_ADDRESS_LEN_MAX);
  1630		strscpy(server->nlm_host->h_addrbuf, remoteip, NSM_ADDRBUF);
  1631	
  1632		ctx =
  1633			(struct enfs_xprt_context *)xprt_get_reserve_context(xprt);
  1634		if (ctx == NULL) {
  1635			enfs_log_error
  1636				("The xprt multipath ctx is not valid.\n");
  1637			return 0;
  1638		}
  1639		memcpy((struct sockaddr *)&server->nlm_host->h_addr,
  1640				(struct sockaddr *)&xprt->addr, sizeof(xprt->addr));
  1641		memcpy((struct sockaddr *)&server->nlm_host->h_srcaddr,
  1642				(struct sockaddr *)&ctx->srcaddr, sizeof(ctx->srcaddr));
  1643	
  1644		return 0;
  1645	}
  1646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
