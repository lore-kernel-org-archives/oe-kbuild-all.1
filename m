Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397295684
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733983660; cv=none; b=QU+oW65rOrvtlCqRbhjm46cLo8eDT7gWpirTAqlL/cs2juQyHCWBICVdP/qXdrZbopWpi3KAF0fa4ahLb7NFW6VFFCQ8mqlH8ZI0KNfbAigUd0VBn7fPYfLJh5J+r8ywznMnJl57BLlRYR2LOcYgRQoQa3mOra17/jhy1b22hcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733983660; c=relaxed/simple;
	bh=sJwKlvIRYSNSDy2WdcjvElrGR1Ca//GsWy54HwSQiDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tHG7jyHl3aPyYJgdW9nTpBgtXb2r+GWugp8rYc+3C4xVU7Vaw/COVBz9GwZmejR0hnzvVy2rpw4xBNqgyfKJF8dc7Bw6nSCW/mYkBaaeAe4HEiG1rVsDkqsAr1VDFTU6R/l4vEJiHK7cBJeIpcK34ucW0WP/G5Sj4G+3VLe8QbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ6F2Mpw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ6F2Mpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733983658; x=1765519658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJwKlvIRYSNSDy2WdcjvElrGR1Ca//GsWy54HwSQiDQ=;
  b=jZ6F2MpwAM+KwNPxlha2eHI7ehBhiNVbHqEHXpyfjkbb59cu63nl43Ju
   l0v96Onny2jNyyab/SzKoeXmHII+d/eJnFwmVPKKdcdOfT8d+GVmGGwx1
   ybhwv+XtQMzpuFqu+W/am7UiKz6K4d8Fyg7ZGeS86oLdMODNvxJpoOLoD
   qnxQIN3EnUaqaPaC6bzvgA3LUf9l6+BdfCWYJojVTAMqyjp5dP58b6ApH
   qBxyLzjdRp9MhFdlgnpZ61UrHM9iv5JKjx1yDXbUCDJi8xdCoNgq/J65P
   +BA6ZFahS+/bzP5aqK8jm7A0DydNa7HxzdpZ3SCQvEtN01W77I9bCDYNH
   w==;
X-CSE-ConnectionGUID: IgQ6DzBjSxCf5/crTmit/g==
X-CSE-MsgGUID: CVHFhokxTbeIbqjdxN1Wwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="37227731"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="37227731"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 22:07:38 -0800
X-CSE-ConnectionGUID: utnZY/1ASFqMkKmYjaa2Ng==
X-CSE-MsgGUID: XioM+QHTSpiBSSkphtslHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="96647221"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2024 22:07:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLcMI-0007UP-0Y;
	Thu, 12 Dec 2024 06:07:34 +0000
