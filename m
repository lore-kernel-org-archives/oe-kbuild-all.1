Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC2B3F7E77
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355971; cv=none; b=nhtetx+RfE+9ZAFqa9ILoWurb4Wo1LtMkPIZgd3KMyjMi86DrJ+wM+klVjFeY20KLldGlD2XniFbM0wPSBbHT0BNs2ZP1KYVqttxO+oKvntElizyEpxLhm7QQ4E+wf6xjSwdFmBSvHZZid7ouS0b//vp8ZUTVoSe6Lp3pug1Pp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355971; c=relaxed/simple;
	bh=FSnWKeGtNK4ksW5fvyUs0Ba4jnNehpo4m4/H4On6r8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jo8vhllMVo00sQPTvi57Oav2JejpWiVxu4WDq+k8k3w/LWzKnNjsv7/L56QqcdzPCs8NFug7VdrepVUXsHK9YLhm9SJEy0kjwZqmV0XLZG/5R4usSBN/nq6FCUkxkl5Q8k/iTF/ADmlhPRaQRQgjMZ80kF5qq7KXnTfRY9tRiYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tixc0WXS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tixc0WXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774355970; x=1805891970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FSnWKeGtNK4ksW5fvyUs0Ba4jnNehpo4m4/H4On6r8s=;
  b=Tixc0WXSq6P44qc1iNZoQq79mYqGqWvT9uMQDwSSKDZg13Eq3wHGtuKP
   t3tRmdGzFdtV7I5D6t7pejgGVOKJDbMhoeimsRZsw60c4MmL7zzYgy5qZ
   ymeKrqmNOvsns3OjHWnIk1HIjg4+hTqRCpW8FEPXCnjXtlVHmj2txPmpP
   Cc5U67sMjbHWtwGnZNPnvDL9dH0tfh0k9XcGac1NbawzJGt2CMtjqK0Sz
   Ob80kMjyfgqd7kDAHw5nHSebz1JfWpyhLn92cggtuvQRtqnpbA2yvF/A3
   bSm1fQYSkoycIkfCRugBtIss8rH8LzGsa0mHHMtgOnIvWjbE4+MyN0V/m
   Q==;
X-CSE-ConnectionGUID: lLFhUrprS4Gw+C/D4f2HoQ==
X-CSE-MsgGUID: 4JmnG/RjQNGiVz9VHY/PyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75437318"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75437318"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:39:21 -0700
X-CSE-ConnectionGUID: Git9RWXGRXaiBicmIJfKbA==
X-CSE-MsgGUID: 0wjn5SyQQaKoJn7S3gY5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224581803"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Mar 2026 05:39:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w512T-000000006tR-2u4H;
	Tue, 24 Mar 2026 12:39:17 +0000
Date: Tue, 24 Mar 2026 13:38:33 +0100
From: kernel test robot <lkp@intel.com>
To: Artem Lytkin <iprintercanon@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] rust: watchdog: add watchdog device abstraction
Message-ID: <202603241310.tEi2U9R1-lkp@intel.com>
References: <20260323195209.5581-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323195209.5581-1-iprintercanon@gmail.com>

Hi Artem,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Lytkin/watchdog-softdog_rs-add-Rust-software-watchdog-driver/20260324-145829
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260323195209.5581-1-iprintercanon%40gmail.com
patch subject: [PATCH 1/2] rust: watchdog: add watchdog device abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260324/202603241310.tEi2U9R1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241310.tEi2U9R1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241310.tEi2U9R1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/watchdog.rs:94:
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
    
>> Diff in rust/kernel/watchdog.rs:94:
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
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
   make[2]: Target 'rustfmtcheck' not remade because of errors.
--
>> warning: this function has too many arguments (8/7)
   --> rust/kernel/watchdog.rs:290:5
   |
   290 | /     pub fn register(
   291 | |         module: &'static crate::ThisModule,
   292 | |         parent: Option<&device::Device>,
   293 | |         info: &'static bindings::watchdog_info,
   ...   |
   298 | |         nowayout: bool,
   299 | |     ) -> Result<Self> {
   | |_____________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#too_many_arguments
   = note: `-W clippy::too-many-arguments` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::too_many_arguments)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
