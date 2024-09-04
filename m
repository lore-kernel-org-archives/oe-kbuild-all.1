Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFDE179654
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725493316; cv=none; b=b1iAlBDHO28zxF3dYTGlvhR+ScHrKDsgTqF09uvFbfXCcO3ZCsc+jfINBXrZ4YoVEaJEPqaG2hoCH8yrtTxH82z51piyh6lQfEVO0YHhhUDsWNLHZqHNpH81KY1ARLOTknf52epNgUh0lmeTmm918i9ZUq3BR4laewNKA57cXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725493316; c=relaxed/simple;
	bh=UbxtRU60tcejoNqmz2canED897E31HxIIYf1ThLMP3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEndwo5GKv78+ZcoJ+tYOI7ZCF9eJZDFnvb2j0Cr5v0q18r9cdhncbvKoCdiQMKmDF3iRrAEIvnzAVjWQHG3wr2pTICzms9Hl3Ke/3FeOke/yWKWUUUUyxkGGJahMUvx29ppZ9lQ1wPOgMb+D7NPaTecJNvcZFrgbNgbaOsr6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVy0KQHR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVy0KQHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725493314; x=1757029314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UbxtRU60tcejoNqmz2canED897E31HxIIYf1ThLMP3I=;
  b=GVy0KQHRkkZXoFrds431B+daxYOEgOxEJ2Nlvjm35JuIyozfNY7dAila
   biylGWwjjCYYCKqCzv9JxjCitCPZvmx2nVyTNm9yM5roUtaMgaQXHKD1E
   YikMUyQAF/5jdv4aK6rKZILusL4b9SQ9r38di/mI800saE/d0rCnQ46Wc
   hHbEhBZEdE6XZ9XO/A0N13FWe0jiXTaP2yPKUEyTpdrrhS/NC8R2B0JIu
   pN+JxRMmn1hn/gNqR83tBopyTWZ/6KX5V/OXwpQD9aLxR5Jaq537Oihwd
   E8PKV3l3alVNWADodB0TW989zS8OuQrIu6FIPGBenm69hY6X+eETQm48C
   g==;
X-CSE-ConnectionGUID: aVvhr9/iQNiF73NkiCJsmw==
X-CSE-MsgGUID: /uvK9G5wQGCAW2bgNNpkXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24378111"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="24378111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 16:41:54 -0700
X-CSE-ConnectionGUID: rmlsouX3Rnygu40n6Jl5aA==
X-CSE-MsgGUID: 0apjFQk+SCmDYHiyl6c6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="65084875"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2024 16:41:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slzdF-0008hh-15;
	Wed, 04 Sep 2024 23:41:49 +0000
Date: Thu, 5 Sep 2024 07:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 290/30000]
 include/linux/compiler_types.h:135:41: error: invalid use of undefined type
 'struct module'
Message-ID: <202409050753.nfJIOxdl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jone,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   c7d7f8476dfc40cd86018bda22cb422918195cd9
commit: b8f0143948f8c85965945691b7361f34ee848bc7 [290/30000] ANDROID: kernel: add module info for debug_kinfo
config: arm-randconfig-r121-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050753.nfJIOxdl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240905/202409050753.nfJIOxdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050753.nfJIOxdl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/staging/android/debug_kinfo.c: In function 'debug_kinfo_probe':
>> include/linux/compiler_types.h:135:41: error: invalid use of undefined type 'struct module'
     135 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:154:40: note: in expansion of macro 'offsetof'
     154 |         info->mod_core_layout_offset = offsetof(struct module, core_layout);
         |                                        ^~~~~~~~
>> include/linux/compiler_types.h:135:41: error: invalid use of undefined type 'struct module'
     135 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:155:40: note: in expansion of macro 'offsetof'
     155 |         info->mod_init_layout_offset = offsetof(struct module, init_layout);
         |                                        ^~~~~~~~
>> include/linux/compiler_types.h:135:41: error: invalid use of undefined type 'struct module'
     135 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^~~~~~~~~~~~~~~~~~
   include/linux/stddef.h:17:33: note: in expansion of macro '__compiler_offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/staging/android/debug_kinfo.c:156:37: note: in expansion of macro 'offsetof'
     156 |         info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
         |                                     ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +135 include/linux/compiler_types.h

71391bdd2e9aab Xiaozhou Liu 2018-12-14  134  
71391bdd2e9aab Xiaozhou Liu 2018-12-14 @135  #define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
71391bdd2e9aab Xiaozhou Liu 2018-12-14  136  

:::::: The code at line 135 was first introduced by commit
:::::: 71391bdd2e9aab188f86bf1ecd9b232531ec7eea include/linux/compiler_types.h: don't pollute userspace with macro definitions

:::::: TO: Xiaozhou Liu <liuxiaozhou@bytedance.com>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
