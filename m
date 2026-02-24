Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C931344031
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 22:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971102; cv=none; b=X06ZT9yLGVM71ToLr2KuRKIhQBz8Z9q5kPX7eOEIF3qLVn8nx1B8zxiqP+zOPC6f9iSAzf4if/zba8H4bKhMGkNIpXHRwU/EXO8hVXwh1ZGcsOnnmVt5Q6FRQbpmzbvQiPCMZKnYugLDk7VeKZiZbhzvh4skJTm56jJNG3gXsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971102; c=relaxed/simple;
	bh=HKMBHDuRNO40y4VPc/PTyK+g845RZj19GaUJzf6m4fA=;
	h=Date:From:Cc:Subject:Message-ID; b=qHDu5ycwxsAcaTs0xighigpAZrwR1pcajq8vmRVeH6WI0y8Bv5ekD23ocmEBfmajVcyGVaCXSeDf3lWe0q0elgbMondmzF8jHJHtvVm9CIs+10ziM6S3T2Wx2OymWLj8fJKv1p2xhbxbTFA/LnOvEGQ8JarRH1pNyv0ZYnq/qnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnQtyNO/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnQtyNO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771971101; x=1803507101;
  h=date:from:cc:subject:message-id;
  bh=HKMBHDuRNO40y4VPc/PTyK+g845RZj19GaUJzf6m4fA=;
  b=bnQtyNO//HfdghyBmX8FOeyWIhWEgTjfCHmVdYdG2wcKM8pHoTC53lQ5
   lhykbaKCXrvDWamq3fFkZLW/eCUxytkoTKPhyEg+lnXT2IR1BuA4xZFgU
   yjH8D/UiTGECJ8SVx3J5Dyh3f3XiqqDj7Hkh/dEiw918y6uYaUDCAHnWD
   Gtudgyz/Fs1qGqKXps0rk3EmTwp6XNZXAfhiTIUqcnKhjP+nM5zTOV79Y
   LMsH5zTCqS4c2ohsqVr4A95mYAHfcPgvPl3YVJquDoJqLmYV76rT2QCiE
   NLntBSGT0RUReDt691z8IXlHVO8MgAACyBT+b2+YWhyEuvkFwTo8VhOc6
   w==;
X-CSE-ConnectionGUID: 60h7uxhITb2dPIKBx4J9zw==
X-CSE-MsgGUID: LquPpMuRTp6i/5KQMnXQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76866630"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="76866630"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 14:11:39 -0800
X-CSE-ConnectionGUID: rSmCP3rKT3qswBtD+537iA==
X-CSE-MsgGUID: 5OBeJNhjT0uLyU4diq3Wzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="213799617"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2026 14:11:38 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv0cx-000000002Ud-3nUN;
	Tue, 24 Feb 2026 22:11:35 +0000
Date: Wed, 25 Feb 2026 06:10:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Subject: [drm-misc:for-linux-next 1/1]
 drivers/infiniband/core/uverbs_std_types_dmabuf.c:170:3: error: implicit
 declaration of function 'dma_buf_move_notify'; did you mean
 'dma_buf_free_sgt'?
