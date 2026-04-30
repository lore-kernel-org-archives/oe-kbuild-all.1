Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7439F44B679
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564183; cv=none; b=ldPtV53fp8S3k1av4nWNf1x2h0cWhi6NCn3AqAFTub5EFGQFzQQCl/mez8p9M3V0dMRGW0wHJui/KB5fPHFoQdaWpb89jWS1Ynv4xPVN4qOHAPKtNZ9Z6gWICp8Tz3NA9ZIYzwitPR5onVKboA/1zI3EHkUu1jnZGRwy+z6SKtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564183; c=relaxed/simple;
	bh=GeY1UMVQV7uEtbTBXvv8knlOVibm6unWQND/aCAhqjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IE6mTgjcCyp2d46iqeKPgNujC6s+ygofq4CpQS8XS1rme6nwkPE4OkImydQBl8HPqP8Lpw3hGmiOtnjWFccYQNjzmWGhpmEYqQ95Bf4KnW5dKWM/S4n/xrzNMBqmkJw4Uu39MU/cMPUS7is0FjvvL4xI8PyONXKkI0CTTxZK8u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZfj/OCm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZfj/OCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777564181; x=1809100181;
  h=date:from:to:cc:subject:message-id;
  bh=GeY1UMVQV7uEtbTBXvv8knlOVibm6unWQND/aCAhqjc=;
  b=RZfj/OCmOUiYEcAPHToYzrgbLTal9BPtvj26QBZHbTH2bXm8CWK3VUNt
   ZAc9HmFpQy4AGblihYhhSzOP4ld6pSgomkVav+p38+/hcao7NDspRVmAS
   LQPnInEk8ZdcZBnypKIm2/PoK3wzs7vwNNOCej0RJnjlLWu0J+Wyk2Os9
   DSztiD/nAcqKBjmaKq2j5+UTiO+wPKHWqsUaM0KkJQ8K/r5+vCpbQSJGb
   Jkyoma189aWtGvaNlEdaqAFRoHBY8lYKZGUNZHw+k5/5vpTQNoyc8wrMR
   y4o/2dDfUFURe7dsqdvK2XUgNXfrZgJIi3NYCuMQNQuLY4jZo/sJPHd80
   g==;
X-CSE-ConnectionGUID: tYdOtnqlReuOCKuEUI4iUQ==
X-CSE-MsgGUID: Nzv1bVBQTiiqsFZa0HjKUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66054624"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="66054624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 08:49:40 -0700
X-CSE-ConnectionGUID: ce8aESiLR0u6cO/WPDEdhg==
X-CSE-MsgGUID: +LWVFC6hSIyFfyMsgiDwiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="238604298"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2026 08:49:38 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wITdv-00000000CYK-1YNF;
	Thu, 30 Apr 2026 15:49:35 +0000
