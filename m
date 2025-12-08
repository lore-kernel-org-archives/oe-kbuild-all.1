Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F071243964
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765210362; cv=none; b=HsVUc55J5COaE3l0118o9xMcd7IFFtN30WALYvZCFJ6MqUS8hBLYdpgZpCD6amDq+EwD/3oLWDYstq6xCVV9KW01sWXnNK1njt13CsFd9ovtuYgkaljUVXB62XGPcxUUzUc0LQfHggcJm9w4WdsAiGEUQnyxFhQuXAu4D7fDaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765210362; c=relaxed/simple;
	bh=hLwQiBt2bEFV1yPHmLgCOjdf77X7duhvCgqqJTc68Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKOo5UcmE5xG/ydIhEKlo0aKV4dfhRn3YLPhzbKEH+1cPYuikOqWlXzMz4Qyy+UKDL5FTZBL+BcRnEdMZUEHAZWQ9MvijSl/0vK3uxmwqaE5Zllo8lhXIoygoFhR8LUyZtG4ez/FahCHB2g3hzUmv/+5U3NAJJQg3NGJSs4Lkqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgOQJ3GO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgOQJ3GO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765210360; x=1796746360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLwQiBt2bEFV1yPHmLgCOjdf77X7duhvCgqqJTc68Ns=;
  b=mgOQJ3GOCTV9Hvu7l68QOL3cCTSM8178JKQjdMx95IviwKOdLHWTCgn5
   4GEB1cClJOs2AoHWDjW6FEhIyjC5UgxpT4JJltj2vziULRG4jM2Xwr9HW
   Bxh+EUqWO8Nr+HGlMeqLQvblwCICNhIpnbCFqxcUVQeqQBVg9slXAkPGY
   05NH5RxcjO+Yo9AZuk/GpF1FUfOrdygX5vnMAYUTCFFhfyHdvQW70vpd0
   OAsjKaETrQ5T11nRhpjh4MdXYhIZcSfjw2Cfezj+AVG9ZXULhCTXk4VDi
   8oC5p58iaprxRhvCLF4BNA5GcmRaMS8CAIVuIyzTQLhZUpkyPR7ig2XgZ
   A==;
X-CSE-ConnectionGUID: kaktm6Y+ThClNbqzWIgoHA==
X-CSE-MsgGUID: fxr4U62pTAmMX6S6Zr5erw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78619328"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="78619328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:12:39 -0800
X-CSE-ConnectionGUID: 0YZg5J2JS/61M/fcH84IKQ==
X-CSE-MsgGUID: hnY+rX2vSZS9xoiOROZ2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="196738289"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2025 08:12:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSdql-000000000ZV-2TCy;
	Mon, 08 Dec 2025 16:12:35 +0000
Date: Tue, 9 Dec 2025 00:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] mm/gmem.c:383:13: warning: unused
 variable 'nid'
Message-ID: <202512090002.kbElJ2I7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: 18b5064b5892580f89d7eca015f884ce10190bac [3493/3493] gmem: hmemcpy should use dma for phy addr
config: x86_64-randconfig-161-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090002.kbElJ2I7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090002.kbElJ2I7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090002.kbElJ2I7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/gmem.c: In function 'gm_as_attach':
>> mm/gmem.c:383:13: warning: unused variable 'nid' [-Wunused-variable]
     383 |         int nid;
         |             ^~~


vim +/nid +383 mm/gmem.c

