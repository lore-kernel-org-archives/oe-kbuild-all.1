Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66815B99A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713458212; cv=none; b=X72OnxXu0YAQT5utedukNWZiWhMDdy7HH33EPUA1B1qi0Ix0RXlIq3iDDio2BF10El/xZ19iFMJ2WE0rptZ9fi0nSlo5g7xNAy0LBJGyeKp9YGLNsMWNgPwXfpkBxMyukgMDHVaNLCg4rkqdHRkt8pmsKffXxsr2XWl22CZOtmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713458212; c=relaxed/simple;
	bh=5qU+VjeCCSZfvhhmVCRd7ADdUqeirjLcPjxFMYk6BLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfOtoRtPg2JvuqZq031Lk7Bxz261vRDvawfJIrYJQyg+QpjJ3Tgke7ioBMuPePst+0hk/DFIBkReAtzJgBLUPCLzv1M4+XXsv8D8552IBSpkVPqs4ENHTdAcW8cOBbOf4SJLiZwAps9DmCfhkqtCCil4H/RgtdQOpfHV/Jxuetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZphJVN6V; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZphJVN6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713458210; x=1744994210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qU+VjeCCSZfvhhmVCRd7ADdUqeirjLcPjxFMYk6BLU=;
  b=ZphJVN6V3JHlu2z5ybs+kC2GQBacIzPLZFDLk6pK6EHKmyDNxysWUMyA
   BQCO502p+qXQh9XYfftGOCDeFjZwfrOHh00OF9S0Q1FpkCqIAeQfo+jfY
   ii85tvlMDyhZCn6CFzi8Kha8tKd9CTRAT6bwb/xndaot1+bkK4YAe/Hjv
   iwMqNPmMR/L2WUgitcFPAoNnaITdQUmDGULLW8Smlx1oID54KHSvVsB37
   5NlmmvhDhX/rXEjtNG6UHxCHnCrMOSwrp2HtKGL3xiY45fMLmzl5y2zuz
   gSE97yiPg4YK58R7EO4IHlTbAjoWwhmCW0FbKWTFAGRkcbAWEL3e7XNgD
   g==;
X-CSE-ConnectionGUID: 6drsA1x8SCaEyjO4X5bxDw==
X-CSE-MsgGUID: gxzaeBNvQ8Gd/fK01Uooyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20441428"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="20441428"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 09:36:45 -0700
X-CSE-ConnectionGUID: niTMuOxJTQ+pQGAAQNvoQQ==
X-CSE-MsgGUID: SEM7GzxgTba90aIk284xuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="27612891"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Apr 2024 09:36:43 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxUka-0008y5-2Y;
	Thu, 18 Apr 2024 16:36:40 +0000
Date: Fri, 19 Apr 2024 00:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-dmaengine:next 26/27]
 drivers/dma/fsl-dpaa2-qdma/dpdmai.c:262: warning: Function parameter or
 struct member 'queue_idx' not described in 'dpdmai_set_rx_queue'
