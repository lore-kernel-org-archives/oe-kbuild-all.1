Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3A3B640
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 00:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776297870; cv=none; b=cxmuDM84n3+fsTzcOXK+HFy24cZyP9HFR9P1BXS4fhtcwFngB73ryUU8sCMezOirdkWJ14QPtSqQFkJ6U7PFdMkuJMJ+iCpej5qP1JE25Yi1RH7fp6LcTxA+kvBGpfZmcAtZEN8h6nQ5c8nGiYYypWlgdmgMJm570+Iw3vOCsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776297870; c=relaxed/simple;
	bh=pv6QWlsXw2W6Au5RCiC5KTnN9Z3If3lCfrFi/Hx3yn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OHxZG1imV06RCzr1SEvfgl0GH8SiJUYshNLCNCEkKvJ0c3cBkdjRNi7sFXtYqJD+4IYiluu9a0aMc+192QR+Hffz8VyYaa+qUnUO6uTX7MW0HXireebXzofvIMCAHGGPuULOMQ65jy6W1QAc2mzB7xBnMoIAscUGIxrLKCu+DB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e20+FJ0+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e20+FJ0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776297868; x=1807833868;
  h=date:from:to:cc:subject:message-id;
  bh=pv6QWlsXw2W6Au5RCiC5KTnN9Z3If3lCfrFi/Hx3yn4=;
  b=e20+FJ0+pne5Zg5fiVfNYxA1KUBGtp5fSyTkXUDzru2yQXyWWM16lC1N
   /XaBFAeQRQ9mQ0EL+lyeaqZqSml1nmV6Jojqlbvkx1J7HGbYWO9j9PfNm
   D8bImop+rerryr5TGMWFQKEU01n8mnXjhAh7Ndd4631czeNsNpz3/fWx9
   Ergy5vEjqbtiiUYWDv1oGpnUM8IxUZ/fDxRinptfovk/WFC54Dgv1Jloi
   L+98yxRzWm24ruae/fobgs0e7TA81IIBN8+XL76ZQ7ZafRipAI1ZfkIq0
   T7WmMVv1SD51EUqHUHojAacfXe91buVR7R3VJflasTt/z/Z0MDTNJtLKg
   A==;
X-CSE-ConnectionGUID: Q/NLKcsGRVm2edkZ25eY/Q==
X-CSE-MsgGUID: +V53FikER6mfmkRq8pjufQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77165388"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77165388"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 17:04:27 -0700
X-CSE-ConnectionGUID: IbgxC/gCRliVk+MepN6N9g==
X-CSE-MsgGUID: WSuS/jEsQwqtWpyW6l/o0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="227911238"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Apr 2026 17:04:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDADX-000000000rn-3VJ1;
	Thu, 16 Apr 2026 00:04:23 +0000
Date: Thu, 16 Apr 2026 02:03:50 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 22/27] Diff in
 drivers/gpu/nova-core/mm/pagetable.rs:386:
Message-ID: <202604160136.AsRENPcs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   8b41971bcf8f60f608baf4ff9f70bd04a6bc17a0
commit: 3d14742124eb2a0ca541990a357c66f3efdbf0a2 [22/27] gpu: nova-core: mm: Add BAR1 memory management self-tests
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260416/202604160136.AsRENPcs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160136.AsRENPcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160136.AsRENPcs-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:386:
    
    /// Check if the PDB has valid, VRAM-backed page tables.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn check_pdb_inner<M: MmuConfig>(
   -    pramin: &pramin::Pramin,
   -    pdb_addr: VramAddress,
   -) -> Result {
   +fn check_pdb_inner<M: MmuConfig>(pramin: &pramin::Pramin, pdb_addr: VramAddress) -> Result {
        let mut window = pramin.get_window()?;
        let raw = window.try_read64(pdb_addr.raw())?;
    
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:386:
    
    /// Check if the PDB has valid, VRAM-backed page tables.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn check_pdb_inner<M: MmuConfig>(
   -    pramin: &pramin::Pramin,
   -    pdb_addr: VramAddress,
   -) -> Result {
   +fn check_pdb_inner<M: MmuConfig>(pramin: &pramin::Pramin, pdb_addr: VramAddress) -> Result {
        let mut window = pramin.get_window()?;
        let raw = window.try_read64(pdb_addr.raw())?;
    
   Diff in drivers/gpu/nova-core/mm/pagetable/ver2.rs:261:
        pub(super) small: Pde,
    }
    
   -
    impl DualPde {
        /// Check if the big page table pointer is valid.
        fn has_big(&self) -> bool {
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:386:
    
    /// Check if the PDB has valid, VRAM-backed page tables.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
   -fn check_pdb_inner<M: MmuConfig>(
   -    pramin: &pramin::Pramin,
   -    pdb_addr: VramAddress,
   -) -> Result {
   +fn check_pdb_inner<M: MmuConfig>(pramin: &pramin::Pramin, pdb_addr: VramAddress) -> Result {
        let mut window = pramin.get_window()?;
        let raw = window.try_read64(pdb_addr.raw())?;
    
   make[2]: *** [Makefile:1916: rustfmt] Error 123
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
