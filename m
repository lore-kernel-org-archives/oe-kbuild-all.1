Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5502C22331E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192002; cv=none; b=gWU/GhNg1zUqAHJHAG0i101Cjp25l/U9DD3IZuRem+7xPItaoajSQ3aZNfFnSsYU863Xfc1a0cfESqExuU1HmF2vuUPgnRg8R4L9oO0f31hj5JPRNMPKnLJOtijWfc/pdjKXWDeFuqLMQ59yY4LS8PZI9OkmlSLvR0jVddHs0/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192002; c=relaxed/simple;
	bh=dDqeST810SciDLnRjmQGaUvxR7rt4kKNVdnuNGyfEaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cmKwjeHNp9MdrfJkoX7tTfMkPVHjlpcUk76D+Y4eqob1e2cSM9fVj8yREWhcApPOC69Nwv5AUHAAE/HXlG8/ZlDIBklSpgDoniNqtYcl4e/aSCBD9FMEZoM47RGT2bxn2hjpMxYd5b5wW3XMNANJWhSdmMPX7/iOtZ/25csEVUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmGPiKev; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmGPiKev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739192000; x=1770728000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDqeST810SciDLnRjmQGaUvxR7rt4kKNVdnuNGyfEaI=;
  b=WmGPiKevw/CYyQuj8Px1LQKiHUyAYiLf2hsWooxiTFGgDqpZK0sw/BiH
   VyH+ydV3tP2ltqVeIfGKQ9OdzAMEM/vBPJlGHJdyWDUUPK0VkNilvXyBd
   nOn8CMIyrfN8u5IroFOm2uK+tdbXTyO5MY5P7N0JPtk90rVjN4heFoD9L
   8eVIA6W7ZLYrEcrAr8qOl2SceT8bz0Ld00UYr8AlbrGtQyI2o+piqCi80
   Kc8RqUHg2PhGG4enufXEWWBv+m6brFOauGtRhMcmmU8+jFS2CNyIWK1Ha
   8pmFDFD//+J5/45uFXFnp2kxzyMx7IIY9camh1eGPptZiuVTz2zjtSgjE
   g==;
X-CSE-ConnectionGUID: pDkIxlODSqa45GB9hXJteQ==
X-CSE-MsgGUID: 94kN9UzbT/6E4V0wejOEZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43530681"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43530681"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:53:18 -0800
X-CSE-ConnectionGUID: hg10GrRZQeCmnEUfL1HA9w==
X-CSE-MsgGUID: JbJumYVvRIm0K5RE5x3AIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143075272"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 04:53:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thTHm-0012lh-1H;
	Mon, 10 Feb 2025 12:53:14 +0000
Date: Mon, 10 Feb 2025 20:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka:maple-tree-sheaves-v3-hack 19/21] lib/maple_tree.c:6481:30:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202502102217.0YW7bpVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git maple-tree-sheaves-v3-hack
head:   9b7a825f40a76d8502c0e96c19cfd47c53d8bd4d
commit: 0cf12ebfec24f08ea972ca4a28b71f0b212388e0 [19/21] maple_tree: Convert forking to use the sheaf interface
config: hexagon-randconfig-r113-20250210 (https://download.01.org/0day-ci/archive/20250210/202502102217.0YW7bpVS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250210/202502102217.0YW7bpVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102217.0YW7bpVS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:6481:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6481:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6481:30: sparse:     got struct maple_node *
>> lib/maple_tree.c:6481:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __rcu * @@     got struct maple_node * @@
   lib/maple_tree.c:6481:30: sparse:     expected void [noderef] __rcu *
   lib/maple_tree.c:6481:30: sparse:     got struct maple_node *

vim +6481 lib/maple_tree.c

  6448	
  6449	/*
  6450	 * mas_dup_alloc() - Allocate child nodes for a maple node.
  6451	 * @mas: The maple state of source tree.
  6452	 * @new_mas: The maple state of new tree.
  6453	 * @gfp: The GFP_FLAGS to use for allocations.
  6454	 *
  6455	 * This function allocates child nodes for @new_mas->node during the duplication
  6456	 * process. If memory allocation fails, @mas is set to -ENOMEM.
  6457	 */
  6458	static inline void mas_dup_alloc(struct ma_state *mas, struct ma_state *new_mas,
  6459			gfp_t gfp)
  6460	{
  6461		struct maple_node *node = mte_to_node(mas->node);
  6462		struct maple_node *new_node = mte_to_node(new_mas->node);
  6463		enum maple_type type;
  6464		unsigned char count, i;
  6465		void __rcu **slots;
  6466		void __rcu **new_slots;
  6467		unsigned long val;
  6468	
  6469		/* Allocate memory for child nodes. */
  6470		type = mte_node_type(mas->node);
  6471		new_slots = ma_slots(new_node, type);
  6472		count = mas->node_request = mas_data_end(mas) + 1;
  6473		mas_alloc_nodes(mas, gfp);
  6474		if (unlikely(mas_is_err(mas)))
  6475			return;
  6476	
  6477		slots = ma_slots(node, type);
  6478		for (i = 0; i < count; i++) {
  6479			val = (unsigned long)mt_slot_locked(mas->tree, slots, i);
  6480			val &= MAPLE_NODE_MASK;
> 6481			new_slots[i] = ma_mnode_ptr((unsigned long)mas_pop_node(mas) |
  6482						    val);
  6483		}
  6484	}
  6485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
