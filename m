Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB38F77
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 11:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692011050; x=1723547050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PWqwUJMeEGhrzHUM+OvITaFGmoq44SIpb9K2IjcNQGQ=;
  b=kBSlPGe/T+pzNnPIAixqkRf9kaC5bN88s8OyshKgDh6MmXMMsztLAQ/S
   cvGDbD8tySOIlgG6nk6psmGhCpYCgcIxvyW1KYw+r3vaNGG2JOmbK4C0i
   BucgrE0UnAw+DiCAYBjTqa1tDiY2wxSH9egE6Baap0Eq0bASCQeFs7WEX
   Ls1Dw8z8YKh3R9czYqKjh0jeprG52ILbwwWJlvSuNPzYYWrCvWjsdeeSy
   LnC7pHJygN9YXALOLkciXt3f2Y60D3DAvLflA//EbPpHSOsI/j9WJioTh
   yiwAxwwu9cSlv7OxnVSbLQTypTTKHkfKoxdl/MpucikQKvuG9btDHQ34D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="370911959"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="370911959"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 04:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="857044411"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="857044411"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Aug 2023 04:04:05 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVVMj-000077-0G;
	Mon, 14 Aug 2023 11:04:05 +0000
Date: Mon, 14 Aug 2023 19:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.5 44/93] drivers/soc/aspeed/aspeed-xdma.c:456:39:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202308141824.O1YHl390-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.5
head:   e874a83263bd783e23411cf6ab12622ac36362f5
commit: 41affdd4fbf5a3b0d97377938955a0a3a596efed [44/93] soc: aspeed: xdma: Add user interface
config: openrisc-randconfig-r083-20230814 (https://download.01.org/0day-ci/archive/20230814/202308141824.O1YHl390-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308141824.O1YHl390-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308141824.O1YHl390-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/aspeed/aspeed-xdma.c:456:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct aspeed_xdma_cmd * @@
   drivers/soc/aspeed/aspeed-xdma.c:456:39: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/aspeed/aspeed-xdma.c:456:39: sparse:     got struct aspeed_xdma_cmd *

vim +456 drivers/soc/aspeed/aspeed-xdma.c

4e46835ee8a519 Eddie James 2020-05-05  425  
4e46835ee8a519 Eddie James 2020-05-05  426  static int aspeed_xdma_start(struct aspeed_xdma *ctx, unsigned int num_cmds,
4e46835ee8a519 Eddie James 2020-05-05  427  			     struct aspeed_xdma_cmd cmds[2], bool upstream,
4e46835ee8a519 Eddie James 2020-05-05  428  			     struct aspeed_xdma_client *client)
4e46835ee8a519 Eddie James 2020-05-05  429  {
4e46835ee8a519 Eddie James 2020-05-05  430  	unsigned int i;
4e46835ee8a519 Eddie James 2020-05-05  431  	int rc = -EBUSY;
4e46835ee8a519 Eddie James 2020-05-05  432  	unsigned long flags;
4e46835ee8a519 Eddie James 2020-05-05  433  
4e46835ee8a519 Eddie James 2020-05-05  434  	spin_lock_irqsave(&ctx->engine_lock, flags);
4e46835ee8a519 Eddie James 2020-05-05  435  	if (ctx->in_reset)
4e46835ee8a519 Eddie James 2020-05-05  436  		goto unlock;
4e46835ee8a519 Eddie James 2020-05-05  437  
4e46835ee8a519 Eddie James 2020-05-05  438  	spin_lock(&ctx->client_lock);
4e46835ee8a519 Eddie James 2020-05-05  439  	if (ctx->current_client) {
4e46835ee8a519 Eddie James 2020-05-05  440  		spin_unlock(&ctx->client_lock);
4e46835ee8a519 Eddie James 2020-05-05  441  		goto unlock;
4e46835ee8a519 Eddie James 2020-05-05  442  	}
4e46835ee8a519 Eddie James 2020-05-05  443  
4e46835ee8a519 Eddie James 2020-05-05  444  	client->error = false;
4e46835ee8a519 Eddie James 2020-05-05  445  	client->in_progress = true;
4e46835ee8a519 Eddie James 2020-05-05  446  	ctx->current_client = client;
4e46835ee8a519 Eddie James 2020-05-05  447  	spin_unlock(&ctx->client_lock);
4e46835ee8a519 Eddie James 2020-05-05  448  
4e46835ee8a519 Eddie James 2020-05-05  449  	ctx->upstream = upstream;
4e46835ee8a519 Eddie James 2020-05-05  450  	for (i = 0; i < num_cmds; ++i) {
4e46835ee8a519 Eddie James 2020-05-05  451  		/*
4e46835ee8a519 Eddie James 2020-05-05  452  		 * Use memcpy_toio here to get some barriers before starting
4e46835ee8a519 Eddie James 2020-05-05  453  		 * the operation. The command(s) need to be in physical memory
4e46835ee8a519 Eddie James 2020-05-05  454  		 * before the XDMA engine starts.
4e46835ee8a519 Eddie James 2020-05-05  455  		 */
4e46835ee8a519 Eddie James 2020-05-05 @456  		memcpy_toio(&ctx->cmdq[ctx->cmd_idx], &cmds[i],
4e46835ee8a519 Eddie James 2020-05-05  457  			    sizeof(struct aspeed_xdma_cmd));
4e46835ee8a519 Eddie James 2020-05-05  458  		ctx->cmd_idx = (ctx->cmd_idx + 1) % XDMA_NUM_CMDS;
4e46835ee8a519 Eddie James 2020-05-05  459  	}
4e46835ee8a519 Eddie James 2020-05-05  460  
4e46835ee8a519 Eddie James 2020-05-05  461  	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_writep,
4e46835ee8a519 Eddie James 2020-05-05  462  			   ctx->cmd_idx * ctx->chip->queue_entry_size);
4e46835ee8a519 Eddie James 2020-05-05  463  	rc = 0;
4e46835ee8a519 Eddie James 2020-05-05  464  
4e46835ee8a519 Eddie James 2020-05-05  465  unlock:
4e46835ee8a519 Eddie James 2020-05-05  466  	spin_unlock_irqrestore(&ctx->engine_lock, flags);
4e46835ee8a519 Eddie James 2020-05-05  467  	return rc;
4e46835ee8a519 Eddie James 2020-05-05  468  }
4e46835ee8a519 Eddie James 2020-05-05  469  

:::::: The code at line 456 was first introduced by commit
:::::: 4e46835ee8a519469debc638c4f78a1b412bf2f8 soc: aspeed: Add XDMA Engine Driver

:::::: TO: Eddie James <eajames@linux.ibm.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
