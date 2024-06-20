Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDB81B4C3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 19:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718911945; cv=none; b=Kkhkc5+EOvTVnHcSC5yEmZG+e+9bGg8SlRpX0t1x8hlAHDOdxhQApOiLl6ZTxfkH+Zg7OThl2cdz517Da0rhnI+m2P9vn4YPPQgbqJoBlhZKZGFOPg67Mzw8cUM7Ks9g+tPh02cQvgG9jt69Tn8uktvMxDPPr4NDD8ekKwU4sp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718911945; c=relaxed/simple;
	bh=yiZ+AOuaW1R+sA/6n1O+NgDl5O8ZRmohJspligtnpM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHNQ39Ut3odPyIQ1U3p8PPKvNDNIAwgGJoE/5bxy2BFdeg6e0InwjX/pMQQYV71qdcBi7e93myFgwe5Muz1b6Zc/nPT8+MIm7EQwzAdQbHnIfmMNBWawGkvWzbUbzf7HpxeqyEHVxCdybRI8ULtk9jiTTD+w8sK9LT09vnPfELs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgVCBc7u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgVCBc7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718911942; x=1750447942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yiZ+AOuaW1R+sA/6n1O+NgDl5O8ZRmohJspligtnpM0=;
  b=UgVCBc7uZLqvrnD81+4oi3X0GuTE4lxGEpyrDKweKBqYJeN+CXDn3k/7
   CEbIgv6QDJ9iaNmiG/AKAo5imTtJbrlQKyFTEgL4FS90X1I1fDHwAohEj
   seuoKN7/Dse9Kg4auxsvUuUXuEp3LjrK+lpECbQQJ4wmvVEoBhghOIYKx
   b7B4mL+wuxhmv83BU3b2E+8kzU9wpAnla9OgNyPYP7La/03AHcqPMUeeM
   pk0gDaB7N571YHWFs4dfXXr1MUVmDKPiIcdeO4GgTv9R1KukgwmfwX/+0
   8DZKR/8THJY5lWv4By7ksE0fFS1MySzkgNh3uv/gGGSVxQozFcHkOcvCk
   A==;
X-CSE-ConnectionGUID: 4rL0eAa3Q9Os07x+u9x2bA==
X-CSE-MsgGUID: rp+ZdhCMQcuY8rXsjoC0tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41324813"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="41324813"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 12:32:21 -0700
X-CSE-ConnectionGUID: FE3ebkwbT4GFxIxxGZSt3A==
X-CSE-MsgGUID: 9VQwiTPZSfu70s7bNQ+EIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46870975"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2024 12:32:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKNW5-0007s2-0U;
	Thu, 20 Jun 2024 19:32:17 +0000
Date: Fri, 21 Jun 2024 03:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>
Subject: [sysctl:sysctl-testing 1/1] mm/hugetlb.c:4957:53: warning: passing
 argument 2 of 'hugetlb_sysctl_handler_common' discards 'const' qualifier
 from pointer target type
