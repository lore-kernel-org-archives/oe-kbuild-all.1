Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA15632AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999886; cv=none; b=MOut49T9JPPkgzyISNwmsooWZ4cEyaGYor68Z2c+NHQlEirXPoUXne7GZpd493k+mTEDEIWmOoec9t7oQnE+Xn1MBK+2ws0jYcI2rukDX9l75d/xSxhWkPv4KMeVbmfInp06sholL/jX4x4mxdocfwU/vkAx9xoNZS7+CBzMTvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999886; c=relaxed/simple;
	bh=KPZnZoCbTKXWQlH1k5JUwjdY5f3umA81P6TJk2eSXi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iuvxe97rs35LP1aWgmcT4sqpDyDuePnr8+tqsxwDsPVLmNDCRhxwpkmskFHOV3Z+ldB4/a3dpMilTLG5JKrMLNjKMna/4LN+0XnOJDnRu576548KzmVgW+az86U0rI7tNZPSU7UG61h9oqiMCGIbEBON/Q26v7mZAV/vif65opQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blgHimTv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blgHimTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791999882; x=1823535882;
  h=date:from:to:cc:subject:message-id;
  bh=KPZnZoCbTKXWQlH1k5JUwjdY5f3umA81P6TJk2eSXi0=;
  b=blgHimTvDm741HuQ/AARBrf+yHjbeqPLbYpKOQxz8M6xgf8Qib28iGSz
   UUl0GAgBVaHbrovge+dNXeEePvhzhgdvVe9UP5vMg1y687QHINeizsNbK
   4jdzworaYVV9S/T52py9m0Z1YfI0glPCzS9v/HaGmhV4IotBqRHfPmC1k
   KeuJfnu5eFidnG7Ot1yRAmSAt4+dxQgXndRaLWh94tIvqgVG41AjzHT5I
   B/0F9HfTln7LmBu33BpzGxLm8A5rrT/oNNMrArzMUj3uXR5YYTJhEeasB
   s6cE4AGQxcY5oxrGeuhHZL1B7VwkJU8PPAN8L1F9jXjibxovD9IE7gdsl
   w==;
X-CSE-ConnectionGUID: gZ24M8OdTQqSUOZ2n6diEA==
X-CSE-MsgGUID: gI+CIJR5QYOfjYPmYWgNJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="743957"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="743957"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 10:44:41 -0700
X-CSE-ConnectionGUID: OPB8w6dNSQyhdcIXMH3eww==
X-CSE-MsgGUID: a4UPPtYARNWh1QQDIB9i/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1546030"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Oct 2026 10:44:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH31p-00000000BFH-3918;
	Wed, 14 Oct 2026 17:44:37 +0000
Date: Wed, 14 Oct 2026 19:44:01 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 87/119] Diff in
 rust/kernel/rdma/sysfs.rs:21:
Message-ID: <202610141938.EhsKdn6G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   51164760f7c1e7761e793acedc65c2c014d0e92f
commit: 765dae76681da197c4fd0f489068cbad371c59f5 [87/119] rust: rdma: Own pinned provider data across device callbacks
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261014/202610141938.EhsKdn6G-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141938.EhsKdn6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610141938.EhsKdn6G-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/rdma/sysfs.rs:21:
    /// Checks a single sysfs path component before publishing its descriptor.
    pub(super) const fn valid_name(name: &CStr) -> bool {
        let bytes = name.to_bytes();
   -    if bytes.is_empty() || (bytes.len() == 1 && bytes[0] == b'.')
   +    if bytes.is_empty()
   +        || (bytes.len() == 1 && bytes[0] == b'.')
            || (bytes.len() == 2 && bytes[0] == b'.' && bytes[1] == b'.')
        {
            return false;
>> Diff in rust/kernel/rdma/sysfs.rs:21:
    /// Checks a single sysfs path component before publishing its descriptor.
    pub(super) const fn valid_name(name: &CStr) -> bool {
        let bytes = name.to_bytes();
   -    if bytes.is_empty() || (bytes.len() == 1 && bytes[0] == b'.')
   +    if bytes.is_empty()
   +        || (bytes.len() == 1 && bytes[0] == b'.')
            || (bytes.len() == 2 && bytes[0] == b'.' && bytes[1] == b'.')
        {
            return false;
>> Diff in rust/kernel/rdma/sysfs.rs:21:
    /// Checks a single sysfs path component before publishing its descriptor.
    pub(super) const fn valid_name(name: &CStr) -> bool {
        let bytes = name.to_bytes();
   -    if bytes.is_empty() || (bytes.len() == 1 && bytes[0] == b'.')
   +    if bytes.is_empty()
   +        || (bytes.len() == 1 && bytes[0] == b'.')
            || (bytes.len() == 2 && bytes[0] == b'.' && bytes[1] == b'.')
        {
            return false;
   make[2]: *** [Makefile:2038: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
