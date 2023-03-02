Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485210FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 19:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677784651; x=1709320651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GHUlMaRRDJw3kdaRsLye6yDLJQ+XeeWX+v78ISYA8lo=;
  b=cfTp9jyVbE/vpGx+JkKYmaChfOdAXggemDWnZn4f5Cla41Wd7aYd4VsS
   xwo+FEG3nvxaLurFVfU1gYETAELNQIfMJdRUQgjZMs09c2kMihIp0/7kP
   fwUr1oSZFB1G1xCGwUWW4vbUvv0n5Xz9MlSUcD2Up285ddAW8+UJlP5ss
   Rl6PKSWbB67BPMUTKnIJLHCbkf9txkH2IMMP71Q6ZXRkzozaQWbiuquQt
   6GuZsPg+wlrZkRvOSSWflztOCLrjtShwUHhqK+tYWcVvIek8dZ6n3uaMr
   VjkmYBvTnXdzDsOg6xUCOB5PGWtdtxZzD3fY6kBR9etzps8vpai5btBhk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337140599"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="337140599"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 11:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004267073"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="1004267073"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2023 11:17:30 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXoQj-0000o4-1G;
	Thu, 02 Mar 2023 19:17:29 +0000
Date: Fri, 3 Mar 2023 03:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 07/12] io_uring: add IORING_OP_FUSED_CMD
Message-ID: <202303030332.RoPWPvGY-lkp@intel.com>
References: <20230301140611.163055-8-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301140611.163055-8-ming.lei@redhat.com>

Hi Ming,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master]
[cannot apply to axboe-block/for-next v6.2 next-20230302]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-increase-io_kiocb-flags-into-64bit/20230301-221054
patch link:    https://lore.kernel.org/r/20230301140611.163055-8-ming.lei%40redhat.com
patch subject: [RFC PATCH 07/12] io_uring: add IORING_OP_FUSED_CMD
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230303/202303030332.RoPWPvGY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/879ff1424f99ef055e902e95625052b87f17fc08
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ming-Lei/io_uring-increase-io_kiocb-flags-into-64bit/20230301-221054
        git checkout 879ff1424f99ef055e902e95625052b87f17fc08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030332.RoPWPvGY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/fused_cmd.c:45:5: warning: no previous prototype for 'io_fused_cmd_prep' [-Wmissing-prototypes]
      45 | int io_fused_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
         |     ^~~~~~~~~~~~~~~~~
>> io_uring/fused_cmd.c:112:5: warning: no previous prototype for 'io_fused_cmd' [-Wmissing-prototypes]
     112 | int io_fused_cmd(struct io_kiocb *req, unsigned int issue_flags)
         |     ^~~~~~~~~~~~
