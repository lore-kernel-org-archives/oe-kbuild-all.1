Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0FD7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 20:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690662081; x=1722198081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+cwfy/PBPCqo8D/tZLXe9kBSxt0XaLSKS042m2CDUmA=;
  b=YWUHFLugiBTCYAbT/jk1+H8h7VIHnZBPkcLZf7fJBS7qxDIocBepm25K
   xOeYuFNO9wVHt10CX3Lp4QzjZdug5urS9ICEFm1MzTly1K8314CzDiHWf
   SM6Ahi+j+xMEdx6iqwOTK25KkbtGXgcgNgyS7up/Ndml0cvzea50XxH+Z
   l3rH+lwpRHtTdO6mC73vayCYCOvvwRMqKkeyAjLQfjTmNZn2LxXLeIMqo
   VgV+KYoraJb3elN2us+lt+z4XcrV7F+msyajcfVe6MkDAKu1Bj46zy2Gf
   +WyFrOh695S+AloiAylwU02OqCKKBV5sRbxd+kG/KPdWSuP1O5+xyn1eY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="348392272"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="348392272"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 13:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="704932256"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="704932256"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Jul 2023 13:21:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPqRC-0004Hv-0B;
	Sat, 29 Jul 2023 20:21:18 +0000
Date: Sun, 30 Jul 2023 04:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: fs/esdfs/file.c:382:1: warning: no previous prototype for function
 'esdfs_read_iter'
Message-ID: <202307300435.Vqs3y6nO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: b7aa7e9f2bc16fe18b1cced9581df8527baf2dea Merge origin/chromeos-5.10-esdfs
date:   2 years, 7 months ago
config: x86_64-randconfig-r034-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300435.Vqs3y6nO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300435.Vqs3y6nO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300435.Vqs3y6nO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/esdfs/file.c:382:1: warning: no previous prototype for function 'esdfs_read_iter' [-Wmissing-prototypes]
   esdfs_read_iter(struct kiocb *iocb, struct iov_iter *iter)
   ^
   fs/esdfs/file.c:381:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t
   ^
   static 
>> fs/esdfs/file.c:410:1: warning: no previous prototype for function 'esdfs_write_iter' [-Wmissing-prototypes]
   esdfs_write_iter(struct kiocb *iocb, struct iov_iter *iter)
   ^
   fs/esdfs/file.c:409:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t
   ^
   static 
   2 warnings generated.


vim +/esdfs_read_iter +382 fs/esdfs/file.c

