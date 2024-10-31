Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E51CB52E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405091; cv=none; b=C7XVHL6p89+tXIhkt3no7sJdO+JQDjW3dE4UUZ89CWVdI0+S05aSNMJZ7yU2XpIuS+UioVJM2ZQfCL+w/R5KNT0C2Ofs4ycY3TL+DJ/xKGwVf9fVGY+5DYBAa246ObCelcSZnDjwljszCM8f5tmyLF6mcN1GrM3YZwauZMhKTXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405091; c=relaxed/simple;
	bh=qnYu09z0y7RsONSDngYrFAvebfRu2a0JYiF1lBP7HRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z9SdUq6kHmmsQKRicSEKImHN98zQhtFXw90vQANAZyPfk+n6/372F/quF4BP22YobPHNAnMOlp16ngEKEArSyc0VdRvWw9eTY/s3tycz6WGFXjCEINl2pwDixVCl43zq9k7ZRrOXORYJ//TqC+YihcZdfn1+3wYKOd1oNOi0Ibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cW4vasLY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cW4vasLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730405089; x=1761941089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnYu09z0y7RsONSDngYrFAvebfRu2a0JYiF1lBP7HRg=;
  b=cW4vasLYs3ajFQVc84flbFfsqC0gSbS+eEwsXvwwBGRAAUHy29+kE1zw
   mA2Vx/9ZyiJ5EjvDSYudSnCJ2eI9y6kEMh0TCfnfJEQyIyM3H/P4C4ObB
   vRBok+TM5MUQDhbuo77b94KyKBaynTBNEo+jBESfC9AMRs2cqZx6SRxBq
   aErAdup7DtCjDNXW9F4guAgLbzybpxR9J11pB5d7eOcBFpd9/jx3U1caV
   +6gfw+cWo5noWm0+moWz5lsysiUMrmN2hMDSPyDyeJPf/tG0R8CoQsCt0
   /1WSGglKrVVkZvoP2rlFXsW1pgC7cguGrrXEdbBfUw1FCPC0Pxo9kKBBO
   Q==;
X-CSE-ConnectionGUID: GA86F259QOmAt2nxYwG/cg==
X-CSE-MsgGUID: irF7xVhqQPi4EWzC6jT0kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34101265"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="34101265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 13:04:48 -0700
X-CSE-ConnectionGUID: 3TCXRfBVRgi1QOwu/J4SPA==
X-CSE-MsgGUID: +iFfAEJDRLSjOIzSrhDiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87548862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2024 13:04:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6bPN-000gfG-30;
	Thu, 31 Oct 2024 20:04:41 +0000
Date: Fri, 1 Nov 2024 04:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11987/13046] net/core/netclassid_cgroup.c:100:5:
 sparse: sparse: symbol 'cls_cgroup_stats_init' was not declared. Should it
 be static?
Message-ID: <202411010402.SxAjjXXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 669bbf19cd74db8ba957c288e9482d9dc10d68e1 [11987/13046] rue/net: init netcls traffic controller
config: x86_64-randconfig-123-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010402.SxAjjXXL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010402.SxAjjXXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010402.SxAjjXXL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/netclassid_cgroup.c:100:5: sparse: sparse: symbol 'cls_cgroup_stats_init' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:129:6: sparse: sparse: symbol 'cls_cgroup_stats_destroy' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:257:5: sparse: sparse: symbol 'net_cgroup_notify_prio_change' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:409:5: sparse: sparse: symbol 'read_class_stat' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:421:5: sparse: sparse: symbol 'rx_dump' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:428:5: sparse: sparse: symbol 'tx_dump' was not declared. Should it be static?

