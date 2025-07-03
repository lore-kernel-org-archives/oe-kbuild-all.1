Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C16254B19
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577819; cv=none; b=svE3Rqu+gjAr6CAVsVPz7WeB7tlX//naXgVp5Z+IqG4KDYR5GOT2HDdpWINEtkM4v/ZN8ndrKrWyM+k/u6NUlnbiRZbBOWQQ60lCGSnXmNu3o/1qeOZTgdG5GnTmhvDP+FDfwNSobX/39kuyz+fhqDehxI+fRArd/gfrTKD52Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577819; c=relaxed/simple;
	bh=kb/RMh+byNOiwreOgP2y3JK+AmyPuGh9yAbKH8jK598=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQFZ2uqQC2/sa1HKKBe4lrU/zd4xDjH6msJcX1ezg6B2Rhzx8F4t//iYZayW+Mkdv4qxJZQc2vWjvyLKxqEk0A/GevXgPTt1Es4lGtDw6KewKbaGUjW53ITb1PlUupWG+2ALVPV85FftdGxb6jmXtV3GIo1YygtiEpICihJdc6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qm0v8Eis; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qm0v8Eis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577818; x=1783113818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kb/RMh+byNOiwreOgP2y3JK+AmyPuGh9yAbKH8jK598=;
  b=Qm0v8EisV6LKusFmGvskjLJQo29yWsn2v1LVdv38FQaf2jemRlYoQAih
   t0q4iFlgLOulfZa6s6G6MdEqDm7ijnmV9Cac/S+6+C9f+0qOuDcBv7MBC
   +iDi9pQmioAGd6fjKIWbamo77QXABEWlUEEb8o9G8xrk6Iq/tkUvQS9zY
   15ALoA/FfWY5e6F35Pmime+m9LOk9jD29JVoBKMPkZq2gdgohDOL/INb6
   Nmlk3ERnPsUnZB0VfrBDqp76jspkIV9Ye1bOwWMiz6/uGl3ufO4jZiERp
   AgKj0r4DLup/CGzPCEO/0xHq5G7Jtg4KykYq+1fo+dU6XKqqMQjyR7vlL
   A==;
X-CSE-ConnectionGUID: kNKp9JNeR8GCem/0lSSdzw==
X-CSE-MsgGUID: DrZDbhA2QLK6psmppCsraA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54031242"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="54031242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:23:38 -0700
X-CSE-ConnectionGUID: 1zOfN5lVRpaoYIGEuVvmzw==
X-CSE-MsgGUID: yZemcKSTS0S3lCf1hTF94g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="185498766"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2025 14:23:37 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXRP4-00030N-0Z;
	Thu, 03 Jul 2025 21:23:34 +0000
Date: Fri, 4 Jul 2025 05:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-03 4/4]
 include/trace/hooks/mm.h:30:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202507040554.QbvqBBW8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-03
head:   afb1479039bc3b5e00def98ba795cf8647f28b7f
commit: 97868360eb78e4c699cbf00baed15af55d0266f7 [4/4] ANDROID: vendor_hooks: add rvh for control memory dirty rate
config: i386-randconfig-r112-20250703 (https://download.01.org/0day-ci/archive/20250704/202507040554.QbvqBBW8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040554.QbvqBBW8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040554.QbvqBBW8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page-writeback.c: note: in included file:
>> include/trace/hooks/mm.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +30 include/trace/hooks/mm.h

    12	
    13	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    14				TP_PROTO(gfp_t *flags),
    15				TP_ARGS(flags), 1);
    16	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    17				TP_PROTO(gfp_t *flags),
    18				TP_ARGS(flags), 1);
    19	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    20				TP_PROTO(gfp_t *flags),
    21				TP_ARGS(flags), 1);
    22	
    23	*/
    24	DECLARE_HOOK(android_vh_slab_folio_alloced,
    25		TP_PROTO(unsigned int order, gfp_t flags),
    26		TP_ARGS(order, flags));
    27	DECLARE_HOOK(android_vh_kmalloc_large_alloced,
    28		TP_PROTO(struct page *page, unsigned int order, gfp_t flags),
    29		TP_ARGS(page, order, flags));
  > 30	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
    31		TP_PROTO(void *unused),
    32		TP_ARGS(unused), 1);
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
