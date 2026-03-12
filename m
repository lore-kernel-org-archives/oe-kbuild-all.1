Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95735836F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773326381; cv=none; b=jH94XJ8o7sRwlW8H5vgHAfF8VjDSNEAgKTSPwrsyC/5pCfcrtJ9xf9jlTqCbeWi/UaAoh1z6CbImBHJsDlBBKT1f3ml+71bQGc32SYHNC+lqyf41yml/vuMD8msg6P+RAq6RD1rAjZFBJTGWLUoO709KB+RK3r1AwHC+39LPrhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773326381; c=relaxed/simple;
	bh=yGIJwNyyWxME9OE+gJZFWSEoQkbVPOr8J2MP2g+yu9Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+lTdQT2389VYFDw1T+Iq3x3/5NoHSTSk3vphatjTMZFaQ0g/JmVeDxUWD6Xdb0b+sxSSkPpYk69DD97XeUlJZD2M4b3H2WlXcqGRNpF/eSSjzBk/InTgy1WLl2T0lasVzJEW72w1pgiWYjzGY5yG+F9Dzn1NeGGhi65uT3DgWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lchYxtku; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lchYxtku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773326380; x=1804862380;
  h=date:from:to:cc:subject:message-id;
  bh=yGIJwNyyWxME9OE+gJZFWSEoQkbVPOr8J2MP2g+yu9Q=;
  b=lchYxtkuEpwebnTR95VTg0rEAmcwaGceaQ9fM6iUNeIK5QGE8xiYMJr9
   jQS9fZrYR2IdNpXFmeKuubLKBrRfK2Y2qmmF6zUsUd8qRMnlwQX2pZYZC
   JnUb6IBTkp5zRJuNrXRZhnAFYH+ZVONMgvfBT3uPKP3nxSR4EyCLZrQmk
   PMwNL/WLTVI/xmlMJXohPKmDUkE/HDp2430HvDE+joxBpUaDv9g4LYAke
   wujPtnidx/tWXSRKlcy+LUWneTXbMW+7hmrwiTMAgshTMYOrlmeJxl0bc
   iRGnJg/bgiwgUEfHzLstBYm/MHp4Twru1ZlsUXhjIxYRoijuTmqi2e6ZH
   A==;
X-CSE-ConnectionGUID: qSGKeyzXQqanCKUuA8353g==
X-CSE-MsgGUID: eNuR4f21Q3+/GpiTsk8J2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74297168"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74297168"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:39:40 -0700
X-CSE-ConnectionGUID: hX7Y48fzQQCjyyk8MlgRWA==
X-CSE-MsgGUID: 5DswXB3qTV6Lb8WxvxPm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220777000"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 07:39:38 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0hCJ-000000002ZL-0p2g;
	Thu, 12 Mar 2026 14:39:35 +0000
Date: Thu, 12 Mar 2026 22:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 14/14]
 drivers/dma-buf/dma-buf.c:399: warning: Function parameter or struct member
 'dmabuf_info' not described in 'dma_buf_account_task'
Message-ID: <202603122236.GJXfHep4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d6e2584f0a1d0497c4ecaba301c8e0f47c69f687
commit: f7d26609785ce56170645d56f306db38e8ba277a [14/14] ANDROID: Don't use current pointer for per-process dmabuf accounting
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603122236.GJXfHep4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603122236.GJXfHep4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603122236.GJXfHep4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:399: warning: Function parameter or struct member 'dmabuf_info' not described in 'dma_buf_account_task'
   drivers/dma-buf/dma-buf.c:399: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> drivers/dma-buf/dma-buf.c:435: warning: Function parameter or struct member 'dmabuf_info' not described in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:435: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:905: warning: Function parameter or struct member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:905: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +399 drivers/dma-buf/dma-buf.c

