Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9883A1D02
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121750; cv=none; b=MbZHeBO8PHBevSMsuah8qvOLk6P7bi90ypHALLi17bggkmcf9N3stD+ErVUau60lsbhKcXXfehgeJ0TiSOrz3n6BifKoIGRsa+psnAbG8ephF7kJ2/6hTqSYZzUgHXQdHpxv/G43oXiWZRn0sc4BXNvfG5sNlSuMu67zbZtWHyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121750; c=relaxed/simple;
	bh=AaW5HliYs1b8iwNxoG4pwfmOFbfOZ7bN+E0xgHGDr/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rvdRKz4z7tgh/XQ2/HHRGW20F07/GAla5bKMxYKd7HIsxF23Kysi0tbZxRCSKASQ8UXh/ZY8MBj+UycKCbUBDAonlo44j8Cqhl5aBJ09WVcG1rNSeGA1mMa1CCJXe+w4ZMyziTBYYmINoJYlDoy3z3ZQY4d6V8oPyOHUB/l6FR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLKYfZz+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLKYfZz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782121749; x=1813657749;
  h=date:from:to:cc:subject:message-id;
  bh=AaW5HliYs1b8iwNxoG4pwfmOFbfOZ7bN+E0xgHGDr/Y=;
  b=KLKYfZz+3toTcaUwTNnlGQiAJZLUMhIJxwBKkPaLu1LZtf+zQCqpFBj7
   WcofzhQfIMWwt0yFlP2G/c/4cv9GhGiVQFqOuZmTLztyvSvOgv/ebL5Cu
   KZ+2Dw/7Jo/n9XXQePZzBs87TPT/QUO6lQ2PHiTzKrxqT6BN75NeveiU+
   rObI9Fs6tAenEKn38/vNE6DIPIHpPfI4iYr1rn9htpeG0QoTKYSRSlChF
   RR1yeskwKMt75D7l7EtaEce55MjA62OPkJR9KNFdavGxDzaybx0ePQFWm
   fGyKffDLvTowYJz+toGjbl9FuAnCR3FfYPa3uXznxqkvR1uwdBqF/nTmm
   g==;
X-CSE-ConnectionGUID: 9J4uk7waSUWbrp8/OuRjNg==
X-CSE-MsgGUID: Bv6Gp3XVSiGlLu0Pm8REhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70361588"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="70361588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 02:49:06 -0700
X-CSE-ConnectionGUID: BEuqw1R0QdGKhgvzXIImvg==
X-CSE-MsgGUID: +32laX4/Qwy7dRhmymaoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="248299301"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Jun 2026 02:49:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbbH3-000000000ur-3vgk;
	Mon, 22 Jun 2026 09:49:01 +0000
Date: Mon, 22 Jun 2026 17:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/dma-buf/dma-buf.c:443: warning: Function parameter or struct member
 'dmabuf_info' not described in 'dma_buf_account_task'
Message-ID: <202606221731.lS9CWdUD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   74c43557c8aed4002d058c4e88c768a6086df9c2
commit: 0f4908d05ae47a5455d6699296a463859b6eb5e3 [1/1] BACKPORT: ANDROID: Fix 32-bit kernelci build break
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260622/202606221731.lS9CWdUD-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221731.lS9CWdUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221731.lS9CWdUD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:443: warning: Function parameter or struct member 'dmabuf_info' not described in 'dma_buf_account_task'
   drivers/dma-buf/dma-buf.c:443: warning: Excess function parameter 'task' description in 'dma_buf_account_task'
>> drivers/dma-buf/dma-buf.c:458: warning: Function parameter or struct member 'dmabuf_info' not described in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:458: warning: Excess function parameter 'task' description in 'dma_buf_unaccount_task'
   drivers/dma-buf/dma-buf.c:1006: warning: Function parameter or struct member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:1006: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +443 drivers/dma-buf/dma-buf.c

