Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3696179AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzH4RVgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702225060; x=1733761060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DAk1Cd9lPs4eVPsjgBAbaTQHr80kR8a62HF+a2SasBc=;
  b=EzH4RVgo0J72VHPwF+9UH25oLcQbKF0B7PWsq8ouZAruap1ZXsslpCOj
   xVztB/1OkFz6w5KLpqCNff/vbt0iCtPBWW6LhzCC8B2AMFr11/kynPNXO
   N+mk4Kl1nIORKShjD+fkccCJ2JvQ5J5sUuD8pgti1T+wdLK8tDCdMx0qo
   jBOEPnTrPCq525vLGlrU9HEK1ZDSawJSzqftSR5tVg6mz3qK6AvJ4uskE
   fj7y8uwa0KlCsX0ko58DJvXCpvko2FNXGnXdyIUPzmsUBxpSuvw7cYhCJ
   EIBnpXClybDkNSUTlqgsgL3hujN7XB3QU6mYaVOwbtFWwFTQdyEarNKJc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="7920689"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="7920689"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 08:17:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="890800346"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="890800346"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2023 08:17:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCMUn-000H1C-2Y;
	Sun, 10 Dec 2023 16:17:33 +0000
Date: Mon, 11 Dec 2023 00:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx-pp-provider 19/31] io_uring/zc_rx.c:59:5: error:
 redefinition of 'io_register_zc_rx_ifq'
Message-ID: <202312110055.RvJpvk7j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider
head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
commit: a637a9b59d1de6a86ea926ae416dd7bc1f4b6da1 [19/31] io_uring: add interface queue
config: i386-buildonly-randconfig-006-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110055.RvJpvk7j-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110055.RvJpvk7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110055.RvJpvk7j-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from io_uring/zc_rx.c:12:
   io_uring/zc_rx.h: In function 'io_unregister_zc_rx_ifq':
   io_uring/zc_rx.h:31:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      31 |  return -EOPNOTSUPP;
         |         ^
   io_uring/zc_rx.h:29:20: note: declared here
      29 | static inline void io_unregister_zc_rx_ifq(struct io_ring_ctx *ctx)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/zc_rx.c: At top level:
>> io_uring/zc_rx.c:14:5: warning: no previous prototype for 'io_allocate_rbuf_ring' [-Wmissing-prototypes]
      14 | int io_allocate_rbuf_ring(struct io_zc_rx_ifq *ifq,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> io_uring/zc_rx.c:34:6: warning: no previous prototype for 'io_free_rbuf_ring' [-Wmissing-prototypes]
      34 | void io_free_rbuf_ring(struct io_zc_rx_ifq *ifq)
         |      ^~~~~~~~~~~~~~~~~
>> io_uring/zc_rx.c:59:5: error: redefinition of 'io_register_zc_rx_ifq'
      59 | int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from io_uring/zc_rx.c:12:
   io_uring/zc_rx.h:24:19: note: previous definition of 'io_register_zc_rx_ifq' was here
      24 | static inline int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> io_uring/zc_rx.c:98:6: warning: no previous prototype for 'io_unregister_zc_rx_ifqs' [-Wmissing-prototypes]
      98 | void io_unregister_zc_rx_ifqs(struct io_ring_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> io_uring/zc_rx.c:111:6: warning: no previous prototype for 'io_shut_zc_rx_ifqs' [-Wmissing-prototypes]
     111 | void io_shut_zc_rx_ifqs(struct io_ring_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~


vim +/io_register_zc_rx_ifq +59 io_uring/zc_rx.c

    13	
  > 14	int io_allocate_rbuf_ring(struct io_zc_rx_ifq *ifq,
    15				  struct io_uring_zc_rx_ifq_reg *reg)
    16	{
    17		gfp_t gfp = GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN | __GFP_COMP;
    18		size_t off, size, rq_size, cq_size;
    19		void *ptr;
    20	
    21		off = sizeof(struct io_rbuf_ring);
    22		rq_size = reg->rq_entries * sizeof(struct io_uring_rbuf_rqe);
    23		cq_size = reg->cq_entries * sizeof(struct io_uring_rbuf_cqe);
    24		size = off + rq_size + cq_size;
    25		ptr = (void *) __get_free_pages(gfp, get_order(size));
    26		if (!ptr)
    27			return -ENOMEM;
    28		ifq->ring = (struct io_rbuf_ring *)ptr;
    29		ifq->rqes = (struct io_uring_rbuf_rqe *)((char *)ptr + off);
    30		ifq->cqes = (struct io_uring_rbuf_cqe *)((char *)ifq->rqes + rq_size);
    31		return 0;
    32	}
    33	
  > 34	void io_free_rbuf_ring(struct io_zc_rx_ifq *ifq)
    35	{
    36		if (ifq->ring)
    37			folio_put(virt_to_folio(ifq->ring));
    38	}
    39	
    40	static struct io_zc_rx_ifq *io_zc_rx_ifq_alloc(struct io_ring_ctx *ctx)
    41	{
    42		struct io_zc_rx_ifq *ifq;
    43	
    44		ifq = kzalloc(sizeof(*ifq), GFP_KERNEL);
    45		if (!ifq)
    46			return NULL;
    47	
    48		ifq->if_rxq_id = -1;
    49		ifq->ctx = ctx;
    50		return ifq;
    51	}
    52	
    53	static void io_zc_rx_ifq_free(struct io_zc_rx_ifq *ifq)
    54	{
    55		io_free_rbuf_ring(ifq);
    56		kfree(ifq);
    57	}
    58	
  > 59	int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
    60				  struct io_uring_zc_rx_ifq_reg __user *arg)
    61	{
    62		struct io_uring_zc_rx_ifq_reg reg;
    63		struct io_zc_rx_ifq *ifq;
    64		int ret;
    65	
    66		if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
    67			return -EINVAL;
    68		if (copy_from_user(&reg, arg, sizeof(reg)))
    69			return -EFAULT;
    70		if (ctx->ifq)
    71			return -EBUSY;
    72		if (reg.if_rxq_id == -1)
    73			return -EINVAL;
    74	
    75		ifq = io_zc_rx_ifq_alloc(ctx);
    76		if (!ifq)
    77			return -ENOMEM;
    78	
    79		/* TODO: initialise network interface */
    80	
    81		ret = io_allocate_rbuf_ring(ifq, &reg);
    82		if (ret)
    83			goto err;
    84	
    85		/* TODO: map zc region and initialise zc pool */
    86	
    87		ifq->rq_entries = reg.rq_entries;
    88		ifq->cq_entries = reg.cq_entries;
    89		ifq->if_rxq_id = reg.if_rxq_id;
    90		ctx->ifq = ifq;
    91	
    92		return 0;
    93	err:
    94		io_zc_rx_ifq_free(ifq);
    95		return ret;
    96	}
    97	
  > 98	void io_unregister_zc_rx_ifqs(struct io_ring_ctx *ctx)
    99	{
   100		struct io_zc_rx_ifq *ifq = ctx->ifq;
   101	
   102		lockdep_assert_held(&ctx->uring_lock);
   103	
   104		if (!ifq)
   105			return;
   106	
   107		ctx->ifq = NULL;
   108		io_zc_rx_ifq_free(ifq);
   109	}
   110	
 > 111	void io_shut_zc_rx_ifqs(struct io_ring_ctx *ctx)
   112	{
   113		lockdep_assert_held(&ctx->uring_lock);
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
