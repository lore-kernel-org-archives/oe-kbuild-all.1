Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717AD21772B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 23:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748648654; cv=none; b=fijiAM1fyKAziFP4b4EfHymI0NxnB7XWkH4hDtHInS44pl1wsh/+iV2ZYixPLY+p/nZwDJZZxoB6m5VXlHC7Yo8G1ooMO6kfhqCmkLl0//SHu+2RVuQcfedvyl4bPyCxdkRHDp844Wwoko0TcXuEIeQGgSSwXLOZDaz1Q48Hpa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748648654; c=relaxed/simple;
	bh=6+FJSfms403QpNsNesUjLb/zoHbnh/63aKczWhXRvkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSsx1p3f2tDTuBy4SbEtzbsaD+rIhN79EXsJVC3gb0HSzG4ZAgmCw7pE3BYO/W81N9hiK/T4PXbaZd+gvncg6IXnhRJkPkY+xft5eDODhrkRiiiI5TSt4X/IGcyjOat5WjZh1QMFTR5KWJ0wIv43+Vn0jM4UskEjXu1Q0MqfePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5LMArGZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5LMArGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748648651; x=1780184651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+FJSfms403QpNsNesUjLb/zoHbnh/63aKczWhXRvkI=;
  b=L5LMArGZMDzk5DR5XW3i0Tdmq/u1AVc+rxEVrMJMjFYKw6nI2Q9wJoYa
   1MBhochO8DB1VMnEb5Jl0vZcXG+TYa9AuC0+/iJrluZVmatloMnorZzBI
   BbihfKMtE+Ipa4LeVICZJu+iE7hOZ+S8YLclKvXU6Y53vVNk8TjkvU9Ki
   DanZXLyKwmM4SEQUc2pl5JyKzmpyYG6+fEVxxR1jfosz38bqBpjwuUMUb
   lDoNm3iaW7H6Jcqk5hcw6D0gpRsRegPJ1TRyYwCKQAr407gwuY8mwR6sz
   vflDs7MbL+k6Mxy1c/c81Y85Cs1LDu2xJnM2831qMpBv7Pq/KKG/oLAzX
   Q==;
X-CSE-ConnectionGUID: /z/XuMoCRe+hUOJ2iQ83vA==
X-CSE-MsgGUID: NJzioRvYQT2vegvUbr1bQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61374969"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="61374969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 16:44:11 -0700
X-CSE-ConnectionGUID: ZxN6KhU+Tgm6egflYST+6w==
X-CSE-MsgGUID: bVDL5Yg7QMKi3QcHUwsrXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="175012229"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 May 2025 16:44:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL9OR-000Y3E-1V;
	Fri, 30 May 2025 23:44:07 +0000
Date: Sat, 31 May 2025 07:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 14/16]
 drivers/infiniband/hw/mlx5/ipoib.c:581:31: error:
 'mlx5e_skb_from_cqe_linear' undeclared; did you mean
 'mlx5e_fp_skb_from_cqe_mpwrq'?
Message-ID: <202505310711.rUjs9AY6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Leon,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   59b028d17e1dc229f52b9c2081b90fbb11798b27
commit: 44ec5c9fb7ae5b9f5ac6c4a770797057224ac3e3 [14/16] net/mlx5e: Separate ethernet functionality to dedicated module
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250531/202505310711.rUjs9AY6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310711.rUjs9AY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310711.rUjs9AY6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from include/linux/ethtool.h:16,
                    from include/rdma/ib_verbs.h:15,
                    from drivers/infiniband/hw/mlx5/ipoib.c:7:
   drivers/infiniband/hw/mlx5/ipoib.c: In function 'mlx5i_handle_rx_cqe':
>> drivers/infiniband/hw/mlx5/ipoib.c:581:31: error: 'mlx5e_skb_from_cqe_linear' undeclared (first use in this function); did you mean 'mlx5e_fp_skb_from_cqe_mpwrq'?
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/infiniband/hw/mlx5/ipoib.c:580:15: note: in expansion of macro 'INDIRECT_CALL_2'
     580 |         skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
         |               ^~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/ipoib.c:581:31: note: each undeclared identifier is reported only once for each function it appears in
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/infiniband/hw/mlx5/ipoib.c:580:15: note: in expansion of macro 'INDIRECT_CALL_2'
     580 |         skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
         |               ^~~~~~~~~~~~~~~
   In file included from include/net/sock.h:62,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:102,
                    from include/net/ipv6.h:12,
                    from include/rdma/ib_verbs.h:25:
