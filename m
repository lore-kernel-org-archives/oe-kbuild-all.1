Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028849;
	b=xlCQ3yTfdajrsvIbnUyPAsYtc/P1PpxWtZxpCkbmk2Bf4zflvETjBwGAWlwdYUj4naDo
	 B9w0ZxEu87ygfCL492aflxWSx8mxiCBTc8thIjLOFhh7tndg+CA6ebsH8TjHeLIV1s4yu
	 7JzY9P9TYsjcF/aOZXKajwn/DEEjjkog9HUA7r2fNlzOkOfnStrQukk/QSnA/OdiSbZDA
	 s3qssh+S0L2Fx4WgHqstIJQU5dS4nttMgWP+ve8pDK7yD1bnX2gyFTt3CxVkEpc+7Tg2N
	 0WNutgVqcU+t+vc7z0zt4vudpV7gxlAcyxi8IwgcUxdvuNNzeYLQHOs1w6I0UPUepxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028849;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JokXOSVJ0kDC3l3J7oZ9H1/tMUowTeCl7xAwW+Wq6HI=;
	b=o+sGv9WVjZkk4k8LnXVob9Lb67eOldgLYvixqfUAgbT9rNtBUqJu98edRNhUbdKsg/vO
	 yhENrn9lX2JJxEzKFrDrgu9aQ/3CwKaVBUr31FJB/yL1Ykl1AWJy4EaAsy8dofAhgabPX
	 T8DbaAWCZzaAhlaFAndZCb8xPKLpCg3HukN0NYnlgFZiBJ+Dk/DQWerlc0YF1T+SP3nPI
	 2u+ilOD1TD0HbDYIDhpHfuwJtBtiSmkaqDNh5Db1eOv6EkP/1+c2+3BjoMpktu9z18vIu
	 SYATC1OyO2iyzhDgUS1ZrMOFuufC0olsP3xWMLGv0zIxDXyu/CUBKMDHE4XaOSTlEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DY1Oe4XE;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA77606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 15:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DY1Oe4XE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793028848; x=1824564848;
  h=date:from:to:cc:subject:message-id;
  bh=SNhvMEo24dsQRtXi9duQMV7hQVnYjlT5nJ4fagYmQaE=;
  b=DY1Oe4XEIoOh4Ge0Q45nr3Lt5eXHBuuy4udME1rMC4P4QwaFI2+bJOES
   +yJquRBJIkA5o/ArlcL7bRSUJ1tjB7QeQ6+bYMN6crZdB39d7PXn5MDKC
   yha9Egqs9+KSmm6R1BsP+zzOU4Ae76iw3XXgUs+wB2+5IwBQeazVZdYIv
   rA7gqWEQ2btCLHvZuX0QWnabayvjy00YqyXVidhV6xKDEeNN5NfSt2KE2
   0Z8coLCpS2ZvRppRq9GKggsnHsa3cSMZDMN9FKrt7xoy1lxNB/Fg/TCjk
   LRmpf25bnC/KUhXaLTfdagHxW4nRS52w9B7/i2oI5mXnBGZySj7nIvCh2
   g==;
X-CSE-ConnectionGUID: 3+9KJMRwSd+akvj0XiZWgQ==
X-CSE-MsgGUID: jkEb3VFiT+KMAXP7bRojOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1593628"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1593628"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:34:08 -0700
X-CSE-ConnectionGUID: 8i6PkhvWTW+MsDGC/Ygb0A==
X-CSE-MsgGUID: KmZ3fE4YTBe3To6KVNdRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4682854"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 08:34:07 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLMi4-0000000049T-3pon;
	Mon, 26 Oct 2026 15:34:04 +0000
Date: Mon, 26 Oct 2026 16:33:39 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 85/133]
 drivers/infiniband/core/uverbs_std_types_dmabuf.c:194:1: warning: label
 'unlock' defined but not used
Message-ID: <202610261603.43zmLD7S-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   09aab91c2fcb166bfe35c0f9c2c5b6b960722087
commit: ed41e5171bfb2fbf79e518ef59bfebe2446d37a7 [85/133] RDMA/core: Check the dma_resv_lock() return value
config: csky-randconfig-2001-20261026 (https://download.01.org/0day-ci/archive/20261026/202610261603.43zmLD7S-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261603.43zmLD7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261603.43zmLD7S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/core/uverbs_std_types_dmabuf.c: In function 'uverbs_dmabuf_fd_destroy_uobj':
>> drivers/infiniband/core/uverbs_std_types_dmabuf.c:194:1: warning: label 'unlock' defined but not used [-Wunused-label]
     194 | unlock:
         | ^~~~~~


vim +/unlock +194 drivers/infiniband/core/uverbs_std_types_dmabuf.c

   172	
   173	DECLARE_UVERBS_NAMED_METHOD(
   174		UVERBS_METHOD_DMABUF_ALLOC,
   175		UVERBS_ATTR_FD(UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
   176			       UVERBS_OBJECT_DMABUF,
   177			       UVERBS_ACCESS_NEW,
   178			       UA_MANDATORY),
   179		UVERBS_ATTR_PTR_IN(UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
   180				   UVERBS_ATTR_TYPE(u64),
   181				   UA_MANDATORY));
   182	
   183	static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
   184						  enum rdma_remove_reason why)
   185	{
   186		struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
   187			container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
   188	
   189		mutex_lock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
   190		if (!uverbs_dmabuf->revoked) {
   191			list_del(&uverbs_dmabuf->dmabufs_elm);
   192			ib_uverbs_dmabuf_revoke(uverbs_dmabuf);
   193		}
 > 194	unlock:
   195		mutex_unlock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
   196	
   197		/* Matches the get done as part of pgoff_to_mmap_entry() */
   198		rdma_user_mmap_entry_put(uverbs_dmabuf->mmap_entry);
   199	}
   200	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
