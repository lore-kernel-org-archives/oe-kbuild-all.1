Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE27E370D51
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325723; cv=none; b=XEuFmCWz8ViIZRqBseAuXIndE1OhVen3J+XwkA+E5J/lWd8TLCcnWQs+ARGP/FJdQMTwZt5elySgblpL6i5lMxayA3bF3h3WY4GE6ifWkea4ryRgrrfa3bGgPAFpxYLjHmclBuxfNcZWg/aozY8U1TSyCYU9JhZeGlcy3T9PgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325723; c=relaxed/simple;
	bh=1UVRKUZP7a/qFbhUmFrxxjELYrvsDcssuM3RoJnpi98=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ilXZL8dymvAsq2i7dXOkd0uPTzmDQBRLtCF/UjsxSEf8dpP2T8FJukZwUaEA8vubjKOw2BkWrls01wWh+iQry9ilZHdKabJzP9lAiI64Z45xqgLGp59RAx5fMyMlor7T7zA7MugRTPGcb/K1IJ14LyYSCFAPZ6rEwQV7d+B9D3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gou+PfBH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gou+PfBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773325721; x=1804861721;
  h=date:from:to:cc:subject:message-id;
  bh=1UVRKUZP7a/qFbhUmFrxxjELYrvsDcssuM3RoJnpi98=;
  b=Gou+PfBHWxLDP8wDrY3AZOMySG2EcXwy7ky75Y5JKmrW1Jlq+5RYxOig
   v3BXp5njuSaIXNYGYF+xTJ0vVrC+CwnN5quhX/NH20av1fPm/CQllV3HD
   RW3nF/+CNuDtQQp6RDJW2PXfdmsArf5rXwGlpsSAgvTTLk821WqgbnT4P
   +7jkvqqNNyvH3eu8xLzHatxcXHJPc3sj2l55rY3YqoqFTYnZ32rpDNAlH
   DWudTPT7HGMGAwBvA3Duydywy/iux3ETn6ymE7Q2KVScGsSgfNIa6Up2E
   49suACUMSG4zWbKis7PSS+TfycBdL653aycHBRoJ1r2I9CmyighAHze8w
   A==;
X-CSE-ConnectionGUID: zqTJkv6cQz6ZNYPe+5L5GA==
X-CSE-MsgGUID: TlflhpIhT2CriMHnZ3l2wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85048710"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85048710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:28:40 -0700
X-CSE-ConnectionGUID: UUhMCFJWQymEqLZ/307K+Q==
X-CSE-MsgGUID: nW0WllhjRZ2gV2nSpUoqGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220774974"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 07:28:38 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0h1e-000000002Yd-1AMQ;
	Thu, 12 Mar 2026 14:28:34 +0000
Date: Thu, 12 Mar 2026 22:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next 204/224]
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:534:3: error: a label can only
 be part of a statement and a declaration is not a statement
Message-ID: <202603122232.fIOmEGnH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   7a9419ab42699fd3d4c857ef81ae097d8d8d5899
commit: 47ab777c16c71ba033325593cd833bded65f5943 [204/224] drm/amdgpu/discovery: use common function to check discovery table
config: arc-randconfig-001-20260312 (https://download.01.org/0day-ci/archive/20260312/202603122232.fIOmEGnH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603122232.fIOmEGnH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603122232.fIOmEGnH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c: In function 'amdgpu_discovery_table_check':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:534:3: error: a label can only be part of a statement and a declaration is not a statement
      struct ip_discovery_header *ihdr =
      ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:542:3: error: a label can only be part of a statement and a declaration is not a statement
      struct gpu_info_header *ghdr =
      ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:550:3: error: a label can only be part of a statement and a declaration is not a statement
      struct harvest_info_header *hhdr =
      ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:558:3: error: a label can only be part of a statement and a declaration is not a statement
      struct vcn_info_header *vhdr =
      ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:566:3: error: a label can only be part of a statement and a declaration is not a statement
      struct mall_info_header *mhdr =
      ^~~~~~


vim +534 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

   515	
   516	static int amdgpu_discovery_table_check(struct amdgpu_device *adev,
   517						uint8_t *discovery_bin,
   518						uint16_t table_id)
   519	{
   520		int r, act_val, exp_val, table_size;
   521		uint16_t offset, checksum;
   522		struct table_info *info;
   523		bool check_table = true;
   524		char *table_name;
   525	
   526		r = amdgpu_discovery_get_table_info(adev, &info, table_id);
   527		if (r)
   528			return r;
   529		offset = le16_to_cpu(info->offset);
   530		checksum = le16_to_cpu(info->checksum);
   531	
   532		switch (table_id) {
   533		case IP_DISCOVERY:
 > 534			struct ip_discovery_header *ihdr =
   535				(struct ip_discovery_header *)(discovery_bin + offset);
   536			act_val = le32_to_cpu(ihdr->signature);
   537			exp_val = DISCOVERY_TABLE_SIGNATURE;
   538			table_size = le16_to_cpu(ihdr->size);
   539			table_name = "data table";
   540			break;
   541		case GC:
   542			struct gpu_info_header *ghdr =
   543				(struct gpu_info_header *)(discovery_bin + offset);
   544			act_val = le32_to_cpu(ghdr->table_id);
   545			exp_val = GC_TABLE_ID;
   546			table_size = le16_to_cpu(ghdr->size);
   547			table_name = "gc table";
   548			break;
   549		case HARVEST_INFO:
   550			struct harvest_info_header *hhdr =
   551				(struct harvest_info_header *)(discovery_bin + offset);
   552			act_val = le32_to_cpu(hhdr->signature);
   553			exp_val = HARVEST_TABLE_SIGNATURE;
   554			table_size = sizeof(struct harvest_table);
   555			table_name = "harvest table";
   556			break;
   557		case VCN_INFO:
   558			struct vcn_info_header *vhdr =
   559				(struct vcn_info_header *)(discovery_bin + offset);
   560			act_val = le32_to_cpu(vhdr->table_id);
   561			exp_val = VCN_INFO_TABLE_ID;
   562			table_size = le32_to_cpu(vhdr->size_bytes);
   563			table_name = "vcn table";
   564			break;
   565		case MALL_INFO:
   566			struct mall_info_header *mhdr =
   567				(struct mall_info_header *)(discovery_bin + offset);
   568			act_val = le32_to_cpu(mhdr->table_id);
   569			exp_val = MALL_INFO_TABLE_ID;
   570			table_size = le32_to_cpu(mhdr->size_bytes);
   571			table_name = "mall table";
   572			check_table = false;
   573			break;
   574		default:
   575			dev_err(adev->dev, "invalid ip discovery table id %d specified\n", table_id);
   576			check_table = false;
   577			break;
   578		}
   579	
   580		if (check_table && offset) {
   581			if (act_val != exp_val) {
   582				dev_err(adev->dev, "invalid ip discovery %s signature\n", table_name);
   583				return -EINVAL;
   584			}
   585	
   586			if (!amdgpu_discovery_verify_checksum(adev, discovery_bin + offset,
   587							      table_size, checksum)) {
   588				dev_err(adev->dev, "invalid ip discovery %s checksum\n", table_name);
   589				return -EINVAL;
   590			}
   591		}
   592	
   593		return 0;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
