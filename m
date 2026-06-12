Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D191FC7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 00:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781222646; cv=none; b=c/824KZg3DAbiQDdl2aUy9+L7qilRQ4RwfL0L5Jd6I8rfu9RcQmNs1VxC6J1UP6bLIlsdHzOMeeo2rrTY5LsjkWvaEpKx+1SfHqHCaQtZfast0PsLzWRc/JiAVgi/tcSyWiDMBezVNrov12f++qgeEAqGVno/GMXMi3OgtVjlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781222646; c=relaxed/simple;
	bh=KiphxvawWzAqroBFdJlhiZ4d3G32B1wUrDPyelw8p3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYkZlyLMPZqqjCQLXqR2rAE+Z5r2gW/1kiy0F32PgZ9U2BRQAEwYZ/p9Zyhct9RPjE7TGnvjbJsIuEbWZ9s4A8zySdwPWaIjnK5RImp306rDy/4zmKxlrKczyG4oWIN1EIdY5sN3WBFsADdBWNYvrSvrsvb1Ah1XwQM2iGSYPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJ8Pl1G8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ8Pl1G8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781222646; x=1812758646;
  h=date:from:to:cc:subject:message-id;
  bh=KiphxvawWzAqroBFdJlhiZ4d3G32B1wUrDPyelw8p3s=;
  b=KJ8Pl1G8YxvM4fhTYlhC3W2t7MqFPOX8fe0wWdPlLU9ylEVHHhBuZ+DF
   svoYjvrwEYOkm+4gSBDEIeTDfKxwwFm3HZW7dd8b+JAnA10s8/eIhefVV
   NDCZ3rI5p3cmNv7MGAYEZTYXlRJwcxcXblb8wah+xeTgTyPOEcMRSJK3w
   gfzb7feoWyRtPv9q9tD8uEnTxAES03UOSuqOeKmh6ghAIaewyPp8P3dfO
   w+RaKBQMYm3YJWYh/9NCctK0RwntMVY0BW8hZqzbBIRCOeUtFKCbH3MYu
   XU3wsDvYikkvnU/XABASHHlMqf729e81zwQtPLwpzbpBfgwdFMC48gJzF
   Q==;
X-CSE-ConnectionGUID: FVf9+JFORUqa9XtS8ifO2g==
X-CSE-MsgGUID: IR7M7fcAS7O0i9I4pbjPlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104719077"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="104719077"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 17:04:05 -0700
X-CSE-ConnectionGUID: ASbjJWx7QC2uwgAZ+DHemg==
X-CSE-MsgGUID: MpRbkX9nTGyK1yrWaKx+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250933440"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 17:04:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXpNP-00000000O2o-2i5h;
	Fri, 12 Jun 2026 00:03:59 +0000
Date: Fri, 12 Jun 2026 08:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andi Shyti <andi@smida.it>
Subject: drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202606120803.iI23w3ER-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 7b174126124560f15e392fe5767face99e61ddb1 i2c: xgene-slimpro: Simplify PCC shared memory region handling
date:   1 year, 1 month ago
config: arm64-randconfig-r112-20260612 (https://download.01.org/0day-ci/archive/20260612/202606120803.iI23w3ER-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120803.iI23w3ER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7b1741261245 ("i2c: xgene-slimpro: Simplify PCC shared memory region handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120803.iI23w3ER-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-xgene-slimpro.c:121:15: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:124:9: sparse:     got restricted __le16 [usertype]
>> drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse:     expected unsigned short [usertype] *addr
   drivers/i2c/busses/i2c-xgene-slimpro.c:153:38: sparse:     got unsigned short [noderef] __iomem *
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse:     expected unsigned short [usertype] *addr
   drivers/i2c/busses/i2c-xgene-slimpro.c:157:37: sparse:     got unsigned short [noderef] __iomem *
   drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *msg @@     got struct acpi_pcct_shared_memory [noderef] __iomem * @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse:     expected void *msg
   drivers/i2c/busses/i2c-xgene-slimpro.c:159:21: sparse:     got struct acpi_pcct_shared_memory [noderef] __iomem *
   drivers/i2c/busses/i2c-xgene-slimpro.c:173:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse:     expected unsigned int volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:177:9: sparse:     got restricted __le32 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:180:9: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:183:18: sparse: sparse: cast to restricted __le16
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse:     expected unsigned short volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:185:9: sparse:     got restricted __le16 [usertype]
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse:     expected unsigned int volatile
   drivers/i2c/busses/i2c-xgene-slimpro.c:189:17: sparse:     got restricted __le32 [usertype]

vim +153 drivers/i2c/busses/i2c-xgene-slimpro.c

f6505fbabc426b9 Feng Kan     2015-04-24  145  
df5da47fe722e36 Hoan Tran    2017-04-24  146  static void slimpro_i2c_pcc_rx_cb(struct mbox_client *cl, void *msg)
df5da47fe722e36 Hoan Tran    2017-04-24  147  {
df5da47fe722e36 Hoan Tran    2017-04-24  148  	struct slimpro_i2c_dev *ctx = to_slimpro_i2c_dev(cl);
7b174126124560f Sudeep Holla 2025-04-11  149  	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
7b174126124560f Sudeep Holla 2025-04-11  150  							ctx->pcc_chan->shmem;
df5da47fe722e36 Hoan Tran    2017-04-24  151  
df5da47fe722e36 Hoan Tran    2017-04-24  152  	/* Check if platform sends interrupt */
df5da47fe722e36 Hoan Tran    2017-04-24 @153  	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
89a4ad1f437c049 Sudeep Holla 2023-09-27  154  				    PCC_STATUS_SCI_DOORBELL))
df5da47fe722e36 Hoan Tran    2017-04-24  155  		return;
df5da47fe722e36 Hoan Tran    2017-04-24  156  
df5da47fe722e36 Hoan Tran    2017-04-24  157  	if (xgene_word_tst_and_clr(&generic_comm_base->status,
89a4ad1f437c049 Sudeep Holla 2023-09-27  158  				   PCC_STATUS_CMD_COMPLETE)) {
df5da47fe722e36 Hoan Tran    2017-04-24  159  		msg = generic_comm_base + 1;
df5da47fe722e36 Hoan Tran    2017-04-24  160  
df5da47fe722e36 Hoan Tran    2017-04-24  161  		/* Response message msg[1] contains the return value. */
df5da47fe722e36 Hoan Tran    2017-04-24  162  		if (ctx->resp_msg)
df5da47fe722e36 Hoan Tran    2017-04-24  163  			*ctx->resp_msg = ((u32 *)msg)[1];
df5da47fe722e36 Hoan Tran    2017-04-24  164  
df5da47fe722e36 Hoan Tran    2017-04-24  165  		complete(&ctx->rd_complete);
df5da47fe722e36 Hoan Tran    2017-04-24  166  	}
df5da47fe722e36 Hoan Tran    2017-04-24  167  }
df5da47fe722e36 Hoan Tran    2017-04-24  168  

:::::: The code at line 153 was first introduced by commit
:::::: df5da47fe722e36055b97134e6bb9df58c12495c i2c: xgene-slimpro: Add ACPI support by using PCC mailbox

:::::: TO: Hoan Tran <hotran@apm.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
