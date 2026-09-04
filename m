Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE42C361963
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 23:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565572; cv=none; b=l+tE4U+XhzOwO0X5RrwZMos18YiE2RkkAgXIackjbbdXDLkEnBQjiNq7BlGkLjg6FLo4cpZqv/fuJbw7t1eV6Q2QF3+yIAtFdVD5ZM4jN/D+dKnd5xbDMQH81bbdel0Qvqn3XDJPPnTxxkCQGnIEF5Te1ytYCb5Cfd+UL4+mRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565572; c=relaxed/simple;
	bh=4Pg5vV+EKvtyzOfthgwEjI9SDiQxdnc0BUMDvWzHcU8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cGlSnGfGSsCePh+DAUbrFnk4IbLXYY5F0lYDyXZG7sLky8CmR94iG3F5ThW9RcrBMvegKybVyVcciOjM1PygErv7NYZ2cwYdar370lyvrx0Ta6dBBWUpQVr4Ygn1ovHMiJPsthNM9ERArT6nR+jFlFqATNwJhdW8F0NOsuPCci8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZy60yWO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZy60yWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788565570; x=1820101570;
  h=date:from:to:cc:subject:message-id;
  bh=4Pg5vV+EKvtyzOfthgwEjI9SDiQxdnc0BUMDvWzHcU8=;
  b=YZy60yWO3r8DmBM8Sp09hL75NL833++XpAT+hwz+MCD6zw5ZRqts7Cwy
   oAUoWF/VqPFpjObSFf1Vsnhp+VlQ7D2Zmh+3dsKVWwraUih6nfcUE7wrh
   YMCdA0b90ijQCB1gwy9kycRnUwzlhuQAf9G/CS95YRp0bIRx3XbuzosmV
   WQfHj6wTsfzMkgc96a2AB+BCuz4XmVko8KN/pXvj/maGK2Fkq7IqWBR2c
   Vlnj+RH6iTCW9ul1bSuE8GmbMrtinI4U3XNooYv1tg3F88cUCjXJXODhK
   V/Gfj8Y3yABf6WelPfsHUfLjHEz7lL+WQTxizrRMKNP7siYegAhONtOIA
   g==;
X-CSE-ConnectionGUID: hUk8VP5BRd2O4pMEk/2q6g==
X-CSE-MsgGUID: vEM/sxhUTFG4DyRx6Woixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="76630046"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="76630046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 16:46:09 -0700
X-CSE-ConnectionGUID: IEdOFQQoQIGCJ2wamyTbuA==
X-CSE-MsgGUID: HuFv/nzFQFSqBWvdDT1tfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="263967864"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2026 16:46:08 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2dbh-00000000AFW-22k1;
	Fri, 04 Sep 2026 23:46:05 +0000
Date: Sat, 05 Sep 2026 07:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1]
 lib/maple_tree.c:6261:30: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202609050716.gBZMUujD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: 719a42e563bb087758500e43e67a57b27f303c4c [1/1] maple_tree: Convert forking to use the sheaf interface
config: x86_64-randconfig-r123-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050716.gBZMUujD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050716.gBZMUujD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 719a42e563bb ("maple_tree: Convert forking to use the sheaf interface")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050716.gBZMUujD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:6261:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6261:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6261:30: sparse:     got struct maple_node *
>> lib/maple_tree.c:6261:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6261:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6261:30: sparse:     got struct maple_node *

vim +6261 lib/maple_tree.c

  6228	
  6229	/*
  6230	 * mas_dup_alloc() - Allocate child nodes for a maple node.
  6231	 * @mas: The maple state of source tree.
  6232	 * @new_mas: The maple state of new tree.
  6233	 * @gfp: The GFP_FLAGS to use for allocations.
  6234	 *
  6235	 * This function allocates child nodes for @new_mas->node during the duplication
  6236	 * process. If memory allocation fails, @mas is set to -ENOMEM.
  6237	 */
  6238	static inline void mas_dup_alloc(struct ma_state *mas, struct ma_state *new_mas,
  6239			gfp_t gfp)
  6240	{
  6241		struct maple_node *node = mte_to_node(mas->node);
  6242		struct maple_node *new_node = mte_to_node(new_mas->node);
  6243		enum maple_type type;
  6244		unsigned char count, i;
  6245		void __rcu **slots;
  6246		void __rcu **new_slots;
  6247		unsigned long val;
  6248	
  6249		/* Allocate memory for child nodes. */
  6250		type = mte_node_type(mas->node);
  6251		new_slots = ma_slots(new_node, type);
  6252		count = mas->node_request = mas_data_end(mas) + 1;
  6253		mas_alloc_nodes(mas, gfp);
  6254		if (unlikely(mas_is_err(mas)))
  6255			return;
  6256	
  6257		slots = ma_slots(node, type);
  6258		for (i = 0; i < count; i++) {
  6259			val = (unsigned long)mt_slot_locked(mas->tree, slots, i);
  6260			val &= MAPLE_NODE_MASK;
> 6261			new_slots[i] = ma_mnode_ptr((unsigned long)mas_pop_node(mas) |
  6262						    val);
  6263		}
  6264	}
  6265	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
