Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF941EA2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686278890; x=1717814890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gAeJqYFh9NyLE0F2wuDPNczmMJ83feoanK01zJ2FPpg=;
  b=TnbUc91L2eIVxQoJGg4R7xsHwMALYrEObA5KjRdS8dH9cRZ5Vo7hVVGA
   Wcbbl6/7eypOQVl+Rx5ArSvJLs4iYP917VlEVg6EEKqG1iWSSPNZAsTZK
   h3hFB5ftdWM6Nx+tig3DSZJ5Og/KiMLIVM6ZW2uyluaSlUnPY2flYS3FO
   qANJ2lDEfuczDcE1MFPWuQyI837IKNbO2kYGJA3D47uOkbGH5PTMfNlH3
   orEeqPGK7b8K6EfHKnae1yx/bIVBQW45xLbkUvMIOU+fX2ICOnksnW7Dp
   cB+vxLSFHVBrIuNrHQvbHaVPwCWA2w5mQly9Vsvt3nHPjjzCSpAlk4ug8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385848685"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="385848685"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740003198"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="740003198"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jun 2023 19:48:07 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SAZ-0008Xa-0U;
	Fri, 09 Jun 2023 02:48:07 +0000
Date: Fri, 9 Jun 2023 10:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:ma_v4 6/7] kernel/bpf/memalloc.c:452:17: error: implicit
 declaration of function 'rcu_momentary_dyntick_idle2'; did you mean
 'rcu_momentary_dyntick_idle'?
Message-ID: <202306091000.5hwo6zDH-lkp@intel.com>
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
config: openrisc-randconfig-r026-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091000.5hwo6zDH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?id=45acfe8484365cc1aa89e3d676697ce69ff4169b
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git
        git fetch --no-tags ast-bpf ma_v4
        git checkout 45acfe8484365cc1aa89e3d676697ce69ff4169b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash kernel/bpf/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091000.5hwo6zDH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/bpf/memalloc.c: In function 'free_rcu':
>> kernel/bpf/memalloc.c:307:13: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     307 |         int cnt;
         |             ^~~
   kernel/bpf/memalloc.c: In function 'bpf_ma_reuse_tt_cb':
   kernel/bpf/memalloc.c:327:13: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
     327 |         int cnt;
         |             ^~~
   kernel/bpf/memalloc.c: In function 'bpf_ma_add_to_reuse_ready_or_free':
   kernel/bpf/memalloc.c:340:33: warning: unused variable 'batch' [-Wunused-variable]
     340 |         struct bpf_reuse_batch *batch;
         |                                 ^~~~~
   kernel/bpf/memalloc.c: In function 'reuse_bulk':
