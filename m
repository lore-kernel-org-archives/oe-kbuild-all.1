Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7A30DEC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553574; cv=none; b=jfvnWesG4eXKdHt2pxiM3YBmkkHGDaHjnfacvNpXetjchjsryYP9VoIv2xC3UjWIiBN3vzNz5Erz8UBKJ/i7iAmBrWYd90oYsdZbEYkbvWmfVE+EeApDioBDOIM77VBT2cysbANL72jUn7Zm8euuRg/ON43uLoipVu5Di0TwZi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553574; c=relaxed/simple;
	bh=0BP49QP3wyEuVPVKXGIfTjAqQF0O3GDs7q1+BKdVoLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qirsxQfczSlhStt/E41yomZlk9ysioQf0Ql5qqfJ1P46hlVIEeyzv7T4vIDxtEf7QLetCtnDFGFVLDWRXujyeGhB99vkbMc5DNKM0WV2WJ1+7MWAadwgLVj+d2e793mYNaLsHSgha6ASglcHIss8sqO4mEhcIW7yUICx8UkOdZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faDINM4n; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faDINM4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768553572; x=1800089572;
  h=date:from:to:cc:subject:message-id;
  bh=0BP49QP3wyEuVPVKXGIfTjAqQF0O3GDs7q1+BKdVoLM=;
  b=faDINM4ngPgGarQXgNLRvxn+pp69InGASY0yPCgwOJOUMORp4jUpuUaX
   nxAUtPDxISXxBEERN3DxtNWUCTg8rvkF5K6B3BPIPmI0b/xnYJ7JdT36n
   3xikRJTamfkkylcyZay81yswsR+4Eh1J52By5ZpuHBsXho3wf3Zzy6p9f
   s8IZn12yoBt4bc8V6DGiBBgKlZ0gTtmCnndEQ8+9agjuFr3tVgZa9O67W
   HTye0a+wC/B5jKCj/qZPghphKN0qugtpZ5EzLrg93o7SMEzxcuBCuJ2wA
   Ueg7ni0VrjXrsMekniPKSovtJT4IYPOMMzGxeVu+QGYqm6DTjnbHSyTBC
   w==;
X-CSE-ConnectionGUID: bJvZJSr8TumabkDSqiItqA==
X-CSE-MsgGUID: vRyHpjsOQ6Kq/lf5IqAx/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73720423"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73720423"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 00:52:51 -0800
X-CSE-ConnectionGUID: tc10wsDuQhO2Ss1wTX/2vA==
X-CSE-MsgGUID: t0Q9jgqnRBuweHC1ivefOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205242291"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jan 2026 00:52:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgfZV-00000000Kbo-489T;
	Fri, 16 Jan 2026 08:52:45 +0000
Date: Fri, 16 Jan 2026 16:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Samson Tam <Samson.Tam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 George Zhang <george.zhang@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: 
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1677:52-53:
 WARNING: Use ARRAY_SIZE
Message-ID: <202601161613.UlXCQ0hC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Samson,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   983d014aafb14ee5e4915465bf8948e8f3a723b5
commit: 5c06c1df3582102e837dc7d6e8a462323277e57b drm/amd/display: Move SPL to a new path
date:   11 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260116/202601161613.UlXCQ0hC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161613.UlXCQ0hC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1677:52-53: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1649:60-61: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1691:53-54: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1719:54-55: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1705:53-54: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1663:53-54: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1630:50-51: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1635:50-51: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1611:50-51: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1616:50-51: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1561:57-58: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1592:53-54: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1597:53-54: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1573:53-54: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1578:53-54: WARNING: Use ARRAY_SIZE
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:1552:57-58: WARNING: Use ARRAY_SIZE
--
>> drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c:57:15-16: WARNING opportunity for max()
   drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c:59:15-16: WARNING opportunity for max()

vim +1677 drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c

