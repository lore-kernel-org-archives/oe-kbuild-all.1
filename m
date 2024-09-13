Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92541D9358
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726234921; cv=none; b=mJ4GJC0lzGzPiUBr/xILQ0CYOz0tbt7+FoPbnaBQjVGmgCxGfR5R/1SQUbEbYxJZg2yJeee4O9yLsOFWCFSUtLKXO4iFHpcxIjmHjJYYPqtX5b17ncHItrWUuxlxrOUGZF++cbLFcAwB25pfb30AvRVA2L/r3gfdicl1AhMEidE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726234921; c=relaxed/simple;
	bh=x/xRrOJKwyJcMh55apLp1jQnQjZYlNXFf81ezQ85DHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFyv/ySl7zCJSfAmHxqCfE7RwlERM7e1PFEjssw+eaypzKSE1LAXmXELgl3LSYBhLO5uz6PyTC7NJf18fOij1YofW6mfdiU2MImyoj6MSifpPtMmJODwSM7cbhc79M4UBJgohn/PEsQm+WV7wz9zV/45rrXCABDoJm8emKn2BQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaK9f5yE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaK9f5yE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726234919; x=1757770919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/xRrOJKwyJcMh55apLp1jQnQjZYlNXFf81ezQ85DHY=;
  b=WaK9f5yEmNwEM2DqIev8vu4cEnovEJq1iq5sNDJhseC1WGRTQj8m+qWs
   /5gKTcOfPAg/1KYEbfL3/lZWP22aaVvYnof19/Lbd45S5dmyUymNwq74x
   Pl3m7PyuyvD1iXP8bQy592mEsmNSqFFzi+s5KAFWCm6Az3JfGRJtszAGK
   3uRQQLWF9p2B2omyCAtQ3nc648jX6dKFnxag8kuu+Rf6rblYfgQ3/HizJ
   id7I5gfuZiv1zl+ntaL5CJ+74FP5cCQhCh4PtnWuhfUKE4H/Nz5bFar6e
   N5kuoiS5W68df2gYeJPsqjNP2ktCmxMgeepBHleLuj2HmVYpt92jVfFEa
   A==;
X-CSE-ConnectionGUID: XelXvjrrRBCM38DsWLkQog==
X-CSE-MsgGUID: lA0ubLiGRhK4ZTOJYNnKTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25004139"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25004139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 06:41:58 -0700
X-CSE-ConnectionGUID: mLCnQ+49QdSITOgA/nir+A==
X-CSE-MsgGUID: jj25dLzSR9iU/V8Gl2k63A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68826247"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2024 06:41:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp6Yc-0006Xw-2z;
	Fri, 13 Sep 2024 13:41:54 +0000
Date: Fri, 13 Sep 2024 21:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13472/13930]
 drivers/crypto/ccp/hygon/ccp-dev-v5.c:294:25: sparse: sparse: cast from
 restricted __le32
Message-ID: <202409132105.XzvWqk04-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   13706c950ff941dc015e16f76812077f9861e378
commit: 641a2595f7f5a1b8c5a8ef8ae44b7318c7a6108e [13472/13930] crypto: ccp: support sm2 on Hygon generation 4th CPU
config: x86_64-randconfig-123-20240913 (https://download.01.org/0day-ci/archive/20240913/202409132105.XzvWqk04-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409132105.XzvWqk04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409132105.XzvWqk04-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/ccp-dev-v5.c:294:25: sparse: sparse: cast from restricted __le32
>> drivers/crypto/ccp/hygon/ccp-dev-v5.c:294:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/crypto/ccp/hygon/ccp-dev-v5.c:294:23: sparse:     expected unsigned int [usertype]
   drivers/crypto/ccp/hygon/ccp-dev-v5.c:294:23: sparse:     got restricted __le32 [usertype]
>> drivers/crypto/ccp/hygon/ccp-dev-v5.c:490:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sm3_len_lo @@     got unsigned int [usertype] @@
   drivers/crypto/ccp/hygon/ccp-dev-v5.c:490:40: sparse:     expected restricted __le32 [usertype] sm3_len_lo
   drivers/crypto/ccp/hygon/ccp-dev-v5.c:490:40: sparse:     got unsigned int [usertype]
>> drivers/crypto/ccp/hygon/ccp-dev-v5.c:491:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] sm3_len_hi @@     got unsigned int [usertype] @@
   drivers/crypto/ccp/hygon/ccp-dev-v5.c:491:40: sparse:     expected restricted __le32 [usertype] sm3_len_hi
   drivers/crypto/ccp/hygon/ccp-dev-v5.c:491:40: sparse:     got unsigned int [usertype]

