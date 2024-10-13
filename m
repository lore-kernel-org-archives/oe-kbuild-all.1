Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482481870
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 01:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728781413; cv=none; b=Zg75P6tcw+Lmi/L+88N1DXfwCyiv3ZBPWGEXOknPD2Y/KoC+6RTtVKMUYOMH/shZies912m2JFLo4oOz46m+qBAYUHkRkj1y4xv0hTgWCnVGgDjIAa0Q8ZEF7TpmGvqtY3ZH09gqOWCtSU4I31GGZQVKHr6wO3DUoBSNrHOrJCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728781413; c=relaxed/simple;
	bh=QcQYa1ODV6ghqEQilsh7TeDIq/lwM8eMLDSiSI+zLOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYMICfzQLRhh12vDtzbYXgZszERH9AS+o3qDeXVpol+wlH8mjp94Z6Cv2ZgoXwidK96Z5YMzWi2RxJtJR4uNH/r0mbRdq6ZBXgB9AcyaJadY9oj8I6CVX2lHRO1H3bZ4klGhUpXPtExx2u/AiOW3VhrhOzdePlIR9Lwejo80JxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb3QySbL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb3QySbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728781412; x=1760317412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QcQYa1ODV6ghqEQilsh7TeDIq/lwM8eMLDSiSI+zLOw=;
  b=Yb3QySbL8gXS6rjnCbvha3m9kFxY+G/+8zMk/AfrkFOY//vtd78EweF6
   utR6+YO8/4I/qb5WwjqLaqqt7+Nzq08vvV08HFhlvcbrqW/VSKWoBFzR1
   T1TiG7n18C36706HS06dvGNj03F52w0p2Dio8wU4wVmJdiEC8BsWGWCQn
   NSSwFgyJAU0AXslw0lvw2AT29ztG+K7JTJVMxuBIMKGXTJFAqj3zkaOQJ
   806BnG3JFhImJTLDGabgpFicJ5WBwf8yk8aLnIs1jF5OXnopan5ZJVpSz
   r9wVrxLv5+CaRWdeW/ZGjgpkd/cSuOwTu4suUX2Oq+oNRT9CQj2eaoCAv
   Q==;
X-CSE-ConnectionGUID: YUIwKuOnS92uVhuCtd30OA==
X-CSE-MsgGUID: LDEkLXQlSaaVOHvBnRIF7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28033801"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28033801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 18:03:31 -0700
X-CSE-ConnectionGUID: auB/X7fzTiido9E8dFWWbQ==
X-CSE-MsgGUID: hgUCZIdwTai4gKuG8YbkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108049958"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Oct 2024 18:03:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szn15-000Dvn-0E;
	Sun, 13 Oct 2024 01:03:27 +0000
Date: Sun, 13 Oct 2024 09:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 657/30000] ld.lld: error:
 -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.
  Try: 'ld.lld --help'
Message-ID: <202410130850.KqruMQaa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   b6fa9127e7956ef52ab962c92735504ad8055955
commit: 6f0e552d0f4018b3731866fd18f32c1295175a91 [657/30000] ANDROID: x86, build: allow LTO_CLANG and THINLTO to be selected
config: x86_64-buildonly-randconfig-005-20241013 (https://download.01.org/0day-ci/archive/20241013/202410130850.KqruMQaa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130850.KqruMQaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130850.KqruMQaa-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: argument unused during compilation: '-MD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF arch/x86/lib/.lib-ksyms.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-nostdinc' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-isystem /opt/cross/clang-3b5b5c1ec4/lib/clang/18/include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D __KERNEL__' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D KBUILD_EXTRA_WARN1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D __ASSEMBLY__' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-Werror=unknown-warning-option' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI_SIGNAL_FRAME=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI_SECTIONS=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SSSE3=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX2=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX512=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SHA1_NI=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SHA256_NI=1' [-Wunused-command-line-argument]
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?
--
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?
--
   clang: warning: argument unused during compilation: '-MD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF lib/.lib-ksyms.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-nostdinc' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-isystem /opt/cross/clang-3b5b5c1ec4/lib/clang/18/include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D __KERNEL__' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D KBUILD_EXTRA_WARN1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D __ASSEMBLY__' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-Werror=unknown-warning-option' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI_SIGNAL_FRAME=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_CFI_SECTIONS=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SSSE3=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX2=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_AVX512=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SHA1_NI=1' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-D CONFIG_AS_SHA256_NI=1' [-Wunused-command-line-argument]
>> ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument '-stack-alignment=8'.  Try: 'ld.lld --help'
   ld.lld: Did you mean '--stackrealign=8'?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
