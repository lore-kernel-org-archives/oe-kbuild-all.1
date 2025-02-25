Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466325EF8A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490757; cv=none; b=XKN1wpGRjaEo/docC9bw2IJxycHDKEke2GSn0zqoSlsbg2SNZDLAi71bUuup1mTX7IjDM1o2bBlUBNsO0X/gTKjTsB/1cn4HT3jzxsegpo0lArwEbNpLqRMy31cv2FDnZqI3cdXKqoY6S2EgvobAvDUZUvVwuVwfxpiI2M+25MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490757; c=relaxed/simple;
	bh=OVdXdLOnq+fdiLiirmQAkOKhOVGnqQaprSt27grq0Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T4ewM9eJaZ5RyguUBmXUD6f5mmITdq0rEXisIulQ0Xxz9iT59on97QrWwN1VwgNEX/s1L+B1zrGkYK166v+/WJWGtYHN2B7wl0SK23uSbBOdVHhtJYgypwLp1FiiE24zbFvJoFtokk5qUE+Uf3gKromnQLNOA/9dYua/pAIB2n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkHU4YgS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkHU4YgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740490753; x=1772026753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OVdXdLOnq+fdiLiirmQAkOKhOVGnqQaprSt27grq0Og=;
  b=IkHU4YgSZh3KMeb6QbaB6C8ufD7t0J73qpwx2OicaePU9LUaCYHfU4qC
   AtcOlwZmFXdVZe1KNVKBhbhEne/UjIfyTK3j55CVyNeWEXPXGJptFewBh
   xc+5MM7OCGZc1aTjw/WcvY0n24KouQ/Ja0x1HD+hAx/9NlocWE192dMJk
   JJH1MDexx7s9ZbywwzSHaBugEx5BS1bSN01vxW9LMUiWfaOBZUzJMCPOp
   VDGmb89RfDoHuZSKDYzNErrDeUG3gnMxeBM0v9n9Yw00YO+4+2XsRiHY0
   SEpPs1s4B1kklnyfPycCPM9qbywCavmHDLVLDpaoV+RnkjImqzGy643Cj
   g==;
X-CSE-ConnectionGUID: l0gUHxzTRSuH2qQjLv0j3A==
X-CSE-MsgGUID: zSizehVlTX6saun5cfrQqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="44118313"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="44118313"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:39:13 -0800
X-CSE-ConnectionGUID: GPfSWTXcSuqnPxxyhqNYJg==
X-CSE-MsgGUID: WbOEPZD8Rpm9/Y8wJYJQGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153580236"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Feb 2025 05:39:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmv9Q-000AIR-2u;
	Tue, 25 Feb 2025 13:39:08 +0000
Date: Tue, 25 Feb 2025 21:38:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1422/1422] kernel/time/.tmp_hrtimer.o:
 warning: objtool: hrtimer_start_range_ns()+0x535: unreachable instruction
Message-ID: <202502252117.9plCzQUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Phil,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33c097cb0d6c8c1dcf8cde0f66b1c6c907ee2740
commit: 40ecfb28732cefd0c5658f7c10543bbc4cd41cb8 [1422/1422] hrtimer: Prevent queuing of hrtimer without a function callback
config: x86_64-buildonly-randconfig-001-20250210 (https://download.01.org/0day-ci/archive/20250225/202502252117.9plCzQUe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502252117.9plCzQUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502252117.9plCzQUe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/hrtimer.c:130:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     130 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:131:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     131 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:132:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     132 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:133:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     133 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:128:27: note: previous initialization is here
     128 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> kernel/time/.tmp_hrtimer.o: warning: objtool: hrtimer_start_range_ns()+0x535: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
