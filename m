Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADACB6ABB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 22:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UYxiu4JuZuvXSFs7UW2Xio1r/rxoHQ/NzeGcLT+O5ss=; b=dE0YBsIJ3UakmJY9WvohMxw5of
	x0WyDdO9dgGOss7XT6TAQ/cwIksk0goutLKwbWJDtXjonc9Zq61SRH276xtLYt7aTPIZsJF0dD/7U
	KhbN6U3kCP+n6v58Czg/wHf4wlEL6SlDuu1o84RTxZsNYKyIarm475Ow9WbECK4pJYmhMVd3pGJAL
	+91jhfm+vhH3vPaJ/jbMSPLn2eYwiOXt4Q28OYpMTCtF/N2Ypplz1EU5MNzIzhs+53kZkmLC9LpTB
	TWZnJtHMeRWXGU8oeesErfmKH2peMEkl0xmGJnLVZ5QOpM1G0NRpIkiRqIlfsBI+f06zgkF8jrUg1
	R/zcQ7RQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qQyIy-00BTU3-Ha; Tue, 01 Aug 2023 22:57:28 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 274D3300134;
	Wed,  2 Aug 2023 00:57:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 07553203719D4; Wed,  2 Aug 2023 00:57:27 +0200 (CEST)
Date: Wed, 2 Aug 2023 00:57:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Phil Auld <pauld@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 6/6] kernel/sched/fair.c:6274:6: error:
 redefinition of 'cfs_task_bw_constrained'
Message-ID: <20230801225727.GE119080@hirez.programming.kicks-ass.net>
References: <202308020619.VgTRqYwU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308020619.VgTRqYwU-lkp@intel.com>

On Wed, Aug 02, 2023 at 06:51:37AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> head:   e8d5ff8258bf73b585e921af5bd967057f17a738
> commit: e8d5ff8258bf73b585e921af5bd967057f17a738 [6/6] sched/fair: Block nohz tick_stop when cfs bandwidth in use
> config: i386-buildonly-randconfig-r005-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020619.VgTRqYwU-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020619.VgTRqYwU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308020619.VgTRqYwU-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/sched/fair.c:6261:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
>     6261 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
>          |      ^~~~~~~~~~~~~~~~~~
> >> kernel/sched/fair.c:6274:6: error: redefinition of 'cfs_task_bw_constrained'
>     6274 | bool cfs_task_bw_constrained(struct task_struct *p)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~
>    In file included from kernel/sched/fair.c:55:
>    kernel/sched/sched.h:498:20: note: previous definition of 'cfs_task_bw_constrained' with type 'bool(struct task_struct *)' {aka '_Bool(struct task_struct *)'}
>      498 | static inline bool cfs_task_bw_constrained(struct task_struct *p) { return false; }
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/sched/fair.c:12881:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
>    12881 | void free_fair_sched_group(struct task_group *tg) { }
>          |      ^~~~~~~~~~~~~~~~~~~~~
>    kernel/sched/fair.c:12883:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
>    12883 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>          |     ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/sched/fair.c:12888:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
>    12888 | void online_fair_sched_group(struct task_group *tg) { }
>          |      ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/sched/fair.c:12890:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
>    12890 | void unregister_fair_sched_group(struct task_group *tg) { }
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/cfs_task_bw_constrained +6274 kernel/sched/fair.c
> 
>   6266	
>   6267	static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
>   6268	{
>   6269		return NULL;
>   6270	}
>   6271	static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
>   6272	static inline void update_runtime_enabled(struct rq *rq) {}
>   6273	static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
> > 6274	bool cfs_task_bw_constrained(struct task_struct *p)
>   6275	{
>   6276		return false;
>   6277	}
>   6278	

Argh.. Phil, I'm about to crash, if you have a spare cycle can you fetch
this commit (I've already modified it to fix an earlier build fail) and
make it work for this .config?
