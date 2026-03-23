Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9043E2749
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 20:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296840; cv=none; b=MexWi0qAWLQil72W63ENXNrsmaKXvXcV08QI0Q6A38rwlC2N6jIu105NM2xl/ql1GwLqyRGFcPqr3YmXPboBg57KdwsJUUfwVskMOCBH01a461xG3O8z5PQnGPNTu6kAnBrrQQal6T4l3tk7j2pGSVRI80kRt3eBs95WGEcX5jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296840; c=relaxed/simple;
	bh=2Lzpx7tgvOipAOKquvQOm30wDy6VLcCgjnXDI2LOQIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VTlhMhJncheSy8PXsb1/0oDvTD+JK9CWFDZuDM/h1khy2aNc9ilAmxA0uk3RQsoi0Xz+X63xIr3LbaAzS6mVipzzOtbRXWNM+cU9E52p8ClTt8Z2r0aMEWiUDUnacCwU1x6LjBArI7BIQ5XZ3YJh+VhMi8zf6tGD610niIhScWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTRLr26H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTRLr26H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774296838; x=1805832838;
  h=date:from:to:cc:subject:message-id;
  bh=2Lzpx7tgvOipAOKquvQOm30wDy6VLcCgjnXDI2LOQIo=;
  b=GTRLr26HDhnA3P2E0zmsnoQy8xq7N/K2z5vs6EifMweUYavBEp/RRiXc
   lVranHUGcfwxzVxJhC2SfVLainbLaDEg2YbF1c5yDHMEuamt1CKQ0OnZh
   ReMppwvaZUYdhsY3vbNgqZGM7tKocbkoZbif+VTJ5SW0ygD9sDyJtcfX/
   FqQ6vuqOc9yTPxM1WYP3FjtESt0m0WlifzzHz/GzipmaPSAkHBs1IYB4U
   aYmiPkJcwZdlMrsCF8gr3T9vKky2JKqFT9uu7mrs1WPeyF9Knf3NLSl02
   l5cxwfEBTOxW8h6SoGGOS/3hlcvPtKez3S9byqb6o92LVitxUmfq6A11Y
   Q==;
X-CSE-ConnectionGUID: 3kBvBrdATgWPXtBL+1lGgw==
X-CSE-MsgGUID: kyhYE+TkSSKO/q3tBbMZdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92878191"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="92878191"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 13:13:57 -0700
X-CSE-ConnectionGUID: /9iFuxrVQWaaVoV5MNd3SQ==
X-CSE-MsgGUID: 15RusDmzRJ26vO84hyY5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247839579"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 13:13:56 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4ler-000000003A9-2itJ;
	Mon, 23 Mar 2026 20:13:53 +0000
Date: Tue, 24 Mar 2026 04:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 drivers/interconnect/debugfs-client.c:60:15: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202603240405.VrM9PU4B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   463ed2ee7900b7f9a5b1ccfae6d9777214daf4a5
commit: 4439db7b8f941e4e418fc4d07e84a2eb31c6f339 [36/36] ANDROID: interconnect: Enable debugfs client
config: x86_64-randconfig-r112-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240405.VrM9PU4B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240405.VrM9PU4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240405.VrM9PU4B-lkp@intel.com/

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
