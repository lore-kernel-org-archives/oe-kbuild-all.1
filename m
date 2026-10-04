Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E5417BF9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791112964; cv=none; b=f1WZ6qppTjGeWWWbvCJW18D9bE8asMUVB6fG0q2xlRrR4WXVkL5LMSxmyHbmcIOUozpQJsHRXyctDxY6vaf3TzVESgqckqN/+XhiSwA1VINWC2DP6z259qGS3cA2WwpU+l/nRLLLtm1Csikx3TeJR7MnbS6sa3ielgwsEQEQIdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791112964; c=relaxed/simple;
	bh=bfm3CYU0K5sCm5AoPsWm4DfncyoFcdiCLgk5T/Ve2/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWvg9eIO5WuBtBH/NfgzlTHxh0TLaI0bnTNV/qY+FfbWrMhvfZC7xX+WsI2HmJUkcT91F1uGvjCQ1gluHwvrlZVmHsY/kJ+wjpO2hlRHk1RgCDuyS+GDHbvBTTjiXbE4YBB3awCXXIyGLxiKQbWYCG72Gs4BbRd/A3lmnmeDaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NikoVtIk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NikoVtIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791112962; x=1822648962;
  h=date:from:to:cc:subject:message-id;
  bh=bfm3CYU0K5sCm5AoPsWm4DfncyoFcdiCLgk5T/Ve2/A=;
  b=NikoVtIkUyYovcRBDCbGolDVnCPxfMwKK4igO98ZXKxoAuCDaaPLcnd8
   NA72DV8ZxqhYTRpSCg74nzv0W8pPEhDANKnCtD8sX9JxKIPH4+V4782O4
   9DaLh0egzoVP+wGNjS1074x9kZsRreyUgQbvutuzZvjY9YsF6gBDlxJgf
   S4mbSPkCnb31YDN+O5Wfj4gTXKioxv0U7FDO/XGxVmQC/XkMPKqoUbxmt
   To9cQU3NDDoR69IZEfAGO8pHurhzghfvhy/f5rCHkqwYUpgPWdPTYhSIk
   xWsGMwL901tNvstAxKzxa0A/KrqIJUvs9BsOzxDPCzSDifIvmOAHoYPF3
   Q==;
X-CSE-ConnectionGUID: o2tajtsfQ1ubH3P7RafwcQ==
X-CSE-MsgGUID: Yc4c/wiqQqSH9LGSZ8kHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="94681618"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="94681618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 04:22:42 -0700
X-CSE-ConnectionGUID: bTMX6+nmQEmFtbZFEw0TyA==
X-CSE-MsgGUID: Q0/4MDA+SqacLfa9MofuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="272991813"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2026 04:22:40 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDKIg-000000000HD-0EEq;
	Sun, 04 Oct 2026 11:22:38 +0000
Date: Sun, 04 Oct 2026 13:22:31 +0200
From: kernel test robot <lkp@intel.com>
To: Amir Ayupov <aaupov@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:27:
 sparse: sparse: incorrect type in initializer (different modifiers)
Message-ID: <202610041344.ILNmjSYE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amir-Ayupov/coresight-Add-pmu_pulse-extout_pulse/20260930-233744
head:   2906079546bf3a56f4104268fc0912c780570e93
commit: 2906079546bf3a56f4104268fc0912c780570e93 coresight: Add pmu_pulse/extout_pulse
date:   3 days ago
config: arm64-randconfig-r2305-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041344.ILNmjSYE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041344.ILNmjSYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041344.ILNmjSYE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:27: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected char const **feat_ref_names @@     got char const *const * @@
   drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:27: sparse:     expected char const **feat_ref_names
   drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:27: sparse:     got char const *const *

vim +51 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c

    45	
    46	struct cscfg_config_desc pmu_pulse_etm4x = {
    47		.name = "pmu_pulse",
    48		.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
    49		"to count as TRCEXTOUT1\n",
    50		.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
  > 51		.feat_ref_names = pmu_pulse_ref_names,
    52	};
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
