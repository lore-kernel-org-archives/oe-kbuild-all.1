Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A4A182D8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723290358; cv=none; b=d3UsPujN0pp7K1fWGfPEDEnzO4CeuPXr4FfPLiYibybV9cuNl1nrCSYzCzQolgR1U/TXHdzB4rsk4/OhR8/6vzvFrU/uNbSR7rqFCmCJU52U2qC2LsqzWAW2MgwoUH3p5UXF0KIK5g1M3VtqOWmzEKZxu5rrcVyImrT2UsmU6wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723290358; c=relaxed/simple;
	bh=RKkX0ROjjN9bv9YRR2o+UN3ITfWynZgbIT0izQ0+lPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhgBQ3Zh4eB3A0goGUhG2P6Zot+/me7VzO3+Zv9X4eHqOUwYXCZa7ucQY1jPfdWnkODfi53MBv0MBUwoiLZbuE6vm02e3VKtK12FMhEd3SNFx9QK5ZjI5kFf0cJvGPMch3GGPepED6K7sFoq5i8ja452Yvc8EZAc6zsL2GMI7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQCEY4fk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQCEY4fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723290357; x=1754826357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RKkX0ROjjN9bv9YRR2o+UN3ITfWynZgbIT0izQ0+lPI=;
  b=LQCEY4fk2sCxjNoBZvynZB7U5IXpgpkL0nvTwjfLJYpF1Z8molXU0SFw
   hRqrplmiliNKI6Q0xsEczOF9M0t2/P0jSE5Ga7IOyBf0eViuEfQ/ncFl9
   aAn773jRDZSdjqlRPSmSdodvUyGcb+fqdUQhEJ0FsBK/k4eHx51Wris+L
   sxReDuI/kMrVz4gjYvf3gnFIOJWx2mI+7Z36jEmln3H4rxwrcPxQqFYrI
   Vue3iOIGAu7z/g6/q5JHw/0k08Cu9AtA2Mugjkm3vgJdDD2hqYScMM6Zc
   Bvp131Ol/D4XjQscqPHkcdQFxgb3VnHzH1ctGfFE8dk1wfWXx7nfho9u0
   w==;
X-CSE-ConnectionGUID: DGgsOVehSiuguS3mhBieYw==
X-CSE-MsgGUID: kEK7z1G9TRi++JLOy0DyVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21434569"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="21434569"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 04:45:56 -0700
X-CSE-ConnectionGUID: W5lSk5DPTQCc60Pl/wDfng==
X-CSE-MsgGUID: 0cnfmppZSc23eCGQFql5Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57701444"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Aug 2024 04:45:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sckWt-0009tt-0T;
	Sat, 10 Aug 2024 11:45:03 +0000
Date: Sat, 10 Aug 2024 19:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1040 22/23] error[E0599]: no function or associated item
 named `try_new` found for struct `Arc<_>` in the current scope
Message-ID: <202408101904.XuWrHB8y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   2419018fe244d9eaee250fc03cb145b474c575b8
commit: 21701bb5aa3f6db69c62831acedf6fa81f71894e [22/23] rust: regulator: add Regulator Driver abstraction
config: x86_64-randconfig-161-20240810 (https://download.01.org/0day-ci/archive/20240810/202408101904.XuWrHB8y-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101904.XuWrHB8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101904.XuWrHB8y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the trait bound `rust_doctest_kernel_build_assert_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>` is not satisfied
   --> rust/doctests_kernel_generated.rs:3491:46
   |
   3491 | let config = Config::<Arc<DriverData>>::new(&dev, Arc::try_new(DriverData(128))?);
   |              ------------------------------  ^^^ the trait `AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>` is not implemented for `rust_doctest_kernel_build_assert_rs_0::kernel::device::Device`, which is required by `&&rust_doctest_kernel_build_assert_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>`
   |              |
   |              required by a bound introduced by this call
   |
   = note: required for `&rust_doctest_kernel_build_assert_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>`
   = note: 1 redundant requirement hidden
   = note: required for `&&rust_doctest_kernel_build_assert_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>`
   note: required by a bound in `rust_doctest_kernel_build_assert_rs_0::kernel::regulator::driver::Config::<T>::new`
   --> rust/kernel/regulator/driver.rs:346:19
   |
   346  |     pub fn new<U: AsRef<Device>>(dev: U, data: T) -> Self {
   |                   ^^^^^^^^^^^^^ required by this bound in `Config::<T>::new`
--
>> error[E0599]: no function or associated item named `try_new` found for struct `Arc<_>` in the current scope
   --> rust/doctests_kernel_generated.rs:3491:56
   |
   3491 | let config = Config::<Arc<DriverData>>::new(&dev, Arc::try_new(DriverData(128))?);
   |                                                        ^^^^^^^ function or associated item not found in `Arc<_>`
   |
   note: if you're trying to build a new `Arc<_>` consider using one of the following associated functions:
   Arc::<T>::new
   Arc::<T>::pin_init
   Arc::<T>::init
   Arc::<T>::from_inner
   Arc::<T>::from_raw
   --> rust/kernel/sync/arc.rs:198:5
   |
   198  |       pub fn new(contents: T, flags: Flags) -> Result<Self, AllocError> {
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   ...
   217  | /     pub fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> error::Result<Self>
   218  | |     where
   219  | |         Error: From<E>,
   | |_______________________^
   ...
   228  | /     pub fn init<E>(init: impl Init<T, E>, flags: Flags) -> error::Result<Self>
   229  | |     where
   230  | |         Error: From<E>,
   | |_______________________^
   ...
   243  |       unsafe fn from_inner(inner: NonNull<ArcInner<T>>) -> Self {
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   ...
   267  |       pub unsafe fn from_raw(ptr: *const T) -> Self {
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0277]: the trait bound `rust_doctest_kernel_build_assert_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>` is not satisfied
   --> rust/doctests_kernel_generated.rs:3492:34
   |
   3492 | let reg = Registration::register(dev, desc, config)?;
   |           ---------------------- ^^^ the trait `AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>` is not implemented for `rust_doctest_kernel_build_assert_rs_0::kernel::device::Device`, which is required by `&rust_doctest_kernel_build_assert_rs_0::kernel::device::Device: AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>`
   |           |
   |           required by a bound introduced by this call
   |
   = note: required for `&rust_doctest_kernel_build_assert_rs_0::kernel::device::Device` to implement `AsRef<rust_doctest_kernel_build_assert_rs_0::kernel::device::Device>`
   note: required by a bound in `rust_doctest_kernel_build_assert_rs_0::kernel::regulator::driver::Registration::register`
   --> rust/kernel/regulator/driver.rs:362:57
   |
   362  |     pub fn register<T: ForeignOwnable + Send + Sync, U: AsRef<Device>>(
   |                                                         ^^^^^^^^^^^^^ required by this bound in `Registration::register`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
