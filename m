Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40242568
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683477398; x=1715013398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/la5ydvvDZA6qG7kWrZtCA9xwkvjhfNPPNe390QIQ8=;
  b=aJlKEQWmXbvqqRL31SxZZGZRHUV3d1waXQcn3ZTjhUv1zB4v81ZnHBjf
   X2TuyqF2iivRym238pizYfxa8lPqT+s7Yf14MPTn2SR3mPKSyFohzO5oY
   jtRGLYmKNdRJJermLZoQ13axOvAiHXLeRM7DfZi7bmdbj+lqEwoHk6h0L
   KFDxEQ5PxNNzblMcLzci9AnoiFh2GYDkvPcfiYpPe4uYNa3yisUXLPet9
   qwM02RsFGxVPD/dIfxWclr7vaHJpHMxTyxQzR45GayYMSMs89Gel62G1J
   79DTmot2vtrO0Ofucqh78awpNMYcop6AQdpen/YTuNWxxzMjYZQTDABDB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435816622"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="435816622"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 09:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="872522537"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="872522537"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 May 2023 09:36:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvhND-0000np-0g;
	Sun, 07 May 2023 16:36:35 +0000
Date: Mon, 8 May 2023 00:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [axboe-block:for-6.4/io_uring 74/75]
 drivers/nvme/host/ioctl.c:555:44: error: implicit declaration of function
 'io_uring_sqe_cmd'; did you mean 'io_uring_free'?
Message-ID: <202305080039.r7cguaXB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.4/io_uring
head:   d2b7fa6174bc4260e496cbf84375c73636914641
commit: fd9b8547bc5c34186dc42ea05fb4380d21695374 [74/75] io_uring: Pass whole sqe to commands
config: arc-randconfig-r025-20230507 (https://download.01.org/0day-ci/archive/20230508/202305080039.r7cguaXB-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=fd9b8547bc5c34186dc42ea05fb4380d21695374
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.4/io_uring
        git checkout fd9b8547bc5c34186dc42ea05fb4380d21695374
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080039.r7cguaXB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvme/host/ioctl.c: In function 'nvme_uring_cmd_io':
>> drivers/nvme/host/ioctl.c:555:44: error: implicit declaration of function 'io_uring_sqe_cmd'; did you mean 'io_uring_free'? [-Werror=implicit-function-declaration]
     555 |         const struct nvme_uring_cmd *cmd = io_uring_sqe_cmd(ioucmd->sqe);
         |                                            ^~~~~~~~~~~~~~~~
         |                                            io_uring_free
>> drivers/nvme/host/ioctl.c:555:44: warning: initialization of 'const struct nvme_uring_cmd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +555 drivers/nvme/host/ioctl.c

   550	
   551	static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
   552			struct io_uring_cmd *ioucmd, unsigned int issue_flags, bool vec)
   553	{
   554		struct nvme_uring_cmd_pdu *pdu = nvme_uring_cmd_pdu(ioucmd);
 > 555		const struct nvme_uring_cmd *cmd = io_uring_sqe_cmd(ioucmd->sqe);
   556		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
   557		struct nvme_uring_data d;
   558		struct nvme_command c;
   559		struct request *req;
   560		blk_opf_t rq_flags = REQ_ALLOC_CACHE;
   561		blk_mq_req_flags_t blk_flags = 0;
   562		void *meta = NULL;
   563		int ret;
   564	
   565		c.common.opcode = READ_ONCE(cmd->opcode);
   566		c.common.flags = READ_ONCE(cmd->flags);
   567		if (c.common.flags)
   568			return -EINVAL;
   569	
   570		c.common.command_id = 0;
   571		c.common.nsid = cpu_to_le32(cmd->nsid);
   572		if (!nvme_validate_passthru_nsid(ctrl, ns, le32_to_cpu(c.common.nsid)))
   573			return -EINVAL;
   574	
   575		c.common.cdw2[0] = cpu_to_le32(READ_ONCE(cmd->cdw2));
   576		c.common.cdw2[1] = cpu_to_le32(READ_ONCE(cmd->cdw3));
   577		c.common.metadata = 0;
   578		c.common.dptr.prp1 = c.common.dptr.prp2 = 0;
   579		c.common.cdw10 = cpu_to_le32(READ_ONCE(cmd->cdw10));
   580		c.common.cdw11 = cpu_to_le32(READ_ONCE(cmd->cdw11));
   581		c.common.cdw12 = cpu_to_le32(READ_ONCE(cmd->cdw12));
   582		c.common.cdw13 = cpu_to_le32(READ_ONCE(cmd->cdw13));
   583		c.common.cdw14 = cpu_to_le32(READ_ONCE(cmd->cdw14));
   584		c.common.cdw15 = cpu_to_le32(READ_ONCE(cmd->cdw15));
   585	
   586		if (!nvme_cmd_allowed(ns, &c, 0, ioucmd->file->f_mode))
   587			return -EACCES;
   588	
   589		d.metadata = READ_ONCE(cmd->metadata);
   590		d.addr = READ_ONCE(cmd->addr);
   591		d.data_len = READ_ONCE(cmd->data_len);
   592		d.metadata_len = READ_ONCE(cmd->metadata_len);
   593		d.timeout_ms = READ_ONCE(cmd->timeout_ms);
   594	
   595		if (issue_flags & IO_URING_F_NONBLOCK) {
   596			rq_flags |= REQ_NOWAIT;
   597			blk_flags = BLK_MQ_REQ_NOWAIT;
   598		}
   599		if (issue_flags & IO_URING_F_IOPOLL)
   600			rq_flags |= REQ_POLLED;
   601	
   602	retry:
   603		req = nvme_alloc_user_request(q, &c, rq_flags, blk_flags);
   604		if (IS_ERR(req))
   605			return PTR_ERR(req);
   606		req->timeout = d.timeout_ms ? msecs_to_jiffies(d.timeout_ms) : 0;
   607	
   608		if (d.addr && d.data_len) {
   609			ret = nvme_map_user_request(req, d.addr,
   610				d.data_len, nvme_to_user_ptr(d.metadata),
   611				d.metadata_len, 0, &meta, ioucmd, vec);
   612			if (ret)
   613				return ret;
   614		}
   615	
   616		if (issue_flags & IO_URING_F_IOPOLL && rq_flags & REQ_POLLED) {
   617			if (unlikely(!req->bio)) {
   618				/* we can't poll this, so alloc regular req instead */
   619				blk_mq_free_request(req);
   620				rq_flags &= ~REQ_POLLED;
   621				goto retry;
   622			} else {
   623				WRITE_ONCE(ioucmd->cookie, req->bio);
   624				req->bio->bi_opf |= REQ_POLLED;
   625			}
   626		}
   627		/* to free bio on completion, as req->bio will be null at that time */
   628		pdu->bio = req->bio;
   629		pdu->meta_len = d.metadata_len;
   630		req->end_io_data = ioucmd;
   631		if (pdu->meta_len) {
   632			pdu->u.meta = meta;
   633			pdu->u.meta_buffer = nvme_to_user_ptr(d.metadata);
   634			req->end_io = nvme_uring_cmd_end_io_meta;
   635		} else {
   636			req->end_io = nvme_uring_cmd_end_io;
   637		}
   638		blk_execute_rq_nowait(req, false);
   639		return -EIOCBQUEUED;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
