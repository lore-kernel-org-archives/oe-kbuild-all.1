Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB894288C2D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281815; cv=none; b=X3jt495tKCH/OE/4UzWMs1y4XZ2bha1AdQ8SRyuogSwMoGHFEOCkFC5BzxdS+6nfdg6drV9PtVDs1CbmsIeMyrWygeHr9bcWXT6Yuigu5x17cdLxqbN+zjanmkF1yUYyKdZ1skKE60jpoEFkWhd/5juNGjre3/bCJYKVov5T6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281815; c=relaxed/simple;
	bh=QjqLrZuzoNjrWMFUhZUNKWb5gBZu+gYAQHeyQgFXRb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWMyMt+HbxLCcEqe/MSWyToql7f63TjrqEJzCxiWduyD3YNGA+4ZGcjLlwQtth0LSeWmsz+3h6WrquJgYXRdE0Dk7hH+wjK8yfd7SymPOIRAx65NiNHkHDI47uIUNLKIVREOSj3JxN7DsFaK+LDtyNY6kNmJENy//VBrEfkzbQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fss/T0Ah; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fss/T0Ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791281813; x=1822817813;
  h=date:from:to:cc:subject:message-id;
  bh=QjqLrZuzoNjrWMFUhZUNKWb5gBZu+gYAQHeyQgFXRb8=;
  b=fss/T0AhKeMpbAKxPMYQwuCo6L+OcWraFF2kUqpcAquRsZ3KkS4KRvlM
   7kCHwHmC82KmmrJSvctS1FO99zoTOwe31Gp0JmkfNi3mVADQ9cDJDYWi5
   xhYwYBejHylTct8Yks28ss8YNFfBfCepdZDNbCMGGUDNtDCZAvRRBgexJ
   RWPaPxJZljn2VhQXpt6pnPi41K8xXpKiY590l956m7PadNq6Z7p5mq6eO
   SIR0d8+2LREOl7IkiodUQM5Z6I4wVtVGYy2MZk0b6kfYorBNtA2lcq9t1
   UJaB2Z1kW3xk94xPO94QU/3oe9WP/ubZWxnJgXc/cK639MudZ70WMUTyr
   Q==;
X-CSE-ConnectionGUID: HlrkZu06QdO8t9ltJG9Orw==
X-CSE-MsgGUID: 7lAzMgdeTKamPKk19ciQ+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108340842"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="108340842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:16:52 -0700
X-CSE-ConnectionGUID: SDvQc9nfQ7GmEbuDLMbrjw==
X-CSE-MsgGUID: 7ij9eQ+YQaOxalbLlWCwLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276641350"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 03:16:51 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE2E5-0000000015n-0SL9;
	Tue, 06 Oct 2026 10:16:49 +0000
Date: Tue, 06 Oct 2026 12:16:23 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] htmldocs:
 ./include/linux/dma-buf.h:548: warning: Excess struct member 'nr_task_refs'
 description in 'dma_buf'
Message-ID: <202610061200.rOO32ldb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ccaccafbba06bcabf0a0a50910733413feb275f1
commit: b1ac27dd8a57803034f8361d820e3f2580714031 [0/1] ANDROID: ABI: refresh, CRC fixups and allowed breaks
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261006/202610061200.rOO32ldb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061200.rOO32ldb-lkp@intel.com/

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
