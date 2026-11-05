Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857657;
	b=5g7YYtoTvIigPkWVQkO3mZPusqgI10HlR/WilQbwZnhLfCA/KuQX6Hvyskg+E1dekTns
	 Erjr0q3Qra+9vWacVMCkcY+xwNlZMD+RluC7EpYB7iLXk4y7GfAuyaFIbDQ9Za2bEC5O7
	 fsgKXWpoO+Dac34vRWnABCzD7wNvFCi6w2bsZFieBZY/lnh1QsmmYu+umGfNfCUw3+5MT
	 QecyuO8QyH5ENgVbj9MvBFVSU3IF2l7u/lW/4QT5cYlkhAsrf1wXHEXhEvFtr9FHIh3xD
	 ax+QQL0v41rrZkYA6182EIxV1vyC4qlNPj6q02SvT52x5ZKd77qOYcHTelNXQnoUZEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857657;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zIZwshgJGgiSoNkjltffVgCRgoTNoHMHyQKbx8JO8dg=;
	b=FBXNmf6Oi3qNrFSIR9ZO24RC5J0cgx8041YglvEf0fOE4K05DWltiRXM6C7ol0yQZBSz
	 RFTyU5GD0cPzSAxzoaglcpX6rYJLyZQDCnKh+Rd+DWxMXNQ7O7Wp9yRXpx+Ilq7aGX3B3
	 oSBG9Ex4lLHWe6FnDiw1jB+6TCFSiCieb1Ik9bHi2C0KfCIjQf1NrP5z4HDSMfVnNh72h
	 lGhietYIYalWzDDxODDUHMyAG7vClhFpfTid0HDE5ewQ3mn0SkzXsnpkRugRPyb4men9B
	 cxYolHp3yLwRrCP5b1YhEISHsW/bwaI4thIHqbG9tHghs5NrnBtCQJX5C7DGO5oAAFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEzS587o;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59F606A329
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 05:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A59F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEzS587o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793857656; x=1825393656;
  h=date:from:to:cc:subject:message-id;
  bh=+nwlpg7/cl31G3PT+Mhm5Pa4fRo/kYSHPAhUePZoRuE=;
  b=iEzS587o+WniZQnn3eP0ooLzdMkGP0w/48mAtMZiVEdFa3AKfAb/9V5u
   6/2KT695QViQIbOQDy2hcuCmjGODWmvs8M2PqnM7lRFQjWbesD9gjRqGL
   Q8uvBhwpkCnh+eXuN/EizRWIIpW/PK7t+c2KEOJpctURAaXBRqKsV7Lk6
   5fVqD8Aeh4dqvMsID5VYrggbGKV/9uMGbnltJIXC691hLJsoF+NhxHtfQ
   jCZGCKaDzYuSWpvIpQ4TK8EKxBguiDCihoCBE1b4ZxWW61ajFzwno3uDE
   MdqQ1FJVxc2ROTn87naeXab0glkD3m7CGhmccoRs4NY35uecB+FYDhXNM
   A==;
X-CSE-ConnectionGUID: 2hXJHrZ0TuaauHgPqvj2jQ==
X-CSE-MsgGUID: jCeVSclkRlakl42wqysDrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2736887"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2736887"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 21:47:32 -0800
X-CSE-ConnectionGUID: vJ3l3jpnSXS+YKN2HmuGuQ==
X-CSE-MsgGUID: lL0WNfBlSFS5CU3S6rogvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7242328"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2026 21:47:32 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqJs-000000009YN-36aX;
	Thu, 05 Nov 2026 05:47:28 +0000
Date: Thu, 05 Nov 2026 06:46:31 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1]
 mm/../drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type
 in initializer (different base types)
Message-ID: <202611050655.zysfuebB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   84593142f22a8b564defa2f3ac1f762bef70e805
commit: 398bbc0409f7586f909b17195dc4a1268d855277 [1/1] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: arm64-randconfig-r2306-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050655.zysfuebB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050655.zysfuebB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050655.zysfuebB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/shmem.c: note: in included file:
>> mm/../drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     got unsigned long
>> mm/../drivers/staging/android/ashmem.h:20:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     got unsigned long
--
   mm/memfd-ashmem-shim.c: note: in included file:
>> mm/../drivers/staging/android/ashmem.h:19:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_FS
   mm/../drivers/staging/android/ashmem.h:19:49: sparse:     got unsigned long
>> mm/../drivers/staging/android/ashmem.h:20:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO @@     got unsigned long @@
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     expected restricted gfp_t static const [toplevel] [usertype] RUST_CONST_HELPER___GFP_IO
   mm/../drivers/staging/android/ashmem.h:20:49: sparse:     got unsigned long

vim +19 mm/../drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