vim +/cls_cgroup_stats_init +100 net/core/netclassid_cgroup.c

    99	
 > 100	int cls_cgroup_stats_init(struct cls_cgroup_stats *stats)
   101	{
   102		struct {
   103			struct nlattr nla;
   104			struct gnet_estimator params;
   105		} opt;
   106		int err;
   107	
   108		opt.nla.nla_len = nla_attr_size(sizeof(opt.params));
   109		opt.nla.nla_type = TCA_RATE;
   110		opt.params.interval = 0; /* statistics every 1s. */
   111		opt.params.ewma_log = 1; /* ewma off. */
   112		spin_lock_init(&stats->lock);
   113	
   114		rtnl_lock();
   115		err = gen_new_estimator(&stats->bstats,
   116					NULL,
   117					&stats->est,
   118					&stats->lock,
   119					NULL,
   120					&opt.nla);
   121	
   122		if (err)
   123			pr_err("gen_new_estimator failed(%d)\n", err);
   124		rtnl_unlock();
   125	
   126		return err;
   127	}
   128	
 > 129	void cls_cgroup_stats_destroy(struct cls_cgroup_stats *stats)
   130	{
   131		rtnl_lock();
   132		gen_kill_estimator(&stats->est);
   133		rtnl_unlock();
   134	}
   135	
   136	static struct cgroup_subsys_state *
   137	cgrp_css_alloc(struct cgroup_subsys_state *parent_css)
   138	{
   139		struct cgroup_cls_state *cs;
   140	
   141		cs = kzalloc(sizeof(*cs), GFP_KERNEL);
   142		if (!cs)
   143			return ERR_PTR(-ENOMEM);
   144	
   145		return &cs->css;
   146	}
   147	
   148	static int cgrp_css_online(struct cgroup_subsys_state *css)
   149	{
   150		struct cgroup_cls_state *cs = css_cls_state(css);
   151		struct cgroup_cls_state *parent = css_cls_state(css->parent);
   152	
   153		if (parent) {
   154			cs->prio = parent->prio;
   155			cs->classid = parent->classid;
   156		}
   157	
   158		cls_cgroup_stats_init(&cs->rx_stats);
   159		cls_cgroup_stats_init(&cs->tx_stats);
   160		return 0;
   161	}
   162	
   163	static void cgrp_css_offline(struct cgroup_subsys_state *css)
   164	{
   165		struct cgroup_cls_state *cs = css_cls_state(css);
   166	
   167		cls_cgroup_stats_destroy(&cs->rx_stats);
   168		cls_cgroup_stats_destroy(&cs->tx_stats);
   169	}
   170	
   171	static void cgrp_css_free(struct cgroup_subsys_state *css)
   172	{
   173		kfree(css_cls_state(css));
   174	}
   175	
   176	/*
   177	 * To avoid freezing of sockets creation for tasks with big number of threads
   178	 * and opened sockets lets release file_lock every 1000 iterated descriptors.
   179	 * New sockets will already have been created with new classid.
   180	 */
   181	
   182	struct update_classid_context {
   183		u32 classid;
   184		unsigned int batch;
   185		struct task_struct *task;
   186	};
   187	
   188	#define UPDATE_CLASSID_BATCH 1000
   189	
   190	static int update_classid_sock(const void *v, struct file *file, unsigned int n)
   191	{
   192		struct update_classid_context *ctx = (void *)v;
   193		struct socket *sock = sock_from_file(file);
   194	
   195		if (sock) {
   196			sock_cgroup_set_classid(&sock->sk->sk_cgrp_data, ctx->classid);
   197			rcu_read_lock();
   198			sock->sk->sk_cgrp_data.cs = task_cls_state(ctx->task);
   199			rcu_read_unlock();
   200		}
   201		if (--ctx->batch == 0) {
   202			ctx->batch = UPDATE_CLASSID_BATCH;
   203			return n + 1;
   204		}
   205		return 0;
   206	}
   207	
   208	static void update_classid_task(struct task_struct *p, u32 classid)
   209	{
   210		struct update_classid_context ctx = {
   211			.classid = classid,
   212			.batch = UPDATE_CLASSID_BATCH,
   213			.task = p,
   214		};
   215		unsigned int fd = 0;
   216	
   217		do {
   218			task_lock(p);
   219			fd = iterate_fd(p->files, fd, update_classid_sock, &ctx);
   220			task_unlock(p);
   221			cond_resched();
   222		} while (fd);
   223	}
   224	
   225	static void cgrp_attach(struct cgroup_taskset *tset)
   226	{
   227		struct cgroup_subsys_state *css;
   228		struct task_struct *p;
   229	
   230		cgroup_taskset_for_each(p, css, tset) {
   231			update_classid_task(p, css_cls_state(css)->classid);
   232		}
   233	}
   234	
   235	static u64 read_classid(struct cgroup_subsys_state *css, struct cftype *cft)
   236	{
   237		return css_cls_state(css)->classid;
   238	}
   239	
   240	static int write_classid(struct cgroup_subsys_state *css, struct cftype *cft,
   241				 u64 value)
   242	{
   243		struct cgroup_cls_state *cs = css_cls_state(css);
   244		struct css_task_iter it;
   245		struct task_struct *p;
   246	
   247		cs->classid = (u32)value;
   248	
   249		css_task_iter_start(css, 0, &it);
   250		while ((p = css_task_iter_next(&it)))
   251			update_classid_task(p, cs->classid);
   252		css_task_iter_end(&it);
   253	
   254		return 0;
   255	}
   256	
 > 257	int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
   258					  u16 old_prio, u16 new_prio)
   259	{
   260		if (css)
   261			css_cls_state(css)->prio = (u32)new_prio;
   262		return 0;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
