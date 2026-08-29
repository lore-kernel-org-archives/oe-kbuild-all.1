Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E3C39B4A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022293; cv=none; b=ryZjNh/UMAU4K7ZmD92sbLj1QQLUVazhrUD+X04+sFr1Gu4i/nfnNmv9ENUjVnMxuFxHblxP3DjfKbBvsKP8+zVnRZqa1U47uRANvsSfJaH9TnXETCe8Cr4rXBws0/DLbEZ2koY5wmoY5r105Gg9fi5rLMq8kUiDrne8K7cGlO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022293; c=relaxed/simple;
	bh=DDhsOYiXzVFsOhFqMrffN6Du3/4FYKC/00U6fWbmYwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PhfUoZ7eiDO8owtSURtQcxy4v8VdjHk7H7gXZAIpbvo7jaLpHO9ozsrvlbjYCudHI/vyDzP/GpcruKks+jYysRlx51n25bTLVOZllw7iMkQGkK60RPiiHEoD0maOJLWgSJlmrzAetEyHu/X8Wf3529vDr2aBRXcgTY7fWD9X5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBUUxNQ1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBUUxNQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788022291; x=1819558291;
  h=date:from:to:cc:subject:message-id;
  bh=DDhsOYiXzVFsOhFqMrffN6Du3/4FYKC/00U6fWbmYwg=;
  b=ZBUUxNQ1ZjOKwTD5DSz2qZnFByV6nuAqryr9sSt6jgXWtIWwDV5s07Tx
   TQgym4Lj2rsZe752X05yB+tLStEyI1Pn5rKevoM944BCT617lEi34XVhd
   g1EvqW+4bo85G3mKHw9zwhdzBmB4NWM0z9ezvCKwB1s1Nvhowsrikjnc4
   yrO3yv7ujdxXukYYOhWhwEht7g/o/jL2VzVHBNAnfuRHEOFZvtwCCzxSx
   buIU40P3SaVR6+r9UGTh9WWYlVNvrOKx4kGNaPMTwAcmp/YR03UVaYh7G
   gcnFmcKJIVTpJZEP/EyUex0Vxj465lwJUID2kyDdyYRfMHDOB7IDgKNxS
   g==;
X-CSE-ConnectionGUID: FREA0SCpQrGfvTYSLBsuTg==
X-CSE-MsgGUID: 2ryuSsJuSWCn4ZTf544TRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="92363907"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="92363907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 09:51:30 -0700
X-CSE-ConnectionGUID: pJrS0o4gRC6MkAfUmufjBg==
X-CSE-MsgGUID: DtZs8Q8JSf6bj9dcnUJIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="272230355"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 29 Aug 2026 09:51:29 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0MH8-000000001Qn-33hY;
	Sat, 29 Aug 2026 16:51:26 +0000
Date: Sat, 29 Aug 2026 18:50:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608291853.ESxokohw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   afea13f9ff7137797a2858fc973c226ec93866aa
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260829/202608291853.ESxokohw-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260829/202608291853.ESxokohw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608291853.ESxokohw-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
