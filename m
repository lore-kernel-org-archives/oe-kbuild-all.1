Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969F1FC2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694258657; x=1725794657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+fwr+6gVgMAZRVn59IW+fGoEyT/Y/bI1An4vPYrtXcA=;
  b=jJ5oh1uYsneGKqbVhfb5wWlsdv1FzGq+jt/EKTmlx2G13z7EH9f5BvLR
   O7FuEV1X4IX9DivkYoNvqaDN2zOlWCAPKbVFyU9OgUp6zsxcVmlWhRnQe
   pTjsxmw+n6tCDfB2huXhSAl2idrxotRsOaqjfPawZqhY8TLbNP980R2KZ
   STG8Xet5MAgM+rSE5yGfP9gbXNnVSWAE8gSnkIx6ZF542IYHutqpKj66E
   kaulZpQklAWLfu4KoRap0VmcGNwV77Kn8bYjaP4FboOFEdThJFbR3PcY7
   YF5ok4ghIkBMn7s0v0UoEDuQPRBc/CN6APgK+2Ex/AHvyNSSBy0jLRPG8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377724641"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="377724641"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 04:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742796869"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="742796869"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Sep 2023 04:24:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qew4S-0003PX-2g;
	Sat, 09 Sep 2023 11:24:12 +0000
Date: Sat, 9 Sep 2023 19:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Georgi Djakov <djakov@kernel.org>
Subject: fs/debugfs/file.c:942:9: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202309091933.BRWlSnCq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6099776f9f268e61fe5ecd721f994a8cfce5306f
commit: 86b5488121db563b33684f56aafa62156f764be3 debugfs: Add write support to debugfs_create_str()
date:   3 weeks ago
config: i386-randconfig-061-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091933.BRWlSnCq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091933.BRWlSnCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091933.BRWlSnCq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/debugfs/file.c:942:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/debugfs/file.c:942:9: sparse:    char [noderef] __rcu *
>> fs/debugfs/file.c:942:9: sparse:    char *

vim +942 fs/debugfs/file.c

   903	
   904	static ssize_t debugfs_write_file_str(struct file *file, const char __user *user_buf,
   905					      size_t count, loff_t *ppos)
   906	{
   907		struct dentry *dentry = F_DENTRY(file);
   908		char *old, *new = NULL;
   909		int pos = *ppos;
   910		int r;
   911	
   912		r = debugfs_file_get(dentry);
   913		if (unlikely(r))
   914			return r;
   915	
   916		old = *(char **)file->private_data;
   917	
   918		/* only allow strict concatenation */
   919		r = -EINVAL;
   920		if (pos && pos != strlen(old))
   921			goto error;
   922	
   923		r = -E2BIG;
   924		if (pos + count + 1 > PAGE_SIZE)
   925			goto error;
   926	
   927		r = -ENOMEM;
   928		new = kmalloc(pos + count + 1, GFP_KERNEL);
   929		if (!new)
   930			goto error;
   931	
   932		if (pos)
   933			memcpy(new, old, pos);
   934	
   935		r = -EFAULT;
   936		if (copy_from_user(new + pos, user_buf, count))
   937			goto error;
   938	
   939		new[pos + count] = '\0';
   940		strim(new);
   941	
 > 942		rcu_assign_pointer(*(char **)file->private_data, new);
   943		synchronize_rcu();
   944		kfree(old);
   945	
   946		debugfs_file_put(dentry);
   947		return count;
   948	
   949	error:
   950		kfree(new);
   951		debugfs_file_put(dentry);
   952		return r;
   953	}
   954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
