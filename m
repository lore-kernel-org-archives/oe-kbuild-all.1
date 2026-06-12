Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F05723EAA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781240619; cv=none; b=iCfmrbmmeLrClkPUyy5VlWni7mGb80UuvAx9IT9ZLB/K0amqKYcwMY+qucRZC7ZVHyRAWdshCY2NS1Yw91CG2zudy+e3bQQEIzC7IxQycLFGLpTVWD6SlDN6JsHdpvqsP6tem4+7OyKcMbVJYrQ5HQ1ELgi60+C0MYk3wIEeMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781240619; c=relaxed/simple;
	bh=XIXF5R/3M2SE2WVpf+MmWOXjnwVNxhoLoPsXJwZdLBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JWoc79pZIe/U+75QKY9xcPpkVb8ESIVbfOPdL+5fjW6YuO7Cdii7CA09PxrpwYdfryypAQKcF/vaeBsYcGrojuYvSLdWkQ5sUtMpe1NdYfQkcOuxEXzdeO29N8BePkokHrXyOwmxlJ8MTtzWMTHxhMDdti1qvf2NwwBjnoUfEbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bO4DEAsi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bO4DEAsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781240617; x=1812776617;
  h=date:from:to:cc:subject:message-id;
  bh=XIXF5R/3M2SE2WVpf+MmWOXjnwVNxhoLoPsXJwZdLBg=;
  b=bO4DEAsiKuYIO/Y1QT43iPRTcsY9m91ISEqJ2qGFwg8ZSSKqs0laENbA
   j1bI2tD0wzCZXPRge8qP61GNNhmFlRF5war9/WASzMTrHeBxFvTw1qlO2
   dkHMNWixbuCP0qWofWhGzF+vM4zbYgKh16g+gwZGceElx52WMufEfaEg7
   Gi7oBuWAN+1VRIbNR2e/HmxdHl9szTE2JSjykSoyUYw0fBdF/7+kJT06O
   B0go+vuSAtfIHPkFC52HnUZOHwaHZlsxujY+silVlW4KiDYVf24E9ovSA
   lezC/B03QHUQYcsCW6UZk7sOq0qBgpeiq82Ox0jEQ0TBKUR1oJd4itN8+
   g==;
X-CSE-ConnectionGUID: LjC551aGTuy/FDt+ywlVew==
X-CSE-MsgGUID: cUnXksl0RhKV9SR7/lku1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92746191"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92746191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 22:03:34 -0700
X-CSE-ConnectionGUID: t5KrBjSuSPCQ+EqrjlMPXA==
X-CSE-MsgGUID: xLieRpcQR9S9GvI5Rf81zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242589651"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2026 22:03:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXu3E-00000000OLN-3B7F;
	Fri, 12 Jun 2026 05:03:28 +0000
