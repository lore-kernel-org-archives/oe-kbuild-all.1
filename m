Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5B7F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 05:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675576696; x=1707112696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1ywauvVFAnIw+iGiJkCOtopopCN+ptwpLh0jU/VDIA=;
  b=bYTgtHpdG0v1XB6rD2bDOpZl3h0Ap0gS6xZo2Gnn2Wl24IW6QQmIsTIq
   2nXc2t81AataxPzQDiUcbWycESIBtHC+aAH3YlVx9tRqT09mFYYAGjGLD
   9hYNEy7eUDaXF8oO0WKrYOJ9mbCcFwICnfxRCQ1QcYXeaf4QawYeBAsKm
   dvRAMMqiAO7xwBj8x/rVwfP7PK67UCGF4GPy+ZwPforVBIffUhlxMg4VT
   RDLpCjUr7UPDT3frpheKj5TBaHP5e2utNzoXskNuAK5ZbdUmF+VO3UlTp
   jpawBcPJXINu8WydYNkb0fEjN3C7lBB8/wfpQK4T4tQQ3KWAGkFpOcQ6D
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393617642"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393617642"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 21:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="668086954"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="668086954"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2023 21:58:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOY2T-0001m7-1j;
	Sun, 05 Feb 2023 05:58:09 +0000
Date: Sun, 5 Feb 2023 13:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: fs/esdfs/file.c:382:1: warning: no previous prototype for
 'esdfs_read_iter'
Message-ID: <202302051333.Vl2LIJiC-lkp@intel.com>
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
date:   2 years, 2 months ago
config: nds32-buildonly-randconfig-r001-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051333.Vl2LIJiC-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=b7aa7e9f2bc16fe18b1cced9581df8527baf2dea
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout b7aa7e9f2bc16fe18b1cced9581df8527baf2dea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash fs/esdfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/esdfs/file.c:382:1: warning: no previous prototype for 'esdfs_read_iter' [-Wmissing-prototypes]
     382 | esdfs_read_iter(struct kiocb *iocb, struct iov_iter *iter)
         | ^~~~~~~~~~~~~~~
>> fs/esdfs/file.c:410:1: warning: no previous prototype for 'esdfs_write_iter' [-Wmissing-prototypes]
     410 | esdfs_write_iter(struct kiocb *iocb, struct iov_iter *iter)
         | ^~~~~~~~~~~~~~~~
--
   fs/esdfs/derive.c: In function 'esdfs_derive_perms':
>> fs/esdfs/derive.c:76:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      76 |         int ret;
         |             ^~~


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
