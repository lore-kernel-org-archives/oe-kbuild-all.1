Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851EA3D6477
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 05:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785906049; cv=none; b=EhvXA+SFEd1SbbFkqWJVASol9HiUtd7r/eWbL9DqORdU+Jftxkl7rb7cRd67zsXZkSv4mffbA3Vq3PdWWA8L2SpsNipsHYTgoZIz3xnvtnnD4NgI725wD78sI50T/gg+MmQIr94aF9nm/KOPRTZJM0l0on5AsR4OA63vmT320h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785906049; c=relaxed/simple;
	bh=pWb+pKT0ndJTxZ2YDRImLXGSaY+L83S6fLFGuE9uoCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tk1vY1m3Lm5UF71hVtqH3/1hobrcPdgfGWPQFarS2cvFbUdOX2ithrBgc47gDPGNMERi5FsbviZrU0Ol/56DdA+KDWoayGF/nJvHJfSrrTVymuEuYSnP1Yn747g//7LoniUHht4ZpiZvkpKbNBtrXp5jqVPAKT00BCSrUh1ZnQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYnIKYpp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYnIKYpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785906047; x=1817442047;
  h=date:from:to:cc:subject:message-id;
  bh=pWb+pKT0ndJTxZ2YDRImLXGSaY+L83S6fLFGuE9uoCU=;
  b=AYnIKYpp5hSLq2J/53xF9y9DHgLNEmq9GIzsxnuNBsNmbCGoUHb6j/Z9
   93qL5MCDoQs6R5eAsK+Y9RO4bP+xRotMKriIfmA4xAcmhuloebWVTvYEy
   04jt7Y+BnWGq8GT5a2yQ1UBFFhKTUrfc3Knn7xuHHE1pwXzVnFulyOGjm
   gjl343/XuKCnUIem5QB8zxbohyPDK9w+vMy3TB/O0EDE3UaMaLPHZPaO6
   fqRD6gtRMtGDs/00C4045pdcYRO1LNSYjvfZ1q2R9htLmuv9D5x8JV/pj
   yT6MR2q/7LEYhdk7zqAJrGoO5/xKOmcuR64mTbdl7EtCmBHj62F4dnp1b
   Q==;
X-CSE-ConnectionGUID: jDTv5MH9Qmqfu0QvLqokTA==
X-CSE-MsgGUID: bIBgLpDTRRulXvbmGNdZFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86547242"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86547242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 22:00:44 -0700
X-CSE-ConnectionGUID: WCQNGBxjRNaY/7xI6jZs8w==
X-CSE-MsgGUID: ihvZuK5xTQS9T2Rqz0rzNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="258352812"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Aug 2026 22:00:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrTjr-00000000BZl-3D0v;
	Wed, 05 Aug 2026 05:00:23 +0000
Date: Wed, 05 Aug 2026 13:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 0/3]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202608051251.VBH7c4Ug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   d6098cc4b9c62a676e9cb18081352e36d55e5480
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [0/3] ANDROID: GKI: Add module load time symbol protection
config: x86_64-buildonly-randconfig-002-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051251.VBH7c4Ug-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051251.VBH7c4Ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051251.VBH7c4Ug-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/module/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/module/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/module/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
