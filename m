Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5C3AFCF5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266264; cv=none; b=hXPwqkNuWhOr54MI3p5LQWzQ9/hApOD5Imj9jGzLq0nva58vxPWJ8oa9rLfMbXTxCS8uk8hg8GZo7/AFC6pyOSP09opk+d4YrpyIXIXxTq4JTbBMApz7skbJ23lTWNmt1zYrNXFCBIA/Xk5Sa4P62uf9YDFKK8ksinN/dD42OZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266264; c=relaxed/simple;
	bh=UbDygz7znduKhuv4/e3Em4a8nYi6Az8KTr2nSUESjos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C2RhLhcWLcUm+4/PU2PnkjMirwyrpagm4Br+Z1xXGAvv82iyp2/d3ppCP1OARhUmgaVc8LSyPYtSkfp/sBOHU1DBc+8t0OSHbptPUlDfE0tQcqV953bTzr5ushJ1W9daDZCpGreXPymBHKenbGhr7zjpitiPAnwjn1tM5r8TNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mU4+TgeN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mU4+TgeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779266262; x=1810802262;
  h=date:from:to:cc:subject:message-id;
  bh=UbDygz7znduKhuv4/e3Em4a8nYi6Az8KTr2nSUESjos=;
  b=mU4+TgeNjQBefVBbvxAbQSoc9kStDh6uc1S3/s6Zp9+tZwoFh6a34tkD
   Mw+/vj8uBt0ModGXAGgK6ZqPBLqcMRX7WHdoa2Iv8YTHLsTJfd3o6DGHx
   jq3q9tq1ZAhsDXEkPjWtwdP0UZ3la85HzUP0ChjfOm0rIhcZyJhvoFrfl
   VZsbdsx2X3oqqx7ktzqQ5mBoi7uR8VlvLYvoH4jZ2Y/0yeTAfglpyWSzW
   0SX586+uDUwBjR2AqcNQg09JkMtiigebHjbOrhb8s0mCZyPAJKdFXgeVm
   EFm83FaswdesS3nkax4N9HPa2TXyo5AcClcoZy0NOVLR6kxxxQ/fJML13
   g==;
X-CSE-ConnectionGUID: T8b8fUBoTRSEiNrpKqJvhQ==
X-CSE-MsgGUID: qoXMHyWeR6aUVAZHan842w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91626333"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91626333"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:37:33 -0700
X-CSE-ConnectionGUID: vASUHpnjRqOfbH1W6r18Ew==
X-CSE-MsgGUID: /LbkN0FvTieHxIs95qJ1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="278189380"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2026 01:37:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPcQj-00000000AU9-3wHW;
	Wed, 20 May 2026 08:37:29 +0000
Date: Wed, 20 May 2026 10:37:24 +0200
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error[E0063]: missing field `failed_bio` in initializer of
 `bindings::block_device_operations`
Message-ID: <202605201035.rW0e07cB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/blk-mq-fix-status-for-unaligned-bio/20260520-012950
head:   89ba31ad7984d07e6f2dc223b2b47ee84cf8fe5c
commit: 89ba31ad7984d07e6f2dc223b2b47ee84cf8fe5c block, nvme: add failed_bio callback for multipath bio failover
date:   15 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260520/202605201035.rW0e07cB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201035.rW0e07cB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201035.rW0e07cB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `failed_bio` in initializer of `bindings::block_device_operations`
   --> rust/kernel/block/mq/gen_disk.rs:128:58
   |
   128 |         const TABLE: bindings::block_device_operations = bindings::block_device_operations {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `failed_bio`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
