Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E261514FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 02:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729910867; cv=none; b=tP+HIfVUgaqT/ugkOFKZH4h6nWPdygqs8mA7kf/lOZ8H0JFWq9/3a0kBK7l3NdHrbPx+yzsx+Lc3m8i9E1hBeORDpmOH0y4yPJEcz58iUjk7pvxHbAFXql3c7xFKFDI89lnvRIEeA3VkBulWEMq8Wa31iPT9Y7VwF9VMqX0putI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729910867; c=relaxed/simple;
	bh=UjmoZPWQseRiN2WJg43NfR5crqueKaRGF74Eh3+WzTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8I6mXOIlQn5K7PziidDPSE3jcX8SkUgdMp1u5Pbi2hr7iiuTWQNN5gcNwVh5z+yjzRVcsDhXpPhhduwrD3zXLDfTwB+ZlQbQBCArU48CBLuCQ+EzkTbeSXNynQZFGw7hD2nJ2HNXz+6YzEydLIb5snU88ljFzykKWz2nbTnApM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwTwMHWv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwTwMHWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729910865; x=1761446865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjmoZPWQseRiN2WJg43NfR5crqueKaRGF74Eh3+WzTk=;
  b=XwTwMHWvj05kVhgbYIxJdBdMyN96+dGCDPbrRGxf3YqJwIzlfM3+ZvSG
   8DDhSz7KivM8c1vRNaR8dpNg2Q5go9c+IDA7dQET0WLri+n0apPVqFj9H
   S8/gu2JHJk7MPfq+Yx/EVgc1cYfPneFOoH3moDSdQEd4WGTAdxcUAOPKF
   T6W2KFZVeSoJO+m8JfmG3P0Z3vf6kvHAlyMyisyofPDVgtOHJ+NjakOlu
   NMqNezo+j+dCTkyNOlPvFwSvF1vGK5yGu1TbbqA8YrTEvRBbMghhqIi9t
   L6q5/81d0g15FGrXuDS0ouipEbd5zmYI8zB3BybQtI8ineSSaxH/rpxqf
   g==;
X-CSE-ConnectionGUID: mySmrrvxRrOyDNfr/TWpuA==
X-CSE-MsgGUID: kTg3KiExSRWxpKr7TwrJDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29807801"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29807801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 19:47:45 -0700
X-CSE-ConnectionGUID: +n1f36BwR5m1JdWDDAT0dg==
X-CSE-MsgGUID: UPqPDXTqRROdGWCowCYjRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="86205205"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2024 19:47:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Wq5-000ZCK-0Y;
	Sat, 26 Oct 2024 02:47:41 +0000
Date: Sat, 26 Oct 2024 10:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5e 71/102] drivers/vhost/vhost.c:1356:17:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202410261029.dVo9wFXO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5e
head:   95ff6ff44a0206ea02936387ab66f6c39cfd20c7
commit: dc75936e9a1db05417181e3707b9179624d2b689 [71/102] dyndbg: move flags field to a new structure
config: i386-randconfig-061-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261029.dVo9wFXO-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261029.dVo9wFXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261029.dVo9wFXO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vhost/vhost.c:1356:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1356:17: sparse:   also defined here
   drivers/vhost/vhost.c:1364:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1364:17: sparse:   also defined here
>> drivers/vhost/vhost.c:1356:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1356:17: sparse:   also defined here
   drivers/vhost/vhost.c:1364:17: sparse: sparse: Initializer entry defined twice
   drivers/vhost/vhost.c:1364:17: sparse:   also defined here
   drivers/vhost/vhost.c: note: in included file (through include/linux/wait.h, include/linux/eventfd.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1356 drivers/vhost/vhost.c

86a07da34380bc Jason Wang         2018-12-13  1348  
7ad4723976672b Michael S. Tsirkin 2024-04-30  1349  static inline int vhost_get_avail_idx(struct vhost_virtqueue *vq)
7b5d753ebc22c5 Jason Wang         2019-05-24  1350  {
7ad4723976672b Michael S. Tsirkin 2024-04-30  1351  	__virtio16 idx;
7ad4723976672b Michael S. Tsirkin 2024-04-30  1352  	int r;
7ad4723976672b Michael S. Tsirkin 2024-04-30  1353  
7ad4723976672b Michael S. Tsirkin 2024-04-30  1354  	r = vhost_get_avail(vq, idx, &vq->avail->idx);
7ad4723976672b Michael S. Tsirkin 2024-04-30  1355  	if (unlikely(r < 0)) {
7ad4723976672b Michael S. Tsirkin 2024-04-30 @1356  		vq_err(vq, "Failed to access available index at %p (%d)\n",
7ad4723976672b Michael S. Tsirkin 2024-04-30  1357  		       &vq->avail->idx, r);
7ad4723976672b Michael S. Tsirkin 2024-04-30  1358  		return r;
7ad4723976672b Michael S. Tsirkin 2024-04-30  1359  	}
7ad4723976672b Michael S. Tsirkin 2024-04-30  1360  
7ad4723976672b Michael S. Tsirkin 2024-04-30  1361  	/* Check it isn't doing very strange thing with available indexes */
7ad4723976672b Michael S. Tsirkin 2024-04-30  1362  	vq->avail_idx = vhost16_to_cpu(vq, idx);
7ad4723976672b Michael S. Tsirkin 2024-04-30  1363  	if (unlikely((u16)(vq->avail_idx - vq->last_avail_idx) > vq->num)) {
7ad4723976672b Michael S. Tsirkin 2024-04-30  1364  		vq_err(vq, "Invalid available index change from %u to %u",
7ad4723976672b Michael S. Tsirkin 2024-04-30  1365  		       vq->last_avail_idx, vq->avail_idx);
7ad4723976672b Michael S. Tsirkin 2024-04-30  1366  		return -EINVAL;
7ad4723976672b Michael S. Tsirkin 2024-04-30  1367  	}
7ad4723976672b Michael S. Tsirkin 2024-04-30  1368  
7ad4723976672b Michael S. Tsirkin 2024-04-30  1369  	/* We're done if there is nothing new */
7ad4723976672b Michael S. Tsirkin 2024-04-30  1370  	if (vq->avail_idx == vq->last_avail_idx)
7ad4723976672b Michael S. Tsirkin 2024-04-30  1371  		return 0;
7ad4723976672b Michael S. Tsirkin 2024-04-30  1372  
7ad4723976672b Michael S. Tsirkin 2024-04-30  1373  	/*
7ad4723976672b Michael S. Tsirkin 2024-04-30  1374  	 * We updated vq->avail_idx so we need a memory barrier between
7ad4723976672b Michael S. Tsirkin 2024-04-30  1375  	 * the index read above and the caller reading avail ring entries.
7ad4723976672b Michael S. Tsirkin 2024-04-30  1376  	 */
7ad4723976672b Michael S. Tsirkin 2024-04-30  1377  	smp_rmb();
7ad4723976672b Michael S. Tsirkin 2024-04-30  1378  	return 1;
7b5d753ebc22c5 Jason Wang         2019-05-24  1379  }
7b5d753ebc22c5 Jason Wang         2019-05-24  1380  

:::::: The code at line 1356 was first introduced by commit
:::::: 7ad4723976672b7d359403a555e0ce5c75529153 vhost: move smp_rmb() into vhost_get_avail_idx()

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