Message-ID: <202406210353.GJUw06wi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-testing
head:   0942e6ae35b60b8f67ac961637e734b9cc34f225
commit: 0942e6ae35b60b8f67ac961637e734b9cc34f225 [1/1] sysctl: treewide: constify the ctl_table argument of proc_handlers
config: i386-randconfig-002-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210353.GJUw06wi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210353.GJUw06wi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210353.GJUw06wi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c: In function 'hugetlb_sysctl_handler':
>> mm/hugetlb.c:4957:53: warning: passing argument 2 of 'hugetlb_sysctl_handler_common' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    4957 |         return hugetlb_sysctl_handler_common(false, table, write,
         |                                                     ^~~~~
   mm/hugetlb.c:4931:44: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    4931 |                          struct ctl_table *table, int write,
         |                          ~~~~~~~~~~~~~~~~~~^~~~~
   mm/hugetlb.c: In function 'hugetlb_overcommit_handler':
>> mm/hugetlb.c:4985:46: warning: passing argument 1 of 'proc_hugetlb_doulongvec_minmax' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    4985 |         ret = proc_hugetlb_doulongvec_minmax(table, write, buffer, length, ppos,
         |                                              ^~~~~
   mm/hugetlb.c:4914:61: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    4914 | static int proc_hugetlb_doulongvec_minmax(struct ctl_table *table, int write,
         |                                           ~~~~~~~~~~~~~~~~~~^~~~~
--
   net/ipv4/sysctl_net_ipv4.c: In function 'ipv4_ping_group_range':
>> net/ipv4/sysctl_net_ipv4.c:175:41: warning: passing argument 1 of 'inet_get_ping_group_range_table' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     175 |         inet_get_ping_group_range_table(table, &low, &high);
         |                                         ^~~~~
   net/ipv4/sysctl_net_ipv4.c:133:63: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
     133 | static void inet_get_ping_group_range_table(struct ctl_table *table, kgid_t *low, kgid_t *high)
         |                                             ~~~~~~~~~~~~~~~~~~^~~~~
>> net/ipv4/sysctl_net_ipv4.c:189:38: warning: passing argument 1 of 'set_ping_group_range' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     189 |                 set_ping_group_range(table, low, high);
         |                                      ^~~~~
   net/ipv4/sysctl_net_ipv4.c:148:52: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
     148 | static void set_ping_group_range(struct ctl_table *table, kgid_t low, kgid_t high)
         |                                  ~~~~~~~~~~~~~~~~~~^~~~~
--
   net/ipv6/ndisc.c: In function 'ndisc_ifinfo_sysctl_change':
>> net/ipv6/ndisc.c:1963:46: warning: passing argument 1 of 'ndisc_warn_deprecated_sysctl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1963 |                 ndisc_warn_deprecated_sysctl(ctl, "syscall", dev ? dev->name : "default");
         |                                              ^~~
   net/ipv6/ndisc.c:1939:60: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    1939 | static void ndisc_warn_deprecated_sysctl(struct ctl_table *ctl,
         |                                          ~~~~~~~~~~~~~~~~~~^~~
--
   net/ipv6/addrconf.c: In function 'addrconf_sysctl_forward':
>> net/ipv6/addrconf.c:6330:49: warning: passing argument 1 of 'addrconf_fixup_forwarding' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6330 |                 ret = addrconf_fixup_forwarding(ctl, valp, val);
         |                                                 ^~~
   net/ipv6/addrconf.c:866:56: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
     866 | static int addrconf_fixup_forwarding(struct ctl_table *table, int *p, int newf)
         |                                      ~~~~~~~~~~~~~~~~~~^~~~~
   net/ipv6/addrconf.c: In function 'addrconf_sysctl_disable':
>> net/ipv6/addrconf.c:6426:45: warning: passing argument 1 of 'addrconf_disable_ipv6' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6426 |                 ret = addrconf_disable_ipv6(ctl, valp, val);
         |                                             ^~~
   net/ipv6/addrconf.c:6381:52: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    6381 | static int addrconf_disable_ipv6(struct ctl_table *table, int *p, int newf)
         |                                  ~~~~~~~~~~~~~~~~~~^~~~~
   net/ipv6/addrconf.c: In function 'addrconf_sysctl_ignore_routes_with_linkdown':
>> net/ipv6/addrconf.c:6624:47: warning: passing argument 1 of 'addrconf_fixup_linkdown' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6624 |                 ret = addrconf_fixup_linkdown(ctl, valp, val);
         |                                               ^~~
   net/ipv6/addrconf.c:934:54: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
     934 | static int addrconf_fixup_linkdown(struct ctl_table *table, int *p, int newf)
         |                                    ~~~~~~~~~~~~~~~~~~^~~~~
   net/ipv6/addrconf.c: In function 'addrconf_sysctl_disable_policy':
>> net/ipv6/addrconf.c:6719:47: warning: passing argument 1 of 'addrconf_disable_policy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    6719 |                 ret = addrconf_disable_policy(ctl, valp, val);
         |                                               ^~~
   net/ipv6/addrconf.c:6672:47: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    6672 | int addrconf_disable_policy(struct ctl_table *ctl, int *valp, int val)
         |                             ~~~~~~~~~~~~~~~~~~^~~
--
   net/core/neighbour.c: In function 'neigh_proc_dointvec_zero_intmax':
>> net/core/neighbour.c:3609:27: warning: passing argument 1 of 'neigh_proc_update' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3609 |         neigh_proc_update(ctl, write);
         |                           ^~~
   net/core/neighbour.c:3581:49: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    3581 | static void neigh_proc_update(struct ctl_table *ctl, int write)
         |                               ~~~~~~~~~~~~~~~~~~^~~
   net/core/neighbour.c: In function 'neigh_proc_dointvec_ms_jiffies_positive':
   net/core/neighbour.c:3625:27: warning: passing argument 1 of 'neigh_proc_update' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3625 |         neigh_proc_update(ctl, write);
         |                           ^~~
   net/core/neighbour.c:3581:49: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    3581 | static void neigh_proc_update(struct ctl_table *ctl, int write)
         |                               ~~~~~~~~~~~~~~~~~~^~~
   net/core/neighbour.c: In function 'neigh_proc_dointvec':
   net/core/neighbour.c:3634:27: warning: passing argument 1 of 'neigh_proc_update' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3634 |         neigh_proc_update(ctl, write);
         |                           ^~~
   net/core/neighbour.c:3581:49: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    3581 | static void neigh_proc_update(struct ctl_table *ctl, int write)
         |                               ~~~~~~~~~~~~~~~~~~^~~
   net/core/neighbour.c: In function 'neigh_proc_dointvec_jiffies':
   net/core/neighbour.c:3644:27: warning: passing argument 1 of 'neigh_proc_update' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3644 |         neigh_proc_update(ctl, write);
         |                           ^~~
   net/core/neighbour.c:3581:49: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    3581 | static void neigh_proc_update(struct ctl_table *ctl, int write)
         |                               ~~~~~~~~~~~~~~~~~~^~~
   net/core/neighbour.c: In function 'neigh_proc_dointvec_userhz_jiffies':
   net/core/neighbour.c:3655:27: warning: passing argument 1 of 'neigh_proc_update' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3655 |         neigh_proc_update(ctl, write);
         |                           ^~~
   net/core/neighbour.c:3581:49: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    3581 | static void neigh_proc_update(struct ctl_table *ctl, int write)
         |                               ~~~~~~~~~~~~~~~~~~^~~
   net/core/neighbour.c: In function 'neigh_proc_dointvec_ms_jiffies':
   net/core/neighbour.c:3664:27: warning: passing argument 1 of 'neigh_proc_update' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3664 |         neigh_proc_update(ctl, write);
         |                           ^~~
   net/core/neighbour.c:3581:49: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    3581 | static void neigh_proc_update(struct ctl_table *ctl, int write)
         |                               ~~~~~~~~~~~~~~~~~~^~~
   net/core/neighbour.c: In function 'neigh_proc_dointvec_unres_qlen':
   net/core/neighbour.c:3675:27: warning: passing argument 1 of 'neigh_proc_update' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3675 |         neigh_proc_update(ctl, write);
         |                           ^~~
   net/core/neighbour.c:3581:49: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    3581 | static void neigh_proc_update(struct ctl_table *ctl, int write)
         |                               ~~~~~~~~~~~~~~~~~~^~~


vim +4957 mm/hugetlb.c

06808b0827e1cd Lee Schermerhorn    2009-12-14  4956  
06808b0827e1cd Lee Schermerhorn    2009-12-14 @4957  	return hugetlb_sysctl_handler_common(false, table, write,
06808b0827e1cd Lee Schermerhorn    2009-12-14  4958  							buffer, length, ppos);
06808b0827e1cd Lee Schermerhorn    2009-12-14  4959  }
06808b0827e1cd Lee Schermerhorn    2009-12-14  4960  
06808b0827e1cd Lee Schermerhorn    2009-12-14  4961  #ifdef CONFIG_NUMA
0942e6ae35b60b Joel Granados       2024-06-20  4962  static int hugetlb_mempolicy_sysctl_handler(const struct ctl_table *table,
0942e6ae35b60b Joel Granados       2024-06-20  4963  			int write, void *buffer, size_t *length, loff_t *ppos)
06808b0827e1cd Lee Schermerhorn    2009-12-14  4964  {
06808b0827e1cd Lee Schermerhorn    2009-12-14  4965  	return hugetlb_sysctl_handler_common(true, table, write,
06808b0827e1cd Lee Schermerhorn    2009-12-14  4966  							buffer, length, ppos);
06808b0827e1cd Lee Schermerhorn    2009-12-14  4967  }
06808b0827e1cd Lee Schermerhorn    2009-12-14  4968  #endif /* CONFIG_NUMA */
06808b0827e1cd Lee Schermerhorn    2009-12-14  4969  
0942e6ae35b60b Joel Granados       2024-06-20  4970  static int hugetlb_overcommit_handler(const struct ctl_table *table, int write,
32927393dc1ccd Christoph Hellwig   2020-04-24  4971  		void *buffer, size_t *length, loff_t *ppos)
a3d0c6aa1bb342 Nishanth Aravamudan 2008-02-08  4972  {
a5516438959d90 Andi Kleen          2008-07-23  4973  	struct hstate *h = &default_hstate;
e5ff215941d59f Andi Kleen          2008-07-23  4974  	unsigned long tmp;
08d4a24659f128 Michal Hocko        2011-01-13  4975  	int ret;
e5ff215941d59f Andi Kleen          2008-07-23  4976  
457c1b27ed56ec Nishanth Aravamudan 2014-05-06  4977  	if (!hugepages_supported())
86613628b3d367 Jan Stancek         2016-03-09  4978  		return -EOPNOTSUPP;
457c1b27ed56ec Nishanth Aravamudan 2014-05-06  4979  
e5ff215941d59f Andi Kleen          2008-07-23  4980  	tmp = h->nr_overcommit_huge_pages;
e5ff215941d59f Andi Kleen          2008-07-23  4981  
bae7f4ae14d470 Luiz Capitulino     2014-06-04  4982  	if (write && hstate_is_gigantic(h))
adbe8726dc2a38 Eric B Munson       2011-01-13  4983  		return -EINVAL;
adbe8726dc2a38 Eric B Munson       2011-01-13  4984  
17743798d81238 Muchun Song         2020-09-04 @4985  	ret = proc_hugetlb_doulongvec_minmax(table, write, buffer, length, ppos,
17743798d81238 Muchun Song         2020-09-04  4986  					     &tmp);
08d4a24659f128 Michal Hocko        2011-01-13  4987  	if (ret)
08d4a24659f128 Michal Hocko        2011-01-13  4988  		goto out;
e5ff215941d59f Andi Kleen          2008-07-23  4989  
e5ff215941d59f Andi Kleen          2008-07-23  4990  	if (write) {
db71ef79b59bb2 Mike Kravetz        2021-05-04  4991  		spin_lock_irq(&hugetlb_lock);
e5ff215941d59f Andi Kleen          2008-07-23  4992  		h->nr_overcommit_huge_pages = tmp;
db71ef79b59bb2 Mike Kravetz        2021-05-04  4993  		spin_unlock_irq(&hugetlb_lock);
e5ff215941d59f Andi Kleen          2008-07-23  4994  	}
08d4a24659f128 Michal Hocko        2011-01-13  4995  out:
08d4a24659f128 Michal Hocko        2011-01-13  4996  	return ret;
a3d0c6aa1bb342 Nishanth Aravamudan 2008-02-08  4997  }
a3d0c6aa1bb342 Nishanth Aravamudan 2008-02-08  4998  

:::::: The code at line 4957 was first introduced by commit
:::::: 06808b0827e1cd14eedc96bac2655d5b37ac246c hugetlb: derive huge pages nodes allowed from task mempolicy

:::::: TO: Lee Schermerhorn <lee.schermerhorn@hp.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
