Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F454706B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325845; cv=none; b=CpqjREYw0RXksyrqOzaoYJ1WXdtHfe0nD9e/MTaSvscq2YAr6OHD7UFuKK6bA8bDk0BL+znL4FHFpGaHhohdopeDb1V/VWvhwXeF6VuaRESU2yRMESFY2PH+G8R7c+qOnFZ2cuGXR+vuc72kSfEYVPovejj21mB7Iio1C/mhNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325845; c=relaxed/simple;
	bh=IJ5kaRP45IMMf4VvO6oLXfR6Yq6whSD2ZIX3z3VNVAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iewpavhYh+7pKsvTFia1APAyj2iLtBiVVSkMZDUZ+bSXwyy6xX6yWERiRynSWi8vUX7i+bl5sDaOT0xureVqPBkArlHB7OmdOqq/Y4Z/jNaYdz8E6Mf7go9DWyhdTpOO2dm+PRVe773/eYuvXgP4mb7g3NUw57Ftdj0lcknzdFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjfoAPak; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjfoAPak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791325844; x=1822861844;
  h=date:from:to:cc:subject:message-id;
  bh=IJ5kaRP45IMMf4VvO6oLXfR6Yq6whSD2ZIX3z3VNVAE=;
  b=cjfoAPakoFSmC15MnwEHubE+j0oJy6VHxcaCgwJJpLwmgMSDqFAdbcR3
   dxuQwbymdCfbBO9ofADN9d5O/nmUAJrVO4JCfkFojQWvBvDyKnvBMR4tH
   wLMH8F5h5dwWSnu8yTYNQBprAJsqLXDhEeGzqEI3KQkWqL3TS0pxAgrOL
   rn7WzatBuekTeyEIu/3GFEk5gaw4XvtBKAIDHIlMPNECuHjlApuDy5Wz0
   DSmt6Krhdjl0xH9idoS13UbpwS6ss4Dvlq4M2kNmzIGY7Mq+jU9CvVMQN
   FpSqDvfwrJsWEyk62QQK0T7NjnC6hcUJOPiniqP8Yo9yomsECPIiNN8oJ
   g==;
X-CSE-ConnectionGUID: tRlvv4sGTRi7AcqjvUpjrQ==
X-CSE-MsgGUID: ceYgDwpYQ9yIP/jlD+BS4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="182716"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="182716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:30:44 -0700
X-CSE-ConnectionGUID: MbtiG2r8SRqGDzFlT0GOJg==
X-CSE-MsgGUID: P85QKYTTSnq4fcdoeVGl2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276794050"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 15:30:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEDgG-000000001wZ-1V8U;
	Tue, 06 Oct 2026 22:30:40 +0000
Date: Wed, 07 Oct 2026 00:30:21 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 15/15] warning: unsafe
 function's docs are missing a `# Safety` section
Message-ID: <202610070006.ZzQeGIGv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   51015f38e9dca4ae0e4cdfd507558f2b438dd124
commit: 9d24b6e4b72a87704df6c39d7a9d8dd1cd9e41d5 [15/15] ANDROID: rust: Adds support for using a spinlock inside an IRQ handler.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261007/202610070006.ZzQeGIGv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070006.ZzQeGIGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070006.ZzQeGIGv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/sync/lock/spinlock_irq.rs:128:5
   |
   128 |     unsafe fn assert_is_held(ptr: *mut bindings::spinlock_t) {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#missing_safety_doc
   = note: `-W clippy::missing-safety-doc` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::missing_safety_doc)]`
--
>> warning: this lifetime isn't used in the impl
   --> rust/kernel/sync/lock/spinlock_irq.rs:147:6
   |
   147 | impl<'a, T> core::ops::Deref for SpinLockIrqGuard<'_, T> {
   |      ^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#extra_unused_lifetimes
   = note: `-W clippy::extra-unused-lifetimes` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::extra_unused_lifetimes)]`
--
>> warning: this lifetime isn't used in the impl
   --> rust/kernel/sync/lock/spinlock_irq.rs:157:6
   |
   157 | impl<'a, T> core::ops::DerefMut for SpinLockIrqGuard<'_, T> {
   |      ^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#extra_unused_lifetimes
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/sync/lock/spinlock_irq.rs:167:5
   |
   167 |     unsafe fn new(lock: &'a SpinLockIrq<T>) -> Self {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#missing_safety_doc

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
