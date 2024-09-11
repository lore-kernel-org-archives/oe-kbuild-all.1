Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81FD18785F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052033; cv=none; b=YU50SQ30GIxv9wKTB1zSbosq6Ylw+HPfo9RXtWZx74ABmk3OCvKPPLjQcs+2hBvuWxDE3WLNiKrCMqrxdT/nk87KKV1b3sP49KrL8I9uAqLPMoD0PhL+1goBqHGRmEaZydHwkTs5hDJRmu3rFi6SyxcP+4/sTZJ5TIG+/2hPviU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052033; c=relaxed/simple;
	bh=oEBQLnPkT+fAOTN6gvR5GiPMAGL0owTbR4uyteifFdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OgjB+/ziz9ziDwKIUTxc//o+941hCEs7fp0svTuwpvWXt+nF6VUHH2RirtnYKAZSz3HyLxiU+X6AmzlAxxsApbmV24rwbvZgB0sRbijCJCpFDMlfRu3v56RIGihBZm3kXj+AFOvIi5Iv85x/o5rfxCn01zja5IE1KEOQvNrdgKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzId+snX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzId+snX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726052031; x=1757588031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEBQLnPkT+fAOTN6gvR5GiPMAGL0owTbR4uyteifFdM=;
  b=PzId+snXXW5ZVDrDmQlRKPZIoVeT1c3UOB7aZGulaxwDXuxORAv2eU4L
   fT4svd+SyCPQcl5cPREAeqPWWgL3aoSk9EhssLFOBGS4GbYLjjH2zP1oJ
   vn87KO1d4JV4pmrbhG0tt324Mlsb+KUfyCGlobwKVczUGNx66f0p40XPT
   13XawjVqAP/YxnE4UQtneIMs4NaR4LHc3tFkI7yBHq3k39dtBh2mQtCjX
   tMcT26XwZya7wGUjGUY4H0MsRXrjTuhT6MnrgAfTituXPt9MOVeFpWVuv
   yS4Ldmyr88YoOeiXAgdT9sb+Fi5gH+7TA01bBzjEbzx1J5ZPjj17N4JT7
   g==;
X-CSE-ConnectionGUID: eywMw4FHSxyap8oucy4O5w==
X-CSE-MsgGUID: dFCYD4lxQEaNl72M0OcaXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50257565"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="50257565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:53:49 -0700
X-CSE-ConnectionGUID: j+W03d+lRtml/F4yF/bZxA==
X-CSE-MsgGUID: 0LRJaIjsTVC7oZvBYiq5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="71705886"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2024 03:53:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soKyn-0003Pi-0a;
	Wed, 11 Sep 2024 10:53:45 +0000
Date: Wed, 11 Sep 2024 18:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 12813/15118]
 security/chromiumos/inode_mark.c:85:17: error: implicit declaration of
 function 'fsnotify_destroy_group'
Message-ID: <202409111812.wNNMAF8A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   997445cbc4f201b247ea9ceee1996ed430ca8e18
commit: 47d205e4a2ef49f85858fd69c20aa66977e7e9be [12813/15118] CHROMIUM: LSM: chromiumos security module
config: x86_64-buildonly-randconfig-005-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111812.wNNMAF8A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111812.wNNMAF8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111812.wNNMAF8A-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/chromiumos/inode_mark.c: In function 'chromiumos_super_block_put':
>> security/chromiumos/inode_mark.c:85:17: error: implicit declaration of function 'fsnotify_destroy_group' [-Werror=implicit-function-declaration]
      85 |                 fsnotify_destroy_group(sbm->fsn_group);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c: In function 'chromiumos_super_block_create':
>> security/chromiumos/inode_mark.c:163:26: error: implicit declaration of function 'fsnotify_alloc_group' [-Werror=implicit-function-declaration]
     163 |         sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops, 0);
         |                          ^~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c:163:24: warning: assignment to 'struct fsnotify_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     163 |         sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops, 0);
         |                        ^
   security/chromiumos/inode_mark.c: In function 'chromiumos_inode_mark_create':
>> security/chromiumos/inode_mark.c:209:9: error: implicit declaration of function 'fsnotify_init_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     209 |         fsnotify_init_mark(&inode_mark->mark, sbm->fsn_group);
         |         ^~~~~~~~~~~~~~~~~~
         |         fsnotify_iter_mark
>> security/chromiumos/inode_mark.c:221:15: error: implicit declaration of function 'fsnotify_add_inode_mark_locked' [-Werror=implicit-function-declaration]
     221 |         ret = fsnotify_add_inode_mark_locked(&inode_mark->mark, inode, 0);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/chromiumos/inode_mark.c:229:9: error: implicit declaration of function 'fsnotify_put_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     229 |         fsnotify_put_mark(&inode_mark->mark);
         |         ^~~~~~~~~~~~~~~~~
         |         fsnotify_iter_mark
   security/chromiumos/inode_mark.c: In function 'chromiumos_update_inode_security_policy':
