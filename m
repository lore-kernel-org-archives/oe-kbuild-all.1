Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC462D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 03:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690774020; x=1722310020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bsk0r+qPizK1WmIQJ2hjbWPwZjDyt59aI1j4g4ScYaQ=;
  b=g35trRabpM0vCj4+JVgvc2/1nRXcs46eRQNZ/QNs/EIQ8Q9AcpYe6/DH
   o61RD8gFyEZfDmvUtkDhNhoWX2LOzzkbboWcKqgAZuQEXVDHZQyg5GNG7
   Hq8xtyn5a+kfElB7/uvJYvzl7LrUT4yAcgofohDwXELVjCJUYvOdrLW4D
   31q4yD+MT4CXKcd8KK7Sz5S4neRGwxgHAPYWVKxKVp/U726M1klhvCVsp
   5ZqyCY91kNT7cvD7QSEuiPPC2/dRFp92cK2QgEYjg7G2m52dtd3zFlWgz
   qkh4VQsHEaWUiyAKuL7OH7kfmvMcmOmy5mqFqzYZTjv4Yw9cvPcbUG9PL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="368922794"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="368922794"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 20:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="818173553"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="818173553"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2023 20:26:58 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQJYM-0004uQ-1Y;
	Mon, 31 Jul 2023 03:26:48 +0000
Date: Mon, 31 Jul 2023 11:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 114/141]
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:173:20: warning: variable
 'opcode' set but not used
Message-ID: <202307311121.DRq7chlS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   ade14a1785368ef634f78e4a46ce217f7937b066
commit: a8bafc8e2d78f6fd12d43c313d833bf2cedc959c [114/141] RDMA/bnxt_re: Simplify the function that sends the FW commands
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230731/202307311121.DRq7chlS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311121.DRq7chlS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311121.DRq7chlS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c: In function '__wait_for_resp':
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:108:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     108 |         int ret;
         |             ^~~
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c: In function '__send_message':
>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:173:20: warning: variable 'opcode' set but not used [-Wunused-but-set-variable]
     173 |         u32 bsize, opcode, free_slots, required_slots;
         |                    ^~~~~~


vim +/opcode +173 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c

   169	
   170	static int __send_message(struct bnxt_qplib_rcfw *rcfw,
   171				  struct bnxt_qplib_cmdqmsg *msg)
   172	{
 > 173		u32 bsize, opcode, free_slots, required_slots;
   174		struct bnxt_qplib_cmdq_ctx *cmdq;
   175		struct bnxt_qplib_crsqe *crsqe;
   176		struct bnxt_qplib_cmdqe *cmdqe;
   177		struct bnxt_qplib_hwq *hwq;
   178		u32 sw_prod, cmdq_prod;
   179		struct pci_dev *pdev;
   180		unsigned long flags;
   181		u16 cookie, cbit;
   182		u8 *preq;
   183	
   184		cmdq = &rcfw->cmdq;
   185		hwq = &cmdq->hwq;
   186		pdev = rcfw->pdev;
   187	
   188		opcode = __get_cmdq_base_opcode(msg->req, msg->req_sz);
   189	
   190		if (test_bit(FIRMWARE_TIMED_OUT, &cmdq->flags))
   191			return -ETIMEDOUT;
   192	
   193		/* Cmdq are in 16-byte units, each request can consume 1 or more
   194		 * cmdqe
   195		 */
   196		spin_lock_irqsave(&hwq->lock, flags);
   197		required_slots = bnxt_qplib_get_cmd_slots(msg->req);
   198		free_slots = HWQ_FREE_SLOTS(hwq);
   199		cookie = cmdq->seq_num & RCFW_MAX_COOKIE_VALUE;
   200		cbit = cookie % rcfw->cmdq_depth;
   201	
   202		if (required_slots >= free_slots ||
   203		    test_bit(cbit, cmdq->cmdq_bitmap)) {
   204			dev_info_ratelimited(&pdev->dev,
   205					     "CMDQ is full req/free %d/%d!",
   206					     required_slots, free_slots);
   207			spin_unlock_irqrestore(&hwq->lock, flags);
   208			return -EAGAIN;
   209		}
   210		if (msg->block)
   211			cookie |= RCFW_CMD_IS_BLOCKING;
   212		set_bit(cbit, cmdq->cmdq_bitmap);
   213		__set_cmdq_base_cookie(msg->req, msg->req_sz, cpu_to_le16(cookie));
   214		crsqe = &rcfw->crsqe_tbl[cbit];
   215		bsize = bnxt_qplib_set_cmd_slots(msg->req);
   216		crsqe->free_slots = free_slots;
   217		crsqe->resp = (struct creq_qp_event *)msg->resp;
   218		crsqe->resp->cookie = cpu_to_le16(cookie);
   219		crsqe->req_size = __get_cmdq_base_cmd_size(msg->req, msg->req_sz);
   220		if (__get_cmdq_base_resp_size(msg->req, msg->req_sz) && msg->sb) {
   221			struct bnxt_qplib_rcfw_sbuf *sbuf = msg->sb;
   222	
   223			__set_cmdq_base_resp_addr(msg->req, msg->req_sz,
   224						  cpu_to_le64(sbuf->dma_addr));
   225			__set_cmdq_base_resp_size(msg->req, msg->req_sz,
   226						  ALIGN(sbuf->size,
   227							BNXT_QPLIB_CMDQE_UNITS));
   228		}
   229	
   230		preq = (u8 *)msg->req;
   231		do {
   232			/* Locate the next cmdq slot */
   233			sw_prod = HWQ_CMP(hwq->prod, hwq);
   234			cmdqe = bnxt_qplib_get_qe(hwq, sw_prod, NULL);
   235			/* Copy a segment of the req cmd to the cmdq */
   236			memset(cmdqe, 0, sizeof(*cmdqe));
   237			memcpy(cmdqe, preq, min_t(u32, bsize, sizeof(*cmdqe)));
   238			preq += min_t(u32, bsize, sizeof(*cmdqe));
   239			bsize -= min_t(u32, bsize, sizeof(*cmdqe));
   240			hwq->prod++;
   241		} while (bsize > 0);
   242		cmdq->seq_num++;
   243	
   244		cmdq_prod = hwq->prod & 0xFFFF;
   245		if (test_bit(FIRMWARE_FIRST_FLAG, &cmdq->flags)) {
   246			/* The very first doorbell write
   247			 * is required to set this flag
   248			 * which prompts the FW to reset
   249			 * its internal pointers
   250			 */
   251			cmdq_prod |= BIT(FIRMWARE_FIRST_FLAG);
   252			clear_bit(FIRMWARE_FIRST_FLAG, &cmdq->flags);
   253		}
   254		/* ring CMDQ DB */
   255		wmb();
   256		writel(cmdq_prod, cmdq->cmdq_mbox.prod);
   257		writel(RCFW_CMDQ_TRIG_VAL, cmdq->cmdq_mbox.db);
   258		spin_unlock_irqrestore(&hwq->lock, flags);
   259		/* Return the CREQ response pointer */
   260		return 0;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
