Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306A30E827
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768647957; cv=none; b=tbAZ3csAhXr+3akhRq3DL/ocktpXC+cxgTiyqZFhxz+ELYPZ4GE//PFL8SFmq1tlhIgVZH5ij1tBncSQnvaKNvzH/e9QGbnYtNMTig2JZMlSsnc5UzE/6iG5EeOJLCPCRXUbQr2nOyNS/kTTWVPiMGqnqc4qL4qd1fhEkfC4i2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768647957; c=relaxed/simple;
	bh=0RU8JI2xkxWBQGAF9o6p0/P+z2YnKPFAXi4l2SobrBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dAYhHyQ1KNWAsopVcIhKnY1G/O2H4Nk2150ZjjY9TmLDb049teyVSGEEHiVmC8udSBTt7mH+ObJptuU5wDnW8psx7WxbdNjEThFQVbwbF9kLlRoP99RqJHFV3nOUkS7HWUTe8NGj2KloqMHPzySOdMEmRzo5iLZhfFJ6vMSlLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibkVhUfz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibkVhUfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768647956; x=1800183956;
  h=date:from:to:cc:subject:message-id;
  bh=0RU8JI2xkxWBQGAF9o6p0/P+z2YnKPFAXi4l2SobrBc=;
  b=ibkVhUfz/uCL4JoI1cuK8lsrjzG/LU2pqo2KPV+o2Bmh2GqSDoC3b1zn
   BZLWE8RP7IvdI+bSG4TILuc2A2IbF9dX5Hcvti6yoAGR9kbrMkMWnMfD1
   SEtl1GNSsYcUDg7XRp6lnQAgBViBbAJ3mfJbnZ11yTDYcfRVeGsxl0BAM
   j1VdwYHMxONv4U0pZ/nLCDA/UL6vUESpB2cittmyZXkQ8W7Tbn8Dk2L4n
   00kT5S/uiV4HJuHURCw2q/8GFT68H8IhMwc0tMSN9v0b6DIps/Ae/Cpkt
   G5xx6NuyyW7jsh68hiYicFJ/z1OQc32tQkwz0uK2pOV/riullbuOUY2qA
   g==;
X-CSE-ConnectionGUID: TPTT0yaKQF22ERe79+hQDw==
X-CSE-MsgGUID: 1ytJ2bsgSjWwgBkRwpkgng==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69839389"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69839389"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:05:55 -0800
X-CSE-ConnectionGUID: oOpk9DOvRpG1um7j3LQhFw==
X-CSE-MsgGUID: EPUmSuI1QvWJhkohRWMIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205485082"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2026 03:05:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh47q-00000000Lmn-0euV;
	Sat, 17 Jan 2026 11:05:50 +0000
Date: Sat, 17 Jan 2026 19:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [linux-next:master 5475/6849] mm/slub.c:2072:50: error:
 incompatible type for argument 1 of 'is_codetag_empty'
Message-ID: <202601171858.JxGte9qW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Harry,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 7466382b7211d95b390b284d3e6d43f97e02b6d2 [5475/6849] mm/slab: abstract slabobj_ext access via new slab_obj_ext() helper
config: m68k-randconfig-r052-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171858.JxGte9qW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171858.JxGte9qW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171858.JxGte9qW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/slub.c:13:
   mm/slub.c: In function 'mark_objexts_empty':
>> mm/slub.c:2072:50: error: incompatible type for argument 1 of 'is_codetag_empty'
    2072 |                 if (unlikely(is_codetag_empty(ext->ref)))
         |                                               ~~~^~~~~
         |                                                  |
         |                                                  union codetag_ref
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   In file included from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/alloc_tag.h:52:56: note: expected 'union codetag_ref *' but argument is of type 'union codetag_ref'
      52 | static inline bool is_codetag_empty(union codetag_ref *ref)
         |                                     ~~~~~~~~~~~~~~~~~~~^~~


vim +/is_codetag_empty +2072 mm/slub.c

  2058	
  2059	static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)
  2060	{
  2061		unsigned long slab_exts;
  2062		struct slab *obj_exts_slab;
  2063	
  2064		obj_exts_slab = virt_to_slab(obj_exts);
  2065		slab_exts = slab_obj_exts(obj_exts_slab);
  2066		if (slab_exts) {
  2067			unsigned int offs = obj_to_index(obj_exts_slab->slab_cache,
  2068							 obj_exts_slab, obj_exts);
  2069			struct slabobj_ext *ext = slab_obj_ext(obj_exts_slab,
  2070							       slab_exts, offs);
  2071	
> 2072			if (unlikely(is_codetag_empty(ext->ref)))
  2073				return;
  2074	
  2075			/* codetag should be NULL here */
  2076			WARN_ON(ext->ref.ct);
  2077			set_codetag_empty(&ext->ref);
  2078		}
  2079	}
  2080	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
