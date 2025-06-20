Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89C221557
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421897; cv=none; b=SsltmqlyOMqCqFKGrDCxskRMpEYXPlRSjjhIu43yDxE2jNZT/jjsWKfV1iaHohW1Wyenodz1L3q5vWJEzFk6Al6H0f5tT48lWqu0E46iNB0ZvQRowOTU1syN+oIUrBBYhu1VBIsFCAAbAiIk+E/yGkp9w2AKVwG61d6C7SQMNz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421897; c=relaxed/simple;
	bh=s6KJQ/5gmY+UfdU5A7LviLirFAO2qGa0VD/GDD/DhrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7FHvcwq/gC0buq1U1cVB7ey7d9bcb6IaOS7Da+gHYhI0OpKaM/XxiTW0hBKx6pmKBtmlhM3xw1+NVRMJPtN4nxnt3wPwHWTGd7ay5LHQogugTPq0dHHJsdxi42FMKcqHzeMwfx7G+JOkdwSu122hiKRINRSebLC5RemDfVHgsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENbaI3Zs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENbaI3Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750421895; x=1781957895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6KJQ/5gmY+UfdU5A7LviLirFAO2qGa0VD/GDD/DhrY=;
  b=ENbaI3ZsX5N27umk4HP1DdZI8PoJ4Z8yosjsrjGNjx79M90dEUQHMYuj
   /OD7n7Cq1CytdJ8Py0eDdbl226i0H98wQgOaBmc7CHhyTSLBIf1cMp9sU
   /3v71OcX1UzSewtsVqG0xjn//nE46cZ1Gb2DLksQ33q+I9vMoPmyMibS1
   OLORY5bUgsceHecGhswy2uBjKhNrfdmS4cPumj5IjaYuruYZjfS6Le/kQ
   F0jps2YqYfTlxQ3AXjei+SHxyDUxMkvz+waJCCtCEULkc40ii6nL0xGGw
   Mf8i/O64m2JxbVfiWTJQ93iePKJgLoIe0tZawzia27yJiSdPifAbGzhs6
   A==;
X-CSE-ConnectionGUID: OJRHIbc4S16v99Tcrf+m0Q==
X-CSE-MsgGUID: j9ZZM2+ORt6tG6Zhmj0mgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52558986"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52558986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 05:18:14 -0700
X-CSE-ConnectionGUID: j7ocNWX+SUasOWSZA801Qw==
X-CSE-MsgGUID: ITte7K8GSMij56a/A2MhmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="156391850"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2025 05:18:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSah8-000Lju-2a;
	Fri, 20 Jun 2025 12:18:10 +0000
Date: Fri, 20 Jun 2025 20:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [vireshk-pm:cpufreq/arm/linux-next 5/5] Diff in
 rust/kernel/cpufreq.rs at line 1109:
Message-ID: <202506202039.qBxlqL4m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next
head:   37bd81e08ed8a70e3c8a60225c51ddefac743153
commit: 37bd81e08ed8a70e3c8a60225c51ddefac743153 [5/5] rust: cpufreq: use c_ types from kernel prelude
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250620/202506202039.qBxlqL4m-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202039.qBxlqL4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202039.qBxlqL4m-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/cpufreq.rs at line 1109:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn offline_callback(
   -        ptr: *mut bindings::cpufreq_policy,
   -    ) -> c_int {
   +    unsafe extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
   Diff in rust/kernel/cpufreq.rs at line 1126:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn suspend_callback(
   -        ptr: *mut bindings::cpufreq_policy,
   -    ) -> c_int {
   +    unsafe extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
   Diff in rust/kernel/cpufreq.rs at line 1171:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn verify_callback(
   -        ptr: *mut bindings::cpufreq_policy_data,
   -    ) -> c_int {
   +    unsafe extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
   Diff in rust/kernel/cpufreq.rs at line 1188:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn setpolicy_callback(
   -        ptr: *mut bindings::cpufreq_policy,
   -    ) -> c_int {
   +    unsafe extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
>> Diff in rust/kernel/cpufreq.rs at line 1109:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn offline_callback(
   -        ptr: *mut bindings::cpufreq_policy,
   -    ) -> c_int {
   +    unsafe extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
   Diff in rust/kernel/cpufreq.rs at line 1126:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn suspend_callback(
   -        ptr: *mut bindings::cpufreq_policy,
   -    ) -> c_int {
   +    unsafe extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
   Diff in rust/kernel/cpufreq.rs at line 1171:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn verify_callback(
   -        ptr: *mut bindings::cpufreq_policy_data,
   -    ) -> c_int {
   +    unsafe extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
   Diff in rust/kernel/cpufreq.rs at line 1188:
        ///
        /// - This function may only be called from the cpufreq C infrastructure.
        /// - The pointer arguments must be valid pointers.
   -    unsafe extern "C" fn setpolicy_callback(
   -        ptr: *mut bindings::cpufreq_policy,
   -    ) -> c_int {
   +    unsafe extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> c_int {
            from_result(|| {
                // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
                // lifetime of `policy`.
   make[2]: *** [Makefile:1825: rustfmt] Error 123
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
