Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF43A5E7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757389; cv=none; b=S7I8ngoMGuoWOcg0xrrTEutF+eO2nN49dzl+KxZBFVeH8OULk4rwQOchv+JrwDDMN6xzkz0nJXaffYvElmNWUPzyslvrRAXE6T+DKyTMoo7q2tmfs8NV4709giRrqAbc7ojvFVw/2nagqkVMeo4qlOGT4eCrA50r/Yhh9Y9IHkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757389; c=relaxed/simple;
	bh=61oLJ2BZ4zRMwmCGX9VdOXLTHuqSa7+DACvsDxSyWzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FI0dwsTUfS2Oi2pKCqxo1hE+K6/d+AMUc0ifjskUWv3Finc+Njp1MyNX7287GlKlGoncU0mdIWheRlHIu3eYdT5r07+FefEFFuSfT594IIeLmkyZSXSm/+wh7s90bO4PXeu/aUdkLPsV++2aY6lSZbgfb4mcdGR+G+pRHL1Ju3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evo0fRHi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evo0fRHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773757388; x=1805293388;
  h=date:from:to:cc:subject:message-id;
  bh=61oLJ2BZ4zRMwmCGX9VdOXLTHuqSa7+DACvsDxSyWzs=;
  b=evo0fRHi/ndHsAORbgoVToLqafUR4YqnflVjPlnlp+QfIthlVeQ9q3W/
   5cYVfTcIPugmFGYR1ntO1eEZnxKEs+XXsFhjIgW9loYTTZRkI7KnWjRj6
   4/B5+H8FusIvevcUMQx7p7Zm/dojCwC/cF4O2SRaSlXoHC/4kqT1MXVGT
   6qIjnKr6NjGR3XGg3nAP+I/yac1xQCEWDSYC56hmteNGKClFd7ihUPRHx
   5E4T2rPgTEP9Awddf+A3BCSrIuFMF6CQszpxOx/fnWsTwV94oguRrbwwy
   TJEvUVUx9GgU7ng0rsEp049AuW5kqR6mDE6ltabmRi3fvuWf25+ahd83g
   g==;
X-CSE-ConnectionGUID: 664GkXkmRryPAUVIRMixrQ==
X-CSE-MsgGUID: FNndS4SrTxWSVVNsBHtYaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85418110"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85418110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:23:07 -0700
X-CSE-ConnectionGUID: /NfpS9bcSqmpcx7droJXQg==
X-CSE-MsgGUID: N53tT9ANT+2w5qipy6YMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="245303875"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 07:23:06 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2VK3-000000000XF-2oFV;
	Tue, 17 Mar 2026 14:23:03 +0000
Date: Tue, 17 Mar 2026 22:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 mm/page_alloc_debugfs.c:23:7: warning: GCC does not allow variable
 declarations in for loop initializers before C99
Message-ID: <202603172222.5HLydAd2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   339bea17e1ccb695cddcbc39f88955c85e45d97a
commit: 51fec4ca6219da87e39a3c1b94e9c05741c46b5a [30/30] ANDROID: mm: Create dirs for the page orders in the debugfs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603172222.5HLydAd2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f46a5153850c1303d687233d4adf699b01041da8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172222.5HLydAd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172222.5HLydAd2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/page_alloc_debugfs.c:23:7: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
      23 |         for (int order = 0; order < NR_PAGE_ORDERS; order++) {
         |              ^
   mm/page_alloc_debugfs.c:23:30: error: use of undeclared identifier 'NR_PAGE_ORDERS'
      23 |         for (int order = 0; order < NR_PAGE_ORDERS; order++) {
         |                                     ^~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +23 mm/page_alloc_debugfs.c

    16	
    17	
    18	static inline void create_page_orders_subdirs(struct zone *zone, struct dentry *zonedir)
    19	{
    20		struct dentry *orderdir;
    21		char dirname[12];
    22	
  > 23		for (int order = 0; order < NR_PAGE_ORDERS; order++) {
    24			snprintf(dirname, sizeof(dirname), "order-%d", order);
    25			orderdir = debugfs_create_dir(dirname, zonedir);
    26		}
    27	}
    28	static inline void create_zones_subdirs(struct pglist_data *pgdata, struct dentry *nodedir)
    29	{
    30		struct dentry *zonedir;
    31		struct zone *zone;
    32		struct zone *node_zones = pgdata->node_zones;
    33		unsigned long flags;
    34		char dirname[24];
    35	
    36		for (zone = node_zones; zone - node_zones < MAX_NR_ZONES; ++zone) {
    37			if (!populated_zone(zone))
    38				continue;
    39	
    40			snprintf(dirname, sizeof(dirname), "zone-%s", zone->name);
    41			spin_lock_irqsave(&zone->lock, flags);
    42			zonedir = debugfs_create_dir(dirname, nodedir);
    43			create_page_orders_subdirs(zone, zonedir);
    44			spin_unlock_irqrestore(&zone->lock, flags);
    45		}
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
