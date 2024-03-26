Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802FC3DAC01
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711442396; cv=none; b=ECVXCv7FjoNY4cQ5wfGHGdYvo5nsguuH3BII/zm5FPa7Vt89KKsU1RtEcgyNpWq8KEuQbHc8cpkKrXmVhz6aY/be7LX7L/FiZQWFtX3Hs2t+1646a8MHP6OYxsdW1rDTVALM2dbco6YA2qiR+rZmdjXNF/cuC52UyK35HeAh6KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711442396; c=relaxed/simple;
	bh=B3hoFz/MNPaVLJWnFmz6Jlcpdye1W17How75mTjoSMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YReWlgYcb5AQ36sHXIfRVhP6YmoGyUn/+oKQYDHKBbK2+tgvmuL5ijOoB2LtMiExsP0yIQn2nUGkXsPperkncKQyaJD/7/MupLai1x0HOZAdNv9zF0IH+PGS2BRZ1Y3UmFsDD1Cmqhsg9+1943yg0CW0Dn5LiWY1rr6oEVBszW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nG1jZ5Qo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nG1jZ5Qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711442394; x=1742978394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3hoFz/MNPaVLJWnFmz6Jlcpdye1W17How75mTjoSMQ=;
  b=nG1jZ5QobQJ08dKTktKee8CGYcGARNKIZ8gG2Lvcj8TDqaV/EWnIM/mJ
   qSPJnSy9RM9ADMYC69tb0oqCkAs1F2OoZTlW2dXHnGYXktyMK/cYodV8X
   aacVngm9JL/JZhw6qvFXrucGR2BLSGj1cdlesoxkshaep1YWikTU4XuXI
   U2pnqil47q0wUTl3dWdNhY7TWQpCXG2lH6qPtkbXbwqww+iIC57JSoIyV
   lGUK6R8Jb6pFp4KdynjCJz3pc+O8JA736sER22BG7aZRepSYbAMXuXbu9
   QyF43okUMxk+RYAvUD7iWFRR6wbnfYviOztvpwEg//FbpxEBwoIy0dwms
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23926615"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="23926615"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 01:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="16323713"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Mar 2024 01:39:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp2LW-000NEs-1s;
	Tue, 26 Mar 2024 08:39:50 +0000
Date: Tue, 26 Mar 2024 16:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 36/4922]
 net/netfilter/xt_quota2.c:206: warning: Function parameter or struct member
 'q' not described in 'q2_get_counter'
Message-ID: <202403261656.D5MhnGnv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   a1789984ea477a3d4b08364d2a38bb9f8e957236
commit: 10cda83af99dd606e19a39bb97cf1d90bf2b0f36 [36/4922] ANDROID: netfilter: xt_quota2: adding the original quota2 from xtables-addons
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240326/202403261656.D5MhnGnv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261656.D5MhnGnv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261656.D5MhnGnv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/netfilter/xt_quota2.c:15:
   include/linux/module.h:133:13: warning: 'init_module' specifies less restrictive attribute than its target 'quota_mt2_init': 'cold' [-Wmissing-attributes]
     133 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   net/netfilter/xt_quota2.c:394:1: note: in expansion of macro 'module_init'
     394 | module_init(quota_mt2_init);
         | ^~~~~~~~~~~
   net/netfilter/xt_quota2.c:366:19: note: 'init_module' target declared here
     366 | static int __init quota_mt2_init(void)
         |                   ^~~~~~~~~~~~~~
   include/linux/module.h:139:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'quota_mt2_exit': 'cold' [-Wmissing-attributes]
     139 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   net/netfilter/xt_quota2.c:395:1: note: in expansion of macro 'module_exit'
     395 | module_exit(quota_mt2_exit);
         | ^~~~~~~~~~~
   net/netfilter/xt_quota2.c:388:20: note: 'cleanup_module' target declared here
     388 | static void __exit quota_mt2_exit(void)
         |                    ^~~~~~~~~~~~~~
   net/netfilter/xt_quota2.c:48: warning: Cannot understand  * @lock:       lock to protect quota writers from each other
    on line 48 - I thought it was a doc line
