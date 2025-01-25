Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42F6DCE1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737823405; cv=none; b=NnyEu698HkLzzZeQjLiqqiq0Efu7MZ0crzn/ari6JkdVh4khV2QPceHfO/Rh5vUc8aF74MMfF8TBVOfqqO33zPurCJFFdvXSPkW6+HtKjJmjSkefLqCqT7DoT8N9SZE39j8EONX9FMYIhIDESW7jLzoe/hVNZ33+wFsOFpL6XNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737823405; c=relaxed/simple;
	bh=SwyfdjgIXrp6DoAx2z5Mo3UQHm1rGfujHk7QvDqzYYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0n0Cm0Xd8/ajU1mpwLU1AZGqRv6z5pfCGN3DeJAfrxg2dRxVlhj6ELrnWGHwQrXzNokG7I8SSK3t6Ad2K/CIBFsX8/babXkYJrrtDyK9VAyf+55ZR8mdQCiQ+SaRdDsrXNxDjJY5OwhjC+pG0QnuVS3W0D6bfeI74RA9WMtQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyagWJIC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyagWJIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737823404; x=1769359404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwyfdjgIXrp6DoAx2z5Mo3UQHm1rGfujHk7QvDqzYYw=;
  b=hyagWJICxn00kdm+K0eEz6YASBYka8fwpxxvvuYpw1/+z3gU799Wv0IY
   f0HDoPfqGv4aemW9H9iTjeYjOsfd4gD0ynF5U4ndJy45p8xSjdubnhdqa
   c71VN/8Nec3HZLmx9OpxRJzyfJnERHop7hla3829xxvzd2YYZ6IjkfthO
   HhxtZploXxigVL9VRKJzGp6B9PGGjIUPMJ3ZOvCEilqqPHausEL5CZsrl
   ksHo/PDtbZzIcA5VMq/LS8yPEuvK8VLrkJ0ladMO3JJEPTZsgF6sUHizq
   L67pZBRjcRYEyISuxyMTm8kPh260eGEyW+w0BvVY73+rSdINUAQEV/DF/
   g==;
X-CSE-ConnectionGUID: 4Sys86+MR46S1t+Axpn2Dw==
X-CSE-MsgGUID: vrqduaexTee1cJBF3iYEtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="42001803"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42001803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 08:43:23 -0800
X-CSE-ConnectionGUID: ioFuANrmTA+YdHprL/UgZQ==
X-CSE-MsgGUID: kOdZPSRLTvC4g3auu2A3cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145280507"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2025 08:43:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbjFf-000e1k-2f;
	Sat, 25 Jan 2025 16:43:19 +0000
Date: Sun, 26 Jan 2025 00:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:ucount 4/4] kernel/ucount.c:141:29: error: implicit
 declaration of function 'rcuref_get'; did you mean 'kref_get'?
