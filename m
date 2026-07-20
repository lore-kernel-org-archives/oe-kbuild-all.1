Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF14449B2F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jul 2026 23:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784591259; cv=none; b=jeatIBasdtzqF6iKel5yhn4mUM8ZV/CCpgScTH89ha7C2+uB4i3vy6j/8zr5PKSNKLU3qfYAyRsOm/lBMW8EPJ+ULRszsCc4QS6G0ajhPuD+tkcSXE9BwzXDqvG0pRnB/jjq+ikd/YBeY9y8DW9KVc44OAngPEH1SyVSQBc2IBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784591259; c=relaxed/simple;
	bh=mTyzN/4Bh0HFi9Rbcbd/3/GE2AXEBBxOH7uvo8wF50I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PmhfmsnktCUrs+CYz8EXm1hRsLX1A6qUuvZPUttFqQywF0UYLPERx4DUdkifWzDKV1XSndjcxaCOpagxnQHDPrhFq6p9L0wcjDZWde1uFyRRrPBc3pzclrMdCsBc4unvlAMKBItTP94zolskIPjRU6t0yqWYH20GkLwSKtFxpmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuYWJWve; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuYWJWve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784591258; x=1816127258;
  h=date:from:to:cc:subject:message-id;
  bh=mTyzN/4Bh0HFi9Rbcbd/3/GE2AXEBBxOH7uvo8wF50I=;
  b=kuYWJWve2eovF+wHQnhF7+Z6pmYf7pX5gIYrfs/nJna67nC/OlDKPwxW
   QoJDbDhbDuK7Ky/KJPjw7ahBMbkyPqZ/Bdm8b7jbW+E68rIVL1GmXw42C
   SVhs4/EYgCPDx4zka2x3HX4qrzpJFlehaGY5N2PBvLn/OY+OqqrDQX9DK
   eITWQ8mG0S+ar697SM4E/nvZfSCUhAvGHfTv1klr17piX//v1KTm3Bcxl
   +Sz9pMHFlIbubtWI8cNQ38Udxpq3GTYt4IpeNiWZEIkv8mM6rOxP4qZck
   oW6AgYnI772x59L/zkpEC36WNctMehJj/b//CHwV3mRfz4Ar3AWGZtjK9
   A==;
X-CSE-ConnectionGUID: Hr0xrGVlQkqEZAVsWcjQUg==
X-CSE-MsgGUID: qZyvPfJORTq6h8GCqv6uOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96694402"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="96694402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 16:47:37 -0700
X-CSE-ConnectionGUID: tVdu11n0QrWueaqfppsY6g==
X-CSE-MsgGUID: CUet387YQUeH0tZMih3JgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="295808572"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Jul 2026 16:47:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlxhs-00000000Wy5-1iF3;
	Mon, 20 Jul 2026 23:47:32 +0000
Date: Tue, 21 Jul 2026 07:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Asad Kamal <asad.kamal@amd.com>
Subject: drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c:920:3-56: opportunity
 for str_enabled_disabled(smu_feature_bits_is_set ( & feature_mask ,
 feature_index ))
Message-ID: <202607210737.OeGpY3kI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b95f03f04d475aa6719d15a636ddf32222d55657
commit: 7b88453a476c9770c094c1f596e0b9fee208e65b drm/amd/pm: Change get_enabled_mask signature
date:   6 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260721/202607210737.OeGpY3kI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7b88453a476c ("drm/amd/pm: Change get_enabled_mask signature")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607210737.OeGpY3kI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c:920:3-56: opportunity for str_enabled_disabled(smu_feature_bits_is_set ( & feature_mask , feature_index ))

vim +920 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c

   878	
   879	size_t smu_cmn_get_pp_feature_mask(struct smu_context *smu,
   880					   char *buf)
   881	{
   882		int8_t sort_feature[MAX(SMU_FEATURE_COUNT, SMU_FEATURE_MAX)];
   883		struct smu_feature_bits feature_mask;
   884		uint32_t features[2];
   885		int i, feature_index;
   886		uint32_t count = 0;
   887		size_t size = 0;
   888	
   889		if (__smu_get_enabled_features(smu, &feature_mask))
   890			return 0;
   891	
   892		/* TBD: Need to handle for > 64 bits */
   893		smu_feature_bits_to_arr32(&feature_mask, features, 64);
   894		size = sysfs_emit_at(buf, size, "features high: 0x%08x low: 0x%08x\n",
   895				     features[1], features[0]);
   896	
   897		memset(sort_feature, -1, sizeof(sort_feature));
   898	
   899		for (i = 0; i < SMU_FEATURE_COUNT; i++) {
   900			feature_index = smu_cmn_to_asic_specific_index(smu,
   901								       CMN2ASIC_MAPPING_FEATURE,
   902								       i);
   903			if (feature_index < 0)
   904				continue;
   905	
   906			sort_feature[feature_index] = i;
   907		}
   908	
   909		size += sysfs_emit_at(buf, size, "%-2s. %-20s  %-3s : %-s\n",
   910				"No", "Feature", "Bit", "State");
   911	
   912		for (feature_index = 0; feature_index < SMU_FEATURE_MAX; feature_index++) {
   913			if (sort_feature[feature_index] < 0)
   914				continue;
   915	
   916			size += sysfs_emit_at(
   917				buf, size, "%02d. %-20s (%2d) : %s\n", count++,
   918				smu_get_feature_name(smu, sort_feature[feature_index]),
   919				feature_index,
 > 920				smu_feature_bits_is_set(&feature_mask, feature_index) ?
   921					"enabled" :
   922					"disabled");
   923		}
   924	
   925		return size;
   926	}
   927	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
