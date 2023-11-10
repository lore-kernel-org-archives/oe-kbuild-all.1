Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BED3C6BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3fRzy+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699655017; x=1731191017;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cCok9+k2L0P6SA1Xwwf0bzKFTwpMF5YLqJ9wCPZSAbE=;
  b=Z3fRzy+wXd7/0QAibunloRUAexHxTPF18ZVEvH9gkRnAYqjkL4rJhMV1
   EC2wRro1Lo/qDRwWsrBEYyHImv0pdamL1v8b6vWeinHVjGV7OaljQHKg5
   21E9yHuf+W38CeTCgaiFE+NwN17tMT7zuriIINPl13j5L0Ui89HzrRZCn
   5+7p6T38bnvtdcGZoMVUjPLGp+3yu+1bcMJcPF8oL4AnPH8+LwrbJQ//E
   cZlFNQXXjSHh7QLCJB1AzfFs8Qe+JVbyxrzDVVWp6mntu5scvY4zF2JQm
   +KrD0rx8gp1pyMPcWJsGtszJggZxjW2BQNrV2uekz2yurTRbOngCPnP/Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="11789711"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11789711"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 14:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792941324"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="792941324"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2023 14:23:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ZuV-0009yK-2t;
	Fri, 10 Nov 2023 22:23:31 +0000
Date: Sat, 11 Nov 2023 06:22:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3165/30000] security/security.c:455:5:
 sparse: sparse: symbol 'lsm_key_alloc' was not declared. Should it be
 static?
Message-ID: <202311110657.fRXZCgID-lkp@intel.com>
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
commit: 1d4be734af45c0b49e13f8377be93c2f5cb01a6b [3165/30000] LSM: Infrastructure management of the key security blob
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231111/202311110657.fRXZCgID-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110657.fRXZCgID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110657.fRXZCgID-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:332:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
   security/security.c:353:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
   security/security.c:433:5: sparse: sparse: symbol 'lsm_ipc_alloc' was not declared. Should it be static?
>> security/security.c:455:5: sparse: sparse: symbol 'lsm_key_alloc' was not declared. Should it be static?
   security/security.c:477:5: sparse: sparse: symbol 'lsm_msg_msg_alloc' was not declared. Should it be static?
   security/security.c:499:5: sparse: sparse: symbol 'lsm_sock_alloc' was not declared. Should it be static?
   security/security.c:520:5: sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be static?
   security/security.c:332:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     332 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:353:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     353 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~
   security/security.c:433:5: warning: no previous prototype for 'lsm_ipc_alloc' [-Wmissing-prototypes]
     433 | int lsm_ipc_alloc(struct kern_ipc_perm *kip)
         |     ^~~~~~~~~~~~~
   security/security.c:455:5: warning: no previous prototype for 'lsm_key_alloc' [-Wmissing-prototypes]
     455 | int lsm_key_alloc(struct key *key)
         |     ^~~~~~~~~~~~~
   security/security.c:477:5: warning: no previous prototype for 'lsm_msg_msg_alloc' [-Wmissing-prototypes]
     477 | int lsm_msg_msg_alloc(struct msg_msg *mp)
         |     ^~~~~~~~~~~~~~~~~
   security/security.c:499:5: warning: no previous prototype for 'lsm_sock_alloc' [-Wmissing-prototypes]
     499 | int lsm_sock_alloc(struct sock *sock, gfp_t priority)
         |     ^~~~~~~~~~~~~~
   security/security.c:520:5: warning: no previous prototype for 'lsm_superblock_alloc' [-Wmissing-prototypes]
     520 | int lsm_superblock_alloc(struct super_block *sb)
         |     ^~~~~~~~~~~~~~~~~~~~

