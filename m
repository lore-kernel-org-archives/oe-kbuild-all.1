Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C57E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 00:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690937281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WTjnlr6J0y/o8fIoHqz5xjVWoYkBmBoC0BuoVomMA0=;
	b=h1ARKC5cNszVuWXtEr5zvqtXj7HXl22iFm1YzJfENfLvONsYPIfNQoj+5iVbGbwk9QkPJC
	Sw3XNnSHXn1mW9zyCe1ek07xFRlWUoI9Xg1YZycq/32jsU7ICbvAKom8d5Wyxi43Y7FxF8
	1U9jwi0Kr5jtCjZo5tbWAe4VDQqZhZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-L9YhFVOcP32CRkwdmltgKg-1; Tue, 01 Aug 2023 20:47:59 -0400
X-MC-Unique: L9YhFVOcP32CRkwdmltgKg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54BA386802C;
	Wed,  2 Aug 2023 00:47:59 +0000 (UTC)
Received: from lorien.usersys.redhat.com (unknown [10.22.16.141])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27393401DA9;
	Wed,  2 Aug 2023 00:47:59 +0000 (UTC)
Date: Tue, 1 Aug 2023 20:47:58 -0400
From: Phil Auld <pauld@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 6/6] kernel/sched/fair.c:6274:6: error:
 redefinition of 'cfs_task_bw_constrained'
Message-ID: <20230802004758.GA269190@lorien.usersys.redhat.com>
References: <202308020619.VgTRqYwU-lkp@intel.com>
 <20230801225727.GE119080@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230801225727.GE119080@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 12:57:27AM +0200 Peter Zijlstra wrote:
> On Wed, Aug 02, 2023 at 06:51:37AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> > head:   e8d5ff8258bf73b585e921af5bd967057f17a738
> > commit: e8d5ff8258bf73b585e921af5bd967057f17a738 [6/6] sched/fair: Block nohz tick_stop when cfs bandwidth in use
> > config: i386-buildonly-randconfig-r005-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020619.VgTRqYwU-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020619.VgTRqYwU-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308020619.VgTRqYwU-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    kernel/sched/fair.c:6261:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
> >     6261 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b, struct cfs_bandwidth *parent) {}
> >          |      ^~~~~~~~~~~~~~~~~~
> > >> kernel/sched/fair.c:6274:6: error: redefinition of 'cfs_task_bw_constrained'
> >     6274 | bool cfs_task_bw_constrained(struct task_struct *p)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~
> >    In file included from kernel/sched/fair.c:55:
> >    kernel/sched/sched.h:498:20: note: previous definition of 'cfs_task_bw_constrained' with type 'bool(struct task_struct *)' {aka '_Bool(struct task_struct *)'}
> >      498 | static inline bool cfs_task_bw_constrained(struct task_struct *p) { return false; }
> >          |                    ^~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/sched/fair.c:12881:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
> >    12881 | void free_fair_sched_group(struct task_group *tg) { }
> >          |      ^~~~~~~~~~~~~~~~~~~~~
> >    kernel/sched/fair.c:12883:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
> >    12883 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
> >          |     ^~~~~~~~~~~~~~~~~~~~~~
> >    kernel/sched/fair.c:12888:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
> >    12888 | void online_fair_sched_group(struct task_group *tg) { }
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/sched/fair.c:12890:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
> >    12890 | void unregister_fair_sched_group(struct task_group *tg) { }
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > 
> > vim +/cfs_task_bw_constrained +6274 kernel/sched/fair.c
> > 
> >   6266	
> >   6267	static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
> >   6268	{
> >   6269		return NULL;
> >   6270	}
> >   6271	static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
> >   6272	static inline void update_runtime_enabled(struct rq *rq) {}
> >   6273	static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
> > > 6274	bool cfs_task_bw_constrained(struct task_struct *p)
> >   6275	{
> >   6276		return false;
> >   6277	}
> >   6278	
> 
> Argh.. Phil, I'm about to crash, if you have a spare cycle can you fetch
> this commit (I've already modified it to fix an earlier build fail) and
> make it work for this .config?
> 

Argh is right, sorry!  I though I'd tried all the combinations of NOHZ and
CFS_BANDWIDTH etc. Clearly I missed something...

I'll look at this first thing tomorrow.


Cheers,
Phil



-- 

