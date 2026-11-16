Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867670;
	b=tTc60HSMJM3Odmc9i0IetS2yvaS0s2MD9hgQbyCadk/PHDh3q/3mWnWIezjZChEsaOEa
	 ZfKd2RppDGK1a4Bq1+oj5rBcWjfyKry7Mw5kZMyLHdwFaVGTn3vRp+M5szwPSaCsRv/Af
	 wL/NgEnyEOmpwz/SVN/AKrjAm2StSKCpT8rZHz8RTcos56XU5brKLKS4Wtj3kMU5v3iXC
	 ZEpnY98qoFzlHp4wprgRz+prCJgMYG4tMHQsZTCxoUukFztOtdBErY3/OztOCp5dOiDtK
	 oGdvMOisSslmXjjkI6U3MEIFVNJ9PJ5QZARx2YeAghTB4ovh2zUsrSwYcfPmMM7nwWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867670;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GGiyYCG9Q8f+ZQu7hn6DdoPPqlDdbh1u2BTLToUlrwg=;
	b=CKUyj7TMQvO5iD2n9On41ezVpbfPcLEgPIV+RPSc4AqteGQcY+41mW86Dny5o0tTO6Fd
	 CkGQZcO7HZDfYVkmlvo5C3LUH2Hukn21YAi0n1YOOcyg6fCHFzvw2bUFkt+SchaQmrtLU
	 V9CAjMCWNepKJXTOyaDrsPoXjUgqqSK+4XxXhsDft8LsOXJGmf1RZFv9qb8nZWFwSALRQ
	 HkuFNKHf7d/EWbOo/vTff6vulMUE+FDG/IvQqobfp6FSFzt+sWyYZNy6gTt174QxLXnOA
	 U0O/lMQGR2e+0fRahqh8FvufmAfn5VCM6HIRrrZRM3pcbm1YNjNh0sZgAF1rQyGwL4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2KKuMmc;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091D3606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 22:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 091D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2KKuMmc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794867670; x=1826403670;
  h=date:from:to:cc:subject:message-id;
  bh=Nj5i4g2EbD10e5OQAGfaRMizdQwYsmzBwmalWPU4ekY=;
  b=W2KKuMmcbEHClNbv/Xew4V7wFPClrPEY3F5LsyI+lsc3cJHgVFBSOBV7
   CD3v8vwwY/iKEnD9SJzLpG08j7JDA2mWx3mg6xUnUBApy24d8VGljn3Ic
   DgOGbleMdaPEwDWU9kPM484s9/jx9v3morkK2fvpL+OQZapB884Z5af/Q
   lRHkdBr7eXG4dNH6UdxbCGm6k6H9kS1sRIPQ24UTl/9crirS9y385lafn
   ruq35vc+Dg9BGDz3Ks6sxFKmCij8YAMB7eta9UFcplLXU8GBVte1uUtEz
   B+1DJ/PMbKgOBAT0jST7buuI5Ayvw4+rasUCl8WyhJkIBMszF6tZMxves
   g==;
X-CSE-ConnectionGUID: KAmlfCvdSZG+WPkoM9KdZw==
X-CSE-MsgGUID: /RYhefjdQYe77CkjRhRFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3658720"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3658720"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:21:10 -0800
X-CSE-ConnectionGUID: JGqvUulrTRGxHVQijJagaw==
X-CSE-MsgGUID: OhM/2OGmS8CTby1Aif8pEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9585428"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2026 14:21:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT54T-000000002os-2Uu7;
	Mon, 16 Nov 2026 22:21:05 +0000
Date: Mon, 16 Nov 2026 23:20:20 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 drivers/gpu/buddy.c:1272: warning: Excess function parameter 'p' description
 in 'gpu_buddy_print'
Message-ID: <202611162330.mI3EKFyj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 1c44c262a0c2dfd083dc00308d6488d23b58b59e [152/152] gpu: Move DRM buddy allocator one level up (part two)
config: x86_64-randconfig-r2307-20261116 (https://download.01.org/0day-ci/archive/20261116/202611162330.mI3EKFyj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162330.mI3EKFyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611162330.mI3EKFyj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/buddy.c:1272: warning: Excess function parameter 'p' description in 'gpu_buddy_print'


vim +1272 drivers/gpu/buddy.c

  1264	
  1265	/**
  1266	 * gpu_buddy_print - print allocator state
  1267	 *
  1268	 * @mm: GPU buddy manager
  1269	 * @p: GPU printer to use
  1270	 */
  1271	void gpu_buddy_print(struct gpu_buddy *mm)
> 1272	{
  1273		int order;
  1274	
  1275		pr_info("chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
  1276			mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
  1277	
  1278		for (order = mm->max_order; order >= 0; order--) {
  1279			struct gpu_buddy_block *block, *tmp;
  1280			struct rb_root *root;
  1281			u64 count = 0, free;
  1282			unsigned int tree;
  1283	
  1284			for_each_free_tree(tree) {
  1285				root = &mm->free_trees[tree][order];
  1286	
  1287				rbtree_postorder_for_each_entry_safe(block, tmp, root, rb) {
  1288					BUG_ON(!gpu_buddy_block_is_free(block));
  1289					count++;
  1290				}
  1291			}
  1292	
  1293			free = count * (mm->chunk_size << order);
  1294			if (free < SZ_1M)
  1295				pr_info("order-%2d free: %8llu KiB, blocks: %llu\n",
  1296					order, free >> 10, count);
  1297			else
  1298				pr_info("order-%2d free: %8llu MiB, blocks: %llu\n",
  1299					order, free >> 20, count);
  1300		}
  1301	}
  1302	EXPORT_SYMBOL(gpu_buddy_print);
  1303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