380709c322aaa3 Cunshu Ni 2025-11-01  378  
380709c322aaa3 Cunshu Ni 2025-11-01  379  int gm_as_attach(struct gm_as *as, struct gm_dev *dev,
380709c322aaa3 Cunshu Ni 2025-11-01  380  			bool activate, struct gm_context **out_ctx)
380709c322aaa3 Cunshu Ni 2025-11-01  381  {
380709c322aaa3 Cunshu Ni 2025-11-01  382  	struct gm_context *ctx;
380709c322aaa3 Cunshu Ni 2025-11-01 @383  	int nid;
380709c322aaa3 Cunshu Ni 2025-11-01  384  
380709c322aaa3 Cunshu Ni 2025-11-01  385  	ctx = kmem_cache_alloc(gm_ctx_cache, GFP_KERNEL);
380709c322aaa3 Cunshu Ni 2025-11-01  386  	if (!ctx)
380709c322aaa3 Cunshu Ni 2025-11-01  387  		return -ENOMEM;
380709c322aaa3 Cunshu Ni 2025-11-01  388  
380709c322aaa3 Cunshu Ni 2025-11-01  389  	ctx->as = as;
380709c322aaa3 Cunshu Ni 2025-11-01  390  	ctx->dev = dev;
380709c322aaa3 Cunshu Ni 2025-11-01  391  
380709c322aaa3 Cunshu Ni 2025-11-01  392  	INIT_LIST_HEAD(&ctx->gm_dev_link);
380709c322aaa3 Cunshu Ni 2025-11-01  393  	INIT_LIST_HEAD(&ctx->gm_as_link);
380709c322aaa3 Cunshu Ni 2025-11-01  394  
380709c322aaa3 Cunshu Ni 2025-11-01  395  	if (!list_empty(&as->gm_ctx_list)) {
380709c322aaa3 Cunshu Ni 2025-11-01  396  		struct list_head *old_node;
380709c322aaa3 Cunshu Ni 2025-11-01  397  		struct gm_context *old_ctx;
380709c322aaa3 Cunshu Ni 2025-11-01  398  
380709c322aaa3 Cunshu Ni 2025-11-01  399  		old_node = as->gm_ctx_list.prev;
380709c322aaa3 Cunshu Ni 2025-11-01  400  		list_del_init(old_node);
380709c322aaa3 Cunshu Ni 2025-11-01  401  		old_ctx = list_entry(old_node, struct gm_context, gm_as_link);
380709c322aaa3 Cunshu Ni 2025-11-01  402  		kfree(old_ctx);
380709c322aaa3 Cunshu Ni 2025-11-01  403  	}
380709c322aaa3 Cunshu Ni 2025-11-01  404  
380709c322aaa3 Cunshu Ni 2025-11-01  405  	list_add_tail(&dev->gm_ctx_list, &ctx->gm_dev_link);
380709c322aaa3 Cunshu Ni 2025-11-01  406  	list_add_tail(&ctx->gm_as_link, &as->gm_ctx_list);
380709c322aaa3 Cunshu Ni 2025-11-01  407  
380709c322aaa3 Cunshu Ni 2025-11-01  408  	if (activate) {
380709c322aaa3 Cunshu Ni 2025-11-01  409  		/*
380709c322aaa3 Cunshu Ni 2025-11-01  410  		 * Here we should really have a callback function to perform the context switch
380709c322aaa3 Cunshu Ni 2025-11-01  411  		 * for the hardware. E.g. in x86 this function is effectively
380709c322aaa3 Cunshu Ni 2025-11-01  412  		 * flushing the CR3 value. Currently we do not care time-sliced context switch,
380709c322aaa3 Cunshu Ni 2025-11-01  413  		 * unless someone wants to support it.
380709c322aaa3 Cunshu Ni 2025-11-01  414  		 */
380709c322aaa3 Cunshu Ni 2025-11-01  415  		dev->current_ctx = ctx;
380709c322aaa3 Cunshu Ni 2025-11-01  416  	}
380709c322aaa3 Cunshu Ni 2025-11-01  417  	*out_ctx = ctx;
380709c322aaa3 Cunshu Ni 2025-11-01  418  
380709c322aaa3 Cunshu Ni 2025-11-01  419  	/*
380709c322aaa3 Cunshu Ni 2025-11-01  420  	 * gm_as_attach will be used to attach device to process address space.
380709c322aaa3 Cunshu Ni 2025-11-01  421  	 * Handle this case and add hnodes registered by device to process mems_allowed.
380709c322aaa3 Cunshu Ni 2025-11-01  422  	 */
18b5064b589258 Ni Cunshu 2025-12-08  423  #ifdef CONFIG_CPUSETS
380709c322aaa3 Cunshu Ni 2025-11-01  424  	for_each_node_mask(nid, dev->registered_hnodes)
380709c322aaa3 Cunshu Ni 2025-11-01  425  		node_set(nid, current->mems_allowed);
18b5064b589258 Ni Cunshu 2025-12-08  426  #endif
380709c322aaa3 Cunshu Ni 2025-11-01  427  	return 0;
380709c322aaa3 Cunshu Ni 2025-11-01  428  }
380709c322aaa3 Cunshu Ni 2025-11-01  429  EXPORT_SYMBOL_GPL(gm_as_attach);
2ce9e864fa288b Cunshu Ni 2025-11-02  430  

:::::: The code at line 383 was first introduced by commit
:::::: 380709c322aaa306b5ac3c278a0700043f7d33e2 gmem: prepare config, boot parameter, vma flag and basic GMEM related structs

:::::: TO: Cunshu Ni <nicunshu@huawei.com>
:::::: CC: zhangjian <zhangjian496@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