f5548a15ab7ead Russ W. Knize 2013-04-07  377  
f5548a15ab7ead Russ W. Knize 2013-04-07  378  /*
f5548a15ab7ead Russ W. Knize 2013-04-07  379   * Wrapfs read_iter, redirect modified iocb to lower read_iter
f5548a15ab7ead Russ W. Knize 2013-04-07  380   */
f5548a15ab7ead Russ W. Knize 2013-04-07  381  ssize_t
f5548a15ab7ead Russ W. Knize 2013-04-07 @382  esdfs_read_iter(struct kiocb *iocb, struct iov_iter *iter)
f5548a15ab7ead Russ W. Knize 2013-04-07  383  {
f5548a15ab7ead Russ W. Knize 2013-04-07  384  	int err;
f5548a15ab7ead Russ W. Knize 2013-04-07  385  	struct file *file = iocb->ki_filp, *lower_file;
f5548a15ab7ead Russ W. Knize 2013-04-07  386  
f5548a15ab7ead Russ W. Knize 2013-04-07  387  	lower_file = esdfs_lower_file(file);
f5548a15ab7ead Russ W. Knize 2013-04-07  388  	if (!lower_file->f_op->read_iter) {
f5548a15ab7ead Russ W. Knize 2013-04-07  389  		err = -EINVAL;
f5548a15ab7ead Russ W. Knize 2013-04-07  390  		goto out;
f5548a15ab7ead Russ W. Knize 2013-04-07  391  	}
f5548a15ab7ead Russ W. Knize 2013-04-07  392  
f5548a15ab7ead Russ W. Knize 2013-04-07  393  	get_file(lower_file); /* prevent lower_file from being released */
f5548a15ab7ead Russ W. Knize 2013-04-07  394  	iocb->ki_filp = lower_file;
f5548a15ab7ead Russ W. Knize 2013-04-07  395  	err = lower_file->f_op->read_iter(iocb, iter);
f5548a15ab7ead Russ W. Knize 2013-04-07  396  	iocb->ki_filp = file;
f5548a15ab7ead Russ W. Knize 2013-04-07  397  	fput(lower_file);
f5548a15ab7ead Russ W. Knize 2013-04-07  398  	/* update upper inode atime as needed */
f5548a15ab7ead Russ W. Knize 2013-04-07  399  	if (err >= 0 || err == -EIOCBQUEUED)
f5548a15ab7ead Russ W. Knize 2013-04-07  400  		fsstack_copy_attr_atime(file->f_path.dentry->d_inode,
f5548a15ab7ead Russ W. Knize 2013-04-07  401  					file_inode(lower_file));
f5548a15ab7ead Russ W. Knize 2013-04-07  402  out:
f5548a15ab7ead Russ W. Knize 2013-04-07  403  	return err;
f5548a15ab7ead Russ W. Knize 2013-04-07  404  }
f5548a15ab7ead Russ W. Knize 2013-04-07  405  
f5548a15ab7ead Russ W. Knize 2013-04-07  406  /*
f5548a15ab7ead Russ W. Knize 2013-04-07  407   * Wrapfs write_iter, redirect modified iocb to lower write_iter
f5548a15ab7ead Russ W. Knize 2013-04-07  408   */
f5548a15ab7ead Russ W. Knize 2013-04-07  409  ssize_t
f5548a15ab7ead Russ W. Knize 2013-04-07 @410  esdfs_write_iter(struct kiocb *iocb, struct iov_iter *iter)
f5548a15ab7ead Russ W. Knize 2013-04-07  411  {
f5548a15ab7ead Russ W. Knize 2013-04-07  412  	int err;
f5548a15ab7ead Russ W. Knize 2013-04-07  413  	struct file *file = iocb->ki_filp, *lower_file;
f5548a15ab7ead Russ W. Knize 2013-04-07  414  
f5548a15ab7ead Russ W. Knize 2013-04-07  415  	lower_file = esdfs_lower_file(file);
f5548a15ab7ead Russ W. Knize 2013-04-07  416  	if (!lower_file->f_op->write_iter) {
f5548a15ab7ead Russ W. Knize 2013-04-07  417  		err = -EINVAL;
f5548a15ab7ead Russ W. Knize 2013-04-07  418  		goto out;
f5548a15ab7ead Russ W. Knize 2013-04-07  419  	}
f5548a15ab7ead Russ W. Knize 2013-04-07  420  
f5548a15ab7ead Russ W. Knize 2013-04-07  421  	get_file(lower_file); /* prevent lower_file from being released */
f5548a15ab7ead Russ W. Knize 2013-04-07  422  	iocb->ki_filp = lower_file;
f5548a15ab7ead Russ W. Knize 2013-04-07  423  	err = lower_file->f_op->write_iter(iocb, iter);
f5548a15ab7ead Russ W. Knize 2013-04-07  424  	iocb->ki_filp = file;
f5548a15ab7ead Russ W. Knize 2013-04-07  425  	fput(lower_file);
f5548a15ab7ead Russ W. Knize 2013-04-07  426  	/* update upper inode times/sizes as needed */
f5548a15ab7ead Russ W. Knize 2013-04-07  427  	if (err >= 0 || err == -EIOCBQUEUED) {
f5548a15ab7ead Russ W. Knize 2013-04-07  428  		fsstack_copy_inode_size(file->f_path.dentry->d_inode,
f5548a15ab7ead Russ W. Knize 2013-04-07  429  					file_inode(lower_file));
f5548a15ab7ead Russ W. Knize 2013-04-07  430  		fsstack_copy_attr_times(file->f_path.dentry->d_inode,
f5548a15ab7ead Russ W. Knize 2013-04-07  431  					file_inode(lower_file));
f5548a15ab7ead Russ W. Knize 2013-04-07  432  	}
f5548a15ab7ead Russ W. Knize 2013-04-07  433  out:
f5548a15ab7ead Russ W. Knize 2013-04-07  434  	return err;
f5548a15ab7ead Russ W. Knize 2013-04-07  435  }
f5548a15ab7ead Russ W. Knize 2013-04-07  436  

:::::: The code at line 382 was first introduced by commit
:::::: f5548a15ab7ead52d472cb9ee29964b90e7caf1c CHROMIUM: fs: Import esdfs code

:::::: TO: Russ W. Knize <Russ.Knize@motorola.com>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
