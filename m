Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA724C8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL/H5egZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705166276; x=1736702276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lwff8ATa6O8y6repAGpzsh/IxaMTioKe6OzPBR1EJ7w=;
  b=eL/H5egZKT0Azn1yWyQ82gaOZFX5DAKLFehy7vC+Hcvxr8LD/xzvxOUH
   GLTaJdBO5uos43M98b8ebhmEJa+6fDU/CySmIfl/M79AD9H4Lvwg/WPa7
   cQKhcUpsB9ge0YAmaf5Z+v1m7m6fNr18NA5wJkTy5Va4xGYI2MyECIHVS
   vL62EXu3VhWklLPVOuPfNHKkPFlwO6D8MosjPFSmSYhHETj1EY02HNjXy
   YvM17Qb0hjLXxqQI+HU2nhKwNsy/WZfIt1UrFvhqOWuzb+7wVZeqFA3XY
   5jUEOmfl5/W9IoMaURcU7TGppuhNknHA8mt/oa40Wq8tAR1bMEY7RTSkD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6749305"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6749305"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 09:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="1030232336"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="1030232336"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2024 09:17:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOhdm-000Ak4-32;
	Sat, 13 Jan 2024 17:17:50 +0000
Date: Sun, 14 Jan 2024 01:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Rakie Kim <rakie.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Gregory Price <gregory.price@memverge.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>
Subject: [gmprice:weighted_interleave-next 1/3] mm/mempolicy.c:3141:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202401140155.b5pzSXAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux weighted_interleave-next
head:   7e0e7c7ee6211fe7fed58f84e0f5b3cc177cf678
commit: 27c8aa694c81cf8894418534b58bfabd78f31b65 [1/3] mm/mempolicy: implement the sysfs-based weighted_interleave interface
config: sparc-randconfig-r132-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140155.b5pzSXAL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240114/202401140155.b5pzSXAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140155.b5pzSXAL-lkp@intel.com/

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
>> mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __rcu ( * )[32] @@
   mm/mempolicy.c:3141:9: sparse:     expected void *
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[32]
   mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu ( * )[32] @@
   mm/mempolicy.c:3141:9: sparse:     expected void const *
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[32]
   mm/mempolicy.c:3145:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   mm/mempolicy.c:3145:9: sparse:     expected struct callback_head *head
   mm/mempolicy.c:3145:9: sparse:     got struct callback_head [noderef] __rcu *
   mm/mempolicy.c:3145:9: sparse: sparse: cast removes address space '__rcu' of expression
   mm/mempolicy.c:3239:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/mempolicy.c:3239:22: sparse:    struct iw_table [noderef] __rcu *
   mm/mempolicy.c:3239:22: sparse:    struct iw_table *
   mm/mempolicy.c:3260:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *static [addressable] [assigned] [toplevel] iw_table @@     got struct iw_table * @@
   mm/mempolicy.c:3262:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *table @@     got void * @@
   mm/mempolicy.c:3266:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __rcu ( * )[32] @@
   mm/mempolicy.c:3271:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct iw_table [noderef] __rcu *table @@
   mm/mempolicy.c:3278:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct iw_table [noderef] __rcu *table @@
   mm/mempolicy.c:594:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
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
