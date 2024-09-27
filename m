Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E8E189BBF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440770; cv=none; b=RMGySoa4A9PcgKShUXN/XxaCgz5lnQ2BrWiUjiiX2BEv0T3Gf70iSIKcwxEtjIwzBNR53PqAelWBjjlIK7mGks3wV+GcaGCOB7j+yeDsaH+D4MfO3ZbpDPppoKz4DaDz6kuG2wFVMteGv+czMXLfM+4gb2dT0+l+ZblrjyB7ALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440770; c=relaxed/simple;
	bh=ZSNpC3a/mCl42gyQVJK1WbSn+MTSGcF2kHO4CL/f90o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPQWsf7VAP/3sIH2QwQvdTqC8X6uNZZBcHrTKItKClrAk35Wkq1Q1lIYCQzxyOrhIhMkHmXHOEVWW/gvvhAXCUgQu5YqtvXcIAniT4tpV7H8SgPxHTO5rszpwJOxG35rKTJeNbogeYA0YMGrV8kRoIdfT2FaeOLALMCrvqgN9nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiHdV0n8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiHdV0n8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727440769; x=1758976769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSNpC3a/mCl42gyQVJK1WbSn+MTSGcF2kHO4CL/f90o=;
  b=aiHdV0n8V3OvFxewlmrpC6eMLfybv3TOHTyiqpDiQruQIXjLaDyhUEqu
   SMHnv2YEAB8Ivvk6dXqYb6+AEXBIhr2xTWsKL88DwYRmaUaDGaaStSkt2
   jfrBuCiBJ/EqWiXkvD48fZ3X6Kp7TK5reiJLKpXnE3Begw2fZNd/kvUy3
   wRarCMHCrH2xrDX5Z8CCvmxv0vC6caf32yJcZlzZsp2Xb64cwedYIR4JJ
   g4W7qzw+kK0mxN96JtOWPP7azKOvftoKG76ORhXuTbsjSCTpOp7PtgEIA
   soZGF3lAOWds5GcQZ5IDimx62IWp1M/gOPn/l9ERpwvRSRpYEcfqHYAhl
   w==;
X-CSE-ConnectionGUID: BRRClcB5T0+LRRHAXnVB2A==
X-CSE-MsgGUID: Ghknf6KWSKu7rYL0Hmdxhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26092230"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26092230"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:39:21 -0700
X-CSE-ConnectionGUID: kFTIyyydSLOaza9yMphnpA==
X-CSE-MsgGUID: aanCNJ4gROmMzXgoT+uFkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72837965"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2024 05:39:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suAFi-000M6l-0E;
	Fri, 27 Sep 2024 12:39:18 +0000
Date: Fri, 27 Sep 2024 20:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 13/25] drivers/cxl/core/mbox.c:808:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202409272015.Alg6LVN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: 5a0496c19151d83cd0d926f8a1488eeaab27509b [13/25] cxl: Add Get Supported Features command for kernel usage
config: m68k-randconfig-r131-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272015.Alg6LVN9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409272015.Alg6LVN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272015.Alg6LVN9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:808:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got unsigned int @@
   drivers/cxl/core/mbox.c:808:23: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:808:23: sparse:     got unsigned int
>> drivers/cxl/core/mbox.c:886:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got int [assigned] alloc_size @@
   drivers/cxl/core/mbox.c:886:31: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:886:31: sparse:     got int [assigned] alloc_size
>> drivers/cxl/core/mbox.c:887:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] start_idx @@     got int [assigned] start @@
   drivers/cxl/core/mbox.c:887:35: sparse:     expected restricted __le16 [addressable] [usertype] start_idx
   drivers/cxl/core/mbox.c:887:35: sparse:     got int [assigned] start
>> drivers/cxl/core/mbox.c:920:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:931:54: sparse: sparse: restricted __le16 degrades to integer
>> drivers/cxl/core/mbox.c:932:23: sparse: sparse: invalid assignment: +=
   drivers/cxl/core/mbox.c:932:23: sparse:    left side has type int
   drivers/cxl/core/mbox.c:932:23: sparse:    right side has type restricted __le16

