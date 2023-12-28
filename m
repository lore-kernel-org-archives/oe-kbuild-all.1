Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CB279F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrUbzfyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703769623; x=1735305623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9X5djIl/8fXOv5XTflvbNaH1NdFRYoFvf+yPoH8zzKE=;
  b=BrUbzfyq5wDbQu6BqzD8x668AsjmC1C+H9y/1nlOkybSaGQNi/xtX90t
   b/FNafUJC0adlm4wP1Jt+GZDz3GSdvw6h8xUL5hg5QVFc4m+tpvyYONDo
   GlSmMORZze68A/X63dvc9I7xlAndJ1BYQKFvbz1EXDh8cN4wLgmPRV9eR
   pRqc7zEB0w61z7wqr7yEPEtLbfWUAW66vEku1oCMs2bghHDRlIixv9+tX
   lT6IslKhQeqvywxPVJgPyHNbhG03jVs7O5qWCw3QcZoTvFlTN0IAGPpbV
   1sLVWrRSUREtREoOw2MqZ/O8GCnrIRpfANbkq1aAs0auxg70FNEsV42fT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3380720"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="3380720"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 05:20:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="771718408"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="771718408"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 28 Dec 2023 05:20:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIqJ6-000GUr-1A;
	Thu, 28 Dec 2023 13:20:16 +0000
Date: Thu, 28 Dec 2023 21:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 22/24] drivers/infiniband/hw/mlx5/mem.c:150:2:
 error: call to undeclared function 'memcpy_toio_64'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202312282125.IXrTfPs5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   fa8913d57df65cd1ca2bd5314e3fe8d47627a0c0
commit: db56886f1d11f74ebc57c801c0efae41ce897d11 [22/24] IB/mlx5: Use memcpy_toio_64() for write combining stores
config: mips-randconfig-r121-20231228 (https://download.01.org/0day-ci/archive/20231228/202312282125.IXrTfPs5-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
reproduce: (https://download.01.org/0day-ci/archive/20231228/202312282125.IXrTfPs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312282125.IXrTfPs5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/mem.c:150:2: error: call to undeclared function 'memcpy_toio_64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     150 |         memcpy_toio_64(bf->bfreg->map + bf->offset, mmio_wqe);
         |         ^
   drivers/infiniband/hw/mlx5/mem.c:150:2: note: did you mean 'memcpy_toio'?
   arch/mips/include/asm/io.h:491:20: note: 'memcpy_toio' declared here
     491 | static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int count)
         |                    ^
   1 error generated.


vim +/memcpy_toio_64 +150 drivers/infiniband/hw/mlx5/mem.c

    97	
    98	#define WR_ID_BF 0xBF
    99	#define WR_ID_END 0xBAD
   100	#define TEST_WC_NUM_WQES 255
   101	#define TEST_WC_POLLING_MAX_TIME_JIFFIES msecs_to_jiffies(100)
   102	static int post_send_nop(struct mlx5_ib_dev *dev, struct ib_qp *ibqp, u64 wr_id,
   103				 bool signaled)
   104	{
   105		struct mlx5_ib_qp *qp = to_mqp(ibqp);
   106		struct mlx5_wqe_ctrl_seg *ctrl;
   107		struct mlx5_bf *bf = &qp->bf;
   108		__be32 mmio_wqe[16] = {};
   109		unsigned long flags;
   110		unsigned int idx;
   111	
   112		if (unlikely(dev->mdev->state == MLX5_DEVICE_STATE_INTERNAL_ERROR))
   113			return -EIO;
   114	
   115		spin_lock_irqsave(&qp->sq.lock, flags);
   116	
   117		idx = qp->sq.cur_post & (qp->sq.wqe_cnt - 1);
   118		ctrl = mlx5_frag_buf_get_wqe(&qp->sq.fbc, idx);
   119	
   120		memset(ctrl, 0, sizeof(struct mlx5_wqe_ctrl_seg));
   121		ctrl->fm_ce_se = signaled ? MLX5_WQE_CTRL_CQ_UPDATE : 0;
   122		ctrl->opmod_idx_opcode =
   123			cpu_to_be32(((u32)(qp->sq.cur_post) << 8) | MLX5_OPCODE_NOP);
   124		ctrl->qpn_ds = cpu_to_be32((sizeof(struct mlx5_wqe_ctrl_seg) / 16) |
   125					   (qp->trans_qp.base.mqp.qpn << 8));
   126	
   127		qp->sq.wrid[idx] = wr_id;
   128		qp->sq.w_list[idx].opcode = MLX5_OPCODE_NOP;
   129		qp->sq.wqe_head[idx] = qp->sq.head + 1;
   130		qp->sq.cur_post += DIV_ROUND_UP(sizeof(struct mlx5_wqe_ctrl_seg),
   131						MLX5_SEND_WQE_BB);
   132		qp->sq.w_list[idx].next = qp->sq.cur_post;
   133		qp->sq.head++;
   134	
   135		memcpy(mmio_wqe, ctrl, sizeof(*ctrl));
   136		((struct mlx5_wqe_ctrl_seg *)&mmio_wqe)->fm_ce_se |=
   137			MLX5_WQE_CTRL_CQ_UPDATE;
   138	
   139		/* Make sure that descriptors are written before
   140		 * updating doorbell record and ringing the doorbell
   141		 */
   142		wmb();
   143	
   144		qp->db.db[MLX5_SND_DBR] = cpu_to_be32(qp->sq.cur_post);
   145	
   146		/* Make sure doorbell record is visible to the HCA before
   147		 * we hit doorbell
   148		 */
   149		wmb();
 > 150		memcpy_toio_64(bf->bfreg->map + bf->offset, mmio_wqe);
   151		io_stop_wc();
   152	
   153		bf->offset ^= bf->buf_size;
   154	
   155		spin_unlock_irqrestore(&qp->sq.lock, flags);
   156	
   157		return 0;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
