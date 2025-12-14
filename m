Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E72EB845
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734581; cv=none; b=An/q7cNWs05kMiB1qiE7wSh+TGx5wLJ0m7sVkgIxCYR4lMmz+LHhGXS8oY08UsP3W8/K2V+fRJ6CP39O99X7srFw5flW0wZ2JrvDVISq/ioOa4BQZljakJ8eloJ30FlSYAbcph5jAC2za3QtsG4LNk/NXYWnTOHsW/wx6eGQx/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734581; c=relaxed/simple;
	bh=hWO1LMU6kmaYhyKr0g0R1UmtVE4c0pXl4cLpc+bKw7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NR3gb8456OfC8W/CFVykyTG5ZLRtwaoCjJCjfRzrdEUVFjKoX7oRmLL77jtmu5Wsplszlhv80zeop60Bg+zAJY9ikBLsyWTA3T2BpQ7y2RtLIok1J708pNYB+T43f9aQhJ7VkZ7X999XxmY2LueP5sKuD5PJ18AMVSZ0yKxR43o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0qe6INR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0qe6INR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765734579; x=1797270579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWO1LMU6kmaYhyKr0g0R1UmtVE4c0pXl4cLpc+bKw7s=;
  b=R0qe6INR9EMrpH2TYnB8DbcL0lEjJZQZ2Kxj4upwtmteo0xiKx/xXuia
   bVjK8LAYE+IPh4PGQl7+/1XPO+2zej/SY45kyZt8mlUkOqmcJ+2sBP00r
   L9oxhBoSw4kDIeVyUnb4BCnq/5/BcOxHz2E1Fqf4X6wN/rTTD+i8rEs0H
   ri31cLN58u+lzzYxZgNGjkH2S3+30Q3JinMFkRJav6oqIRRYwrpBIE4/v
   vW5m5KHdG3S6NV5tIsECzlrgBJcVgPpXJyD1W/sAY12cmIlpOqNrfHIpM
   0kXO7S0TMx2u/87Dm7KahECsI6VgwIm+/GBmKj2jybceEIvs9HC86ik2C
   g==;
X-CSE-ConnectionGUID: 9YACqYH+Q5WDxcrv5/Gw/g==
X-CSE-MsgGUID: 0pUgL33cSHukcu6fdmkL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85063549"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85063549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 09:49:37 -0800
X-CSE-ConnectionGUID: dQPWuv4kTfCFp0Xwu1d0jw==
X-CSE-MsgGUID: TW3O7+PyRUWkEMZ3DmaQvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197438042"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Dec 2025 09:49:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUqDt-000000009Fc-3QGF;
	Sun, 14 Dec 2025 17:49:33 +0000
Date: Mon, 15 Dec 2025 01:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>
Subject: lib/maple_tree.c:6261:30: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512150115.bjHX4WCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 719a42e563bb087758500e43e67a57b27f303c4c maple_tree: Convert forking to use the sheaf interface
date:   3 months ago
config: arc-randconfig-r132-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150115.bjHX4WCe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150115.bjHX4WCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150115.bjHX4WCe-lkp@intel.com/

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
