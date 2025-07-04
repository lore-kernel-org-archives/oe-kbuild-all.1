Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3742E0930
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654672; cv=none; b=CZDeGbBUmddtx9KeHH6eSNfe9/g31+o1Baau6VUK7veUrIL8MBsNb0IM11hY0NMPx9Gw7tzEeqECgAms4QqIvglnIw95+beRig6tJDuO0wPVrPq3Qx+vdad+3Mt/+skNStJ72apC2LWt6iVeT7/clQvufjcpxVq070w+qYR9lMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654672; c=relaxed/simple;
	bh=e4dsIV4ZP17JboCADsK7dO9cqysoZqp6LcP/X6dFp7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CMdybx309vpOVYgNIiDVm2uh8ssUMAowZzpiZg0Ou3OimL+m3bY8PEP86QS0ESXvjf7Q2IMkwhz0CZBLwxd8NzAwO6ySJKf3knKRkmRd+IsanQYNbF2DnLIAzBwa0VWOPPCGGgLeAEG2Oj1QhvypScRdZhi/IQQqAHn0qy+uHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gzkqhbj8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gzkqhbj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751654670; x=1783190670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4dsIV4ZP17JboCADsK7dO9cqysoZqp6LcP/X6dFp7Y=;
  b=Gzkqhbj8LLTrtQqt58KUE6rGdwfC4fjNCYVjluN3sxnZE7/ZUAv+axqg
   M83/AHNvu6/8X8HFXoOVIHBAKHu0AffjoIED/kQ9wnpQgHnG6GQhl94h/
   nJKKMxj6K+9xeZpQCsEQT8yqVnsj7E+qbUWPpHHUeG7pk0as7yKGm8Ey9
   VOz40+b2jfxvVF8NWuEfjGFa0oI1IHSbh34fVXR3jQldCk3pn+0yMph3Z
   qAB0puQ2a1wrE8OfO8mnlY9Omf9Y6y5PLmhUCtHmOnTdi/IXJaHKVKI3I
   W6pIcnHRo8/qvJt602H3ZUhRMtUG1Poi+3VPYuruFn8nS/Y9KUx+N5bk0
   g==;
X-CSE-ConnectionGUID: mAvKiawSQ2qeFCEpeRH93g==
X-CSE-MsgGUID: KcAQrQkxTQq4JLZoOGcw3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71423263"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="71423263"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 11:44:30 -0700
X-CSE-ConnectionGUID: OtHyn2uSTQCqnEN3FhgU+Q==
X-CSE-MsgGUID: Q3/iQ36CTleNETmCJrOT/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="155178243"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jul 2025 11:44:28 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXlOc-0003zn-1P;
	Fri, 04 Jul 2025 18:44:26 +0000
Date: Sat, 5 Jul 2025 02:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464] include/linux/fortify-string.h:65:29:
 warning: '__builtin_strcpy' source argument is the same as destination
Message-ID: <202507050218.NEdtvW5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   016a2eb38be5e29bea5011bd5fed627886f59f65
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2464/2464] make OPTIMIZE_INLINING config editable
config: arm64-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507050218.NEdtvW5W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050218.NEdtvW5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050218.NEdtvW5W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:294,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/kallsyms.h:10,
                    from kernel/kallsyms.c:15:
   kernel/kallsyms.c: In function '__sprint_symbol.constprop':
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
