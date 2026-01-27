Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFEBFBF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 01:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476291; cv=none; b=SRm/lqll2+z0QTeSezT5e6yrJWOGO5v0yBi24QK3+BNUvkwmoiUpd3mNf6qM90qutwQU4SqGh1HJu0kxYjAoxzanBjdX8f4uev+ppZ6IbPaRqpaR+mcZxn9kjPGs4QakU1A16w/S4Xtw85O8YTjpw42Jt4Gaq6qP3Mf2i3s709o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476291; c=relaxed/simple;
	bh=XRNjLJ7v5d2ZZlvVfQbnsWka/PRbYWYaj8Y+h8rEfaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tyuohCkN7i62gBbIcskMQIVFBgC3OKmf5I20m+vvY0Z2e1/1B3BomoZ0CJfD13e4uLhvWgZP+yPUyfKa82LrqYugD74X2h8ekgOrLyy1LqlXpVlzTheX86eVVcEt+05TockTAxA6H0ejCMCiqhc3ohWN8rwFApY7QJqxsHuinao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2bvWapE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2bvWapE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769476288; x=1801012288;
  h=date:from:to:cc:subject:message-id;
  bh=XRNjLJ7v5d2ZZlvVfQbnsWka/PRbYWYaj8Y+h8rEfaM=;
  b=c2bvWapEREasEDopHnfNVZBM+1esdj70y2FtBixG4XorufO9xhp+RsYB
   G/E85E/YrjjJbRIxcQxCNjxD0k7Ct+3jIW/1kKkmeoKuziBLHJG7t3RNB
   76V06IfQmVZ/iMqyhwM4WR3wlM7VDgyixYn93w2LVHwgqnATpTBzrPVar
   Q+g75tEuAiXqZ9n41jb8kWAC/qf+eLe9DUwAPJQ6j35IJvzAAonLfJWtF
   VPyr4k5NvAJk0aiTXC8JkiyvPnZg1oOk8RpLKXzDwCUo51BhgAFuf71ZX
   SZ2UUnRW++z3XhzTaVyGQh6KDZWiP/KtHtqPC9LykoonhvNA2LWj10xTe
   Q==;
X-CSE-ConnectionGUID: 7bCTyYyESIC+Uueeg6eV5g==
X-CSE-MsgGUID: WvLtPJUoT46Na4M8n2cYGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81296386"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81296386"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:11:27 -0800
X-CSE-ConnectionGUID: utwl8UrEQWKHxi04f17FUA==
X-CSE-MsgGUID: lDKVo3dZSZSpn8Fn6ONP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="230786638"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jan 2026 17:11:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkXc4-000000001eX-0Oq1;
	Tue, 27 Jan 2026 01:11:24 +0000
Date: Tue, 27 Jan 2026 02:10:38 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 21/30] Diff in
 drivers/gpu/nova-core/mm/vmm.rs:137:
Message-ID: <202601270210.yB9yuVQx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   cd719274b7cc0f4d4bac9bcb0043b76437ff5a16
commit: 0c08af0b6726401fd21a0a6de7237e54ab3591c5 [21/30] nova-core: mm: Add Virtual Memory Manager
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260127/202601270210.yB9yuVQx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270210.yB9yuVQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270210.yB9yuVQx-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:137:
        ///
        /// Walks the page table hierarchy and allocates any missing intermediate
        /// tables using the buddy allocator from [`GpuMm`].
   -    pub(crate) fn map_page(
   -        &mut self,
   -        mm: &GpuMm,
   -        vfn: Vfn,
   -        pfn: Pfn,
   -        writable: bool,
   -    ) -> Result {
   +    pub(crate) fn map_page(&mut self, mm: &GpuMm, vfn: Vfn, pfn: Pfn, writable: bool) -> Result {
            // Create page table walker.
            let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
    
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:137:
        ///
        /// Walks the page table hierarchy and allocates any missing intermediate
        /// tables using the buddy allocator from [`GpuMm`].
   -    pub(crate) fn map_page(
   -        &mut self,
   -        mm: &GpuMm,
   -        vfn: Vfn,
   -        pfn: Pfn,
   -        writable: bool,
   -    ) -> Result {
   +    pub(crate) fn map_page(&mut self, mm: &GpuMm, vfn: Vfn, pfn: Pfn, writable: bool) -> Result {
            // Create page table walker.
            let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
    
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:137:
        ///
        /// Walks the page table hierarchy and allocates any missing intermediate
        /// tables using the buddy allocator from [`GpuMm`].
   -    pub(crate) fn map_page(
   -        &mut self,
   -        mm: &GpuMm,
   -        vfn: Vfn,
   -        pfn: Pfn,
   -        writable: bool,
   -    ) -> Result {
   +    pub(crate) fn map_page(&mut self, mm: &GpuMm, vfn: Vfn, pfn: Pfn, writable: bool) -> Result {
            // Create page table walker.
            let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
    
   make[2]: *** [Makefile:1871: rustfmt] Error 123
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
