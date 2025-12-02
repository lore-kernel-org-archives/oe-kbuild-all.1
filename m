Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2C2F60C1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 05:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764654095; cv=none; b=QsVGf1a3UlQVxBPof6X8+M0grrSUPN93BsPz7tz7zc7LcB5JYbqd6ov3c/2zZM8rIS6Plv1c2QPgO8Mqj5nXy/zxml76NxMfG/RZA9OtK5qr8zTagcMt96FyY758CeJIaqnA6xVC5/vUTcCAcUyrU/eB/vHo5exLQLyLBAVOzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764654095; c=relaxed/simple;
	bh=NsiC4Ip+hM7iWEZKZuRA/cDqLVc41Lpb30pQVPECNNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spo25/1VIeZMzhJFJA4+9V5k3O+AyNiqxUEb9U2/bYI3vjjMOxe7yuriSRoXOxZf16YacgN+3l+9ayr0EfJXa57BArp3pz4VOf4v/jEIwhOpOP0u4hD6xROx321Afw68ZWHyaePQaBGF6/K9W9fb3mc/QJWTz/GSAhwnk0er5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0zyby/H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0zyby/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764654093; x=1796190093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NsiC4Ip+hM7iWEZKZuRA/cDqLVc41Lpb30pQVPECNNU=;
  b=J0zyby/HXHnN63RW1oBi43aUqbU6s+bnEJP0nzavOYrBxU5eYyWdsITw
   lEIfqUZrtnZcDjtoPl6oV2OkF2WFwc4C+xDU3+0A/QEhm5829CcXK0mM6
   e2easRQDX3yFeyRwW6Yzxk8inN6Apris0SWph7PQsJJHx75Y53N4LgwQF
   ma1QPDVwA4DAUmAidL949MVO6MSADBeOY2hCE+gtcplwXz8mAkG43cp4E
   InPJI65n2O4j/UDZckmWgpM63fRYSlcqSMUVxO71U/lgxgMELtqjKyoxC
   VgVvmWHL4mwyXWLYCN+k6VtSVWqPqIYzCou2IbDB+z4/dCoLPICYvhKdC
   Q==;
X-CSE-ConnectionGUID: fE6MzuHSQw6wXknJ0DtFQw==
X-CSE-MsgGUID: cmtaKbCaSsyFR6BPX/l3hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70460240"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="70460240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 21:39:34 -0800
X-CSE-ConnectionGUID: i4SV9PzjQOCahE0dnOb2Pw==
X-CSE-MsgGUID: bDhPF64uRFWDk2Qy4YAEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="198483197"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2025 21:39:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQJ6n-000000002on-46f2;
	Tue, 02 Dec 2025 05:39:29 +0000
Date: Tue, 2 Dec 2025 06:38:30 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 36/36] htmldocs:
 ./drivers/dma-buf/dma-buf.c:413: warning: Excess function parameter 'task'
 description in 'dma_buf_account_task'