>> security/chromiumos/inode_mark.c:250:16: error: implicit declaration of function 'fsnotify_find_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     250 |         mark = fsnotify_find_mark(&inode->i_fsnotify_marks, sbm->fsn_group);
         |                ^~~~~~~~~~~~~~~~~~
         |                fsnotify_iter_mark
>> security/chromiumos/inode_mark.c:250:41: error: 'struct inode' has no member named 'i_fsnotify_marks'
     250 |         mark = fsnotify_find_mark(&inode->i_fsnotify_marks, sbm->fsn_group);
         |                                         ^~
>> security/chromiumos/inode_mark.c:267:25: error: implicit declaration of function 'fsnotify_detach_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     267 |                         fsnotify_detach_mark(mark);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         fsnotify_iter_mark
>> security/chromiumos/inode_mark.c:278:17: error: implicit declaration of function 'fsnotify_free_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     278 |                 fsnotify_free_mark(mark);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 fsnotify_iter_mark
   security/chromiumos/inode_mark.c: In function 'chromiumos_flush_inode_security_policies':
>> security/chromiumos/inode_mark.c:292:17: error: implicit declaration of function 'fsnotify_clear_marks_by_group' [-Werror=implicit-function-declaration]
     292 |                 fsnotify_clear_marks_by_group(sbm->fsn_group,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c: In function 'chromiumos_get_inode_security_policy':
   security/chromiumos/inode_mark.c:325:31: error: 'struct inode' has no member named 'i_fsnotify_marks'
     325 |                         &inode->i_fsnotify_marks, sbm->fsn_group);
         |                               ^~
   cc1: some warnings being treated as errors