Message-ID: <202404190019.t4IhmbHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   98f2233a5c20ca567b2db1147278fd110681b9ed
commit: bd2f66bc0ba08a68c7edcd3992886d1773c18cf2 [26/27] dmaengine: fsl-dpaa2-qdma: Update DPDMAI interfaces to version 3
config: arm64-randconfig-002-20240418 (https://download.01.org/0day-ci/archive/20240419/202404190019.t4IhmbHh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190019.t4IhmbHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190019.t4IhmbHh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:262: warning: Function parameter or struct member 'queue_idx' not described in 'dpdmai_set_rx_queue'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:297: warning: Function parameter or struct member 'queue_idx' not described in 'dpdmai_get_rx_queue'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:339: warning: Function parameter or struct member 'queue_idx' not described in 'dpdmai_get_tx_queue'
>> drivers/dma/fsl-dpaa2-qdma/dpdmai.c:339: warning: Function parameter or struct member 'attr' not described in 'dpdmai_get_tx_queue'
   drivers/dma/fsl-dpaa2-qdma/dpdmai.c:339: warning: Excess function parameter 'fqid' description in 'dpdmai_get_tx_queue'


vim +262 drivers/dma/fsl-dpaa2-qdma/dpdmai.c

f2835adf8afb2c Peng Ma  2019-09-30  248  
f2835adf8afb2c Peng Ma  2019-09-30  249  /**
f2835adf8afb2c Peng Ma  2019-09-30  250   * dpdmai_set_rx_queue() - Set Rx queue configuration
f2835adf8afb2c Peng Ma  2019-09-30  251   * @mc_io:	Pointer to MC portal's I/O object
f2835adf8afb2c Peng Ma  2019-09-30  252   * @cmd_flags:	Command flags; one or more of 'MC_CMD_FLAG_'
f2835adf8afb2c Peng Ma  2019-09-30  253   * @token:	Token of DPDMAI object
f2835adf8afb2c Peng Ma  2019-09-30  254   * @priority:	Select the queue relative to number of
f2835adf8afb2c Peng Ma  2019-09-30  255   *		priorities configured at DPDMAI creation
f2835adf8afb2c Peng Ma  2019-09-30  256   * @cfg:	Rx queue configuration
f2835adf8afb2c Peng Ma  2019-09-30  257   *
f2835adf8afb2c Peng Ma  2019-09-30  258   * Return:	'0' on Success; Error code otherwise.
f2835adf8afb2c Peng Ma  2019-09-30  259   */
bd2f66bc0ba08a Frank Li 2024-04-09  260  int dpdmai_set_rx_queue(struct fsl_mc_io *mc_io, u32 cmd_flags, u16 token, u8 queue_idx,
f2835adf8afb2c Peng Ma  2019-09-30  261  			u8 priority, const struct dpdmai_rx_queue_cfg *cfg)
f2835adf8afb2c Peng Ma  2019-09-30 @262  {
f2835adf8afb2c Peng Ma  2019-09-30  263  	struct dpdmai_cmd_queue *cmd_params;
f2835adf8afb2c Peng Ma  2019-09-30  264  	struct fsl_mc_command cmd = { 0 };
f2835adf8afb2c Peng Ma  2019-09-30  265  
f2835adf8afb2c Peng Ma  2019-09-30  266  	/* prepare command */
f2835adf8afb2c Peng Ma  2019-09-30  267  	cmd.header = mc_encode_cmd_header(DPDMAI_CMDID_SET_RX_QUEUE,
f2835adf8afb2c Peng Ma  2019-09-30  268  					  cmd_flags, token);
f2835adf8afb2c Peng Ma  2019-09-30  269  
f2835adf8afb2c Peng Ma  2019-09-30  270  	cmd_params = (struct dpdmai_cmd_queue *)cmd.params;
f2835adf8afb2c Peng Ma  2019-09-30  271  	cmd_params->dest_id = cpu_to_le32(cfg->dest_cfg.dest_id);
bd2f66bc0ba08a Frank Li 2024-04-09  272  	cmd_params->dest_priority = cfg->dest_cfg.priority;
bd2f66bc0ba08a Frank Li 2024-04-09  273  	cmd_params->pri = priority;
f2835adf8afb2c Peng Ma  2019-09-30  274  	cmd_params->dest_type = cfg->dest_cfg.dest_type;
f2835adf8afb2c Peng Ma  2019-09-30  275  	cmd_params->user_ctx = cpu_to_le64(cfg->user_ctx);
f2835adf8afb2c Peng Ma  2019-09-30  276  	cmd_params->options = cpu_to_le32(cfg->options);
bd2f66bc0ba08a Frank Li 2024-04-09  277  	cmd_params->queue_idx = queue_idx;
f2835adf8afb2c Peng Ma  2019-09-30  278  
f2835adf8afb2c Peng Ma  2019-09-30  279  	/* send command to mc*/
f2835adf8afb2c Peng Ma  2019-09-30  280  	return mc_send_command(mc_io, &cmd);
f2835adf8afb2c Peng Ma  2019-09-30  281  }
53596dfa59807d Peng Ma  2019-10-23  282  EXPORT_SYMBOL_GPL(dpdmai_set_rx_queue);
f2835adf8afb2c Peng Ma  2019-09-30  283  
f2835adf8afb2c Peng Ma  2019-09-30  284  /**
f2835adf8afb2c Peng Ma  2019-09-30  285   * dpdmai_get_rx_queue() - Retrieve Rx queue attributes.
f2835adf8afb2c Peng Ma  2019-09-30  286   * @mc_io:	Pointer to MC portal's I/O object
f2835adf8afb2c Peng Ma  2019-09-30  287   * @cmd_flags:	Command flags; one or more of 'MC_CMD_FLAG_'
f2835adf8afb2c Peng Ma  2019-09-30  288   * @token:	Token of DPDMAI object
f2835adf8afb2c Peng Ma  2019-09-30  289   * @priority:	Select the queue relative to number of
f2835adf8afb2c Peng Ma  2019-09-30  290   *				priorities configured at DPDMAI creation
f2835adf8afb2c Peng Ma  2019-09-30  291   * @attr:	Returned Rx queue attributes
f2835adf8afb2c Peng Ma  2019-09-30  292   *
f2835adf8afb2c Peng Ma  2019-09-30  293   * Return:	'0' on Success; Error code otherwise.
f2835adf8afb2c Peng Ma  2019-09-30  294   */
bd2f66bc0ba08a Frank Li 2024-04-09  295  int dpdmai_get_rx_queue(struct fsl_mc_io *mc_io, u32 cmd_flags, u16 token, u8 queue_idx,
f2835adf8afb2c Peng Ma  2019-09-30  296  			u8 priority, struct dpdmai_rx_queue_attr *attr)
f2835adf8afb2c Peng Ma  2019-09-30 @297  {
f2835adf8afb2c Peng Ma  2019-09-30  298  	struct dpdmai_cmd_queue *cmd_params;
f2835adf8afb2c Peng Ma  2019-09-30  299  	struct fsl_mc_command cmd = { 0 };
f2835adf8afb2c Peng Ma  2019-09-30  300  	int err;
f2835adf8afb2c Peng Ma  2019-09-30  301  
f2835adf8afb2c Peng Ma  2019-09-30  302  	/* prepare command */
f2835adf8afb2c Peng Ma  2019-09-30  303  	cmd.header = mc_encode_cmd_header(DPDMAI_CMDID_GET_RX_QUEUE,
f2835adf8afb2c Peng Ma  2019-09-30  304  					  cmd_flags, token);
f2835adf8afb2c Peng Ma  2019-09-30  305  
f2835adf8afb2c Peng Ma  2019-09-30  306  	cmd_params = (struct dpdmai_cmd_queue *)cmd.params;
f2835adf8afb2c Peng Ma  2019-09-30  307  	cmd_params->queue = priority;
bd2f66bc0ba08a Frank Li 2024-04-09  308  	cmd_params->queue_idx = queue_idx;
f2835adf8afb2c Peng Ma  2019-09-30  309  
f2835adf8afb2c Peng Ma  2019-09-30  310  	/* send command to mc*/
f2835adf8afb2c Peng Ma  2019-09-30  311  	err = mc_send_command(mc_io, &cmd);
f2835adf8afb2c Peng Ma  2019-09-30  312  	if (err)
f2835adf8afb2c Peng Ma  2019-09-30  313  		return err;
f2835adf8afb2c Peng Ma  2019-09-30  314  
f2835adf8afb2c Peng Ma  2019-09-30  315  	/* retrieve response parameters */
f2835adf8afb2c Peng Ma  2019-09-30  316  	attr->dest_cfg.dest_id = le32_to_cpu(cmd_params->dest_id);
bd2f66bc0ba08a Frank Li 2024-04-09  317  	attr->dest_cfg.priority = cmd_params->dest_priority;
bd2f66bc0ba08a Frank Li 2024-04-09  318  	attr->dest_cfg.dest_type = FIELD_GET(DEST_TYPE_MASK, cmd_params->dest_type);
f2835adf8afb2c Peng Ma  2019-09-30  319  	attr->user_ctx = le64_to_cpu(cmd_params->user_ctx);
f2835adf8afb2c Peng Ma  2019-09-30  320  	attr->fqid = le32_to_cpu(cmd_params->fqid);
f2835adf8afb2c Peng Ma  2019-09-30  321  
f2835adf8afb2c Peng Ma  2019-09-30  322  	return 0;
f2835adf8afb2c Peng Ma  2019-09-30  323  }
53596dfa59807d Peng Ma  2019-10-23  324  EXPORT_SYMBOL_GPL(dpdmai_get_rx_queue);
f2835adf8afb2c Peng Ma  2019-09-30  325  
f2835adf8afb2c Peng Ma  2019-09-30  326  /**
f2835adf8afb2c Peng Ma  2019-09-30  327   * dpdmai_get_tx_queue() - Retrieve Tx queue attributes.
f2835adf8afb2c Peng Ma  2019-09-30  328   * @mc_io:	Pointer to MC portal's I/O object
f2835adf8afb2c Peng Ma  2019-09-30  329   * @cmd_flags:	Command flags; one or more of 'MC_CMD_FLAG_'
f2835adf8afb2c Peng Ma  2019-09-30  330   * @token:	Token of DPDMAI object
f2835adf8afb2c Peng Ma  2019-09-30  331   * @priority:	Select the queue relative to number of
f2835adf8afb2c Peng Ma  2019-09-30  332   *			priorities configured at DPDMAI creation
f2835adf8afb2c Peng Ma  2019-09-30  333   * @fqid:	Returned Tx queue
f2835adf8afb2c Peng Ma  2019-09-30  334   *
f2835adf8afb2c Peng Ma  2019-09-30  335   * Return:	'0' on Success; Error code otherwise.
f2835adf8afb2c Peng Ma  2019-09-30  336   */
f2835adf8afb2c Peng Ma  2019-09-30  337  int dpdmai_get_tx_queue(struct fsl_mc_io *mc_io, u32 cmd_flags,
bd2f66bc0ba08a Frank Li 2024-04-09  338  			u16 token, u8 queue_idx, u8 priority, struct dpdmai_tx_queue_attr *attr)
f2835adf8afb2c Peng Ma  2019-09-30 @339  {
f2835adf8afb2c Peng Ma  2019-09-30  340  	struct dpdmai_rsp_get_tx_queue *rsp_params;
f2835adf8afb2c Peng Ma  2019-09-30  341  	struct dpdmai_cmd_queue *cmd_params;
f2835adf8afb2c Peng Ma  2019-09-30  342  	struct fsl_mc_command cmd = { 0 };
f2835adf8afb2c Peng Ma  2019-09-30  343  	int err;
f2835adf8afb2c Peng Ma  2019-09-30  344  
f2835adf8afb2c Peng Ma  2019-09-30  345  	/* prepare command */
f2835adf8afb2c Peng Ma  2019-09-30  346  	cmd.header = mc_encode_cmd_header(DPDMAI_CMDID_GET_TX_QUEUE,
f2835adf8afb2c Peng Ma  2019-09-30  347  					  cmd_flags, token);
f2835adf8afb2c Peng Ma  2019-09-30  348  
f2835adf8afb2c Peng Ma  2019-09-30  349  	cmd_params = (struct dpdmai_cmd_queue *)cmd.params;
f2835adf8afb2c Peng Ma  2019-09-30  350  	cmd_params->queue = priority;
bd2f66bc0ba08a Frank Li 2024-04-09  351  	cmd_params->queue_idx = queue_idx;
f2835adf8afb2c Peng Ma  2019-09-30  352  
f2835adf8afb2c Peng Ma  2019-09-30  353  	/* send command to mc*/
f2835adf8afb2c Peng Ma  2019-09-30  354  	err = mc_send_command(mc_io, &cmd);
f2835adf8afb2c Peng Ma  2019-09-30  355  	if (err)
f2835adf8afb2c Peng Ma  2019-09-30  356  		return err;
f2835adf8afb2c Peng Ma  2019-09-30  357  
f2835adf8afb2c Peng Ma  2019-09-30  358  	/* retrieve response parameters */
f2835adf8afb2c Peng Ma  2019-09-30  359  
f2835adf8afb2c Peng Ma  2019-09-30  360  	rsp_params = (struct dpdmai_rsp_get_tx_queue *)cmd.params;
bd2f66bc0ba08a Frank Li 2024-04-09  361  	attr->fqid = le32_to_cpu(rsp_params->fqid);
f2835adf8afb2c Peng Ma  2019-09-30  362  
f2835adf8afb2c Peng Ma  2019-09-30  363  	return 0;
f2835adf8afb2c Peng Ma  2019-09-30  364  }
53596dfa59807d Peng Ma  2019-10-23  365  EXPORT_SYMBOL_GPL(dpdmai_get_tx_queue);
53596dfa59807d Peng Ma  2019-10-23  366  

:::::: The code at line 262 was first introduced by commit
:::::: f2835adf8afb2cea248dd10d6eb0444c34b3b51b dmaengine: fsl-dpaa2-qdma: Add the DPDMAI(Data Path DMA Interface) support

:::::: TO: Peng Ma <peng.ma@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
