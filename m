Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B341F609
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXHWqCMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705154642; x=1736690642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QmyJBT9npMwBBvj+GLNcy2fxI1PaN4dG7lWhtgHV2gc=;
  b=KXHWqCMUlYBhcwOCiWgrV19q/BcQoBuYkrhQbTR6biwJ+7mv2DAof6Av
   MaH5k5NzTdDKRIBHBMiFo8jxZZhfIuSVRWxFhVJGLkbSrxFinMzJR3/3H
   hLWqiEVL3QgyowUDGDFJspacP69eNyNwGsNm6wBE8DOV49iw5nnhXZEhx
   s0ZO5scb/db5ZEPwz8V4BGg+ZdrOrnWAxvTSUztkV0cN0LrYSW0pgPIBs
   aO0Zs2rDn2gYlG+sfY8iSry7axhLz8pH6bzC+UGlD2ggTfQJVMaHYSPzo
   m+OhVpJH96hagiQffphG4tzmVzsw8YEZeyZLgq9Ux9J3MQN8+q+I1jw9R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6467941"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6467941"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 06:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="853549962"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="853549962"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2024 06:03:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOebn-000AYi-2N;
	Sat, 13 Jan 2024 14:03:56 +0000
Date: Sat, 13 Jan 2024 22:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rakie Kim <rakie.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Gregory Price <gregory.price@memverge.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>
Subject: [gmprice:weighted_interleave-next 1/3] mm/mempolicy.c:3111:15:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202401132237.IzgZ7lZ7-lkp@intel.com>
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
config: x86_64-randconfig-123-20240113 (https://download.01.org/0day-ci/archive/20240113/202401132237.IzgZ7lZ7-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401132237.IzgZ7lZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401132237.IzgZ7lZ7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mempolicy.c:3111:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *table @@     got struct iw_table * @@
   mm/mempolicy.c:3111:15: sparse:     expected struct iw_table [noderef] __rcu *table
   mm/mempolicy.c:3111:15: sparse:     got struct iw_table *
>> mm/mempolicy.c:3132:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *new @@     got void * @@
   mm/mempolicy.c:3132:13: sparse:     expected struct iw_table [noderef] __rcu *new
   mm/mempolicy.c:3132:13: sparse:     got void *
>> mm/mempolicy.c:3137:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *old @@     got struct iw_table * @@
   mm/mempolicy.c:3137:13: sparse:     expected struct iw_table [noderef] __rcu *old
   mm/mempolicy.c:3137:13: sparse:     got struct iw_table *
>> mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3141:9: sparse:     expected void const *
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[64]
>> mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3141:9: sparse:     expected void const *
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[64]
>> mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3141:9: sparse:     expected void const *
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[64]
>> mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3141:9: sparse:     expected void const *
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[64]
>> mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3141:9: sparse:     expected void *p
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[64]
>> mm/mempolicy.c:3141:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *q @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3141:9: sparse:     expected void const *q
   mm/mempolicy.c:3141:9: sparse:     got unsigned char [noderef] [usertype] __rcu ( * )[64]
>> mm/mempolicy.c:3145:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   mm/mempolicy.c:3145:9: sparse:     expected struct callback_head *head
   mm/mempolicy.c:3145:9: sparse:     got struct callback_head [noderef] __rcu *
>> mm/mempolicy.c:3145:9: sparse: sparse: cast removes address space '__rcu' of expression
   mm/mempolicy.c:3239:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/mempolicy.c:3239:22: sparse:    struct iw_table [noderef] __rcu *
   mm/mempolicy.c:3239:22: sparse:    struct iw_table *
>> mm/mempolicy.c:3260:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *static [addressable] [assigned] [toplevel] iw_table @@     got struct iw_table * @@
>> mm/mempolicy.c:3262:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct iw_table [noderef] __rcu *table @@     got void * @@
   mm/mempolicy.c:3266:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3266:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
   mm/mempolicy.c:3266:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu ( * )[64] @@
>> mm/mempolicy.c:3271:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct iw_table [noderef] __rcu *table @@
   mm/mempolicy.c:3278:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct iw_table [noderef] __rcu *table @@
   mm/mempolicy.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/mempolicy.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
>> mm/mempolicy.c:3112:32: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3142:21: sparse: sparse: dereference of noderef expression

vim +3111 mm/mempolicy.c

  3100	
  3101	static ssize_t node_show(struct kobject *kobj, struct kobj_attribute *attr,
  3102				 char *buf)
  3103	{
  3104		struct iw_node_attr *node_attr;
  3105		u8 weight;
  3106		struct iw_table __rcu *table;
  3107	
  3108		node_attr = container_of(attr, struct iw_node_attr, kobj_attr);
  3109	
  3110		rcu_read_lock();
> 3111		table = rcu_dereference(iw_table);
> 3112		weight = table->weights[node_attr->nid];
  3113		rcu_read_unlock();
  3114	
  3115		return sysfs_emit(buf, "%d\n", weight);
  3116	}
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
> 3132		new = kmalloc(sizeof(*new), GFP_KERNEL);
  3133		if (!new)
  3134			return -ENOMEM;
  3135	
  3136		mutex_lock(&iw_table_mtx);
> 3137		old = rcu_dereference_protected(iw_table,
  3138						lockdep_is_held(&iw_table_mtx));
  3139		/* If value is 0, revert to default weight */
  3140		weight = weight ? weight : default_iw_table.weights[node_attr->nid];
> 3141		memcpy(&new->weights, &old->weights, sizeof(new->weights));
  3142		new->weights[node_attr->nid] = weight;
  3143		rcu_assign_pointer(iw_table, new);
  3144		mutex_unlock(&iw_table_mtx);
> 3145		kfree_rcu(old, rcu);
  3146		return count;
  3147	}
  3148	
  3149	static struct iw_node_attr *node_attrs[MAX_NUMNODES];
  3150	
  3151	static void sysfs_wi_node_release(struct iw_node_attr *node_attr,
  3152					  struct kobject *parent)
  3153	{
  3154		if (!node_attr)
  3155			return;
  3156		sysfs_remove_file(parent, &node_attr->kobj_attr.attr);
  3157		kfree(node_attr->kobj_attr.attr.name);
  3158		kfree(node_attr);
  3159	}
  3160	
  3161	static void sysfs_wi_release(struct kobject *wi_kobj)
  3162	{
  3163		int i;
  3164	
  3165		for (i = 0; i < MAX_NUMNODES; i++)
  3166			sysfs_wi_node_release(node_attrs[i], wi_kobj);
  3167		kobject_put(wi_kobj);
  3168	}
  3169	
  3170	static const struct kobj_type wi_ktype = {
  3171		.sysfs_ops = &kobj_sysfs_ops,
  3172		.release = sysfs_wi_release,
  3173	};
  3174	
  3175	static int add_weight_node(int nid, struct kobject *wi_kobj)
  3176	{
  3177		struct iw_node_attr *node_attr;
  3178		char *name;
  3179	
  3180		node_attr = kzalloc(sizeof(*node_attr), GFP_KERNEL);
  3181		if (!node_attr)
  3182			return -ENOMEM;
  3183	
  3184		name = kasprintf(GFP_KERNEL, "node%d", nid);
  3185		if (!name) {
  3186			kfree(node_attr);
  3187			return -ENOMEM;
  3188		}
  3189	
  3190		sysfs_attr_init(&node_attr->kobj_attr.attr);
  3191		node_attr->kobj_attr.attr.name = name;
  3192		node_attr->kobj_attr.attr.mode = 0644;
  3193		node_attr->kobj_attr.show = node_show;
  3194		node_attr->kobj_attr.store = node_store;
  3195		node_attr->nid = nid;
  3196	
  3197		if (sysfs_create_file(wi_kobj, &node_attr->kobj_attr.attr)) {
  3198			kfree(node_attr->kobj_attr.attr.name);
  3199			kfree(node_attr);
  3200			pr_err("failed to add attribute to weighted_interleave\n");
  3201			return -ENOMEM;
  3202		}
  3203	
  3204		node_attrs[nid] = node_attr;
  3205		return 0;
  3206	}
  3207	
  3208	static int add_weighted_interleave_group(struct kobject *root_kobj)
  3209	{
  3210		struct kobject *wi_kobj;
  3211		int nid, err;
  3212	
  3213		wi_kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
  3214		if (!wi_kobj)
  3215			return -ENOMEM;
  3216	
  3217		err = kobject_init_and_add(wi_kobj, &wi_ktype, root_kobj,
  3218					   "weighted_interleave");
  3219		if (err) {
  3220			kfree(wi_kobj);
  3221			return err;
  3222		}
  3223	
  3224		memset(node_attrs, 0, sizeof(node_attrs));
  3225		for_each_node_state(nid, N_POSSIBLE) {
  3226			err = add_weight_node(nid, wi_kobj);
  3227			if (err) {
  3228				pr_err("failed to add sysfs [node%d]\n", nid);
  3229				break;
  3230			}
  3231		}
  3232		if (err)
  3233			kobject_put(wi_kobj);
  3234		return 0;
  3235	}
  3236	
  3237	static void mempolicy_kobj_release(struct kobject *kobj)
  3238	{
  3239		if (iw_table != &default_iw_table)
  3240			kfree(iw_table);
  3241		kfree(kobj);
  3242	}
  3243	
  3244	static const struct kobj_type mempolicy_ktype = {
  3245		.release = mempolicy_kobj_release
  3246	};
  3247	
  3248	static struct kobject *mempolicy_kobj;
  3249	static int __init mempolicy_sysfs_init(void)
  3250	{
  3251		int err;
  3252		struct kobject *mempolicy_kobj;
  3253		struct iw_table __rcu *table = NULL;
  3254	
  3255		/*
  3256		 * If sysfs setup fails, utilize the default weight table
  3257		 * This at least allows mempolicy to continue functioning safely.
  3258		 */
  3259		memset(&default_iw_table.weights, 1, MAX_NUMNODES);
> 3260		iw_table = &default_iw_table;
  3261	
> 3262		table = kzalloc(sizeof(struct iw_table), GFP_KERNEL);
  3263		if (!table)
  3264			return -ENOMEM;
  3265	
  3266		memcpy(&table->weights, default_iw_table.weights,
  3267		       sizeof(table->weights));
  3268	
  3269		mempolicy_kobj = kzalloc(sizeof(*mempolicy_kobj), GFP_KERNEL);
  3270		if (!mempolicy_kobj) {
> 3271			kfree(table);
  3272			pr_err("failed to add mempolicy kobject to the system\n");
  3273			return -ENOMEM;
  3274		}
  3275		err = kobject_init_and_add(mempolicy_kobj, &mempolicy_ktype, mm_kobj,
  3276					   "mempolicy");
  3277		if (err) {
  3278			kfree(table);
  3279			kfree(mempolicy_kobj);
  3280			return err;
  3281		}
  3282	
  3283		err = add_weighted_interleave_group(mempolicy_kobj);
  3284	
  3285		if (err) {
  3286			kobject_put(mempolicy_kobj);
  3287			return err;
  3288		}
  3289	
  3290		iw_table = table;
  3291		return err;
  3292	}
  3293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
