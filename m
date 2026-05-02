Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A42368974
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777725667; cv=none; b=m0FN/Qo6zhdIbt4tWQu0hA9f1eRUKus0s5PzV5gcn4FaNzS0SG8eoFQd0uVb8uXfDMPk43aT2//1M+Df2AjIwnZ8LRSyWLwITixWwNuPtrpNeT6GOJiFrirSH2K8zkqsrykAP4Xz0ZbpEHQVu9b07Ydye5kd/IYIK/U2hJzJibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777725667; c=relaxed/simple;
	bh=mJ5KMuleZLJUMbVKAox1V1aLvGpre5NPtjUWevnDE18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bVYiIupU9aFQ04EvUBUmG64wrN+Mpfg1GdLy5X4p3vQCRqgyIOPkzW1+9FE8z+dZKM2dH3gL6cgRYsu5lFbI3JM4gU+fo6S1zX6PP/saxcwt4VWoB7YrNleiqBkUXVkJQ1c1vHobmhwwoDpM3PRD5g9T1ECwjPfkBrDcu7ZVhQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWfs6Xh/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWfs6Xh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777725665; x=1809261665;
  h=date:from:to:cc:subject:message-id;
  bh=mJ5KMuleZLJUMbVKAox1V1aLvGpre5NPtjUWevnDE18=;
  b=BWfs6Xh/F2066hU5s8nl1pmpFJDmytSmmNXZJHGTsZ1NPmoGYFunwTn5
   7TMfKZ5Rvijrm9vFO60SQBZiow7e++keRDt8vGj77WnYaB4seEheUkzRW
   Id08x1f8Tya3rqn6/pN1emkn5lamS/Ur55Jo3KvsDAv3ZUia9ThzkWZXL
   yadJuQEW4Afj8D5EZtgQb+vxlD5nCqLPI2xctOQgb9c4jZnKGMACjCPjj
   rY1D+26JiOq8ilghTe7wa8c77lrZxU4CIGgV07Mf8sMHL8cFAY/Ld2Pc4
   7Rt397UyUx1DBjGxIx6b6468oU06e5CKc3GoBKJHj/Z/WXq5z+8hJp1b2
   w==;
X-CSE-ConnectionGUID: UhNubFzUTXaO83rXh2g7ag==
X-CSE-MsgGUID: vm4pNCjJR7i46o3c6jXulw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78763231"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78763231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 05:41:04 -0700
X-CSE-ConnectionGUID: FT6Q0IerTgm8Tm/jaTZerw==
X-CSE-MsgGUID: yRLpjwkJTI2M32fJGFa1CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="235166741"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2026 05:41:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ9eW-000000005H3-3L4w;
	Sat, 02 May 2026 12:41:00 +0000
Date: Sat, 02 May 2026 14:40:06 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in drivers/gpu/nova-core/irq/intr_ctrl.rs:165:
Message-ID: <202605021413.lphfxsoZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-sync-completion-add-wait_for_completion_timeout/20260502-113009
head:   4e10e05ecde578bc23419ce04c62d82020b21d1a
commit: c68888fa03f6ef461818c3a5c1df0a22b462c7c0 gpu: nova-core: add INTR_CTRL interrupt controller API
date:   9 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260502/202605021413.lphfxsoZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021413.lphfxsoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021413.lphfxsoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/irq/intr_ctrl.rs:165:
    
    impl Subtree {
        /// Yields the two [`Leaf`] slots covered by this subtree's TOP bit.
   -    fn iter_leaves<'a>(
   -        self,
   -        ctrl: &'a IntrCtrl,
   -    ) -> impl Iterator<Item = Leaf<Idle>> + 'a {
   +    fn iter_leaves<'a>(self, ctrl: &'a IntrCtrl) -> impl Iterator<Item = Leaf<Idle>> + 'a {
            // Each subtree covers two adjacent leaf indices for all architectures.
            (0..2usize).filter_map(move |offset| {
                // self.index is 0-31 and offset is 0-1, so idx is at most 63.
>> Diff in drivers/gpu/nova-core/irq/intr_ctrl.rs:165:
    
    impl Subtree {
        /// Yields the two [`Leaf`] slots covered by this subtree's TOP bit.
   -    fn iter_leaves<'a>(
   -        self,
   -        ctrl: &'a IntrCtrl,
   -    ) -> impl Iterator<Item = Leaf<Idle>> + 'a {
   +    fn iter_leaves<'a>(self, ctrl: &'a IntrCtrl) -> impl Iterator<Item = Leaf<Idle>> + 'a {
            // Each subtree covers two adjacent leaf indices for all architectures.
            (0..2usize).filter_map(move |offset| {
                // self.index is 0-31 and offset is 0-1, so idx is at most 63.
>> Diff in drivers/gpu/nova-core/irq/intr_ctrl.rs:165:
    
    impl Subtree {
        /// Yields the two [`Leaf`] slots covered by this subtree's TOP bit.
   -    fn iter_leaves<'a>(
   -        self,
   -        ctrl: &'a IntrCtrl,
   -    ) -> impl Iterator<Item = Leaf<Idle>> + 'a {
   +    fn iter_leaves<'a>(self, ctrl: &'a IntrCtrl) -> impl Iterator<Item = Leaf<Idle>> + 'a {
            // Each subtree covers two adjacent leaf indices for all architectures.
            (0..2usize).filter_map(move |offset| {
                // self.index is 0-31 and offset is 0-1, so idx is at most 63.
   make[2]: *** [Makefile:1952: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
