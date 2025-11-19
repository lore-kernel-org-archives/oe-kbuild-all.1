Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0862356A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561277; cv=none; b=mlceFaP8LYeo4O3mXO/8qr0wycYm+YPP25TcbdmtFeuoO1SbhxMcNOGuZnLyOyP+9go6RHRA3uyQIsf4fZj8iG/JsHpBktA+KEo5AeJZv5OwBy04FECsYgK+kqiYoKeQ8VUcrqEX1qS7+1xFkmiwa5hiZwVaC6Ql+Hxlz4pCdE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561277; c=relaxed/simple;
	bh=VXej376e8NDUnHH6N1Y2Zz0He+oCNxyUEPvjiFLAsg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/zcNnoWwdMy1fahJ0WZZAJWaMdGR3t5LlTrnnQfD22omxpy86nGMi2MzBO02Nqx9hmaD9dpJLI4NieYMHYOY8fwzqEdb2X8hUQTblWjjMofVT4Q86ZAKB4ll+9Hc4DdML9DjD6DF485wpyUodPmok/gtBEgQpCHuPFou0TUGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DyXGI/YJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DyXGI/YJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763561276; x=1795097276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXej376e8NDUnHH6N1Y2Zz0He+oCNxyUEPvjiFLAsg4=;
  b=DyXGI/YJrB26LchYYpbE/3Hd/PMVfieZmvG00uDoSyv3eddFjXSjW5xt
   NTpBhgqQ7+R5rJJWjHYF3sYahojAQuQ944amFeC+LneuHxCZECXdEIQI0
   Crg3rAIUPJw/D4+G22S47lSFJkXADGjd0NU9c+gbeNBbpQhcI/kLF9PvE
   Nw8iRPQQUDzW/oJsW4+hplV+8Pv6I/Pbuzi00CdwU7Dn0J9bGh1B4KMWT
   OvkGrT1EQ9HVHSfvBhienruIGzflqjZyrCRvkKyLxVb1VI4SOhcnpsT7P
   B0mm2Jz8kz23DncCNwrwZaG57VzwUvL/ZsylgTB7wVJFroK78Da6tQdub
   A==;
X-CSE-ConnectionGUID: VG1kKmkxT62VeQA4+BQEsw==
X-CSE-MsgGUID: AT+b7KNETt+9USMvpkcmFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76282098"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76282098"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:07:55 -0800
X-CSE-ConnectionGUID: bk6MB9woTrWpHMjMhYJIZg==
X-CSE-MsgGUID: cMRwz3mYQi6L8Kke6S27xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196200226"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2025 06:07:55 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLiqe-0002wx-0B;
	Wed, 19 Nov 2025 14:07:52 +0000
Date: Wed, 19 Nov 2025 22:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 328/328] block/blk-mq.c:1049:36: sparse:
 sparse: cast from restricted blk_status_t
