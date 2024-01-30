Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73546A33A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706619186; cv=none; b=ZGe28FpgndZ53gHEmDn6V7B1tsOLyQP4Fg6N0oEZi7dEiIRk3jbi0UtiXDXd4tTqE1a00W9TSixABL5ybvG1PSNzbkLQtfbg4nkeA8IulMEgOhwQ0e55NGco59xNcL4Nr1OVs4i55TgdxuvhEtxBfd4RZRKQ0F/tMVB1tya4Jjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706619186; c=relaxed/simple;
	bh=SXbfYpnbZWS4l4+vwNo2gGsrHksFZ7yrEBVZIGgPVI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MK8ldXh+HiCvRpEvAaCrJ7hTLpk5YOqMRF46vtm80/S1tvvnjOkzikoQSsD4FtRb99xXoyWsuK+DD/EkkLpPoKHvzbzgpXQAOMob8i9wR9rr5QHPW5d277h5snkhPq12vmbdPt6wk0Kwhpw2qJUw8LcGSfrOidwo0615i38RipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNxRjL2x; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNxRjL2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706619185; x=1738155185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXbfYpnbZWS4l4+vwNo2gGsrHksFZ7yrEBVZIGgPVI0=;
  b=CNxRjL2xXvKQguvofH242/ZVHactZ3m0uZmiBrBspYi35ccStK/vlibf
   5sGELdE/NNJUbTJZPM/D6vUIxS1a2YMlkxojiRIQWf1Wd9f3GMKvTdou3
   NCAln7h+/lYegKNkp1GK9ro/GU/S5oqkYqMfdUdyorvprIQLBoBxW1eKv
   dRGzy+0gy5wfwGk+M9+hHDeH9pxe+YNkIXrX2arQi2BdSAcm3Xhw8JWaU
   PhcH6+iSOUqziqCYTmxdCoifqAQMIVzFyjY1QcTxyJtLFtNmhvJfavVz5
   jlyUKLONpwU2jkV0lgHsNbSsblmhgKpnzHDjH+u6ijQa8beEfL7iGYLxR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24745560"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="24745560"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907482433"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="907482433"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2024 04:53:01 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUnbn-0000I3-13;
	Tue, 30 Jan 2024 12:52:59 +0000
Date: Tue, 30 Jan 2024 20:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rakie Kim <rakie.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Gregory Price <gregory.price@memverge.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>
Subject: [linux-next:master 2547/2825] mm/mempolicy.c:3131:17: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202401302054.sXdwijhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: 25506bd0b31e4e9d89dc293aba8f4c6e2110dccf [2547/2825] mm/mempolicy: implement the sysfs-based weighted_interleave interface
config: loongarch-randconfig-r113-20240129 (https://download.01.org/0day-ci/archive/20240130/202401302054.sXdwijhd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240130/202401302054.sXdwijhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302054.sXdwijhd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mempolicy.c:3094:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:3094:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:3094:15: sparse:     got unsigned char *
   mm/mempolicy.c:3123:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *new @@     got void * @@
   mm/mempolicy.c:3123:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3123:13: sparse:     got void *
   mm/mempolicy.c:3128:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3128:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3128:13: sparse:     got unsigned char *
>> mm/mempolicy.c:3131:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *__to @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3131:17: sparse:     expected void *__to
   mm/mempolicy.c:3131:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
>> mm/mempolicy.c:3131:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3131:17: sparse:     expected void const *__from
   mm/mempolicy.c:3131:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
>> mm/mempolicy.c:3133:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *__s @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3133:17: sparse:     expected void *__s
   mm/mempolicy.c:3133:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3138:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3138:15: sparse:     expected void const *objp
   mm/mempolicy.c:3138:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3234:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3234:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3234:13: sparse:     got unsigned char *
   mm/mempolicy.c:3239:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3239:15: sparse:     expected void const *objp
   mm/mempolicy.c:3239:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c:3095:31: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3134:12: sparse: sparse: dereference of noderef expression

vim +3131 mm/mempolicy.c

  3100	
  3101	static ssize_t node_store(struct kobject *kobj, struct kobj_attribute *attr,
  3102				  const char *buf, size_t count)
  3103	{
  3104		struct iw_node_attr *node_attr;
  3105		u8 __rcu *new;
  3106		u8 __rcu *old;
  3107		u8 weight = 0;
  3108	
  3109		node_attr = container_of(attr, struct iw_node_attr, kobj_attr);
  3110		if (count == 0 || sysfs_streq(buf, ""))
  3111			weight = 0;
  3112		else if (kstrtou8(buf, 0, &weight))
  3113			return -EINVAL;
  3114	
  3115		/*
  3116		 * The default weight is 1, for now. When the kernel-internal
  3117		 * default weight array is implemented, 0 will be a directive to
  3118		 * the allocators to use the system-default weight instead.
  3119		 */
  3120		if (!weight)
  3121			weight = 1;
  3122	
  3123		new = kmalloc(nr_node_ids, GFP_KERNEL);
  3124		if (!new)
  3125			return -ENOMEM;
  3126	
  3127		mutex_lock(&iw_table_lock);
  3128		old = rcu_dereference_protected(iw_table,
  3129						lockdep_is_held(&iw_table_lock));
  3130		if (old)
> 3131			memcpy(new, old, nr_node_ids);
  3132		else
> 3133			memset(new, 1, nr_node_ids);
  3134		new[node_attr->nid] = weight;
  3135		rcu_assign_pointer(iw_table, new);
  3136		mutex_unlock(&iw_table_lock);
  3137		synchronize_rcu();
  3138		kfree(old);
  3139		return count;
  3140	}
  3141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
