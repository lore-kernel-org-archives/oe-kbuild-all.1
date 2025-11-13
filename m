Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD64301004
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009666; cv=none; b=Czv5e0qSIw1yw1RZ4laBWYNJtUDWyo8uEV7U9aRfcpwyLAdTbWFsYlKqoKMl5gTwzIzXLRrStD4p3bLj/pEDXbySjAzwck9zahOxxk8UdyRNFd02GJT4L1rn5m+NVCo3ih9I6NC385PVu49LdDCQNTAAnp90Q1WpkI/zS9GJANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009666; c=relaxed/simple;
	bh=kyBnFL+nuczIX9heHyOCBOUjRCVCmxubTn8n5WB2keo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eiLV8LdHjEf3wfa3y9AJgQh5v9AwUeu4zZS36uW2/UIlA+gErZo2guWdG1nRRTCWJo3m9SqBuP1Ct6NoCU2Eq25NC2iaMtbIpEDBm3JruOLAW2eqTDHa/Um0PYulkEAvVaNR/3V58yBn+dw5is8EVMjkmvfGfOtRiMtTRmO4ox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kO8W1Kew; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kO8W1Kew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009666; x=1794545666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kyBnFL+nuczIX9heHyOCBOUjRCVCmxubTn8n5WB2keo=;
  b=kO8W1Kew7YpD/oqx0ln0m/PIHR0iTnejC0MW8+JbP4yhxBs8Z3zbKlMr
   shjX4NnjFnO45isCjTpp7qnH91O+vGdjpW7Lh1URqgJy8PTItMTe0E+sG
   h6StukK7XD29ex7Zjx1v0V+oVB3oDuxs7exFO3b5z5mpnFuG8yvHtmFDx
   xHpGyPpi38xoQFcFM7gM3k1m6PwdonEopP3MmL6S7Yr/i26zEWjjFxW+o
   VMvWCfKUNsvAJjs902iyD9WahlgLEZP+QOt+AZUdruhr/IhFr3fQPl3vQ
   cVqdZJhvtnK8aHftGTDwfjjkxdA0TTvnbxUmpfp8GrGLojv9DJ8pLdW47
   g==;
X-CSE-ConnectionGUID: GblIFLurTdmpw3KgiDC1Tg==
X-CSE-MsgGUID: Hj0SMVBXToeafAxcNi8UAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82480163"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="82480163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:54:24 -0800
X-CSE-ConnectionGUID: 75oCdA/6SlqNODnoi3e7Gg==
X-CSE-MsgGUID: EftTGMf7RSqXQtC/n+XdsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189415499"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2025 20:54:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPLf-0004ul-2G;
	Thu, 13 Nov 2025 04:54:19 +0000
Date: Thu, 13 Nov 2025 12:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3163/3163] mm/gmem.c:190:26: error: no member
 named 'mems_allowed' in 'struct task_struct'
Message-ID: <202511131248.lRKFr4Bu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d07bcf91fa24bfac8f6c62724829741c738bb85d
commit: 380709c322aaa306b5ac3c278a0700043f7d33e2 [3163/3163] gmem: prepare config, boot parameter, vma flag and basic GMEM related structs
config: arm64-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131248.lRKFr4Bu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131248.lRKFr4Bu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131248.lRKFr4Bu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/gmem.c:190:26: error: no member named 'mems_allowed' in 'struct task_struct'
     190 |                 node_set(nid, current->mems_allowed);
         |                               ~~~~~~~  ^
   include/linux/nodemask.h:128:50: note: expanded from macro 'node_set'
     128 | #define node_set(node, dst) __node_set((node), &(dst))
         |                                                  ^~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +190 mm/gmem.c

   144	
   145	int gm_as_attach(struct gm_as *as, struct gm_dev *dev,
   146				bool activate, struct gm_context **out_ctx)
   147	{
   148		struct gm_context *ctx;
   149		int nid;
   150	
   151		ctx = kmem_cache_alloc(gm_ctx_cache, GFP_KERNEL);
   152		if (!ctx)
   153			return -ENOMEM;
   154	
   155		ctx->as = as;
   156		ctx->dev = dev;
   157	
   158		INIT_LIST_HEAD(&ctx->gm_dev_link);
   159		INIT_LIST_HEAD(&ctx->gm_as_link);
   160	
   161		if (!list_empty(&as->gm_ctx_list)) {
   162			struct list_head *old_node;
   163			struct gm_context *old_ctx;
   164	
   165			old_node = as->gm_ctx_list.prev;
   166			list_del_init(old_node);
   167			old_ctx = list_entry(old_node, struct gm_context, gm_as_link);
   168			kfree(old_ctx);
   169		}
   170	
   171		list_add_tail(&dev->gm_ctx_list, &ctx->gm_dev_link);
   172		list_add_tail(&ctx->gm_as_link, &as->gm_ctx_list);
   173	
   174		if (activate) {
   175			/*
   176			 * Here we should really have a callback function to perform the context switch
   177			 * for the hardware. E.g. in x86 this function is effectively
   178			 * flushing the CR3 value. Currently we do not care time-sliced context switch,
   179			 * unless someone wants to support it.
   180			 */
   181			dev->current_ctx = ctx;
   182		}
   183		*out_ctx = ctx;
   184	
   185		/*
   186		 * gm_as_attach will be used to attach device to process address space.
   187		 * Handle this case and add hnodes registered by device to process mems_allowed.
   188		 */
   189		for_each_node_mask(nid, dev->registered_hnodes)
 > 190			node_set(nid, current->mems_allowed);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
