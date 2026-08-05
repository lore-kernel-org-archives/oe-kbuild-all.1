Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB913DDDD2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911976; cv=none; b=aScRwdKQyXwxmDJrSmr+QYwD6u62jq4Eqsu+eWLhKnKJ+6phy+Scy3sFmDV7S+4ObPeH/1dx+fzMOy5kF72CrB5o02lPOveWFwgwpk919uyQEekn6QLDcTRUrkp2O+irsuUDTIKlxkFluLPJX0/k32zv6g7c4teTT2dIayMlym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911976; c=relaxed/simple;
	bh=9qP0ESRfkQXwCO4fP89W3jJJRsAtqIa2l/9KNhl29Lw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Znme0HdAhkGd8vD8ZEiOspX1Ha8rWAr6VCdrfMzFlgbe8YkuNxFzuawgbNJFLpEtRgG4/UMAgIHmV1bYNqWBOHTrChIqZpBPrFRFGOqu6/ymr5pXflpw0uXwolqc8Q3ZXdXuDDC9B16134WBm1y3tU01TODzqW8DR9H6fZdng0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2Ua0IZE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2Ua0IZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785911974; x=1817447974;
  h=date:from:to:cc:subject:message-id;
  bh=9qP0ESRfkQXwCO4fP89W3jJJRsAtqIa2l/9KNhl29Lw=;
  b=W2Ua0IZEQRorbLO+5g8WGeL1+EzR1JiPxF6SBytdBVmGVbYwl9BWxYyU
   5BLavUVthQe2Ujd4ma6mIHaYNmIwuVbMDHMS4/X5/yepPy2DuUiKHuH1I
   DJz6GGbMLSHas//C9LQ19mYYExRx7LZcp6AekILbmdX3zSGxkm0DOYUAi
   tF+82msxtchhrLhTn5d2S2UTmnXotKvpYf2CHDEbreKE19SpC4NmsLlmt
   nGk1h50MfqwVro/Ui1OJl8Rle4Kep5v61VADOMfEvElU5xORCnvTXPVAG
   OZv0OaEdlr3AjjjQNyS30wrWy70NeutOP1/1CVd9Hq/eiIvi+KO+FyTEv
   A==;
X-CSE-ConnectionGUID: k66Pgp41T8mjqtx9Mt4/bQ==
X-CSE-MsgGUID: qJ12c8t6Sv+k8VPO8S3ckQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="112027916"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="112027916"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 23:39:33 -0700
X-CSE-ConnectionGUID: IYVom5ynS+mrQjkQBLx+9g==
X-CSE-MsgGUID: 3ewUqNBBSXSlB7f2EipvCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="257415442"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2026 23:39:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrVHl-00000000BmH-0z1K;
	Wed, 05 Aug 2026 06:39:29 +0000
Date: Wed, 05 Aug 2026 14:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 kernel/gki_module.c:35:6: warning: no previous prototype for function
 'gki_is_module_protected_export'
Message-ID: <202608051444.3WgBa7OZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9ed6d24476a19dbfb33c7d2b53c623b054bb285f
commit: fd1e768866606ff230280f26faca797bb47bd8c0 [0/1] ANDROID: GKI: Protect exports of protected GKI modules
config: x86_64-buildonly-randconfig-002-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051444.3WgBa7OZ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051444.3WgBa7OZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051444.3WgBa7OZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:356:9: note: previous definition is here
     356 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/gki_module.c:35:6: warning: no previous prototype for function 'gki_is_module_protected_export' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_export(const char *name)
         |      ^
   kernel/gki_module.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | bool gki_is_module_protected_export(const char *name)
         | ^
         | static 
   kernel/gki_module.c:46:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/gki_module.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/gki_is_module_protected_export +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_export - Is a symbol exported from a protected GKI module?
    32	 *
    33	 * @name:	Symbol being checked against exported symbols from protected GKI modules
    34	 */
  > 35	bool gki_is_module_protected_export(const char *name)
    36	{
    37		return bsearch(name, gki_protected_exports_symbols, NR_PROTECTED_EXPORTS_SYMBOLS,
    38			       MAX_PROTECTED_EXPORTS_NAME_LEN, cmp_name) != NULL;
    39	}
    40	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
