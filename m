Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CACB1C28A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmCdBsDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699628137; x=1731164137;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2JorriAVJaWmu8Ypmwk2jcZBN3cGCZr+G+XIX+DQVL8=;
  b=lmCdBsDxLWYA4N7rm8SCBkZvfeunrLudGa2ODYNVjn7Z56F9kEyfLNLh
   To/DEgd2t1wYW64hHvb4JzJpiY/22s7/2DDA9VVBh12WMFq4HxYRNfQXx
   Gu6/3HJ5naj595FDQnwUIOqmEipkl961ZYflKS9tixs+RQcUsc26nMwxj
   wDBmLEX5ji4tFoGyrwu5Xi3nCsyRI/mWBrpy2XkEWgo/nKfNGht1Aqd5q
   /9Jo90hYXvmG78eSM4zgcsbyWrIY3MukdfaMix89lFiw46eRxCuvSeVqw
   yDiNikmtE4cr/aJOK3wv3ndW347uME8oS2X5DcCThcXirW9iHgKNglIvV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476416715"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="476416715"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 06:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="829667283"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="829667283"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2023 06:55:35 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Suz-0009fK-17;
	Fri, 10 Nov 2023 14:55:33 +0000
Date: Fri, 10 Nov 2023 22:55:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3162/30000] security/security.c:419:5:
 sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be
 static?
Message-ID: <202311102230.xQMUsOlr-lkp@intel.com>
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
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231110/202311102230.xQMUsOlr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102230.xQMUsOlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102230.xQMUsOlr-lkp@intel.com/

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

   309	
   310	/**
   311	 * lsm_file_alloc - allocate a composite file blob
   312	 * @file: the file that needs a blob
   313	 *
   314	 * Allocate the file blob for all the modules
   315	 *
   316	 * Returns 0, or -ENOMEM if memory can't be allocated.
   317	 */
 > 318	int lsm_file_alloc(struct file *file)
   319	{
   320		if (!lsm_file_cache) {
   321			file->f_security = NULL;
   322			return 0;
   323		}
   324	
   325		file->f_security = kmem_cache_zalloc(lsm_file_cache, GFP_KERNEL);
   326		if (file->f_security == NULL)
   327			return -ENOMEM;
   328		return 0;
   329	}
   330	
   331	/**
   332	 * lsm_task_alloc - allocate a composite task blob
   333	 * @task: the task that needs a blob
   334	 *
   335	 * Allocate the task blob for all the modules
   336	 *
   337	 * Returns 0, or -ENOMEM if memory can't be allocated.
   338	 */
   339	int lsm_task_alloc(struct task_struct *task)
   340	{
   341		if (blob_sizes.lbs_task == 0) {
   342			task->security = NULL;
   343			return 0;
   344		}
   345	
   346		task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
   347		if (task->security == NULL)
   348			return -ENOMEM;
   349		return 0;
   350	}
   351	
   352	/**
   353	 * lsm_early_task - during initialization allocate a composite task blob
   354	 * @task: the task that needs a blob
   355	 *
   356	 * Allocate the task blob for all the modules if it's not already there
   357	 */
   358	void lsm_early_task(struct task_struct *task)
   359	{
   360		int rc;
   361	
   362		if (task == NULL)
   363			panic("%s: task cred.\n", __func__);
   364		if (task->security != NULL)
   365			return;
   366		rc = lsm_task_alloc(task);
   367		if (rc)
   368			panic("%s: Early task alloc failed.\n", __func__);
   369	}
   370	
   371	/**
   372	 * lsm_inode_alloc - allocate a composite inode blob
   373	 * @inode: the inode that needs a blob
   374	 *
   375	 * Allocate the inode blob for all the modules
   376	 *
   377	 * Returns 0, or -ENOMEM if memory can't be allocated.
   378	 */
   379	int lsm_inode_alloc(struct inode *inode)
   380	{
   381		if (!lsm_inode_cache) {
   382			inode->i_security = NULL;
   383			return 0;
   384		}
   385	
   386		inode->i_security = kmem_cache_zalloc(lsm_inode_cache, GFP_NOFS);
   387		if (inode->i_security == NULL)
   388			return -ENOMEM;
   389		return 0;
   390	}
   391	
   392	/**
   393	 * lsm_early_inode - during initialization allocate a composite inode blob
   394	 * @inode: the inode that needs a blob
   395	 *
   396	 * Allocate the inode blob for all the modules if it's not already there
   397	 */
   398	void lsm_early_inode(struct inode *inode)
   399	{
   400		int rc;
   401	
   402		if (inode == NULL)
   403			panic("%s: NULL inode.\n", __func__);
   404		if (inode->i_security != NULL)
   405			return;
   406		rc = lsm_inode_alloc(inode);
   407		if (rc)
   408			panic("%s: Early inode alloc failed.\n", __func__);
   409	}
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
