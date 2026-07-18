Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1412EA172
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784373104; cv=none; b=mAzubcaEkkBVr0WXg3iXxg96sd9L5awzJrbCrtpVpsHkje7C/R1OrC2D8/eheMwbPxy5jvbB/JX98S9lDQfPUtMM1cqbnGKim3uNdMAfkskA0lVwf9UX9pNfHL4hL0ZA1DCcmtvzskxLZdbaLdGYXUn9bOs73CDdj2ialEHZt1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784373104; c=relaxed/simple;
	bh=OEkc2iSEPzktnTEeBRgh1hQFu1bzbs/8At/H33ssjTo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eHJgfGMPpDxfoQS7Eb9Gv/qi530jFBFWXrx2C/lnrwxvrCWOnxGascRs6oZnIQOxqBAI5vaRXKEwBp5qSefqB5zLmEj5o8NRqrRHicSkK+H4cD6ErIJ/cIoe74DEoZqoCBGySejJUy6svH25Q/nrUpWI+VLgFwMgVV1aY0syRQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoSJnWQj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoSJnWQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784373102; x=1815909102;
  h=date:from:to:cc:subject:message-id;
  bh=OEkc2iSEPzktnTEeBRgh1hQFu1bzbs/8At/H33ssjTo=;
  b=NoSJnWQji4XhzDDNqi24Idd/i9BSr9GJENAddpzSnEVPbn+Fp75+Jyfj
   KmHfK61/2fwjo3V7zyg0c62t/wnZdtSByq2X/mRaqXf3vaealmSq+8CmF
   UKiUzydn9Z4znVoBdIZPQ/56AFp9rXn7LFCY1hsj33F/wgmUp3nP3uTnd
   x9IA25aSIijkATokmJy0taNZiG+XrrXxvl2oY5lSb0ur6EpjkuMObZz3I
   7AZpvtAmSUZZ/at2NhaEY0mDhpz9WRpha8bMBhNo0z0shkNF+2aVHl1j+
   zbo02ZctIrkOUDCR4s+WNi1+evh4rR1biQJhyxWTXTnVoLIrmw/UYOC6D
   g==;
X-CSE-ConnectionGUID: Ifcly6IGRx6hFb7+v+DU1A==
X-CSE-MsgGUID: WJkjuWUHQuKmPO2UP9x8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96535031"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96535031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 04:11:41 -0700
X-CSE-ConnectionGUID: fNYj2PhIQF6Fn3/yqRXuDQ==
X-CSE-MsgGUID: EbvWd1+9TXiMrty0uYEJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="255238953"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2026 04:11:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl2x2-00000000UjO-35T5;
	Sat, 18 Jul 2026 11:11:28 +0000
Date: Sat, 18 Jul 2026 19:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Asad Kamal <asad.kamal@amd.com>
Subject: drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c:920:3-56: opportunity
 for str_enabled_disabled(smu_feature_bits_is_set ( & feature_mask ,
 feature_index ))
Message-ID: <202607181846.NyQe3GrQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 7b88453a476c9770c094c1f596e0b9fee208e65b drm/amd/pm: Change get_enabled_mask signature
date:   6 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260718/202607181846.NyQe3GrQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7b88453a476c ("drm/amd/pm: Change get_enabled_mask signature")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181846.NyQe3GrQ-lkp@intel.com/

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
