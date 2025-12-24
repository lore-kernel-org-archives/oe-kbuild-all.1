Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA62AF1D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766609762; cv=none; b=We/3Vm/HWiZFcCtZf7t3vGxW6YKh2db0vrD88PlZTSMrHir+Hpnl3nbt8y7YLZAqS88vBpggjy8ubwhytHVaL7jGSPmQ+FOnbcwzkPci47m01m/m411Odk/NV9CrCl2hLXsND0twxAwBPUEjuv61HzTR9LnNuZQBtf11ksqn0vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766609762; c=relaxed/simple;
	bh=JE7ZrPUmmxuzn97WpOFGhEw7MmKdN6mV9VuSYdEJ0B0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNb0SXhPdz1cGmITArOs6BzBeuNiJqRURiTqse6m1xeRfyUjIKMtTxizZefva59BCep5LAMPmOVNNs5xbvEWUlisBkxDzPe3Kw3MYZ8Hl6DPx7+ZENc5JJi0vHvJ2IfuuVFXb0T/vibitTets4NtDFjUZ/8KlptZOI8B4TxA3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3PhrHZE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3PhrHZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766609760; x=1798145760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JE7ZrPUmmxuzn97WpOFGhEw7MmKdN6mV9VuSYdEJ0B0=;
  b=F3PhrHZEEZXkxuKIx6eKM9NimP3ZyBu1oy5HtbgsFUkh7tpEy5ElXuSZ
   wf90ZbJ9+61yrQE1pxJujxJTIoEC9ITBt09cI13orUb3jv3HhW/IdRgwn
   BTmPIqnDo/LKHx6S5OJfbebVDx2AclNVj9Ba66tx/w/IGB8D5AB/K/e+Y
   zY3atTGoT5gjbEYRzH1vPRLhguyuOwYm+bR/1QU09R1JfyfmRtgDw2IS9
   +GoOu1w8MNGFHzlFOAWckNobW+eRsczS1X81NALC2HKPPs0frezR4LKGj
   oFEPhYcAa2HiO6mEqgbiYgiWcq5VuJ2cMZD/z5eATMUmjCAhgJ6uamJ2b
   Q==;
X-CSE-ConnectionGUID: xZwqpVDBQu2uVqTI2N1olg==
X-CSE-MsgGUID: VfRJbUAtSjSXRSP7o3rx5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67634794"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="67634794"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 12:55:59 -0800
X-CSE-ConnectionGUID: RCvwZlnQSNykGWcEnW79HA==
X-CSE-MsgGUID: f2x86eD6RJaceP+LcuRooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="223572576"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 24 Dec 2025 12:55:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYVtk-000000006Ki-2kwG;
	Wed, 24 Dec 2025 20:55:56 +0000
Date: Wed, 24 Dec 2025 21:55:44 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 12/15] error[E0425]: cannot find function
 `pci_alloc_irq_vectors` in crate `bindings`
Message-ID: <202512242126.SqHfrzOQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   16f858473d90ca1f50cd701fcaa7a3a7d58c44f7
commit: e221c5317b9e0d43b65232136ffb7e3cdc98bff5 [12/15] x86: Use PIE codegen for the core kernel
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251224/202512242126.SqHfrzOQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242126.SqHfrzOQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242126.SqHfrzOQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unused import: `super::bindings_helper::*`
   --> rust/bindings/lib.rs:49:13
   |
   49 |     pub use super::bindings_helper::*;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `super::bindings_raw::*`
   --> rust/bindings/lib.rs:62:9
   |
   62 |     use super::bindings_raw::*;
   |         ^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0425]: cannot find function `pci_alloc_irq_vectors` in crate `bindings`
   --> rust/kernel/pci/irq.rs:144:23
   |
   144 |             bindings::pci_alloc_irq_vectors(dev.as_raw(), min_vecs, max_vecs, irq_types.as_raw())
   |                       ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
