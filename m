Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B244C6513
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 23:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898780; cv=none; b=CX/l6uvzdI6AbwdO2FztQHz7KTDCuSyw67Vn98OibPBLomItbhOVpFHjlgrizLI0Kd32ApAJleysR6QWGqzqUSLBtGycGgdki2uxpO4iXIBsNdss0OKezgwn6Q1ee8/sDZUxYoTA2CI106u4oVQCcAR2PWcTUan0Qgqm+kIYHH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898780; c=relaxed/simple;
	bh=PCx8Ok6rmVNoRNa7tKlWYk726ubBRXv4xCv0tqzQX64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UTg6F0uxkaUYSVb5sU4k+y3RWfWrByWTl5bsggNyoWxURdz6foLsiZO50bwX5WKayQasrtFbL/zSY8Erd4XkS0TJj9ntM7x8gpx5J8Pv6UTY4fXDsKYggzPImtMuKEa/N5UuGzZQING545hLVg3BPd3PAMNNY8PG6StshYrfdho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dj5B3v56; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dj5B3v56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790898779; x=1822434779;
  h=date:from:to:cc:subject:message-id;
  bh=PCx8Ok6rmVNoRNa7tKlWYk726ubBRXv4xCv0tqzQX64=;
  b=dj5B3v56w0q6lCWvrzRR8HE/G+QAzWRsDZCOaUsQ2E7grwWXb6ryXedw
   MJH8wpwXcHUYP2sw40YGTwqhOfex0+URxpp2kKrS3V7cJnY29PcOEe96X
   yiHAwBIPe4tlp5pDfPp+HyQxYqmlZpk6BqSx6w7PinOm6yBPle1Uk4pgm
   2OGyk0j/oZw5NIOlymnCoY5WmdYvwviuLMI07d21F3zTuSBY/Ys+YCEbB
   pRwg0fA9sGfe1y3G205v/ae73z3hZXtWMQL0MILzHvdEEeyHxeSVp88Se
   xaApUqYh6aFfJDlwgniU6akqBA0WRZmo8aqbwffvznK7BbG22rT1TGqEt
   g==;
X-CSE-ConnectionGUID: GP+yZt5bSwWnJDuXqTBU/g==
X-CSE-MsgGUID: qJx6uY1XQ9mfSvrXXIBJgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="113454357"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="113454357"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 16:52:56 -0700
X-CSE-ConnectionGUID: WTNLJlPFRqiuj0fx3z6E2Q==
X-CSE-MsgGUID: z2yGuVObRLqbXGkP9+okLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="272539343"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2026 16:52:54 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCQa4-000000000Hb-1HVg;
	Thu, 01 Oct 2026 23:52:52 +0000
Date: Fri, 02 Oct 2026 01:52:48 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 40/49] ld.lld: error: undefined symbol:
 bdev_file_open_by_dev
Message-ID: <202610020149.qkAMZQ3k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: be75423b67d512b1abdea0cc7cbef17ffd7e8040 [40/49] bpf: Add block device reads that complete into a coroutine
config: x86_64-randconfig-2200-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020149.qkAMZQ3k-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020149.qkAMZQ3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020149.qkAMZQ3k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bdev_file_open_by_dev
   >>> referenced by blk.c:94 (kernel/bpf/blk.c:94)
   >>>               vmlinux.o:(bpf_blk_open)
--
>> ld.lld: error: undefined symbol: file_bdev
   >>> referenced by blk.c:100 (kernel/bpf/blk.c:100)
   >>>               vmlinux.o:(bpf_blk_open)
--
>> ld.lld: error: undefined symbol: fs_bio_set
   >>> referenced by bio.h:366 (include/linux/bio.h:366)
   >>>               vmlinux.o:(bpf_blk_read_coro)
--
>> ld.lld: error: undefined symbol: bio_alloc_bioset
   >>> referenced by bio.h:366 (include/linux/bio.h:366)
   >>>               vmlinux.o:(bpf_blk_read_coro)
--
>> ld.lld: error: undefined symbol: bio_add_page
   >>> referenced by blk.c:216 (kernel/bpf/blk.c:216)
   >>>               vmlinux.o:(bpf_blk_read_coro)
--
>> ld.lld: error: undefined symbol: submit_bio
   >>> referenced by blk.c:227 (kernel/bpf/blk.c:227)
   >>>               vmlinux.o:(bpf_blk_read_coro)
--
>> ld.lld: error: undefined symbol: bio_put
   >>> referenced by blk.c:233 (kernel/bpf/blk.c:233)
   >>>               vmlinux.o:(bpf_blk_read_coro)
   >>> referenced by blk.c:62 (kernel/bpf/blk.c:62)
   >>>               vmlinux.o:(bpf_blk_end_io)
--
>> ld.lld: error: undefined symbol: blk_status_to_errno
   >>> referenced by blk.c:56 (kernel/bpf/blk.c:56)
   >>>               vmlinux.o:(bpf_blk_end_io)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
