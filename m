Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55D3E4C9F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782800538; cv=none; b=YoP/4hHUN6WmQrUyZNw4XIKQtBXCMdIaudPdB7oAzuX9YM7iFSjDlwaH2+wAIuIhWdJG6AVkJeq5q2VrhXkyt7rI7UqlirlKbmOub29+XhNxQzcLNIDUQ08AktojehOjISYT+ndwkOWKyOu78nkz+y2GMJUadDwkk4Vs+qwUR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782800538; c=relaxed/simple;
	bh=BKHRaJvO1yvq1qY/lkM2Z2ftg0+XnY8ygEc8kicaEOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BDmAlc9bZpZPSBnQNP+XJsWvbNboiINq7DsF2+fxK5461c2pkBak3BOSiZoBoK5EYMvY0QFa8nzKikkfTp5wXP+TGnt6ACSoA4FOqqXFmF/gNWtpMlVOQFxk4yZUknJ6LSiDOo31FUFTeXkkjGgF7D944p/ZsULTd9tH3LDPnrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTUW78lO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTUW78lO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782800535; x=1814336535;
  h=date:from:to:cc:subject:message-id;
  bh=BKHRaJvO1yvq1qY/lkM2Z2ftg0+XnY8ygEc8kicaEOY=;
  b=PTUW78lONIYZxB6viJPcs8AZSZCMgQ+DbYBIjwOsYFcE2y4X3d8ghaaI
   4u3L6PL9l4S0HEbS2j6gaCeUISC2im+5fIhLJLG86vW0vT7P8c6dcubZi
   xokSkebbNMx038/kQ672XhIxvHyqPOzp9mHVHoV9qAX4Z0uQFgOMxrWAV
   d/7on9MKKEA2nJDqkDkjN1e/fo7mGx8uEezbTjIEkLo6W2oRybv9y2Cni
   kAxKwsja2fuHSeumeyNoqcVzyxDPdhV4yvWA1e1/WnxqN1ac5E2lXYujR
   KpBs4LSiOg5CeW+Di8Ef6ewX5qqflXggkcpUNRgwqUsgwWGRW68Do3/lc
   A==;
X-CSE-ConnectionGUID: 1yW/iaM7Tuu+/xIeWQVJdA==
X-CSE-MsgGUID: /CPZOSIZQ+Gud/k90PQwtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109054174"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="109054174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 23:22:14 -0700
X-CSE-ConnectionGUID: Yf0hawj0QBuX/sH6i/8WCQ==
X-CSE-MsgGUID: CPZ18ikQQBSsDR51Cc0Vbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248191566"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jun 2026 23:22:13 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weRrH-000000000Mj-0ZPG;
	Tue, 30 Jun 2026 06:22:11 +0000
Date: Tue, 30 Jun 2026 08:22:02 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-xs-decode 2/2]
 ./include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 2 has type 'long long unsigned int'
Message-ID: <202606300859.ghuyQN1Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-xs-decode
head:   400df87aee7b6f393e5d363d377cb5a613f8b37a
commit: 400df87aee7b6f393e5d363d377cb5a613f8b37a [2/2] arm64: mm: When logging data aborts only decode Xs when ISV=1
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260630/202606300859.ghuyQN1Z-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300859.ghuyQN1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606300859.ghuyQN1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/asm-generic/bug.h:31,
                    from ./arch/arm64/include/asm/bug.h:26,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/slab.h:15,
                    from ./include/linux/resource_ext.h:11,
                    from ./include/linux/acpi.h:14,
                    from arch/arm64/mm/fault.c:10:
   arch/arm64/mm/fault.c: In function 'data_abort_decode':
>> ./include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   ./include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   ./include/linux/printk.h:534:9: note: in expansion of macro 'printk'
     534 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   ./include/linux/kern_levels.h:9:25: note: in expansion of macro 'KERN_SOH'
       9 | #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
         |                         ^~~~~~~~
   ./include/linux/printk.h:534:16: note: in expansion of macro 'KERN_ALERT'
     534 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~
   arch/arm64/mm/fault.c:79:17: note: in expansion of macro 'pr_alert'
      79 |                 pr_alert("  Xs = %lu\n",
         |                 ^~~~~~~~


vim +5 ./include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
