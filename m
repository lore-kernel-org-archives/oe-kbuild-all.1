Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ADC302767
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768647955; cv=none; b=Mq9k2vjJNIZWSNgl0MfRleAYNxcQqOvmOFCI92vS16pygrgHBUYEWkeuyBQ+YlrqvIBop+giaDorh+yVulV/YspcfDw2KFVwKot7oA83VXU0P7CnnPgWdf2tdulZ4MRLQK1cjPton0IWolCiWI657ogZGJOQ5RqGeI44TWhtzkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768647955; c=relaxed/simple;
	bh=8UmAZCcv4j+2QSna87Az08H5zCEs3xpyCd38eHAODAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r0il0jh4ooVm2zDgeEiktbQ15QytOjKgiIdN9y83J6YyxZPeU3/BOHcrWLUOYjike6TbgbgvEH/EHsk/aVmuuCP6VyWXvfzOLdkQwtUd07sUHeEbazg+I+5y1ekS6S2MLvm16DzFKgNFTcIFpa2aiOcE7+EuY52xAs18rpYF53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8vaRbOl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8vaRbOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768647954; x=1800183954;
  h=date:from:to:cc:subject:message-id;
  bh=8UmAZCcv4j+2QSna87Az08H5zCEs3xpyCd38eHAODAI=;
  b=O8vaRbOlfjtb6IjJBGdwa1LgQdeiyRDzVr5o35G296Il3CkJsxA72oY0
   Kkb+w+N/FkSkYupVyvt0r1qp6Y7Cv5ZuUjrkqAbbSwuuiNb13PQsq1ABI
   Yml7NmsbvSx/HniXlB388L6DGi8H+4JSjprBuIQEJ0rRvQRI3DZ9Kocw5
   MYzeoCmT+jR5P0V4gC6q1Ecz5/3YbL7vbtg3EYs2/jf/sQ3/B6a6EEamJ
   JHkgwsE59SPp9tuqSwiwvOu/d8loYwSq66S2Q/eckJ1BJLRTyP+AQKZaM
   UoSmMO4ApoBpKeGfL72T/gPIhaX1larmnZiHwFUiPriGVV/QOF3j0rbbN
   g==;
X-CSE-ConnectionGUID: CINMjdBiQQ2fcaA4g8tzIQ==
X-CSE-MsgGUID: PgIRvtfNRG2BckhQD+LmTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69839386"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69839386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:05:54 -0800
X-CSE-ConnectionGUID: ZCDxF1PPRTStBO/stz5iCQ==
X-CSE-MsgGUID: 11a00haFQciqS/X1A9Bgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205485080"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2026 03:05:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh47q-00000000Lmk-0XMD;
	Sat, 17 Jan 2026 11:05:50 +0000
Date: Sat, 17 Jan 2026 19:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [linux-next:master 5475/6849] mm/slub.c:2072:33: error:
 passing 'union codetag_ref' to parameter of incompatible type 'union
 codetag_ref *'; take the address with &
Message-ID: <202601171911.3rDveHbm-lkp@intel.com>
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
config: mips-randconfig-r062-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171911.3rDveHbm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171911.3rDveHbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171911.3rDveHbm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:2072:33: error: passing 'union codetag_ref' to parameter of incompatible type 'union codetag_ref *'; take the address with &
    2072 |                 if (unlikely(is_codetag_empty(ext->ref)))
         |                                               ^~~~~~~~
         |                                               &
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/alloc_tag.h:52:56: note: passing argument to parameter 'ref' here
      52 | static inline bool is_codetag_empty(union codetag_ref *ref)
         |                                                        ^
   1 error generated.


vim +2072 mm/slub.c

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