Message-ID: <202602250602.9IwT6JNq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   645186bf86932c6b9deed2e564cffd09576ba9a4
commit: 8b85987d3cf50178f67618122d9f3bb202f62f42 [1/1] Merge drm/drm-next into drm-misc-next
config: arm-randconfig-002-20260225 (https://download.01.org/0day-ci/archive/20260225/202602250602.9IwT6JNq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250602.9IwT6JNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250602.9IwT6JNq-lkp@intel.com/

Note: the drm-misc/for-linux-next HEAD 645186bf86932c6b9deed2e564cffd09576ba9a4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/infiniband/core/uverbs_std_types_dmabuf.c: In function 'uverbs_dmabuf_fd_destroy_uobj':
>> drivers/infiniband/core/uverbs_std_types_dmabuf.c:170:3: error: implicit declaration of function 'dma_buf_move_notify'; did you mean 'dma_buf_free_sgt'? [-Werror=implicit-function-declaration]
      dma_buf_move_notify(uverbs_dmabuf->dmabuf);
      ^~~~~~~~~~~~~~~~~~~
      dma_buf_free_sgt
   cc1: some warnings being treated as errors
--
   drivers/infiniband/core/ib_core_uverbs.c: In function 'rdma_user_mmap_entry_remove':
>> drivers/infiniband/core/ib_core_uverbs.c:249:3: error: implicit declaration of function 'dma_buf_move_notify'; did you mean 'dma_buf_iter_next'? [-Werror=implicit-function-declaration]
      dma_buf_move_notify(uverbs_dmabuf->dmabuf);
      ^~~~~~~~~~~~~~~~~~~
      dma_buf_iter_next
   cc1: some warnings being treated as errors


vim +170 drivers/infiniband/core/uverbs_std_types_dmabuf.c

0ac6f4056c4a25 Yishai Hadas 2026-02-01  147  
0ac6f4056c4a25 Yishai Hadas 2026-02-01  148  DECLARE_UVERBS_NAMED_METHOD(
0ac6f4056c4a25 Yishai Hadas 2026-02-01  149  	UVERBS_METHOD_DMABUF_ALLOC,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  150  	UVERBS_ATTR_FD(UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  151  		       UVERBS_OBJECT_DMABUF,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  152  		       UVERBS_ACCESS_NEW,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  153  		       UA_MANDATORY),
0ac6f4056c4a25 Yishai Hadas 2026-02-01  154  	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  155  			   UVERBS_ATTR_TYPE(u64),
0ac6f4056c4a25 Yishai Hadas 2026-02-01  156  			   UA_MANDATORY));
0ac6f4056c4a25 Yishai Hadas 2026-02-01  157  
0ac6f4056c4a25 Yishai Hadas 2026-02-01  158  static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  159  					  enum rdma_remove_reason why)
0ac6f4056c4a25 Yishai Hadas 2026-02-01  160  {
0ac6f4056c4a25 Yishai Hadas 2026-02-01  161  	struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
0ac6f4056c4a25 Yishai Hadas 2026-02-01  162  		container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  163  	bool wait_for_comp = false;
0ac6f4056c4a25 Yishai Hadas 2026-02-01  164  
0ac6f4056c4a25 Yishai Hadas 2026-02-01  165  	mutex_lock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  166  	dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  167  	if (!uverbs_dmabuf->revoked) {
0ac6f4056c4a25 Yishai Hadas 2026-02-01  168  		uverbs_dmabuf->revoked = true;
0ac6f4056c4a25 Yishai Hadas 2026-02-01  169  		list_del(&uverbs_dmabuf->dmabufs_elm);
0ac6f4056c4a25 Yishai Hadas 2026-02-01 @170  		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  171  		dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  172  				      DMA_RESV_USAGE_BOOKKEEP, false,
0ac6f4056c4a25 Yishai Hadas 2026-02-01  173  				      MAX_SCHEDULE_TIMEOUT);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  174  		wait_for_comp = true;
0ac6f4056c4a25 Yishai Hadas 2026-02-01  175  	}
0ac6f4056c4a25 Yishai Hadas 2026-02-01  176  	dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  177  	if (wait_for_comp) {
0ac6f4056c4a25 Yishai Hadas 2026-02-01  178  		kref_put(&uverbs_dmabuf->kref, ib_uverbs_dmabuf_done);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  179  		/* Let's wait till all DMA unmap are completed. */
0ac6f4056c4a25 Yishai Hadas 2026-02-01  180  		wait_for_completion(&uverbs_dmabuf->comp);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  181  	}
0ac6f4056c4a25 Yishai Hadas 2026-02-01  182  	mutex_unlock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  183  
0ac6f4056c4a25 Yishai Hadas 2026-02-01  184  	/* Matches the get done as part of pgoff_to_mmap_entry() */
0ac6f4056c4a25 Yishai Hadas 2026-02-01  185  	rdma_user_mmap_entry_put(uverbs_dmabuf->mmap_entry);
0ac6f4056c4a25 Yishai Hadas 2026-02-01  186  }
0ac6f4056c4a25 Yishai Hadas 2026-02-01  187  

:::::: The code at line 170 was first introduced by commit
:::::: 0ac6f4056c4a257f4b230b910e3e6fee6c6fc9b9 RDMA/uverbs: Add DMABUF object type and operations

:::::: TO: Yishai Hadas <yishaih@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
