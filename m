Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD63B47F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 01:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437054; cv=none; b=uq7uKWkchHmMIp9HUbkT2+YIyqtTHe21bTyI6CyeWDk1QXeQHuPgRAKMBBeHN+1UhNaiY0PaNWgYyyLByfs2jiY8vfYMK7qQfzl3JV70odJOHy0oplQaXzDEM33QZhCJi7fx2d6tceS0vsUmhd3aZDf/ny6IrEPFoKzi1oqsIEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437054; c=relaxed/simple;
	bh=nFAT832pwnzzuX43KgloHlEGnsWtJN96qtZlqMeTlss=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sxgtHpLwrqCvZYZQj8TvEJBBoDfCfnivRCgBAuqRCoxNy+4Z6POd4xgi6hBEHn9cO/uBiHNR3LtlNsF+WTSjHBUajK3j3OHyqmfYKC5oULpxcvbY9S1qqmjA4ZZxlbF4sGKe37vNr94UeLTUKFsLWmQLtDY5zIUYtTgQDGWexkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAhxjput; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAhxjput"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789437053; x=1820973053;
  h=date:from:to:cc:subject:message-id;
  bh=nFAT832pwnzzuX43KgloHlEGnsWtJN96qtZlqMeTlss=;
  b=VAhxjput/PzcJDGbv99Livm1cxVpcpB6MooVjQ0c8XPSjQyUiQgp3Ual
   dETXV30+UdJG5YTDrHXHMmvP2Iv2drw9Kjwi9hQD7n5VvUFYv+c83HBnv
   JjZb/c6JHmOnPAQ1RkOcbo00MQ2MVIzVdo0rDCkIRm19wX1vGGYXWdAoe
   jonv3LdZKVGhHzNRfXyx164JFvkjk2ZgEZJB/kINyCJn7VHkB/iRw8428
   gP7h1E+5V0dbC5izMmce1976bNkejPQZPqw8WHrEDvsR7q0V7NjPTbqDK
   XqIhAiHajQpMVxLkxxhwiUNXLJkwRCaW9tHsyiCrMTwXQt2Ps0mUPxz2G
   g==;
X-CSE-ConnectionGUID: 5BRQZGVzRXGF73uGiVUg2A==
X-CSE-MsgGUID: R5obT6JbSJKwBDy2ernSwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100388495"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100388495"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 18:50:53 -0700
X-CSE-ConnectionGUID: J3APS7TDSweoXpUMP9H3HA==
X-CSE-MsgGUID: flKWOHxSRRmXXTdPNihKbA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2026 18:50:52 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6IJt-000000000Rj-22hG;
	Tue, 15 Sep 2026 01:50:49 +0000
Date: Tue, 15 Sep 2026 03:50:37 +0200
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v6 5/13] error[E0063]: missing field
 `init_dma_buf_io_ctx` in initializer of `bindings::block_device_operations`
Message-ID: <202609150346.zarOuJo6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v6
head:   08355898806df6fd96d3f97692f443cf76d25f1c
commit: 422f4d04204a28f9e40d1fd9c65ab179d41b20aa [5/13] block: add dma-buf support for raw bdev
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260915/202609150346.zarOuJo6-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150346.zarOuJo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150346.zarOuJo6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `init_dma_buf_io_ctx` in initializer of `bindings::block_device_operations`
   --> rust/kernel/block/mq/gen_disk.rs:128:58
   |
   128 |         const TABLE: bindings::block_device_operations = bindings::block_device_operations {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `init_dma_buf_io_ctx`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