Message-ID: <202511192204.6svmBzVu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   bb0e74acaf990260e6fbe36e2fe42ec210016242
commit: 54c492f8d2da8d8ea3740dfbeb233e3649331605 [328/328] block: remove blk-exec.c
config: arm64-randconfig-r132-20251119 (https://download.01.org/0day-ci/archive/20251119/202511192204.6svmBzVu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511192204.6svmBzVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511192204.6svmBzVu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-mq.c:315:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int rq_flags @@     got restricted req_flags_t [usertype] @@
   block/blk-mq.c:315:26: sparse:     expected unsigned int rq_flags
   block/blk-mq.c:315:26: sparse:     got restricted req_flags_t [usertype]
   block/blk-mq.c:324:26: sparse: sparse: invalid assignment: |=
   block/blk-mq.c:324:26: sparse:    left side has type unsigned int
   block/blk-mq.c:324:26: sparse:    right side has type restricted req_flags_t
   block/blk-mq.c:326:26: sparse: sparse: invalid assignment: |=
   block/blk-mq.c:326:26: sparse:    left side has type unsigned int
   block/blk-mq.c:326:26: sparse:    right side has type restricted req_flags_t
   block/blk-mq.c:327:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted req_flags_t [usertype] rq_flags @@     got unsigned int rq_flags @@
   block/blk-mq.c:327:22: sparse:     expected restricted req_flags_t [usertype] rq_flags
   block/blk-mq.c:327:22: sparse:     got unsigned int rq_flags
>> block/blk-mq.c:1049:36: sparse: sparse: cast from restricted blk_status_t
>> block/blk-mq.c:1142:17: sparse: sparse: cast to restricted blk_status_t

vim +1049 block/blk-mq.c

  1039	
  1040	/**
  1041	 * blk_end_sync_rq - executes a completion event on a request
  1042	 * @rq: request to complete
  1043	 * @error: end I/O status of the request
  1044	 */
  1045	static void blk_end_sync_rq(struct request *rq, blk_status_t error)
  1046	{
  1047		struct completion *waiting = rq->end_io_data;
  1048	
> 1049		rq->end_io_data = (void *)(uintptr_t)error;
  1050	
  1051		/*
  1052		 * complete last, if this is a stack request the process (and thus
  1053		 * the rq pointer) could be invalid right after this complete()
  1054		 */
  1055		complete(waiting);
  1056	}
  1057	
  1058	/**
  1059	 * blk_execute_rq_nowait - insert a request to I/O scheduler for execution
  1060	 * @bd_disk:	matching gendisk
  1061	 * @rq:		request to insert
  1062	 * @at_head:    insert request at head or tail of queue
  1063	 * @done:	I/O completion handler
  1064	 *
  1065	 * Description:
  1066	 *    Insert a fully prepared request at the back of the I/O scheduler queue
  1067	 *    for execution.  Don't wait for completion.
  1068	 *
  1069	 * Note:
  1070	 *    This function will invoke @done directly if the queue is dead.
  1071	 */
  1072	void blk_execute_rq_nowait(struct gendisk *bd_disk, struct request *rq,
  1073				   int at_head, rq_end_io_fn *done)
  1074	{
  1075		WARN_ON(irqs_disabled());
  1076		WARN_ON(!blk_rq_is_passthrough(rq));
  1077	
  1078		rq->rq_disk = bd_disk;
  1079		rq->end_io = done;
  1080	
  1081		blk_account_io_start(rq);
  1082	
  1083		/*
  1084		 * don't check dying flag for MQ because the request won't
  1085		 * be reused after dying flag is set
  1086		 */
  1087		blk_mq_sched_insert_request(rq, at_head, true, false);
  1088	}
  1089	EXPORT_SYMBOL_GPL(blk_execute_rq_nowait);
  1090	
  1091	static bool blk_rq_is_poll(struct request *rq)
  1092	{
  1093		if (!rq->mq_hctx)
  1094			return false;
  1095		if (rq->mq_hctx->type != HCTX_TYPE_POLL)
  1096			return false;
  1097		if (WARN_ON_ONCE(!rq->bio))
  1098			return false;
  1099		return true;
  1100	}
  1101	
  1102	static void blk_rq_poll_completion(struct request *rq, struct completion *wait)
  1103	{
  1104		do {
  1105			bio_poll(rq->bio, NULL, 0);
  1106			cond_resched();
  1107		} while (!completion_done(wait));
  1108	}
  1109	
  1110	/**
  1111	 * blk_execute_rq - insert a request into queue for execution
  1112	 * @bd_disk:	matching gendisk
  1113	 * @rq:		request to insert
  1114	 * @at_head:    insert request at head or tail of queue
  1115	 *
  1116	 * Description:
  1117	 *    Insert a fully prepared request at the back of the I/O scheduler queue
  1118	 *    for execution and wait for completion.
  1119	 * Return: The blk_status_t result provided to blk_mq_end_request().
  1120	 */
  1121	blk_status_t blk_execute_rq(struct gendisk *bd_disk, struct request *rq,
  1122			int at_head)
  1123	{
  1124		DECLARE_COMPLETION_ONSTACK(wait);
  1125		unsigned long hang_check;
  1126	
  1127		rq->end_io_data = &wait;
  1128		blk_execute_rq_nowait(bd_disk, rq, at_head, blk_end_sync_rq);
  1129	
  1130		/* Prevent hang_check timer from firing at us during very long I/O */
  1131		hang_check = sysctl_hung_task_timeout_secs;
  1132	
  1133		if (blk_rq_is_poll(rq))
  1134			blk_rq_poll_completion(rq, &wait);
  1135		else if (hang_check)
  1136			while (!wait_for_completion_io_timeout(&wait,
  1137					hang_check * (HZ/2)))
  1138				;
  1139		else
  1140			wait_for_completion_io(&wait);
  1141	
> 1142		return (blk_status_t)(uintptr_t)rq->end_io_data;
  1143	}
  1144	EXPORT_SYMBOL(blk_execute_rq);
  1145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
