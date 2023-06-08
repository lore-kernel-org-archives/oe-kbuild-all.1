Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B3E947B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686230370; x=1717766370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u8WzIAZXJEQpiPD5yNJSdQ4aAouTSQ9wQu23VG8nJys=;
  b=oDjtY2ppWZBrAb5HJYLqTKWFfKJAvqfqRoFKnfMHcN7hld0IB4vmBd2J
   5zrBaiPkXIFbNspcgkoWU2Ahws6me+C7UQGjJ+3Y6utMbKsJeSsdzmM6Y
   /Y+klkN8hRl97N+FGUIXfqiQT/YP9UrRvMxc8kzbWYFDqRnxL6VMgy2dd
   C/AeqCdO1MeiGdhYsH77m74Ok9oMTWN3NSd2yeHRx5/2lmk+k2wQsCh6n
   xKESZStNIQFnBQRrbWRSnapOcpRmc//Oqn62m8NtGMhVULGHhbcRP6HX4
   c3S0QmgHAy0YyKa+Qwh3ZSXL/bwqYVcKIComw3qN+/WMd7morQdHCf0FB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336934864"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="336934864"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 06:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709974857"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="709974857"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 06:15:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7FTr-0007oU-0V;
	Thu, 08 Jun 2023 13:15:11 +0000
Date: Thu, 8 Jun 2023 21:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v1-devel-v22 29/33]
 security/integrity/ima/ima_main.c:537:5: warning: no previous prototype for
 'ima_file_check'
Message-ID: <202306082151.iheJE1tX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v1-devel-v22
head:   19f1c2b9463d5b57969d00781cbcb241ce0f2695
commit: b7e0bfde294aa33527a5d85242c565e528a30b54 [29/33] ima: Move to LSM infrastructure
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230608/202306082151.iheJE1tX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/robertosassu/linux/commit/b7e0bfde294aa33527a5d85242c565e528a30b54
        git remote add robertosassu https://github.com/robertosassu/linux
        git fetch --no-tags robertosassu ima-evm-lsms-v1-devel-v22
        git checkout b7e0bfde294aa33527a5d85242c565e528a30b54
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash security/integrity/evm/ security/integrity/ima/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306082151.iheJE1tX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:537:5: warning: no previous prototype for 'ima_file_check' [-Wmissing-prototypes]
     537 | int ima_file_check(struct file *file, int mask)
         |     ^~~~~~~~~~~~~~


vim +/ima_file_check +537 security/integrity/ima/ima_main.c

3323eec921efd8 Mimi Zohar      2009-02-04  526  
8eb988c70e7709 Mimi Zohar      2010-01-20  527  /**
41d75dd96205ef Jiele Zhao      2021-04-06  528   * ima_file_check - based on policy, collect/store measurement.
8eb988c70e7709 Mimi Zohar      2010-01-20  529   * @file: pointer to the file to be measured
20f482ab9e0f80 Lans Zhang      2017-01-06  530   * @mask: contains MAY_READ, MAY_WRITE, MAY_EXEC or MAY_APPEND
8eb988c70e7709 Mimi Zohar      2010-01-20  531   *
8eb988c70e7709 Mimi Zohar      2010-01-20  532   * Measure files based on the ima_must_measure() policy decision.
8eb988c70e7709 Mimi Zohar      2010-01-20  533   *
750943a30714b7 Dmitry Kasatkin 2012-09-27  534   * On success return 0.  On integrity appraisal error, assuming the file
750943a30714b7 Dmitry Kasatkin 2012-09-27  535   * is in policy and IMA-appraisal is in enforcing mode, return -EACCES.
8eb988c70e7709 Mimi Zohar      2010-01-20  536   */
6035a27b25ab9d Al Viro         2018-06-08 @537  int ima_file_check(struct file *file, int mask)
8eb988c70e7709 Mimi Zohar      2010-01-20  538  {
d906c10d8a3165 Matthew Garrett 2018-01-08  539  	u32 secid;
d906c10d8a3165 Matthew Garrett 2018-01-08  540  
6326948f940dc3 Paul Moore      2021-09-29  541  	security_current_getsecid_subj(&secid);
d906c10d8a3165 Matthew Garrett 2018-01-08  542  	return process_measurement(file, current_cred(), secid, NULL, 0,
20f482ab9e0f80 Lans Zhang      2017-01-06  543  				   mask & (MAY_READ | MAY_WRITE | MAY_EXEC |
6035a27b25ab9d Al Viro         2018-06-08  544  					   MAY_APPEND), FILE_CHECK);
8eb988c70e7709 Mimi Zohar      2010-01-20  545  }
9bbb6cad0173e6 Mimi Zohar      2010-01-26  546  EXPORT_SYMBOL_GPL(ima_file_check);
8eb988c70e7709 Mimi Zohar      2010-01-20  547  

:::::: The code at line 537 was first introduced by commit
:::::: 6035a27b25ab9dadc8c3d5c5df5eae3fca62fc95 IMA: don't propagate opened through the entire thing

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
