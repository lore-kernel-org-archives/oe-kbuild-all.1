Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC7246BCD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 20:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320447; cv=none; b=u9Qw/SRkfadvBLaLE0qZx06nC7BFLu6t3JX9lK8fzn3u+G2/6G7JeSXcUWfh9nCWWEEa42f5m6cFIqftWdeDW19pL21CMmkKyOZ68iLyAPKFGoT9kK3jW4ahVkdxoWRHoLkcEd+MnJFv0xJwA34mhPMWPEAqPOXUS8CyD8FsRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320447; c=relaxed/simple;
	bh=SeHtG6uY6iikVUQfbslnLQgx1R+HHS/7800bptla9dM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QtjkMYwDeD7YSIeUvM8ZgiCeJnn60lObQ6a4CVZxKqIqq4At00k6Fr0RZTfIiCJbOasyAQf/jnIOfgmYXxSZI+KT6XyKBL4xAN9oiKFGDeJbNcpX9LbJOhSR4njhygGnB/8wdu55Db7qPGu6TOLNpIamVKS2xZ8XkiRpiDlsLCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fs4zZQMn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fs4zZQMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784320446; x=1815856446;
  h=date:from:to:cc:subject:message-id;
  bh=SeHtG6uY6iikVUQfbslnLQgx1R+HHS/7800bptla9dM=;
  b=fs4zZQMnlyeelgmvMmOllE+QtgsdYD4p2oO7+oFGcd493i6BJrgNVbXv
   ue/IqRRTcbuFS6ak9WrmJkPHGJrlzedtz377gT5BArVLG+lZcr6JBPRQl
   LXFZI7r0h8eT1DYr2xgaqSWuQZosNmXKiSPg/hToaphq7BNQN4cA1uRvU
   bi6MTzc0DOtKN2gxbzwTCieWMkHnAwEsPIg0Fnxgjf90Ccqn6oUfHxZFl
   qepnHsvMJbczVYKLlFPWcCWrkZvalFAzfoCG7UpIPgYl2k6GQYjvIqKuK
   0CYprOsVvd0B99daznDEUmDmr7zY2fhCF7AVSMknsAsi0SPd+IUmO8/kb
   g==;
X-CSE-ConnectionGUID: sDUAul75QCqPKp64+0W8QQ==
X-CSE-MsgGUID: cl+lefQJTbGf92uCX8I9Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85113903"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85113903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 13:34:05 -0700
X-CSE-ConnectionGUID: 2P9/r7bOSuyRAvRceL19zA==
X-CSE-MsgGUID: VX2ObxrMSQC8tmB+nXrssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260682451"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Jul 2026 13:34:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkpFx-00000000T99-3LGD;
	Fri, 17 Jul 2026 20:34:01 +0000
Date: Sat, 18 Jul 2026 04:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/2]
 drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202607180400.w0WyDK3j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   c1c755fdcb2770dd57e4b5b80bb3683adf9330f4
commit: 398bbc0409f7586f909b17195dc4a1268d855277 [0/2] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: i386-randconfig-061 (https://download.01.org/0day-ci/archive/20260718/202607180400.w0WyDK3j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180400.w0WyDK3j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180400.w0WyDK3j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/android/ashmem-legacy.c: note: in included file:
>> drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   drivers/staging/android/ashmem.h:19:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   drivers/staging/android/ashmem.h:19:49: sparse:     got unsigned long
>> drivers/staging/android/ashmem.h:20:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   drivers/staging/android/ashmem.h:20:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   drivers/staging/android/ashmem.h:20:49: sparse:     got unsigned long

vim +19 drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
