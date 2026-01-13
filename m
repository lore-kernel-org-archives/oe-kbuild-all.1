Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7497338F233
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768306624; cv=none; b=kL7c4v1prqEEDF3uijlmTyRiU1WnORa2I0twx8L3gPt8TVOXORwXwCzwtAASnhbmBwy9ARaEZBFqnH6PFOyrhTeORJZn2h9ZWYScdCfSvV4yzqQx8GZ7CfxD1P7YXX9/e3VEvM7Zf1T99PPFxGpPsaxLZjNmwTLaZ9LpfNq/Wyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768306624; c=relaxed/simple;
	bh=X82W8TC2DVFmaM/R9WhOB/aftAe583q38x3rwJmGFgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fcfktoYOtAhoQbvepmo/EVtRwzJ89HqbLaEJ8w/5TXEIRCu/hRs23H+591p0DzLsL6m1ecRMJxodG+wCH4isgP/zfxLhbMiJZs2V+aM9/mh309mIOr1Iv6UGZ/1/OWCkxvfQs5ozPfwydugmMckbxRJjcChG45c5mzu1Y6FzfSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfeY8M0W; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfeY8M0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768306623; x=1799842623;
  h=date:from:to:cc:subject:message-id;
  bh=X82W8TC2DVFmaM/R9WhOB/aftAe583q38x3rwJmGFgQ=;
  b=NfeY8M0WelOjunzSYaAT+pUjFV5SRdDkojkAh6yWV67xmaD3Z3dvZga/
   2vJ12/yK2snpE3hvzU80ZwrZDL/Q5BQwIO28GYOI1Qj4S6X6h4dRoEhub
   uuvQ4RH8p5gn9UYwewvBurbMqpshXbFoEXnqcXvPo3ZULTRCLPtnfRMSB
   ljLVuhPuVUExO4Zo1rTFV3OzmDiES2ydXz8yTTUxhTjqGPwynxspmzNEk
   27sXHvgws9J6DuBQQaH60ucRMA+sQThgOUZfRLhB8A6uTRV2Wzzp1KTuq
   Yaijbyt7Sgv09vRMUSKFX/tt9bKSVOrgyjV/8UDmJ/TfU+bbzWAjSpOA+
   g==;
X-CSE-ConnectionGUID: YHjl7+4NTOy1oWq1g+rnnw==
X-CSE-MsgGUID: nvB4HTh7TD2Y7hfNqyVv7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69571603"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69571603"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:17:02 -0800
X-CSE-ConnectionGUID: AOiWEy46S/CfqzAWI2htVQ==
X-CSE-MsgGUID: C+/zB1EfR6y5rSxZPWD2Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204259371"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 04:17:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfdKU-00000000Eiu-1dbg;
	Tue, 13 Jan 2026 12:16:58 +0000
Date: Tue, 13 Jan 2026 20:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse:
 symbol 'eu_stall_sampling_rates' was not declared. Should it be static?
Message-ID: <202601132008.VLs5aBrc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: cd5bbb2532f276626d1416b237676772bb61f11e drm/xe/uapi: Add a device query to get EU stall sampling information
date:   11 months ago
config: i386-randconfig-062-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132008.VLs5aBrc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132008.VLs5aBrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132008.VLs5aBrc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse: symbol 'eu_stall_sampling_rates' was not declared. Should it be static?

vim +/eu_stall_sampling_rates +123 drivers/gpu/drm/xe/xe_eu_stall.c

   122	
 > 123	const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