Message-ID: <202512020602.Ch1dI41i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: 5dd8a05ba11a36d91c244d3e482a18a275e5d8ad [36/36] ANDROID: Don't use current pointer for per-process dmabuf accounting
reproduce: (https://download.01.org/0day-ci/archive/20251202/202512020602.Ch1dI41i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020602.Ch1dI41i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/devfreq-event.h
   Error: Cannot open file ./include/linux/iosys-map.h
   Error: Cannot open file ./include/linux/iosys-map.h
   Error: Cannot open file ./include/linux/iosys-map.h
   Error: Cannot open file ./include/linux/device.h
>> ./drivers/dma-buf/dma-buf.c:413: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:452: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:932: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> ./drivers/dma-buf/dma-buf.c:413: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:452: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:932: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> ./drivers/dma-buf/dma-buf.c:413: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:452: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:932: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> ./drivers/dma-buf/dma-buf.c:413: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> ./drivers/dma-buf/dma-buf.c:452: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   ./drivers/dma-buf/dma-buf.c:932: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   ./drivers/dma-buf/dma-buf.c:932: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
   Error: Cannot open file ./include/linux/dma-buf.h
   Error: Cannot open file ./include/linux/dma-buf.h
   Error: Cannot open file ./include/linux/dma-resv.h


vim +413 ./drivers/dma-buf/dma-buf.c

060742b3d06d5d T.J. Mercier       2025-07-22  398  
060742b3d06d5d T.J. Mercier       2025-07-22  399  /**
060742b3d06d5d T.J. Mercier       2025-07-22  400   * dma_buf_account_task - Account a dmabuf to a task
060742b3d06d5d T.J. Mercier       2025-07-22  401   * @dmabuf:	[in]	pointer to dma_buf
060742b3d06d5d T.J. Mercier       2025-07-22  402   * @task:	[in]	pointer to task_struct
060742b3d06d5d T.J. Mercier       2025-07-22  403   *
060742b3d06d5d T.J. Mercier       2025-07-22  404   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
060742b3d06d5d T.J. Mercier       2025-07-22  405   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
060742b3d06d5d T.J. Mercier       2025-07-22  406   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
060742b3d06d5d T.J. Mercier       2025-07-22  407   *
060742b3d06d5d T.J. Mercier       2025-07-22  408   * Return:
060742b3d06d5d T.J. Mercier       2025-07-22  409   * * 0 on success
060742b3d06d5d T.J. Mercier       2025-07-22  410   * * A negative error code upon error
060742b3d06d5d T.J. Mercier       2025-07-22  411   */
5dd8a05ba11a36 T.J. Mercier       2025-11-12  412  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22 @413  {
060742b3d06d5d T.J. Mercier       2025-07-22  414  	struct task_dma_buf_record *rec;
060742b3d06d5d T.J. Mercier       2025-07-22  415  
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  416  	if (!static_key_enabled(&dmabuf_accounting_key))
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  417  		return 0;
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  418  
060742b3d06d5d T.J. Mercier       2025-07-22  419  	if (!dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22  420  		return 0;
060742b3d06d5d T.J. Mercier       2025-07-22  421  
060742b3d06d5d T.J. Mercier       2025-07-22  422  	if (!task_dmabuf_records_preload(1))
060742b3d06d5d T.J. Mercier       2025-07-22  423  		return -ENOMEM;
060742b3d06d5d T.J. Mercier       2025-07-22  424  
060742b3d06d5d T.J. Mercier       2025-07-22  425  	spin_lock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  426  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
060742b3d06d5d T.J. Mercier       2025-07-22  427  	if (rec) {
060742b3d06d5d T.J. Mercier       2025-07-22  428  		++rec->refcnt;
060742b3d06d5d T.J. Mercier       2025-07-22  429  		trim_task_dmabuf_records_locked();
060742b3d06d5d T.J. Mercier       2025-07-22  430  	} else {
060742b3d06d5d T.J. Mercier       2025-07-22  431  		rec = alloc_task_dmabuf_record();
060742b3d06d5d T.J. Mercier       2025-07-22  432  		WARN_ON(!rec);
060742b3d06d5d T.J. Mercier       2025-07-22  433  		add_task_dmabuf_record(dmabuf_info, dmabuf, rec);
060742b3d06d5d T.J. Mercier       2025-07-22  434  	}
060742b3d06d5d T.J. Mercier       2025-07-22  435  	spin_unlock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  436  	task_dmabuf_records_preload_end();
060742b3d06d5d T.J. Mercier       2025-07-22  437  
060742b3d06d5d T.J. Mercier       2025-07-22  438  	return 0;
060742b3d06d5d T.J. Mercier       2025-07-22  439  }
060742b3d06d5d T.J. Mercier       2025-07-22  440  
060742b3d06d5d T.J. Mercier       2025-07-22  441  /**
060742b3d06d5d T.J. Mercier       2025-07-22  442   * dma_buf_unaccount_task - Unaccount a dmabuf from a task
060742b3d06d5d T.J. Mercier       2025-07-22  443   * @dmabuf:	[in]	pointer to dma_buf
060742b3d06d5d T.J. Mercier       2025-07-22  444   * @task:	[in]	pointer to task_struct
060742b3d06d5d T.J. Mercier       2025-07-22  445   *
060742b3d06d5d T.J. Mercier       2025-07-22  446   * When a process closes a dmabuf file descriptor, or unmaps a dmabuf, this
060742b3d06d5d T.J. Mercier       2025-07-22  447   * function removes the provided @dmabuf attribution from the @task. When all
060742b3d06d5d T.J. Mercier       2025-07-22  448   * references to @dmabuf are removed from @task, the buffer's size is removed
060742b3d06d5d T.J. Mercier       2025-07-22  449   * from the task's dmabuf RSS.
060742b3d06d5d T.J. Mercier       2025-07-22  450   */
5dd8a05ba11a36 T.J. Mercier       2025-11-12  451  void dma_buf_unaccount_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22 @452  {
060742b3d06d5d T.J. Mercier       2025-07-22  453  	struct task_dma_buf_record *rec;
060742b3d06d5d T.J. Mercier       2025-07-22  454  
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  455  	if (!static_key_enabled(&dmabuf_accounting_key))
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  456  		return;
baa7a3655a17c8 Suren Baghdasaryan 2025-08-01  457  
060742b3d06d5d T.J. Mercier       2025-07-22  458  	if (!dmabuf_info)
060742b3d06d5d T.J. Mercier       2025-07-22  459  		return;
060742b3d06d5d T.J. Mercier       2025-07-22  460  
060742b3d06d5d T.J. Mercier       2025-07-22  461  	spin_lock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  462  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
060742b3d06d5d T.J. Mercier       2025-07-22  463  	if (rec) {
060742b3d06d5d T.J. Mercier       2025-07-22  464  		if (--rec->refcnt == 0) {
060742b3d06d5d T.J. Mercier       2025-07-22  465  			list_del(&rec->node);
060742b3d06d5d T.J. Mercier       2025-07-22  466  			dmabuf_info->dmabuf_count--;
060742b3d06d5d T.J. Mercier       2025-07-22  467  			dmabuf_info->rss -= dmabuf->size;
c8372adc56a99a T.J. Mercier       2025-07-01  468  			trace_dmabuf_rss_stat(dmabuf_info->rss, -dmabuf->size, dmabuf);
1b269f8eb12649 T.J. Mercier       2025-07-08  469  			atomic64_dec(&dmabuf->nr_task_refs);
060742b3d06d5d T.J. Mercier       2025-07-22  470  		} else {
060742b3d06d5d T.J. Mercier       2025-07-22  471  			rec = NULL;
060742b3d06d5d T.J. Mercier       2025-07-22  472  		}
060742b3d06d5d T.J. Mercier       2025-07-22  473  	} else {
5dd8a05ba11a36 T.J. Mercier       2025-11-12  474  		pr_err("Could not find dmabuf %lu in unaccount\n",
5dd8a05ba11a36 T.J. Mercier       2025-11-12  475  		       file_inode(dmabuf->file)->i_ino);
060742b3d06d5d T.J. Mercier       2025-07-22  476  	}
060742b3d06d5d T.J. Mercier       2025-07-22  477  	spin_unlock(&dmabuf_info->lock);
060742b3d06d5d T.J. Mercier       2025-07-22  478  	if (rec)
060742b3d06d5d T.J. Mercier       2025-07-22  479  		free_task_dmabuf_record(rec);
060742b3d06d5d T.J. Mercier       2025-07-22  480  }
060742b3d06d5d T.J. Mercier       2025-07-22  481  

:::::: The code at line 413 was first introduced by commit
:::::: 060742b3d06d5de7b692b6e7340e90bb950769e4 ANDROID: Track per-process dmabuf RSS

:::::: TO: T.J. Mercier <tjmercier@google.com>
:::::: CC: T.J. Mercier <tjmercier@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