vim +808 drivers/cxl/core/mbox.c

   798	
   799	static int cxl_get_supported_features_count(struct cxl_dev_state *cxlds)
   800	{
   801		struct cxl_mailbox *cxl_mbox = &cxlds->cxl_mbox;
   802		struct cxl_mbox_get_sup_feats_out mbox_out;
   803		struct cxl_mbox_get_sup_feats_in mbox_in;
   804		struct cxl_mbox_cmd mbox_cmd;
   805		int rc;
   806	
   807		memset(&mbox_in, 0, sizeof(mbox_in));
 > 808		mbox_in.count = sizeof(mbox_out);
   809		memset(&mbox_out, 0, sizeof(mbox_out));
   810		mbox_cmd = (struct cxl_mbox_cmd) {
   811			.opcode = CXL_MBOX_OP_GET_SUPPORTED_FEATURES,
   812			.size_in = sizeof(mbox_in),
   813			.payload_in = &mbox_in,
   814			.size_out = sizeof(mbox_out),
   815			.payload_out = &mbox_out,
   816			.min_out = sizeof(mbox_out),
   817		};
   818		rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
   819		if (rc < 0)
   820			return rc;
   821	
   822		cxl_mbox->num_features = le16_to_cpu(mbox_out.supported_feats);
   823	
   824		return 0;
   825	}
   826	
   827	int cxl_get_supported_features(struct cxl_dev_state *cxlds)
   828	{
   829		struct cxl_mbox_get_sup_feats_out *mbox_out __free(kvfree) = NULL;
   830		int remain_feats, max_size, max_feats, start, rc;
   831		struct cxl_mailbox *cxl_mbox = &cxlds->cxl_mbox;
   832		int feat_size = sizeof(struct cxl_feat_entry);
   833		struct cxl_mbox_get_sup_feats_in mbox_in;
   834		int hdr_size = sizeof(*mbox_out);
   835		struct cxl_mbox_cmd mbox_cmd;
   836		struct cxl_mem_command *cmd;
   837		void *ptr;
   838	
   839		/* Get supported features is optional, need to check */
   840		cmd = cxl_mem_find_command(CXL_MBOX_OP_GET_SUPPORTED_FEATURES);
   841		if (!cmd)
   842			return -EOPNOTSUPP;
   843		if (!test_bit(cmd->info.id, cxl_mbox->enabled_cmds))
   844			return -EOPNOTSUPP;
   845	
   846		rc = cxl_get_supported_features_count(cxlds);
   847		if (rc)
   848			return rc;
   849	
   850		if (!cxl_mbox->num_features) {
   851			dev_dbg(cxl_mbox->host, "No CXL features enumerated.\n");
   852			return 0;
   853		}
   854	
   855		struct cxl_feat_entry *entries __free(kvfree) =
   856			kvmalloc(cxl_mbox->num_features * feat_size, GFP_KERNEL);
   857	
   858		if (!entries)
   859			return -ENOMEM;
   860	
   861		max_size = cxl_mbox->payload_size - hdr_size;
   862		/* max feat entries that can fit in mailbox max payload size */
   863		max_feats = max_size / feat_size;
   864		ptr = &entries[0];
   865	
   866		mbox_out = kvmalloc(cxl_mbox->payload_size, GFP_KERNEL);
   867		if (!mbox_out)
   868			return -ENOMEM;
   869	
   870		start = 0;
   871		remain_feats = cxl_mbox->num_features;
   872		do {
   873			int retrieved, alloc_size, copy_feats;
   874	
   875			if (remain_feats > max_feats) {
   876				alloc_size = sizeof(*mbox_out) + max_feats * feat_size;
   877				remain_feats = remain_feats - max_feats;
   878				copy_feats = max_feats;
   879			} else {
   880				alloc_size = sizeof(*mbox_out) + remain_feats * feat_size;
   881				copy_feats = remain_feats;
   882				remain_feats = 0;
   883			}
   884	
   885			memset(&mbox_in, 0, sizeof(mbox_in));
 > 886			mbox_in.count = alloc_size;
 > 887			mbox_in.start_idx = start;
   888			memset(mbox_out, 0, alloc_size);
   889			mbox_cmd = (struct cxl_mbox_cmd) {
   890				.opcode = CXL_MBOX_OP_GET_SUPPORTED_FEATURES,
   891				.size_in = sizeof(mbox_in),
   892				.payload_in = &mbox_in,
   893				.size_out = alloc_size,
   894				.payload_out = mbox_out,
   895				.min_out = hdr_size,
   896			};
   897			rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
   898			if (rc < 0)
   899				return rc;
   900	
   901			if (mbox_cmd.size_out <= hdr_size) {
   902				rc = -ENXIO;
   903				goto err;
   904			}
   905	
   906			/*
   907			 * Make sure retrieved out buffer is multiple of feature
   908			 * entries.
   909			 */
   910			retrieved = mbox_cmd.size_out - hdr_size;
   911			if (retrieved % feat_size) {
   912				rc = -ENXIO;
   913				goto err;
   914			}
   915	
   916			/*
   917			 * If the reported output entries * defined entry size !=
   918			 * retrieved output bytes, then the output package is incorrect.
   919			 */
 > 920			if (mbox_out->num_entries * feat_size != retrieved) {
   921				rc = -ENXIO;
   922				goto err;
   923			}
   924	
   925			memcpy(ptr, mbox_out->ents, retrieved);
   926			ptr += retrieved;
   927			/*
   928			 * If the number of output entries is less than expected, add the
   929			 * remaining entries to the next batch.
   930			 */
   931			remain_feats += copy_feats - mbox_out->num_entries;
 > 932			start += mbox_out->num_entries;
   933		} while (remain_feats);
   934	
   935		cxl_mbox->entries = no_free_ptr(entries);
   936		rc = devm_add_action_or_reset(cxl_mbox->host, cxl_free_features,
   937					      cxl_mbox->entries);
   938		if (rc)
   939			return rc;
   940	
   941		return 0;
   942	
   943	err:
   944		cxl_mbox->num_features = 0;
   945		return rc;
   946	}
   947	EXPORT_SYMBOL_NS_GPL(cxl_get_supported_features, CXL);
   948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
