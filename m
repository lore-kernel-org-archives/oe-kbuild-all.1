Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AECD11CAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723411764; cv=none; b=UjELRIcX+4n9rNomQaIep2qRDAxh8iMcxy+JxR6s4xr0VGDELrWss4Oak8E7YzmA3WFhY9Y3B9BhU0X5jn7ALcEIp8B5xKL7JVVXA3YiqGaNQraXzRyjCAJPWETqd1BGxBqf+KYQefRWByH2XN5HaEcCS713O6VBhpi3pyu+bsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723411764; c=relaxed/simple;
	bh=5EY8JzP4nXHtnfuF2OcQh8A+ZtioxdEOpGw6OnQEIPg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+PGemquQIHI+Wov86ahO7ujZoFAnoVzgIiwA0Ri+VbF1pC/JyUkO/sKOw0l17pcaB5OvwoahBQizPd+1jH/2eHwYnneke/NNJBZ/Wvu0WJmz0nPBnOYcZn4gK3ROdz1Vyl6ZmCywj/0CT9LlatdC8jPS1XoY/5KOS2TiftmG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7lgEI5L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7lgEI5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723411762; x=1754947762;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5EY8JzP4nXHtnfuF2OcQh8A+ZtioxdEOpGw6OnQEIPg=;
  b=e7lgEI5LAAVX7qyB8Msl+pRPPMHOgIIScQKF2y/G3ymQBIarInvqIlAb
   irhDG1t2xDdPtOCjuUGx4oN5t04sYMwLs2el0d1Cp51hBbh/iwwLm39aM
   QBhvqEfew6bzGQPpfketFAOKSjyba6g5YRFPxjyXLPyPHdrsEcxSLMjmB
   0y6gmbF4KrTmXirK8ld25voZXhO4TAZ/bNaoOH7flaSK+5yi3Lbu+2yF1
   e0zeP32POVBAEzOG9pKM3qJi1/NCc3C7gmRPUlQIviYZB3Fj7ebFmWNFG
   BsoTKXuNmJf2j4YwNBdzdqeKqmPOns0BRrJwkoS0upjN8daVQdI5631zL
   A==;
X-CSE-ConnectionGUID: yDke7HztTumwsvCA6KeGEA==
X-CSE-MsgGUID: mUpeXWv9RSayicqu1zljxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="24415345"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="24415345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 14:29:21 -0700
X-CSE-ConnectionGUID: m9DxYBb7RyWf2vUS3jIYSg==
X-CSE-MsgGUID: XPatmNhvQoCZmAeWZl8PZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58798680"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2024 14:29:15 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdG7l-000B9T-0u;
	Sun, 11 Aug 2024 21:29:13 +0000
Date: Mon, 12 Aug 2024 05:28:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.6.y-cicd 5/6] WARNING: modpost: EXPORT symbol
 "nr_running" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202408120510.gMdaTQgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common ti-android-linux-6.6.y-cicd
head:   2541807a1ef54deb9241788913a930d9558d38fd
commit: b62ef445ba40a459da9be87820dbab356259cc12 [5/6] ANDROID: vendor_hooks: Add hooks for waking up and exiting control
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240812/202408120510.gMdaTQgW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120510.gMdaTQgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120510.gMdaTQgW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
ERROR: modpost: vmlinux: 'nr_running' exported twice. Previous export was in vmlinux
ERROR: modpost: vmlinux: 'si_swapinfo' exported twice. Previous export was in vmlinux
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-shadow-fix1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-shadow-fix2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-demo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-mod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/livepatch/livepatch-callbacks-busymod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/fprobe/fprobe_example.o
WARNING: modpost: EXPORT symbol "si_swapinfo" [vmlinux] version generation failed, symbol will not be versioned.
Is "si_swapinfo" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "nr_running" [vmlinux] version generation failed, symbol will not be versioned.
Is "nr_running" prototyped in <asm/asm-prototypes.h>?

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
