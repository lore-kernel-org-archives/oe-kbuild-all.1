Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1411367
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 02:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706407335; cv=none; b=hOkGHtMHUXTv4gURAuLfOuLWscWKV9lYAV8jOFUG3sxt1HRfnpN7soHPYZQZNv8DSAMkKLQU/couSC0qL4DYqGc5dOzjRCAB81dlX0NXbvW2cGulQEAwkF4lWrOhBz7MBGhHRgU+ZEkhpCjRg+XukN0Usm6GiGaKqnTmZy1UtCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706407335; c=relaxed/simple;
	bh=3PmfhT6u2nJHl6KS+v8NusVTK9FaGfz7HyqgK/fHumg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h+rkuOGCP4iNtm6bGM59oQrJP5XUPXgGjMbZqFWCRjvfKbqBn0PGK9ylsTYR8TLlexoliKTihXYnSiR9GHFoe5J/lOROPAv157XjoIZCefzV9BnyIv0wqsWrXtrZXa81X/hh1vrPx2cOsOdzckJlxOc2ImFFHKYcCU3JiiVpxJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLc8Up0Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLc8Up0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706407333; x=1737943333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PmfhT6u2nJHl6KS+v8NusVTK9FaGfz7HyqgK/fHumg=;
  b=TLc8Up0YhDlyiEQ3/XLWW3Lsv3jAB6kZFc1j/VWzItBP0Zj+6TV0JL0j
   E9mRtGzVWc6FeZ1upcNI6xwHt2mqhe81hdHHcXXqk1WvmMysvw8BKH2BZ
   mbXY3aD++eXAuzit23Mf7LUjvh32tqOm2IkdC0rUOwBiK154emEDZa2u3
   OjccGdL7ACTc3NS9ETczgSL41UEpOZPzGzf8HiHeMx2ZcIZZScUxs8k5d
   CyrHJqiSAjOKfInSWEHF14kaYdC2y9vQGY3CUne/2/BfpMnM3Ftv3VRvT
   fjetUrlTDnFzQhebdpN4CjEs2wzOnydOl8TZncHRdX3qcprR3veteG0z5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9479360"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9479360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 18:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21737361"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2024 18:02:10 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTuUp-0002yI-37;
	Sun, 28 Jan 2024 02:02:07 +0000
Date: Sun, 28 Jan 2024 10:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rakie Kim <rakie.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Gregory Price <gregory.price@memverge.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [davidhildenbrand:rmap_batching 86/136] mm/mempolicy.c:3135:17:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202401280905.OUS18DsI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   865e6d6a176a1f50bcbb7dd1d6a57b803e398039
commit: e65050eda564d19ea9e6dc8dd3d5e5ccc69bc6ec [86/136] mm/mempolicy: implement the sysfs-based weighted_interleave interface
config: x86_64-randconfig-r131-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280905.OUS18DsI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280905.OUS18DsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280905.OUS18DsI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mempolicy.c:3097:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:3097:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:3097:15: sparse:     got unsigned char *
   mm/mempolicy.c:3127:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *new @@     got void * @@
   mm/mempolicy.c:3127:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3127:13: sparse:     got void *
   mm/mempolicy.c:3132:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3132:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3132:13: sparse:     got unsigned char *
>> mm/mempolicy.c:3135:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3135:17: sparse:     expected void const *
   mm/mempolicy.c:3135:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3135:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3135:17: sparse:     expected void const *
   mm/mempolicy.c:3135:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
>> mm/mempolicy.c:3135:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3135:17: sparse:     expected void const *
   mm/mempolicy.c:3135:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3135:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3135:17: sparse:     expected void const *
   mm/mempolicy.c:3135:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
>> mm/mempolicy.c:3135:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3135:17: sparse:     expected void *p
   mm/mempolicy.c:3135:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
>> mm/mempolicy.c:3135:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *q @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3135:17: sparse:     expected void const *q
   mm/mempolicy.c:3135:17: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3137:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3137:17: sparse:     expected void const *
   mm/mempolicy.c:3137:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3137:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3137:17: sparse:     expected void const *
   mm/mempolicy.c:3137:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3137:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3137:17: sparse:     expected void *p
   mm/mempolicy.c:3137:17: sparse:     got unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3142:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3142:15: sparse:     expected void const *objp
   mm/mempolicy.c:3142:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3239:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3239:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3239:13: sparse:     got unsigned char *
   mm/mempolicy.c:3245:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3245:15: sparse:     expected void const *objp
   mm/mempolicy.c:3245:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c: note: in included file (through include/linux/mmzone.h, include/linux/mempolicy.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/mempolicy.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   mm/mempolicy.c:3098:31: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3138:12: sparse: sparse: dereference of noderef expression

vim +3135 mm/mempolicy.c

  3103	
  3104	static ssize_t node_store(struct kobject *kobj, struct kobj_attribute *attr,
  3105				  const char *buf, size_t count)
  3106	{
  3107		struct iw_node_attr *node_attr;
  3108		u8 __rcu *new;
  3109		u8 __rcu *old;
  3110		u8 weight = 0;
  3111	
  3112		node_attr = container_of(attr, struct iw_node_attr, kobj_attr);
  3113		if (count == 0 || sysfs_streq(buf, ""))
  3114			weight = 0;
  3115		else if (kstrtou8(buf, 0, &weight))
  3116			return -EINVAL;
  3117	
  3118		/*
  3119		 * The default weight is 1 (for now), when the kernel-internal
  3120		 * default weight array is implemented, this should be updated to
  3121		 * collect the system-default weight of the node if the user passes 0.
  3122		 */
  3123		if (!weight)
  3124			weight = 1;
  3125	
  3126		/* We only need to allocate up to the number of possible nodes */
  3127		new = kmalloc(nr_node_ids, GFP_KERNEL);
  3128		if (!new)
  3129			return -ENOMEM;
  3130	
  3131		mutex_lock(&iw_table_lock);
  3132		old = rcu_dereference_protected(iw_table,
  3133						lockdep_is_held(&iw_table_lock));
  3134		if (old)
> 3135			memcpy(new, old, nr_node_ids);
  3136		else
  3137			memset(new, 1, nr_node_ids);
  3138		new[node_attr->nid] = weight;
  3139		rcu_assign_pointer(iw_table, new);
  3140		mutex_unlock(&iw_table_lock);
  3141		synchronize_rcu();
  3142		kfree(old);
  3143		return count;
  3144	}
  3145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