>> io_uring/fused_cmd.c:134:5: warning: no previous prototype for 'io_import_kbuf_for_slave' [-Wmissing-prototypes]
     134 | int io_import_kbuf_for_slave(u64 buf, unsigned int len, int rw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> io_uring/fused_cmd.c:177:6: warning: no previous prototype for 'io_fused_cmd_return_kbuf' [-Wmissing-prototypes]
     177 | void io_fused_cmd_return_kbuf(struct io_kiocb *slave)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/io_fused_cmd_prep +45 io_uring/fused_cmd.c

    44	
  > 45	int io_fused_cmd_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
    46		__must_hold(&req->ctx->uring_lock)
    47	{
    48		struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
    49		const struct io_uring_sqe *slave_sqe = sqe + 1;
    50		struct io_ring_ctx *ctx = req->ctx;
    51		struct io_kiocb *slave;
    52		u8 slave_op;
    53		int ret;
    54	
    55		if (unlikely(!(ctx->flags & IORING_SETUP_SQE128)))
    56			return -EINVAL;
    57	
    58		if (unlikely(sqe->__pad1))
    59			return -EINVAL;
    60	
    61		ioucmd->flags = READ_ONCE(sqe->uring_cmd_flags);
    62		if (unlikely(ioucmd->flags))
    63			return -EINVAL;
    64	
    65		slave_op = READ_ONCE(slave_sqe->opcode);
    66		if (unlikely(!io_fused_slave_valid(slave_sqe, slave_op)))
    67			return -EINVAL;
    68	
    69		ioucmd->cmd = sqe->cmd;
    70		ioucmd->cmd_op = READ_ONCE(sqe->cmd_op);
    71		req->fused_cmd_kbuf = NULL;
    72	
    73		/* take one extra reference for the slave request */
    74		io_get_task_refs(1);
    75	
    76		ret = -ENOMEM;
    77		if (unlikely(!io_alloc_req(ctx, &slave)))
    78			goto fail;
    79	
    80		ret = io_init_req(ctx, slave, slave_sqe, true);
    81		if (unlikely(ret))
    82			goto fail_free_req;
    83	
    84		io_fused_cmd_update_link_flags(req, slave);
    85	
    86		ioucmd->fused.data.__slave = slave;
    87		req->flags |= REQ_F_FUSED_MASTER;
    88	
    89		return 0;
    90	
    91	fail_free_req:
    92		io_free_req(slave);
    93	fail:
    94		current->io_uring->cached_refs += 1;
    95		return ret;
    96	}
    97	
    98	static inline bool io_fused_slave_write_to_buf(u8 op)
    99	{
   100		switch (op) {
   101		case IORING_OP_READ:
   102		case IORING_OP_READV:
   103		case IORING_OP_READ_FIXED:
   104		case IORING_OP_RECVMSG:
   105		case IORING_OP_RECV:
   106			return 1;
   107		default:
   108			return 0;
   109		}
   110	}
   111	
 > 112	int io_fused_cmd(struct io_kiocb *req, unsigned int issue_flags)
   113	{
   114		struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
   115		const struct io_kiocb *slave = ioucmd->fused.data.__slave;
   116		int ret = -EINVAL;
   117	
   118		/*
   119		 * Pass buffer direction for driver to validate if the read/write
   120		 * is legal
   121		 */
   122		if (io_fused_slave_write_to_buf(slave->opcode))
   123			issue_flags |= IO_URING_F_FUSED_WRITE;
   124		else
   125			issue_flags |= IO_URING_F_FUSED_READ;
   126	
   127		ret = io_uring_cmd(req, issue_flags);
   128		if (ret != IOU_ISSUE_SKIP_COMPLETE)
   129			io_free_req(ioucmd->fused.data.__slave);
   130	
   131		return ret;
   132	}
   133	
 > 134	int io_import_kbuf_for_slave(u64 buf, unsigned int len, int rw,
   135			struct iov_iter *iter, struct io_kiocb *slave)
   136	{
   137		struct io_kiocb *req = slave->fused_master_req;
   138		const struct io_mapped_buf *kbuf;
   139		unsigned int offset;
   140	
   141		if (unlikely(!(slave->flags & REQ_F_FUSED_SLAVE) || !req))
   142			return -EINVAL;
   143	
   144		if (unlikely(!req->fused_cmd_kbuf))
   145			return -EINVAL;
   146	
   147		/* req->fused_cmd_kbuf is immutable */
   148		kbuf = req->fused_cmd_kbuf;
   149		offset = kbuf->offset;
   150	
   151		if (!kbuf->bvec)
   152			return -EINVAL;
   153	
   154		/* not inside the mapped region */
   155		if (unlikely(buf < kbuf->buf || buf > kbuf->buf_end))
   156			return -EFAULT;
   157	
   158		if (unlikely(len > kbuf->buf_end - buf))
   159			return -EFAULT;
   160	
   161		/* don't use io_import_fixed which doesn't support multipage bvec */
   162		offset += buf - kbuf->buf;
   163		iov_iter_bvec(iter, rw, kbuf->bvec, kbuf->nr_bvecs, offset + len);
   164	
   165		if (offset)
   166			iov_iter_advance(iter, offset);
   167	
   168		return 0;
   169	}
   170	
   171	/*
   172	 * Called when slave request is completed,
   173	 *
   174	 * Return back ownership of the fused_cmd kbuf to master request, and
   175	 * notify master request.
   176	 */
 > 177	void io_fused_cmd_return_kbuf(struct io_kiocb *slave)
   178	{
   179		struct io_kiocb *req = slave->fused_master_req;
   180		struct io_uring_cmd *ioucmd;
   181	
   182		if (unlikely(!req || !(slave->flags & REQ_F_FUSED_SLAVE)))
   183			return;
   184	
   185		/* return back the buffer */
   186		slave->fused_master_req = NULL;
   187		ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
   188		ioucmd->fused.data.__slave = NULL;
   189	
   190		/* If slave OP skips CQE, return the result via master command */
   191		if (slave->flags & REQ_F_CQE_SKIP)
   192			ioucmd->fused.data.slave_res = slave->cqe.res;
   193		else
   194			ioucmd->fused.data.slave_res = 0;
   195		io_uring_cmd_complete_in_task(ioucmd, ioucmd->task_work_cb);
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
