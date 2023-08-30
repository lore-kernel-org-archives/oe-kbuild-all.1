Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF564748A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 18:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693421937; x=1724957937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMLX6oAE9fAgJGtCn12cHn9NLyxZ33+3V/jhQzWVmDY=;
  b=jRrkEgRAJATxr/BrYqChLBcI6oWhqSNwK4auy5bHbmVRZz9bwJLHPmrF
   E7/kzxEFS4eOchqryxp+8vwGC4Y0tJHQIn0AN56nu2tE+A9cxdPO0HfnD
   vmqp0H3PN/zofbarW/73FnWI3rCV/9LzbdnLgW6dxvmuZJRIzgtpSPlh8
   7W8FpDeuEhWtQtBD2rRPLA2C0hSCXAqVhgYnp3rssxlYZBsAX3tJJpwMO
   eYtPcz2aIrqteo6f9b3lIrULqP/mq7BZWLHVZGC09UVUngg+t7pA1aKfj
   0QC/zLvu9qQSo6t1VjkXYAdASwm02NNr9PXeHsapj1p6KoQw9Cd+dtuqC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379478362"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="379478362"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 11:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="774198177"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="774198177"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2023 11:58:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbQO9-000A8D-1k;
	Wed, 30 Aug 2023 18:58:10 +0000
Date: Thu, 31 Aug 2023 02:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v2-devel-v6 21/25]
 security/integrity/ima/ima_main.c:541:5: warning: no previous prototype for
 'ima_file_check'
Message-ID: <202308310205.KOGOF1oI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v2-devel-v6
head:   8d3db5840032b2f14a363ad273bc13baeaec3cc5
commit: 20ad98a2e4878bcd22d821c7c8671aaeddd66932 [21/25] ima: Move to LSM infrastructure
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310205.KOGOF1oI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310205.KOGOF1oI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310205.KOGOF1oI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:541:5: warning: no previous prototype for 'ima_file_check' [-Wmissing-prototypes]
     541 | int ima_file_check(struct file *file, int mask)
         |     ^~~~~~~~~~~~~~


vim +/ima_file_check +541 security/integrity/ima/ima_main.c

3323eec921efd8 Mimi Zohar      2009-02-04  530  
8eb988c70e7709 Mimi Zohar      2010-01-20  531  /**
41d75dd96205ef Jiele Zhao      2021-04-06  532   * ima_file_check - based on policy, collect/store measurement.
8eb988c70e7709 Mimi Zohar      2010-01-20  533   * @file: pointer to the file to be measured
20f482ab9e0f80 Lans Zhang      2017-01-06  534   * @mask: contains MAY_READ, MAY_WRITE, MAY_EXEC or MAY_APPEND
8eb988c70e7709 Mimi Zohar      2010-01-20  535   *
8eb988c70e7709 Mimi Zohar      2010-01-20  536   * Measure files based on the ima_must_measure() policy decision.
8eb988c70e7709 Mimi Zohar      2010-01-20  537   *
750943a30714b7 Dmitry Kasatkin 2012-09-27  538   * On success return 0.  On integrity appraisal error, assuming the file
750943a30714b7 Dmitry Kasatkin 2012-09-27  539   * is in policy and IMA-appraisal is in enforcing mode, return -EACCES.
8eb988c70e7709 Mimi Zohar      2010-01-20  540   */
6035a27b25ab9d Al Viro         2018-06-08 @541  int ima_file_check(struct file *file, int mask)
8eb988c70e7709 Mimi Zohar      2010-01-20  542  {
d906c10d8a3165 Matthew Garrett 2018-01-08  543  	u32 secid;
d906c10d8a3165 Matthew Garrett 2018-01-08  544  
6326948f940dc3 Paul Moore      2021-09-29  545  	security_current_getsecid_subj(&secid);
d906c10d8a3165 Matthew Garrett 2018-01-08  546  	return process_measurement(file, current_cred(), secid, NULL, 0,
20f482ab9e0f80 Lans Zhang      2017-01-06  547  				   mask & (MAY_READ | MAY_WRITE | MAY_EXEC |
6035a27b25ab9d Al Viro         2018-06-08  548  					   MAY_APPEND), FILE_CHECK);
8eb988c70e7709 Mimi Zohar      2010-01-20  549  }
9bbb6cad0173e6 Mimi Zohar      2010-01-26  550  EXPORT_SYMBOL_GPL(ima_file_check);
8eb988c70e7709 Mimi Zohar      2010-01-20  551  

:::::: The code at line 541 was first introduced by commit
:::::: 6035a27b25ab9dadc8c3d5c5df5eae3fca62fc95 IMA: don't propagate opened through the entire thing

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
