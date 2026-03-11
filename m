Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA513B58C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 01:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773191631; cv=none; b=pEJEm/BKW8v+fgIdxkGzPM+h2jQ7D3jlS+w/G7R4zlBeYKxoY47QCplHOY/w/L0Z3SjucefZStxgdJBnS0DPSFxHpCx1O8ndcqdHjJyyZTsKIIjT1IfU3I0VzGDjyGM/3+HVM4Ea5DZfLw7zJnyqjIGcRjpLefWwplWqay8w/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773191631; c=relaxed/simple;
	bh=CHYe96MeAqMnw6GsCFWB/AlQykyLeLA1PdYT88jcg0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BnaoPpTlSIYsx5ZSo0fSFY2mtuJzlfapVnhQc2ELBxMwz/wkt/1zREs7PvmuKekG/9QEaeqUX128NztYfP+V1s+6kuB6y9Ls1UGf4U+BDeJliRlxUSEWYqnHLnqIbhO4c6QMV9VIgTYaegn9Suk5GoixgyXHuJTGz6cjRp15dcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcxSKc73; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcxSKc73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773191629; x=1804727629;
  h=date:from:to:cc:subject:message-id;
  bh=CHYe96MeAqMnw6GsCFWB/AlQykyLeLA1PdYT88jcg0o=;
  b=BcxSKc73Cofaie90kDXW8MyijHHygBXmqOds5kQnZMCGjaWP1hvwSF9/
   +wiZkYyIVd7ZZswX0QG94HMl9NBj9BGn/X8tkJOErQDD5oXDSV9aqrvz6
   ZzjfLFaOVC3G3q+yxNpzsXM2p73/rclRDwutkTYUh1SExQwhUTnHHyzzc
   DXjD0uFQk/U/o47pQh5W5W+ErPq4Ba2QCQvl1OtjhUCFXUyAV4PD1HENY
   TI4/M/s3YrK2xtu4MnJCrcKQR/kxMqfIcvcUISq7bg/VUFO+HqBY+rPpt
   mNe4gafNEzeMUng2yMvh8xW0cHsRXtis9pLD+APh87hdFm53qIuO4fwLp
   w==;
X-CSE-ConnectionGUID: NOGxw2xZRFWYZH59O2ho2g==
X-CSE-MsgGUID: gjyVw+EITJW488oTxJVySA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84959333"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84959333"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 18:13:48 -0700
X-CSE-ConnectionGUID: +kmNkclVSTO6XYoskvoA/w==
X-CSE-MsgGUID: LaanXaG3TZ6f3m8Jw3Lh4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="222853617"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Mar 2026 18:13:46 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w088u-000000003BR-1QR6;
	Wed, 11 Mar 2026 01:13:44 +0000
Date: Wed, 11 Mar 2026 02:13:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17] htmldocs:
 ./include/linux/dma-buf.h:548: warning: Excess struct member 'nr_task_refs'
 description in 'dma_buf'
Message-ID: <202603110231.iozMACBQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   6ca2c2288ee8399eaf9532746cdb562577e09565
commit: b1ac27dd8a57803034f8361d820e3f2580714031 [17/17] ANDROID: ABI: refresh, CRC fixups and allowed breaks
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260311/202603110231.iozMACBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110231.iozMACBQ-lkp@intel.com/

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
