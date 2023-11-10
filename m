Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1F3B2B7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuE4a82y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699646683; x=1731182683;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YIp/upjfXyi0jqbSmJEq6uzQL9DAtAaFANenu+r8rsc=;
  b=BuE4a82yYW/ttjtJLS2UJnt/Lq7NmNEeOfY/Hc6HBLNSPEou/cTRQ3Xr
   g5txg1+DbaPTYlzhZy0hwAUMXk/VHxGb9UldXyK5yTOF3st+OU+row+FX
   lwXTLxm+cfnSUzkEJtoThpD8uzmZDveKK2W/J5yPcdfaZwtYU6xa2KAuy
   OF4XADPxoKp6Ajf9x68hwJBerQpOK8L5HxhYJ5d4Wc2Z0+1ilTsTAcjB8
   Ntu4G2aeRtLSYn7awMCAlrIk0pljfmQDfnxzU4cUuAFiVH92LqVGUuoUz
   Zj6iMJfQSNIf7n3+H4j1OqfTfBwxvtlTSOeVoB+lirg5/kJzk07IhKaW1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394133174"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="394133174"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 12:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757282897"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="757282897"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 12:04:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Xk7-0009ro-0k;
	Fri, 10 Nov 2023 20:04:39 +0000
Date: Sat, 11 Nov 2023 04:03:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3164/30000] security/security.c:427:5:
 sparse: sparse: symbol 'lsm_ipc_alloc' was not declared. Should it be
 static?
Message-ID: <202311110351.qQiI1dcK-lkp@intel.com>
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
commit: e92c67fcf33bb79af9bb6e9887452ab8d5d832c2 [3164/30000] LSM: Infrastructure management of the ipc security blob
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231111/202311110351.qQiI1dcK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110351.qQiI1dcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110351.qQiI1dcK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:326:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
   security/security.c:347:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
>> security/security.c:427:5: sparse: sparse: symbol 'lsm_ipc_alloc' was not declared. Should it be static?
>> security/security.c:448:5: sparse: sparse: symbol 'lsm_msg_msg_alloc' was not declared. Should it be static?
   security/security.c:470:5: sparse: sparse: symbol 'lsm_sock_alloc' was not declared. Should it be static?
   security/security.c:491:5: sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be static?
   security/security.c:326:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     326 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:347:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     347 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~
   security/security.c:427:5: warning: no previous prototype for 'lsm_ipc_alloc' [-Wmissing-prototypes]
     427 | int lsm_ipc_alloc(struct kern_ipc_perm *kip)
         |     ^~~~~~~~~~~~~
   security/security.c:448:5: warning: no previous prototype for 'lsm_msg_msg_alloc' [-Wmissing-prototypes]
     448 | int lsm_msg_msg_alloc(struct msg_msg *mp)
         |     ^~~~~~~~~~~~~~~~~
   security/security.c:470:5: warning: no previous prototype for 'lsm_sock_alloc' [-Wmissing-prototypes]
     470 | int lsm_sock_alloc(struct sock *sock, gfp_t priority)
         |     ^~~~~~~~~~~~~~
   security/security.c:491:5: warning: no previous prototype for 'lsm_superblock_alloc' [-Wmissing-prototypes]
     491 | int lsm_superblock_alloc(struct super_block *sb)
         |     ^~~~~~~~~~~~~~~~~~~~

