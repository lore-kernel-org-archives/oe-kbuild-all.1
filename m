Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9F4A10
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692644529; x=1724180529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QbiXG4pUWrbVQcdIFQIdfaxdcwk/d2lfQPF81e7BSVA=;
  b=Zy8dvxxfAMrXTZU2DNJhkvBhhFTzE/aX06krBycFPFKaKZCIgifsfM3H
   T+bCz0/gekJNBaTGtQcvW3mWOwNVPEhzWCj4VD9qu7dhZDmLy7IHLZNkt
   mkipyT2JDuj3+XAIxLTTdspPsl6ue8R8yDnKFWdGJVRR9GXYAa7CqWn7o
   CPdTaaWjvdJZsELFJQ1gcp7lZ8lHFisHEGiVmorlJW/et4N8TMBN50+qp
   qZxQsm2A/+Rv3OIXwuB+MiftelFkTCHeoOSgc2yn/xzZ28BoVzTKnwwYl
   Oup2r7ZxsE0ukFyEcsYqxl8V13D38qY8nwhHD4Nua0gKcgEiLD5ifs8Ib
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404678056"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="404678056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 12:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712876756"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="712876756"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 12:02:05 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYA98-0000og-2t;
	Mon, 21 Aug 2023 19:01:17 +0000
Date: Tue, 22 Aug 2023 03:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/xt_qtaguid.c:1014:13: warning: variable 'addr_type'
 set but not used
Message-ID: <202308220219.k5pCe7qc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JP,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: dac2dd2be24d8fa1bc023a28affc0faf91bc62b9 ANDROID: netfilter: xt_qtaguid: add qtaguid matching module
date:   2 years, 8 months ago
config: x86_64-randconfig-121-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220219.k5pCe7qc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220219.k5pCe7qc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220219.k5pCe7qc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/xt_qtaguid.c:424:22: warning: no previous prototype for 'get_uid_data' [-Wmissing-prototypes]
     424 | struct uid_tag_data *get_uid_data(uid_t uid, bool *found_res)
         |                      ^~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c: In function 'iface_stat_create_ipv6':
>> net/netfilter/xt_qtaguid.c:1014:13: warning: variable 'addr_type' set but not used [-Wunused-but-set-variable]
    1014 |         int addr_type;
         |             ^~~~~~~~~
   net/netfilter/xt_qtaguid.c: In function 'prdebug_full_state_locked':
   net/netfilter/xt_qtaguid.c:1821:27: warning: function 'prdebug_full_state_locked' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1821 |                           fmt_buff, args);
         |                           ^~~~~~~~

sparse warnings: (new ones prefixed by >>)
   net/netfilter/xt_qtaguid.c:424:21: sparse: sparse: symbol 'get_uid_data' was not declared. Should it be static?
>> net/netfilter/xt_qtaguid.c:968:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct in_ifaddr *ifa @@     got struct in_ifaddr [noderef] __rcu *ifa_list @@
   net/netfilter/xt_qtaguid.c:968:26: sparse:     expected struct in_ifaddr *ifa
   net/netfilter/xt_qtaguid.c:968:26: sparse:     got struct in_ifaddr [noderef] __rcu *ifa_list
>> net/netfilter/xt_qtaguid.c:968:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct in_ifaddr *ifa @@     got struct in_ifaddr [noderef] __rcu *ifa_next @@
   net/netfilter/xt_qtaguid.c:968:55: sparse:     expected struct in_ifaddr *ifa
   net/netfilter/xt_qtaguid.c:968:55: sparse:     got struct in_ifaddr [noderef] __rcu *ifa_next
   net/netfilter/xt_qtaguid.c:708:13: sparse: sparse: context imbalance in 'iface_stat_fmt_proc_start' - wrong count at exit
   net/netfilter/xt_qtaguid.c:733:13: sparse: sparse: context imbalance in 'iface_stat_fmt_proc_stop' - unexpected unlock
   net/netfilter/xt_qtaguid.c:1796:17: sparse: sparse: context imbalance in 'qtaguid_mt' - unexpected unlock
   net/netfilter/xt_qtaguid.c:1873:13: sparse: sparse: context imbalance in 'qtaguid_ctrl_proc_start' - wrong count at exit
   net/netfilter/xt_qtaguid.c:1905:13: sparse: sparse: context imbalance in 'qtaguid_ctrl_proc_stop' - unexpected unlock
   net/netfilter/xt_qtaguid.c:2615:13: sparse: sparse: context imbalance in 'qtaguid_stats_proc_next_iface_entry' - unexpected unlock
   net/netfilter/xt_qtaguid.c:2660:13: sparse: sparse: context imbalance in 'qtaguid_stats_proc_start' - wrong count at exit
   net/netfilter/xt_qtaguid.c:2719:31: sparse: sparse: context imbalance in 'qtaguid_stats_proc_stop' - unexpected unlock

