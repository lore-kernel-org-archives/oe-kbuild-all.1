Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA23CD8B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 23:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782775033; cv=none; b=sNfQdXQg/Jc8riuIXOo6XpIw7PsTJU+6ug5SV4OVAaMXYhsf0E6SsSMo1zYpereEKb7wTLD4Me231yGbVTOQbudGJ8fA5oSWG6Cst8DmX+XWkzUzUKGDDsbuV6R2MMsBjxW41jwuH58eS9L1JZfDDEjldYce8nBAvEQUEgwKoNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782775033; c=relaxed/simple;
	bh=fBEXKoIkDmjYSAGLPUHgN8INwrB5vBx5wqqM+chcCos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d9Q1oTdYKud1EwaY4uXkpU4mk6nYRPTeD9o9qaEGqo1l/VU+NVBRyVQVTNDDoLZwzaOx3wGiDIYnXzbFDf3rKoq2SQwYgeffv3yKVpJw60KnW108oVDO3Upz3C2oGg5Ao3N+xVZ27u3xSqoRy500diDSRYcjV5yKSdSAqXJur68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyDwI3e9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyDwI3e9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782775031; x=1814311031;
  h=date:from:to:cc:subject:message-id;
  bh=fBEXKoIkDmjYSAGLPUHgN8INwrB5vBx5wqqM+chcCos=;
  b=lyDwI3e9iG7SZEJRqNBPlhJlODx6/1htXJDZXI5E1PTsp2mdafvGG9cI
   1j3ZLvLOoe0cRh0mnO+zXb/QIGTpH2Wp/gCpMzb2Jee3lubvmua4AP113
   PSKB8eMc4uX+VlLSEgkWd5b7rmRyANU7bngnN0d8u3BAzjjMyHhtmKRiG
   lJPWzPChNMhzpGbLwLbl8EK05G8HGIO0WOrrYahR1e8fKQKwyH8w2AJb/
   nIxKgMZla2Lq6SXdVZHA2x9MPYOV+mnkXKUTGy/ZmuBDsGUaj0crQcu/u
   2T9Wt+tcp+FXiL72KkdXXfCREow3MbX+0Y+0d1MOzO9hvAGoQaVqmMqBN
   Q==;
X-CSE-ConnectionGUID: 0fHdPH+XTimlON0Vc59BKQ==
X-CSE-MsgGUID: AYIH8nnPR6qRirsCEjaF6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="101025574"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="101025574"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 16:17:10 -0700
X-CSE-ConnectionGUID: /Xq04ebWR3ObWsTfveJvJg==
X-CSE-MsgGUID: ep1LORqtQeOpAkG79Zk2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="282167668"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 29 Jun 2026 16:17:09 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weLDu-000000000GL-3crM;
	Mon, 29 Jun 2026 23:17:06 +0000
Date: Tue, 30 Jun 2026 01:16:18 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 1/1] htmldocs:
 ./drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task'
 description in 'dma_buf_account_task'
Message-ID: <202606300112.pP5bvpSb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   cdc3e5d4075f3ec1b02cc805b1abbc0def00202b
commit: f7d26609785ce56170645d56f306db38e8ba277a [1/1] ANDROID: Don't use current pointer for per-process dmabuf accounting
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260630/202606300112.pP5bvpSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300112.pP5bvpSb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/net/mac80211.h:1287: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'ieee80211_tx_info'
   ./include/net/mac80211.h:2529: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'ieee80211_sta'
   ./kernel/sched/cpupri.c:154: warning: Function parameter or struct member 'sched_ctx' not described in 'cpupri_find_fitness'
   ./kernel/sched/cpupri.c:154: warning: Function parameter or struct member 'exec_ctx' not described in 'cpupri_find_fitness'
   ./kernel/sched/cpupri.c:154: warning: Excess function parameter 'p' description in 'cpupri_find_fitness'
