Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698B23EA8A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 21:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764536887; cv=none; b=QxCU/50qbNJDKe0BdqheDCif0F1fFGa6Cd1PGnjV3COXraeFrbQj2ejUUZTj0rWZAJm6wMGbLEZc097kTnfh/liVbxqR2eZAwUBDeJ/5vdOjpMRlx8dgPtqv6Jv8abLJFL1G596pzuQMFwdVtEjeZ7hAgnxmrgnjXnq7KFYvYaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764536887; c=relaxed/simple;
	bh=NRkMsxoHYZqiJj5ZD/9EySHfxLk2qbytX7F5gc9lfl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LqAoV9WhvRUixsvk0ZZRJEd9DLszv3ZwkKcAsz6gfm6PUAvhfc0dVw060CIri17Iv/E2kV2xfusKxNKW/URx34Ibi/qQelMC8QAKU7KnyV90HaryzJochUwJlQvxCx6J2GDe7kCmesUAGsW9cfcOPoyJRF+jwusBtvsdpYDRTLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhBxiPW3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhBxiPW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764536886; x=1796072886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRkMsxoHYZqiJj5ZD/9EySHfxLk2qbytX7F5gc9lfl8=;
  b=LhBxiPW3ZzCcmHafJNqzj8wlBKGw1eZZn+87YxYEgNG8RLbF8LbI2x5l
   9j6t3bCaeg6u4doMswQEbTMROp45qpGsV+hoh57m5lLY2U4t2YoxIb0+m
   Tun5WaZ9Z1gTyEq/pLIich6qtOugTGcP0u4SmbfoRTjEeXWP75WvNjpak
   sxRHDJCkcv+J0p96+rudHTpA6ucwPijyc0+FmtaHwrqiNj3qHyfH0Eu9l
   oE0uYBG7SR8ewJM7t6r31KFWbPdEae3hdRpPwur4OPFMeSH1+8i4CKnMC
   8fOar0Gzq0qAqaKlP1Id5mN8BLTfLmgLSwFsSscMzto25iHx1jKN9902i
   Q==;
X-CSE-ConnectionGUID: /z+UUWFRQumP2uZRodjaZQ==
X-CSE-MsgGUID: 2H+FrukvToqBS54HLEy0ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66428328"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="66428328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 13:08:05 -0800
X-CSE-ConnectionGUID: E2/o3ojdTrCrubZ0Z1+N+A==
X-CSE-MsgGUID: uWcAVuHiQ7SJl1hkDygs4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="194693097"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Nov 2025 13:08:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPoeH-000000008An-1TCJ;
	Sun, 30 Nov 2025 21:08:01 +0000
Date: Mon, 1 Dec 2025 05:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
Message-ID: <202512010419.B6H1cMB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e69c7c175115c51c7f95394fc55425a395b3af59
commit: 101d66828a4eefb89b72256155feb6ec9abc144a rust: dma: add DMA addressing capabilities
date:   4 months ago
config: um-randconfig-r054-20251201 (https://download.01.org/0day-ci/archive/20251201/202512010419.B6H1cMB9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010419.B6H1cMB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010419.B6H1cMB9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
   --> rust/kernel/dma.rs:36:38
   |
   36    |         to_result(unsafe { bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
   |                                      ^^^^^^^^^^^^ help: a function with a similar name exists: `xa_set_mark`
   |
   ::: rust/bindings/bindings_generated.rs:26642:5
   |
   26642 |     pub fn xa_set_mark(arg1: *mut xarray, index: ffi::c_ulong, arg2: xa_mark_t);
   |     ---------------------------------------------------------------------------- similarly named function `xa_set_mark` defined here
--
>> error[E0425]: cannot find function `dma_set_coherent_mask` in crate `bindings`
   --> rust/kernel/dma.rs:53:38
   |
   53    |         to_result(unsafe { bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value()) })
   |                                      ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_coherent_ok`
   |
   ::: rust/bindings/bindings_generated.rs:50209:5
   |
   50209 |     pub fn dma_coherent_ok(dev: *mut device, phys: phys_addr_t, size: usize) -> bool_;
   |     ---------------------------------------------------------------------------------- similarly named function `dma_coherent_ok` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
