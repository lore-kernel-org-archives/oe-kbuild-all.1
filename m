Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E237B02D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227761; cv=none; b=P3LpQJ4Ziw4HrlhNh67zD3lrIgyIcI2W6K4hAZDrRFnl70yzOTfQ4cUkITFQfj53Zh6UEVhlGIIth50eENeDRMUip8/B1KrGfhVE/EszjQkWdLj+gq9BW8aGFPa83MyXI7f63lybwwTqiKXgxp7EB0IWoD1/YNB1NsBYIVN51Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227761; c=relaxed/simple;
	bh=yzOBMS7rGRQpvA8yO/mgsLX4/ZUfrzVrv7T/NDpdVTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qzk6trWx9PAc2v0JwHSPetJge3dXhJlO/oeLv4v3+ZCunDimYhIzMe8dpThxgKbEM4vRFuPQ5r1d9ANkpFkMq9AG5jq8T4tW8hwz8yp+BqUeyRPyJZTZ4CVKnSD4TsRPYEcb3xM17Xkr5s87HDW2Z93mzQzVPCQPMc6pb5wz9oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRYlqKsr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRYlqKsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778227760; x=1809763760;
  h=date:from:to:cc:subject:message-id;
  bh=yzOBMS7rGRQpvA8yO/mgsLX4/ZUfrzVrv7T/NDpdVTg=;
  b=gRYlqKsrbtD90J39bCLRvZGu5/wBTWJQQXhx89fBEaWFqwMwsWQxZZrm
   OSb0qw8L++wEWddE5OZ6Lnk4BEENej3wc+ZRmlEdiKDR2vq8lXW9J7DLQ
   MlsDBk2Y0yI2PcIvGEivE6mqyPPqO9Kffzj7gpVxSx+XPKkyWrZ9A1czV
   +lIVoHr1QmOCcj3RL6Od0K4tQtKi0faPYNeKZarSs1P0SGcKD3QRGvpZw
   8Ye2aE9aJ5qiEyoovPdNI+S1uZl2MWL/nVZArKHIRJQiLhExVh7DqGQKM
   nndzsjNH1T7/gMFUpS7CyWsScRBV4MRnuoChCc2d0tudgtHU7SrbnLhn6
   w==;
X-CSE-ConnectionGUID: pSTfmRXFQv+7VngjebtHSg==
X-CSE-MsgGUID: hyhWeMtSRsSzB2hT76/NYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89500220"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89500220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 01:09:19 -0700
X-CSE-ConnectionGUID: AYnWXdDpTuWha7fphxcBMA==
X-CSE-MsgGUID: Cy2ejRo0S96RRj6b1I/QHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236639800"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2026 01:09:16 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLGGk-000000000qR-3Llj;
	Fri, 08 May 2026 08:09:10 +0000
Date: Fri, 08 May 2026 16:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 8/13] slot.c:undefined reference to
 `blk_status_to_errno'
Message-ID: <202605081611.mtVDV1s6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   8cda41fe2d37340341d2ae4bf15368f88b4bd5a2
commit: 520d5352ff2ee5fdb1e705c13a2ac0edd85a43d9 [8/13] io_uring: add registered IO slot infrastructure
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20260508/202605081611.mtVDV1s6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081611.mtVDV1s6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081611.mtVDV1s6-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: io_uring/slot.o: in function `io_slot_bio_end_io':
>> slot.c:(.text+0xd0): undefined reference to `blk_status_to_errno'
>> slot.c:(.text+0xd0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `blk_status_to_errno'
   or1k-linux-ld: io_uring/slot.o: in function `io_free_io_slot':
   slot.c:(.text+0x130): undefined reference to `bio_uninit'
   slot.c:(.text+0x130): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `bio_uninit'
   or1k-linux-ld: io_uring/slot.o: in function `io_slot_submit':
   slot.c:(.text+0x3b4): undefined reference to `submit_bio_noacct_fast'
   slot.c:(.text+0x3b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `submit_bio_noacct_fast'
   or1k-linux-ld: io_uring/slot.o: in function `io_register_io_slot':
>> slot.c:(.text+0x6a4): undefined reference to `file_bdev'
>> slot.c:(.text+0x6a4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `file_bdev'
>> or1k-linux-ld: slot.c:(.text+0x79c): undefined reference to `bio_init'
>> slot.c:(.text+0x79c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `bio_init'
>> or1k-linux-ld: slot.c:(.text+0x85c): undefined reference to `bio_uninit'
   slot.c:(.text+0x85c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `bio_uninit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