vim +/lsm_ipc_alloc +427 security/security.c

   317	
   318	/**
   319	 * lsm_file_alloc - allocate a composite file blob
   320	 * @file: the file that needs a blob
   321	 *
   322	 * Allocate the file blob for all the modules
   323	 *
   324	 * Returns 0, or -ENOMEM if memory can't be allocated.
   325	 */
 > 326	int lsm_file_alloc(struct file *file)
   327	{
   328		if (!lsm_file_cache) {
   329			file->f_security = NULL;
   330			return 0;
   331		}
   332	
   333		file->f_security = kmem_cache_zalloc(lsm_file_cache, GFP_KERNEL);
   334		if (file->f_security == NULL)
   335			return -ENOMEM;
   336		return 0;
   337	}
   338	
   339	/**
   340	 * lsm_task_alloc - allocate a composite task blob
   341	 * @task: the task that needs a blob
   342	 *
   343	 * Allocate the task blob for all the modules
   344	 *
   345	 * Returns 0, or -ENOMEM if memory can't be allocated.
   346	 */
   347	int lsm_task_alloc(struct task_struct *task)
   348	{
   349		if (blob_sizes.lbs_task == 0) {
   350			task->security = NULL;
   351			return 0;
   352		}
   353	
   354		task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
   355		if (task->security == NULL)
   356			return -ENOMEM;
   357		return 0;
   358	}
   359	
   360	/**
   361	 * lsm_early_task - during initialization allocate a composite task blob
   362	 * @task: the task that needs a blob
   363	 *
   364	 * Allocate the task blob for all the modules if it's not already there
   365	 */
   366	void lsm_early_task(struct task_struct *task)
   367	{
   368		int rc;
   369	
   370		if (task == NULL)
   371			panic("%s: task cred.\n", __func__);
   372		if (task->security != NULL)
   373			return;
   374		rc = lsm_task_alloc(task);
   375		if (rc)
   376			panic("%s: Early task alloc failed.\n", __func__);
   377	}
   378	
   379	/**
   380	 * lsm_inode_alloc - allocate a composite inode blob
   381	 * @inode: the inode that needs a blob
   382	 *
   383	 * Allocate the inode blob for all the modules
   384	 *
   385	 * Returns 0, or -ENOMEM if memory can't be allocated.
   386	 */
   387	int lsm_inode_alloc(struct inode *inode)
   388	{
   389		if (!lsm_inode_cache) {
   390			inode->i_security = NULL;
   391			return 0;
   392		}
   393	
   394		inode->i_security = kmem_cache_zalloc(lsm_inode_cache, GFP_NOFS);
   395		if (inode->i_security == NULL)
   396			return -ENOMEM;
   397		return 0;
   398	}
   399	
   400	/**
   401	 * lsm_early_inode - during initialization allocate a composite inode blob
   402	 * @inode: the inode that needs a blob
   403	 *
   404	 * Allocate the inode blob for all the modules if it's not already there
   405	 */
   406	void lsm_early_inode(struct inode *inode)
   407	{
   408		int rc;
   409	
   410		if (inode == NULL)
   411			panic("%s: NULL inode.\n", __func__);
   412		if (inode->i_security != NULL)
   413			return;
   414		rc = lsm_inode_alloc(inode);
   415		if (rc)
   416			panic("%s: Early inode alloc failed.\n", __func__);
   417	}
   418	
   419	/**
   420	 * lsm_ipc_alloc - allocate a composite ipc blob
   421	 * @kip: the ipc that needs a blob
   422	 *
   423	 * Allocate the ipc blob for all the modules
   424	 *
   425	 * Returns 0, or -ENOMEM if memory can't be allocated.
   426	 */
 > 427	int lsm_ipc_alloc(struct kern_ipc_perm *kip)
   428	{
   429		if (blob_sizes.lbs_ipc == 0) {
   430			kip->security = NULL;
   431			return 0;
   432		}
   433	
   434		kip->security = kzalloc(blob_sizes.lbs_ipc, GFP_KERNEL);
   435		if (kip->security == NULL)
   436			return -ENOMEM;
   437		return 0;
   438	}
   439	
   440	/**
   441	 * lsm_msg_msg_alloc - allocate a composite msg_msg blob
   442	 * @mp: the msg_msg that needs a blob
   443	 *
   444	 * Allocate the ipc blob for all the modules
   445	 *
   446	 * Returns 0, or -ENOMEM if memory can't be allocated.
   447	 */
 > 448	int lsm_msg_msg_alloc(struct msg_msg *mp)
   449	{
   450		if (blob_sizes.lbs_msg_msg == 0) {
   451			mp->security = NULL;
   452			return 0;
   453		}
   454	
   455		mp->security = kzalloc(blob_sizes.lbs_msg_msg, GFP_KERNEL);
   456		if (mp->security == NULL)
   457			return -ENOMEM;
   458		return 0;
   459	}
   460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