>> drivers/infiniband/hw/mlx5/ipoib.c:581:31: error: implicit declaration of function 'mlx5e_skb_from_cqe_linear' [-Werror=implicit-function-declaration]
     581 |                               mlx5e_skb_from_cqe_linear,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/indirect_call_wrapper.h:23:35: note: in definition of macro 'INDIRECT_CALL_2'
      23 |                 likely(f == f2) ? f2(__VA_ARGS__) :                     \
         |                                   ^~
>> drivers/infiniband/hw/mlx5/ipoib.c:582:31: error: 'mlx5e_skb_from_cqe_nonlinear' undeclared (first use in this function)
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/indirect_call_wrapper.h:24:35: note: in expansion of macro 'INDIRECT_CALL_1'
      24 |                                   INDIRECT_CALL_1(f, f1, __VA_ARGS__);  \
         |                                   ^~~~~~~~~~~~~~~
   drivers/infiniband/hw/mlx5/ipoib.c:580:15: note: in expansion of macro 'INDIRECT_CALL_2'
     580 |         skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
         |               ^~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mlx5/ipoib.c:582:31: error: implicit declaration of function 'mlx5e_skb_from_cqe_nonlinear' [-Werror=implicit-function-declaration]
     582 |                               mlx5e_skb_from_cqe_nonlinear,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/indirect_call_wrapper.h:19:35: note: in definition of macro 'INDIRECT_CALL_1'
      19 |                 likely(f == f1) ? f1(__VA_ARGS__) : f(__VA_ARGS__);     \
         |                                   ^~
   drivers/infiniband/hw/mlx5/ipoib.c:580:15: note: in expansion of macro 'INDIRECT_CALL_2'
     580 |         skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
         |               ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +581 drivers/infiniband/hw/mlx5/ipoib.c

7e94a32c6f4e8a Leon Romanovsky 2025-05-28  562  
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  563  static void mlx5i_handle_rx_cqe(struct mlx5e_rq *rq, struct mlx5_cqe64 *cqe)
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  564  {
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  565  	struct mlx5_wq_cyc *wq = &rq->wqe.wq;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  566  	struct mlx5e_wqe_frag_info *wi;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  567  	struct sk_buff *skb;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  568  	u32 cqe_bcnt;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  569  	u16 ci;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  570  
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  571  	ci       = mlx5_wq_cyc_ctr2ix(wq, be16_to_cpu(cqe->wqe_counter));
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  572  	wi       = mlx5e_get_frag(rq, ci);
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  573  	cqe_bcnt = be32_to_cpu(cqe->byte_cnt);
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  574  
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  575  	if (unlikely(MLX5E_RX_ERR_CQE(cqe))) {
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  576  		rq->stats->wqe_err++;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  577  		goto wq_cyc_pop;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  578  	}
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  579  
7e94a32c6f4e8a Leon Romanovsky 2025-05-28 @580  	skb = INDIRECT_CALL_2(rq->wqe.skb_from_cqe,
7e94a32c6f4e8a Leon Romanovsky 2025-05-28 @581  			      mlx5e_skb_from_cqe_linear,
7e94a32c6f4e8a Leon Romanovsky 2025-05-28 @582  			      mlx5e_skb_from_cqe_nonlinear,
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  583  			      rq, wi, cqe, cqe_bcnt);
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  584  	if (!skb)
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  585  		goto wq_cyc_pop;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  586  
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  587  	mlx5i_complete_rx_cqe(rq, cqe, cqe_bcnt, skb);
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  588  	if (unlikely(!skb->dev)) {
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  589  		dev_kfree_skb_any(skb);
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  590  		goto wq_cyc_pop;
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  591  	}
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  592  	napi_gro_receive(rq->cq.napi, skb);
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  593  
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  594  wq_cyc_pop:
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  595  	mlx5_wq_cyc_pop(wq);
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  596  }
7e94a32c6f4e8a Leon Romanovsky 2025-05-28  597  

:::::: The code at line 581 was first introduced by commit
:::::: 7e94a32c6f4e8a718894671b0bf624bee281d605 RDMA/mlx5: Move IPoIB to relevant subsystem

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
