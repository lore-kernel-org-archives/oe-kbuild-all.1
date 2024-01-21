Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90392FBF0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705817589; cv=none; b=bzsAS38YNNJUvVX7AsaspaBUoF2A9sOU5aBVVTBCx8aFxzsFI8NSIrj9Ky1/xx7crE+f9Pxm2DGr6BfKPakeulYTEhxXVtzWGiw05uUJwOf8W4r0sVGYJnNFLH075ejnqb0M3dR1h8bSbO5a/TOJIPSRz5fXHkJNPGv8SCf/mBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705817589; c=relaxed/simple;
	bh=i0GN1v0/TyXpodsgneQwj24X5be3EabONJks+S5fkRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQoYR+e6G0ZsmRIq7736NxST9Tt2dWE45vcqXypTRh1nvOEgGnXyPWi46yX7Wocr3qHMiQk9qBd1MezHIkbeLa7vPwXi9880aqC7ZPJvkgwTM2K6wZZwHbjGdBWKHLdTXxEXsdc0xP+X8PPijtAzOtPcgrmP1fbmYueN8fTI0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMibsFMJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMibsFMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705817587; x=1737353587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0GN1v0/TyXpodsgneQwj24X5be3EabONJks+S5fkRs=;
  b=LMibsFMJB6S2XSewEEglEMzCNq29nyGh2Xc1SylSQkYLSNJpW86x0Zbs
   6GWySbGItmN9qnYs8/dhut83wj5qPb0YENfkrsjjBMzscBPHGY7/VSA1q
   PzU19KD7bqfzzHHIfHEghQiUWpZHma0T6TP88OXQckeALugivoFr1Gmxj
   DH6yq9dMREmJeVCkeEHDrRE4Vq18rkF7qS2iv4uM34+G6LfyC/QfKloBL
   Hj5GlvY+jyyQyh0Oel1Cl20tneGOU/V07/CZGGZahFdro6qFBSxtmHNE4
   /Gp6Q/ZMA+BU7FoDxYt3ySOFt8rLfw97HwT++c3tgmKBx/Bhta7wsEIkJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="22485852"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="22485852"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 22:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="734879565"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="734879565"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2024 22:13:03 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRR4m-0005ic-2u;
	Sun, 21 Jan 2024 06:13:00 +0000
Date: Sun, 21 Jan 2024 14:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rakie Kim <rakie.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Gregory Price <gregory.price@memverge.com>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>
Subject: [gmprice:weighted_interleave-next 1/3] mm/mempolicy.c:3097:15:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202401211426.1h1pULEX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux weighted_interleave-next
head:   90d8924fe6f567419df2b94ac6a523b8f4ec59a9
commit: 52c1fe4c43d3f0af8aeb56fb5e079ae1e025b770 [1/3] mm/mempolicy: implement the sysfs-based weighted_interleave interface
config: powerpc64-randconfig-r112-20240121 (https://download.01.org/0day-ci/archive/20240121/202401211426.1h1pULEX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240121/202401211426.1h1pULEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401211426.1h1pULEX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mempolicy.c:3097:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *table @@     got unsigned char * @@
   mm/mempolicy.c:3097:15: sparse:     expected unsigned char [noderef] [usertype] __rcu *table
   mm/mempolicy.c:3097:15: sparse:     got unsigned char *
>> mm/mempolicy.c:3127:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *new @@     got void * @@
   mm/mempolicy.c:3127:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *new
   mm/mempolicy.c:3127:13: sparse:     got void *
>> mm/mempolicy.c:3132:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3132:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3132:13: sparse:     got unsigned char *
>> mm/mempolicy.c:3135:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3135:24: sparse:     expected void *
   mm/mempolicy.c:3135:24: sparse:     got unsigned char [noderef] [usertype] __rcu *new
>> mm/mempolicy.c:3135:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3135:29: sparse:     expected void const *
   mm/mempolicy.c:3135:29: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3137:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned char [noderef] [usertype] __rcu *new @@
   mm/mempolicy.c:3137:24: sparse:     expected void *
   mm/mempolicy.c:3137:24: sparse:     got unsigned char [noderef] [usertype] __rcu *new
>> mm/mempolicy.c:3142:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3142:15: sparse:     expected void const *objp
   mm/mempolicy.c:3142:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3239:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] __rcu *old @@     got unsigned char * @@
   mm/mempolicy.c:3239:13: sparse:     expected unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:3239:13: sparse:     got unsigned char *
   mm/mempolicy.c:3245:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got unsigned char [noderef] [usertype] __rcu *old @@
   mm/mempolicy.c:3245:15: sparse:     expected void const *objp
   mm/mempolicy.c:3245:15: sparse:     got unsigned char [noderef] [usertype] __rcu *old
   mm/mempolicy.c:580:9: sparse: sparse: context imbalance in 'queue_folios_pte_range' - unexpected unlock
   mm/mempolicy.c:3098:31: sparse: sparse: dereference of noderef expression
   mm/mempolicy.c:3138:12: sparse: sparse: dereference of noderef expression

vim +3097 mm/mempolicy.c

  3086	
  3087	static ssize_t node_show(struct kobject *kobj, struct kobj_attribute *attr,
  3088				 char *buf)
  3089	{
  3090		struct iw_node_attr *node_attr;
  3091		u8 weight;
  3092		u8 __rcu *table;
  3093	
  3094		node_attr = container_of(attr, struct iw_node_attr, kobj_attr);
  3095	
  3096		rcu_read_lock();
> 3097		table = rcu_dereference(iw_table);
  3098		weight = table ? table[node_attr->nid] : 1;
  3099		rcu_read_unlock();
  3100	
  3101		return sysfs_emit(buf, "%d\n", weight);
  3102	}
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
> 3127		new = kmalloc(nr_node_ids, GFP_KERNEL);
  3128		if (!new)
  3129			return -ENOMEM;
  3130	
  3131		mutex_lock(&iw_table_lock);
> 3132		old = rcu_dereference_protected(iw_table,
  3133						lockdep_is_held(&iw_table_lock));
  3134		if (old)
> 3135			memcpy(new, old, nr_node_ids);
  3136		else
  3137			memset(new, 1, nr_node_ids);
  3138		new[node_attr->nid] = weight;
  3139		rcu_assign_pointer(iw_table, new);
  3140		mutex_unlock(&iw_table_lock);
  3141		synchronize_rcu();
> 3142		kfree(old);
  3143		return count;
  3144	}
  3145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
