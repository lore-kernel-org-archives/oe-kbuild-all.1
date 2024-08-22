Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8D710A1C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 00:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724288295; cv=none; b=Jcg/y2Qu889xTNpC5SksGxeuErR8eR0agHwLpDukbV0uzEO69JEDWtPZ/zmDzOfKOCDvXRnsnXMzkGgzU3yQIy7GZ/AR9zSWYyqgagbA2p+L+sOuoOcw+vd5CMfozqOxvVTBYqC3R5pYZ+kQnB56QkDo9x/FfIpUBkjin/ctZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724288295; c=relaxed/simple;
	bh=1qfe/O7nMMdjWVXRtIZG7BL5QszBIjqZdb9/Wu15fWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFNYi7pneW0AWg+EXrB3c9Df3okZweh7sXoM5PdhVdprWdzx4ubQNQXq104uGwoRJ8X/QTdqfMY7CjPuy+4jocCFUhcA6VGip+LX3bG0RlIxtuXBQNz+GSMCnWwRPl/NQwK4or0NSjDB/ujxZ/NHf52Q7GaZcuXlqfQjMHvNQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPSdWChj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPSdWChj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724288293; x=1755824293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qfe/O7nMMdjWVXRtIZG7BL5QszBIjqZdb9/Wu15fWo=;
  b=VPSdWChjuvU2TS8boUWvCsAl71v3zw+7Ts7F3WrIi5xzf/V0nRUKvhwK
   GxHEdprdKkGJvpWJsb/fbC9vFAUmNyLyVIfWCrSe8Tsjf3I4xuqpnLp05
   wHNn4TdYEaBQSK4IpfER15wVFFhJyhYtVl3HcimNo0ByR+0KnkiavrC5O
   YSiGYUwIASi4DYPF/ivImBg3K5yDG8+y+M7GuWbDAO1t7c20ZPB9ds2vW
   Q7hAPl1/tujIvRCPWrIGXIzxNC60mADZzsP0HV9AjwqAfH6RMAftMmfMu
   5gLreN5NUjQRVllcdig6+/FCeGxXEMdIKd4RJjvXQvT9q8Jd8zKUxURxs
   g==;
X-CSE-ConnectionGUID: dacvDAr2SPuxPyCyAa2kpQ==
X-CSE-MsgGUID: cCSuH3jrQH6eUorAN5XMlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22492634"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="22492634"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 17:58:12 -0700
X-CSE-ConnectionGUID: SODhwWdjQOKsgJEQTiOnYA==
X-CSE-MsgGUID: CnSFPsxrRyOHNRLjo3s+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="60927194"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Aug 2024 17:58:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgw9Q-000C7g-2W;
	Thu, 22 Aug 2024 00:58:08 +0000
Date: Thu, 22 Aug 2024 08:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 17/20] drivers/cxl/core/mbox.c:1073:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202408220802.KAOslYki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://github.com/jgunthorpe/linux fwctl
head:   3175f4c0e49e730b73cd11048737516e461acf09
commit: e6537a248fe6241de233cf02c499dfd48ce73fce [17/20] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: arm64-randconfig-r121-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220802.KAOslYki-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408220802.KAOslYki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220802.KAOslYki-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:1073:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got unsigned long @@
   drivers/cxl/core/mbox.c:1073:23: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:1073:23: sparse:     got unsigned long
>> drivers/cxl/core/mbox.c:1153:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got int [assigned] alloc_size @@
   drivers/cxl/core/mbox.c:1153:31: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:1153:31: sparse:     got int [assigned] alloc_size
>> drivers/cxl/core/mbox.c:1154:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] start_idx @@     got int [assigned] start @@
   drivers/cxl/core/mbox.c:1154:35: sparse:     expected restricted __le16 [addressable] [usertype] start_idx
   drivers/cxl/core/mbox.c:1154:35: sparse:     got int [assigned] start
