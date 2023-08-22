Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853A11DDEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 19:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692730971; x=1724266971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVLAhj0UhmbKCgn+Pgu3pY5P57ykNVgGm8FHRmlLeVw=;
  b=M4C74MlbfWuCo6rf19iSM9V1ptoqka48PBgJPky/kO8m5SJHTmcONK/O
   iB0ExriTszvwEjtoZ8cXYz2oOEBqoiax+xC9uvPUrvXUU0iP9w3Jf9zZT
   AwL6f/qxmJqA9RhNAX7z/EUeChdX29it+ESQ3WLFag8CBBFVq8s6gWzbz
   KiQkJ17btBpS9F5cJkTh7yIhGADxuwtc7Wz48pjZivblF9PnI2ZhJ151j
   iI8+eX9W97hJ+4KGOGX1iNLzL2nocIwoPROWFWjsSPzvIQgWVP7OPwgvu
   tJ2pk2riak3YRfy7wVRpGV5H/k9zwpK6aqqRBkImJcAHeYdWLptqFXxEr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353527887"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="353527887"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 12:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="739444342"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="739444342"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2023 12:02:48 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYWeN-0000Su-2k;
	Tue, 22 Aug 2023 19:02:47 +0000
Date: Wed, 23 Aug 2023 03:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mingzhe Zou <mingzhe.zou@easystack.cn>, colyli@suse.de,
	bcache@lists.ewheeler.net, linux-bcache@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, zoumingzhe@qq.com,
	Mingzhe Zou <mingzhe.zou@easystack.cn>
Subject: Re: [PATCH] bcache: fixup init dirty data errors
Message-ID: <202308230238.6Oed7zAt-lkp@intel.com>
References: <20230822101958.2577-1-mingzhe.zou@easystack.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822101958.2577-1-mingzhe.zou@easystack.cn>

Hi Mingzhe,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc7 next-20230822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingzhe-Zou/bcache-fixup-init-dirty-data-errors/20230822-182044
base:   linus/master
patch link:    https://lore.kernel.org/r/20230822101958.2577-1-mingzhe.zou%40easystack.cn
patch subject: [PATCH] bcache: fixup init dirty data errors
config: openrisc-randconfig-r011-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230238.6Oed7zAt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230238.6Oed7zAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230238.6Oed7zAt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/bcache/writeback.c: In function 'bch_sectors_dirty_init':
>> drivers/md/bcache/writeback.c:986:27: error: 'struct bcache_device' has no member named 'dirty_sectors'
     986 |         atomic_long_set(&d->dirty_sectors, 0);
         |                           ^~


vim +986 drivers/md/bcache/writeback.c

   976	
   977	void bch_sectors_dirty_init(struct bcache_device *d)
   978	{
   979		int i;
   980		struct bkey *k = NULL;
   981		struct btree_iter iter;
   982		struct sectors_dirty_init op;
   983		struct cache_set *c = d->c;
   984		struct bch_dirty_init_state state;
   985	
 > 986		atomic_long_set(&d->dirty_sectors, 0);
   987	
   988		/* Just count root keys if no leaf node */
   989		rw_lock(0, c->root, c->root->level);
   990		if (c->root->level == 0) {
   991			bch_btree_op_init(&op.op, -1);
   992			op.inode = d->id;
   993			op.count = 0;
   994	
   995			for_each_key_filter(&c->root->keys,
   996					    k, &iter, bch_ptr_invalid) {
   997				if (KEY_INODE(k) != op.inode)
   998					continue;
   999				sectors_dirty_init_fn(&op.op, c->root, k);
  1000			}
  1001	
  1002			rw_unlock(0, c->root);
  1003			return;
  1004		}
  1005	
  1006		memset(&state, 0, sizeof(struct bch_dirty_init_state));
  1007		state.c = c;
  1008		state.d = d;
  1009		state.total_threads = bch_btre_dirty_init_thread_nr();
  1010		state.key_idx = 0;
  1011		spin_lock_init(&state.idx_lock);
  1012		atomic_set(&state.started, 0);
  1013		atomic_set(&state.enough, 0);
  1014		init_waitqueue_head(&state.wait);
  1015	
  1016		for (i = 0; i < state.total_threads; i++) {
  1017			/* Fetch latest state.enough earlier */
  1018			smp_mb__before_atomic();
  1019			if (atomic_read(&state.enough))
  1020				break;
  1021	
  1022			state.infos[i].state = &state;
  1023			state.infos[i].thread =
  1024				kthread_run(bch_dirty_init_thread, &state.infos[i],
  1025					    "bch_dirtcnt[%d]", i);
  1026			if (IS_ERR(state.infos[i].thread)) {
  1027				pr_err("fails to run thread bch_dirty_init[%d]\n", i);
  1028				for (--i; i >= 0; i--)
  1029					kthread_stop(state.infos[i].thread);
  1030				goto out;
  1031			}
  1032			atomic_inc(&state.started);
  1033		}
  1034	
  1035	out:
  1036		/* Must wait for all threads to stop. */
  1037		wait_event(state.wait, atomic_read(&state.started) == 0);
  1038		rw_unlock(0, c->root);
  1039	}
  1040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