vim +/lsm_key_alloc +455 security/security.c

   323	
   324	/**
   325	 * lsm_file_alloc - allocate a composite file blob
   326	 * @file: the file that needs a blob
   327	 *
   328	 * Allocate the file blob for all the modules
   329	 *
   330	 * Returns 0, or -ENOMEM if memory can't be allocated.
   331	 */
 > 332	int lsm_file_alloc(struct file *file)
   333	{
   334		if (!lsm_file_cache) {
   335			file->f_security = NULL;
   336			return 0;
   337		}
   338	
   339		file->f_security = kmem_cache_zalloc(lsm_file_cache, GFP_KERNEL);
   340		if (file->f_security == NULL)
   341			return -ENOMEM;
   342		return 0;
   343	}
   344	
   345	/**
   346	 * lsm_task_alloc - allocate a composite task blob
   347	 * @task: the task that needs a blob
   348	 *
   349	 * Allocate the task blob for all the modules
   350	 *
   351	 * Returns 0, or -ENOMEM if memory can't be allocated.
   352	 */
   353	int lsm_task_alloc(struct task_struct *task)
   354	{
   355		if (blob_sizes.lbs_task == 0) {
   356			task->security = NULL;
   357			return 0;
   358		}
   359	
   360		task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
   361		if (task->security == NULL)
   362			return -ENOMEM;
   363		return 0;
   364	}
   365	
   366	/**
   367	 * lsm_early_task - during initialization allocate a composite task blob
   368	 * @task: the task that needs a blob
   369	 *
   370	 * Allocate the task blob for all the modules if it's not already there
   371	 */
   372	void lsm_early_task(struct task_struct *task)
   373	{
   374		int rc;
   375	
   376		if (task == NULL)
   377			panic("%s: task cred.\n", __func__);
   378		if (task->security != NULL)
   379			return;
   380		rc = lsm_task_alloc(task);
   381		if (rc)
   382			panic("%s: Early task alloc failed.\n", __func__);
   383	}
   384	
   385	/**
   386	 * lsm_inode_alloc - allocate a composite inode blob
   387	 * @inode: the inode that needs a blob
   388	 *
   389	 * Allocate the inode blob for all the modules
   390	 *
   391	 * Returns 0, or -ENOMEM if memory can't be allocated.
   392	 */
   393	int lsm_inode_alloc(struct inode *inode)
   394	{
   395		if (!lsm_inode_cache) {
   396			inode->i_security = NULL;
   397			return 0;
   398		}
   399	
   400		inode->i_security = kmem_cache_zalloc(lsm_inode_cache, GFP_NOFS);
   401		if (inode->i_security == NULL)
   402			return -ENOMEM;
   403		return 0;
   404	}
   405	
   406	/**
   407	 * lsm_early_inode - during initialization allocate a composite inode blob
   408	 * @inode: the inode that needs a blob
   409	 *
   410	 * Allocate the inode blob for all the modules if it's not already there
   411	 */
   412	void lsm_early_inode(struct inode *inode)
   413	{
   414		int rc;
   415	
   416		if (inode == NULL)
   417			panic("%s: NULL inode.\n", __func__);
   418		if (inode->i_security != NULL)
   419			return;
   420		rc = lsm_inode_alloc(inode);
   421		if (rc)
   422			panic("%s: Early inode alloc failed.\n", __func__);
   423	}
   424	
   425	/**
   426	 * lsm_ipc_alloc - allocate a composite ipc blob
   427	 * @kip: the ipc that needs a blob
   428	 *
   429	 * Allocate the ipc blob for all the modules
   430	 *
   431	 * Returns 0, or -ENOMEM if memory can't be allocated.
   432	 */
   433	int lsm_ipc_alloc(struct kern_ipc_perm *kip)
   434	{
   435		if (blob_sizes.lbs_ipc == 0) {
   436			kip->security = NULL;
   437			return 0;
   438		}
   439	
   440		kip->security = kzalloc(blob_sizes.lbs_ipc, GFP_KERNEL);
   441		if (kip->security == NULL)
   442			return -ENOMEM;
   443		return 0;
   444	}
   445	
   446	#ifdef CONFIG_KEYS
   447	/**
   448	 * lsm_key_alloc - allocate a composite key blob
   449	 * @key: the key that needs a blob
   450	 *
   451	 * Allocate the key blob for all the modules
   452	 *
   453	 * Returns 0, or -ENOMEM if memory can't be allocated.
   454	 */
 > 455	int lsm_key_alloc(struct key *key)
   456	{
   457		if (blob_sizes.lbs_key == 0) {
   458			key->security = NULL;
   459			return 0;
   460		}
   461	
   462		key->security = kzalloc(blob_sizes.lbs_key, GFP_KERNEL);
   463		if (key->security == NULL)
   464			return -ENOMEM;
   465		return 0;
   466	}
   467	#endif /* CONFIG_KEYS */
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
