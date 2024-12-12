Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732AC13633F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 03:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733975855; cv=none; b=H7Skk7YUzeN3Ccz/9bmqKhwAHXdbvJfIyDrNikHSBL/jod31u4EhVF6suUO1mhvlnyl2fvOWqcoYHDV8vxAsHqBd+DVpsxJfQUukmcz6TeXKlJ70XUMzIIzWDZHLdKdeQR13z0tHWn0bbQ66wKAMmgdhm8tXZKG97Aq2h372Mik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733975855; c=relaxed/simple;
	bh=dz1yy/qdZ9qPRAwTJZjuEOIdem486qZNRiez/B0PyNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEKYsD4B6bHZa64+EBpHUR84kqGi4g+6pKNN0mB1vINa7rgqYgWsa0FyWRZQjqp15M1TlZgf9oZY7vHyaMvSmUw/XRQ7sXZMCo99ezRY/64mmqs56M8wbJHlfMqZZo/KPEMWonpJevxI4dfQzAwBZYQy3+U+XYXLhKTt7VnEO28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMpQU3/1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMpQU3/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733975853; x=1765511853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dz1yy/qdZ9qPRAwTJZjuEOIdem486qZNRiez/B0PyNM=;
  b=ZMpQU3/1PPv4DhXKwi8NfL8p8HiyfZTGnMaJCCWaMTIFbEAoArSMkDKn
   KGazKqaABqDH0eBA47W2CF9YimlOAJKxNC4ufd1pz5/eCPZoEcbHt6XXb
   C31baA66Lnqk3fPmldczT4T6ZhL5VM+vdDQ5iPRpKWZnGwsLuc6vznegG
   gWTxegRhR43UnQLZL57oLQQj5Zlxx/CpjA/ZmkxyTQlymdLt2KxHeq1SF
   3KcEUF3iaPSKnhr5HoQcKythhr8PpSrJMGlbXvnheS0Vvh2beWSP1mK1X
   c4vLKx9r0Y2NRKUuESHNnCVZzNmdVgvnxpEIQ9/w+qh5PGkCCM9zp2wIa
   Q==;
X-CSE-ConnectionGUID: K4+zZ6drTL+BzoXdKksilg==
X-CSE-MsgGUID: 1669iUhIQpK6FQGY22xbdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59775532"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="59775532"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 19:57:33 -0800
X-CSE-ConnectionGUID: ttas8URmQPa49K9yGhT5Iw==
X-CSE-MsgGUID: vjV5R+omQJGoQaec/fWkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96530187"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2024 19:57:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLaKP-0007Pb-0z;
	Thu, 12 Dec 2024 03:57:29 +0000
Date: Thu, 12 Dec 2024 11:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Shiju Jose <shiju.jose@huawei.com>
Subject: [djiang:cxl/features 12/15] include/cxl/features.h:30:9: error:
 unknown type name 'uuid_t'; did you mean 'kuid_t'?
Message-ID: <202412121133.AeyPBHFC-lkp@intel.com>
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
commit: 3486c09dcdea2cb12bb218b4e0218f2de3f7a003 [12/15] cxl: Add Get Supported Features command for kernel usage
config: csky-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121133.AeyPBHFC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121133.AeyPBHFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121133.AeyPBHFC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/cxl/mailbox.h:6,
                    from drivers/cxl/core/features.c:4:
>> include/cxl/features.h:30:9: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
      30 |         uuid_t uuid;
         |         ^~~~~~
         |         kuid_t
   include/cxl/features.h:59:39: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
      59 |                                 const uuid_t *feat_uuid);
         |                                       ^~~~~~
         |                                       kuid_t
>> drivers/cxl/core/features.c:75:1: error: conflicting types for 'cxl_get_supported_feature_entry'; have 'struct cxl_feat_entry *(struct cxl_features *, const uuid_t *)'
      75 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:58:1: note: previous declaration of 'cxl_get_supported_feature_entry' with type 'struct cxl_feat_entry *(struct cxl_features *, const int *)'
      58 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/features.c: In function 'cxl_get_supported_feature_entry':
>> drivers/cxl/core/features.c:93:32: error: passing argument 1 of 'uuid_equal' from incompatible pointer type [-Wincompatible-pointer-types]
      93 |                 if (uuid_equal(&feat_entry->uuid, feat_uuid))
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
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/cxl/core/features.c:3:
   drivers/cxl/core/features.c: At top level:
   drivers/cxl/core/features.c:99:22: error: conflicting types for 'cxl_get_supported_feature_entry'; have 'struct cxl_feat_entry *(struct cxl_features *, const uuid_t *)'
      99 | EXPORT_SYMBOL_NS_GPL(cxl_get_supported_feature_entry, CXL);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   drivers/cxl/core/features.c:99:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
      99 | EXPORT_SYMBOL_NS_GPL(cxl_get_supported_feature_entry, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:58:1: note: previous declaration of 'cxl_get_supported_feature_entry' with type 'struct cxl_feat_entry *(struct cxl_features *, const int *)'
      58 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +30 include/cxl/features.h

    28	
    29	struct cxl_feat_entry {
  > 30		uuid_t uuid;
    31		__le16 id;
    32		__le16 get_feat_size;
    33		__le16 set_feat_size;
    34		__le32 flags;
    35		u8 get_feat_ver;
    36		u8 set_feat_ver;
    37		__le16 effects;
    38		u8 reserved[18];
    39	} __packed;
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
