Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C9F18CBE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725974263; cv=none; b=n8zAhh2tFdDYayXey+EgYaBKrM5lv6tinq9+ucX4n0TEJKa9HdQM6zKEvGIZCJV8ir+lPESngRjY0UBiO9OVAPJ2DWTkJx8S4BtULB9D5Njwx/BYf89BiKhU/xwkFSvMKlcugJAxbeKwrgt4JNkLawMclJcn6pbhWoowSmcbrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725974263; c=relaxed/simple;
	bh=typ/nQjvl2CfjW78+Ww10zXzDDK+2auGcO3pQxrmz4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+RBAuNjHVGUhN/mzoEl40Nv8gT3tkn7hY70Mrzo1SDdsRjo+yKHqVNvm0PEweM4Uso/SNNMjmxHsm8her3dyTdm2s5ff0AfvbDmp/i34JQLScLZJwK356LDlH/9qNu7NGGuXyTSAVy2+dBpKEeyd8ieqwwoukaqVQjnU9Ud178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL3pAtRn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL3pAtRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725974262; x=1757510262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=typ/nQjvl2CfjW78+Ww10zXzDDK+2auGcO3pQxrmz4I=;
  b=nL3pAtRn0BFHMUOmKZypSTcKakxaBPLUGqOC+CP5M/rrMm8lXBm5el8S
   V7OtQd9erv7yKy31UzzQP3ph3b7CPqd/jPXKCTFgZEHCGhVzxd0o5pX21
   bgMvh0kY4u93bs/htQ7KMzH0pimPG6mq/mqikuqZR4ZvE1rveOMby2L9J
   sqqEWt+bFMFaAYyus7M8nYVkPVdFcIWNIB1Kc9r3apz2ZQZPlhbZiweWk
   PJLdD8vYP7SXpJy+HHWxV4agr1ShNih+MXIuLyErVoK45yt9wfZNki8Ct
   Tuy3U7VNfYot1bI0V+yFzbWQmG4B87w90GyL/HPc26clACJGdvs0b4Lqv
   A==;
X-CSE-ConnectionGUID: AEC8yaEbSSaHclypQRjyvw==
X-CSE-MsgGUID: QdvhPgGwStSHJ3YuXIp3Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35290828"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35290828"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 06:17:41 -0700
X-CSE-ConnectionGUID: T9V0NzhUSpeJ34knqk1bjw==
X-CSE-MsgGUID: ew0KbiR/TvGtXAsfmirIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67271719"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2024 06:17:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so0kT-00027O-2N;
	Tue, 10 Sep 2024 13:17:37 +0000
Date: Tue, 10 Sep 2024 21:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 10104/10516] WARNING: modpost: vmlinux: section
 mismatch in reference: testdrv_probe+0x32 (section: .text.testdrv_probe) ->
 overlays (section: .init.data)
Message-ID: <202409102141.DfVbbluO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6708132e80a2ced620bde9b9c36e426183544a23
commit: 62e7b80a7ff507e83bb056dd7543f8d412e4d81b [10104/10516] kbuild: move non-boot builtin DTBs to .init.rodata section
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409102141.DfVbbluO-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409102141.DfVbbluO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409102141.DfVbbluO-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: testdrv_probe+0x32 (section: .text.testdrv_probe) -> overlays (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: testdrv_probe+0x42 (section: .text.testdrv_probe) -> overlays (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
