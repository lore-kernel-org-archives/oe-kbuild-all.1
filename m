Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D731C3D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 03:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686281651; x=1717817651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvTtdpSo1OrLEmOySeUvc6Eax3md1KZe9RrjfP80S5s=;
  b=N0ndXWI7vi94UIr4sITJCmTJ5zxaaQ0REMfDBhrEFivNQvGKR4vCN15I
   ELS2Swi4bLBMUptIK08pgAbdxYuKdS8KqlvQAQ1H7WpaWE/GZS0hWmmxJ
   C4CKmpCGdntAPzwtW1bYrYLkJKz4XlsrvVXmPAVIadGugKqizlxceEvVc
   gXNLSCsGFy8JGQ4/1WkjucdDfZH4G/dKb2C+Yk9XIQbj8yryq4/77GLrY
   pntkMcgKQDXIUN0wboyS0NwkAJ4a0208bzmAZ6CDJKg/UozZkFOogDipc
   TDIfk1viYRLBZccO9Tm/DBYsVcPXwbmbjqZsh2nOZ8cJbbiUwzpbN5LdH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443870725"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="443870725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="854592824"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="854592824"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2023 20:33:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SsB-0008aU-05;
	Fri, 09 Jun 2023 03:33:11 +0000
Date: Fri, 9 Jun 2023 11:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:ma_v4 6/7] kernel/bpf/memalloc.c:340:33: warning: unused
 variable 'batch'
Message-ID: <202306091123.A4GmNMVr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git ma_v4
head:   86c9deee3b8263f7546b8bad1e1a8d9662503ded
commit: 45acfe8484365cc1aa89e3d676697ce69ff4169b [6/7] hack 3
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230609/202306091123.A4GmNMVr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?id=45acfe8484365cc1aa89e3d676697ce69ff4169b
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git
        git fetch --no-tags ast-bpf ma_v4
        git checkout 45acfe8484365cc1aa89e3d676697ce69ff4169b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091123.A4GmNMVr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/memalloc.c: In function 'free_rcu':
   kernel/bpf/memalloc.c:307:13: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     307 |         int cnt;
         |             ^~~
   kernel/bpf/memalloc.c: In function 'bpf_ma_reuse_tt_cb':
   kernel/bpf/memalloc.c:327:13: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     327 |         int cnt;
         |             ^~~
   kernel/bpf/memalloc.c: In function 'bpf_ma_add_to_reuse_ready_or_free':
>> kernel/bpf/memalloc.c:340:33: warning: unused variable 'batch' [-Wunused-variable]
     340 |         struct bpf_reuse_batch *batch;
         |                                 ^~~~~
   kernel/bpf/memalloc.c: At top level:
   kernel/bpf/memalloc.c:323:13: warning: 'bpf_ma_reuse_tt_cb' defined but not used [-Wunused-function]
     323 | static void bpf_ma_reuse_tt_cb(struct rcu_head *rcu)
         |             ^~~~~~~~~~~~~~~~~~


vim +/batch +340 kernel/bpf/memalloc.c

   334	
   335	
   336	static void bpf_ma_add_to_reuse_ready_or_free(struct bpf_mem_cache *c)
   337	{
   338		struct bpf_mem_shared_cache *sc = c->sc;
   339		struct llist_node *head, *tail;
 > 340		struct bpf_reuse_batch *batch;
   341		unsigned long flags;
   342	
   343		/* Draining could be running concurrently with reuse_rcu() */
   344		raw_spin_lock_irqsave(&c->lock, flags);
   345		head = __llist_del_all(&c->waiting_for_gp);
   346		tail = c->waiting_for_gp_tail;
   347		c->waiting_for_gp_tail = NULL;
   348		raw_spin_unlock_irqrestore(&c->lock, flags);
   349		/* Draining is in progress ? */
   350		if (!head)
   351			return;
   352	
   353		if (llist_empty(&c->reuse_ready_head))
   354			c->reuse_ready_tail = tail;
   355		__llist_add_batch(head, tail, &c->reuse_ready_head);
   356	
   357		/* Don't move these objects to reuse_ready list and free
   358		 * these objects directly.
   359		 */
   360	/*	if (sc->direct_free) {
   361			free_all(head, sc->percpu);
   362			return;
   363		}*/
   364	/*		local_irq_save(flags);
   365			rcu_momentary_dyntick_idle();
   366			local_irq_restore(flags);*/
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
