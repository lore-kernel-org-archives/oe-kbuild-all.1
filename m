Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8FE2253B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765411278; cv=none; b=tiLKhmyQFPXihX05t5MKs+Km0xNx0QqGiD7kwP8r/rCjK7qCm8CU8UrQgnYm9kOzzYmIG5tRO8Aqaf2nfArIA19fOZ3A2Y40PKakVdGTmBdyg1Z1hxwNrwKb6gNzq9uK2Usm9N7xSa1zJApR9RP0jP7HSBHrHqHy4rCMAY2l8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765411278; c=relaxed/simple;
	bh=bkORnohbi8HidHY9GeexoZ3SoRNiav2V2x+TOaF4kJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oquSJ6plln7yRSIK32HzzZZgdH2mYrckNRst+oQ2GPyrT+x1eTm2jrfGOjtgSyhk7UIdFTfaNZmclfpOAbLrk1oJUwiESKf4deOvKsNFgkCdebe7lTiyUuTlIugoEPSdFa+Up7yWhxcwRI2g0qWsEMuA3YC35iAjN3jt9G2ZkP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2tWmHi9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2tWmHi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765411275; x=1796947275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bkORnohbi8HidHY9GeexoZ3SoRNiav2V2x+TOaF4kJ0=;
  b=J2tWmHi994K/SwEdptNV7lIMQ2QST+2RIVkce1p6uTQlrcPDW5C0wMPO
   J8WqN1zR8b97MXrH5OdjrlcQJZxMyM0+kXwXRgrgE3vvD2yRIeV0BP4kP
   CBGtxt1RxkCJaYgD3CcdyhT2dS80HnlWLDiuLne/7uI3LLgy37GVaNuxW
   G20B6fPrjtahaN8wnhuaMj80fUVVrl2cSrHQhYqDO/YU6QO41FhKFeEmd
   7yMkGKALA5GbpTxnHMYOqe/qpbm6fMYIyzjpfZjCthh8PW/gK/kRDhtQi
   gdhe2tOQe+3xaNWPbZmrocKMvJhKIgn8KjS4kpqhLqbz0kxpm+9AD02p/
   A==;
X-CSE-ConnectionGUID: Btb/o3WeRDi75xu38ueX0w==
X-CSE-MsgGUID: v6RPDK6nSniFwoudoZuhQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67560995"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67560995"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 16:01:11 -0800
X-CSE-ConnectionGUID: z+8Vqk1rTqO9CQy4GN/ENQ==
X-CSE-MsgGUID: 91ZWmUa7RG+D2drfv9abFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201741174"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 16:01:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTU7H-000000003tP-3xDl;
	Thu, 11 Dec 2025 00:01:07 +0000
Date: Thu, 11 Dec 2025 08:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 net/netfilter/xt_quota2.c:201: warning: Function parameter or struct member
 'q' not described in 'q2_get_counter'
Message-ID: <202512110719.MJE9LDke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1594e8fdf0af3790482e1d7e4d4dd3e5166f4f22
commit: cefb5c96f328e7ece57ff0a5c39d554e1d6cd171 [1/1] Merge 0c6bc3725592 ("Merge tag 'ubifs-for-linus-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs") into android-mainline
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512110719.MJE9LDke-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110719.MJE9LDke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110719.MJE9LDke-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/xt_quota2.c:48: warning: Cannot understand  * @lock:       lock to protect quota writers from each other
    on line 48 - I thought it was a doc line
>> net/netfilter/xt_quota2.c:201: warning: Function parameter or struct member 'q' not described in 'q2_get_counter'
   net/netfilter/xt_quota2.c:201: warning: Excess function parameter 'name' description in 'q2_get_counter'


vim +201 net/netfilter/xt_quota2.c

