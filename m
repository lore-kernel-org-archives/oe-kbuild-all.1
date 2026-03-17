Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171E26E6F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 23:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791217; cv=none; b=kr2F4O79rdEPQ3JuEJV7Me8uflaPj3NsnbRO3oD9qMdJspRfFrJSKNX8NpqMD07Wnub+1oGa5aFG6EWxFotoNriIh6AioWpEfjGMbBERfviIt9X6B918NMdr0rrbdVfK6X30Y60RHpZ1JLiaDm5DPHaJRZ/ApvTBeP6/z5Z/QJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791217; c=relaxed/simple;
	bh=BY4MkAffVWJ3XoFoXzPpaQGJmTNfDv5boK0cSUck/TM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uQI+R+keB3XTZ9iiJxgffWyWvx1p3sJtQGE2BwUukGMjLKJ4JMxBJul3zvwjeULqHoCge5hbtAOpzLtNUrcCeIEh18QAAgsdhezzutkqS92W74+/P94ME9gSJrg5OOIvBotKjtNDZv4+9dFarQRruQjDOiK7eY8+UaKM7asVrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO0x0Qr2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO0x0Qr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773791215; x=1805327215;
  h=date:from:to:cc:subject:message-id;
  bh=BY4MkAffVWJ3XoFoXzPpaQGJmTNfDv5boK0cSUck/TM=;
  b=EO0x0Qr21p84x/PUk+pafROvkOhSCtuCrdjYoPe/Q73YVgQ0iFLOhbBj
   +g+LMnAMVZmOgmT6kTZGsZ5Gwddr2wTdI2S5TKeKXMIY6bq+corc88AO6
   5cLBGvg6PfZ9Jxy4h38r2e/618fjOMXz1vPbR5f5AWruUII6vt+R9CgWF
   S68nL01g/bGrxTBEeRqtc/FmFlklobEvRLd5qO2AWLHndTeAOrWMykcnG
   Jmh47ELXr2MkDVVwoY5dR276zxwcltyyIA1AL1VGLVdclZxZM1ce6Te2N
   ek0hAIE18hPFBOzdm/ek53uQOzS0nTiu60iVOq0nEl183A2ygdLRivAEb
   g==;
X-CSE-ConnectionGUID: WwTO5a8fSSGEXXCA+QsrgQ==
X-CSE-MsgGUID: 3X5aFC8dTOix/blnk/s8qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92409662"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92409662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 16:46:54 -0700
X-CSE-ConnectionGUID: Pq5mWDxRSVe6un7vK4gDbQ==
X-CSE-MsgGUID: 6bvNFUSsTuSUnspK9uFeDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="247011462"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 16:46:53 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2e7f-000000002BN-0SEs;
	Tue, 17 Mar 2026 23:46:51 +0000
Date: Wed, 18 Mar 2026 07:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 30/30]
 mm/page_alloc_debugfs.c:23:30: error: use of undeclared identifier
 'NR_PAGE_ORDERS'
Message-ID: <202603180735.2uC3Bh2H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   56450c9b33422201c8d3b751d691f356c16ea142
commit: 51fec4ca6219da87e39a3c1b94e9c05741c46b5a [30/30] ANDROID: mm: Create dirs for the page orders in the debugfs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603180735.2uC3Bh2H-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f46a5153850c1303d687233d4adf699b01041da8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180735.2uC3Bh2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180735.2uC3Bh2H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   mm/page_alloc_debugfs.c:23:7: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
      23 |         for (int order = 0; order < NR_PAGE_ORDERS; order++) {
         |              ^
>> mm/page_alloc_debugfs.c:23:30: error: use of undeclared identifier 'NR_PAGE_ORDERS'
      23 |         for (int order = 0; order < NR_PAGE_ORDERS; order++) {
         |                                     ^~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +/NR_PAGE_ORDERS +23 mm/page_alloc_debugfs.c

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
