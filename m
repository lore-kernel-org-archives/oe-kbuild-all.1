Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737818;
	b=0w72esJTNNVEuaOQMOgEEpQHWcHVgKqAwK/Mv0spUeWRUveh+nBWkvSpxqLhMgEEEQa1
	 1HZotc3lFVazOdDa01qKR2i/p+u69HN4lbMOAEKBmtjXsFumSVBLlkfU/9gwy1SGQNNku
	 4jhTAJ9Ubq1mvotKMA/dz+vj7ZH3OZopohSNp2WZmGefELR8Z9GCdhuTaB+65HMetcO15
	 FTYPYi4hlQwtFP0HjpIi4FAs3mu/GwwH0KQKyljTymrFGUf5P6DCixhpbqw408FXOTyxi
	 u/TxnW2O2E5maIdBAxskEcNJl9NP9Nbz3jmKW+JMbCVxoZvq4n3iaIoYnOZ3dqqrMLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737818;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uLfGyjUN+tdddIdW2x+So3Hbvi1HPK0wSrgfxThymyM=;
	b=xMdEP/GfVZpfgms+UDWwxbeK8SgBcdlIjmxwGrNIhJoqWoh2JGsM+K3s8COUImbjJ7uo
	 EQW754V3hiXtoE0uLx0NopLAqS2EflodbO42roEvG0QZqaEb8YXSFKbTbODPTsQfOyiYW
	 yankdDOJAyTwPM3GhU+/NKgDCp8NxP8zPb6TsB6du/oYAId1A53oT/swM7X0rkDKdRPZa
	 vu5tzOyx7HN8ja+UPXwJnxhIvoufKJmW5ZzBXYDeltHst4equRpVVAjRCIYbvjlCgqM3a
	 KQBD3yaUcA/8Gnh7U8AStpSFRs3TEK65SN9AT0qVGY/aPu9Gf2geWvOp5/B7TXrkMhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="c2kb/Vcz";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF65606A335
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 10:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF65606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c2kb/Vcz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794737817; x=1826273817;
  h=date:from:to:cc:subject:message-id;
  bh=Z2r4js7MrLMtIUujMG/QLsWeS2pIcIQC0/TdUpK3ong=;
  b=c2kb/VczI5NNALsnbssGDVzEafDTRTMBrvUI4CmqmNr4ALweqbLCqZEN
   /DRvwfeOoI9iHxXRi+SIcrgM80dyZxbcYXdTg8mVTYWTMhmzjT+6Z7E1Z
   wdhsqJLy5H3Fy0JOczMQ6bth46Fg2xgdT6m4NU6UY68BvLFQG506LNrH6
   0r+Bdrp3IGkzAJ7HuPTil7OAiEWu69PjCdboS/mOzfietfjvHMQGyCiQ2
   53M+QsLs8O5fUnJuXsDBeF0lWYWzx+8ZOL3o6HCxxJXNby+3t7kg77Djv
   a+CM0JogOIBr433iXxvTA0UU/wfJnSmxT4mP6YaELH4pvx/gaEXhHYdIm
   w==;
X-CSE-ConnectionGUID: pImYpyIPRyWhffvVKkvazw==
X-CSE-MsgGUID: Y0jfoIe6SFSkaQN7vToivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3398467"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3398467"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:16:56 -0800
X-CSE-ConnectionGUID: qHi5URmXSCWX9SeNQE2haQ==
X-CSE-MsgGUID: 6AE5U0cWSSSPQRaQte6fUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9660889"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2026 02:16:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSXI3-0000000028k-3UBi;
	Sun, 15 Nov 2026 10:16:51 +0000
Date: Sun, 15 Nov 2026 11:16:28 +0100
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: drivers/dma/bestcomm/gen_bd.c:144:22: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202611151128.F2RcT2V4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 57946765c242005bdb16d17944c27662c8c5b013 dmaengine: bestcomm: Enable compile testing
date:   6 weeks ago
config: powerpc-randconfig-r2301-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151128.F2RcT2V4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151128.F2RcT2V4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 57946765c242 ("dmaengine: bestcomm: Enable compile testing")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151128.F2RcT2V4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/bestcomm/gen_bd.c:144:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *a @@     got struct bcom_bd *bd @@
   drivers/dma/bestcomm/gen_bd.c:144:22: sparse:     expected void volatile [noderef] __iomem *a
   drivers/dma/bestcomm/gen_bd.c:144:22: sparse:     got struct bcom_bd *bd
   drivers/dma/bestcomm/gen_bd.c:227:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *a @@     got struct bcom_bd *bd @@
   drivers/dma/bestcomm/gen_bd.c:227:22: sparse:     expected void volatile [noderef] __iomem *a
   drivers/dma/bestcomm/gen_bd.c:227:22: sparse:     got struct bcom_bd *bd

vim +144 drivers/dma/bestcomm/gen_bd.c

7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  111  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  112  int
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  113  bcom_gen_bd_rx_reset(struct bcom_task *tsk)
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  114  {
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  115  	struct bcom_gen_bd_priv *priv = tsk->priv;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  116  	struct bcom_gen_bd_rx_var *var;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  117  	struct bcom_gen_bd_rx_inc *inc;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  118  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  119  	/* Shutdown the task */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  120  	bcom_disable_task(tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  121  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  122  	/* Reset the microcode */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  123  	var = (struct bcom_gen_bd_rx_var *) bcom_task_var(tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  124  	inc = (struct bcom_gen_bd_rx_inc *) bcom_task_inc(tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  125  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  126  	if (bcom_load_image(tsk->tasknum, bcom_gen_bd_rx_task))
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  127  		return -1;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  128  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  129  	var->enable	= bcom_eng->regs_base +
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  130  				offsetof(struct mpc52xx_sdma, tcr[tsk->tasknum]);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  131  	var->fifo	= (u32) priv->fifo;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  132  	var->bd_base	= tsk->bd_pa;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  133  	var->bd_last	= tsk->bd_pa + ((tsk->num_bd-1) * tsk->bd_size);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  134  	var->bd_start	= tsk->bd_pa;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  135  	var->buffer_size = priv->maxbufsize;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  136  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  137  	inc->incr_bytes	= -(s16)sizeof(u32);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  138  	inc->incr_dst	= sizeof(u32);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  139  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  140  	/* Reset the BDs */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  141  	tsk->index = 0;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  142  	tsk->outdex = 0;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  143  
adec566b05288f2 drivers/dma/bestcomm/gen_bd.c         Anatolij Gustschin 2021-10-14 @144  	memset_io(tsk->bd, 0x00, tsk->num_bd * tsk->bd_size);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  145  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  146  	/* Configure some stuff */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  147  	bcom_set_task_pragma(tsk->tasknum, BCOM_GEN_RX_BD_PRAGMA);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  148  	bcom_set_task_auto_start(tsk->tasknum, tsk->tasknum);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  149  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  150  	out_8(&bcom_eng->regs->ipr[priv->initiator], priv->ipr);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  151  	bcom_set_initiator(tsk->tasknum, priv->initiator);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  152  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  153  	out_be32(&bcom_eng->regs->IntPend, 1<<tsk->tasknum);	/* Clear ints */
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  154  
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  155  	return 0;
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  156  }
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  157  EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_reset);
7acb939130ff054 arch/powerpc/sysdev/bestcomm/gen_bd.c Sylvain Munaut     2007-09-16  158  

:::::: The code at line 144 was first introduced by commit
:::::: adec566b05288f2787a1f88dbaf77ed8b0c644fa dmaengine: bestcomm: fix system boot lockups

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