Date: Fri, 12 Jun 2026 13:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/xgene-hwmon.c:538:13: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202606121356.bXy2vONA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 80fcd1e7f5c7009fa1c64737df100cc304c19c1f hwmon: (xgene-hwmon) Simplify PCC shared memory region handling
date:   1 year, 2 months ago
config: riscv-randconfig-r132-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121356.bXy2vONA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121356.bXy2vONA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80fcd1e7f5c7 ("hwmon: (xgene-hwmon) Simplify PCC shared memory region handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121356.bXy2vONA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   drivers/hwmon/xgene-hwmon.c:116:15: sparse: sparse: cast to restricted __le16
   drivers/hwmon/xgene-hwmon.c:119:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/hwmon/xgene-hwmon.c:119:9: sparse:     expected unsigned short volatile
   drivers/hwmon/xgene-hwmon.c:119:9: sparse:     got restricted __le16 [usertype]
   drivers/hwmon/xgene-hwmon.c:128:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hwmon/xgene-hwmon.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hwmon/xgene-hwmon.c:137:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/hwmon/xgene-hwmon.c:137:9: sparse:     expected unsigned int volatile
   drivers/hwmon/xgene-hwmon.c:137:9: sparse:     got restricted __le32 [usertype]
   drivers/hwmon/xgene-hwmon.c:141:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hwmon/xgene-hwmon.c:141:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/hwmon/xgene-hwmon.c:141:9: sparse:     expected unsigned short volatile
   drivers/hwmon/xgene-hwmon.c:141:9: sparse:     got restricted __le16 [usertype]
   drivers/hwmon/xgene-hwmon.c:145:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hwmon/xgene-hwmon.c:145:15: sparse: sparse: cast to restricted __le16
   drivers/hwmon/xgene-hwmon.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/hwmon/xgene-hwmon.c:147:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile @@     got restricted __le16 [usertype] @@
   drivers/hwmon/xgene-hwmon.c:147:9: sparse:     expected unsigned short volatile
   drivers/hwmon/xgene-hwmon.c:147:9: sparse:     got restricted __le16 [usertype]
   drivers/hwmon/xgene-hwmon.c:151:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   drivers/hwmon/xgene-hwmon.c:151:17: sparse:     expected unsigned int volatile
   drivers/hwmon/xgene-hwmon.c:151:17: sparse:     got restricted __le32 [usertype]
>> drivers/hwmon/xgene-hwmon.c:538:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *msg @@     got struct acpi_pcct_shared_memory [noderef] __iomem * @@
   drivers/hwmon/xgene-hwmon.c:538:13: sparse:     expected void *msg
   drivers/hwmon/xgene-hwmon.c:538:13: sparse:     got struct acpi_pcct_shared_memory [noderef] __iomem *
   drivers/hwmon/xgene-hwmon.c:540:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/hwmon/xgene-hwmon.c:540:38: sparse:     expected unsigned short [usertype] *addr
   drivers/hwmon/xgene-hwmon.c:540:38: sparse:     got unsigned short [noderef] __iomem *
   drivers/hwmon/xgene-hwmon.c:562:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/hwmon/xgene-hwmon.c:562:45: sparse:     expected unsigned short [usertype] *addr
   drivers/hwmon/xgene-hwmon.c:562:45: sparse:     got unsigned short [noderef] __iomem *

vim +538 drivers/hwmon/xgene-hwmon.c

ed42cfa881e1d8 hotran       2016-07-21  518  
ed42cfa881e1d8 hotran       2016-07-21  519  /*
ed42cfa881e1d8 hotran       2016-07-21  520   * This function is called when the PCC Mailbox received a message
ed42cfa881e1d8 hotran       2016-07-21  521   */
ed42cfa881e1d8 hotran       2016-07-21  522  static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
ed42cfa881e1d8 hotran       2016-07-21  523  {
ed42cfa881e1d8 hotran       2016-07-21  524  	struct xgene_hwmon_dev *ctx = to_xgene_hwmon_dev(cl);
80fcd1e7f5c700 Sudeep Holla 2025-04-11  525  	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
80fcd1e7f5c700 Sudeep Holla 2025-04-11  526  							ctx->pcc_chan->shmem;
ed42cfa881e1d8 hotran       2016-07-21  527  	struct slimpro_resp_msg amsg;
ed42cfa881e1d8 hotran       2016-07-21  528  
2ca492e22cb70a hotran       2016-09-08  529  	/*
2ca492e22cb70a hotran       2016-09-08  530  	 * While the driver registers with the mailbox framework, an interrupt
2ca492e22cb70a hotran       2016-09-08  531  	 * can be pending before the probe function completes its
2ca492e22cb70a hotran       2016-09-08  532  	 * initialization. If such condition occurs, just queue up the message
2ca492e22cb70a hotran       2016-09-08  533  	 * as the driver is not ready for servicing the callback.
2ca492e22cb70a hotran       2016-09-08  534  	 */
2ca492e22cb70a hotran       2016-09-08  535  	if (xgene_hwmon_rx_ready(ctx, &amsg) < 0)
2ca492e22cb70a hotran       2016-09-08  536  		return;
2ca492e22cb70a hotran       2016-09-08  537  
ed42cfa881e1d8 hotran       2016-07-21 @538  	msg = generic_comm_base + 1;
ed42cfa881e1d8 hotran       2016-07-21  539  	/* Check if platform sends interrupt */
ed42cfa881e1d8 hotran       2016-07-21  540  	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
2cf39b806be746 Sudeep Holla 2023-09-27  541  				    PCC_STATUS_SCI_DOORBELL))
ed42cfa881e1d8 hotran       2016-07-21  542  		return;
ed42cfa881e1d8 hotran       2016-07-21  543  
ed42cfa881e1d8 hotran       2016-07-21  544  	/*
ed42cfa881e1d8 hotran       2016-07-21  545  	 * Response message format:
ed42cfa881e1d8 hotran       2016-07-21  546  	 * msg[0] is the return code of the operation
ed42cfa881e1d8 hotran       2016-07-21  547  	 * msg[1] is the first parameter word
ed42cfa881e1d8 hotran       2016-07-21  548  	 * msg[2] is the second parameter word
ed42cfa881e1d8 hotran       2016-07-21  549  	 *
ed42cfa881e1d8 hotran       2016-07-21  550  	 * As message only supports dword size, just assign it.
ed42cfa881e1d8 hotran       2016-07-21  551  	 */
ed42cfa881e1d8 hotran       2016-07-21  552  
ed42cfa881e1d8 hotran       2016-07-21  553  	/* Check for sync query */
ed42cfa881e1d8 hotran       2016-07-21  554  	if (ctx->resp_pending &&
ed42cfa881e1d8 hotran       2016-07-21  555  	    ((MSG_TYPE(((u32 *)msg)[0]) == MSG_TYPE_ERR) ||
ed42cfa881e1d8 hotran       2016-07-21  556  	     (MSG_TYPE(((u32 *)msg)[0]) == MSG_TYPE_DBG &&
ed42cfa881e1d8 hotran       2016-07-21  557  	      MSG_SUBTYPE(((u32 *)msg)[0]) == DBG_SUBTYPE_SENSOR_READ) ||
ed42cfa881e1d8 hotran       2016-07-21  558  	     (MSG_TYPE(((u32 *)msg)[0]) == MSG_TYPE_PWRMGMT &&
ed42cfa881e1d8 hotran       2016-07-21  559  	      MSG_SUBTYPE(((u32 *)msg)[0]) == PWRMGMT_SUBTYPE_TPC &&
ed42cfa881e1d8 hotran       2016-07-21  560  	      TPC_CMD(((u32 *)msg)[0]) == TPC_ALARM))) {
ed42cfa881e1d8 hotran       2016-07-21  561  		/* Check if platform completes command */
ed42cfa881e1d8 hotran       2016-07-21  562  		if (xgene_word_tst_and_clr(&generic_comm_base->status,
2cf39b806be746 Sudeep Holla 2023-09-27  563  					   PCC_STATUS_CMD_COMPLETE)) {
ed42cfa881e1d8 hotran       2016-07-21  564  			ctx->sync_msg.msg = ((u32 *)msg)[0];
ed42cfa881e1d8 hotran       2016-07-21  565  			ctx->sync_msg.param1 = ((u32 *)msg)[1];
ed42cfa881e1d8 hotran       2016-07-21  566  			ctx->sync_msg.param2 = ((u32 *)msg)[2];
ed42cfa881e1d8 hotran       2016-07-21  567  
ed42cfa881e1d8 hotran       2016-07-21  568  			/* Operation waiting for response */
ed42cfa881e1d8 hotran       2016-07-21  569  			complete(&ctx->rd_complete);
ed42cfa881e1d8 hotran       2016-07-21  570  
ed42cfa881e1d8 hotran       2016-07-21  571  			return;
ed42cfa881e1d8 hotran       2016-07-21  572  		}
ed42cfa881e1d8 hotran       2016-07-21  573  	}
ed42cfa881e1d8 hotran       2016-07-21  574  
ed42cfa881e1d8 hotran       2016-07-21  575  	/*
ed42cfa881e1d8 hotran       2016-07-21  576  	 * Platform notifies interrupt to OSPM.
ed42cfa881e1d8 hotran       2016-07-21  577  	 * OPSM schedules a consumer command to get this information
ed42cfa881e1d8 hotran       2016-07-21  578  	 * in a workqueue. Platform must wait until OSPM has issued
ed42cfa881e1d8 hotran       2016-07-21  579  	 * a consumer command that serves this notification.
ed42cfa881e1d8 hotran       2016-07-21  580  	 */
ed42cfa881e1d8 hotran       2016-07-21  581  
ed42cfa881e1d8 hotran       2016-07-21  582  	/* Enqueue to the FIFO */
ed42cfa881e1d8 hotran       2016-07-21  583  	kfifo_in_spinlocked(&ctx->async_msg_fifo, &amsg,
ed42cfa881e1d8 hotran       2016-07-21  584  			    sizeof(struct slimpro_resp_msg), &ctx->kfifo_lock);
ed42cfa881e1d8 hotran       2016-07-21  585  	/* Schedule the bottom handler */
ed42cfa881e1d8 hotran       2016-07-21  586  	schedule_work(&ctx->workq);
ed42cfa881e1d8 hotran       2016-07-21  587  }
ed42cfa881e1d8 hotran       2016-07-21  588  

:::::: The code at line 538 was first introduced by commit
:::::: ed42cfa881e1d8d9603b7cb872199e3c8e0d1b19 hwmon: Add xgene hwmon driver

:::::: TO: hotran <hotran@apm.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
