Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFA93AE6FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489689; cv=none; b=AFS5fOYJFxmk8KxpuXOnHXZwB7bmmOsRDMjIwMwBcm6y2Jf2dLdNyNgjXPA2q8ef6kViBCSnPHNyxrK1ULNtE0WViCi6yQihmoxeEu9Z2IdaIJa3hylzoKpnsaAmR/NCXXveNNlUno+zprBk0Y+IGMJKQio3OBqJt3jAxHIWZog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489689; c=relaxed/simple;
	bh=Nn+0xyghW8shaUrUEcac9VF2WRsVQVnfCrccY6YDlVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W8cPgsedHCrPCURoSfmenBFI1YyOqo0ve4gDayUrePGsU5N7DtKYiszC6jIGgXJQgG73dOPDbKgoDoTNuswaSO5y+iM2Wym1XrI+Pw8spj+AmJIPkmRgSyhfXfotszerbo/Ve2+rPZl3MfdAOjD44oAn2EIYAVM3a0Dj1stcp4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wd8q9T2g; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wd8q9T2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785489688; x=1817025688;
  h=date:from:to:cc:subject:message-id;
  bh=Nn+0xyghW8shaUrUEcac9VF2WRsVQVnfCrccY6YDlVs=;
  b=Wd8q9T2gPEI24Ctk48xYEQLpFchB3y+Eug2/fCvABv/4QbSjsargeyaO
   gRVGHjzgvKX/tyN4ehY4cNMODqxSwJK7Fh9ZukocRrraIwCocag89cu4Y
   6ow9PDsUuWCAsc45V31UncsBoI5rdevUcA+wHqc1AtkhRa7iSvmPIdwMA
   xDd321ZvWOxhdioY1MWgRknflUAnxNisP5mh4OumUmyonhXOhPl0xh+z7
   CSjoBDILO6J/SPfgWQds1iW6foS3iyGsho5jJdqNO4nD0BHXoa1Eo6qkY
   gNRmijSE6MCYIrO5QTKWmzWypF+wuYovw7KtI08mA9js4ZbXPBYOtxAn1
   w==;
X-CSE-ConnectionGUID: PBUzX1FaR8qkNNQcRmQRrw==
X-CSE-MsgGUID: UFEwENeEQ++AhKfsnsyJEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97629158"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="97629158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:21:28 -0700
X-CSE-ConnectionGUID: zZP0moU+T7uwuvhTue0apg==
X-CSE-MsgGUID: m3xzoW0jRXGrSjjNTix+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="264348254"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2026 02:21:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpjQi-000000000RD-1InB;
	Fri, 31 Jul 2026 09:21:24 +0000
Date: Fri, 31 Jul 2026 17:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-7.2.y 58/58]
 /kbuild/src/scripts/Makefile.clean:12:
 /kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile: No such file or
 directory
Message-ID: <202607311702.K2s3meUN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dongjin,

First bad commit (maybe != root cause):

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   b975acfb39259020dffed242fcfba388a6f4e354
commit: aadf585168240b41fc8faa32e9b150829831a44a [58/58] ODROID-COMMON: net/wireless: add Realtek Wifi drivers
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311702.K2s3meUN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311702.K2s3meUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311702.K2s3meUN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile: No such file or directory
>> make[8]: *** No rule to make target '/kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/wireless/realtek/rtl8192fu/Makefile'.
   make[7]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8192fu] Error 2
>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/wireless/realtek/rtl8821au/Makefile: No such file or directory
>> make[8]: *** No rule to make target '/kbuild/src/drivers/net/wireless/realtek/rtl8821au/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/wireless/realtek/rtl8821au/Makefile'.
>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/wireless/realtek/rtl8821cu/Makefile: No such file or directory
>> make[8]: *** No rule to make target '/kbuild/src/drivers/net/wireless/realtek/rtl8821cu/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/wireless/realtek/rtl8821cu/Makefile'.
   make[7]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8821au] Error 2
   make[7]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8821cu] Error 2
   make[7]: Target '__clean' not remade because of errors.
   make[6]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless/realtek] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/wireless] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [/kbuild/src/Makefile:2194: _clean_.] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=y] && (ARCH_MESON || COMPILE_TEST [=y]) && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (ARCH_MESON || COMPILE_TEST [=y] && COMMON_CLK [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
