Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95F1991C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590154; cv=none; b=LjzpuQBvcmzb+LJhLNamahHF0JCpERtyQOXkxHKGPClpW0cDmvfKokuS/STq5jkWXtgzZ+fBRHrbwiBfoi57MOJKEYCb6j1dZ22TjoNPVLK3xXw+E4BoyKj9l9EXxDS4DK+dtF4htFn/RiCOfylcSUt+l7Tq6ymFJB5vpH2wT4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590154; c=relaxed/simple;
	bh=bCw9iW9efPlgkZvHH0z2vRIhvQrQ+8J7/c25WRRNtp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Esz1s6sirmwe35i1zFhwRN66A5/q0nRdzu5uihlnVreKdNDF6YYmG4Ik6FvPbXCCOD/TDu3PfWoRVJROeXO8H+/fbMCfdIuwdp7YD2uB6zsLvGkMJjqrxMfM1epwfwZPhQWzPM1nZCAm50oTZkweuvxUibmsV7i8R8z6fQyaAU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfVISCFB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfVISCFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729590153; x=1761126153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bCw9iW9efPlgkZvHH0z2vRIhvQrQ+8J7/c25WRRNtp8=;
  b=GfVISCFBJgTTzbxZf+EbAjXtnz3wbHMjTT3kaajpcSe/FlkrLwW98Aa7
   Dh7h1FOZ0PQz1OsoYS7AjdW2puwt5koTCYvt0Kf7YPFToVr7Q3yHjVVLB
   tQCKfPOCHoLlutdfD601/4dT4eJMHFLRZ9lozYFb/KO1x0UFkpx9Af4/2
   MRG6D9F6W0fEbf9kKSKzIneVBD6msMlfI6N1X4eOFp1QGkzAqjMDiOqOF
   xMyda5++Yx7ClivqmNRKlk7LF1MiD4MZF39Tmq7BjTkFfbigtMKwnQaTR
   KFtv4E7ESoSwWyup6sAAGLeYRTRofB/mCJlvIPnpQrsc/28ADer016L0L
   Q==;
X-CSE-ConnectionGUID: aogIyUKDTjmTFnUgsx3tUA==
X-CSE-MsgGUID: nnmwQAGATOKNON9x5bOOYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29003711"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="29003711"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 02:42:32 -0700
X-CSE-ConnectionGUID: AFYfNRTOT56IdO90qVZC8w==
X-CSE-MsgGUID: GtOTYv1TTtK6kKvZ/tcl7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="84892366"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2024 02:42:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3BPG-000TOt-2g;
	Tue, 22 Oct 2024 09:42:26 +0000
Date: Tue, 22 Oct 2024 17:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1917/2444]
 include/linux/compiler.h:417:45: error: call to '__compiletime_assert_137'
 declared with attribute error: BUILD_BUG failed
Message-ID: <202410221756.RqH1lQKg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: d2b5823df5a5f45c7a047fba7eb5def6af0f8279 [1917/2444] IDXD: claim device to support HugePage/THP segment size
config: x86_64-buildonly-randconfig-005-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221756.RqH1lQKg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221756.RqH1lQKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221756.RqH1lQKg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from drivers/dma/idxd/dma.c:3:
   drivers/dma/idxd/dma.c: In function 'idxd_register_dma_device':
>> include/linux/compiler.h:417:45: error: call to '__compiletime_assert_137' declared with attribute error: BUILD_BUG failed
     417 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler.h:398:25: note: in definition of macro '__compiletime_assert'
     398 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler.h:417:9: note: in expansion of macro '_compiletime_assert'
     417 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:287:27: note: in expansion of macro 'BUILD_BUG'
     287 | #define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
         |                           ^~~~~~~~~
   drivers/dma/idxd/dma.c:394:48: note: in expansion of macro 'HPAGE_PMD_SIZE'
     394 |         idxd_dma->dma_parms.max_segment_size = HPAGE_PMD_SIZE;
         |                                                ^~~~~~~~~~~~~~


vim +/__compiletime_assert_137 +417 include/linux/compiler.h

9a8ab1c39970a4 Daniel Santos 2013-02-21  403  
9a8ab1c39970a4 Daniel Santos 2013-02-21  404  #define _compiletime_assert(condition, msg, prefix, suffix) \
9a8ab1c39970a4 Daniel Santos 2013-02-21  405  	__compiletime_assert(condition, msg, prefix, suffix)
9a8ab1c39970a4 Daniel Santos 2013-02-21  406  
9a8ab1c39970a4 Daniel Santos 2013-02-21  407  /**
9a8ab1c39970a4 Daniel Santos 2013-02-21  408   * compiletime_assert - break build and emit msg if condition is false
9a8ab1c39970a4 Daniel Santos 2013-02-21  409   * @condition: a compile-time constant condition to check
9a8ab1c39970a4 Daniel Santos 2013-02-21  410   * @msg:       a message to emit if condition is false
9a8ab1c39970a4 Daniel Santos 2013-02-21  411   *
9a8ab1c39970a4 Daniel Santos 2013-02-21  412   * In tradition of POSIX assert, this macro will break the build if the
9a8ab1c39970a4 Daniel Santos 2013-02-21  413   * supplied condition is *false*, emitting the supplied error message if the
9a8ab1c39970a4 Daniel Santos 2013-02-21  414   * compiler has support to do so.
9a8ab1c39970a4 Daniel Santos 2013-02-21  415   */
9a8ab1c39970a4 Daniel Santos 2013-02-21  416  #define compiletime_assert(condition, msg) \
c62d6b571d573c Jianping Liu  2024-06-11 @417  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
9a8ab1c39970a4 Daniel Santos 2013-02-21  418  

:::::: The code at line 417 was first introduced by commit
:::::: c62d6b571d573c73ac756831dea55ebcb7921dd1 ock: sync codes to ock 5.4.119-20.0009.21

:::::: TO: Jianping Liu <frankjpliu@tencent.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
