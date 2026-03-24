Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4C3D6CAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 13:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359623; cv=none; b=F7pTT8DeObCrdinIonyU8zCi/UCJaLjnoGXF6nQ6uql0x6btwm/IFsZ0Y7YRv2igtJ8AzdWhiT4Vl6wlMTYRmJdChI8POS5TCiimG8BKlpjP+Y4ppL0ZUETDILFIeWKpIJu9c9iXsxtutvxY1mNefi40mN5gHWE/PT4ouePLg3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359623; c=relaxed/simple;
	bh=c75QkMUa8JYYsvDPKbq5cimjrBKbSaTFmzmqnCgibFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWgoCKMIhgayPKm5ZqR2tEEecLzAfoN6B+n/VnBYoB1E4IzUx+p3J+immqpU0m12Y6KjgXOAdkyaewyBI+0jeodisEzk62bjxC+wdrH9ttyfw34SCMO5EUnfQfKp+y5wdTFlMhL7KS3Fk3HKtIwTpTZapYkrebDVZu9gJpVAlCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCjoLbph; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCjoLbph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774359622; x=1805895622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c75QkMUa8JYYsvDPKbq5cimjrBKbSaTFmzmqnCgibFs=;
  b=nCjoLbphft5OumLS7zU17gyio7k4ZjTO8oio2ofG1Y/dO3R8ZZmAy+NM
   3ZQZHAhuH2wL/c81w06gApNldvhVmZku86SiXVRnIst2Et7s168kgSNuW
   wqOsNIXubfM1K21dnlBH5wO6AmzX5REAg8GQhYMZZdR/alOezlNdUUax2
   ed+27zOaUGHrj9Ze2o2GGa//dTS6kL6oj6vClM1S/qyKXzjWvcsayy4go
   Z3VaZsHAZbbOBD0XkvYZ2Q+dh5pHAyg+1pUx0Dgco1NF6jVXlwyABdAbt
   aUxQ/alo/Yvkk+eF4dLnNpWyMQ+4EWajYBnSosRUOfY47ce/ABajAxXE1
   w==;
X-CSE-ConnectionGUID: Pyn7XVvyRFeThZFFklAQqw==
X-CSE-MsgGUID: JIEBOY8SSP20TJ+O4woOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86846334"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86846334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:40:22 -0700
X-CSE-ConnectionGUID: MGT0ntB4TiCjKgWoYMx5NA==
X-CSE-MsgGUID: C7j/+oIYSNCTbfvJn18Deg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="217782713"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 24 Mar 2026 06:40:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51zV-000000006tl-41JG;
	Tue, 24 Mar 2026 13:40:17 +0000
Date: Tue, 24 Mar 2026 14:39:27 +0100
From: kernel test robot <lkp@intel.com>
To: Artem Lytkin <iprintercanon@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] watchdog: softdog_rs: add Rust software watchdog
 driver
Message-ID: <202603241444.uKpsuZrd-lkp@intel.com>
References: <20260323195209.5581-2-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323195209.5581-2-iprintercanon@gmail.com>

Hi Artem,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Lytkin/watchdog-softdog_rs-add-Rust-software-watchdog-driver/20260324-145829
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260323195209.5581-2-iprintercanon%40gmail.com
patch subject: [PATCH 2/2] watchdog: softdog_rs: add Rust software watchdog driver
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260324/202603241444.uKpsuZrd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241444.uKpsuZrd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241444.uKpsuZrd-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/watchdog/softdog_rs.rs:51:
        },
    };
    
   -static mut SOFTDOG_OPS: bindings::watchdog_ops =
   -    watchdog::create_watchdog_ops::<SoftdogOps>();
   +static mut SOFTDOG_OPS: bindings::watchdog_ops = watchdog::create_watchdog_ops::<SoftdogOps>();
    
    struct SoftdogModule {
        _reg: watchdog::Registration,
   Diff in rust/kernel/watchdog.rs:94:
        /// # Safety
        ///
        /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
   -    unsafe extern "C" fn start_callback(
   -        wdd: *mut bindings::watchdog_device,
   -    ) -> core::ffi::c_int {
   +    unsafe extern "C" fn start_callback(wdd: *mut bindings::watchdog_device) -> core::ffi::c_int {
            from_result(|| {
                // SAFETY: The watchdog core serialises access to the device.
                let dev = unsafe { Device::from_raw(wdd) };
   Diff in rust/kernel/watchdog.rs:108:
        /// # Safety
        ///
        /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
   -    unsafe extern "C" fn stop_callback(
   -        wdd: *mut bindings::watchdog_device,
   -    ) -> core::ffi::c_int {
   +    unsafe extern "C" fn stop_callback(wdd: *mut bindings::watchdog_device) -> core::ffi::c_int {
            from_result(|| {
                // SAFETY: The watchdog core serialises access to the device.
                let dev = unsafe { Device::from_raw(wdd) };
   Diff in rust/kernel/watchdog.rs:122:
        /// # Safety
        ///
        /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
   -    unsafe extern "C" fn ping_callback(
   -        wdd: *mut bindings::watchdog_device,
   -    ) -> core::ffi::c_int {
   +    unsafe extern "C" fn ping_callback(wdd: *mut bindings::watchdog_device) -> core::ffi::c_int {
            from_result(|| {
                // SAFETY: The watchdog core serialises access to the device.
                let dev = unsafe { Device::from_raw(wdd) };
   Diff in rust/kernel/lib.rs:155:
    pub mod transmute;
    pub mod types;
    pub mod uaccess;
   -#[cfg(CONFIG_WATCHDOG)]
   -pub mod watchdog;
    #[cfg(CONFIG_USB = "y")]
    pub mod usb;
   +#[cfg(CONFIG_WATCHDOG)]
   +pub mod watchdog;
    pub mod workqueue;
    pub mod xarray;
    
   Diff in rust/kernel/watchdog.rs:94:
        /// # Safety
        ///
        /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
   -    unsafe extern "C" fn start_callback(
   -        wdd: *mut bindings::watchdog_device,
   -    ) -> core::ffi::c_int {
   +    unsafe extern "C" fn start_callback(wdd: *mut bindings::watchdog_device) -> core::ffi::c_int {
            from_result(|| {
                // SAFETY: The watchdog core serialises access to the device.
                let dev = unsafe { Device::from_raw(wdd) };
   Diff in rust/kernel/watchdog.rs:108:
        /// # Safety
        ///
        /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
   -    unsafe extern "C" fn stop_callback(
   -        wdd: *mut bindings::watchdog_device,
   -    ) -> core::ffi::c_int {
   +    unsafe extern "C" fn stop_callback(wdd: *mut bindings::watchdog_device) -> core::ffi::c_int {
            from_result(|| {
                // SAFETY: The watchdog core serialises access to the device.
                let dev = unsafe { Device::from_raw(wdd) };
   Diff in rust/kernel/watchdog.rs:122:
        /// # Safety
        ///
        /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
   -    unsafe extern "C" fn ping_callback(
   -        wdd: *mut bindings::watchdog_device,
   -    ) -> core::ffi::c_int {
   +    unsafe extern "C" fn ping_callback(wdd: *mut bindings::watchdog_device) -> core::ffi::c_int {
            from_result(|| {
                // SAFETY: The watchdog core serialises access to the device.
                let dev = unsafe { Device::from_raw(wdd) };
   make[2]: *** [Makefile:1912: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
