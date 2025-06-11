Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63516184
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635067; cv=none; b=PoWV2Jg95dJCId55taoGP1r1dAmA8uLwwFeP2h8o4MBwyQOXGAYJ2NtOwdBBr7d4xXUCkbw4sahEtvbIH8WlJIAF3fWedDeDEsdcbp322UkUEO49Cxg4LyEeiAa3DaTEBpz05TC7mtjLREc/Cy9njzIrwmwmcoGwCUAAmYffgQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635067; c=relaxed/simple;
	bh=qRVEGfsQC5IKviY3vB786GSprW7fhDL1v5DBbxtAMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iqPuTqZYL8VhV8Tws6o2H8xhm584ZUaa6ncoHtRfFJ6E6nFMXxswnbEYEFRsklj6R35rJQq9KPtKdkDCaQ9aeudToRZnzsQCPK27PmAwWPIKgbx/ogHwqSxlSlq6QMUQznlVvx6i2A0gPyI+MlYOAy1dLxnD8+FJh9XDlrgxUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZmtb1aS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZmtb1aS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749635067; x=1781171067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRVEGfsQC5IKviY3vB786GSprW7fhDL1v5DBbxtAMXA=;
  b=TZmtb1aS0uCs+yc4GHGCtlIoMSpelvSlJsr18HQd7SkcgDLQbOe6cdGy
   1dn82D+jczCO6pzBOS7aoz1rWH7hRvQm+GfGwB4xJaChzMicIpwZoHk3J
   rFDbvKqZSbCnw+OEI+OrMspn8Kqj9jiSUVTwXU8YsIbK/T+fpT6cbb9BS
   lri/yxTFO7ftWtJnkvWTNfHmB1aSvF/o++92Tj82M8KvsVsUX3QAw8zCq
   Yz5Wt40zhaCDJgfdaA+4wDY4lyKRc+upFF7h/7PPLwS35ppyhAx3fkAKW
   vD9bKH173wPyTDNhXhIJNidcbvJ8QHHSkqkcNignEB5r43tOKsNC3bWH4
   Q==;
X-CSE-ConnectionGUID: 6XXOMKunQQOZemD2XMSPqw==
X-CSE-MsgGUID: itmFT44RRTGoegJQ/ogJhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51483506"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51483506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 02:44:26 -0700
X-CSE-ConnectionGUID: iBKTTDT5RdKWKhtVjfE08g==
X-CSE-MsgGUID: rQ9gf9q2SnWkLTPwjXsqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147703499"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2025 02:44:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPI0M-000AEm-0i;
	Wed, 11 Jun 2025 09:44:22 +0000
Date: Wed, 11 Jun 2025 17:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver =?iso-8859-1?Q?S=E4fstr=F6m?= <safstrom.oliver@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1171 1/1] warning: safe function's docs have unnecessary `#
 Safety` section
Message-ID: <202506111703.hhXNp5D2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1171
head:   e8a51983bf94ea12a07b304037ad25c5acfc1dfa
commit: e8a51983bf94ea12a07b304037ad25c5acfc1dfa [1/1] docs: rust: Refactor safety lines docs to sections in cpufreq.rs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250611/202506111703.hhXNp5D2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111703.hhXNp5D2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111703.hhXNp5D2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1178:5
   |
   1178 |     extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1192:5
   |
   1192 | /     extern "C" fn target_callback(
   1193 | |         ptr: *mut bindings::cpufreq_policy,
   1194 | |         target_freq: u32,
   1195 | |         relation: u32,
   1196 | |     ) -> kernel::ffi::c_int {
   | |___________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1210:5
   |
   1210 | /     extern "C" fn target_index_callback(
   1211 | |         ptr: *mut bindings::cpufreq_policy,
   1212 | |         index: u32,
   1213 | |     ) -> kernel::ffi::c_int {
   | |___________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1232:5
   |
   1232 | /     extern "C" fn fast_switch_callback(
   1233 | |         ptr: *mut bindings::cpufreq_policy,
   1234 | |         target_freq: u32,
   1235 | |     ) -> kernel::ffi::c_uint {
   | |____________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1259:5
   |
   1259 | /     extern "C" fn get_intermediate_callback(
   1260 | |         ptr: *mut bindings::cpufreq_policy,
   1261 | |         index: u32,
   1262 | |     ) -> kernel::ffi::c_uint {
   | |____________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1279:5
   |
   1279 | /     extern "C" fn target_intermediate_callback(
   1280 | |         ptr: *mut bindings::cpufreq_policy,
   1281 | |         index: u32,
   1282 | |     ) -> kernel::ffi::c_int {
   | |___________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1314:5
   |
   1314 |     extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1328:5
   |
   1328 | /     extern "C" fn set_boost_callback(
   1329 | |         ptr: *mut bindings::cpufreq_policy,
   1330 | |         state: i32,
   1331 | |     ) -> kernel::ffi::c_int {
   | |___________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1345:5
   |
   1345 |     extern "C" fn register_em_callback(ptr: *mut bindings::cpufreq_policy) {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1065:5
   |
   1065 |     extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
   = note: requested on the command line with `-W clippy::unnecessary-safety-doc`
--
>> warning: safe function's docs have unnecessary `# Safety` section
   --> rust/kernel/cpufreq.rs:1082:5
   |
   1082 |     extern "C" fn exit_callback(ptr: *mut bindings::cpufreq_policy) {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_doc
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