Date: Thu, 12 Dec 2024 14:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Subject: [djiang:cxl/features 15/15] drivers/cxl/core/features.c:171:5:
 error: conflicting types for 'cxl_set_feature'; have 'int(struct
 cxl_features *, const uuid_t,  u8,  void *, size_t,  u8)' {aka 'int(struct
 cxl_features *, const uuid_t,  unsigned char,  void *, long unsigned int,
  unsig...
Message-ID: <202412121309.ItaRyiIW-lkp@intel.com>
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
commit: a67a7f4d25f148893d8c845b36ce97ec806f461f [15/15] cxl/mbox: Add SET_FEATURE mailbox command
config: powerpc64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121309.ItaRyiIW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121309.ItaRyiIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121309.ItaRyiIW-lkp@intel.com/

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
   include/cxl/features.h:98:9: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
      98 |         uuid_t uuid;
         |         ^~~~~~
         |         kuid_t
   include/cxl/features.h:111:39: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
     111 |                                 const uuid_t *feat_uuid);
         |                                       ^~~~~~
         |                                       kuid_t
   include/cxl/features.h:112:61: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
     112 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |                                                             ^~~~~~
         |                                                             kuid_t
   include/cxl/features.h:115:58: error: unknown type name 'uuid_t'; did you mean 'kuid_t'?
     115 | int cxl_set_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |                                                          ^~~~~~
         |                                                          kuid_t
   drivers/cxl/core/features.c:76:1: error: conflicting types for 'cxl_get_supported_feature_entry'; have 'struct cxl_feat_entry *(struct cxl_features *, const uuid_t *)'
      76 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:110:1: note: previous declaration of 'cxl_get_supported_feature_entry' with type 'struct cxl_feat_entry *(struct cxl_features *, const int *)'
     110 | cxl_get_supported_feature_entry(struct cxl_features *features,
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
   include/cxl/features.h:110:1: note: previous declaration of 'cxl_get_supported_feature_entry' with type 'struct cxl_feat_entry *(struct cxl_features *, const int *)'
     110 | cxl_get_supported_feature_entry(struct cxl_features *features,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/features.c:115:8: error: conflicting types for 'cxl_get_feature'; have 'size_t(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'long unsigned int(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, long unsigned int)'}
     115 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~
   include/cxl/features.h:112:8: note: previous declaration of 'cxl_get_feature' with type 'size_t(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'long unsigned int(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, long unsigned int)'}
     112 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
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
   include/cxl/features.h:112:8: note: previous declaration of 'cxl_get_feature' with type 'size_t(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'long unsigned int(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, long unsigned int)'}
     112 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~
>> drivers/cxl/core/features.c:171:5: error: conflicting types for 'cxl_set_feature'; have 'int(struct cxl_features *, const uuid_t,  u8,  void *, size_t,  u8)' {aka 'int(struct cxl_features *, const uuid_t,  unsigned char,  void *, long unsigned int,  unsigned char)'}
     171 | int cxl_set_feature(struct cxl_features *features,
         |     ^~~~~~~~~~~~~~~
   include/cxl/features.h:115:5: note: previous declaration of 'cxl_set_feature' with type 'int(struct cxl_features *, const int,  u8,  void *, size_t,  u8)' {aka 'int(struct cxl_features *, const int,  unsigned char,  void *, long unsigned int,  unsigned char)'}
     115 | int cxl_set_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |     ^~~~~~~~~~~~~~~
   drivers/cxl/core/features.c: In function 'cxl_set_feature':
   drivers/cxl/core/features.c:198:24: error: incompatible types when assigning to type 'int' from type 'uuid_t'
     198 |         pi->hdr.uuid = feat_uuid;
         |                        ^~~~~~~~~
   drivers/cxl/core/features.c: At top level:
   drivers/cxl/core/features.c:246:22: error: conflicting types for 'cxl_set_feature'; have 'int(struct cxl_features *, const uuid_t,  u8,  void *, size_t,  u8)' {aka 'int(struct cxl_features *, const uuid_t,  unsigned char,  void *, long unsigned int,  unsigned char)'}
     246 | EXPORT_SYMBOL_NS_GPL(cxl_set_feature, CXL);
         |                      ^~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   drivers/cxl/core/features.c:246:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     246 | EXPORT_SYMBOL_NS_GPL(cxl_set_feature, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:115:5: note: previous declaration of 'cxl_set_feature' with type 'int(struct cxl_features *, const int,  u8,  void *, size_t,  u8)' {aka 'int(struct cxl_features *, const int,  unsigned char,  void *, long unsigned int,  unsigned char)'}
     115 | int cxl_set_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |     ^~~~~~~~~~~~~~~


vim +171 drivers/cxl/core/features.c

   114	
   115	size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
   116			       enum cxl_get_feat_selection selection,
   117			       void *feat_out, size_t feat_out_size)
   118	{
   119		size_t data_to_rd_size, size_out;
   120		struct cxl_features_state *cfs;
   121		struct cxl_mbox_get_feat_in pi;
   122		struct cxl_mailbox *cxl_mbox;
   123		struct cxl_mbox_cmd mbox_cmd;
   124		size_t data_rcvd_size = 0;
   125		int rc;
   126	
   127		cfs = dev_get_drvdata(&features->dev);
   128		if (!cfs)
   129			return 0;
   130	
   131		if (!cxl_feature_enabled(cfs, CXL_MBOX_OP_GET_FEATURE))
   132			return 0;
   133	
   134		if (!feat_out || !feat_out_size)
   135			return 0;
   136	
   137		cxl_mbox = features->cxl_mbox;
   138		size_out = min(feat_out_size, cxl_mbox->payload_size);
   139		pi.uuid = feat_uuid;
   140		pi.selection = selection;
   141		do {
   142			data_to_rd_size = min(feat_out_size - data_rcvd_size,
   143					      cxl_mbox->payload_size);
   144			pi.offset = cpu_to_le16(data_rcvd_size);
   145			pi.count = cpu_to_le16(data_to_rd_size);
   146	
   147			mbox_cmd = (struct cxl_mbox_cmd) {
   148				.opcode = CXL_MBOX_OP_GET_FEATURE,
   149				.size_in = sizeof(pi),
   150				.payload_in = &pi,
   151				.size_out = size_out,
   152				.payload_out = feat_out + data_rcvd_size,
   153				.min_out = data_to_rd_size,
   154			};
   155			rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
   156			if (rc < 0 || !mbox_cmd.size_out)
   157				return 0;
   158			data_rcvd_size += mbox_cmd.size_out;
   159		} while (data_rcvd_size < feat_out_size);
   160	
   161		return data_rcvd_size;
   162	}
 > 163	EXPORT_SYMBOL_NS_GPL(cxl_get_feature, CXL);
   164	
   165	/*
   166	 * FEAT_DATA_MIN_PAYLOAD_SIZE - min extra number of bytes should be
   167	 * available in the mailbox for storing the actual feature data so that
   168	 * the feature data transfer would work as expected.
   169	 */
   170	#define FEAT_DATA_MIN_PAYLOAD_SIZE 10
 > 171	int cxl_set_feature(struct cxl_features *features,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
