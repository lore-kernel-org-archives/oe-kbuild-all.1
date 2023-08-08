Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C711384
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 03:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691466401; x=1723002401;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xUg3B+RWPjrWronFZ/fXc/6cAVzvj11mVXl/ua3tLGE=;
  b=mY2YIoubXYNfOvRaGQDehjMSiIw4E3oSTP9EOOUt3cictX/7sLTRuOnM
   0kUPEdYLnZINZGhupTVykvJwI87djSckV5mHCuTygVfFEObAzRU7+TD5W
   HarKq1dtTswi5As6der/RwSx0GCTzIKVLLtAlr+2jzA6q0m/P3HvJ/4K/
   9gV+qsTp+vvcHiYZsmnR8jr5ihg0DyM99UUa1vYOScQm3C291F4VxUgKP
   e6QOINhYLCi7Q1EX9dvlugMjma9TC5c24arjUW8lJt20ooAWI7ak3w0h1
   lATAHAW+MZDcD7wI9tz5iFxqfJRQj14V3bdH1P9qt2/j3VAXMc6DKHrHU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369606053"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="369606053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 20:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977706604"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="977706604"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2023 20:46:39 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTDg7-00054O-0M;
	Tue, 08 Aug 2023 03:46:39 +0000
Date: Tue, 8 Aug 2023 11:45:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 3693/30000] security/security.c:455:5:
 sparse: sparse: symbol 'lsm_key_alloc' was not declared. Should it be
 static?
Message-ID: <202308081134.GP0OPC6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: 1d4be734af45c0b49e13f8377be93c2f5cb01a6b [3693/30000] LSM: Infrastructure management of the key security blob
config: sparc64-randconfig-r083-20230807 (https://download.01.org/0day-ci/archive/20230808/202308081134.GP0OPC6y-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081134.GP0OPC6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081134.GP0OPC6y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:332:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
   security/security.c:353:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
   security/security.c:433:5: sparse: sparse: symbol 'lsm_ipc_alloc' was not declared. Should it be static?
>> security/security.c:455:5: sparse: sparse: symbol 'lsm_key_alloc' was not declared. Should it be static?
   security/security.c:477:5: sparse: sparse: symbol 'lsm_msg_msg_alloc' was not declared. Should it be static?
   security/security.c:499:5: sparse: sparse: symbol 'lsm_sock_alloc' was not declared. Should it be static?
   security/security.c:520:5: sparse: sparse: symbol 'lsm_superblock_alloc' was not declared. Should it be static?
   In file included from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/timer.h:5,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:12,
                    from security/security.c:15:
   include/linux/atomic.h: In function 'atomic_fetch_add_unless':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                17-      |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     20-      |                              ^~~~
   include/linux/atomic.h:578:17: note: in expansion of macro 'if'
     578 |                 if (unlikely(c == u))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:578:21: note: in expansion of macro 'unlikely'
     578 |                 if (unlikely(c == u))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     32-      |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:578:17: note: in expansion of macro 'if'
     578 |                 if (unlikely(c == u))
         |                 ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                41-      |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     44-      |                              ^~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       47-      |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:478:13: note: in expansion of macro 'unlikely'
     478 |         if (unlikely(__r != __o))                                       53-      |             ^~~~~~~~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:580:19: note: in expansion of macro 'atomic_try_cmpxchg'
     580 |         } while (!atomic_try_cmpxchg(v, &c, c + a));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     62-      |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       68-      |         ^~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:580:19: note: in expansion of macro 'atomic_try_cmpxchg'
     580 |         } while (!atomic_try_cmpxchg(v, &c, c + a));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/atomic.h: In function 'atomic_inc_unless_negative':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                78-      |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     81-      |                              ^~~~
   include/linux/atomic.h:679:17: note: in expansion of macro 'if'
     679 |                 if (unlikely(c < 0))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:679:21: note: in expansion of macro 'unlikely'
     679 |                 if (unlikely(c < 0))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     93-      |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:679:17: note: in expansion of macro 'if'
     679 |                 if (unlikely(c < 0))
         |                 ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                102-      |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'

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
