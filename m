Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636BE34BA29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 02:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759025921; cv=none; b=g7nD2RC/EyM5QXmlPzSSIsntEyvdYxbMSQAv4I7nuWXXNmDRwVp7uMIoxslMnRhmE1NiHnK/56sl9H0WJHeUWC/6dGpLYb2bRGlVp95iJHoyCkifrci0unlwYRP4Oro6Ti1/Yucj4S9JlImGDAZq40aC9eLbPXGs63k8AbYeRh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759025921; c=relaxed/simple;
	bh=KMYvAwkQvls6eIJmxBJAIbmvSDyLtL8dzvvyjESJdQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LIR+onEnUh0lKI1lJbBS1y4TXEMvUlu/raSAidNf9lYTvPs8YYKKMhrrDxQM0I+KRB+mCGPQv5Er1OHlS5Ay/n7H0p3BtSMmG1YRp1J/dzmMWZn/ynmhbJ9aFvBM7AVifY6HRbpeUI+9NJNCI9CL6m3eAgNbYCkxk8ijZgagaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIyOtW7h; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIyOtW7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759025920; x=1790561920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KMYvAwkQvls6eIJmxBJAIbmvSDyLtL8dzvvyjESJdQg=;
  b=eIyOtW7hvRy0bT/1JbBg3gEjTUVNnJO4/AG4Ez64vIhuP7fQZWU2qmom
   lONPHayl9HP1NGwIj40U4Ol5w8ZnOQNLONsIyakcrS3clLJC7goBpeIYt
   RLnSc/oWS2krizRux/AndobN0nJkh024lyCymhAjGOVGMeIJ5weVNAMA0
   Q6tKLwmOJjtMBvLXX6R1h5az3X9vVBSc0BoeO8YWCTKLOLwRFx9WdtSNT
   8ldWFz8R36LH+5Svilb6iDDbVOJugY3tgGTqdF+2JzUPx7e1oNhiBedKx
   2YAuqCdgGIObu3kWS2KTTBPr6BEiNtwJsaS1+eIzmkGi3M7NSEgpw2fEy
   A==;
X-CSE-ConnectionGUID: MKTZqOSSRFGBKUPPiwhjKA==
X-CSE-MsgGUID: 7aOIYS64T3G/KVam9jzm+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="64941128"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="64941128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 19:18:39 -0700
X-CSE-ConnectionGUID: vdYqeViTTfKsl+sZdXH+aw==
X-CSE-MsgGUID: b39D2b+NRVSAy6dlmpz5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="181929731"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Sep 2025 19:18:37 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2gzi-0007TP-1n;
	Sun, 28 Sep 2025 02:18:34 +0000
Date: Sun, 28 Sep 2025 10:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [sean-jc:x86/gmem_inplace 23/30] include/linux/maple_tree.h:206:34:
 error: request for member 'dep_map' in something not a structure or union
Message-ID: <202509281012.5C0UKFqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   5140bf8b78f718d7df0eaf7d93420afeeb012afa
commit: b06591e38322d09befa80ffcac60ddf17450778c [23/30] KVM: guest_memfd: Introduce per-gmem attributes, use to guard user mappings
config: arm64-randconfig-002-20250928 (https://download.01.org/0day-ci/archive/20250928/202509281012.5C0UKFqC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281012.5C0UKFqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509281012.5C0UKFqC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:12,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:14,
                    from include/linux/backing-dev.h:13,
                    from arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:3:
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_destroy_inode':
>> include/linux/maple_tree.h:206:34: warning: dereferencing 'void *' pointer
     206 |  (mt)->ma_external_lock = &(lock)->dep_map
         |                                  ^~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:993:3: note: in expansion of macro 'mt_set_external_lock'
     993 |   mt_set_external_lock(&gi->attributes, NULL);
         |   ^~~~~~~~~~~~~~~~~~~~
>> include/linux/maple_tree.h:206:34: error: request for member 'dep_map' in something not a structure or union
     206 |  (mt)->ma_external_lock = &(lock)->dep_map
         |                                  ^~
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:993:3: note: in expansion of macro 'mt_set_external_lock'
     993 |   mt_set_external_lock(&gi->attributes, NULL);
         |   ^~~~~~~~~~~~~~~~~~~~


vim +/dep_map +206 include/linux/maple_tree.h

54a611b605901c Liam R. Howlett 2022-09-06  195  
54a611b605901c Liam R. Howlett 2022-09-06  196  #ifdef CONFIG_LOCKDEP
54a611b605901c Liam R. Howlett 2022-09-06  197  typedef struct lockdep_map *lockdep_map_p;
134d153c9346fc Liam R. Howlett 2023-07-14  198  #define mt_lock_is_held(mt)                                             \
134d153c9346fc Liam R. Howlett 2023-07-14  199  	(!(mt)->ma_external_lock || lock_is_held((mt)->ma_external_lock))
134d153c9346fc Liam R. Howlett 2023-07-14  200  
19a462f06eb5a7 Liam R. Howlett 2023-07-14  201  #define mt_write_lock_is_held(mt)					\
19a462f06eb5a7 Liam R. Howlett 2023-07-14  202  	(!(mt)->ma_external_lock ||					\
19a462f06eb5a7 Liam R. Howlett 2023-07-14  203  	 lock_is_held_type((mt)->ma_external_lock, 0))
19a462f06eb5a7 Liam R. Howlett 2023-07-14  204  
54a611b605901c Liam R. Howlett 2022-09-06  205  #define mt_set_external_lock(mt, lock)					\
54a611b605901c Liam R. Howlett 2022-09-06 @206  	(mt)->ma_external_lock = &(lock)->dep_map
02fdb25fb41c56 Liam R. Howlett 2023-07-05  207  

:::::: The code at line 206 was first introduced by commit
:::::: 54a611b605901c7d5d05b6b8f5d04a6ceb0962aa Maple Tree: add new data structure

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
