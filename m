Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A5C166F3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733978501; cv=none; b=uUVnIp0lIvw9gbYm68idNexmho3BdRPLfpRccQQqA0FMCjMvOVur1gFZQVFBE3kbSYsU+per+9TrGgSoBAC9DOpnKUMjvPuC2BV//rhEkGElSmeulLQkG6gi663b6DaDLKjrhS4nYK2yX7cgJgVPnumsVrMyF4e1jNh2fjCMLRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733978501; c=relaxed/simple;
	bh=I8cffd8/xZpnLkDXlAlRBEqYbq1k1pf5FX5az0SIeL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swokWEEd77N55TvqPbcUHmQbGfSvwtFDZcl4qkLNsMLP+h/hmx0qHx2gPaKpOG54Y3ymwiVXNrgxQ0mMZ06Y/MMlg1RcjRw5Vc1J4OrnqGDSrFl4S4wDCurL+aIzZzqT3RUqGvxqBGPZIzkq4mQnGZ4MHOsfgipbtKO+EoUh3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWCKUrXe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWCKUrXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733978500; x=1765514500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8cffd8/xZpnLkDXlAlRBEqYbq1k1pf5FX5az0SIeL8=;
  b=HWCKUrXeyR5LochqAgFERjYQXuMKl2yAkI1okPo1HAggSPkp4An7IMzp
   4knn2M2lCfoHWlVYtDOT0hvaubkfgJ+4zyMQVghYBsHJBLJR41H5nJNIV
   JSD3K4VTq1neu+WBsmHeOX4xGHUy+lagM3azikciRjondC2caIqJzshyB
   1ZBVkFS6LBQHdSS8KNVmMLtRVhVmbMUVxXg07VlKWsZ0RaQJIVisgQex9
   /8x6LfQ/ejT5zFYfHTxqgomBSaHa+E0xZHFK8sJOWH7dZkio145xisvpc
   txAIJOLNJcCQlntFIbLm8MNc/uGYelFIARVHelzHoDXG/00kDFIzgum+q
   A==;
X-CSE-ConnectionGUID: vaEIrIshRPa+J77nzDNxNw==
X-CSE-MsgGUID: hRoNuo+zQnKrlPz9KDPV1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45392288"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45392288"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:41:40 -0800
X-CSE-ConnectionGUID: MZ3s7BqWSyKNOJU0no+oVA==
X-CSE-MsgGUID: pXOCY6yVSP2Lcvtue5gSBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="95855640"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2024 20:41:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLb14-0007RL-3B;
	Thu, 12 Dec 2024 04:41:34 +0000
Date: Thu, 12 Dec 2024 12:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Subject: [djiang:cxl/features 14/15] drivers/cxl/core/features.c:115:8:
 error: conflicting types for 'cxl_get_feature'; have 'size_t(struct
 cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *,
 size_t)' {aka 'unsigned int(struct cxl_features *, const uuid_t,  enum
 cxl_get_feat...
Message-ID: <202412121244.V4WrE7UJ-lkp@intel.com>
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
config: csky-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121244.V4WrE7UJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121244.V4WrE7UJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121244.V4WrE7UJ-lkp@intel.com/

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
>> drivers/cxl/core/features.c:115:8: error: conflicting types for 'cxl_get_feature'; have 'size_t(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'unsigned int(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, unsigned int)'}
     115 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~
   include/cxl/features.h:83:8: note: previous declaration of 'cxl_get_feature' with type 'size_t(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'unsigned int(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, unsigned int)'}
      83 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~
   drivers/cxl/core/features.c: In function 'cxl_get_feature':
>> drivers/cxl/core/features.c:139:19: error: incompatible types when assigning to type 'int' from type 'uuid_t'
     139 |         pi.uuid = feat_uuid;
         |                   ^~~~~~~~~
   drivers/cxl/core/features.c: At top level:
   drivers/cxl/core/features.c:163:22: error: conflicting types for 'cxl_get_feature'; have 'size_t(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'unsigned int(struct cxl_features *, const uuid_t,  enum cxl_get_feat_selection,  void *, unsigned int)'}
     163 | EXPORT_SYMBOL_NS_GPL(cxl_get_feature, CXL);
         |                      ^~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   drivers/cxl/core/features.c:163:1: note: in expansion of macro 'EXPORT_SYMBOL_NS_GPL'
     163 | EXPORT_SYMBOL_NS_GPL(cxl_get_feature, CXL);
         | ^~~~~~~~~~~~~~~~~~~~
   include/cxl/features.h:83:8: note: previous declaration of 'cxl_get_feature' with type 'size_t(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, size_t)' {aka 'unsigned int(struct cxl_features *, const int,  enum cxl_get_feat_selection,  void *, unsigned int)'}
      83 | size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
         |        ^~~~~~~~~~~~~~~


vim +115 drivers/cxl/core/features.c

    74	
    75	struct cxl_feat_entry *
    76	cxl_get_supported_feature_entry(struct cxl_features *features,
    77					const uuid_t *feat_uuid)
    78	{
    79		struct cxl_feat_entry *feat_entry;
    80		struct cxl_features_state *cfs;
    81		int count;
    82	
    83		cfs = dev_get_drvdata(&features->dev);
    84		if (!cfs)
    85			return ERR_PTR(-EOPNOTSUPP);
    86	
    87		if (!cfs->num_features)
    88			return ERR_PTR(-ENOENT);
    89	
    90		/* Check CXL dev supports the feature */
    91		feat_entry = cfs->entries;
    92		for (count = 0; count < cfs->num_features;
    93		     count++, feat_entry++) {
    94			if (uuid_equal(&feat_entry->uuid, feat_uuid))
    95				return feat_entry;
    96		}
    97	
    98		return ERR_PTR(-ENOENT);
    99	}
 > 100	EXPORT_SYMBOL_NS_GPL(cxl_get_supported_feature_entry, CXL);
   101	
   102	bool cxl_feature_enabled(struct cxl_features_state *cfs, u16 opcode)
   103	{
   104		struct cxl_mailbox *cxl_mbox = cfs->features->cxl_mbox;
   105		struct cxl_mem_command *cmd;
   106	
   107		cmd = cxl_find_feature_command(opcode);
   108		if (!cmd)
   109			return false;
   110	
   111		return test_bit(cmd->info.id, cxl_mbox->feature_cmds);
   112	}
   113	EXPORT_SYMBOL_NS_GPL(cxl_feature_enabled, CXL);
   114	
 > 115	size_t cxl_get_feature(struct cxl_features *features, const uuid_t feat_uuid,
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
 > 139		pi.uuid = feat_uuid;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
