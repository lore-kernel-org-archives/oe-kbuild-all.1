Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47443242D9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194086; cv=none; b=jfvZIpbruew7oOOSSfloygvgM9xN2bcRZo2cLeVWUN7jMFGfnEVGdUrDCGulL24d4mTSa7KrYKHg2lxR7NSN8+st+NG+/lyLKnTsxu0d+2agKBgQ4fX9DA/YiX4hqfBqzG7tsbNdTFDtTp1vvdXPV1VETLRqVq/EyUWcBp1mYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194086; c=relaxed/simple;
	bh=0V2qWT+JqJShJBxQToj7eO0I7Jlsw0WTk7hCMsJLvkI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ivFTd1HnkypvlGpJNdO7h9KP91+CMo3lSPfGdF+m10vwhZQCIpDHjDZCNmO4HUHkTtL3um1cLSmvpg926QdnOz2U/rm4eOViFfIosG9pT2ANaqOmQaJ0UXGz5HUS3GPWyv810dN2cKmJ5iG3xYTuNsF9CpsfQVdBVeiFgbVKJ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDnKi7Ui; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDnKi7Ui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781194086; x=1812730086;
  h=date:from:to:cc:subject:message-id;
  bh=0V2qWT+JqJShJBxQToj7eO0I7Jlsw0WTk7hCMsJLvkI=;
  b=PDnKi7UiffIPW+CYagQGubexWakz9flUKp7Tdyi3IBU8Za+j31aJhW9t
   6Dk9Z/YDx1Tdn/h+V+v3hf3xVuDcSrjUNT3R5njDjTmXcrlkJOSodOgR0
   7RNWVviP2QMDdNwQRnPcvPck4DwiDUDiNSTDKbRE2qgN8gGRwH1j/pLhx
   ayac6vorjHexZOUNK2wjECp+xeroKpFqWl7K6tSH2dvZ+sSKKucsG8Q9q
   xt/hoAJ58hykrJ9y7teHx/PMS35fULQ+SJmdg0EWCGUdDllWpr2bVRQxb
   NqUQtxHHxFzSeZ7J5U6gXjqiMaQZHTmeIF2c5zJHNVuRxTZmoa+UeuD5z
   w==;
X-CSE-ConnectionGUID: 0Ej6SRNKQ5+MwSKymR+Ylw==
X-CSE-MsgGUID: tU/zR1k1QD2Xh5BxLU3VuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93119591"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93119591"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:08:05 -0700
X-CSE-ConnectionGUID: aJcap9ZgR4KpP9pWMvT/Aw==
X-CSE-MsgGUID: ZwU16NrISsKdsQg90RXFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270193325"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 09:08:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXhwm-00000000NQw-0iID;
	Thu, 11 Jun 2026 16:08:00 +0000
Date: Fri, 12 Jun 2026 00:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 1/1]
 include/linux/fortify-string.h:65:29: warning: '__builtin_strcpy' source
 argument is the same as destination
Message-ID: <202606120008.0PEOssID-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   0b83df25061997edd38f428e499ba63b89abe733
commit: 26030cb984dd65e0cb2d0c2489d94941cf8897b4 [1/1] extrawarn: move -Wrestrict into W=1 warnings
config: arm-randconfig-002-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120008.0PEOssID-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120008.0PEOssID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 26030cb984dd ("extrawarn: move -Wrestrict into W=1 warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120008.0PEOssID-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/kallsyms.h:10,
                    from kernel/kallsyms.c:15:
   kernel/kallsyms.c: In function '__sprint_symbol':
>> include/linux/fortify-string.h:65:29: warning: '__builtin_strcpy' source argument is the same as destination [-Wrestrict]
      65 | #define __underlying_strcpy __builtin_strcpy
         |                             ^
   include/linux/fortify-string.h:794:10: note: in expansion of macro '__underlying_strcpy'
     794 |   return __underlying_strcpy(p, q);
         |          ^~~~~~~~~~~~~~~~~~~


vim +/__builtin_strcpy +65 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  61  
78a498c3a227f2 Alexander Potapenko 2022-10-24  62  #define __underlying_memchr	__builtin_memchr
78a498c3a227f2 Alexander Potapenko 2022-10-24  63  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel      2021-02-25  64  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel      2021-02-25 @65  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  66  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel      2021-02-25  67  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel      2021-02-25  68  #define __underlying_strncpy	__builtin_strncpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  69  #endif
a28a6e860c6cf2 Francis Laniel      2021-02-25  70  

:::::: The code at line 65 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
