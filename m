Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCB2F39C7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 05:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770442053; cv=none; b=EnHEFddUCS5ckzMhJXjvWFjp1XSylBNtyN4JTmMTjJI8qfqcvBQCcVr9Mykilu9VPRNcXf38KSi33R8gMgYsEtdWwPLSzGhnEdzhnXLaM2LCX0rX70yQLz+WPjSwj8w/NI0opEs66of1amfhf0ajja7DaCStKnYaFR6Hk/BYkf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770442053; c=relaxed/simple;
	bh=ho5ru5+baugZSUbN6FvWOZEGTiVgoQ8u4GErQM28uxs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BnkfZGPP2hHpouN6hAYHv5KCPfTkEuvTEcLvAiy2IhlzMkAVbUVydSCPtnEi0sATjMK1p16AyyyNLUfzgkC67kjyxtXbJwQ+nIrzG/8s7OJkEcQyuNt4G9eDWjb6W1io/ZN28UHVjfcm11OwdNcRjcSvCv54DAa+P4TvkHVLa2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNVs+uFp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNVs+uFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770442053; x=1801978053;
  h=date:from:to:cc:subject:message-id;
  bh=ho5ru5+baugZSUbN6FvWOZEGTiVgoQ8u4GErQM28uxs=;
  b=YNVs+uFpuKK1Ae25jJzNGjAIq4PUq7f9UuAsgGks6ROKVa4ukZGi+PAZ
   BFqwPhI2rkfZo+82f2tJk21Msm/4qZ0953fxTqf6rFgL4eABaYKcM0K5t
   apEDuDorwTDl3MN/WPUxrjFlEaT0mkGHO+HVX48yRFtr64wG/rKiKLIBU
   SLx1Nd0ENz6VqS6s/9TVp3DFQz3HWfhwHWB6dsKSmuNN6pe3l1UJDHErg
   2lATEvsXS1Bln5oVq4cIxcAD0CGHNchgpoDTJgT3CtBfYlICWYlSyywZe
   6a7nQzLJ0+RhPmbMmE4LbTH1HBC2+yT+Stp4NxjWPKuQR1DhZcr9N8Vfg
   g==;
X-CSE-ConnectionGUID: ZahM2u4NQ2CUg8US4uasWg==
X-CSE-MsgGUID: Cd7KC1evQMa0tft/v8EqhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="94293413"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="94293413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 21:27:33 -0800
X-CSE-ConnectionGUID: 77+jV0cES96PLgL9lFd0Tg==
X-CSE-MsgGUID: b6XntNT2TR+uLQ5ce7tacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="216038187"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 21:27:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voaqu-00000000lPq-13kW;
	Sat, 07 Feb 2026 05:27:28 +0000
Date: Sat, 07 Feb 2026 13:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already
 in final BE8 format
Message-ID: <202602071318.Sgn17FhB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: 916aa36042db8ee230543ffe0d192f900e8b8c9f clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
date:   5 months ago
config: arm-randconfig-004-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071318.Sgn17FhB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071318.Sgn17FhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071318.Sgn17FhB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .tmp_vmlinux1.btf.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
