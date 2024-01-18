Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE612DF73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609605; cv=none; b=PbAxxDWNRpIAjBsIj4wXGjqQcx7s1rqGsN/uXf85d78s1hgmpaFDpTVpcZ7m/D3vWn6sI3JqrkPMFRmP+6USDVDqbCsLQ//egZEdqdqDsJKPtClqgL7MZXcg0Fwvnoi+ab1OirFoEyVE2CjaCTqLjrkMXgCaYP9Oi8S7iCylbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609605; c=relaxed/simple;
	bh=j5iHafqTBpMTcjoJG75vfFQfzhST5xzpGkHTn92hwQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+XReAA/pg0K4UOFMaliKPIaqcgoSjgWvenTqiGUE0jowmgU8kAZ7IfbGLyxEEJoKAn5lTBsv+92M8QzgiM6AibHYy3Czjs7KKJTXNICIIFlM4yxlC92MnP/iydo+Y4QFoiJ9ynJoZgQXUsCfbXtXmcvKsfey438Kix57JjyG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/KqVpoy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/KqVpoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705609603; x=1737145603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j5iHafqTBpMTcjoJG75vfFQfzhST5xzpGkHTn92hwQk=;
  b=O/KqVpoynj460eHAA5gvZpnBl53920sGr8Z9+Pfx57qlKnqyEj34TTR3
   wZ4jqFMw7JKMMOrRVJQgVu/4tGP+/uCZdm8o2g8Wn7hEI2opXDZdd7iAS
   g9W5qM+L55CiU3DmUwvT7S8rlI/ubGfhIiCPAaGMQ0eJqBxd/8bR6dBtR
   FJFh4sRwwT+a+eZYyZP3tkcvZs2FuaG5Nl854DyZfBHurV/LeumDyQ44Z
   AmD/7npsHahrBHg/olBXthj6D2OeIpr595LKana2WPVTa+rkBC8fsMMx9
   xGn4K3ph3D5EpfIHxT8ZAx8wMBNEEN8mitSzW/EiL3Qc+MEyp0y5UJHf2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7968856"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7968856"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818873100"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="818873100"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2024 12:24:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQYw7-0003Iy-2R;
	Thu, 18 Jan 2024 20:24:27 +0000
Date: Fri, 19 Jan 2024 04:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Rakie Kim <rakie.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Gregory Price <gregory.price@memverge.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>
Subject: [akpm-mm:mm-unstable 77/88] mm/mempolicy.c:3141:17: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202401190453.R3kE0fNX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   d7ba3d7c3bf13e2faf419cce9e9bdfc3a1a50905
commit: 87bb2dbb869cbd1a0aa8cfd43d7f96882c9924a0 [77/88] mm/mempolicy: implement the sysfs-based weighted_interleave interface
config: s390-randconfig-r132-20240118 (https://download.01.org/0day-ci/archive/20240119/202401190453.R3kE0fNX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240119/202401190453.R3kE0fNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190453.R3kE0fNX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mempolicy.c:3111:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *table @@     got struct iw_table * @@
   mm/mempolicy.c:3111:15: sparse:     expected struct iw_table [noderef] __rcu *table
   mm/mempolicy.c:3111:15: sparse:     got struct iw_table *
   mm/mempolicy.c:3132:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *new @@     got void * @@
   mm/mempolicy.c:3132:13: sparse:     expected struct iw_table [noderef] __rcu *new
   mm/mempolicy.c:3132:13: sparse:     got void *
   mm/mempolicy.c:3137:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *old @@     got struct iw_table * @@
   mm/mempolicy.c:3137:13: sparse:     expected struct iw_table [noderef] __rcu *old
   mm/mempolicy.c:3137:13: sparse:     got struct iw_table *
>> mm/mempolicy.c:3141:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got unsigned char [noderef] [usertype] __rcu ( * )[2] @@
   mm/mempolicy.c:3141:17: sparse:     expected void *dest
   mm/mempolicy.c:3141:17: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[2]
>> mm/mempolicy.c:3141:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got unsigned char [noderef] [usertype] __rcu ( * )[2] @@
   mm/mempolicy.c:3141:32: sparse:     expected void const *src
   mm/mempolicy.c:3141:32: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[2]
   mm/mempolicy.c:3145:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   mm/mempolicy.c:3145:9: sparse:     expected struct callback_head *head
   mm/mempolicy.c:3145:9: sparse:     got struct callback_head [noderef] __rcu *
   mm/mempolicy.c:3145:9: sparse: sparse: cast removes address space '__rcu' of expression
   mm/mempolicy.c:3239:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/mempolicy.c:3239:22: sparse:    struct iw_table [noderef] __rcu *
   mm/mempolicy.c:3239:22: sparse:    struct iw_table *
   mm/mempolicy.c:3260:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *static [addressable] [assigned] [toplevel] iw_table @@     got struct iw_table * @@
   mm/mempolicy.c:3262:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *table @@     got void * @@
   mm/mempolicy.c:3266:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got unsigned char [noderef] [usertype] __rcu ( * )[2] @@
   mm/mempolicy.c:3271:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct iw_table [noderef] __rcu *table @@
   mm/mempolicy.c:3278:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct iw_table [noderef] __rcu *table @@
   mm/mempolicy.c:535:17: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/mempolicy.c:3112:32: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3142:21: sparse: sparse: dereference of noderef expression

vim +3141 mm/mempolicy.c

  3117	
  3118	static ssize_t node_store(struct kobject *kobj, struct kobj_attribute *attr,
  3119				  const char *buf, size_t count)
  3120	{
  3121		struct iw_node_attr *node_attr;
  3122		struct iw_table __rcu *new;
  3123		struct iw_table __rcu *old;
  3124		u8 weight = 0;
  3125	
  3126		node_attr = container_of(attr, struct iw_node_attr, kobj_attr);
  3127		if (count == 0 || sysfs_streq(buf, ""))
  3128			weight = 0;
  3129		else if (kstrtou8(buf, 0, &weight))
  3130			return -EINVAL;
  3131	
  3132		new = kmalloc(sizeof(*new), GFP_KERNEL);
  3133		if (!new)
  3134			return -ENOMEM;
  3135	
  3136		mutex_lock(&iw_table_mtx);
  3137		old = rcu_dereference_protected(iw_table,
  3138						lockdep_is_held(&iw_table_mtx));
  3139		/* If value is 0, revert to default weight */
  3140		weight = weight ? weight : default_iw_table.weights[node_attr->nid];
> 3141		memcpy(&new->weights, &old->weights, sizeof(new->weights));
  3142		new->weights[node_attr->nid] = weight;
  3143		rcu_assign_pointer(iw_table, new);
  3144		mutex_unlock(&iw_table_mtx);
  3145		kfree_rcu(old, rcu);
  3146		return count;
  3147	}
  3148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
