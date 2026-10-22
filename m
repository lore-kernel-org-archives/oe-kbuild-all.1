Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662477;
	b=ukR/032edHMrfIHLctchFTe0w7orwtZMbsXKe2GsikredVJFX+CswbwXTJ2NnJVxcXSZ
	 8trCS1qD4l96Jb+oc8TjGsHcUELklsEx+OJUAbq2fe6HNrKkATcOofKBkVyb0UeobQkI9
	 7Uie0TV1uc7XMO9FgXufo1E17t2fTJrhv+nkDBQnfwJMyL4FGc1thy868tYVFCQEHRH3C
	 NVi6nEFFo7CLFFU1Six+HKVRfPlESSUkR8GDlMCrDcuBpTPEnBD79iqXEgIKOglRZ9Jsj
	 VFK+mM+PNM89fgT4N5G2FAPkDgKfr7l1+//L8PjdAMBVgiuvy6UhWO8oU9VZCfk92Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662477;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=W2Cwh4gNPy5b1lqn8cgFK9yzWoketG5R/QCur1tDfOg=;
	b=0HdWkZNKqv/nGiYiD3WdvExxdBEZggB+1zyvW7JhS/2IvWjitCRKRgSvA2E2GURYxKA0
	 cGJS+8/9bdKUJ90m6Kyx3s9EaNHhLnu8WUDVdd5aZjm8PPSmW7WazXt8QhB8TkxY28C/h
	 W07jB8WL3jz61Z/UmHA5qu/SxCTTq+n4lGZS9QYCbUBlPWx1vGkxo54akPXFfXf6h3ukT
	 cAeHziUMqwYqICNUWACyDzANJvWz6YyxfbZHp+sV5YlqqQ2SZ6EgluCiUyQl/GbT/Yuhg
	 HKE67csxM4HkBNI5jrhHBgwdvxsZ0n6TYRNjIKBmE4+QSGjFNHDEvuQwdX+L1ftrCxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Id51cUYS;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C223E606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 09:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C223E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Id51cUYS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792662472; x=1824198472;
  h=date:from:to:cc:subject:message-id;
  bh=nA0wFCZAb4+AoT5PfghWb9xe9COnws390SQvVOmEniw=;
  b=Id51cUYS+0wpkyn0A0vpnpQwy3i/7yI4MWRL/QCB8q5F9Ospdl34iCLY
   1GbHrlk3r0w/xT1zde3ZU95/I3MRvl+A59XW43zyB1MPuklU4irc/kOo6
   5YTxonmFaMHC6A48vBjKCg9gPLRiD+Vfs+CeeM0IInWToXMfGj1Ul3IKe
   CMn46rB3YaCiO2d/B2CMzMiN2ANmIHRk8HjC+6dOAV+27lfMgnuttMZdt
   sjiIbgxHx9ccR0yykqNcxSOa+KMT0U6RaRnsEq3qJ7Jdk4T1icg8i1NSm
   MKVu4M8jYMh1RhOT4kr7EB7E5CxVnXQxyaU6WhtbKkpxSvf609YZxFgLR
   g==;
X-CSE-ConnectionGUID: 9cLQ70zkQa2a+8M0GQXwjw==
X-CSE-MsgGUID: xAYsKvgqTB2SvAvTEQv6Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1419989"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1419989"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 02:47:51 -0700
X-CSE-ConnectionGUID: 6KVykKMwTaeK4kLGwUrkWA==
X-CSE-MsgGUID: JrP/6hHWQHaQ2ejbYMw+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3330806"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2026 02:47:50 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJpOk-000000000Hn-338u;
	Thu, 22 Oct 2026 09:47:46 +0000
Date: Thu, 22 Oct 2026 11:47:09 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 0/1]
 drivers/interconnect/debugfs-client.c:60:15: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202610221129.MOwQIF02-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   e3be7234b7452a64acdd1faefbfaa8d03fee1947
