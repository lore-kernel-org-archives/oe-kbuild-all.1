Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B1C2FC871
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247629; cv=none; b=D45/LR2ii+O2bGtdl29/0gpnM+ulXr6OdKCxNrighH+4epLU32ho2pJvxAkINdIr1S9ShxgT+jF1L2Ql2ys404yKC7YrM2uKLIktwfmBjxhQGsMF4f9KeGcd8SCReNG4XE5Uw574VsOXqLv1pInWM7P5bsVrBpO4jUa54ZmGh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247629; c=relaxed/simple;
	bh=zcdzclDZ3QA8+nOrYGWtrnOR+SJaBQaApoM1hOGzRXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=toTJrB0ngZzhUBavCgT1DgrCRPLQvGHjlOGv2TBtVB2+aHaW7fCIAYb3KSLXdm+LGriElEPVHZP3tpphSX44ewfVWB6Tch8qh136EyL4zPDX0A6hSgq7Jmw+pJ7Rv68VFaWrcDlLyYfENilRtMy8lLEVhTFTg/vuMavphoZ/7wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Crjy6qzQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Crjy6qzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766247628; x=1797783628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zcdzclDZ3QA8+nOrYGWtrnOR+SJaBQaApoM1hOGzRXM=;
  b=Crjy6qzQ6QX5OcpiAW1CekoTol6GdzvNLPyfma/XMQ5BnlR3WsjOT3Mh
   bYuS2GAsxkjoFksoY7mvkWodTMGieso3Xdp6wJ+OPA9+YjoQN3LucXZGL
   5N9nw3gvhpWwIxL7lj/UjpU7TX+EDBj3fAT1M+ypmBVIa/+4Pnjh/1C5q
   r0dME0uVvIaUTSoN8HrvUFP0hlCjtdFAayJrFp04sPyl6aD/78fcir62G
   r60dul39jZZtBz1l5cIQhvX5MV+r88cZLIWRVG1f7QkgIDB3FIWQ7t4en
   yAPOyx2d17SYncJHdTVkgQMT0A6TqglBmN5+9Xj6euEBUvEKu0yHoj+u6
   A==;
X-CSE-ConnectionGUID: EaCuJ+FpRy2sLoBlHXSQFA==
X-CSE-MsgGUID: 8KrEK3WdSXuagZfWUYi+GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78814624"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78814624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:20:26 -0800
X-CSE-ConnectionGUID: CS8uxOj5R16NrkPlS475UA==
X-CSE-MsgGUID: 4XCFLn7XSDGxCGPbzoWwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199167924"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 08:20:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzgs-000000004rV-1s5g;
	Sat, 20 Dec 2025 16:20:22 +0000
Date: Sun, 21 Dec 2025 00:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547]
 drivers/crypto/ccp/hygon/ccp-dev-v5.c:294:25: sparse: sparse: cast from
 restricted __le32
Message-ID: <202512210041.NZ084FEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 641a2595f7f5a1b8c5a8ef8ae44b7318c7a6108e [3547/3547] crypto: ccp: support sm2 on Hygon generation 4th CPU
config: x86_64-randconfig-122-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210041.NZ084FEx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210041.NZ084FEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210041.NZ084FEx-lkp@intel.com/

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
