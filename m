Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817BC970
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678441215; x=1709977215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qqaLUDEks8adna/UsVtfxJCt1IkYBweYhnuxd6YRr54=;
  b=kwezRl3m0+mO8J+3FIMOZaikNlkZ4/ncv5jp1Mhf7MiQwcvi4plyU1Cb
   6Xy0M164K20ZJDTDaEFKpawwo+QPh/XwAYchCevHyicl9rylXI291cG93
   ubTNhVJUNDQatElSZy3Phl1gx1UWC053AAzC/YHnZOBPH77B17BDQQfgf
   LXacMGnLBMBOQLuFVkVDMOplRZJ0bRwUPRVSOz3T1fLA5O2b8MdUqUCHB
   dADl1ju6kH5Qva2oQ0CKL3Wd5NLIKScgXYo9uP55sdES6KBVUQc4HlAbS
   qV6ZAIt6611OMEzsDIOnSRsMwzmnRqrTvacG2VUbHzVeWG8M2sUZrphad
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422958981"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="422958981"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:40:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677743431"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="677743431"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 01:40:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paZER-0003iV-30;
	Fri, 10 Mar 2023 09:40:11 +0000
Date: Fri, 10 Mar 2023 17:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: fs/esdfs/file.c:382:1: warning: no previous prototype for function
 'esdfs_read_iter'
Message-ID: <202303101757.dtxmHXFP-lkp@intel.com>
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
date:   2 years, 3 months ago
config: riscv-randconfig-r001-20230310 (https://download.01.org/0day-ci/archive/20230310/202303101757.dtxmHXFP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=b7aa7e9f2bc16fe18b1cced9581df8527baf2dea
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout b7aa7e9f2bc16fe18b1cced9581df8527baf2dea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/esdfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101757.dtxmHXFP-lkp@intel.com/

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
https://github.com/intel/lkp-tests