6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1520  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1521  static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct spl_fixed31_32 ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1522  	struct scale_ratio_to_reg_value_lookup *lookup_table_base_ptr,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1523  	unsigned int num_entries)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1524  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1525  	unsigned int count = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1526  	uint32_t value = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1527  	struct scale_ratio_to_reg_value_lookup *lookup_table_index_ptr;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1528  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1529  	lookup_table_index_ptr = (lookup_table_base_ptr + num_entries - 1);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1530  	value = lookup_table_index_ptr->reg_value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1531  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1532  	while (count < num_entries) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1533  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1534  		lookup_table_index_ptr = (lookup_table_base_ptr + count);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1535  		if (lookup_table_index_ptr->numer < 0)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1536  			break;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1537  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1538  		if (ratio.value < spl_fixpt_from_fraction(
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1539  			lookup_table_index_ptr->numer,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1540  			lookup_table_index_ptr->denom).value) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1541  			value = lookup_table_index_ptr->reg_value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1542  			break;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1543  		}
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1544  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1545  		count++;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1546  	}
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1547  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1548  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1549  uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1550  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1551  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1552  	unsigned int num_entries = sizeof(easf_v_bf3_mode_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1553  		sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1554  	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1555  		easf_v_bf3_mode_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1556  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1557  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1558  uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1559  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1560  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1561  	unsigned int num_entries = sizeof(easf_h_bf3_mode_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1562  		sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1563  	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1564  		easf_h_bf3_mode_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1565  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1566  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1567  uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1568  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1569  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1570  	unsigned int num_entries;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1571  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1572  	if (taps == 4) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1573  		num_entries = sizeof(easf_reducer_gain6_4tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1574  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1575  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1576  			easf_reducer_gain6_4tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1577  	} else if (taps == 6) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1578  		num_entries = sizeof(easf_reducer_gain6_6tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1579  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1580  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1581  			easf_reducer_gain6_6tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1582  	} else
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1583  		value = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1584  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1585  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1586  uint32_t spl_get_reducer_gain4(int taps, struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1587  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1588  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1589  	unsigned int num_entries;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1590  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1591  	if (taps == 4) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1592  		num_entries = sizeof(easf_reducer_gain4_4tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1593  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1594  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1595  			easf_reducer_gain4_4tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1596  	} else if (taps == 6) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1597  		num_entries = sizeof(easf_reducer_gain4_6tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1598  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1599  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1600  			easf_reducer_gain4_6tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1601  	} else
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1602  		value = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1603  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1604  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1605  uint32_t spl_get_gainRing6(int taps, struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1606  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1607  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1608  	unsigned int num_entries;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1609  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1610  	if (taps == 4) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1611  		num_entries = sizeof(easf_gain_ring6_4tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1612  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1613  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1614  			easf_gain_ring6_4tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1615  	} else if (taps == 6) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1616  		num_entries = sizeof(easf_gain_ring6_6tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1617  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1618  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1619  			easf_gain_ring6_6tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1620  	} else
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1621  		value = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1622  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1623  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1624  uint32_t spl_get_gainRing4(int taps, struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1625  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1626  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1627  	unsigned int num_entries;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1628  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1629  	if (taps == 4) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1630  		num_entries = sizeof(easf_gain_ring4_4tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1631  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1632  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1633  			easf_gain_ring4_4tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1634  	} else if (taps == 6) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1635  		num_entries = sizeof(easf_gain_ring4_6tap_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1636  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1637  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1638  			easf_gain_ring4_6tap_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1639  	} else
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1640  		value = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1641  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1642  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1643  uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1644  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1645  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1646  	unsigned int num_entries;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1647  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1648  	if (taps == 3) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1649  		num_entries = sizeof(easf_3tap_dntilt_uptilt_offset_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1650  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1651  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1652  			easf_3tap_dntilt_uptilt_offset_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1653  	} else
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1654  		value = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1655  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1656  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1657  uint32_t spl_get_3tap_uptilt_maxval(int taps, struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1658  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1659  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1660  	unsigned int num_entries;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1661  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1662  	if (taps == 3) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1663  		num_entries = sizeof(easf_3tap_uptilt_maxval_lookup) /
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1664  			sizeof(struct scale_ratio_to_reg_value_lookup);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1665  		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1666  			easf_3tap_uptilt_maxval_lookup, num_entries);
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1667  	} else
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1668  		value = 0;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1669  	return value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1670  }
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1671  uint32_t spl_get_3tap_dntilt_slope(int taps, struct spl_fixed31_32 ratio)
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1672  {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1673  	uint32_t value;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1674  	unsigned int num_entries;
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1675  
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16  1676  	if (taps == 3) {
6efc0ab3b05de0 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c Samson Tam 2024-08-16 @1677  		num_entries = sizeof(easf_3tap_dntilt_slope_lookup) /

:::::: The code at line 1677 was first introduced by commit
:::::: 6efc0ab3b05de0d7bab8ec0597214e4788251071 drm/amd/display: add back quality EASF and ISHARP and dc dependency changes

:::::: TO: Samson Tam <Samson.Tam@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
