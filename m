Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C111F03CD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249852; cv=none; b=r55FM77t4sXH5vXcHIpqvKNd8rzDvQ546Z1tGyrWevn9j7bofnASkw6Lcml0LxBnOuNsPZqVWTren8/VjtNDb3jKTyqwwNsyO58xc4lBoUSEoZ0LEE8Webb6hSAdTrM1PNY4nGEPCPTcxAcyWo3IGjE4rcpNgscC227diRk/Xng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249852; c=relaxed/simple;
	bh=gyEkMPCUhJF1SaQvqn5573aWmjx+n8mfP6v4UTbtu5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOG5Kw1wJdBS7wi35y5fbdRj6Yvxg0o1iYHImxtQPX24W6NAyUfoMORoFtpo4uinnox0d8a6Rhsvjs7ylQR8RGBDgvVCMsvcCkvZMIG0GQXvw8oeTo+P96buzK/JOMX6YRDT0ez3tc6xjOIItWl7hZuVFTjHGxUYHKEpPz6E/bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elCC3Czj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elCC3Czj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736249849; x=1767785849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gyEkMPCUhJF1SaQvqn5573aWmjx+n8mfP6v4UTbtu5E=;
  b=elCC3CzjxIoojXWGVQYYG9C7aCXOsEvSlyFGgcuX032JycMh3nLHHt+h
   snlVGgpx2TuAMFqrDmJFqBVrm+YcNZIOppRQxA8yjOWX6u46xl9tYpwYT
   /EhU9c9CeGzaqVdROoSBvPwf27T1Dpl2yyvfAb4h2NnEgVArQ3LpklWvf
   M+tTznu/bzoIjK7EtgIOVGcrZwINexeNy8eGR5PtqwXIdD7DVXXDRWib2
   tvSTtISNpWlfxdSHMFrTQ6Vs47KNmhSeeIPMt8XP+vHqOOlnHWZD6Ih6Q
   2P7qf88DAqZb+STMCWNJ4ZXtEQ2IitwtpZcyR5HmbOoLeftRvO1eXgtat
   A==;
X-CSE-ConnectionGUID: vqMlBpqKTnm+SZXK/MnCaQ==
X-CSE-MsgGUID: /pq6yrM4Spex8KY+iYiP3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40373922"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="40373922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 03:37:25 -0800
X-CSE-ConnectionGUID: zjOhK5O7RXCEDCFkJmBDTQ==
X-CSE-MsgGUID: C9/AD2UbSKm4hbv8BXOYVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106765843"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 03:37:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV7th-000EcV-39;
	Tue, 07 Jan 2025 11:37:21 +0000
Date: Tue, 7 Jan 2025 19:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] block/blk-mq.c:1049:36: sparse:
 sparse: cast from restricted blk_status_t
Message-ID: <202501071942.ymcbvZs4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 54c492f8d2da8d8ea3740dfbeb233e3649331605 [1347/1347] block: remove blk-exec.c
config: arm64-randconfig-r133-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071942.ymcbvZs4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250107/202501071942.ymcbvZs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071942.ymcbvZs4-lkp@intel.com/

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