vim +294 drivers/crypto/ccp/hygon/ccp-dev-v5.c

   274	
   275	static int ccp5_do_multi_cmds(struct ccp5_desc *desc,
   276				struct ccp_cmd_queue *cmd_q)
   277	{
   278		u32 *mP;
   279		__le32 *dP;
   280		int     i;
   281	
   282		cmd_q->total_ops++;
   283	
   284		if (CCP5_CMD_SOC(desc)) {
   285			CCP5_CMD_IOC(desc) = 1;
   286			CCP5_CMD_SOC(desc) = 0;
   287		}
   288	
   289		mutex_lock(&cmd_q->q_mutex);
   290	
   291		mP = (u32 *) &cmd_q->qbase[cmd_q->qidx];
   292		dP = (__le32 *) desc;
   293		for (i = 0; i < 8; i++)
 > 294			mP[i] = cpu_to_le32(dP[i]); /* handle endianness */
   295	
   296		cmd_q->qidx = (cmd_q->qidx + 1) % CCP5_COMMANDS_PER_QUEUE;
   297	
   298		mutex_unlock(&cmd_q->q_mutex);
   299	
   300		return 0;
   301	}
   302	
   303	static int ccp5_do_run_cmd(struct ccp_op *op)
   304	{
   305		struct ccp_cmd_queue *cmd_q = op->cmd_q;
   306		u32 tail;
   307		int ret = 0;
   308	
   309		mutex_lock(&cmd_q->q_mutex);
   310	
   311		/* The data used by this command must be flushed to memory */
   312		wmb();
   313	
   314		/* Write the new tail address back to the queue register */
   315		tail = low_address(cmd_q->qdma_tail + cmd_q->qidx * Q_DESC_SIZE);
   316		iowrite32(tail, cmd_q->reg_tail_lo);
   317	
   318		/* Turn the queue back on using our cached control register */
   319		iowrite32(cmd_q->qcontrol | CMD5_Q_RUN, cmd_q->reg_control);
   320		mutex_unlock(&cmd_q->q_mutex);
   321	
   322		if (op->ioc) {
   323			/* Wait for the job to complete */
   324			ret = wait_event_interruptible(cmd_q->int_queue,
   325						       cmd_q->int_rcvd);
   326			if (ret || cmd_q->cmd_error) {
   327				/* Log the error and flush the queue by
   328				 * moving the head pointer
   329				 */
   330				if (cmd_q->cmd_error)
   331					ccp_log_error(cmd_q->ccp, cmd_q->cmd_error);
   332				iowrite32(tail, cmd_q->reg_head_lo);
   333				if (!ret)
   334					ret = -EIO;
   335			}
   336			cmd_q->int_rcvd = 0;
   337		}
   338	
   339		return ret;
   340	}
   341	
   342	static int ccp5_do_cmd(struct ccp5_desc *desc,
   343			       struct ccp_cmd_queue *cmd_q)
   344	{
   345		__le32 *mP;
   346		u32 *dP;
   347		u32 tail;
   348		int	i;
   349		int ret = 0;
   350	
   351		cmd_q->total_ops++;
   352	
   353		if (CCP5_CMD_SOC(desc)) {
   354			CCP5_CMD_IOC(desc) = 1;
   355			CCP5_CMD_SOC(desc) = 0;
   356		}
   357		mutex_lock(&cmd_q->q_mutex);
   358	
   359		mP = (__le32 *)&cmd_q->qbase[cmd_q->qidx];
   360		dP = (u32 *)desc;
   361		for (i = 0; i < 8; i++)
   362			mP[i] = cpu_to_le32(dP[i]); /* handle endianness */
   363	
   364		cmd_q->qidx = (cmd_q->qidx + 1) % CCP5_COMMANDS_PER_QUEUE;
   365	
   366		/* The data used by this command must be flushed to memory */
   367		wmb();
   368	
   369		/* Write the new tail address back to the queue register */
   370		tail = low_address(cmd_q->qdma_tail + cmd_q->qidx * Q_DESC_SIZE);
   371		iowrite32(tail, cmd_q->reg_tail_lo);
   372	
   373		/* Turn the queue back on using our cached control register */
   374		iowrite32(cmd_q->qcontrol | CMD5_Q_RUN, cmd_q->reg_control);
   375		mutex_unlock(&cmd_q->q_mutex);
   376	
   377		if (CCP5_CMD_IOC(desc)) {
   378			/* Wait for the job to complete */
   379			ret = wait_event_interruptible(cmd_q->int_queue,
   380						       cmd_q->int_rcvd);
   381			if (ret || cmd_q->cmd_error) {
   382				/* Log the error and flush the queue by
   383				 * moving the head pointer
   384				 */
   385				if (cmd_q->cmd_error)
   386					ccp_log_error(cmd_q->ccp,
   387						      cmd_q->cmd_error);
   388				iowrite32(tail, cmd_q->reg_head_lo);
   389				if (!ret)
   390					ret = -EIO;
   391			}
   392			cmd_q->int_rcvd = 0;
   393		}
   394	
   395		return ret;
   396	}
   397	
   398	static int ccp5_perform_sm2(struct ccp_op *op)
   399	{
   400		struct ccp5_desc desc;
   401		union ccp_function function;
   402		struct ccp_dma_info *saddr = &op->src.u.dma;
   403		struct ccp_dma_info *daddr = &op->dst.u.dma;
   404		dma_addr_t kaddr;
   405		unsigned int slen = saddr->length;
   406		int ret = 0;
   407	
   408		op->cmd_q->total_sm2_ops++;
   409	
   410		memset(&desc, 0, Q_DESC_SIZE);
   411	
   412		CCP5_CMD_ENGINE(&desc) = CCP_ENGINE_SM2;
   413	
   414		CCP5_CMD_SOC(&desc) = 0;
   415		CCP5_CMD_IOC(&desc) = 1;
   416		CCP5_CMD_INIT(&desc) = 1;
   417		CCP5_CMD_EOM(&desc) = 1;
   418		CCP5_CMD_PROT(&desc) = 0;
   419	
   420		function.raw = 0;
   421	
   422		/*
   423		 * ccp support both sm2 and ecc, the rand,mode filed are different
   424		 * with previous, and run on ecc or sm2 also should be indicated
   425		 */
   426		if (op->cmd_q->ccp->support_sm2_ecc) {
   427			ret = ccp5_get_keyinfo(op, &kaddr, &slen);
   428			if (ret)
   429				return ret;
   430	
   431			CCP_SM2_ECC_RAND(&function) = op->u.sm2.rand;
   432			CCP_SM2_ECC_MODE(&function) = op->u.sm2.mode;
   433			CCP_SM2_ECC_ECC_MODE(&function) = 0; /* 0: SM2 1: ECC */
   434		} else {
   435			CCP_SM2_RAND(&function) = op->u.sm2.rand;
   436			CCP_SM2_MODE(&function) = op->u.sm2.mode;
   437		}
   438	
   439		CCP5_CMD_FUNCTION(&desc) = function.raw;
   440	
   441		/* Length of source data must match with mode */
   442		CCP5_CMD_LEN(&desc) = slen;
   443		CCP5_CMD_SRC_LO(&desc) = ccp_addr_lo(saddr);
   444		CCP5_CMD_SRC_HI(&desc) = ccp_addr_hi(saddr);
   445		CCP5_CMD_SRC_MEM(&desc) = CCP_MEMTYPE_SYSTEM;
   446	
   447		CCP5_CMD_DST_LO(&desc) = ccp_addr_lo(daddr);
   448		CCP5_CMD_DST_HI(&desc) = ccp_addr_hi(daddr);
   449		CCP5_CMD_DST_MEM(&desc) = CCP_MEMTYPE_SYSTEM;
   450	
   451		if (op->cmd_q->ccp->support_sm2_ecc &&
   452		    op->u.sm2.mode != CCP_SM2_MODE_KG) {
   453			CCP5_CMD_KEY_LO(&desc) = low_address(kaddr);
   454			CCP5_CMD_KEY_HI(&desc) = high_address(kaddr);
   455			CCP5_CMD_KEY_MEM(&desc) = CCP_MEMTYPE_SYSTEM;
   456		}
   457	
   458		return ccp5_do_cmd(&desc, op->cmd_q);
   459	}
   460	
   461	static int ccp5_perform_sm3(struct ccp_op *op)
   462	{
   463		struct ccp5_desc desc;
   464		union ccp_function function;
   465	
   466		op->cmd_q->total_sm3_ops++;
   467	
   468		memset(&desc, 0, Q_DESC_SIZE);
   469	
   470		CCP5_CMD_ENGINE(&desc) = CCP_ENGINE_SM3;
   471	
   472		CCP5_CMD_SOC(&desc) = op->soc;
   473		CCP5_CMD_IOC(&desc) = op->ioc;
   474		CCP5_CMD_INIT(&desc) = op->init;
   475		CCP5_CMD_EOM(&desc) = op->eom;
   476		CCP5_CMD_PROT(&desc) = 0;
   477	
   478		function.raw = 0;
   479		CCP_SM3_TYPE(&function) = op->u.sm3.type;
   480		CCP5_CMD_FUNCTION(&desc) = function.raw;
   481	
   482		CCP5_CMD_LEN(&desc) = op->src.u.dma.length;
   483	
   484		CCP5_CMD_SRC_LO(&desc) = ccp_addr_lo(&op->src.u.dma);
   485		CCP5_CMD_SRC_HI(&desc) = ccp_addr_hi(&op->src.u.dma);
   486		CCP5_CMD_SRC_MEM(&desc) = CCP_MEMTYPE_SYSTEM;
   487		CCP5_CMD_LSB_ID(&desc) = op->sb_ctx;
   488	
   489		if (op->eom) {
 > 490			CCP5_CMD_SM3_LO(&desc) = lower_32_bits(op->u.sm3.msg_bits);
 > 491			CCP5_CMD_SM3_HI(&desc) = upper_32_bits(op->u.sm3.msg_bits);
   492		}
   493	
   494		return ccp5_do_multi_cmds(&desc, op->cmd_q);
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
