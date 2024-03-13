Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555028828
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710310302; cv=none; b=CtgN80SJjB3DMldaX6kt9H8VRWh4t53axSFII9U/7eXDYT/wJKAizihbgRWXvWVdatiePrP0j6vTwAPcwpIqZDNqoqlIqiRX5lihBckLWVLWlZNgEaXLrdlCjX1VD/MaIERnIn/xHectPSlQjTsIMP+NppoZ0K7FcLpWLDgdDws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710310302; c=relaxed/simple;
	bh=GzL904CLRk1ZjRDuw9jiVcqq2xz+g+fIMtFnGBS90HU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVItPbXdE8hJtg0mP2lrmvmESJZmHR702sshSumcx+4ztcT8nux2A1l7y9KTUKLCUxsKFnDg+rU0+/945WEI+wjREfdPHnC5r4kQPac81O2J8D1oiU0LlmvWxORfXk7lDpiRnpZXJwM+t+f16JzmCTEUUfsjrwFaW2dp2fuJh+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEndhQTU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEndhQTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710310300; x=1741846300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GzL904CLRk1ZjRDuw9jiVcqq2xz+g+fIMtFnGBS90HU=;
  b=eEndhQTUzELplNJ2c0qCLF87MNEUO5SwXPpGdK1o3MD3iLJft65HGz60
   OK/G7SFUQo7JNgsis83xz+cnI2L0APhvSbRekGICRCWgRfTJ/7zuNziTB
   XxTDtcgMWBOxapnXmcLdXzE18bzEk/EGCB5RkL78o9GazBbxEEUkgEluO
   I8BI2hN4uqXzwRWWd0/Kv9c4JB4sXpcvXtd8b+dVjVXGz94X9BlKFUirG
   6Fsn9fdZtOmF10lOyT+clLDkyUX5jGMirTdBLVeroYkheDwOktEIdAQAx
   ijnjGL3/wGRiLF1fY3BD+mwSfEFJFHQPmfTWF6b+rrt1kx4bQ1H5UUQ/f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5226078"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5226078"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 23:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16283390"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2024 23:11:37 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkHpu-000C6V-21;
	Wed, 13 Mar 2024 06:11:34 +0000
Date: Wed, 13 Mar 2024 14:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26624/27506]
 net/core/netclassid_cgroup.c:100:5: sparse: sparse: symbol
 'cls_cgroup_stats_init' was not declared. Should it be static?
Message-ID: <202403131442.Tod6iXMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: 39d03f23067d27d8eac741994056e9d9fe5643e1 [26624/27506] rue/net: init netcls traffic controller
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240313/202403131442.Tod6iXMy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131442.Tod6iXMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131442.Tod6iXMy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/netclassid_cgroup.c:100:5: sparse: sparse: symbol 'cls_cgroup_stats_init' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:129:6: sparse: sparse: symbol 'cls_cgroup_stats_destroy' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:260:5: sparse: sparse: symbol 'net_cgroup_notify_prio_change' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:412:5: sparse: sparse: symbol 'read_class_stat' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:424:5: sparse: sparse: symbol 'rx_dump' was not declared. Should it be static?
>> net/core/netclassid_cgroup.c:431:5: sparse: sparse: symbol 'tx_dump' was not declared. Should it be static?

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
   190	static int update_classid_sock(const void *v, struct file *file, unsigned n)
   191	{
   192		int err;
   193		struct update_classid_context *ctx = (void *)v;
   194		struct socket *sock = sock_from_file(file, &err);
   195	
   196		if (sock) {
   197			spin_lock(&cgroup_sk_update_lock);
   198			sock_cgroup_set_classid(&sock->sk->sk_cgrp_data, ctx->classid);
   199			sock->sk->sk_cgrp_data.cs = task_cls_state(ctx->task);
   200			spin_unlock(&cgroup_sk_update_lock);
   201		}
   202		if (--ctx->batch == 0) {
   203			ctx->batch = UPDATE_CLASSID_BATCH;
   204			return n + 1;
   205		}
   206		return 0;
   207	}
   208	
   209	static void update_classid_task(struct task_struct *p, u32 classid)
   210	{
   211		struct update_classid_context ctx = {
   212			.classid = classid,
   213			.batch = UPDATE_CLASSID_BATCH,
   214			.task = p,
   215		};
   216		unsigned int fd = 0;
   217	
   218		do {
   219			task_lock(p);
   220			fd = iterate_fd(p->files, fd, update_classid_sock, &ctx);
   221			task_unlock(p);
   222			cond_resched();
   223		} while (fd);
   224	}
   225	
   226	static void cgrp_attach(struct cgroup_taskset *tset)
   227	{
   228		struct cgroup_subsys_state *css;
   229		struct task_struct *p;
   230	
   231		cgroup_taskset_for_each(p, css, tset) {
   232			update_classid_task(p, css_cls_state(css)->classid);
   233		}
   234	}
   235	
   236	static u64 read_classid(struct cgroup_subsys_state *css, struct cftype *cft)
   237	{
   238		return css_cls_state(css)->classid;
   239	}
   240	
   241	static int write_classid(struct cgroup_subsys_state *css, struct cftype *cft,
   242				 u64 value)
   243	{
   244		struct cgroup_cls_state *cs = css_cls_state(css);
   245		struct css_task_iter it;
   246		struct task_struct *p;
   247	
   248		cgroup_sk_alloc_disable();
   249	
   250		cs->classid = (u32)value;
   251	
   252		css_task_iter_start(css, 0, &it);
   253		while ((p = css_task_iter_next(&it)))
   254			update_classid_task(p, cs->classid);
   255		css_task_iter_end(&it);
   256	
   257		return 0;
   258	}
   259	
 > 260	int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
   261					  u16 old_prio, u16 new_prio)
   262	{
   263		if (css)
   264			css_cls_state(css)->prio = (u32)new_prio;
   265		return 0;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
