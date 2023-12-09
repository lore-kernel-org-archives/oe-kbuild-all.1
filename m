Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC113AE3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anKsufh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702127480; x=1733663480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7re8oaYDHqRiE+fu6bMfzfrhXcGS278OjLgNP/ss6X4=;
  b=anKsufh4D0zMrIeIH8CHfyR2BOmQ+Uvc0edjKeuAL8YjTiKfVSo/YXFF
   qjmH/cwStuIdWaU6E9mTTn4Vc4e6yS8XX82UxK/sYx9uJ4qtleny3i78k
   30oEwIfLCaGks9+eltwNjoSx7EHKLv/QijuNDYMt1SQtekwO/0mB3Byjg
   ok5cTiqq/PI9qFSlUPI+CA5HVlZWsTvBIoeiFR2U+0QRqjgbCqXS2s8gr
   Xo7f6q40UEPkv1LURMWeEamqX01Fd2bheBdZ/c/wsn/HznYycYmSz7/Ls
   MZ7KqpX3JGuElVqaljAQwNe/0ijNkDkO7pT/abvRj/1yssm3NmiOEf2tW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="13203790"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="13203790"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 05:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="765795506"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="765795506"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Dec 2023 05:11:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBx6x-000FN3-23;
	Sat, 09 Dec 2023 13:11:15 +0000
Date: Sat, 9 Dec 2023 21:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 636/2029]
 security/chromiumos/inode_mark.c:221:15: error: implicit declaration of
 function 'fsnotify_add_inode_mark_locked'
Message-ID: <202312092108.pBTl0gsZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   addd3c4a70d68a6ba17a4fcdd3a2b85e660d448a
commit: c849d1910eca3b2645f02edc284ea4916f9a0e3c [636/2029] CHROMIUM: LSM: chromiumos security module
config: arm64-randconfig-002-20231209 (https://download.01.org/0day-ci/archive/20231209/202312092108.pBTl0gsZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092108.pBTl0gsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092108.pBTl0gsZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/chromiumos/inode_mark.c: In function 'chromiumos_super_block_put':
   security/chromiumos/inode_mark.c:85:17: error: implicit declaration of function 'fsnotify_destroy_group' [-Werror=implicit-function-declaration]
      85 |                 fsnotify_destroy_group(sbm->fsn_group);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c: In function 'chromiumos_super_block_create':
   security/chromiumos/inode_mark.c:163:26: error: implicit declaration of function 'fsnotify_alloc_group' [-Werror=implicit-function-declaration]
     163 |         sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops, 0);
         |                          ^~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c:163:24: warning: assignment to 'struct fsnotify_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     163 |         sbm->fsn_group = fsnotify_alloc_group(&chromiumos_fsn_ops, 0);
         |                        ^
   security/chromiumos/inode_mark.c: In function 'chromiumos_inode_mark_create':
   security/chromiumos/inode_mark.c:209:9: error: implicit declaration of function 'fsnotify_init_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     209 |         fsnotify_init_mark(&inode_mark->mark, sbm->fsn_group);
         |         ^~~~~~~~~~~~~~~~~~
         |         fsnotify_iter_mark
>> security/chromiumos/inode_mark.c:221:15: error: implicit declaration of function 'fsnotify_add_inode_mark_locked' [-Werror=implicit-function-declaration]
     221 |         ret = fsnotify_add_inode_mark_locked(&inode_mark->mark, inode, 0);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c:229:9: error: implicit declaration of function 'fsnotify_put_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     229 |         fsnotify_put_mark(&inode_mark->mark);
         |         ^~~~~~~~~~~~~~~~~
         |         fsnotify_iter_mark
   security/chromiumos/inode_mark.c: In function 'chromiumos_update_inode_security_policy':
   security/chromiumos/inode_mark.c:250:16: error: implicit declaration of function 'fsnotify_find_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     250 |         mark = fsnotify_find_mark(&inode->i_fsnotify_marks, sbm->fsn_group);
         |                ^~~~~~~~~~~~~~~~~~
         |                fsnotify_iter_mark
   security/chromiumos/inode_mark.c:250:41: error: 'struct inode' has no member named 'i_fsnotify_marks'
     250 |         mark = fsnotify_find_mark(&inode->i_fsnotify_marks, sbm->fsn_group);
         |                                         ^~
   security/chromiumos/inode_mark.c:267:25: error: implicit declaration of function 'fsnotify_detach_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     267 |                         fsnotify_detach_mark(mark);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         fsnotify_iter_mark
   security/chromiumos/inode_mark.c:278:17: error: implicit declaration of function 'fsnotify_free_mark'; did you mean 'fsnotify_iter_mark'? [-Werror=implicit-function-declaration]
     278 |                 fsnotify_free_mark(mark);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 fsnotify_iter_mark
   security/chromiumos/inode_mark.c: In function 'chromiumos_flush_inode_security_policies':
   security/chromiumos/inode_mark.c:292:17: error: implicit declaration of function 'fsnotify_clear_marks_by_group' [-Werror=implicit-function-declaration]
     292 |                 fsnotify_clear_marks_by_group(sbm->fsn_group,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/chromiumos/inode_mark.c: In function 'chromiumos_get_inode_security_policy':
   security/chromiumos/inode_mark.c:325:31: error: 'struct inode' has no member named 'i_fsnotify_marks'
     325 |                         &inode->i_fsnotify_marks, sbm->fsn_group);
         |                               ^~
   cc1: some warnings being treated as errors


vim +/fsnotify_add_inode_mark_locked +221 security/chromiumos/inode_mark.c

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
   209		fsnotify_init_mark(&inode_mark->mark, sbm->fsn_group);
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
   229		fsnotify_put_mark(&inode_mark->mark);
   230		return ret;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
