Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F55627732
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217699; cv=none; b=ZWnJTRxg8yNWz4MInojDqfho5ERE1QXRHp08L+A3kHZh6AkPckhRWohXvuHX1y3xobA5lNXeOm20gkutGMMFypj56j+E1yIz9JUqbIGdwKL+OgWpTuCt1Ykyxpp/cnCN+rYhCEYMa4ByN8eQzZNHqvLx59H1RS+ARKw5LT/3uTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217699; c=relaxed/simple;
	bh=pA54ykzeY+EbMzOx0V07qrMIJrfIQeOW51+A7LT+1k4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NeNXTUR6ntQlEmulx259XwPjuMYjVLxVWbbRI+DY3YdB6Uq0nuibS2Zdt5chTAJHFeuzX8rmO4XX5Slh70mQfXKH41hRSJ8u8SQqFS8FpeLo9ej4Qe6aojM2NAuXJwlemC0460NfEr+ajEQ5pBtChxKCiXdDOst4O+Vk+L39xZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXS1FvHB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXS1FvHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769217696; x=1800753696;
  h=date:from:to:cc:subject:message-id;
  bh=pA54ykzeY+EbMzOx0V07qrMIJrfIQeOW51+A7LT+1k4=;
  b=EXS1FvHBmmUu6H7g5RkoC5Rv5kMBrBTByKtZ1Ja5FpqW2j47mdVUHrsA
   rjX1P5kc1YMGiI+8i7RBxty8/k+ir2R3X542/E2BeQqPcAprvTBVVJhvS
   P6HiWXoKhpePayUPSwzGysvhS5PRkkaCKFOizDHp3eUVsazRUFqIRmtTs
   10J/w7w7ogzWsCKIoyBz8LV8pWoPPacZyztuxvtE+zlZlzWjfnIY+ogbf
   hMCPBDGivJ/dX5bQ2rA8tb08UjvKCNtCWHw1cL7i8zi2OCxoEL/Vnnick
   Dsq2yCrr8Mg/TKPvjAf3HrviwFPvpovqK+sNTpLShVD9H8moMJJbs7M/x
   A==;
X-CSE-ConnectionGUID: J0nthXpFRkSe2weZDlGEmw==
X-CSE-MsgGUID: d5eqzaZBTtWMRiw0A+Wr0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88048334"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88048334"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:21:36 -0800
X-CSE-ConnectionGUID: HuqpGt17TN2lbunVMfOh8Q==
X-CSE-MsgGUID: XGtEecAmQrKYKwj9223XXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="237819082"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 17:21:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjSLE-00000000UeE-18K2;
	Sat, 24 Jan 2026 01:21:32 +0000
Date: Sat, 24 Jan 2026 09:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: {standard input}:1503: Error: pcrel offset for branch to
 .LS0007 too far (0x3c)
Message-ID: <202601240914.AfpzAaWe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62085877ae6592be830c2267e35dc469cb706308
commit: b7c5334af69d359fcd7a39ed409a08138900ec18 drm/radeon: use dev_warn_once() in CS parsers
date:   5 months ago
config: csky-randconfig-r062-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240914.AfpzAaWe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240914.AfpzAaWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240914.AfpzAaWe-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:1503: Error: pcrel offset for branch to .LS0007 too far (0x3c)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