d50dd969464c6a4 T.J. Mercier 2025-07-22  384  
d50dd969464c6a4 T.J. Mercier 2025-07-22  385  /**
d50dd969464c6a4 T.J. Mercier 2025-07-22  386   * dma_buf_account_task - Account a dmabuf to a task
d50dd969464c6a4 T.J. Mercier 2025-07-22  387   * @dmabuf:	[in]	pointer to dma_buf
d50dd969464c6a4 T.J. Mercier 2025-07-22  388   * @task:	[in]	pointer to task_struct
d50dd969464c6a4 T.J. Mercier 2025-07-22  389   *
d50dd969464c6a4 T.J. Mercier 2025-07-22  390   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
d50dd969464c6a4 T.J. Mercier 2025-07-22  391   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
d50dd969464c6a4 T.J. Mercier 2025-07-22  392   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
d50dd969464c6a4 T.J. Mercier 2025-07-22  393   *
d50dd969464c6a4 T.J. Mercier 2025-07-22  394   * Return:
d50dd969464c6a4 T.J. Mercier 2025-07-22  395   * * 0 on success
d50dd969464c6a4 T.J. Mercier 2025-07-22  396   * * A negative error code upon error
d50dd969464c6a4 T.J. Mercier 2025-07-22  397   */
f7d26609785ce56 T.J. Mercier 2025-11-12  398  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
d50dd969464c6a4 T.J. Mercier 2025-07-22 @399  {
d50dd969464c6a4 T.J. Mercier 2025-07-22  400  	struct task_dma_buf_record *rec;
d50dd969464c6a4 T.J. Mercier 2025-07-22  401  
d50dd969464c6a4 T.J. Mercier 2025-07-22  402  	if (!dmabuf_info)
d50dd969464c6a4 T.J. Mercier 2025-07-22  403  		return 0;
d50dd969464c6a4 T.J. Mercier 2025-07-22  404  
d50dd969464c6a4 T.J. Mercier 2025-07-22  405  	if (!task_dmabuf_records_preload(1))
d50dd969464c6a4 T.J. Mercier 2025-07-22  406  		return -ENOMEM;
d50dd969464c6a4 T.J. Mercier 2025-07-22  407  
d50dd969464c6a4 T.J. Mercier 2025-07-22  408  	spin_lock(&dmabuf_info->lock);
d50dd969464c6a4 T.J. Mercier 2025-07-22  409  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
d50dd969464c6a4 T.J. Mercier 2025-07-22  410  	if (rec) {
d50dd969464c6a4 T.J. Mercier 2025-07-22  411  		++rec->refcnt;
d50dd969464c6a4 T.J. Mercier 2025-07-22  412  		trim_task_dmabuf_records_locked();
d50dd969464c6a4 T.J. Mercier 2025-07-22  413  	} else {
d50dd969464c6a4 T.J. Mercier 2025-07-22  414  		rec = alloc_task_dmabuf_record();
d50dd969464c6a4 T.J. Mercier 2025-07-22  415  		WARN_ON(!rec);
d50dd969464c6a4 T.J. Mercier 2025-07-22  416  		add_task_dmabuf_record(dmabuf_info, dmabuf, rec);
d50dd969464c6a4 T.J. Mercier 2025-07-22  417  	}
d50dd969464c6a4 T.J. Mercier 2025-07-22  418  	spin_unlock(&dmabuf_info->lock);
d50dd969464c6a4 T.J. Mercier 2025-07-22  419  	task_dmabuf_records_preload_end();
d50dd969464c6a4 T.J. Mercier 2025-07-22  420  
d50dd969464c6a4 T.J. Mercier 2025-07-22  421  	return 0;
d50dd969464c6a4 T.J. Mercier 2025-07-22  422  }
d50dd969464c6a4 T.J. Mercier 2025-07-22  423  
d50dd969464c6a4 T.J. Mercier 2025-07-22  424  /**
d50dd969464c6a4 T.J. Mercier 2025-07-22  425   * dma_buf_unaccount_task - Unaccount a dmabuf from a task
d50dd969464c6a4 T.J. Mercier 2025-07-22  426   * @dmabuf:	[in]	pointer to dma_buf
d50dd969464c6a4 T.J. Mercier 2025-07-22  427   * @task:	[in]	pointer to task_struct
d50dd969464c6a4 T.J. Mercier 2025-07-22  428   *
d50dd969464c6a4 T.J. Mercier 2025-07-22  429   * When a process closes a dmabuf file descriptor, or unmaps a dmabuf, this
d50dd969464c6a4 T.J. Mercier 2025-07-22  430   * function removes the provided @dmabuf attribution from the @task. When all
d50dd969464c6a4 T.J. Mercier 2025-07-22  431   * references to @dmabuf are removed from @task, the buffer's size is removed
d50dd969464c6a4 T.J. Mercier 2025-07-22  432   * from the task's dmabuf RSS.
d50dd969464c6a4 T.J. Mercier 2025-07-22  433   */
f7d26609785ce56 T.J. Mercier 2025-11-12  434  void dma_buf_unaccount_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
d50dd969464c6a4 T.J. Mercier 2025-07-22 @435  {
d50dd969464c6a4 T.J. Mercier 2025-07-22  436  	struct task_dma_buf_record *rec;
d50dd969464c6a4 T.J. Mercier 2025-07-22  437  
d50dd969464c6a4 T.J. Mercier 2025-07-22  438  	if (!dmabuf_info)
d50dd969464c6a4 T.J. Mercier 2025-07-22  439  		return;
d50dd969464c6a4 T.J. Mercier 2025-07-22  440  
d50dd969464c6a4 T.J. Mercier 2025-07-22  441  	spin_lock(&dmabuf_info->lock);
d50dd969464c6a4 T.J. Mercier 2025-07-22  442  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
d50dd969464c6a4 T.J. Mercier 2025-07-22  443  	if (rec) {
d50dd969464c6a4 T.J. Mercier 2025-07-22  444  		if (--rec->refcnt == 0) {
d50dd969464c6a4 T.J. Mercier 2025-07-22  445  			list_del(&rec->node);
d50dd969464c6a4 T.J. Mercier 2025-07-22  446  			dmabuf_info->dmabuf_count--;
d50dd969464c6a4 T.J. Mercier 2025-07-22  447  			dmabuf_info->rss -= dmabuf->size;
2913cc072097bc0 T.J. Mercier 2025-07-01  448  			trace_dmabuf_rss_stat(dmabuf_info->rss, -dmabuf->size, dmabuf);
45ae7f0b6b5f0ae T.J. Mercier 2025-07-08  449  			atomic64_dec(&dmabuf->nr_task_refs);
d50dd969464c6a4 T.J. Mercier 2025-07-22  450  		} else {
d50dd969464c6a4 T.J. Mercier 2025-07-22  451  			rec = NULL;
d50dd969464c6a4 T.J. Mercier 2025-07-22  452  		}
d50dd969464c6a4 T.J. Mercier 2025-07-22  453  	} else {
f7d26609785ce56 T.J. Mercier 2025-11-12  454  		pr_err("Could not find dmabuf %lu in unaccount\n",
f7d26609785ce56 T.J. Mercier 2025-11-12  455  		       file_inode(dmabuf->file)->i_ino);
d50dd969464c6a4 T.J. Mercier 2025-07-22  456  	}
d50dd969464c6a4 T.J. Mercier 2025-07-22  457  	spin_unlock(&dmabuf_info->lock);
d50dd969464c6a4 T.J. Mercier 2025-07-22  458  	if (rec)
d50dd969464c6a4 T.J. Mercier 2025-07-22  459  		free_task_dmabuf_record(rec);
d50dd969464c6a4 T.J. Mercier 2025-07-22  460  }
d50dd969464c6a4 T.J. Mercier 2025-07-22  461  

:::::: The code at line 399 was first introduced by commit
:::::: d50dd969464c6a44ff601c687c33f7b7f7e4ba53 ANDROID: Track per-process dmabuf RSS

:::::: TO: T.J. Mercier <tjmercier@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