commit: 4439db7b8f941e4e418fc4d07e84a2eb31c6f339 [0/1] ANDROID: interconnect: Enable debugfs client
config: i386-randconfig-2302-20261021 (https://download.01.org/0day-ci/archive/20261022/202610221129.MOwQIF02-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221129.MOwQIF02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221129.MOwQIF02-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/interconnect/debugfs-client.c:60:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/interconnect/debugfs-client.c:60:15: sparse:    char [noderef] __rcu *
   drivers/interconnect/debugfs-client.c:60:15: sparse:    char *
   drivers/interconnect/debugfs-client.c:61:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/interconnect/debugfs-client.c:61:15: sparse:    char [noderef] __rcu *
   drivers/interconnect/debugfs-client.c:61:15: sparse:    char *

vim +60 drivers/interconnect/debugfs-client.c

770c69f037c18c Mike Tipton 2023-08-07   50  
770c69f037c18c Mike Tipton 2023-08-07   51  static int icc_get_set(void *data, u64 val)
770c69f037c18c Mike Tipton 2023-08-07   52  {
770c69f037c18c Mike Tipton 2023-08-07   53  	struct debugfs_path *debugfs_path;
770c69f037c18c Mike Tipton 2023-08-07   54  	char *src, *dst;
770c69f037c18c Mike Tipton 2023-08-07   55  	int ret = 0;
770c69f037c18c Mike Tipton 2023-08-07   56  
770c69f037c18c Mike Tipton 2023-08-07   57  	mutex_lock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07   58  
770c69f037c18c Mike Tipton 2023-08-07   59  	rcu_read_lock();
770c69f037c18c Mike Tipton 2023-08-07  @60  	src = rcu_dereference(src_node);
770c69f037c18c Mike Tipton 2023-08-07   61  	dst = rcu_dereference(dst_node);
770c69f037c18c Mike Tipton 2023-08-07   62  
770c69f037c18c Mike Tipton 2023-08-07   63  	/*
770c69f037c18c Mike Tipton 2023-08-07   64  	 * If we've already looked up a path, then use the existing one instead
770c69f037c18c Mike Tipton 2023-08-07   65  	 * of calling icc_get() again. This allows for updating previous BW
770c69f037c18c Mike Tipton 2023-08-07   66  	 * votes when "get" is written to multiple times for multiple paths.
770c69f037c18c Mike Tipton 2023-08-07   67  	 */
770c69f037c18c Mike Tipton 2023-08-07   68  	cur_path = get_path(src, dst);
770c69f037c18c Mike Tipton 2023-08-07   69  	if (cur_path) {
770c69f037c18c Mike Tipton 2023-08-07   70  		rcu_read_unlock();
770c69f037c18c Mike Tipton 2023-08-07   71  		goto out;
770c69f037c18c Mike Tipton 2023-08-07   72  	}
770c69f037c18c Mike Tipton 2023-08-07   73  
770c69f037c18c Mike Tipton 2023-08-07   74  	src = kstrdup(src, GFP_ATOMIC);
770c69f037c18c Mike Tipton 2023-08-07   75  	dst = kstrdup(dst, GFP_ATOMIC);
770c69f037c18c Mike Tipton 2023-08-07   76  	rcu_read_unlock();
770c69f037c18c Mike Tipton 2023-08-07   77  
770c69f037c18c Mike Tipton 2023-08-07   78  	if (!src || !dst) {
770c69f037c18c Mike Tipton 2023-08-07   79  		ret = -ENOMEM;
770c69f037c18c Mike Tipton 2023-08-07   80  		goto err_free;
770c69f037c18c Mike Tipton 2023-08-07   81  	}
770c69f037c18c Mike Tipton 2023-08-07   82  
770c69f037c18c Mike Tipton 2023-08-07   83  	cur_path = icc_get(&pdev->dev, src, dst);
770c69f037c18c Mike Tipton 2023-08-07   84  	if (IS_ERR(cur_path)) {
770c69f037c18c Mike Tipton 2023-08-07   85  		ret = PTR_ERR(cur_path);
770c69f037c18c Mike Tipton 2023-08-07   86  		goto err_free;
770c69f037c18c Mike Tipton 2023-08-07   87  	}
770c69f037c18c Mike Tipton 2023-08-07   88  
770c69f037c18c Mike Tipton 2023-08-07   89  	debugfs_path = kzalloc(sizeof(*debugfs_path), GFP_KERNEL);
770c69f037c18c Mike Tipton 2023-08-07   90  	if (!debugfs_path) {
770c69f037c18c Mike Tipton 2023-08-07   91  		ret = -ENOMEM;
770c69f037c18c Mike Tipton 2023-08-07   92  		goto err_put;
770c69f037c18c Mike Tipton 2023-08-07   93  	}
770c69f037c18c Mike Tipton 2023-08-07   94  
770c69f037c18c Mike Tipton 2023-08-07   95  	debugfs_path->path = cur_path;
770c69f037c18c Mike Tipton 2023-08-07   96  	debugfs_path->src = src;
770c69f037c18c Mike Tipton 2023-08-07   97  	debugfs_path->dst = dst;
770c69f037c18c Mike Tipton 2023-08-07   98  	list_add_tail(&debugfs_path->list, &debugfs_paths);
770c69f037c18c Mike Tipton 2023-08-07   99  
770c69f037c18c Mike Tipton 2023-08-07  100  	goto out;
770c69f037c18c Mike Tipton 2023-08-07  101  
770c69f037c18c Mike Tipton 2023-08-07  102  err_put:
770c69f037c18c Mike Tipton 2023-08-07  103  	icc_put(cur_path);
770c69f037c18c Mike Tipton 2023-08-07  104  err_free:
770c69f037c18c Mike Tipton 2023-08-07  105  	kfree(src);
770c69f037c18c Mike Tipton 2023-08-07  106  	kfree(dst);
770c69f037c18c Mike Tipton 2023-08-07  107  out:
770c69f037c18c Mike Tipton 2023-08-07  108  	mutex_unlock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07  109  	return ret;
770c69f037c18c Mike Tipton 2023-08-07  110  }
770c69f037c18c Mike Tipton 2023-08-07  111  

:::::: The code at line 60 was first introduced by commit
:::::: 770c69f037c18cfaa37c3d6c6ef8bd257635513f interconnect: Add debugfs test client

:::::: TO: Mike Tipton <quic_mdtipton@quicinc.com>
:::::: CC: Georgi Djakov <djakov@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
