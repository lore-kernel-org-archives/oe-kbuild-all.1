Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F421A434
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774667212; cv=none; b=n9ampe9eSGHQOJ1wxybQ+bXy9vRTKOJ4umHNQ9YjAHs1vxPhKzbZ/WRGY7udd/cJJDnqAasDZNemfg3vFRAUFbvsGEjBWIDI3qf+cRtYQQj5UuxXfBA7Bz2nnOT3IIpw0VlAGlRbtECHokibEgfXBgguyP9GTQ44fBqtjxoP30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774667212; c=relaxed/simple;
	bh=eOn3M+ZE4FYo1vdKvojtNLEgPtoyOPEuqNFO4E71odk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gEPaA5xq9FsOS8rOBjP8+AWNRIuVKemYFiFc7gG7YXDi3pzv92mmMzq84igXsWeGplgas7G7S4TEu0NAVKu6m1qPkx1vABrg+2nMJNO5Q7v3skTSWPYxJZnlR2+8TKEWTMDRVKwvCif5swBxjs1s2vKsMvCvrH8lBTloODgVIM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrNvgv2C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrNvgv2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774667210; x=1806203210;
  h=date:from:to:cc:subject:message-id;
  bh=eOn3M+ZE4FYo1vdKvojtNLEgPtoyOPEuqNFO4E71odk=;
  b=KrNvgv2C2AnVMA6pQPkc8g7LzskHB863Qqcz8vk40hFxXSindCxOoTPo
   j++m09QcwI+wcuKarikqbIg/lkirErThCJ1lCH/Bd+BJOgLCHfKeIpXuV
   vIiwS+scCvnQ9C64xx0tnGLObuH15oKND+kYIYmtgqS2SvgJ39qI0+1LY
   eVOZUo9ninYLNd2n1t1V4uGs5wnN5RbDlD8nM3r3S5lpfAj+PsYZ3UXD4
   CUVchEfm/g/MSmSjuNSNIzdn60LRQcJzwpmEWR0atCsWYWuu9vuC1CR6G
   K/pRFiETBp+dwlZ1Vcm9gfqpsSuMQ7Hj35IE9N04gTCDKViiNE2vcPj7g
   g==;
X-CSE-ConnectionGUID: wu07ZoscROyf1MXtdYjXIw==
X-CSE-MsgGUID: q9p80lAHRbucBmM4gIU98A==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63294166"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63294166"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 20:06:48 -0700
X-CSE-ConnectionGUID: hK8zHkQ+RxaH/mNI68Qpfw==
X-CSE-MsgGUID: jA4n/QeBQHSNUijq0+9w5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="220631695"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2026 20:06:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6K0Z-00000000B1P-3HLf;
	Sat, 28 Mar 2026 03:06:43 +0000
Date: Sat, 28 Mar 2026 11:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 2/11] Unable to generate bindings:
 clang diagnosed error: include/linux/futex_types.h:51:26: error: expected ';'
 at end of declaration list
Message-ID: <202603281103.2ONSuEAV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   263b70d20d1145dcb857409d7a21c2473365a4ba
commit: db2041e444144d9669223d77c7025c8bd2f3e17d [2/11] futex: Move futex related mm_struct data into a struct
config: riscv-randconfig-r052-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281103.2ONSuEAV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281103.2ONSuEAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281103.2ONSuEAV-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
   clang diag: include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>> Unable to generate bindings: clang diagnosed error: include/linux/futex_types.h:51:26: error: expected ';' at end of declaration list

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
