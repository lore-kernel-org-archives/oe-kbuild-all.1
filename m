Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9672B1C69D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 00:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774484021; cv=none; b=oJ18b27bVjPFfWvIiD0CLE19PC4D/rBjqz5e16ETlEMRPDrVN2pqSq4dJNpnh+rJzYgdBnqLJ+EvsCgKk6TFNC9FKaPQES8wfi2mZzPuuuG+14PJ+ZV8CAh9zYV6kcpb+8hLixT/A66ubHhfTwOf4ytCVBXYM5nVwV90jqwkF4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774484021; c=relaxed/simple;
	bh=ui6nRMQ95H8CLfsoUaG/+SVNBdIZLiBF4DNqgi0akOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BOjO+ZOe3iQeh6CLhAJ7CSjFpRQIj8TJd79aZ1RbvWRrp9wVf+UBSnmrtokawV+1vb/L4eEOeJGl4uwPSOrRYiHzUkcsR4n21foAlHp5Ya3jHjjZR0r8JsGl3JWlnzwwSX17hR00nJeDbG3x+a98oZRtvvyfn4k/ALygIiZZed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aC+lGdD9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aC+lGdD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774484018; x=1806020018;
  h=date:from:to:cc:subject:message-id;
  bh=ui6nRMQ95H8CLfsoUaG/+SVNBdIZLiBF4DNqgi0akOY=;
  b=aC+lGdD91YLaEn8w0yuEbbp3PT98SpCIaoAlx1HrcBZmfY/u10aZhOna
   hfI5UmwjJUNiYYYLDluLJkecA2vY7ynQqbZJc3I3hQcbnRwE9gODy6jQa
   GUA0x9XJ9DCqi/pkgLfqaPwxpCqdouj2wfqX/IF5Gh/oOJYUYLR8drxLx
   NYlTDH/9BRIiuR0noWv8JdKSVU146e5X2X/nkgle4jUz/KqXHwO+KY5r4
   KXlwm4Z0uPkkcMgLAON29CMeWAPnWGsLsczidTjZVmL0kwENDr62swGH9
   OccmYlRhee9mfqHOp7Raz8koi9fveXrncoaN3dL5X7vgK/EpoUnnP5ikm
   w==;
X-CSE-ConnectionGUID: gtuTjEb2T1+M7IPX9Gu92Q==
X-CSE-MsgGUID: GkcByIHaTImpv+hYl9WXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75649428"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75649428"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 17:13:37 -0700
X-CSE-ConnectionGUID: oqvin7zPSrih8oVEoW0HcA==
X-CSE-MsgGUID: TwkqMRbhRPWEVZUhkKgMaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229774006"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 25 Mar 2026 17:13:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5YLu-000000007Bt-0zDS;
	Thu, 26 Mar 2026 00:13:34 +0000
Date: Thu, 26 Mar 2026 01:13:14 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm-mmuv3 21/29] Diff in
 drivers/gpu/nova-core/mm/bar_user.rs:36:
Message-ID: <202603260149.fCxiTaMs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm-mmuv3
head:   10cd726db4d1939a94dc827460fcee48775d396d
commit: eec83c59402fa1cfbdd79ed90c6f434ce2290e59 [21/29] gpu: nova-core: mm: Add BAR1 user interface
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260326/202603260149.fCxiTaMs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260149.fCxiTaMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260149.fCxiTaMs-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/bar_user.rs:36:
    
    impl BarUser {
        /// Create a new [`BarUser`] with virtual address tracking.
   -    pub(crate) fn new(
   -        pdb_addr: VramAddress,
   -        chipset: Chipset,
   -        va_size: u64,
   -    ) -> Result<Self> {
   +    pub(crate) fn new(pdb_addr: VramAddress, chipset: Chipset, va_size: u64) -> Result<Self> {
            Ok(Self {
                vmm: Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?,
            })
>> Diff in drivers/gpu/nova-core/mm/bar_user.rs:36:
    
    impl BarUser {
        /// Create a new [`BarUser`] with virtual address tracking.
   -    pub(crate) fn new(
   -        pdb_addr: VramAddress,
   -        chipset: Chipset,
   -        va_size: u64,
   -    ) -> Result<Self> {
   +    pub(crate) fn new(pdb_addr: VramAddress, chipset: Chipset, va_size: u64) -> Result<Self> {
            Ok(Self {
                vmm: Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?,
            })
>> Diff in drivers/gpu/nova-core/mm/bar_user.rs:36:
    
    impl BarUser {
        /// Create a new [`BarUser`] with virtual address tracking.
   -    pub(crate) fn new(
   -        pdb_addr: VramAddress,
   -        chipset: Chipset,
   -        va_size: u64,
   -    ) -> Result<Self> {
   +    pub(crate) fn new(pdb_addr: VramAddress, chipset: Chipset, va_size: u64) -> Result<Self> {
            Ok(Self {
                vmm: Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?,
            })
   make[2]: *** [Makefile:1916: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
