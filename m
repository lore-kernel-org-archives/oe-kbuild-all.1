Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960B4130AC7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 13:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707225669; cv=none; b=lVY0VGfhAPBkCctwItJeNKf0FyNvEpQ98mGaIEx2IDxzhO2lt5CDaWeR+aYGufMjjtFstYdBINg13BG9HxJ2oI9OPYaJoqprnHmMmuzpWOEAk7+t1M03ZDRjt7uLVmE2SH9c2ItO6QEsLJMkhq1GFtPZb40tl0tQLFxO+xSqOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707225669; c=relaxed/simple;
	bh=5cwwGqp037LqAEiw9uGRMgHK4OXchXjCFK4FT4u+2Co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqIgsOx9eCPHFhA5nzBhGdUUC+24QfWcCO6/zm1o9tqK5lFHBIkVc/40NM61JoCZ/H61hjfMjqjJcrrf/5LmuWSNhiRnt835SwO7uIVljh+FNb60yJt+PcIq0TvyGghgkk93ievp4EpzC1F/EEwz9BKMiAoXKk8gPz+vfi6muTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmEqUnsz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmEqUnsz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707225668; x=1738761668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5cwwGqp037LqAEiw9uGRMgHK4OXchXjCFK4FT4u+2Co=;
  b=UmEqUnszPX07cEhxEQ47y5pdTQ+5FipVPAxF776oL+g61mBSVWlQlxjx
   9WYDxljHAw9/X2Aru0yD6Qqh0I/X93SxjtWl7bRyH5gPEGOT8ZdTZmUwO
   j5yXNvm6jTFq5XchfcmvhnQfAA8ric2m4NBwkseWwIIpU9UOgb15R0/yh
   4e8npmJOOUr4DoVDeoHZ3IwTqKhBzXVJFc3y8mgBT+iEb9blencBKmTku
   1U4kZgWUaLOmYZbZcLZV0T9c1KUzIUX+Hcy8YSzkc5cL+tCxTvcSjtqOh
   U3HhHsN/PPMvOkECUwR4djO8LB7I5BXWP6bgaZCw01CdzJtyn31o8ocUg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="895706"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="895706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1335118"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Feb 2024 05:21:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXLNn-0001Pr-0l;
	Tue, 06 Feb 2024 13:21:03 +0000
Date: Tue, 6 Feb 2024 21:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4018/4021] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data219' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data219'
Message-ID: <202402062139.MKznS4Qf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac139fc7db67968e5061715508b5fc4aa7c40c56
commit: f888a3d5a888b9b2400088e4a2e541be72ba321d [4018/4021] Merge branch 'bitmap-for-next' of https://github.com/norov/linux.git
config: powerpc-randconfig-r022-20230201 (https://download.01.org/0day-ci/archive/20240206/202402062139.MKznS4Qf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062139.MKznS4Qf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062139.MKznS4Qf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data219' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data219'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data327' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data327'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data202' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data202'
   powerpc-linux-ld: arch/powerpc/sysdev/cpm_gpio.o:(.rodata.cpm_gpio_match+0xc0): undefined reference to `cpm1_gpiochip_add16'
   powerpc-linux-ld: arch/powerpc/sysdev/cpm_gpio.o:(.rodata.cpm_gpio_match+0x184): undefined reference to `cpm1_gpiochip_add32'
   powerpc-linux-ld: arch/powerpc/sysdev/cpm_gpio.o:(.rodata.cpm_gpio_match+0x248): undefined reference to `cpm1_gpiochip_add16'
   powerpc-linux-ld: arch/powerpc/sysdev/cpm_gpio.o:(.rodata.cpm_gpio_match+0x30c): undefined reference to `cpm1_gpiochip_add16'
   powerpc-linux-ld: arch/powerpc/sysdev/cpm_gpio.o:(.rodata.cpm_gpio_match+0x3d0): undefined reference to `cpm2_gpiochip_add32'
   powerpc-linux-ld: arch/powerpc/sysdev/cpm_gpio.o:(.rodata.cpm_gpio_match+0x494): undefined reference to `cpm2_gpiochip_add32'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PADATA
   Depends on [n]: SMP [=n]
   Selected by [y]:
   - HUGETLBFS [=y] && (X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=y] || SYSCTL [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