>> drivers/cxl/core/mbox.c:1187:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:1198:54: sparse: sparse: restricted __le16 degrades to integer
>> drivers/cxl/core/mbox.c:1199:23: sparse: sparse: invalid assignment: +=
   drivers/cxl/core/mbox.c:1199:23: sparse:    left side has type int
   drivers/cxl/core/mbox.c:1199:23: sparse:    right side has type restricted __le16

vim +1073 drivers/cxl/core/mbox.c

69f846d7538bddd Dave Jiang 2024-07-18  1064  
69f846d7538bddd Dave Jiang 2024-07-18  1065  static int cxl_get_supported_features_count(struct cxl_mailbox *cxl_mbox)
69f846d7538bddd Dave Jiang 2024-07-18  1066  {
69f846d7538bddd Dave Jiang 2024-07-18  1067  	struct cxl_mbox_get_sup_feats_out mbox_out;
69f846d7538bddd Dave Jiang 2024-07-18  1068  	struct cxl_mbox_get_sup_feats_in mbox_in;
69f846d7538bddd Dave Jiang 2024-07-18  1069  	struct cxl_mbox_cmd mbox_cmd;
69f846d7538bddd Dave Jiang 2024-07-18  1070  	int rc;
69f846d7538bddd Dave Jiang 2024-07-18  1071  
69f846d7538bddd Dave Jiang 2024-07-18  1072  	memset(&mbox_in, 0, sizeof(mbox_in));
69f846d7538bddd Dave Jiang 2024-07-18 @1073  	mbox_in.count = sizeof(mbox_out);
69f846d7538bddd Dave Jiang 2024-07-18  1074  	memset(&mbox_out, 0, sizeof(mbox_out));
69f846d7538bddd Dave Jiang 2024-07-18  1075  	mbox_cmd = (struct cxl_mbox_cmd) {
69f846d7538bddd Dave Jiang 2024-07-18  1076  		.opcode = CXL_MBOX_OP_GET_SUPPORTED_FEATURES,
69f846d7538bddd Dave Jiang 2024-07-18  1077  		.size_in = sizeof(mbox_in),
69f846d7538bddd Dave Jiang 2024-07-18  1078  		.payload_in = &mbox_in,
69f846d7538bddd Dave Jiang 2024-07-18  1079  		.size_out = sizeof(mbox_out),
69f846d7538bddd Dave Jiang 2024-07-18  1080  		.payload_out = &mbox_out,
69f846d7538bddd Dave Jiang 2024-07-18  1081  		.min_out = sizeof(mbox_out),
69f846d7538bddd Dave Jiang 2024-07-18  1082  	};
69f846d7538bddd Dave Jiang 2024-07-18  1083  	rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
69f846d7538bddd Dave Jiang 2024-07-18  1084  	if (rc < 0)
69f846d7538bddd Dave Jiang 2024-07-18  1085  		return rc;
69f846d7538bddd Dave Jiang 2024-07-18  1086  
69f846d7538bddd Dave Jiang 2024-07-18  1087  	cxl_mbox->num_features = le16_to_cpu(mbox_out.supported_feats);
69f846d7538bddd Dave Jiang 2024-07-18  1088  	if (!cxl_mbox->num_features)
69f846d7538bddd Dave Jiang 2024-07-18  1089  		return -ENOENT;
69f846d7538bddd Dave Jiang 2024-07-18  1090  
69f846d7538bddd Dave Jiang 2024-07-18  1091  	return 0;
69f846d7538bddd Dave Jiang 2024-07-18  1092  }
69f846d7538bddd Dave Jiang 2024-07-18  1093  
69f846d7538bddd Dave Jiang 2024-07-18  1094  int cxl_get_supported_features(struct cxl_mailbox *cxl_mbox)
69f846d7538bddd Dave Jiang 2024-07-18  1095  {
69f846d7538bddd Dave Jiang 2024-07-18  1096  	int remain_feats, max_size, max_feats, start, rc;
69f846d7538bddd Dave Jiang 2024-07-18  1097  	int feat_size = sizeof(struct cxl_feat_entry);
69f846d7538bddd Dave Jiang 2024-07-18  1098  	struct cxl_mbox_get_sup_feats_out *mbox_out;
69f846d7538bddd Dave Jiang 2024-07-18  1099  	struct cxl_mbox_get_sup_feats_in mbox_in;
69f846d7538bddd Dave Jiang 2024-07-18  1100  	int hdr_size = sizeof(*mbox_out);
69f846d7538bddd Dave Jiang 2024-07-18  1101  	struct cxl_mbox_cmd mbox_cmd;
69f846d7538bddd Dave Jiang 2024-07-18  1102  	struct cxl_mem_command *cmd;
69f846d7538bddd Dave Jiang 2024-07-18  1103  	void *ptr;
69f846d7538bddd Dave Jiang 2024-07-18  1104  
69f846d7538bddd Dave Jiang 2024-07-18  1105  	/* Get supported features is optional, need to check */
69f846d7538bddd Dave Jiang 2024-07-18  1106  	cmd = cxl_mem_find_command(CXL_MBOX_OP_GET_SUPPORTED_FEATURES);
69f846d7538bddd Dave Jiang 2024-07-18  1107  	if (!cmd)
69f846d7538bddd Dave Jiang 2024-07-18  1108  		return -EOPNOTSUPP;
69f846d7538bddd Dave Jiang 2024-07-18  1109  	if (!test_bit(cmd->info.id, cxl_mbox->enabled_cmds))
69f846d7538bddd Dave Jiang 2024-07-18  1110  		return -EOPNOTSUPP;
69f846d7538bddd Dave Jiang 2024-07-18  1111  
69f846d7538bddd Dave Jiang 2024-07-18  1112  	rc = cxl_get_supported_features_count(cxl_mbox);
69f846d7538bddd Dave Jiang 2024-07-18  1113  	if (rc)
69f846d7538bddd Dave Jiang 2024-07-18  1114  		return rc;
69f846d7538bddd Dave Jiang 2024-07-18  1115  
69f846d7538bddd Dave Jiang 2024-07-18  1116  	struct cxl_feat_entry *entries __free(kvfree) =
69f846d7538bddd Dave Jiang 2024-07-18  1117  		kvmalloc(cxl_mbox->num_features * feat_size, GFP_KERNEL);
69f846d7538bddd Dave Jiang 2024-07-18  1118  
69f846d7538bddd Dave Jiang 2024-07-18  1119  	if (!entries)
69f846d7538bddd Dave Jiang 2024-07-18  1120  		return -ENOMEM;
69f846d7538bddd Dave Jiang 2024-07-18  1121  
69f846d7538bddd Dave Jiang 2024-07-18  1122  	cxl_mbox->entries = no_free_ptr(entries);
69f846d7538bddd Dave Jiang 2024-07-18  1123  	rc = devm_add_action_or_reset(cxl_mbox->host, cxl_free_features,
69f846d7538bddd Dave Jiang 2024-07-18  1124  				      cxl_mbox->entries);
69f846d7538bddd Dave Jiang 2024-07-18  1125  	if (rc)
69f846d7538bddd Dave Jiang 2024-07-18  1126  		return rc;
69f846d7538bddd Dave Jiang 2024-07-18  1127  
69f846d7538bddd Dave Jiang 2024-07-18  1128  	max_size = cxl_mbox->payload_size - hdr_size;
69f846d7538bddd Dave Jiang 2024-07-18  1129  	/* max feat entries that can fit in mailbox max payload size */
69f846d7538bddd Dave Jiang 2024-07-18  1130  	max_feats = max_size / feat_size;
69f846d7538bddd Dave Jiang 2024-07-18  1131  	ptr = &cxl_mbox->entries[0];
69f846d7538bddd Dave Jiang 2024-07-18  1132  
69f846d7538bddd Dave Jiang 2024-07-18  1133  	mbox_out = kvmalloc(cxl_mbox->payload_size, GFP_KERNEL);
69f846d7538bddd Dave Jiang 2024-07-18  1134  	if (!mbox_out)
69f846d7538bddd Dave Jiang 2024-07-18  1135  		return -ENOMEM;
69f846d7538bddd Dave Jiang 2024-07-18  1136  
69f846d7538bddd Dave Jiang 2024-07-18  1137  	start = 0;
69f846d7538bddd Dave Jiang 2024-07-18  1138  	remain_feats = cxl_mbox->num_features;
69f846d7538bddd Dave Jiang 2024-07-18  1139  	do {
69f846d7538bddd Dave Jiang 2024-07-18  1140  		int retrieved, alloc_size, copy_feats;
69f846d7538bddd Dave Jiang 2024-07-18  1141  
69f846d7538bddd Dave Jiang 2024-07-18  1142  		if (remain_feats > max_feats) {
69f846d7538bddd Dave Jiang 2024-07-18  1143  			alloc_size = sizeof(*mbox_out) + max_feats * feat_size;
69f846d7538bddd Dave Jiang 2024-07-18  1144  			remain_feats = remain_feats - max_feats;
69f846d7538bddd Dave Jiang 2024-07-18  1145  			copy_feats = max_feats;
69f846d7538bddd Dave Jiang 2024-07-18  1146  		} else {
69f846d7538bddd Dave Jiang 2024-07-18  1147  			alloc_size = sizeof(*mbox_out) + remain_feats * feat_size;
69f846d7538bddd Dave Jiang 2024-07-18  1148  			copy_feats = remain_feats;
69f846d7538bddd Dave Jiang 2024-07-18  1149  			remain_feats = 0;
69f846d7538bddd Dave Jiang 2024-07-18  1150  		}
69f846d7538bddd Dave Jiang 2024-07-18  1151  
69f846d7538bddd Dave Jiang 2024-07-18  1152  		memset(&mbox_in, 0, sizeof(mbox_in));
69f846d7538bddd Dave Jiang 2024-07-18 @1153  		mbox_in.count = alloc_size;
69f846d7538bddd Dave Jiang 2024-07-18 @1154  		mbox_in.start_idx = start;
69f846d7538bddd Dave Jiang 2024-07-18  1155  		memset(mbox_out, 0, alloc_size);
69f846d7538bddd Dave Jiang 2024-07-18  1156  		mbox_cmd = (struct cxl_mbox_cmd) {
69f846d7538bddd Dave Jiang 2024-07-18  1157  			.opcode = CXL_MBOX_OP_GET_SUPPORTED_FEATURES,
69f846d7538bddd Dave Jiang 2024-07-18  1158  			.size_in = sizeof(mbox_in),
69f846d7538bddd Dave Jiang 2024-07-18  1159  			.payload_in = &mbox_in,
69f846d7538bddd Dave Jiang 2024-07-18  1160  			.size_out = alloc_size,
69f846d7538bddd Dave Jiang 2024-07-18  1161  			.payload_out = mbox_out,
69f846d7538bddd Dave Jiang 2024-07-18  1162  			.min_out = hdr_size,
69f846d7538bddd Dave Jiang 2024-07-18  1163  		};
69f846d7538bddd Dave Jiang 2024-07-18  1164  		rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
69f846d7538bddd Dave Jiang 2024-07-18  1165  		if (rc < 0)
69f846d7538bddd Dave Jiang 2024-07-18  1166  			return rc;
69f846d7538bddd Dave Jiang 2024-07-18  1167  
69f846d7538bddd Dave Jiang 2024-07-18  1168  		if (mbox_cmd.size_out <= hdr_size) {
69f846d7538bddd Dave Jiang 2024-07-18  1169  			rc = -ENXIO;
69f846d7538bddd Dave Jiang 2024-07-18  1170  			goto err;
69f846d7538bddd Dave Jiang 2024-07-18  1171  		}
69f846d7538bddd Dave Jiang 2024-07-18  1172  
69f846d7538bddd Dave Jiang 2024-07-18  1173  		/*
69f846d7538bddd Dave Jiang 2024-07-18  1174  		 * Make sure retrieved out buffer is multiple of feature
69f846d7538bddd Dave Jiang 2024-07-18  1175  		 * entries.
69f846d7538bddd Dave Jiang 2024-07-18  1176  		 */
69f846d7538bddd Dave Jiang 2024-07-18  1177  		retrieved = mbox_cmd.size_out - hdr_size;
69f846d7538bddd Dave Jiang 2024-07-18  1178  		if (retrieved % sizeof(struct cxl_feat_entry)) {
69f846d7538bddd Dave Jiang 2024-07-18  1179  			rc = -ENXIO;
69f846d7538bddd Dave Jiang 2024-07-18  1180  			goto err;
69f846d7538bddd Dave Jiang 2024-07-18  1181  		}
69f846d7538bddd Dave Jiang 2024-07-18  1182  
69f846d7538bddd Dave Jiang 2024-07-18  1183  		/*
69f846d7538bddd Dave Jiang 2024-07-18  1184  		 * If the reported output entries * defined entry size !=
69f846d7538bddd Dave Jiang 2024-07-18  1185  		 * retrieved output bytes, then the output package is incorrect.
69f846d7538bddd Dave Jiang 2024-07-18  1186  		 */
69f846d7538bddd Dave Jiang 2024-07-18 @1187  		if (mbox_out->num_entries * feat_size != retrieved) {
69f846d7538bddd Dave Jiang 2024-07-18  1188  			rc = -ENXIO;
69f846d7538bddd Dave Jiang 2024-07-18  1189  			goto err;
69f846d7538bddd Dave Jiang 2024-07-18  1190  		}
69f846d7538bddd Dave Jiang 2024-07-18  1191  
69f846d7538bddd Dave Jiang 2024-07-18  1192  		memcpy(ptr, mbox_out->ents, retrieved);
69f846d7538bddd Dave Jiang 2024-07-18  1193  		ptr += retrieved;
69f846d7538bddd Dave Jiang 2024-07-18  1194  		/*
69f846d7538bddd Dave Jiang 2024-07-18  1195  		 * If the number of output entries is less than expected, add the
69f846d7538bddd Dave Jiang 2024-07-18  1196  		 * remaining entries to the next batch.
69f846d7538bddd Dave Jiang 2024-07-18  1197  		 */
69f846d7538bddd Dave Jiang 2024-07-18  1198  		remain_feats += copy_feats - mbox_out->num_entries;
69f846d7538bddd Dave Jiang 2024-07-18 @1199  		start += mbox_out->num_entries;
69f846d7538bddd Dave Jiang 2024-07-18  1200  	} while (remain_feats);
69f846d7538bddd Dave Jiang 2024-07-18  1201  
69f846d7538bddd Dave Jiang 2024-07-18  1202  	return 0;
69f846d7538bddd Dave Jiang 2024-07-18  1203  
69f846d7538bddd Dave Jiang 2024-07-18  1204  err:
69f846d7538bddd Dave Jiang 2024-07-18  1205  	cxl_mbox->num_features = 0;
69f846d7538bddd Dave Jiang 2024-07-18  1206  	return rc;
69f846d7538bddd Dave Jiang 2024-07-18  1207  }
69f846d7538bddd Dave Jiang 2024-07-18  1208  EXPORT_SYMBOL_NS_GPL(cxl_get_supported_features, CXL);
69f846d7538bddd Dave Jiang 2024-07-18  1209  

:::::: The code at line 1073 was first introduced by commit
:::::: 69f846d7538bddd185b14560ab1c7c1292932cca cxl: Add Get Supported Features command for kernel usage

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
