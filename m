Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580E4204E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 01:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782522320; cv=none; b=rsNTxvTodMiJa2dCfSruLbzgwrxBA5zy7fqgroNMcE96gVSfeck5+LXIZrc4ZKhgbbhSUCrcU/UyZNn3GUK4o2lfv7N/FTHHCpe9noOiQHj6bZYKi0kvmaHsDA4Ws51veKDEsyuHvRJKaS6dh8J03BWEtVmEpJKoMitiXeWl0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782522320; c=relaxed/simple;
	bh=wcHZg4KsNaiT9atjwgPTK1MNl9bzttkdhSDq1QNbuoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pXWaBZqkcfkIvSVH44tthCLsWmUbxlzSsBIWiwmXwrS1R2jaUz6dZAFnhE1qqRfa+MEnEj171AOUiBEj8uagvqQX1uRP+NE1ObrWtgLcpHD7k2z4eS9m2Ezlt1xb62mim0BMiptnq4jdVF7PHR7S23nTKJrNFpONRWLPgVTmtuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eqzg3gXH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eqzg3gXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782522318; x=1814058318;
  h=date:from:to:cc:subject:message-id;
  bh=wcHZg4KsNaiT9atjwgPTK1MNl9bzttkdhSDq1QNbuoA=;
  b=Eqzg3gXHuTwxSFs7iLEylmQ6G2UHR1nSAs7Csi6If9Vk/G9mlj1miMXk
   epJTATb4Rm8dQOp2Or/eAt3vJsLzbWaqvyZJptwjCZ21HwE8WDU9oi2qU
   WEI0CSV204AdNfXEgw2HPkzLSlXaDA+P1w2ijFuGfbB08qHVGvhFn9uj5
   SDQpvrwxU8zrQz8hsm1VjCxo5Qejt0uGWwdWxZXljZTY0+wU4xdp+XpZX
   r8s+aRkPRDqUuqPOp++RQWnIPS6chyhRHoBkFVdF/YUgXsu4ZuT67Jrk3
   SVRmCNkWFRZ8C6ySR8x4AgA5MNQFYt44eyLe2EOUP4CltabHq9v6H2BU/
   A==;
X-CSE-ConnectionGUID: 2zhn3ahuS8qHHODp11jyOw==
X-CSE-MsgGUID: g/V1y8GzTpmD/ew6Big0Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94463869"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="94463869"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 18:05:18 -0700
X-CSE-ConnectionGUID: PUPRf4UFSZGc1LP3c5bkyw==
X-CSE-MsgGUID: 3IRRc3RqTdOaKbieif+MhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="252100432"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2026 18:05:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdHTo-000000005YT-3Q5c;
	Sat, 27 Jun 2026 01:05:08 +0000
Date: Sat, 27 Jun 2026 09:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Liam R. Howlett (Oracle)" <liam@infradead.org>
Subject: [liam:maple_marks_v7.2 11/31] lib/maple_tree.c:528:46:
 sparse: sparse: cast removes address space '__rcu' of expression
Message-ID: <202606270937.VMOBGtwx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: ff58b13f4f7886645f07ec9b542536362d4b230c [11/31] maple_tree: Add bulk parent set helper
config: nios2-randconfig-r122-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270937.VMOBGtwx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270937.VMOBGtwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270937.VMOBGtwx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/maple_tree.c:528:46: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +528 lib/maple_tree.c

   498	
   499	/*
   500	 * mas_set_parent_slots() - Bulk operation to set many slot parent pointers
   501	 * @mas: The maple state
   502	 * @parent: The encoded maple node that is the parent of @enode.
   503	 * @slot: The slot that of the @enode.
   504	 * @start_slot: The offset into @slot
   505	 * @count: The number of slots to set (eg: exclusive)
   506	 */
   507	static inline
   508	void mas_set_parent_slots(struct ma_state *mas, struct maple_enode *parent,
   509		void __rcu **slots, unsigned char start_slot, unsigned char count)
   510	{
   511		unsigned long val;
   512		unsigned long shift;
   513		unsigned long type;
   514		enum maple_type p_type = mte_node_type(parent);
   515		unsigned char i;
   516	
   517		MAS_BUG_ON(mas, p_type != maple_range_64 &&
   518				p_type != maple_arange_64);
   519	
   520		shift = MAPLE_PARENT_SLOT_SHIFT;
   521		type = MAPLE_PARENT_RANGE64;
   522	
   523		val = (unsigned long)parent;
   524		val &= ~MAPLE_NODE_MASK;
   525	
   526		for (i = 0; i < count; i++) {
   527			unsigned long pval = val | ((start_slot + i) << shift) | type;
 > 528			struct maple_enode *child = (struct maple_enode *)slots[i];
   529	
   530			mte_to_node(child)->parent = ma_parent_ptr(pval);
   531		}
   532	}
   533	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