Message-ID: <202501260054.fO3hdK0y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git ucount
head:   e9941c1a05c13c6c791c76ab322b385f5e535a6f
commit: e9941c1a05c13c6c791c76ab322b385f5e535a6f [4/4] ucount: use rcuref
config: arm-randconfig-001-20250125 (https://download.01.org/0day-ci/archive/20250126/202501260054.fO3hdK0y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260054.fO3hdK0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260054.fO3hdK0y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/stat.h:5,
                    from include/linux/stat.h:7,
                    from kernel/ucount.c:3:
>> include/linux/types.h:192:28: error: 'atomic_t' has no member named 'refcnt'
     192 | #define RCUREF_INIT(i)  { .refcnt = ATOMIC_INIT(i - 1) }
         |                            ^~~~~~
   kernel/ucount.c:14:18: note: in expansion of macro 'RCUREF_INIT'
      14 |         .count = RCUREF_INIT(1),
         |                  ^~~~~~~~~~~
>> kernel/ucount.c:14:9: warning: braces around scalar initializer
      14 |         .count = RCUREF_INIT(1),
         |         ^
   kernel/ucount.c:14:9: note: (near initialization for 'init_ucounts.count.counter')
   kernel/ucount.c: In function 'find_ucounts':
>> kernel/ucount.c:141:29: error: implicit declaration of function 'rcuref_get'; did you mean 'kref_get'? [-Wimplicit-function-declaration]
     141 |                         if (rcuref_get(&ucounts->count))
         |                             ^~~~~~~~~~
         |                             kref_get
   kernel/ucount.c: In function 'alloc_ucounts':
>> kernel/ucount.c:172:9: error: implicit declaration of function 'rcuref_init'; did you mean 'cred_init'? [-Wimplicit-function-declaration]
     172 |         rcuref_init(&new->count, 1);
         |         ^~~~~~~~~~~
         |         cred_init
   kernel/ucount.c: In function 'put_ucounts':
>> kernel/ucount.c:200:13: error: implicit declaration of function 'rcuref_put'; did you mean 'kref_put'? [-Wimplicit-function-declaration]
     200 |         if (rcuref_put(&ucounts->count)) {
         |             ^~~~~~~~~~
         |             kref_put


vim +141 kernel/ucount.c

     2	
   > 3	#include <linux/stat.h>
     4	#include <linux/sysctl.h>
     5	#include <linux/slab.h>
     6	#include <linux/cred.h>
     7	#include <linux/hash.h>
     8	#include <linux/kmemleak.h>
     9	#include <linux/user_namespace.h>
    10	
    11	struct ucounts init_ucounts = {
    12		.ns    = &init_user_ns,
    13		.uid   = GLOBAL_ROOT_UID,
  > 14		.count = RCUREF_INIT(1),
    15	};
    16	
    17	#define UCOUNTS_HASHTABLE_BITS 10
    18	#define UCOUNTS_HASHTABLE_ENTRIES (1 << UCOUNTS_HASHTABLE_BITS)
    19	static struct hlist_nulls_head ucounts_hashtable[UCOUNTS_HASHTABLE_ENTRIES]= {
    20		[0 ... UCOUNTS_HASHTABLE_ENTRIES - 1] = HLIST_NULLS_HEAD_INIT(0)
    21	};
    22	static DEFINE_SPINLOCK(ucounts_lock);
    23	
    24	#define ucounts_hashfn(ns, uid)						\
    25		hash_long((unsigned long)__kuid_val(uid) + (unsigned long)(ns), \
    26			  UCOUNTS_HASHTABLE_BITS)
    27	#define ucounts_hashentry(ns, uid)	\
    28		(ucounts_hashtable + ucounts_hashfn(ns, uid))
    29	
    30	#ifdef CONFIG_SYSCTL
    31	static struct ctl_table_set *
    32	set_lookup(struct ctl_table_root *root)
    33	{
    34		return &current_user_ns()->set;
    35	}
    36	
    37	static int set_is_seen(struct ctl_table_set *set)
    38	{
    39		return &current_user_ns()->set == set;
    40	}
    41	
    42	static int set_permissions(struct ctl_table_header *head,
    43				   const struct ctl_table *table)
    44	{
    45		struct user_namespace *user_ns =
    46			container_of(head->set, struct user_namespace, set);
    47		int mode;
    48	
    49		/* Allow users with CAP_SYS_RESOURCE unrestrained access */
    50		if (ns_capable(user_ns, CAP_SYS_RESOURCE))
    51			mode = (table->mode & S_IRWXU) >> 6;
    52		else
    53		/* Allow all others at most read-only access */
    54			mode = table->mode & S_IROTH;
    55		return (mode << 6) | (mode << 3) | mode;
    56	}
    57	
    58	static struct ctl_table_root set_root = {
    59		.lookup = set_lookup,
    60		.permissions = set_permissions,
    61	};
    62	
    63	static long ue_zero = 0;
    64	static long ue_int_max = INT_MAX;
    65	
    66	#define UCOUNT_ENTRY(name)					\
    67		{							\
    68			.procname	= name,				\
    69			.maxlen		= sizeof(long),			\
    70			.mode		= 0644,				\
    71			.proc_handler	= proc_doulongvec_minmax,	\
    72			.extra1		= &ue_zero,			\
    73			.extra2		= &ue_int_max,			\
    74		}
    75	static const struct ctl_table user_table[] = {
    76		UCOUNT_ENTRY("max_user_namespaces"),
    77		UCOUNT_ENTRY("max_pid_namespaces"),
    78		UCOUNT_ENTRY("max_uts_namespaces"),
    79		UCOUNT_ENTRY("max_ipc_namespaces"),
    80		UCOUNT_ENTRY("max_net_namespaces"),
    81		UCOUNT_ENTRY("max_mnt_namespaces"),
    82		UCOUNT_ENTRY("max_cgroup_namespaces"),
    83		UCOUNT_ENTRY("max_time_namespaces"),
    84	#ifdef CONFIG_INOTIFY_USER
    85		UCOUNT_ENTRY("max_inotify_instances"),
    86		UCOUNT_ENTRY("max_inotify_watches"),
    87	#endif
    88	#ifdef CONFIG_FANOTIFY
    89		UCOUNT_ENTRY("max_fanotify_groups"),
    90		UCOUNT_ENTRY("max_fanotify_marks"),
    91	#endif
    92	};
    93	#endif /* CONFIG_SYSCTL */
    94	
    95	bool setup_userns_sysctls(struct user_namespace *ns)
    96	{
    97	#ifdef CONFIG_SYSCTL
    98		struct ctl_table *tbl;
    99	
   100		BUILD_BUG_ON(ARRAY_SIZE(user_table) != UCOUNT_COUNTS);
   101		setup_sysctl_set(&ns->set, &set_root, set_is_seen);
   102		tbl = kmemdup(user_table, sizeof(user_table), GFP_KERNEL);
   103		if (tbl) {
   104			int i;
   105			for (i = 0; i < UCOUNT_COUNTS; i++) {
   106				tbl[i].data = &ns->ucount_max[i];
   107			}
   108			ns->sysctls = __register_sysctl_table(&ns->set, "user", tbl,
   109							      ARRAY_SIZE(user_table));
   110		}
   111		if (!ns->sysctls) {
   112			kfree(tbl);
   113			retire_sysctl_set(&ns->set);
   114			return false;
   115		}
   116	#endif
   117		return true;
   118	}
   119	
   120	void retire_userns_sysctls(struct user_namespace *ns)
   121	{
   122	#ifdef CONFIG_SYSCTL
   123		const struct ctl_table *tbl;
   124	
   125		tbl = ns->sysctls->ctl_table_arg;
   126		unregister_sysctl_table(ns->sysctls);
   127		retire_sysctl_set(&ns->set);
   128		kfree(tbl);
   129	#endif
   130	}
   131	
   132	static struct ucounts *find_ucounts(struct user_namespace *ns, kuid_t uid,
   133					    struct hlist_nulls_head *hashent)
   134	{
   135		struct ucounts *ucounts;
   136		struct hlist_nulls_node *pos;
   137	
   138		guard(rcu)();
   139		hlist_nulls_for_each_entry_rcu(ucounts, pos, hashent, node) {
   140			if (uid_eq(ucounts->uid, uid) && (ucounts->ns == ns)) {
 > 141				if (rcuref_get(&ucounts->count))
   142					return ucounts;
   143			}
   144		}
   145		return NULL;
   146	}
   147	
   148	static void hlist_add_ucounts(struct ucounts *ucounts)
   149	{
   150		struct hlist_nulls_head *hashent = ucounts_hashentry(ucounts->ns, ucounts->uid);
   151	
   152		spin_lock_irq(&ucounts_lock);
   153		hlist_nulls_add_head_rcu(&ucounts->node, hashent);
   154		spin_unlock_irq(&ucounts_lock);
   155	}
   156	
   157	struct ucounts *alloc_ucounts(struct user_namespace *ns, kuid_t uid)
   158	{
   159		struct hlist_nulls_head *hashent = ucounts_hashentry(ns, uid);
   160		struct ucounts *ucounts, *new;
   161	
   162		ucounts = find_ucounts(ns, uid, hashent);
   163		if (ucounts)
   164			return ucounts;
   165	
   166		new = kzalloc(sizeof(*new), GFP_KERNEL);
   167		if (!new)
   168			return NULL;
   169	
   170		new->ns = ns;
   171		new->uid = uid;
 > 172		rcuref_init(&new->count, 1);
   173	
   174		spin_lock_irq(&ucounts_lock);
   175		ucounts = find_ucounts(ns, uid, hashent);
   176		if (ucounts) {
   177			spin_unlock_irq(&ucounts_lock);
   178			kfree(new);
   179			return ucounts;
   180		}
   181	
   182		hlist_nulls_add_head_rcu(&new->node, hashent);
   183		get_user_ns(new->ns);
   184		spin_unlock_irq(&ucounts_lock);
   185		return new;
   186	}
   187	
   188	static void ucounts_free(struct rcu_head *rcu)
   189	{
   190		struct ucounts *ucounts = container_of(rcu, struct ucounts, rcu);
   191	
   192		put_user_ns(ucounts->ns);
   193		kfree(ucounts);
   194	}
   195	
   196	void put_ucounts(struct ucounts *ucounts)
   197	{
   198		unsigned long flags;
   199	
 > 200		if (rcuref_put(&ucounts->count)) {
   201			spin_lock_irqsave(&ucounts_lock, flags);
   202			hlist_nulls_del_rcu(&ucounts->node);
   203			spin_unlock_irqrestore(&ucounts_lock, flags);
   204	
   205			call_rcu(&ucounts->rcu, ucounts_free);
   206		}
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
