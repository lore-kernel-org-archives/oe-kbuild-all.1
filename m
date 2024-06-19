Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A2481A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 02:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718765682; cv=none; b=aD8cubCa3bMOAaSjybo9SSs4DNPplRKMsE0eh9NdmyQaH4TLlD0iHncHPLh0Rt0G8DiEK/qT2833XFqKfGrGkThdAmT7ki2fg1hzGMf70wrxs7hdBikAtwntO3KEYZT+jMH8SqfYJTUB9+JlZf5tr5V5winB1ugAsVndwuNWly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718765682; c=relaxed/simple;
	bh=K+XIaOHhroxPylqrYWw33PatSgMjv+9a86Wl+8N5u3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uftAcL7urHYPawvfCoItKDHLlAhRXlS9tBxgBCqHGmcOwbXbFsAGgcgz1PsvUv45X+uqYnOZaOrPwYDs1aOzTIlB9H2pLlXHOyJdgGDv8e8aDPNrI1gZvIlOMz7pcXgRGF+UGRWdqTWZYGeOJDybzUiMTRF6PyNJDLNzc9+RGRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1FwYq82; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1FwYq82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718765680; x=1750301680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K+XIaOHhroxPylqrYWw33PatSgMjv+9a86Wl+8N5u3M=;
  b=H1FwYq82vAnJYtxWlzZnmawLzrwMeM8NPRpzca2mjEGOD74UYz3skTq3
   BJ42dzut9/hb/ClDAdBDZLGgHt6gyff+uuSWb9nmcZAD8xX7TGEYRM6XL
   cTnHsTNHz/KiV/mjBhSRIFk07GruyE1GXDyuYISn6zDADNGAEISEa87/F
   RDKu2Fg3stVmOG+2EzmvStrxWwY7CPY0nvpcmY3dnl650e92w7AJC8EX6
   TeCkJvYeW0fcwKFEFY7ZD6JlPB13DXJdmPSt1akX5KMEDUmzil7IKBOca
   g4jhbbGcbz9RdOdgszQx2IYJ4av8wsepcThnii5Qhi84PkPywu9Ex+XhT
   A==;
X-CSE-ConnectionGUID: 7t6TNCqoRWqF1PHND9gh6w==
X-CSE-MsgGUID: Vt9Ej2PEQpuER//r8toXOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26265264"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="26265264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 19:54:39 -0700
X-CSE-ConnectionGUID: T8QbGUuCTia8agUXFAq8og==
X-CSE-MsgGUID: oB/JY7EeSO6XyRJkt2xyrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="79226297"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2024 19:54:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJlT1-0006Cy-38;
	Wed, 19 Jun 2024 02:54:35 +0000
Date: Wed, 19 Jun 2024 10:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:bak-0618 3/3] drivers/iommu/intel/pasid.h:107:3:
 error: use of undeclared identifier 'u128'
Message-ID: <202406191034.J8BYzJBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git bak-0618
head:   5d36234649d8f6673b0f658ed6591f35ba5c626d
commit: 5d36234649d8f6673b0f658ed6591f35ba5c626d [3/3] TMP: Try to make intel_iommu_set_dev_pasid() no rollback to old hw config in error path
config: i386-buildonly-randconfig-004-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191034.J8BYzJBD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191034.J8BYzJBD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191034.J8BYzJBD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/intel/pasid.c:22:
>> drivers/iommu/intel/pasid.h:107:3: error: use of undeclared identifier 'u128'
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                 ^
>> drivers/iommu/intel/pasid.h:107:9: error: use of undeclared identifier 'ptr'; did you mean 'pte'?
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                       ^~~
         |                       pte
   drivers/iommu/intel/pasid.h:101:56: note: 'pte' declared here
     101 | static inline void pasid_set_entry(struct pasid_entry *pte,
         |                                                        ^
>> drivers/iommu/intel/pasid.h:107:22: error: expected expression
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                                    ^
   drivers/iommu/intel/pasid.h:107:16: error: use of undeclared identifier 'u128'
     107 |                 u128 *ptr = (u128 *)&new->val[2*i];
         |                              ^
   drivers/iommu/intel/pasid.h:111:34: error: expected expression
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                ^
   drivers/iommu/intel/pasid.h:111:28: error: use of undeclared identifier 'u128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                          ^
   drivers/iommu/intel/pasid.h:111:34: error: expected expression
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                ^
   drivers/iommu/intel/pasid.h:111:28: error: use of undeclared identifier 'u128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                          ^
   drivers/iommu/intel/pasid.h:111:58: error: expected expression
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                                        ^
   drivers/iommu/intel/pasid.h:111:52: error: use of undeclared identifier 'u128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                                  ^
   drivers/iommu/intel/pasid.h:111:58: error: expected expression
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                                        ^
   drivers/iommu/intel/pasid.h:111:52: error: use of undeclared identifier 'u128'
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                                                                  ^
>> drivers/iommu/intel/pasid.h:111:12: error: expected ';' at end of declaration
     111 |                 WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
         |                          ^
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:325:41: note: expanded from macro 'raw_try_cmpxchg128'
     325 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                                ^
   In file included from drivers/iommu/intel/pasid.c:22:
>> drivers/iommu/intel/pasid.h:111:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:326:2: note: expanded from macro 'raw_try_cmpxchg128'
     326 |         ___r = raw_cmpxchg128((_ptr), ___o, (_new)); \
         |         ^
   In file included from drivers/iommu/intel/pasid.c:22:
>> drivers/iommu/intel/pasid.h:111:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:327:15: note: expanded from macro 'raw_try_cmpxchg128'
     327 |         if (unlikely(___r != ___o)) \
         |                      ^
   In file included from drivers/iommu/intel/pasid.c:22:
>> drivers/iommu/intel/pasid.h:111:12: error: use of undeclared identifier '___o'
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:327:23: note: expanded from macro 'raw_try_cmpxchg128'
     327 |         if (unlikely(___r != ___o)) \
         |                              ^
   In file included from drivers/iommu/intel/pasid.c:22:
>> drivers/iommu/intel/pasid.h:111:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:328:12: note: expanded from macro 'raw_try_cmpxchg128'
     328 |                 *___op = ___r; \
         |                          ^
   In file included from drivers/iommu/intel/pasid.c:22:
>> drivers/iommu/intel/pasid.h:111:12: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:329:9: note: expanded from macro 'raw_try_cmpxchg128'
     329 |         likely(___r == ___o); \
         |                ^
   In file included from drivers/iommu/intel/pasid.c:22:
>> drivers/iommu/intel/pasid.h:111:12: error: use of undeclared identifier '___o'
   include/linux/atomic/atomic-instrumented.h:4956:2: note: expanded from macro 'try_cmpxchg128'
    4956 |         raw_try_cmpxchg128(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:329:17: note: expanded from macro 'raw_try_cmpxchg128'
     329 |         likely(___r == ___o); \
         |                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m


vim +/u128 +107 drivers/iommu/intel/pasid.h

   100	
   101	static inline void pasid_set_entry(struct pasid_entry *pte,
   102					   struct pasid_entry *new)
   103	{
   104		u64 old[2];
   105	
   106		for (int i = 0; i < 4; i++) {
 > 107			u128 *ptr = (u128 *)&new->val[2*i];
   108	
   109			old[0] = READ_ONCE(pte->val[2*i]);
   110			old[1] = READ_ONCE(pte->val[2*i+1]);
 > 111			WARN_ON(!try_cmpxchg128((u128 *)&pte->val[2*i], (u128 *)&old, *ptr));
   112		}
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