>> ./drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:435: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:905: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> ./drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:435: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:905: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> ./drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:435: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:905: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> ./drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:435: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:905: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> ./drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:435: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:905: warning: Function parameter or struct member 'name' not described in 'dma_buf_set_name'
   ./drivers/dma-buf/dma-buf.c:905: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
   ./include/linux/dma-buf.h:367: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'dma_buf_ops'
   ./include/linux/dma-buf.h:367: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'dma_buf_ops'
   ./include/linux/dma-buf.h:550: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'dma_buf'


vim +399 ./drivers/dma-buf/dma-buf.c

d50dd969464c6a T.J. Mercier 2025-07-22  384  
d50dd969464c6a T.J. Mercier 2025-07-22  385  /**
d50dd969464c6a T.J. Mercier 2025-07-22  386   * dma_buf_account_task - Account a dmabuf to a task
d50dd969464c6a T.J. Mercier 2025-07-22  387   * @dmabuf:	[in]	pointer to dma_buf
d50dd969464c6a T.J. Mercier 2025-07-22  388   * @task:	[in]	pointer to task_struct
d50dd969464c6a T.J. Mercier 2025-07-22  389   *
d50dd969464c6a T.J. Mercier 2025-07-22  390   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
d50dd969464c6a T.J. Mercier 2025-07-22  391   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
d50dd969464c6a T.J. Mercier 2025-07-22  392   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
d50dd969464c6a T.J. Mercier 2025-07-22  393   *
d50dd969464c6a T.J. Mercier 2025-07-22  394   * Return:
d50dd969464c6a T.J. Mercier 2025-07-22  395   * * 0 on success
d50dd969464c6a T.J. Mercier 2025-07-22  396   * * A negative error code upon error
d50dd969464c6a T.J. Mercier 2025-07-22  397   */
f7d26609785ce5 T.J. Mercier 2025-11-12  398  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
d50dd969464c6a T.J. Mercier 2025-07-22 @399  {
d50dd969464c6a T.J. Mercier 2025-07-22  400  	struct task_dma_buf_record *rec;
d50dd969464c6a T.J. Mercier 2025-07-22  401  
d50dd969464c6a T.J. Mercier 2025-07-22  402  	if (!dmabuf_info)
d50dd969464c6a T.J. Mercier 2025-07-22  403  		return 0;
d50dd969464c6a T.J. Mercier 2025-07-22  404  
d50dd969464c6a T.J. Mercier 2025-07-22  405  	if (!task_dmabuf_records_preload(1))
d50dd969464c6a T.J. Mercier 2025-07-22  406  		return -ENOMEM;
d50dd969464c6a T.J. Mercier 2025-07-22  407  
d50dd969464c6a T.J. Mercier 2025-07-22  408  	spin_lock(&dmabuf_info->lock);
d50dd969464c6a T.J. Mercier 2025-07-22  409  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
d50dd969464c6a T.J. Mercier 2025-07-22  410  	if (rec) {
d50dd969464c6a T.J. Mercier 2025-07-22  411  		++rec->refcnt;
d50dd969464c6a T.J. Mercier 2025-07-22  412  		trim_task_dmabuf_records_locked();
d50dd969464c6a T.J. Mercier 2025-07-22  413  	} else {
d50dd969464c6a T.J. Mercier 2025-07-22  414  		rec = alloc_task_dmabuf_record();
d50dd969464c6a T.J. Mercier 2025-07-22  415  		WARN_ON(!rec);
d50dd969464c6a T.J. Mercier 2025-07-22  416  		add_task_dmabuf_record(dmabuf_info, dmabuf, rec);
d50dd969464c6a T.J. Mercier 2025-07-22  417  	}
d50dd969464c6a T.J. Mercier 2025-07-22  418  	spin_unlock(&dmabuf_info->lock);
d50dd969464c6a T.J. Mercier 2025-07-22  419  	task_dmabuf_records_preload_end();
d50dd969464c6a T.J. Mercier 2025-07-22  420  
d50dd969464c6a T.J. Mercier 2025-07-22  421  	return 0;
d50dd969464c6a T.J. Mercier 2025-07-22  422  }
d50dd969464c6a T.J. Mercier 2025-07-22  423  
d50dd969464c6a T.J. Mercier 2025-07-22  424  /**
d50dd969464c6a T.J. Mercier 2025-07-22  425   * dma_buf_unaccount_task - Unaccount a dmabuf from a task
d50dd969464c6a T.J. Mercier 2025-07-22  426   * @dmabuf:	[in]	pointer to dma_buf
d50dd969464c6a T.J. Mercier 2025-07-22  427   * @task:	[in]	pointer to task_struct
d50dd969464c6a T.J. Mercier 2025-07-22  428   *
d50dd969464c6a T.J. Mercier 2025-07-22  429   * When a process closes a dmabuf file descriptor, or unmaps a dmabuf, this
d50dd969464c6a T.J. Mercier 2025-07-22  430   * function removes the provided @dmabuf attribution from the @task. When all
d50dd969464c6a T.J. Mercier 2025-07-22  431   * references to @dmabuf are removed from @task, the buffer's size is removed
d50dd969464c6a T.J. Mercier 2025-07-22  432   * from the task's dmabuf RSS.
d50dd969464c6a T.J. Mercier 2025-07-22  433   */
f7d26609785ce5 T.J. Mercier 2025-11-12  434  void dma_buf_unaccount_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
d50dd969464c6a T.J. Mercier 2025-07-22 @435  {
d50dd969464c6a T.J. Mercier 2025-07-22  436  	struct task_dma_buf_record *rec;
d50dd969464c6a T.J. Mercier 2025-07-22  437  
d50dd969464c6a T.J. Mercier 2025-07-22  438  	if (!dmabuf_info)
d50dd969464c6a T.J. Mercier 2025-07-22  439  		return;
d50dd969464c6a T.J. Mercier 2025-07-22  440  
d50dd969464c6a T.J. Mercier 2025-07-22  441  	spin_lock(&dmabuf_info->lock);
d50dd969464c6a T.J. Mercier 2025-07-22  442  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
d50dd969464c6a T.J. Mercier 2025-07-22  443  	if (rec) {
d50dd969464c6a T.J. Mercier 2025-07-22  444  		if (--rec->refcnt == 0) {
d50dd969464c6a T.J. Mercier 2025-07-22  445  			list_del(&rec->node);
d50dd969464c6a T.J. Mercier 2025-07-22  446  			dmabuf_info->dmabuf_count--;
d50dd969464c6a T.J. Mercier 2025-07-22  447  			dmabuf_info->rss -= dmabuf->size;
2913cc072097bc T.J. Mercier 2025-07-01  448  			trace_dmabuf_rss_stat(dmabuf_info->rss, -dmabuf->size, dmabuf);
45ae7f0b6b5f0a T.J. Mercier 2025-07-08  449  			atomic64_dec(&dmabuf->nr_task_refs);
d50dd969464c6a T.J. Mercier 2025-07-22  450  		} else {
d50dd969464c6a T.J. Mercier 2025-07-22  451  			rec = NULL;
d50dd969464c6a T.J. Mercier 2025-07-22  452  		}
d50dd969464c6a T.J. Mercier 2025-07-22  453  	} else {
f7d26609785ce5 T.J. Mercier 2025-11-12  454  		pr_err("Could not find dmabuf %lu in unaccount\n",
f7d26609785ce5 T.J. Mercier 2025-11-12  455  		       file_inode(dmabuf->file)->i_ino);
d50dd969464c6a T.J. Mercier 2025-07-22  456  	}
d50dd969464c6a T.J. Mercier 2025-07-22  457  	spin_unlock(&dmabuf_info->lock);
d50dd969464c6a T.J. Mercier 2025-07-22  458  	if (rec)
d50dd969464c6a T.J. Mercier 2025-07-22  459  		free_task_dmabuf_record(rec);
d50dd969464c6a T.J. Mercier 2025-07-22  460  }
d50dd969464c6a T.J. Mercier 2025-07-22  461  

:::::: The code at line 399 was first introduced by commit
:::::: d50dd969464c6a44ff601c687c33f7b7f7e4ba53 ANDROID: Track per-process dmabuf RSS

:::::: TO: T.J. Mercier <tjmercier@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
