Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B246EC69
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620990; cv=none; b=kAoMX5b7UrptfFvp1l9gVwWrYvjrUvN/m4c+9wI2VQHR72qE/MuVlsRrY5abxWMnxx0sw/CFqoCIIutuBplA/DqzsV9OYkpNvdM7YpNEDbA1SUZ8ElBVAUwUFxffpH4JKseiA9kZU9Bj18i2sTHENrKjvePvRf4902cessMt2Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620990; c=relaxed/simple;
	bh=3KKoBHV6YiZXY6Z+5H12co3TOCaNwwAwwlE9esxuOGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ncFk5+4WzWLCxTDK2L/PCkP81FZjCWqd4w5F8CSImUdOnvTr3FhwWw56jNXbVscWi9JCHp9TDNZM6gBxfxBA94/cPUryBPEv5GnouT2W+tsmR75TzvD+z9GIpGWvemlDmUswJzBVIbgzZy053urzKNxm55EVk/MUyp2QqQoVciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoB0fBI7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoB0fBI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786620988; x=1818156988;
  h=date:from:to:cc:subject:message-id;
  bh=3KKoBHV6YiZXY6Z+5H12co3TOCaNwwAwwlE9esxuOGk=;
  b=KoB0fBI7mfv94UG0j5M2ABVq7HJVUMxL3yXdXmnH4CPly3EnBhKpFaip
   q/f0mhMrrr6873SzJniUc6vm34Igllnn4Jw1yqUkGHq30VR8NJzIFmaOF
   xM1x1igxLPoKzl/Te+f9Tm0ECkoqocJxkqDiC8bJ3ZVss+aAgYNtGgJdg
   Gif1cfdPa5KG40Gq24EeAcgpTqW9+CU2KnyPbNg1hvcSNOq1gidRqZX+2
   Qb/ihCzfQj/o37ytzJs+dfXc5/DUjQPGBT0yQks68PhAkKdzMhNd880K/
   WlQArF0Xw+4CprFodZp4Bd3+cIpG31oYEVZlA14YGcuzZ7vTuF4+TfAF1
   A==;
X-CSE-ConnectionGUID: dIQBimqITR6lx5nTjNgjsw==
X-CSE-MsgGUID: HdRfFq3qQGmZmjBq7mFfrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87408549"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87408549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:36:20 -0700
X-CSE-ConnectionGUID: Ou+yRDxLQgyvc7kmYrurWg==
X-CSE-MsgGUID: /5TPHdFnT5ymWK7cETjwlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="260103902"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 04:36:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTjL-00000000Tte-1oMX;
	Thu, 13 Aug 2026 11:36:15 +0000
Date: Thu, 13 Aug 2026 19:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-7.2.y 57/58] scripts/Makefile.clean:12:
 drivers/net/wireless/realtek/rtl8192fu/Makefile: No such file or directory
Message-ID: <202608131924.2WHEkCvn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dongjin,

First bad commit (maybe != root cause):

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   a105acaa179819b345f92c1de3b2628b9d1a31f9
commit: aadf585168240b41fc8faa32e9b150829831a44a [57/58] ODROID-COMMON: net/wireless: add Realtek Wifi drivers
config: powerpc64-randconfig-r122-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131924.2WHEkCvn-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131924.2WHEkCvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131924.2WHEkCvn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:12: drivers/net/wireless/realtek/rtl8192fu/Makefile: No such file or directory
>> make[8]: *** No rule to make target 'drivers/net/wireless/realtek/rtl8192fu/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/wireless/realtek/rtl8192fu/Makefile'.
>> scripts/Makefile.clean:12: drivers/net/wireless/realtek/rtl8821au/Makefile: No such file or directory
>> make[8]: *** No rule to make target 'drivers/net/wireless/realtek/rtl8821au/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/wireless/realtek/rtl8821au/Makefile'.
   make[7]: *** [scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8192fu] Error 2
   make[7]: *** [scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8821au] Error 2
>> scripts/Makefile.clean:12: drivers/net/wireless/realtek/rtl8821cu/Makefile: No such file or directory
>> make[8]: *** No rule to make target 'drivers/net/wireless/realtek/rtl8821cu/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/wireless/realtek/rtl8821cu/Makefile'.
   make[7]: *** [scripts/Makefile.clean:61: drivers/net/wireless/realtek/rtl8821cu] Error 2
   make[7]: Target '__clean' not remade because of errors.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/wireless/realtek] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [scripts/Makefile.clean:61: drivers/net/wireless] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [Makefile:2194: _clean_.] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f415 Linus Torvalds  2005-04-16   7  
4f1933620f57145 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f415 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f415 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bcc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840a Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f415 Linus Torvalds  2005-04-16  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
