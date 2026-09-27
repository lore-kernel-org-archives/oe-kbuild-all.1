Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149B54704C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512482; cv=none; b=ekHnH16Zwqt21OU9VkRGlxJOL+CnNYlblZDOXHJ7JBH05EU5+VjvkMVRJZUxMRNS2MffFAg5Rt9UzgKOK+8tyvE1ZqG1gd14Uw7XBE8ba05OQU8ArO1Zwszi/BwmACr+XpaUQvKgJ617U14zaSIS/P1RFLCV0f2+s5KXJg4Sy2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512482; c=relaxed/simple;
	bh=byai12JLpRSDbCNl2hK81fCeczJy13IgM45/h9BkLrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CpyuRqMW5UgCT/qwpF5mjmAXvpEdgVZgHw+hj8CZy+NsBzIGAgE5ucLz648UuteFffjV3JOvwvlg9hiKTpp/nYjT4W6yX+OJ7bwDmXknKrmF1nR6INijDsJY9l6H0ta95jmtVPYb8cQwtM9Ty/Oq3J4oXVJWZLHZbh4QN1eNUsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GR1VfAyQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GR1VfAyQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790512480; x=1822048480;
  h=date:from:to:cc:subject:message-id;
  bh=byai12JLpRSDbCNl2hK81fCeczJy13IgM45/h9BkLrA=;
  b=GR1VfAyQ0EH34Bq8IyHBgmfoQjzCbSta+4JeUjUNdaNzV0cEapFdSlke
   ku00G1C/NAPC2uig/CE1fdW0RTu39Gcl9dRxNckMBv9WHLvXJMoaxy18t
   /FmEBVbiVxcQ2WVG7fBFCm6a7YHJMhK63sZa7e7H3o+msTcdWcV202GSL
   cospyeERgdXj0sd/anyYz8/0Td+LtI0Kh+RDmV2QjRe5TCOpifTgawogj
   4eDdHXGP6qMAl1qMMt+d4jC/X66IJdoVbQSmfk4kQgDwxHQnkPUl5sgfi
   aYPdyHfjAbdK2flWw6F7tqVWo5n1jMpgPMTjxjbHk06S04zr0YvRxMXKF
   Q==;
X-CSE-ConnectionGUID: z2UsrYCBTQ6WJUgLbXLEkA==
X-CSE-MsgGUID: DXUHYKraQt2YHgChCsYVcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="100564235"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="100564235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 05:34:40 -0700
X-CSE-ConnectionGUID: VIoyrJTySSi2832i5JaJLA==
X-CSE-MsgGUID: z6ZAVtFBTVae17dEGiovNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="312725058"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2026 05:34:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAo5V-000000000Zj-0rel;
	Sun, 27 Sep 2026 12:34:37 +0000
Date: Sun, 27 Sep 2026 14:34:14 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 0/1]
 drivers/gpu/drm/i915/i915_gpu_error.c:692:3: sparse: sparse: symbol
 'guc_hw_reg_state' was not declared. Should it be static?
Message-ID: <202609271401.v3QwNzQG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   51961f334da24f5cfbbc50030779d37e98f2ec5d
commit: ba391a102ec11ab7f5b249e46dcf61ef836a57e7 [0/1] drm/i915/guc: Include the GuC registers in the error state
config: i386-randconfig-2301-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271401.v3QwNzQG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271401.v3QwNzQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ba391a102ec1 ("drm/i915/guc: Include the GuC registers in the error state")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271401.v3QwNzQG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_gpu_error.c:692:3: sparse: sparse: symbol 'guc_hw_reg_state' was not declared. Should it be static?

vim +/guc_hw_reg_state +692 drivers/gpu/drm/i915/i915_gpu_error.c

   687	
   688	/* This list includes registers that are useful in debugging GuC hangs. */
   689	const struct {
   690		u32 start;
   691		u32 count;
 > 692	} guc_hw_reg_state[] = {
   693		{ 0xc0b0, 2 },
   694		{ 0xc000, 65 },
   695		{ 0xc140, 1 },
   696		{ 0xc180, 16 },
   697		{ 0xc1dc, 10 },
   698		{ 0xc300, 79 },
   699		{ 0xc4b4, 47 },
   700		{ 0xc574, 1 },
   701		{ 0xc57c, 1 },
   702		{ 0xc584, 11 },
   703		{ 0xc5c0, 8 },
   704		{ 0xc5e4, 1 },
   705		{ 0xc5ec, 103 },
   706		{ 0xc7c0, 1 },
   707		{ 0xc0b0, 2 }
   708	};
   709	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