10cda83af99dd6 JP Abgrall         2011-06-21   46  
10cda83af99dd6 JP Abgrall         2011-06-21   47  /**
10cda83af99dd6 JP Abgrall         2011-06-21  @48   * @lock:	lock to protect quota writers from each other
10cda83af99dd6 JP Abgrall         2011-06-21   49   */
10cda83af99dd6 JP Abgrall         2011-06-21   50  struct xt_quota_counter {
10cda83af99dd6 JP Abgrall         2011-06-21   51  	u_int64_t quota;
10cda83af99dd6 JP Abgrall         2011-06-21   52  	spinlock_t lock;
10cda83af99dd6 JP Abgrall         2011-06-21   53  	struct list_head list;
10cda83af99dd6 JP Abgrall         2011-06-21   54  	atomic_t ref;
10cda83af99dd6 JP Abgrall         2011-06-21   55  	char name[sizeof(((struct xt_quota_mtinfo2 *)NULL)->name)];
10cda83af99dd6 JP Abgrall         2011-06-21   56  	struct proc_dir_entry *procfs_entry;
10cda83af99dd6 JP Abgrall         2011-06-21   57  };
10cda83af99dd6 JP Abgrall         2011-06-21   58  
10cda83af99dd6 JP Abgrall         2011-06-21   59  #ifdef CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG
10cda83af99dd6 JP Abgrall         2011-06-21   60  /* Harald's favorite number +1 :D From ipt_ULOG.C */
10cda83af99dd6 JP Abgrall         2011-06-21   61  static int qlog_nl_event = 112;
10cda83af99dd6 JP Abgrall         2011-06-21   62  module_param_named(event_num, qlog_nl_event, uint, S_IRUGO | S_IWUSR);
10cda83af99dd6 JP Abgrall         2011-06-21   63  MODULE_PARM_DESC(event_num,
10cda83af99dd6 JP Abgrall         2011-06-21   64  		 "Event number for NETLINK_NFLOG message. 0 disables log."
10cda83af99dd6 JP Abgrall         2011-06-21   65  		 "111 is what ipt_ULOG uses.");
10cda83af99dd6 JP Abgrall         2011-06-21   66  static struct sock *nflognl;
10cda83af99dd6 JP Abgrall         2011-06-21   67  #endif
10cda83af99dd6 JP Abgrall         2011-06-21   68  
10cda83af99dd6 JP Abgrall         2011-06-21   69  static LIST_HEAD(counter_list);
10cda83af99dd6 JP Abgrall         2011-06-21   70  static DEFINE_SPINLOCK(counter_list_lock);
10cda83af99dd6 JP Abgrall         2011-06-21   71  
10cda83af99dd6 JP Abgrall         2011-06-21   72  static struct proc_dir_entry *proc_xt_quota;
10cda83af99dd6 JP Abgrall         2011-06-21   73  static unsigned int quota_list_perms = S_IRUGO | S_IWUSR;
10cda83af99dd6 JP Abgrall         2011-06-21   74  static kuid_t quota_list_uid = KUIDT_INIT(0);
10cda83af99dd6 JP Abgrall         2011-06-21   75  static kgid_t quota_list_gid = KGIDT_INIT(0);
10cda83af99dd6 JP Abgrall         2011-06-21   76  module_param_named(perms, quota_list_perms, uint, S_IRUGO | S_IWUSR);
10cda83af99dd6 JP Abgrall         2011-06-21   77  
10cda83af99dd6 JP Abgrall         2011-06-21   78  #ifdef CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG
10cda83af99dd6 JP Abgrall         2011-06-21   79  static void quota2_log(unsigned int hooknum,
10cda83af99dd6 JP Abgrall         2011-06-21   80  		       const struct sk_buff *skb,
10cda83af99dd6 JP Abgrall         2011-06-21   81  		       const struct net_device *in,
10cda83af99dd6 JP Abgrall         2011-06-21   82  		       const struct net_device *out,
10cda83af99dd6 JP Abgrall         2011-06-21   83  		       const char *prefix)
10cda83af99dd6 JP Abgrall         2011-06-21   84  {
10cda83af99dd6 JP Abgrall         2011-06-21   85  	ulog_packet_msg_t *pm;
10cda83af99dd6 JP Abgrall         2011-06-21   86  	struct sk_buff *log_skb;
10cda83af99dd6 JP Abgrall         2011-06-21   87  	size_t size;
10cda83af99dd6 JP Abgrall         2011-06-21   88  	struct nlmsghdr *nlh;
10cda83af99dd6 JP Abgrall         2011-06-21   89  
10cda83af99dd6 JP Abgrall         2011-06-21   90  	if (!qlog_nl_event)
10cda83af99dd6 JP Abgrall         2011-06-21   91  		return;
10cda83af99dd6 JP Abgrall         2011-06-21   92  
10cda83af99dd6 JP Abgrall         2011-06-21   93  	size = NLMSG_SPACE(sizeof(*pm));
10cda83af99dd6 JP Abgrall         2011-06-21   94  	size = max(size, (size_t)NLMSG_GOODSIZE);
10cda83af99dd6 JP Abgrall         2011-06-21   95  	log_skb = alloc_skb(size, GFP_ATOMIC);
10cda83af99dd6 JP Abgrall         2011-06-21   96  	if (!log_skb) {
10cda83af99dd6 JP Abgrall         2011-06-21   97  		pr_err("xt_quota2: cannot alloc skb for logging\n");
10cda83af99dd6 JP Abgrall         2011-06-21   98  		return;
10cda83af99dd6 JP Abgrall         2011-06-21   99  	}
10cda83af99dd6 JP Abgrall         2011-06-21  100  
10cda83af99dd6 JP Abgrall         2011-06-21  101  	nlh = nlmsg_put(log_skb, /*pid*/0, /*seq*/0, qlog_nl_event,
10cda83af99dd6 JP Abgrall         2011-06-21  102  			sizeof(*pm), 0);
10cda83af99dd6 JP Abgrall         2011-06-21  103  	if (!nlh) {
10cda83af99dd6 JP Abgrall         2011-06-21  104  		pr_err("xt_quota2: nlmsg_put failed\n");
10cda83af99dd6 JP Abgrall         2011-06-21  105  		kfree_skb(log_skb);
10cda83af99dd6 JP Abgrall         2011-06-21  106  		return;
10cda83af99dd6 JP Abgrall         2011-06-21  107  	}
10cda83af99dd6 JP Abgrall         2011-06-21  108  	pm = nlmsg_data(nlh);
cf071a2365ac82 Todd Kjos          2021-08-17  109  	memset(pm, 0, sizeof(*pm));
10cda83af99dd6 JP Abgrall         2011-06-21  110  	if (skb->tstamp == 0)
10cda83af99dd6 JP Abgrall         2011-06-21  111  		__net_timestamp((struct sk_buff *)skb);
10cda83af99dd6 JP Abgrall         2011-06-21  112  	pm->hook = hooknum;
10cda83af99dd6 JP Abgrall         2011-06-21  113  	if (prefix != NULL)
10cda83af99dd6 JP Abgrall         2011-06-21  114  		strlcpy(pm->prefix, prefix, sizeof(pm->prefix));
10cda83af99dd6 JP Abgrall         2011-06-21  115  	if (in)
10cda83af99dd6 JP Abgrall         2011-06-21  116  		strlcpy(pm->indev_name, in->name, sizeof(pm->indev_name));
10cda83af99dd6 JP Abgrall         2011-06-21  117  	if (out)
10cda83af99dd6 JP Abgrall         2011-06-21  118  		strlcpy(pm->outdev_name, out->name, sizeof(pm->outdev_name));
10cda83af99dd6 JP Abgrall         2011-06-21  119  
10cda83af99dd6 JP Abgrall         2011-06-21  120  	NETLINK_CB(log_skb).dst_group = 1;
10cda83af99dd6 JP Abgrall         2011-06-21  121  	pr_debug("throwing 1 packets to netlink group 1\n");
10cda83af99dd6 JP Abgrall         2011-06-21  122  	netlink_broadcast(nflognl, log_skb, 0, 1, GFP_ATOMIC);
10cda83af99dd6 JP Abgrall         2011-06-21  123  }
10cda83af99dd6 JP Abgrall         2011-06-21  124  #else
10cda83af99dd6 JP Abgrall         2011-06-21  125  static void quota2_log(unsigned int hooknum,
10cda83af99dd6 JP Abgrall         2011-06-21  126  		       const struct sk_buff *skb,
10cda83af99dd6 JP Abgrall         2011-06-21  127  		       const struct net_device *in,
10cda83af99dd6 JP Abgrall         2011-06-21  128  		       const struct net_device *out,
10cda83af99dd6 JP Abgrall         2011-06-21  129  		       const char *prefix)
10cda83af99dd6 JP Abgrall         2011-06-21  130  {
10cda83af99dd6 JP Abgrall         2011-06-21  131  }
10cda83af99dd6 JP Abgrall         2011-06-21  132  #endif  /* if+else CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG */
10cda83af99dd6 JP Abgrall         2011-06-21  133  
10cda83af99dd6 JP Abgrall         2011-06-21  134  static ssize_t quota_proc_read(struct file *file, char __user *buf,
10cda83af99dd6 JP Abgrall         2011-06-21  135  			   size_t size, loff_t *ppos)
10cda83af99dd6 JP Abgrall         2011-06-21  136  {
9b5f1c910c5986 Will McVicker      2022-02-14  137  	struct xt_quota_counter *e = pde_data(file_inode(file));
10cda83af99dd6 JP Abgrall         2011-06-21  138  	char tmp[24];
10cda83af99dd6 JP Abgrall         2011-06-21  139  	size_t tmp_size;
10cda83af99dd6 JP Abgrall         2011-06-21  140  
10cda83af99dd6 JP Abgrall         2011-06-21  141  	spin_lock_bh(&e->lock);
10cda83af99dd6 JP Abgrall         2011-06-21  142  	tmp_size = scnprintf(tmp, sizeof(tmp), "%llu\n", e->quota);
10cda83af99dd6 JP Abgrall         2011-06-21  143  	spin_unlock_bh(&e->lock);
10cda83af99dd6 JP Abgrall         2011-06-21  144  	return simple_read_from_buffer(buf, size, ppos, tmp, tmp_size);
10cda83af99dd6 JP Abgrall         2011-06-21  145  }
10cda83af99dd6 JP Abgrall         2011-06-21  146  
10cda83af99dd6 JP Abgrall         2011-06-21  147  static ssize_t quota_proc_write(struct file *file, const char __user *input,
10cda83af99dd6 JP Abgrall         2011-06-21  148                              size_t size, loff_t *ppos)
10cda83af99dd6 JP Abgrall         2011-06-21  149  {
9b5f1c910c5986 Will McVicker      2022-02-14  150  	struct xt_quota_counter *e = pde_data(file_inode(file));
10cda83af99dd6 JP Abgrall         2011-06-21  151  	char buf[sizeof("18446744073709551616")];
10cda83af99dd6 JP Abgrall         2011-06-21  152  
10cda83af99dd6 JP Abgrall         2011-06-21  153  	if (size > sizeof(buf))
10cda83af99dd6 JP Abgrall         2011-06-21  154  		size = sizeof(buf);
10cda83af99dd6 JP Abgrall         2011-06-21  155  	if (copy_from_user(buf, input, size) != 0)
10cda83af99dd6 JP Abgrall         2011-06-21  156  		return -EFAULT;
10cda83af99dd6 JP Abgrall         2011-06-21  157  	buf[sizeof(buf)-1] = '\0';
ed5cfb1c90da23 Sam Liddicott      2014-01-07  158  	if (size < sizeof(buf))
ed5cfb1c90da23 Sam Liddicott      2014-01-07  159  		buf[size] = '\0';
10cda83af99dd6 JP Abgrall         2011-06-21  160  
10cda83af99dd6 JP Abgrall         2011-06-21  161  	spin_lock_bh(&e->lock);
10cda83af99dd6 JP Abgrall         2011-06-21  162  	e->quota = simple_strtoull(buf, NULL, 0);
10cda83af99dd6 JP Abgrall         2011-06-21  163  	spin_unlock_bh(&e->lock);
10cda83af99dd6 JP Abgrall         2011-06-21  164  	return size;
10cda83af99dd6 JP Abgrall         2011-06-21  165  }
10cda83af99dd6 JP Abgrall         2011-06-21  166  
8a35207f24f085 Greg Kroah-Hartman 2020-02-08  167  static const struct proc_ops q2_counter_fops = {
8a35207f24f085 Greg Kroah-Hartman 2020-02-08  168  	.proc_read	= quota_proc_read,
8a35207f24f085 Greg Kroah-Hartman 2020-02-08  169  	.proc_write	= quota_proc_write,
8a35207f24f085 Greg Kroah-Hartman 2020-02-08  170  	.proc_lseek	= default_llseek,
10cda83af99dd6 JP Abgrall         2011-06-21  171  };
10cda83af99dd6 JP Abgrall         2011-06-21  172  
10cda83af99dd6 JP Abgrall         2011-06-21  173  static struct xt_quota_counter *
10cda83af99dd6 JP Abgrall         2011-06-21  174  q2_new_counter(const struct xt_quota_mtinfo2 *q, bool anon)
10cda83af99dd6 JP Abgrall         2011-06-21  175  {
10cda83af99dd6 JP Abgrall         2011-06-21  176  	struct xt_quota_counter *e;
10cda83af99dd6 JP Abgrall         2011-06-21  177  	unsigned int size;
10cda83af99dd6 JP Abgrall         2011-06-21  178  
10cda83af99dd6 JP Abgrall         2011-06-21  179  	/* Do not need all the procfs things for anonymous counters. */
10cda83af99dd6 JP Abgrall         2011-06-21  180  	size = anon ? offsetof(typeof(*e), list) : sizeof(*e);
10cda83af99dd6 JP Abgrall         2011-06-21  181  	e = kmalloc(size, GFP_KERNEL);
10cda83af99dd6 JP Abgrall         2011-06-21  182  	if (e == NULL)
10cda83af99dd6 JP Abgrall         2011-06-21  183  		return NULL;
10cda83af99dd6 JP Abgrall         2011-06-21  184  
10cda83af99dd6 JP Abgrall         2011-06-21  185  	e->quota = q->quota;
10cda83af99dd6 JP Abgrall         2011-06-21  186  	spin_lock_init(&e->lock);
10cda83af99dd6 JP Abgrall         2011-06-21  187  	if (!anon) {
10cda83af99dd6 JP Abgrall         2011-06-21  188  		INIT_LIST_HEAD(&e->list);
10cda83af99dd6 JP Abgrall         2011-06-21  189  		atomic_set(&e->ref, 1);
10cda83af99dd6 JP Abgrall         2011-06-21  190  		strlcpy(e->name, q->name, sizeof(e->name));
10cda83af99dd6 JP Abgrall         2011-06-21  191  	}
10cda83af99dd6 JP Abgrall         2011-06-21  192  	return e;
10cda83af99dd6 JP Abgrall         2011-06-21  193  }
10cda83af99dd6 JP Abgrall         2011-06-21  194  
10cda83af99dd6 JP Abgrall         2011-06-21  195  /**
10cda83af99dd6 JP Abgrall         2011-06-21  196   * q2_get_counter - get ref to counter or create new
10cda83af99dd6 JP Abgrall         2011-06-21  197   * @name:	name of counter
10cda83af99dd6 JP Abgrall         2011-06-21  198   */
10cda83af99dd6 JP Abgrall         2011-06-21  199  static struct xt_quota_counter *
10cda83af99dd6 JP Abgrall         2011-06-21  200  q2_get_counter(const struct xt_quota_mtinfo2 *q)
10cda83af99dd6 JP Abgrall         2011-06-21 @201  {
10cda83af99dd6 JP Abgrall         2011-06-21  202  	struct proc_dir_entry *p;
10cda83af99dd6 JP Abgrall         2011-06-21  203  	struct xt_quota_counter *e = NULL;
10cda83af99dd6 JP Abgrall         2011-06-21  204  	struct xt_quota_counter *new_e;
10cda83af99dd6 JP Abgrall         2011-06-21  205  
10cda83af99dd6 JP Abgrall         2011-06-21  206  	if (*q->name == '\0')
10cda83af99dd6 JP Abgrall         2011-06-21  207  		return q2_new_counter(q, true);
10cda83af99dd6 JP Abgrall         2011-06-21  208  
10cda83af99dd6 JP Abgrall         2011-06-21  209  	/* No need to hold a lock while getting a new counter */
10cda83af99dd6 JP Abgrall         2011-06-21  210  	new_e = q2_new_counter(q, false);
10cda83af99dd6 JP Abgrall         2011-06-21  211  	if (new_e == NULL)
10cda83af99dd6 JP Abgrall         2011-06-21  212  		goto out;
10cda83af99dd6 JP Abgrall         2011-06-21  213  
10cda83af99dd6 JP Abgrall         2011-06-21  214  	spin_lock_bh(&counter_list_lock);
10cda83af99dd6 JP Abgrall         2011-06-21  215  	list_for_each_entry(e, &counter_list, list)
10cda83af99dd6 JP Abgrall         2011-06-21  216  		if (strcmp(e->name, q->name) == 0) {
10cda83af99dd6 JP Abgrall         2011-06-21  217  			atomic_inc(&e->ref);
10cda83af99dd6 JP Abgrall         2011-06-21  218  			spin_unlock_bh(&counter_list_lock);
10cda83af99dd6 JP Abgrall         2011-06-21  219  			kfree(new_e);
10cda83af99dd6 JP Abgrall         2011-06-21  220  			pr_debug("xt_quota2: old counter name=%s", e->name);
10cda83af99dd6 JP Abgrall         2011-06-21  221  			return e;
10cda83af99dd6 JP Abgrall         2011-06-21  222  		}
10cda83af99dd6 JP Abgrall         2011-06-21  223  	e = new_e;
10cda83af99dd6 JP Abgrall         2011-06-21  224  	pr_debug("xt_quota2: new_counter name=%s", e->name);
10cda83af99dd6 JP Abgrall         2011-06-21  225  	list_add_tail(&e->list, &counter_list);
10cda83af99dd6 JP Abgrall         2011-06-21  226  	/* The entry having a refcount of 1 is not directly destructible.
10cda83af99dd6 JP Abgrall         2011-06-21  227  	 * This func has not yet returned the new entry, thus iptables
10cda83af99dd6 JP Abgrall         2011-06-21  228  	 * has not references for destroying this entry.
10cda83af99dd6 JP Abgrall         2011-06-21  229  	 * For another rule to try to destroy it, it would 1st need for this
10cda83af99dd6 JP Abgrall         2011-06-21  230  	 * func* to be re-invoked, acquire a new ref for the same named quota.
10cda83af99dd6 JP Abgrall         2011-06-21  231  	 * Nobody will access the e->procfs_entry either.
10cda83af99dd6 JP Abgrall         2011-06-21  232  	 * So release the lock. */
10cda83af99dd6 JP Abgrall         2011-06-21  233  	spin_unlock_bh(&counter_list_lock);
10cda83af99dd6 JP Abgrall         2011-06-21  234  
10cda83af99dd6 JP Abgrall         2011-06-21  235  	/* create_proc_entry() is not spin_lock happy */
10cda83af99dd6 JP Abgrall         2011-06-21  236  	p = e->procfs_entry = proc_create_data(e->name, quota_list_perms,
10cda83af99dd6 JP Abgrall         2011-06-21  237  	                      proc_xt_quota, &q2_counter_fops, e);
10cda83af99dd6 JP Abgrall         2011-06-21  238  
10cda83af99dd6 JP Abgrall         2011-06-21  239  	if (IS_ERR_OR_NULL(p)) {
10cda83af99dd6 JP Abgrall         2011-06-21  240  		spin_lock_bh(&counter_list_lock);
10cda83af99dd6 JP Abgrall         2011-06-21  241  		list_del(&e->list);
10cda83af99dd6 JP Abgrall         2011-06-21  242  		spin_unlock_bh(&counter_list_lock);
10cda83af99dd6 JP Abgrall         2011-06-21  243  		goto out;
10cda83af99dd6 JP Abgrall         2011-06-21  244  	}
10cda83af99dd6 JP Abgrall         2011-06-21  245  	proc_set_user(p, quota_list_uid, quota_list_gid);
10cda83af99dd6 JP Abgrall         2011-06-21  246  	return e;
10cda83af99dd6 JP Abgrall         2011-06-21  247  
10cda83af99dd6 JP Abgrall         2011-06-21  248   out:
10cda83af99dd6 JP Abgrall         2011-06-21  249  	kfree(e);
10cda83af99dd6 JP Abgrall         2011-06-21  250  	return NULL;
10cda83af99dd6 JP Abgrall         2011-06-21  251  }
10cda83af99dd6 JP Abgrall         2011-06-21  252  

:::::: The code at line 201 was first introduced by commit
:::::: 10cda83af99dd606e19a39bb97cf1d90bf2b0f36 ANDROID: netfilter: xt_quota2: adding the original quota2 from xtables-addons

:::::: TO: JP Abgrall <jpa@google.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