Date: Thu, 30 Apr 2026 23:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/xgene-hwmon.c:540:38: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202604302337.B8E9w0uX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e75a43c7cec459a07d91ed17de4de13ede2b7758
commit: 80fcd1e7f5c7009fa1c64737df100cc304c19c1f hwmon: (xgene-hwmon) Simplify PCC shared memory region handling
date:   1 year ago
config: x86_64-randconfig-123-20260430 (https://download.01.org/0day-ci/archive/20260430/202604302337.B8E9w0uX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302337.B8E9w0uX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80fcd1e7f5c7 ("hwmon: (xgene-hwmon) Simplify PCC shared memory region handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302337.B8E9w0uX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   drivers/hwmon/xgene-hwmon.c:538:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *msg @@     got struct acpi_pcct_shared_memory [noderef] __iomem * @@
   drivers/hwmon/xgene-hwmon.c:538:13: sparse:     expected void *msg
   drivers/hwmon/xgene-hwmon.c:538:13: sparse:     got struct acpi_pcct_shared_memory [noderef] __iomem *
>> drivers/hwmon/xgene-hwmon.c:540:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/hwmon/xgene-hwmon.c:540:38: sparse:     expected unsigned short [usertype] *addr
   drivers/hwmon/xgene-hwmon.c:540:38: sparse:     got unsigned short [noderef] __iomem *
   drivers/hwmon/xgene-hwmon.c:562:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [usertype] *addr @@     got unsigned short [noderef] __iomem * @@
   drivers/hwmon/xgene-hwmon.c:562:45: sparse:     expected unsigned short [usertype] *addr
   drivers/hwmon/xgene-hwmon.c:562:45: sparse:     got unsigned short [noderef] __iomem *

vim +540 drivers/hwmon/xgene-hwmon.c

ed42cfa881e1d8d hotran       2016-07-21  518  
ed42cfa881e1d8d hotran       2016-07-21  519  /*
ed42cfa881e1d8d hotran       2016-07-21  520   * This function is called when the PCC Mailbox received a message
ed42cfa881e1d8d hotran       2016-07-21  521   */
ed42cfa881e1d8d hotran       2016-07-21  522  static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
ed42cfa881e1d8d hotran       2016-07-21  523  {
ed42cfa881e1d8d hotran       2016-07-21  524  	struct xgene_hwmon_dev *ctx = to_xgene_hwmon_dev(cl);
80fcd1e7f5c7009 Sudeep Holla 2025-04-11  525  	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
80fcd1e7f5c7009 Sudeep Holla 2025-04-11  526  							ctx->pcc_chan->shmem;
ed42cfa881e1d8d hotran       2016-07-21  527  	struct slimpro_resp_msg amsg;
ed42cfa881e1d8d hotran       2016-07-21  528  
2ca492e22cb70a0 hotran       2016-09-08  529  	/*
2ca492e22cb70a0 hotran       2016-09-08  530  	 * While the driver registers with the mailbox framework, an interrupt
2ca492e22cb70a0 hotran       2016-09-08  531  	 * can be pending before the probe function completes its
2ca492e22cb70a0 hotran       2016-09-08  532  	 * initialization. If such condition occurs, just queue up the message
2ca492e22cb70a0 hotran       2016-09-08  533  	 * as the driver is not ready for servicing the callback.
2ca492e22cb70a0 hotran       2016-09-08  534  	 */
2ca492e22cb70a0 hotran       2016-09-08  535  	if (xgene_hwmon_rx_ready(ctx, &amsg) < 0)
2ca492e22cb70a0 hotran       2016-09-08  536  		return;
2ca492e22cb70a0 hotran       2016-09-08  537  
ed42cfa881e1d8d hotran       2016-07-21  538  	msg = generic_comm_base + 1;
ed42cfa881e1d8d hotran       2016-07-21  539  	/* Check if platform sends interrupt */
ed42cfa881e1d8d hotran       2016-07-21 @540  	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
2cf39b806be7466 Sudeep Holla 2023-09-27  541  				    PCC_STATUS_SCI_DOORBELL))
ed42cfa881e1d8d hotran       2016-07-21  542  		return;
ed42cfa881e1d8d hotran       2016-07-21  543  
ed42cfa881e1d8d hotran       2016-07-21  544  	/*
ed42cfa881e1d8d hotran       2016-07-21  545  	 * Response message format:
ed42cfa881e1d8d hotran       2016-07-21  546  	 * msg[0] is the return code of the operation
ed42cfa881e1d8d hotran       2016-07-21  547  	 * msg[1] is the first parameter word
ed42cfa881e1d8d hotran       2016-07-21  548  	 * msg[2] is the second parameter word
ed42cfa881e1d8d hotran       2016-07-21  549  	 *
ed42cfa881e1d8d hotran       2016-07-21  550  	 * As message only supports dword size, just assign it.
ed42cfa881e1d8d hotran       2016-07-21  551  	 */
ed42cfa881e1d8d hotran       2016-07-21  552  
ed42cfa881e1d8d hotran       2016-07-21  553  	/* Check for sync query */
ed42cfa881e1d8d hotran       2016-07-21  554  	if (ctx->resp_pending &&
ed42cfa881e1d8d hotran       2016-07-21  555  	    ((MSG_TYPE(((u32 *)msg)[0]) == MSG_TYPE_ERR) ||
ed42cfa881e1d8d hotran       2016-07-21  556  	     (MSG_TYPE(((u32 *)msg)[0]) == MSG_TYPE_DBG &&
ed42cfa881e1d8d hotran       2016-07-21  557  	      MSG_SUBTYPE(((u32 *)msg)[0]) == DBG_SUBTYPE_SENSOR_READ) ||
ed42cfa881e1d8d hotran       2016-07-21  558  	     (MSG_TYPE(((u32 *)msg)[0]) == MSG_TYPE_PWRMGMT &&
ed42cfa881e1d8d hotran       2016-07-21  559  	      MSG_SUBTYPE(((u32 *)msg)[0]) == PWRMGMT_SUBTYPE_TPC &&
ed42cfa881e1d8d hotran       2016-07-21  560  	      TPC_CMD(((u32 *)msg)[0]) == TPC_ALARM))) {
ed42cfa881e1d8d hotran       2016-07-21  561  		/* Check if platform completes command */
ed42cfa881e1d8d hotran       2016-07-21  562  		if (xgene_word_tst_and_clr(&generic_comm_base->status,
2cf39b806be7466 Sudeep Holla 2023-09-27  563  					   PCC_STATUS_CMD_COMPLETE)) {
ed42cfa881e1d8d hotran       2016-07-21  564  			ctx->sync_msg.msg = ((u32 *)msg)[0];
ed42cfa881e1d8d hotran       2016-07-21  565  			ctx->sync_msg.param1 = ((u32 *)msg)[1];
ed42cfa881e1d8d hotran       2016-07-21  566  			ctx->sync_msg.param2 = ((u32 *)msg)[2];
ed42cfa881e1d8d hotran       2016-07-21  567  
ed42cfa881e1d8d hotran       2016-07-21  568  			/* Operation waiting for response */
ed42cfa881e1d8d hotran       2016-07-21  569  			complete(&ctx->rd_complete);
ed42cfa881e1d8d hotran       2016-07-21  570  
ed42cfa881e1d8d hotran       2016-07-21  571  			return;
ed42cfa881e1d8d hotran       2016-07-21  572  		}
ed42cfa881e1d8d hotran       2016-07-21  573  	}
ed42cfa881e1d8d hotran       2016-07-21  574  
ed42cfa881e1d8d hotran       2016-07-21  575  	/*
ed42cfa881e1d8d hotran       2016-07-21  576  	 * Platform notifies interrupt to OSPM.
ed42cfa881e1d8d hotran       2016-07-21  577  	 * OPSM schedules a consumer command to get this information
ed42cfa881e1d8d hotran       2016-07-21  578  	 * in a workqueue. Platform must wait until OSPM has issued
ed42cfa881e1d8d hotran       2016-07-21  579  	 * a consumer command that serves this notification.
ed42cfa881e1d8d hotran       2016-07-21  580  	 */
ed42cfa881e1d8d hotran       2016-07-21  581  
ed42cfa881e1d8d hotran       2016-07-21  582  	/* Enqueue to the FIFO */
ed42cfa881e1d8d hotran       2016-07-21  583  	kfifo_in_spinlocked(&ctx->async_msg_fifo, &amsg,
ed42cfa881e1d8d hotran       2016-07-21  584  			    sizeof(struct slimpro_resp_msg), &ctx->kfifo_lock);
ed42cfa881e1d8d hotran       2016-07-21  585  	/* Schedule the bottom handler */
ed42cfa881e1d8d hotran       2016-07-21  586  	schedule_work(&ctx->workq);
ed42cfa881e1d8d hotran       2016-07-21  587  }
ed42cfa881e1d8d hotran       2016-07-21  588  

:::::: The code at line 540 was first introduced by commit
:::::: ed42cfa881e1d8d9603b7cb872199e3c8e0d1b19 hwmon: Add xgene hwmon driver

:::::: TO: hotran <hotran@apm.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