>> net/netfilter/xt_quota2.c:206: warning: Function parameter or struct member 'q' not described in 'q2_get_counter'
   net/netfilter/xt_quota2.c:206: warning: Excess function parameter 'name' description in 'q2_get_counter'


vim +206 net/netfilter/xt_quota2.c

   199	
   200	/**
   201	 * q2_get_counter - get ref to counter or create new
   202	 * @name:	name of counter
   203	 */
   204	static struct xt_quota_counter *
   205	q2_get_counter(const struct xt_quota_mtinfo2 *q)
 > 206	{
   207		struct proc_dir_entry *p;
   208		struct xt_quota_counter *e = NULL;
   209		struct xt_quota_counter *new_e;
   210	
   211		if (*q->name == '\0')
   212			return q2_new_counter(q, true);
   213	
   214		/* No need to hold a lock while getting a new counter */
   215		new_e = q2_new_counter(q, false);
   216		if (new_e == NULL)
   217			goto out;
   218	
   219		spin_lock_bh(&counter_list_lock);
   220		list_for_each_entry(e, &counter_list, list)
   221			if (strcmp(e->name, q->name) == 0) {
   222				atomic_inc(&e->ref);
   223				spin_unlock_bh(&counter_list_lock);
   224				kfree(new_e);
   225				pr_debug("xt_quota2: old counter name=%s", e->name);
   226				return e;
   227			}
   228		e = new_e;
   229		pr_debug("xt_quota2: new_counter name=%s", e->name);
   230		list_add_tail(&e->list, &counter_list);
   231		/* The entry having a refcount of 1 is not directly destructible.
   232		 * This func has not yet returned the new entry, thus iptables
   233		 * has not references for destroying this entry.
   234		 * For another rule to try to destroy it, it would 1st need for this
   235		 * func* to be re-invoked, acquire a new ref for the same named quota.
   236		 * Nobody will access the e->procfs_entry either.
   237		 * So release the lock. */
   238		spin_unlock_bh(&counter_list_lock);
   239	
   240		/* create_proc_entry() is not spin_lock happy */
   241		p = e->procfs_entry = proc_create_data(e->name, quota_list_perms,
   242		                      proc_xt_quota, &q2_counter_fops, e);
   243	
   244		if (IS_ERR_OR_NULL(p)) {
   245			spin_lock_bh(&counter_list_lock);
   246			list_del(&e->list);
   247			spin_unlock_bh(&counter_list_lock);
   248			goto out;
   249		}
   250		proc_set_user(p, quota_list_uid, quota_list_gid);
   251		return e;
   252	
   253	 out:
   254		kfree(e);
   255		return NULL;
   256	}
   257	
   258	static int quota_mt2_check(const struct xt_mtchk_param *par)
   259	{
   260		struct xt_quota_mtinfo2 *q = par->matchinfo;
   261	
   262		pr_debug("xt_quota2: check() flags=0x%04x", q->flags);
   263	
   264		if (q->flags & ~XT_QUOTA_MASK)
   265			return -EINVAL;
   266	
   267		q->name[sizeof(q->name)-1] = '\0';
   268		if (*q->name == '.' || strchr(q->name, '/') != NULL) {
   269			printk(KERN_ERR "xt_quota.3: illegal name\n");
   270			return -EINVAL;
   271		}
   272	
   273		q->master = q2_get_counter(q);
   274		if (q->master == NULL) {
   275			printk(KERN_ERR "xt_quota.3: memory alloc failure\n");
   276			return -ENOMEM;
   277		}
   278	
   279		return 0;
   280	}
   281	
   282	static void quota_mt2_destroy(const struct xt_mtdtor_param *par)
   283	{
   284		struct xt_quota_mtinfo2 *q = par->matchinfo;
   285		struct xt_quota_counter *e = q->master;
   286	
   287		if (*q->name == '\0') {
   288			kfree(e);
   289			return;
   290		}
   291	
   292		spin_lock_bh(&counter_list_lock);
   293		if (!atomic_dec_and_test(&e->ref)) {
   294			spin_unlock_bh(&counter_list_lock);
   295			return;
   296		}
   297	
   298		list_del(&e->list);
   299		remove_proc_entry(e->name, proc_xt_quota);
   300		spin_unlock_bh(&counter_list_lock);
   301		kfree(e);
   302	}
   303	
   304	static bool
   305	quota_mt2(const struct sk_buff *skb, struct xt_action_param *par)
   306	{
   307		struct xt_quota_mtinfo2 *q = (void *)par->matchinfo;
   308		struct xt_quota_counter *e = q->master;
   309		bool ret = q->flags & XT_QUOTA_INVERT;
   310	
   311		spin_lock_bh(&e->lock);
   312		if (q->flags & XT_QUOTA_GROW) {
   313			/*
   314			 * While no_change is pointless in "grow" mode, we will
   315			 * implement it here simply to have a consistent behavior.
   316			 */
   317			if (!(q->flags & XT_QUOTA_NO_CHANGE)) {
   318				e->quota += (q->flags & XT_QUOTA_PACKET) ? 1 : skb->len;
   319			}
   320			ret = true;
   321		} else {
   322			if (e->quota >= skb->len) {
   323				if (!(q->flags & XT_QUOTA_NO_CHANGE))
   324					e->quota -= (q->flags & XT_QUOTA_PACKET) ? 1 : skb->len;
   325				ret = !ret;
   326			} else {
   327				/* We are transitioning, log that fact. */
   328				if (e->quota) {
   329					quota2_log(xt_hooknum(par),
   330						   skb,
   331						   xt_in(par),
   332						   xt_out(par),
   333						   q->name);
   334				}
   335				/* we do not allow even small packets from now on */
   336				e->quota = 0;
   337			}
   338		}
   339		spin_unlock_bh(&e->lock);
   340		return ret;
   341	}
   342	
   343	static struct xt_match quota_mt2_reg[] __read_mostly = {
   344		{
   345			.name       = "quota2",
   346			.revision   = 3,
   347			.family     = NFPROTO_IPV4,
   348			.checkentry = quota_mt2_check,
   349			.match      = quota_mt2,
   350			.destroy    = quota_mt2_destroy,
   351			.matchsize  = sizeof(struct xt_quota_mtinfo2),
   352			.me         = THIS_MODULE,
   353		},
   354		{
   355			.name       = "quota2",
   356			.revision   = 3,
   357			.family     = NFPROTO_IPV6,
   358			.checkentry = quota_mt2_check,
   359			.match      = quota_mt2,
   360			.destroy    = quota_mt2_destroy,
   361			.matchsize  = sizeof(struct xt_quota_mtinfo2),
   362			.me         = THIS_MODULE,
   363		},
   364	};
   365	
   366	static int __init quota_mt2_init(void)
   367	{
   368		int ret;
   369		pr_debug("xt_quota2: init()");
   370	
   371	#ifdef CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG
   372		nflognl = netlink_kernel_create(&init_net, NETLINK_NFLOG, NULL);
   373		if (!nflognl)
   374			return -ENOMEM;
   375	#endif
   376	
   377		proc_xt_quota = proc_mkdir("xt_quota", init_net.proc_net);
   378		if (proc_xt_quota == NULL)
   379			return -EACCES;
   380	
   381		ret = xt_register_matches(quota_mt2_reg, ARRAY_SIZE(quota_mt2_reg));
   382		if (ret < 0)
   383			remove_proc_entry("xt_quota", init_net.proc_net);
   384		pr_debug("xt_quota2: init() %d", ret);
   385		return ret;
   386	}
   387	
   388	static void __exit quota_mt2_exit(void)
   389	{
   390		xt_unregister_matches(quota_mt2_reg, ARRAY_SIZE(quota_mt2_reg));
   391		remove_proc_entry("xt_quota", init_net.proc_net);
   392	}
   393	
   394	module_init(quota_mt2_init);
 > 395	module_exit(quota_mt2_exit);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
