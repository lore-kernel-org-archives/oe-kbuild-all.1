Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CF520315
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714214314; cv=none; b=lkCGKQJW/0oHlSbqgc5JOmzE1gAiPPOZsDeM1tDNuDNTFPbXNg/aYaz/Dj+MJo9133wj81RXTuPq8RewHgHXjatlc53tsa9Tr9/OL2erkcjG1LJxk8l9IX/LS057TKu1Hw3OaqCLNQuGChjF/sHYOLeMHmlaEObjjfryPbuKYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714214314; c=relaxed/simple;
	bh=tjyfXdjAKjZpRCCQouspXVnBIUzvycGz0x4/LdErqoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jLexq4ma0wHfzNJ/hSLI7pR2l8WXkKLK4tYBBDn+o83M6fvikgisvkjPblFSGE/ecJvNnrEnJygW6GZb9OnwR2DuUlPKPEgRYNi5B5I0dzPxt8/hwO1GO4WEcpFPqSD7nYxtLz08FcO3EPVH/G6j8UPfYjAOuT8zvOJrpdKM+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoGffbsN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoGffbsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714214312; x=1745750312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjyfXdjAKjZpRCCQouspXVnBIUzvycGz0x4/LdErqoc=;
  b=YoGffbsN6qaxV8qEKYV3pyFOvMrW/ke90k6k67C0lWiDusAj09PldPm9
   kkWOMNqaWXB8th/KFbsuQlqM4EFtFQ4CLcMa8pr3Fn/rdPZL8+2i+zlsY
   djZpW1ipYKUJZXz3mfn1YVtVeTFI0/jk6gs6PaMMnkBYdLbn+mY3xO5vj
   mgDvHsgtEzbQ+4zVOeukwHaOO2BWrTtJfebjHwAnO46WpSOSEDm0uNKxx
   Dv6v1AfoPxDI2PgVBbvapEIa2wdz9qh19Gu1ZXHmmWEco1pmmzBt4GLTR
   VbkaxW1WMX0ZY5btSRVm/ewtYmOuHVSUUYDTHGjNduxdJeiUsE0HT/V02
   g==;
X-CSE-ConnectionGUID: 0NHsNtBeSNC24ByTPKBIkg==
X-CSE-MsgGUID: 09muykRmR6OyqgpVxRCnNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21091005"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="21091005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 03:38:32 -0700
X-CSE-ConnectionGUID: PhMGJkF2QqC/9lnXAGipVw==
X-CSE-MsgGUID: FDflJBWBT3mYTn2qQrDv1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="25649150"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Apr 2024 03:38:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0fRs-0004ta-0G;
	Sat, 27 Apr 2024 10:38:28 +0000
Date: Sat, 27 Apr 2024 18:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:thunderbolt_associate_v1 1/4] drivers/thunderbolt/tb.h:46:42:
 error: 'MAX_GROUPS' undeclared here (not in a function)
Message-ID: <202404271807.Xk8RbUr3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lukas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux thunderbolt_associate_v1
head:   d02e8bddd00b2f29505e20a45417c494103dfc1d
commit: 51701e88f5c194db1854478cb2e388958fd6c32f [1/4] thunderbolt: Move struct tb_cm to tb.h
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240427/202404271807.Xk8RbUr3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271807.Xk8RbUr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271807.Xk8RbUr3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/thunderbolt/nhi.c:26:
>> drivers/thunderbolt/tb.h:46:42: error: 'MAX_GROUPS' undeclared here (not in a function)
      46 |         struct tb_bandwidth_group groups[MAX_GROUPS];
         |                                          ^~~~~~~~~~
--
   In file included from drivers/thunderbolt/tb.c:15:
>> drivers/thunderbolt/tb.h:46:42: error: 'MAX_GROUPS' undeclared here (not in a function)
      46 |         struct tb_bandwidth_group groups[MAX_GROUPS];
         |                                          ^~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/thunderbolt/tb.c:9:
   drivers/thunderbolt/tb.c: In function 'tb_recalc_estimated_bandwidth':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:237:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     237 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/thunderbolt/tb.c:1427:25: note: in expansion of macro 'ARRAY_SIZE'
    1427 |         for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
         |                         ^~~~~~~~~~
   drivers/thunderbolt/tb.c: In function 'tb_init_bandwidth_groups':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:237:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     237 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/thunderbolt/tb.c:1489:25: note: in expansion of macro 'ARRAY_SIZE'
    1489 |         for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
         |                         ^~~~~~~~~~
   drivers/thunderbolt/tb.c: In function 'tb_find_free_bandwidth_group':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:237:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     237 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/thunderbolt/tb.c:1516:25: note: in expansion of macro 'ARRAY_SIZE'
    1516 |         for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
         |                         ^~~~~~~~~~
   drivers/thunderbolt/tb.c: In function 'tb_discover_bandwidth_group':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:237:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     237 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/thunderbolt/tb.c:1570:33: note: in expansion of macro 'ARRAY_SIZE'
    1570 |                 for (i = 0; i < ARRAY_SIZE(tcm->groups); i++) {
         |                                 ^~~~~~~~~~
   drivers/thunderbolt/tb.c: In function 'tb_deinit':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:237:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     237 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/thunderbolt/tb.c:2754:25: note: in expansion of macro 'ARRAY_SIZE'
    2754 |         for (i = 0; i < ARRAY_SIZE(tcm->groups); i++)
         |                         ^~~~~~~~~~


vim +/MAX_GROUPS +46 drivers/thunderbolt/tb.h

    28	
    29	/**
    30	 * struct tb_cm - Simple Thunderbolt connection manager
    31	 * @tunnel_list: List of active tunnels
    32	 * @dp_resources: List of available DP resources for DP tunneling
    33	 * @hotplug_active: tb_handle_hotplug will stop progressing plug
    34	 *		    events and exit if this is not set (it needs to
    35	 *		    acquire the lock one more time). Used to drain wq
    36	 *		    after cfg has been paused.
    37	 * @remove_work: Work used to remove any unplugged routers after
    38	 *		 runtime resume
    39	 * @groups: Bandwidth groups used in this domain.
    40	 */
    41	struct tb_cm {
    42		struct list_head tunnel_list;
    43		struct list_head dp_resources;
    44		bool hotplug_active;
    45		struct delayed_work remove_work;
  > 46		struct tb_bandwidth_group groups[MAX_GROUPS];
    47	};
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
