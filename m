Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55FF26E6F2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 06:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691044; cv=none; b=ZIm+rdFDzwO6g2FpN3pGQl3krejgJfq188ob/HsRqb7azw0EOjg5DYi0/W+T7mgrYR9xnEmAx5b0Whtzw1b6Zg8BqEirfNrip8stXrDtYZm3NIYUCzpfZ2ttO1/XCEjc+ZBGUC9h3cMHm3OzFfg4AnCbDQrCvZWZrIKxT+6E38M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691044; c=relaxed/simple;
	bh=IUji2mnUNSFEoK3a2Xfm/n2k5APl+7vfWs6TyDO5LZM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iRfIoMYNe19Vg8vV+rS1jQ24AZKHRHG12pXsDgzAAfMsPbref5QvMcKvdIwuqlCe5UW48zSnTc1DmKmSj3S3WoncY2rQTGhJ1qDayLjPvhvqHduG6Cat6jC+OavvDixCnrUZOWSxWb4uQJtOso61cM5dtSHWeb/TMYCvDd5V3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0MCpSSa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0MCpSSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772691043; x=1804227043;
  h=date:from:to:cc:subject:message-id;
  bh=IUji2mnUNSFEoK3a2Xfm/n2k5APl+7vfWs6TyDO5LZM=;
  b=l0MCpSSal/npiTQmGmqATvWVqU7JJTfyXVm0yyyxRs1ffSYCdJptfkML
   w3Gcc4t6yUMoiQyjtlek5/CoVxMqn0PsvvwIjufjXs1KgMQuxrWFw86Jc
   lxf7R0zw66j2YM4TReAzjsdCGaU4n9m+mqEWHILro6zoMSB05zUft1gT1
   +Ex726W659D9SHXI0+/146uGlUUKvKgZQRcd9nuPDItVn+aV9+yxw2CZB
   42Xuj6gqwVqCkej32r1/YVWlr93UmGYnfiyPtW2bxDYxobfY2I2g8BJsX
   6oqWIy8iQ8+Cq4UIEpZaMvpjr+QW/V/YjgnQD+Eopd0fjcfa+coSTrHhI
   g==;
X-CSE-ConnectionGUID: 9350Mm3tSS2c4xR2wo0RMA==
X-CSE-MsgGUID: f0wogroaQPeoPcEbnaeP9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84853440"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84853440"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 22:10:42 -0800
X-CSE-ConnectionGUID: A815avG/RyukjF0iyX1H6A==
X-CSE-MsgGUID: C3SgMgH9Td2Ax55wqBXnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="222731184"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 22:10:42 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy1ux-000000001xl-1YpH;
	Thu, 05 Mar 2026 06:10:39 +0000
Date: Thu, 05 Mar 2026 07:10:04 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 2/24] warning: unreachable `pub` item
Message-ID: <202603050640.sYZQvdDq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   1332f2111dd980926c1437960a555ac5e2049edc
commit: 975169ffd1f36d4847b08d9994e2059be762eaa5 [2/24] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260305/202603050640.sYZQvdDq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050640.sYZQvdDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050640.sYZQvdDq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unreachable `pub` item
   --> rust/kernel/gpu/buddy.rs:562:5
   |
   562 |     pub fn offset(&self) -> u64 {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
   |
   = note: requested on the command line with `-W unreachable-pub`
--
>> warning: unreachable `pub` item
   --> rust/kernel/gpu/buddy.rs:568:5
   |
   568 |     pub fn order(&self) -> u32 {
   |     ---^^^^^^^^^^^^^^^^^^^^^^^
   |     |
   |     help: consider restricting its visibility: `pub(crate)`
--
>> warning: public documentation for `AllocatedBlocks` links to private item `Block`
   --> rust/kernel/gpu/buddy.rs:483:1
   |
   483 | / /// Allocated blocks from the buddy allocator with automatic cleanup.
   484 | | ///
   485 | | /// This structure owns a list of allocated blocks and ensures they are
   486 | | /// automatically freed when dropped. Use `iter()` to iterate over all
   ...   |
   490 | | ///
   491 | | /// - `list` is an initialized, valid list head containing allocated blocks.
   | |____________________________________________________________________________^
   |
   = note: the link appears in this line:
--
>> warning: public documentation for `AllocatedBlock` links to private item `Block`
   --> rust/kernel/gpu/buddy.rs:582:9
   |
   582 | /// A [`Block`] paired with its owning [`AllocatedBlocks`] context.
   |         ^^^^^ this item is private
   |
   = note: this link will resolve properly if you pass `--document-private-items`
--
>> warning: public documentation for `AllocatedBlock` links to private item `Block`
   --> rust/kernel/gpu/buddy.rs:584:20
   |
   584 | /// Unlike a raw [`Block`], which only knows its offset within the buddy address
   |                    ^^^^^ this item is private
   |
   = note: this link will resolve properly if you pass `--document-private-items`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
