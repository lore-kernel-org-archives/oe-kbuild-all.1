Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C236329D27D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782155578; cv=none; b=F+74r8CS9yQyX4S6PmZlsKCX46qbEtDHSfyLheJFa7qffo0c+VoaxJi8uv6R4uPX1YS1ijpJuzPQU90O3luo+LcF3DJocaSd7mldo0FBWdz3eq9q1HGUIUEA4ZotiECLy+v8XQVtS2b1W1YPBMc9h4qbA8fntOkG14TsLXUMa+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782155578; c=relaxed/simple;
	bh=iq81dqpgE0y15FUpO3nGD+hdhwnOCezOuJEmR1tS5lk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lU6AFILhrW5aEXfdqKETStjpZYu2tYmsiTu89gMVRFRDKtTa/+rcrjaRMYnnIpVVxPvHNYi+4ED4jCBzhk/RWVvE/oDEKFEfF5WASR3PRMzdLCCW2V6uaCEJ+7SZBPrdgEZQYRgBIkOmGRmGwhNRrAQjvmuEpYd/IGKt6DR7iBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcxVL4Mj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcxVL4Mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782155576; x=1813691576;
  h=date:from:to:cc:subject:message-id;
  bh=iq81dqpgE0y15FUpO3nGD+hdhwnOCezOuJEmR1tS5lk=;
  b=LcxVL4Mjukz3xVs5hyzaENO8U/tScdZOtHa7QCMu7pkSVMTGZKdXLGjq
   ITAexkwRpdDSwwIITuY+RsycSc8xPOzkduGgVAnSjYoE2VrymZYeLm0Va
   V76oGqntEhQewmPS9BSpQEXvxiPmXGAZzmH+mUH5LQO8xNhHCm+mMGZ3+
   38bJEtj/HxbwJ7j2oBtBDoKHEdscV1E825kkV9EAhZ1/yr1XvlJfXUSrp
   rVOHqjx1LfEN3e88SjvleXU2Q4i4J83sQFXLKYr7j7rlT8YtzjUZY/eIm
   4qNslbV4PY4e9UsfKydkveymmz1fQJBr4UvqO7tOjhkS0Ty9+Nk5d8OIl
   g==;
X-CSE-ConnectionGUID: Z/B43xMnS3SbS9EcWMSI4A==
X-CSE-MsgGUID: e4ojj1CRQ/6P5UdzPibMfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94392097"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94392097"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 12:12:55 -0700
X-CSE-ConnectionGUID: im4rQASgQeKT4nm/yTfY2g==
X-CSE-MsgGUID: dDUicBMzQPKpFKI3s87elg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="248172830"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 Jun 2026 12:12:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbk4h-0000000064T-1lVm;
	Mon, 22 Jun 2026 19:12:51 +0000
Date: Mon, 22 Jun 2026 21:12:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] htmldocs:
 ./include/linux/dma-buf.h:548: warning: Excess struct member 'nr_task_refs'
 description in 'dma_buf'
Message-ID: <202606222106.UVbcCbJN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   1e5215e6a70eb6c0c74f5549c2060354a65c80c9
commit: b1ac27dd8a57803034f8361d820e3f2580714031 [0/1] ANDROID: ABI: refresh, CRC fixups and allowed breaks
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260622/202606222106.UVbcCbJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222106.UVbcCbJN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./drivers/dma-buf/dma-buf.c:991: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
   ./include/linux/dma-buf.h:367: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'dma_buf_ops'
   ./include/linux/dma-buf.h:367: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'dma_buf_ops'
   ./include/linux/dma-buf.h:548: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'dma_buf'
   ./include/linux/dma-buf.h:548: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'dma_buf'
>> ./include/linux/dma-buf.h:548: warning: Excess struct member 'nr_task_refs' description in 'dma_buf'
   ./include/linux/dma-buf.h:585: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'dma_buf_attach_ops'
   ./include/linux/dma-buf.h:625: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'dma_buf_attachment'
   ./include/linux/dma-buf.h:625: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'dma_buf_attachment'
   ./include/linux/dma-buf.h:651: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'dma_buf_export_info'
   ./include/linux/dma-buf.h:651: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'dma_buf_export_info'


vim +548 ./include/linux/dma-buf.h

75adb09e2fd964 Greg Kroah-Hartman 2024-02-29  539  
b1ac27dd8a5780 T.J. Mercier       2026-03-05  540  	ANDROID_KABI_RESERVE(1);
b1ac27dd8a5780 T.J. Mercier       2026-03-05  541  	ANDROID_KABI_RESERVE(2);
45ae7f0b6b5f0a T.J. Mercier       2025-07-08  542  	/**
45ae7f0b6b5f0a T.J. Mercier       2025-07-08  543  	 * @nr_task_refs:
45ae7f0b6b5f0a T.J. Mercier       2025-07-08  544  	 *
45ae7f0b6b5f0a T.J. Mercier       2025-07-08  545  	 * The number of tasks that reference this buffer. For calculating PSS.
45ae7f0b6b5f0a T.J. Mercier       2025-07-08  546  	 */
b1ac27dd8a5780 T.J. Mercier       2026-03-05  547  	ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
d15bd7ee445d07 Sumit Semwal       2011-12-26 @548  };
d15bd7ee445d07 Sumit Semwal       2011-12-26  549  

:::::: The code at line 548 was first introduced by commit
:::::: d15bd7ee445d0702ad801fdaece348fdb79e6581 dma-buf: Introduce dma buffer sharing mechanism

:::::: TO: Sumit Semwal <sumit.semwal@ti.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
