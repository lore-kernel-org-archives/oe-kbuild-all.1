Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399060;
	b=fvQbppfgh1egJvW/tgkk9N0ECjJb7qYOzvua3mUDYcR1m1590mFvGS5pkcSPgcanyHRp
	 tXsbX6obl7hcSXszKVg80d44gu5p1sBYvPrLfFXoqRKyh+At/dA3qgR9sLO8ZM1xZCFim
	 ffxeSBJX4U3BECmJHy/0h5IBnGQwDGCnh5BQEu3Xb/0QO1Hctp5FzDibUCF40PtIm+P90
	 grA2glnj0Mb2bIPjjbYF8IGMZG0TG3YCIdNsvAX+xmJRMqRXveMSB7pWZPnXVfkJdYkS8
	 /lPW7+ir8qQaitC4LerN6XiI9ehkSnZqc52ETD+BuyGpgUs1lwyu5Q8Z3CFJw4xR4XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=i6KYxXGx/ZsQOrZgIuM2Fz+DA8NX+nErkU65F0Ozbl8=;
	b=y8Rj04sYKA8JRX0rS9rS3K1E8g1ZMT9rbP7Cwvn0bDL65wFYF19mAI169RjWnQfPN2eY
	 v5ly75ApDQDP9E3Ya0eAjEnu4BK5xbqN2SUPhrCt/FQze+GCRDcbiaK0Bu6gaScTOSMZy
	 tXCCYFryJ6euSj18585QEYP75NK2RfPGZFyoZeXqv4nZ94mV3v0ryQ3R0/VrMaPiIj2Zr
	 WAGecd6J7TwbELZCxkmYphRg4LCfwrjf/e3TyUUP6fI9P1Lf38btr63RMKAwlsmh428EX
	 m2m6AgYQBTu5O5J3siw9+CF3FSbJ5uPWXNkR3AYkc1mLbGeisAdvuLkHVCe/Y/UufGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YMTpDorJ;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ACD606A31E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 01:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82ACD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YMTpDorJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795399059; x=1826935059;
  h=date:from:to:cc:subject:message-id;
  bh=stBfDloQOZXkdkN0MeTYrVweGJpuvSvrEE/t409N9yg=;
  b=YMTpDorJFUdjgm1jPH06N//MNS4dNEptHUpcEQ99bMWMBykd2atbARAs
   YQtoSokDTjZTjePhydpf1GtFnq/2O/gcA/IB3kOm1dwWXNxHJgOKniVi8
   V6FjxdoZU32htTBQc0mYKXF6DrMwq/348GB5s4QZQAiX5POu5Ci7RQ46N
   3dA3nNVYDMcIERSnJ6+HLpFoR4hLMIBtY9rB6qhtKP11rQb3gatmILAUF
   oB37RNYqyxF6b1qBN+wUjuzrBMeFnr2ySzy9MMgdYnRPYDhtikjGTyQUd
   5PVFzDxxa5zsR3VB+eku9QX8Uo+v3hk6bIYzcUREroqxlVgohuBX0BNj4
   w==;
X-CSE-ConnectionGUID: /lY0F5MDQlSO69Gi2NcR0A==
X-CSE-MsgGUID: IL9ctrwcQpCQyaf2ziT2dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4242008"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4242008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:57:37 -0800
X-CSE-ConnectionGUID: F6KVHfMOQDiKz1O8fppUcg==
X-CSE-MsgGUID: zShxC8TBQWGXINmmmGBgjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11260822"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2026 17:57:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVJJ6-000000004h4-2cMD;
	Mon, 23 Nov 2026 01:57:24 +0000
Date: Mon, 23 Nov 2026 02:57:02 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <20261123025048.fxzfwYXZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   93473194761869a1469683e0505517914f6b19e6
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [1/1] ANDROID: GKI: Add module load time symbol protection
config: arm64-randconfig-2002-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123025048.fxzfwYXZ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123025048.fxzfwYXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261123025048.fxzfwYXZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/module/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
   Depends on [n]: INTERCONNECT [=n] && ARCH_QCOM [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]


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
