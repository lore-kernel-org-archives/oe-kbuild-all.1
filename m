Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536BD457E7F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865913; cv=none; b=HWnVIZy/9v4rO8xWPIQxH+jZvJ99+MHgdkzzLfGiVH+1B3qidn+DdLgyPOan6WAZP9n+8TbMHaBSaT+bKQEicssZx3hg1kKdYvqOqsycgw5SHhaAEhU0r/OL4Ntu3P5TESmW/htBxbGC3hHiyHoy86L20YiUXTleqSkfYj/J+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865913; c=relaxed/simple;
	bh=HP0xfrFozq/WhXJ9UkO2wGmFhL8ycpiZ8v8NYk/BUAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DYHOOJ4Dph+flDX89Tnm8GJ8gJLkhP0Wo+zjGfzdcBD2U2+5/BoqMqNoc7pUzwimlz6sfKDmFQ0nIeHQf/UVDMY06EprC/MQAO3SFD4meZN0nop2pMXq9C0MGjOK+1hRfxJT7M0CeOqGsNhi4q2Kn2/GPDkhp7oeWAaHhaO99ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/2Swjzg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/2Swjzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790865909; x=1822401909;
  h=date:from:to:cc:subject:message-id;
  bh=HP0xfrFozq/WhXJ9UkO2wGmFhL8ycpiZ8v8NYk/BUAI=;
  b=Y/2SwjzgETT0nnMCw/x1Yr7MdJsrp8x9Lpkz9QhcBV9DkritfcXNGt5g
   ZyQy1pxzsACf+5CxhIAdPTi6DYnwwef4DfF7JXmkgtTi+sMNhJdkwS9GV
   CeQDySuWCCyuzWtKRINe5h5kuBTp2WjHofLNrtQAg+d1YnXRtMA4ojNhM
   bpmBYABxk1Lu3PPgsiTo8Akp3A74LGlp+Y9rFOcf5vN560kz/VAv61tMW
   g2zzf4gjaWs7fJTTOLDxwjV+elC+lh9jc5t+K60dwJSxuroF5Ehil9OMQ
   pBKm8pdkyAuDPFmSMbrc3KiSk30Zk6zjrjhdsbcRZLvwXGBBRPBmwngS+
   g==;
X-CSE-ConnectionGUID: ZLDQS6aGSPWbcKBa9/dtKw==
X-CSE-MsgGUID: oyou9nCCQ7ikAhQDiDfmmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91723707"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91723707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:45:08 -0700
X-CSE-ConnectionGUID: 4wGNCkPPTnyRhv4mBZDIVw==
X-CSE-MsgGUID: nGlKJX/yQBK7GzFVTcw3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279316541"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 07:45:07 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCI1s-0000000007P-0Z3A;
	Thu, 01 Oct 2026 14:45:00 +0000
Date: Thu, 01 Oct 2026 16:44:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 9/9]
 drivers/dma-buf/dma-buf.c:399: warning: Function parameter or struct member
 'dmabuf_info' not described in 'dma_buf_account_task'
Message-ID: <202610011603.7kOkUmwk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f82d63769e69a466e16c4895f07a627665651cea
commit: f7d26609785ce56170645d56f306db38e8ba277a [9/9] ANDROID: Don't use current pointer for per-process dmabuf accounting
config: x86_64-randconfig-r2202-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011603.7kOkUmwk-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011603.7kOkUmwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011603.7kOkUmwk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:399: warning: Function parameter or struct member 'dmabuf_info' not described in 'dma_buf_account_task'
   drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> drivers/dma-buf/dma-buf.c:435: warning: Function parameter or struct member 'dmabuf_info' not described in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:435: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:905: warning: Function parameter or struct member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:905: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDCP_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +399 drivers/dma-buf/dma-buf.c

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
