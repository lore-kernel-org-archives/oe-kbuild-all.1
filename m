Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558B6342C8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813129; cv=none; b=mztF1bI5crDnh2ClDb3fKMM8/zuFK0OjYRupO4rCkIXpPXBm/zCMP8hrtVE9LNC34OE/o9wrHQOmUQLlPrX16HpODua8OXfCva/7ZpRFrx/Q4NnH3RhdAiy4tQpMv4EFuEfFEf3UlvJDp5smuSaRb/oTRFo4xPp4dwA18ATgmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813129; c=relaxed/simple;
	bh=fItXSVKHtmDSz5PyvGM6lmhez4xvQDDU+Voi97ioE/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N6CHeXZWpNX0l9IdTAzma3hYC8rkGGDV3VTunDoMWqwtIXXSHs3FQpt2X1CYdeGbx2iBBQYR8fgzPmhu3qq4dIZtwQh48dgzNCerGjwMFOK2rXq4vV3VjpSnWXWoqL5hMAei2Ab9ZENzZKPF+zhJb8QRQYKQ3EnC3BaVRTZLNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDIPAzzM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDIPAzzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775813127; x=1807349127;
  h=date:from:to:cc:subject:message-id;
  bh=fItXSVKHtmDSz5PyvGM6lmhez4xvQDDU+Voi97ioE/0=;
  b=YDIPAzzMy2rrsGgvvJ21GB0hn1wsU7ri4cWY6c3uXx0QcJl/pC9+vdM3
   U4MpKM84muxYjwFInm8eCac+0A1l86xBmPADuWG9S/w7phBEG8OLluWQH
   DjENq6LOLpL/kvcboz3nxWODc/9afSqnV+MtVNJkPG5+494wpY6YnsDzV
   ouTPYhG4i2hpLe6O/LRt0JRsOHFQ2wmo+VMAz9nPTWzOYVSK4mRvi1E8R
   q9ATFaJ991i29qCLjMwvV7/461k7sbE9sZCOVTNitR7uYw1+dUfmXB1r5
   pEzC4DIGfx4+BrtSq88jQNntMEUlI47vRdEmqUHg17cC6Qdm8usBWwwKG
   Q==;
X-CSE-ConnectionGUID: ehj+97rKQ4e+bd6nfyMRrg==
X-CSE-MsgGUID: yO8im6DtQdK0LenWlLGgoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76719990"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76719990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 02:25:26 -0700
X-CSE-ConnectionGUID: Ooax+HKnRuG6MlbqlFqpLw==
X-CSE-MsgGUID: Zuy7edUIS4+tlZEozqujvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233121548"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2026 02:25:25 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB878-000000003YU-0OXs;
	Fri, 10 Apr 2026 09:25:22 +0000
Date: Fri, 10 Apr 2026 17:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Ping-Ke Shih" <pkshih@realtek.com>
Subject: include/linux/build_bug.h:78:41: error: static assertion
 failed: "sizeof(struct rtw8814a_efuse) == 512"
Message-ID: <202604101721.fsv5XmCX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: deb3ddeb18652118956fb581a39ac299e1ee5623 wifi: rtw88: Enable the new RTL8814AE/RTL8814AU drivers
date:   1 year, 1 month ago
config: arm-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: deb3ddeb1865 ("wifi: rtw88: Enable the new RTL8814AE/RTL8814AU drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101721.fsv5XmCX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitfield.h:10,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:389,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/usb.h:5,
                    from drivers/net/wireless/realtek/rtw88/rtw8814a.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct rtw8814a_efuse) == 512);
    ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw88xxa_efuse) == 512"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/rtw88xxa.h:64:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct rtw88xxa_efuse) == 512);
    ^~~~~~~~~~~~~
--
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/net/wireless/realtek/rtw88/rtw8814ae.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw88/rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct rtw8814a_efuse) == 512);
    ^~~~~~~~~~~~~
--
   In file included from include/linux/bitfield.h:10,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:389,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/usb.h:5,
                    from rtw8814a.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct rtw8814a_efuse) == 512);
    ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw88xxa_efuse) == 512"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   rtw88xxa.h:64:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct rtw88xxa_efuse) == 512);
    ^~~~~~~~~~~~~
--
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from rtw8814ae.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                            ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
    #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                     ^~~~~~~~~~~~~~~
   rtw8814a.h:58:1: note: in expansion of macro 'static_assert'
    static_assert(sizeof(struct rtw8814a_efuse) == 512);
    ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
