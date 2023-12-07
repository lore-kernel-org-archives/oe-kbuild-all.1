Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18F367
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeFHdqeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701908894; x=1733444894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TEEiRzbImuy5iwJuw+heAcWSeAEEyVg+B/PThSdiA14=;
  b=aeFHdqeGYJZ0oqAnw5uWtcGp12GUb8wMiQhn/mvnSQnCmZvHfwr1Z17o
   vpIXryFhRb4mcN58rAm0Vig5l3jdG+xcTGaoRZNw6KEhK2A9UE5lwR+0c
   FDM8bh5w5KT8mco4n3lRXgemUNWYePfbDpUlioMcRTt5CNVbNUjskjin2
   8HEdsvDjoPFvYd2vTwdPEMI5h7I0nxh3DVbrJ1ezOWi3aKTTAnfpad6wR
   q05pgQK1nFl33A+g4B0Q+Ggtmbk2kMhCXypcEoYpgHefwESZBYxLDUoVU
   SVQPoUhhEVGmrWKKFqLPHOwMru952Mj47e3YANLtb+g8j5lg9PIGvnsKB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425302759"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="425302759"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 16:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="764913280"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="764913280"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Dec 2023 16:28:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB2FN-000BdE-2v;
	Thu, 07 Dec 2023 00:28:09 +0000
Date: Thu, 7 Dec 2023 08:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 drivers/interconnect/debugfs-client.c:60:15: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202312070810.7tUi7mTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   80979fab469540cfe1fba2d4d5b887f341828977
commit: 4439db7b8f941e4e418fc4d07e84a2eb31c6f339 [1/1] ANDROID: interconnect: Enable debugfs client
config: arm-randconfig-r131-20231201 (https://download.01.org/0day-ci/archive/20231207/202312070810.7tUi7mTA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070810.7tUi7mTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070810.7tUi7mTA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/interconnect/debugfs-client.c:60:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/interconnect/debugfs-client.c:60:15: sparse:    char [noderef] __rcu *
>> drivers/interconnect/debugfs-client.c:60:15: sparse:    char *
   drivers/interconnect/debugfs-client.c:61:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/interconnect/debugfs-client.c:61:15: sparse:    char [noderef] __rcu *
   drivers/interconnect/debugfs-client.c:61:15: sparse:    char *
   drivers/interconnect/debugfs-client.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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