d9e55a883822eb T.J. Mercier       2025-12-30  428  
d9e55a883822eb T.J. Mercier       2025-12-30  429  /**
d9e55a883822eb T.J. Mercier       2025-12-30  430   * dma_buf_account_task - Account a dmabuf to a task
d9e55a883822eb T.J. Mercier       2025-12-30  431   * @dmabuf:	[in]	pointer to dma_buf
d9e55a883822eb T.J. Mercier       2025-12-30  432   * @task:	[in]	pointer to task_struct
d9e55a883822eb T.J. Mercier       2025-12-30  433   *
d9e55a883822eb T.J. Mercier       2025-12-30  434   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
d9e55a883822eb T.J. Mercier       2025-12-30  435   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
d9e55a883822eb T.J. Mercier       2025-12-30  436   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
d9e55a883822eb T.J. Mercier       2025-12-30  437   *
d9e55a883822eb T.J. Mercier       2025-12-30  438   * Return:
d9e55a883822eb T.J. Mercier       2025-12-30  439   * * 0 on success
d9e55a883822eb T.J. Mercier       2025-12-30  440   * * A negative error code upon error
d9e55a883822eb T.J. Mercier       2025-12-30  441   */
d9e55a883822eb T.J. Mercier       2025-12-30  442  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
d9e55a883822eb T.J. Mercier       2025-12-30 @443  {
d9e55a883822eb T.J. Mercier       2025-12-30  444  	return __dma_buf_account_task(dmabuf, dmabuf_info, true);
d50dd969464c6a T.J. Mercier       2025-07-22  445  }
d50dd969464c6a T.J. Mercier       2025-07-22  446  
d50dd969464c6a T.J. Mercier       2025-07-22  447  /**
d50dd969464c6a T.J. Mercier       2025-07-22  448   * dma_buf_unaccount_task - Unaccount a dmabuf from a task
d50dd969464c6a T.J. Mercier       2025-07-22  449   * @dmabuf:	[in]	pointer to dma_buf
d50dd969464c6a T.J. Mercier       2025-07-22  450   * @task:	[in]	pointer to task_struct
d50dd969464c6a T.J. Mercier       2025-07-22  451   *
d50dd969464c6a T.J. Mercier       2025-07-22  452   * When a process closes a dmabuf file descriptor, or unmaps a dmabuf, this
d50dd969464c6a T.J. Mercier       2025-07-22  453   * function removes the provided @dmabuf attribution from the @task. When all
d50dd969464c6a T.J. Mercier       2025-07-22  454   * references to @dmabuf are removed from @task, the buffer's size is removed
d50dd969464c6a T.J. Mercier       2025-07-22  455   * from the task's dmabuf RSS.
d50dd969464c6a T.J. Mercier       2025-07-22  456   */
f7d26609785ce5 T.J. Mercier       2025-11-12  457  void dma_buf_unaccount_task(struct dma_buf *dmabuf, struct task_dma_buf_info *dmabuf_info)
d50dd969464c6a T.J. Mercier       2025-07-22 @458  {
d50dd969464c6a T.J. Mercier       2025-07-22  459  	struct task_dma_buf_record *rec;
d50dd969464c6a T.J. Mercier       2025-07-22  460  
a96b41a4e0bc09 Suren Baghdasaryan 2025-08-01  461  	if (!static_key_enabled(&dmabuf_accounting_key))
a96b41a4e0bc09 Suren Baghdasaryan 2025-08-01  462  		return;
a96b41a4e0bc09 Suren Baghdasaryan 2025-08-01  463  
d50dd969464c6a T.J. Mercier       2025-07-22  464  	if (!dmabuf_info)
d50dd969464c6a T.J. Mercier       2025-07-22  465  		return;
d50dd969464c6a T.J. Mercier       2025-07-22  466  
d50dd969464c6a T.J. Mercier       2025-07-22  467  	spin_lock(&dmabuf_info->lock);
d50dd969464c6a T.J. Mercier       2025-07-22  468  	rec = find_task_dmabuf_record(dmabuf_info, dmabuf);
d50dd969464c6a T.J. Mercier       2025-07-22  469  	if (rec) {
d50dd969464c6a T.J. Mercier       2025-07-22  470  		if (--rec->refcnt == 0) {
d50dd969464c6a T.J. Mercier       2025-07-22  471  			list_del(&rec->node);
d50dd969464c6a T.J. Mercier       2025-07-22  472  			dmabuf_info->dmabuf_count--;
d50dd969464c6a T.J. Mercier       2025-07-22  473  			dmabuf_info->rss -= dmabuf->size;
2913cc072097bc T.J. Mercier       2025-07-01  474  			trace_dmabuf_rss_stat(dmabuf_info->rss, -dmabuf->size, dmabuf);
45ae7f0b6b5f0a T.J. Mercier       2025-07-08  475  			atomic64_dec(&dmabuf->nr_task_refs);
d50dd969464c6a T.J. Mercier       2025-07-22  476  		} else {
d50dd969464c6a T.J. Mercier       2025-07-22  477  			rec = NULL;
d50dd969464c6a T.J. Mercier       2025-07-22  478  		}
d50dd969464c6a T.J. Mercier       2025-07-22  479  	} else {
f7d26609785ce5 T.J. Mercier       2025-11-12  480  		pr_err("Could not find dmabuf %lu in unaccount\n",
f7d26609785ce5 T.J. Mercier       2025-11-12  481  		       file_inode(dmabuf->file)->i_ino);
d50dd969464c6a T.J. Mercier       2025-07-22  482  	}
d50dd969464c6a T.J. Mercier       2025-07-22  483  	spin_unlock(&dmabuf_info->lock);
d50dd969464c6a T.J. Mercier       2025-07-22  484  	if (rec)
d50dd969464c6a T.J. Mercier       2025-07-22  485  		free_task_dmabuf_record(rec);
d50dd969464c6a T.J. Mercier       2025-07-22  486  }
d50dd969464c6a T.J. Mercier       2025-07-22  487  

:::::: The code at line 443 was first introduced by commit
:::::: d9e55a883822eb50a6c26cc8603007c3c7b5b99d ANDROID: Don't allocate while atomic in dma_buf_begin_new_exec

:::::: TO: T.J. Mercier <tjmercier@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