>> kernel/bpf/memalloc.c:452:17: error: implicit declaration of function 'rcu_momentary_dyntick_idle2'; did you mean 'rcu_momentary_dyntick_idle'? [-Werror=implicit-function-declaration]
     452 |                 rcu_momentary_dyntick_idle2();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 rcu_momentary_dyntick_idle
   kernel/bpf/memalloc.c: At top level:
   kernel/bpf/memalloc.c:323:13: warning: 'bpf_ma_reuse_tt_cb' defined but not used [-Wunused-function]
     323 | static void bpf_ma_reuse_tt_cb(struct rcu_head *rcu)
         |             ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +452 kernel/bpf/memalloc.c

   301	
   302	static void free_rcu(struct rcu_head *rcu)
   303	{
   304		struct bpf_mem_shared_cache *sc = container_of(rcu, struct bpf_mem_shared_cache, rcu);
   305		struct llist_node *head;
   306		unsigned long flags;
 > 307		int cnt;
   308	
   309		raw_spin_lock_irqsave(&sc->reuse_lock, flags);
   310		head = __llist_del_all(&sc->wait_for_free);
   311		raw_spin_unlock_irqrestore(&sc->reuse_lock, flags);
   312		cnt = free_all(head, sc->percpu);
   313	//	printk("after rcu_tasks_trace GP %d\n", cnt);
   314		atomic_set(&sc->call_rcu_in_progress, 0);
   315	}
   316	
   317	struct bpf_reuse_batch {
   318		struct bpf_mem_cache *c;
   319		struct llist_node *head, *tail;
   320		struct rcu_head rcu;
   321	};
   322	
   323	static void bpf_ma_reuse_tt_cb(struct rcu_head *rcu)
   324	{
   325		struct bpf_reuse_batch *batch = container_of(rcu, struct bpf_reuse_batch, rcu);
   326		struct bpf_mem_cache *c = batch->c;
   327		int cnt;
   328	
   329		cnt = free_all(batch->head, false);
   330	//	printk("after rcu_tasks_trace GP cb %d\n", cnt);
   331		kfree(batch);
   332		c->reuse_tt_cb_in_progress--;
   333	}
   334	
   335	
   336	static void bpf_ma_add_to_reuse_ready_or_free(struct bpf_mem_cache *c)
   337	{
   338		struct bpf_mem_shared_cache *sc = c->sc;
   339		struct llist_node *head, *tail;
   340		struct bpf_reuse_batch *batch;
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
   368	/*	if (c->reuse_tt_cb_in_progress >= 10)
   369			return;
   370		batch = kmalloc(sizeof(*batch), GFP_ATOMIC);
   371		if (batch) {
   372			head = __llist_del_all(&c->reuse_ready_head);
   373			tail = c->reuse_ready_tail;
   374			c->reuse_ready_tail = NULL;
   375			batch->c = c;
   376			batch->head = head;
   377			batch->tail = tail;
   378			c->reuse_tt_cb_in_progress++;
   379			call_rcu_tasks_trace(&batch->rcu, bpf_ma_reuse_tt_cb);
   380			return;
   381		}*/
   382	
   383		if (!atomic_xchg(&sc->call_rcu_in_progress, 1)) {
   384	//		printk("cpu %d reuse_cb_in_progress %d\n", raw_smp_processor_id(), c->reuse_cb_in_progress);
   385			head = __llist_del_all(&c->reuse_ready_head);
   386			tail = c->reuse_ready_tail;
   387			c->reuse_ready_tail = NULL;
   388			raw_spin_lock_irqsave(&sc->reuse_lock, flags);
   389			WARN_ON_ONCE(!llist_empty(&sc->wait_for_free));
   390			__llist_add_batch(head, tail, &sc->wait_for_free);
   391			raw_spin_unlock_irqrestore(&sc->reuse_lock, flags);
   392			call_rcu_tasks_trace(&sc->rcu, free_rcu);
   393		}
   394	}
   395	
   396	
   397	static void reuse_rcu(struct rcu_head *rcu)
   398	{
   399		struct bpf_mem_cache *c = container_of(rcu, struct bpf_mem_cache, rcu);
   400	
   401		bpf_ma_add_to_reuse_ready_or_free(c);
   402		atomic_set(&c->call_rcu_in_progress, 0);
   403	}
   404	
   405	static void bpf_ma_reuse_cb(struct rcu_head *rcu)
   406	{
   407		struct bpf_reuse_batch *batch = container_of(rcu, struct bpf_reuse_batch, rcu);
   408		struct bpf_mem_cache *c = batch->c;
   409	
   410		if (llist_empty(&c->waiting_for_gp))
   411			c->waiting_for_gp_tail = batch->tail;
   412		__llist_add_batch(batch->head, batch->tail, &c->waiting_for_gp);
   413		kfree(batch);
   414		bpf_ma_add_to_reuse_ready_or_free(c);
   415		c->reuse_cb_in_progress--;
   416	}
   417	
   418	static void reuse_bulk(struct bpf_mem_cache *c)
   419	{
   420		struct llist_node *head, *tail, *llnode, *tmp;
   421		unsigned long flags;
   422		struct bpf_reuse_batch *batch;
   423	
   424		if (IS_ENABLED(CONFIG_PREEMPT_RT))
   425			local_irq_save(flags);
   426		WARN_ON_ONCE(local_inc_return(&c->active) != 1);
   427		head = __llist_del_all(&c->prepare_reuse_head);
   428		tail = c->prepare_reuse_tail;
   429		c->prepare_reuse_tail = NULL;
   430		c->prepare_reuse_cnt = 0;
   431		local_dec(&c->active);
   432		if (IS_ENABLED(CONFIG_PREEMPT_RT))
   433			local_irq_restore(flags);
   434	
   435		llist_for_each_safe(llnode, tmp, llist_del_all(&c->free_llist_extra)) {
   436			if (!head)
   437				tail = llnode;
   438			llnode->next = head;
   439			head = llnode->next;
   440		}
   441		WARN_ON_ONCE(!head);
   442	
   443		/* bpf_mem_cache is a per-cpu object. Freeing happens in irq_work.
   444		 * Nothing races to add to free_by_rcu list.
   445		 */
   446		if (llist_empty(&c->free_by_rcu))
   447			c->free_by_rcu_tail = tail;
   448		__llist_add_batch(head, tail, &c->free_by_rcu);
   449	
   450		if (c->reuse_cb_in_progress >= 100 || 1) {
   451	//		local_irq_save(flags);
 > 452			rcu_momentary_dyntick_idle2();
   453	//		local_irq_restore(flags);
   454		}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