vim +/fsnotify_destroy_group +85 security/chromiumos/inode_mark.c

    75	
    76	static void chromiumos_super_block_put(struct chromiumos_super_block_mark *sbm)
    77	{
    78		if (atomic_dec_and_test(&sbm->refcnt)) {
    79			mutex_lock(&chromiumos_super_block_hash_lock);
    80			hlist_del_rcu(&sbm->node);
    81			mutex_unlock(&chromiumos_super_block_hash_lock);
    82	
    83			synchronize_rcu();
    84	
  > 85			fsnotify_destroy_group(sbm->fsn_group);
    86			kfree(sbm);
    87		}
    88	}
    89	
    90	static struct chromiumos_super_block_mark *
    91	chromiumos_super_block_lookup(struct super_block *sb)
    92	{
    93		struct hlist_head *hlist = chromiumos_super_block_hlist(sb);
    94		struct chromiumos_super_block_mark *sbm;
    95		struct chromiumos_super_block_mark *matching_sbm = NULL;
    96	
    97		rcu_read_lock();
    98		hlist_for_each_entry_rcu(sbm, hlist, node) {
    99			if (sbm->sb == sb && atomic_inc_not_zero(&sbm->refcnt)) {
   100				matching_sbm = sbm;
   101				break;
   102			}
   103		}
   104		rcu_read_unlock();
   105	
   106		return matching_sbm;
   107	}
   108	
   109	static int chromiumos_handle_fsnotify_event(struct fsnotify_group *group,
   110						    u32 mask, const void *data,
   111						    int data_type, struct inode *dir,
   112						    const struct qstr *file_name,
   113						    u32 cookie,
   114						    struct fsnotify_iter_info *iter_info)
   115	{
   116		/*
   117		 * This should never get called because a zero mask is set on the inode
   118		 * marks. All cases of marks going away (inode deletion, unmount,
   119		 * explicit removal) are handled in chromiumos_freeing_mark.
   120		 */
   121		WARN_ON_ONCE(1);
   122		return 0;
   123	}
   124	
   125	static void chromiumos_freeing_mark(struct fsnotify_mark *mark,
   126					    struct fsnotify_group *group)
   127	{
   128		struct chromiumos_inode_mark *inode_mark =
   129			chromiumos_to_inode_mark(mark);
   130	
   131		iput(inode_mark->inode);
   132		inode_mark->inode = NULL;
   133		chromiumos_super_block_put(group->private);
   134	}
   135	
   136	static void chromiumos_free_mark(struct fsnotify_mark *mark)
   137	{
   138		iput(chromiumos_to_inode_mark(mark)->inode);
   139		kfree(mark);
   140	}
   141	
   142	static const struct fsnotify_ops chromiumos_fsn_ops = {
   143		.handle_event = chromiumos_handle_fsnotify_event,
   144		.freeing_mark = chromiumos_freeing_mark,
   145		.free_mark = chromiumos_free_mark,
   146	};
   147	
   148	static struct chromiumos_super_block_mark *
   149	chromiumos_super_block_create(struct super_block *sb)
   150	{
   151		struct hlist_head *hlist = chromiumos_super_block_hlist(sb);
   152		struct chromiumos_super_block_mark *sbm = NULL;
   153	
   154		WARN_ON(!mutex_is_locked(&chromiumos_super_block_hash_lock));
   155	
   156		/* No match found, create a new entry. */
   157		sbm = kzalloc(sizeof(*sbm), GFP_KERNEL);
   158		if (!sbm)
   159			return ERR_PTR(-ENOMEM);
   160	
   161		atomic_set(&sbm->refcnt, 1);
   162		sbm->sb = sb;
 > 163		sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops, 0);
   164		if (IS_ERR(sbm->fsn_group)) {
   165			kfree(sbm);
   166			return ERR_CAST(sbm->fsn_group);
   167		}
   168		sbm->fsn_group->private = sbm;
   169		hlist_add_head_rcu(&sbm->node, hlist);
   170	
   171		return sbm;
   172	}
   173	
   174	static struct chromiumos_super_block_mark *
   175	chromiumos_super_block_get(struct super_block *sb)
   176	{
   177		struct chromiumos_super_block_mark *sbm;
   178	
   179		mutex_lock(&chromiumos_super_block_hash_lock);
   180		sbm = chromiumos_super_block_lookup(sb);
   181		if (!sbm)
   182			sbm = chromiumos_super_block_create(sb);
   183	
   184		mutex_unlock(&chromiumos_super_block_hash_lock);
   185		return sbm;
   186	}
   187	
   188	/*
   189	 * This will only ever get called if the metadata does not already exist for
   190	 * an inode, so no need to worry about freeing an existing mark.
   191	 */
   192	static int
   193	chromiumos_inode_mark_create(
   194		struct chromiumos_super_block_mark *sbm,
   195		struct inode *inode,
   196		enum chromiumos_inode_security_policy_type type,
   197		enum chromiumos_inode_security_policy policy)
   198	{
   199		struct chromiumos_inode_mark *inode_mark;
   200		int ret;
   201		size_t i;
   202	
   203		WARN_ON(!mutex_is_locked(&sbm->fsn_group->mark_mutex));
   204	
   205		inode_mark = kzalloc(sizeof(*inode_mark), GFP_KERNEL);
   206		if (!inode_mark)
   207			return -ENOMEM;
   208	
 > 209		fsnotify_init_mark(&inode_mark->mark, sbm->fsn_group);
   210		inode_mark->inode = igrab(inode);
   211		if (!inode_mark->inode) {
   212			ret = -ENOENT;
   213			goto out;
   214		}
   215	
   216		/* Initialize all policies to inherit. */
   217		for (i = 0; i < CHROMIUMOS_NUMBER_OF_POLICIES; i++)
   218			inode_mark->policies[i] = CHROMIUMOS_INODE_POLICY_INHERIT;
   219	
   220		inode_mark->policies[type] = policy;
 > 221		ret = fsnotify_add_inode_mark_locked(&inode_mark->mark, inode, 0);
   222		if (ret)
   223			goto out;
   224	
   225		/* Take an sbm reference so the created mark is accounted for. */
   226		atomic_inc(&sbm->refcnt);
   227	
   228	out:
 > 229		fsnotify_put_mark(&inode_mark->mark);
   230		return ret;
   231	}
   232	
   233	int chromiumos_update_inode_security_policy(
   234		struct inode *inode,
   235		enum chromiumos_inode_security_policy_type type,
   236		enum chromiumos_inode_security_policy policy)
   237	{
   238		struct chromiumos_super_block_mark *sbm;
   239		struct fsnotify_mark *mark;
   240		bool free_mark = false;
   241		int ret;
   242		size_t i;
   243	
   244		sbm = chromiumos_super_block_get(inode->i_sb);
   245		if (IS_ERR(sbm))
   246			return PTR_ERR(sbm);
   247	
   248		mutex_lock(&sbm->fsn_group->mark_mutex);
   249	
 > 250		mark = fsnotify_find_mark(&inode->i_fsnotify_marks, sbm->fsn_group);
   251		if (mark) {
   252			WRITE_ONCE(chromiumos_to_inode_mark(mark)->policies[type],
   253					   policy);
   254			/*
   255			 * Frees mark if all policies are
   256			 * CHROMIUM_INODE_POLICY_INHERIT.
   257			 */
   258			free_mark = true;
   259			for (i = 0; i < CHROMIUMOS_NUMBER_OF_POLICIES; i++) {
   260				if (chromiumos_to_inode_mark(mark)->policies[i]
   261					!= CHROMIUMOS_INODE_POLICY_INHERIT) {
   262					free_mark = false;
   263					break;
   264				}
   265			}
   266			if (free_mark)
 > 267				fsnotify_detach_mark(mark);
   268			ret = 0;
   269		} else {
   270			ret = chromiumos_inode_mark_create(sbm, inode, type, policy);
   271		}
   272	
   273		mutex_unlock(&sbm->fsn_group->mark_mutex);
   274		chromiumos_super_block_put(sbm);
   275	
   276		/* This must happen after dropping the mark mutex. */
   277		if (free_mark)
 > 278			fsnotify_free_mark(mark);
   279		if (mark)
   280			fsnotify_put_mark(mark);
   281	
   282		return ret;
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
