Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B73BADAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615840; cv=none; b=OxEWsIEwZXSuNaTsPC65SXzVWIv+K2G9HV4WMzlCvCnyUh0l0+BfRDAmMTAur6zyMcEOZ8yVufaL955ZDqdzRGx9ZIZQnikTWZ2UgmmTqIcwgF9Ro2CGGuP+ORPD9+lYg6s5LvbzcOJrtallj+hYoE5uayTP/ljXwXB2RT8IsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615840; c=relaxed/simple;
	bh=tTCPdtq1osiCQSkqifhTIlBE2fEnDfJa1HWoH89UK30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uhpNrfBIrzvkm+5o3l9MgMpfmtNT0aCgTXAXm+Ztj9nLITSHAcAZCJgQOJeOjkKLS4FsrXG3ImPeoY0dvTSR31Anj+uvARki9fYHJzfazQ6F+6R4AwOSXi80DFeLnkRXb4HTo2wgFehYpQVyn3yKCuqACwR7MPUTwmTv3ZZT8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svj29cMQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svj29cMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615838; x=1806151838;
  h=date:from:to:cc:subject:message-id;
  bh=tTCPdtq1osiCQSkqifhTIlBE2fEnDfJa1HWoH89UK30=;
  b=Svj29cMQt/dnuXQlJq8VTMGICZJBb+OwnLfS0RGWZ9NOzCOVTKT3h7a7
   IX1ADXHiCVXTy/P58+V+VLPslHserhivf2RhQQvrg4v0eypm8vHNiSne1
   WeVWISRTUnbfw0qOSONQeyusWYorp6v7x92qtiAPL4mZayVupt+X1YAw1
   o+nWW1fUqRBSfYOEuhSsyWRZe+u9ZKZLPGusvUTps2IMK8HxrzZUKcBTq
   VwXFq/3A/UHM3r+aURgrs14GOQ/BpLkGVFaJr05kDhuzQlRddUaOb8cQx
   p29SZHlJDf6e6UiGwtVkv2F8dQIoWJ+kEsKqrjoFo2d2b+YxPtowlHbFl
   g==;
X-CSE-ConnectionGUID: iFfwK+Q1Ry695NTg3ZfTWw==
X-CSE-MsgGUID: yxQgCSQVSE2d4IyiLW2EpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85994215"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="85994215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:50:37 -0700
X-CSE-ConnectionGUID: PhOeTEPnQ+u5dsN3wFZ3Ig==
X-CSE-MsgGUID: cFGJO69nSuWe3yvuJdpQAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="230077062"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 05:50:36 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w66e2-00000000AIh-02ti;
	Fri, 27 Mar 2026 12:50:34 +0000
Date: Fri, 27 Mar 2026 20:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 14/14]
 drivers/staging/android/ashmem.h:20:20: warning: 'RUST_CONST_HELPER___GFP_IO'
 defined but not used
Message-ID: <202603272004.INrMqir8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   453cb76c605cfc3405a95bee4888782c7218b92a
commit: 453cb76c605cfc3405a95bee4888782c7218b92a [14/14] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260327/202603272004.INrMqir8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272004.INrMqir8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272004.INrMqir8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/android/ashmem-legacy.c:28:
>> drivers/staging/android/ashmem.h:20:20: warning: 'RUST_CONST_HELPER___GFP_IO' defined but not used [-Wunused-const-variable=]
      20 | static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/android/ashmem.h:19:20: warning: 'RUST_CONST_HELPER___GFP_FS' defined but not used [-Wunused-const-variable=]
      19 | static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/RUST_CONST_HELPER___GFP_IO +20 drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
