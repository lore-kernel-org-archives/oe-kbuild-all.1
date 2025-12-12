Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93543B8D4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765578637; cv=none; b=hWBvZk93dyiKMEHZ6DD2bSGYNi8NpeTxZV0fqoAiljW8PBaDjdfIJq2bTSm3oy39o1JlE/cmHcVjQcJOdJDUsmcf5yh2AaEQYc84fcQ5+p40EHHIY0Vv60BMIwAca7ecMy+/zsJwCZWBMII+1aj4/Vd70ylGyaOOjQOjV2Xhzgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765578637; c=relaxed/simple;
	bh=smXLz/DTxJrmPWdxWATOfK/27sv0aD7qHjMLzgOMJbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F08OGaOBLK7PZnVVeyaikZfTHRaed06A/9QWFLAG8s5qc5m6uXt2+tnmwt/jeRUe8fKMR9YOyDvOGZrHBHSOifYFMV2rn86nUFB7GQBMyn0xJHYMktwM//vJ8HqiL6SQDxa5vJjCX1auNcdOr7Y2ENh/g5Y3o/r2nUJQqA0kAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGS4J03l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGS4J03l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765578636; x=1797114636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smXLz/DTxJrmPWdxWATOfK/27sv0aD7qHjMLzgOMJbQ=;
  b=JGS4J03lZHvFlggnwXb9160R7Lg8Nq25x7DOj1fg8v92OkkX9uvrEy27
   Dh7xthhdNrIrvp4yi9ZeAKz+yV6ACFUeB8nXiabrPWIJqC6omfn0RIkuz
   KfwIjI7fjuYk//gBoJem1BzYS7GidtiQkPtKrPJHVLH10QB8Z7QgldrV4
   GJ8otdags4hqZWSD6KAqK3H3xsIZWyxoT5m5SHJxxyyHRBFKiApc2Pe2U
   SDwWASLJcj04pRarh2sOiY0XZOj9i0rlsEnp09zyuFn73CC87YK7ZerxJ
   rYFK0lcnRsXjZMtYigaJF4UDGMLzKPY5mw/+X4YbVvUCD4q5+rs9yzf9z
   w==;
X-CSE-ConnectionGUID: OildMp0kTSeNRkuZXD4qcg==
X-CSE-MsgGUID: 2ep0H7HOQRyVyogvsjKqTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71446013"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="71446013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:30:36 -0800
X-CSE-ConnectionGUID: kzGrODOYTwmMk2H0eGlbdw==
X-CSE-MsgGUID: L1WQNhSmSUqRU8QoSXw85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201613940"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 14:30:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBeh-000000006hZ-3wR9;
	Fri, 12 Dec 2025 22:30:31 +0000
Date: Sat, 13 Dec 2025 06:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 1/1]
 drivers/interconnect/debugfs-client.c:60:15: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202512130648.thv4KgsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   3e3c7bca8549a532ba83b4d8e1a732e1cc234d20
commit: 1e1f950a780aa6f421ac2b67862746ac563d0a0d [1/1] ANDROID: interconnect: Enable debugfs client
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130648.thv4KgsK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130648.thv4KgsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130648.thv4KgsK-lkp@intel.com/

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
