Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CB4369999
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652918; cv=none; b=SNoA7kiMr9Ebvug7XPP579Oxm5VERbpcUMoqMQZY3VdgWXiuq/5PEM4xT4FH65ZzIGTDQug5AC37BoziARgT0d3MAE7rAhOGS9qfSK0kgtzhDXjD2SLw8Hnkf/CjbooqCfwoEktIW32L1RiPhmwa0Jj1OUQ5Rl+WMq+ZqFAYQ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652918; c=relaxed/simple;
	bh=a3zPRwwBtx5Q24R+uJk4yoLM0gmu6jv9IQO5VSIctiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j9iGYADyN7SGiFZO4LqM6iWRWTMFty2KMli8Eqw4Yk+POYw/P2DlKs4BQwT3YOSfaacnMm8Yvfs+A3PEaK1tqJqizXacn242+jzU+/Kblzm4EsGFCSs/WL8FiCaXDC5l9l8aUh27ssZs1GfxhcSaWu3bN4kpbzp/M9ogX69nNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIEmTbx9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIEmTbx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774652918; x=1806188918;
  h=date:from:to:cc:subject:message-id;
  bh=a3zPRwwBtx5Q24R+uJk4yoLM0gmu6jv9IQO5VSIctiY=;
  b=aIEmTbx9k8ZeFlQHQvs3lEUwXfej44bJwx1mOI8JWqdXvO5rtXevbvux
   iKfnNiQkEXAXap7fCpCXVVFd4k4Kv5nkAQ2E0SaNbJWOumyyGrwsYf18c
   GJZtWdKN0JVLHi5fP77CF50QTn5g1sQIHo8wHw+Bt+SGO5hyn0/J7yCb1
   WQpC5/LZzApwXouxDMw3hLNXVOkVudBGaPjadNBfEh+zSLnY0YaTkMQhO
   MWo7woweVF+hPHuEI0JtbQ+LS8wKele6yW+kyiDlmLikn/heExc6WVaUI
   0CN92qNvA0LI4UcSJqE1o+B2tC1IkFZPZN+nUN5g/HChWV1DjQfzOPRFF
   g==;
X-CSE-ConnectionGUID: SmGuLFlSQMe7biLgDGveqw==
X-CSE-MsgGUID: z3ZaAK2VThepm1VzJp55Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75931372"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75931372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 16:08:36 -0700
X-CSE-ConnectionGUID: LC7BK2VIT0eOxP9O3g4lVA==
X-CSE-MsgGUID: wPr8uhf0R2mhn+A0+I6OXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="255953376"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2026 16:08:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6GI3-00000000Arh-3GI3;
	Fri, 27 Mar 2026 23:08:31 +0000
Date: Sat, 28 Mar 2026 07:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-lajolla 1/1]
 mm/gcma_sysfs.c:11:16: sparse: sparse: symbol 'vendor_mm_kobj' was not
 declared. Should it be static?
Message-ID: <202603280646.I8ZlgPzk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-lajolla
head:   c40f273ad5fe309c9258e6bc837291ed3422eafe
commit: 3f3d84c99a6730553294bbe20941ea977fb9c437 [1/1] ANDROID: mm: add GCMA sysfs stats
config: arm-randconfig-r112-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280646.I8ZlgPzk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280646.I8ZlgPzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280646.I8ZlgPzk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gcma_sysfs.c:11:16: sparse: sparse: symbol 'vendor_mm_kobj' was not declared. Should it be static?

vim +/vendor_mm_kobj +11 mm/gcma_sysfs.c

    10	
  > 11	struct kobject *vendor_mm_kobj;
    12	static struct kobject gcma_kobj;
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
