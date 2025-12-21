Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F9DEEBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 00:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766276634; cv=none; b=MWeMY30bLHU2W5BcLJR05vjeI/6ycyetMhY/2bDUc1NQHgTMzEa4/iVagVV5yyYqTiTwFAUXqCToJQ2X7OG/fu8ex/mnZ1FFXhf6DCVMmJziegdtKAp+D0ccDQwhtq0HaBMX4GF1NAebBbeRF6HGrDml0uDrrEm3eA7xE2ZMCAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766276634; c=relaxed/simple;
	bh=JXg4Mr047vPdUho5LB9aE2nwtbJUWIu1U94LoKE4YyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AI133sBeIEYqwXiZoryalA0ptyklubbdpLSudOlyfsmipaloteB/ENAM/YArKxrEaw5mjKuyw2TkxgfLnYuxaVTIbvvEz4+kwsCZy0bbdMKdzubklEPpjJpPagMa317kV1clR3XTcwIB7UU5Gcnx40X4K8S/utOPB9dTYXL+YNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fh5MvwKb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fh5MvwKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766276632; x=1797812632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JXg4Mr047vPdUho5LB9aE2nwtbJUWIu1U94LoKE4YyQ=;
  b=fh5MvwKbqtFU5B22myDbG4gd94RKpeNU4lrRAliYQRaa6sHofeRyaNDm
   5Qmfq8HQRLN0yiQeux1F3V3AsfzW/iALjf2a2JoDh88GYgkordhFx/LYq
   w0mV2afNDpc/Eh3S80gHOxf/FxxXg8JErqJw4+atcZvY3LRCrb0XQfavL
   BvwEghFENn8AnfGR3etBb33VEIIS7ijVOOpSU8pPOdOatnn1emB3Yu/12
   O4PalygI2V+/e48bsurHcr6a64qOhXYpBC66707o9afkeuMam03og2m47
   1TGATD10AlsiJ9zsS+lxrtTLU2D7BywBXJC7BqPnPnLgTvCvf/GxXfzfS
   Q==;
X-CSE-ConnectionGUID: MjNmc2jQTsqRqxLCBoCL3A==
X-CSE-MsgGUID: oquMooH6RhWqkMwGrON+jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68236119"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68236119"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 16:23:51 -0800
X-CSE-ConnectionGUID: T27x8or+TEKhzFUDAQLETQ==
X-CSE-MsgGUID: NTI/6VKMTSqa1gdEUkb5xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204128126"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 16:23:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX7Ei-000000004qy-29Rf;
	Sun, 21 Dec 2025 00:23:48 +0000
Date: Sun, 21 Dec 2025 01:23:39 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 458/458]
 arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype
 for '__kernel_time'
Message-ID: <202512210122.WHWpFlcs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chiawei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   8cc11e1aa30fd981a8d5bd390a4352c37dfe543e
commit: 7bbd50f11d3086fe75fac78882de0d42e27293fa [458/458] ANDROID: arch: arm64: vdso: export the symbols for time()
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512210122.WHWpFlcs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210122.WHWpFlcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210122.WHWpFlcs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/vdso/vgettimeofday.c:9:5: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
       9 | int __kernel_clock_gettime(clockid_t clock,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:15:5: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
      15 | int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:21:5: warning: no previous prototype for '__kernel_clock_getres' [-Wmissing-prototypes]
      21 | int __kernel_clock_getres(clockid_t clock_id,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype for '__kernel_time' [-Wmissing-prototypes]
      27 | time_t __kernel_time(time_t *time)
         |        ^~~~~~~~~~~~~


vim +/__kernel_time +27 arch/arm64/kernel/vdso/vgettimeofday.c

    26	
  > 27	time_t __kernel_time(time_t *time)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
