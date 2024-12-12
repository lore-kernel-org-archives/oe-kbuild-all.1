Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664DD1632D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 05:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733981195; cv=none; b=Nix3oU5o4Lf9ROKb5hUlFhqtd5xw4pBUGCJRXcrH4N7laiio8RXNjiqEWJ+STL+M3FNyEsiAc8zgTYUghjkuB5RZMiMZgElznAM6HmdtgIwXSxT2b87b+Xk3QVYeld2lKt9ji6a5/0qkWEiQQ0aU9/zOcbUQFuBR1mgNj/uXqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733981195; c=relaxed/simple;
	bh=xqYnZ57N+9jrGo8Di8Yr31xgePU6AvBL9vClpzm1nvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQ+EL5PK4ymOgV3nAzra8TAlbbeN83EjhfHo0E8My0QA5XobVYMDkZJD9Dc3WXlfGoM/aCO7zJvkAwCr1pUK6J+jTfviJRW4haWahs8c8r7FOWi8PhNBbHNBxsUKYYuPHk3iKDy3VnF8Ry9N0vOILV05v8DNQzfgJT2HYqpHHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBmr1IsP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBmr1IsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733981193; x=1765517193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xqYnZ57N+9jrGo8Di8Yr31xgePU6AvBL9vClpzm1nvc=;
  b=RBmr1IsPOrpJMNG+md4WBpS/elLVwsrdsJuF/RkpQDP8NLaEl6Lf1RQd
   8r0XELYlmZicKaxD9nYaVnLBHk/Kbuit5aIbdMeCAWU6lhnbvHlLStw6o
   hLpHabybgQDzlyTeS8jsmhXTgYqxKH48HGssfGQDKq3BePY3MOuc0wWZP
   sSNzSmZQ6iMiIOIbfLCvdlKoniwTvOaPXJgWmdSYRP5j9/DtRE1CGCpz9
   FaJBqEOYFFvG//7FqwuypaXNTGIwgWsbQnRUb1Nr4B2AAhZn8Sz+frpKV
   uoXQkGJG3XBvlFN9gReSaumi/9EkEy1HCkaWg3kXu6EfFqxtJScDdjveK
   A==;
X-CSE-ConnectionGUID: g3FNmDlVQd22nKOzPY3zmw==
X-CSE-MsgGUID: TbTGA75ATumk/HgV56UUXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34304096"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34304096"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 21:26:33 -0800
X-CSE-ConnectionGUID: Mqiuxt1oTvW61s3k1c4NlA==
X-CSE-MsgGUID: QaXjQVRFRBC6BmOU5O+O3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="126934855"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2024 21:26:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLbiX-0007TJ-0z;
	Thu, 12 Dec 2024 05:26:29 +0000
Date: Thu, 12 Dec 2024 13:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Subject: [djiang:cxl/features 14/15] drivers/cxl/core/features.c:115:8:
 error: conflicting types for 'cxl_get_feature'; have 'size_t(struct
 cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *,
 size_t)' {aka 'long unsigned int(struct cxl_features *, const uuid_t,  enum
 cxl_get...
Message-ID: <202412121345.0BxsQsdR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/features
head:   a67a7f4d25f148893d8c845b36ce97ec806f461f
commit: fc4b3b641a6fb11fd7e74bcc0d361abd00d7b1e4 [14/15] cxl/mbox: Add GET_FEATURE mailbox command
config: powerpc64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121345.0BxsQsdR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121345.0BxsQsdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121345.0BxsQsdR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/cxl/mailbox.h:6,
                    from drivers/cxl/core/features.c:4:
   include/cxl/features.h:30:9: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
      30 |         uuid_t uuid;
         |         ^~~~~~
         |         kuid_t
   include/cxl/features.h:70:9: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
      70 |         uuid_t uuid;
         |         ^~~~~~
         |         kuid_t
   include/cxl/features.h:82:39: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
      82 |                                 const uuid_t *feat_uuid);
         |                                       ^~~~~~
         |                                       kuid_t
   include/cxl/features.h:83:61: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
      83 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |                                                             ^~~~~~
         |                                                             kuid_t
   drivers/cxl/core/features.c:76:1: error: conflicting types for 'cxl_get_supported_feature_entry'; have 'struct cxl_feat_entry *(struct cxl_features *, const uuid_t *)'
      76 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:81:1: note: previous declaration of 'cxl_get_supported_feature_entry' with type 'struct cxl_feat_entry *(struct cxl_features *, const int *)'
      81 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/features.c: In function 'cxl_get_supported_feature_entry':
   drivers/cxl/core/features.c:94:32: error: passing argument 1 of 'uuid_equal' from incompatible pointer type [-Wincompatible-pointer-types]
      94 |                 if (uuid_equal(&feat_entry->uuid, feat_uuid))
         |                                ^~~~~~~~~~~~~~~~~
         |                                |
         |                                int *
   In file included from include/linux/libnvdimm.h:12,
                    from drivers/cxl/cxl.h:7,
                    from drivers/cxl/core/features.c:5:
   include/linux/uuid.h:71:45: note: expected 'const uuid_t *' but argument is of type 'int *'
      71 | static inline bool uuid_equal(const uuid_t *u1, const uuid_t *u2)
         |                               ~~~~~~~~~~~~~~^~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:390,
                    from arch/powerpc/include/asm/paca.h:16,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/cxl/core/features.c:3:
   drivers/cxl/core/features.c: At top level:
   drivers/cxl/core/features.c:100:22: error: conflicting types for 'cxl_get_supported_feature_entry'; have 'struct cxl_feat_entry *(struct cxl_features *, const uuid_t *)'
     100 | EXPORT_SYMBOL_NS_GPL(cxl_get_supported_feature_entry, CXL);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   drivers/cxl/core/features.c:100:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     100 | EXPORT_SYMBOL_NS_GPL(cxl_get_supported_feature_entry, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:81:1: note: previous declaration of 'cxl_get_supported_feature_entry' with type 'struct cxl_feat_entry *(struct cxl_features *, const int *)'
      81 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/features.c:115:8: error: conflicting types for 'cxl_get_feature'; have 'size_t(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'long unsigned int(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, long unsigned int)'}
     115 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~
   include/cxl/features.h:83:8: note: previous declaration of 'cxl_get_feature' with type 'size_t(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'long unsigned int(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, long unsigned int)'}
      83 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~
   drivers/cxl/core/features.c: In function 'cxl_get_feature':
   drivers/cxl/core/features.c:139:19: error: incompatible types when assigning to type 'int' from type 'uuid_t'
     139 |         pi.uuid = feat_uuid;
         |                   ^~~~~~~~~
   drivers/cxl/core/features.c: At top level:
   drivers/cxl/core/features.c:163:22: error: conflicting types for 'cxl_get_feature'; have 'size_t(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'long unsigned int(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, long unsigned int)'}
     163 | EXPORT_SYMBOL_NS_GPL(cxl_get_feature, CXL);
         |                      ^~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   drivers/cxl/core/features.c:163:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     163 | EXPORT_SYMBOL_NS_GPL(cxl_get_feature, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:83:8: note: previous declaration of 'cxl_get_feature' with type 'size_t(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'long unsigned int(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, long unsigned int)'}
      83 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~


vim +115 drivers/cxl/core/features.c

   114	
 > 115	size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
