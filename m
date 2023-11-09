Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B75E38F8C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaR+xd/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699566881; x=1731102881;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RT7L3Gjh8ANIBHgA3MjZiqUX5RRMtHG3vZM3hvUSeCE=;
  b=DaR+xd/SRHvdNoEeGG+yyeRHWFdEZ1eU5wBYWpfjGqBl79cHstkwMLhG
   OO0P2aP3zhdLMp/9N0qI35wtzUGlH0PuMOdhRr54F5WFRXDuuSl0/znTH
   cs0cLLCRpg8bCNvZPfy9yNvMWr8PgTljRFUXmFAq8cJsy/F+iIqpknPWt
   h9apLi2aQlUnJL2baluv1KABH5dkFsNi9jUr6MiBU5LxFnsggEzggSbF7
   MH0JP8tfmUmdvk7ej4VXjfc7BXNPpkTDQiE52sDzx4mpuCQAR4R3krLw1
   SWxg1NYkTNOdChTXvceF9p3dv/yQXwYkBdhKXtDI3TuFLdIBpc3LpGqVG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393989042"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="393989042"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="833974437"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="833974437"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2023 13:54:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Cyx-0009Bm-3C;
	Thu, 09 Nov 2023 21:54:35 +0000
Date: Fri, 10 Nov 2023 05:53:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3162/30000] security/security.c:419:5:
 sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be
 static?
Message-ID: <202311100513.OwjBldzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 01de591a11f331817935b2ae617c47f929810227 [3162/30000] LSM: Infrastructure management of the superblock security blob
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231110/202311100513.OwjBldzq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100513.OwjBldzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100513.OwjBldzq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:318:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
   security/security.c:339:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
>> security/security.c:419:5: sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be static?
   security/security.c:318:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     318 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:339:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     339 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~
   security/security.c:419:5: warning: no previous prototype for 'lsm_superblock_alloc' [-Wmissing-prototypes]
     419 | int lsm_superblock_alloc(struct super_block *sb)
         |     ^~~~~~~~~~~~~~~~~~~~

vim +/lsm_superblock_alloc +419 security/security.c

   410	
   411	/**
   412	 * lsm_superblock_alloc - allocate a composite superblock blob
   413	 * @sb: the superblock that needs a blob
   414	 *
   415	 * Allocate the superblock blob for all the modules
   416	 *
   417	 * Returns 0, or -ENOMEM if memory can't be allocated.
   418	 */
 > 419	int lsm_superblock_alloc(struct super_block *sb)
   420	{
   421		if (blob_sizes.lbs_superblock == 0) {
   422			sb->s_security = NULL;
   423			return 0;
   424		}
   425	
   426		sb->s_security = kzalloc(blob_sizes.lbs_superblock, GFP_KERNEL);
   427		if (sb->s_security == NULL)
   428			return -ENOMEM;
   429		return 0;
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