vim +/addr_type +1014 net/netfilter/xt_qtaguid.c

   935	
   936	/*
   937	 * Create a new entry for tracking the specified interface.
   938	 * Do nothing if the entry already exists.
   939	 * Called when an interface is configured with a valid IP address.
   940	 */
   941	static void iface_stat_create(struct net_device *net_dev,
   942				      struct in_ifaddr *ifa)
   943	{
   944		struct in_device *in_dev = NULL;
   945		const char *ifname;
   946		struct iface_stat *entry;
   947		__be32 ipaddr = 0;
   948		struct iface_stat *new_iface;
   949	
   950		IF_DEBUG("qtaguid: iface_stat: create(%s): ifa=%p netdev=%p\n",
   951			 net_dev ? net_dev->name : "?",
   952			 ifa, net_dev);
   953		if (!net_dev) {
   954			pr_err("qtaguid: iface_stat: create(): no net dev\n");
   955			return;
   956		}
   957	
   958		ifname = net_dev->name;
   959		if (!ifa) {
   960			in_dev = in_dev_get(net_dev);
   961			if (!in_dev) {
   962				pr_err("qtaguid: iface_stat: create(%s): no inet dev\n",
   963				       ifname);
   964				return;
   965			}
   966			IF_DEBUG("qtaguid: iface_stat: create(%s): in_dev=%p\n",
   967				 ifname, in_dev);
 > 968			for (ifa = in_dev->ifa_list; ifa; ifa = ifa->ifa_next) {
   969				IF_DEBUG("qtaguid: iface_stat: create(%s): "
   970					 "ifa=%p ifa_label=%s\n",
   971					 ifname, ifa, ifa->ifa_label);
   972				if (!strcmp(ifname, ifa->ifa_label))
   973					break;
   974			}
   975		}
   976	
   977		if (!ifa) {
   978			IF_DEBUG("qtaguid: iface_stat: create(%s): no matching IP\n",
   979				 ifname);
   980			goto done_put;
   981		}
   982		ipaddr = ifa->ifa_local;
   983	
   984		spin_lock_bh(&iface_stat_list_lock);
   985		entry = get_iface_entry(ifname);
   986		if (entry != NULL) {
   987			IF_DEBUG("qtaguid: iface_stat: create(%s): entry=%p\n",
   988				 ifname, entry);
   989			iface_check_stats_reset_and_adjust(net_dev, entry);
   990			_iface_stat_set_active(entry, net_dev, true);
   991			IF_DEBUG("qtaguid: %s(%s): "
   992				 "tracking now %d on ip=%pI4\n", __func__,
   993				 entry->ifname, true, &ipaddr);
   994			goto done_unlock_put;
   995		}
   996	
   997		new_iface = iface_alloc(net_dev);
   998		IF_DEBUG("qtaguid: iface_stat: create(%s): done "
   999			 "entry=%p ip=%pI4\n", ifname, new_iface, &ipaddr);
  1000	done_unlock_put:
  1001		spin_unlock_bh(&iface_stat_list_lock);
  1002	done_put:
  1003		if (in_dev)
  1004			in_dev_put(in_dev);
  1005	}
  1006	
  1007	static void iface_stat_create_ipv6(struct net_device *net_dev,
  1008					   struct inet6_ifaddr *ifa)
  1009	{
  1010		struct in_device *in_dev;
  1011		const char *ifname;
  1012		struct iface_stat *entry;
  1013		struct iface_stat *new_iface;
> 1014		int addr_type;
  1015	
  1016		IF_DEBUG("qtaguid: iface_stat: create6(): ifa=%p netdev=%p->name=%s\n",
  1017			 ifa, net_dev, net_dev ? net_dev->name : "");
  1018		if (!net_dev) {
  1019			pr_err("qtaguid: iface_stat: create6(): no net dev!\n");
  1020			return;
  1021		}
  1022		ifname = net_dev->name;
  1023	
  1024		in_dev = in_dev_get(net_dev);
  1025		if (!in_dev) {
  1026			pr_err("qtaguid: iface_stat: create6(%s): no inet dev\n",
  1027			       ifname);
  1028			return;
  1029		}
  1030	
  1031		IF_DEBUG("qtaguid: iface_stat: create6(%s): in_dev=%p\n",
  1032			 ifname, in_dev);
  1033	
  1034		if (!ifa) {
  1035			IF_DEBUG("qtaguid: iface_stat: create6(%s): no matching IP\n",
  1036				 ifname);
  1037			goto done_put;
  1038		}
  1039		addr_type = ipv6_addr_type(&ifa->addr);
  1040	
  1041		spin_lock_bh(&iface_stat_list_lock);
  1042		entry = get_iface_entry(ifname);
  1043		if (entry != NULL) {
  1044			IF_DEBUG("qtaguid: %s(%s): entry=%p\n", __func__,
  1045				 ifname, entry);
  1046			iface_check_stats_reset_and_adjust(net_dev, entry);
  1047			_iface_stat_set_active(entry, net_dev, true);
  1048			IF_DEBUG("qtaguid: %s(%s): "
  1049				 "tracking now %d on ip=%pI6c\n", __func__,
  1050				 entry->ifname, true, &ifa->addr);
  1051			goto done_unlock_put;
  1052		}
  1053	
  1054		new_iface = iface_alloc(net_dev);
  1055		IF_DEBUG("qtaguid: iface_stat: create6(%s): done "
  1056			 "entry=%p ip=%pI6c\n", ifname, new_iface, &ifa->addr);
  1057	
  1058	done_unlock_put:
  1059		spin_unlock_bh(&iface_stat_list_lock);
  1060	done_put:
  1061		in_dev_put(in_dev);
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
