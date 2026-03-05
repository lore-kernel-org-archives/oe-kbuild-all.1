Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB551BF33
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772695365; cv=none; b=kXHFv1H5k4nyNffd+MIaKM/3/KhU5CgD+aUPxLaW6QghYDxOZqrrlTzip5LZCmUfXoGkDx1sPiqCYsW0r/ie9+ZyAltD0iOa7WHLrwV5DM5yO8y8mp5sOAiU9MAg+QnJkigLSHK5phPw+LvssmBKkmsCqOUW2U/lo36U+fDxVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772695365; c=relaxed/simple;
	bh=rqj5hmcHLlICUpaYAHFsIWvWUhSexDk4RQaBRv9j5mY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PL6CLySzp7vYRUx3wbnO7AHDXt3wz93P/soxov7gc++ZjeT0Bc9ufcG423yariKBvz6PM2CfIZENbIcbhyuQnNOBHCClSpAy/gHpZULx2I0mY2nsP4bBbXrp3K7he/SuXu1dp1r9DeUw0XuNNcbXlzA2LwUCBfw7q6JwZuovIIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4jcnkh9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4jcnkh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772695363; x=1804231363;
  h=date:from:to:cc:subject:message-id;
  bh=rqj5hmcHLlICUpaYAHFsIWvWUhSexDk4RQaBRv9j5mY=;
  b=c4jcnkh9hC1UwWOHRyP0Jr/eQ9aZTduAIlCSNr99XpIbEtoPQCiE2JGc
   57VboK+GApE1dpVE4KcH4Gei/P4hbD7+cfDs/XuqAQ16UN50lLTE5WPAi
   KUUxxkJ7xIb0EKCI+lneFemNKXwC+Y07PnHH6kHTosBFVI1rVZMPb+4WR
   oppNbx7voObT2msXlwyYdc7U0I/fXLlM2GbAUz+e+by1iHJnHrcssUPk+
   bPMmeM4rAYVs+MIGIaUDtIrrNLZlM9hEA+MMIha5l2EQzy+xRyjs5oVHp
   kSbz9TZxuWRF0IXuw4QsSF9ZfOsp2nJ8SodIY/0ymhdK/Re7D8/bKMswX
   g==;
X-CSE-ConnectionGUID: X1UzOVh/QhK6kSvCdFW20Q==
X-CSE-MsgGUID: nM2mXthYQFCtmesZCarBiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="76377239"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="76377239"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:22:43 -0800
X-CSE-ConnectionGUID: O+y4mj+8S7KYuGez8OLoHQ==
X-CSE-MsgGUID: Rp7uBau9Sa+JRqHAI1BKJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="245107173"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 23:22:42 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy32d-000000001y5-2pCo;
	Thu, 05 Mar 2026 07:22:39 +0000
Date: Thu, 05 Mar 2026 08:22:00 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 7/24] Diff in
 drivers/gpu/nova-core/mm/pramin.rs:75:
Message-ID: <202603050805.8GozK64K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   1332f2111dd980926c1437960a555ac5e2049edc
commit: 65b7bdc85083722d7dfebc403f0ba4732077abfa [7/24] gpu: nova-core: mm: Add support to use PRAMIN windows to write to VRAM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260305/202603050805.8GozK64K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050805.8GozK64K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050805.8GozK64K-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/pramin.rs:75:
    use kernel::devres::Devres;
    use kernel::io::Io;
    use kernel::new_mutex;
   -use kernel::revocable::RevocableGuard;
    use kernel::prelude::*;
   +use kernel::revocable::RevocableGuard;
    use kernel::sizes::{
        SZ_1M,
        SZ_64K, //
   Diff in drivers/gpu/nova-core/mm/pramin.rs:179:
        /// Create a pin-initializer for PRAMIN.
        ///
        /// `vram_region` specifies the valid VRAM address range.
   -    pub(crate) fn new(bar: Arc<Devres<Bar0>>, vram_region: Range<u64>) -> Result<impl PinInit<Self>> {
   +    pub(crate) fn new(
   +        bar: Arc<Devres<Bar0>>,
   +        vram_region: Range<u64>,
   +    ) -> Result<impl PinInit<Self>> {
            let bar_access = bar.try_access().ok_or(ENODEV)?;
            let current_base = Self::read_window_base(&bar_access);
    
   Diff in drivers/gpu/nova-core/gsp/commands.rs:203:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            Ok(GetGspStaticInfoReply {
                gpu_name: msg.gpu_name_str(),
   Diff in drivers/gpu/nova-core/gsp/commands.rs:236:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
   Diff in drivers/gpu/nova-core/gsp/commands.rs:203:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            Ok(GetGspStaticInfoReply {
                gpu_name: msg.gpu_name_str(),
   Diff in drivers/gpu/nova-core/gsp/commands.rs:236:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
>> Diff in drivers/gpu/nova-core/regs.rs:14:
    
    use crate::{
        driver::Bar0,
   -    mm::pramin::Bar0WindowTarget,
        falcon::{
            DmaTrfCmdSize,
            FalconCoreRev,
   Diff in drivers/gpu/nova-core/regs.rs:33:
            Architecture,
            Chipset, //
        },
   +    mm::pramin::Bar0WindowTarget,
        num::FromSafeCast,
    };
    
   Diff in drivers/gpu/nova-core/gsp/commands.rs:203:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            Ok(GetGspStaticInfoReply {
                gpu_name: msg.gpu_name_str(),
   Diff in drivers/gpu/nova-core/gsp/commands.rs:236:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
>> Diff in drivers/gpu/nova-core/mm/pramin.rs:75:
    use kernel::devres::Devres;
    use kernel::io::Io;
    use kernel::new_mutex;
   -use kernel::revocable::RevocableGuard;
    use kernel::prelude::*;
   +use kernel::revocable::RevocableGuard;
    use kernel::sizes::{
        SZ_1M,
        SZ_64K, //
   Diff in drivers/gpu/nova-core/mm/pramin.rs:179:
        /// Create a pin-initializer for PRAMIN.
        ///
        /// `vram_region` specifies the valid VRAM address range.
   -    pub(crate) fn new(bar: Arc<Devres<Bar0>>, vram_region: Range<u64>) -> Result<impl PinInit<Self>> {
   +    pub(crate) fn new(
   +        bar: Arc<Devres<Bar0>>,
   +        vram_region: Range<u64>,
   +    ) -> Result<impl PinInit<Self>> {
            let bar_access = bar.try_access().ok_or(ENODEV)?;
            let current_base = Self::read_window_base(&bar_access);
    
>> Diff in drivers/gpu/nova-core/regs.rs:14:
    
    use crate::{
        driver::Bar0,
   -    mm::pramin::Bar0WindowTarget,
        falcon::{
            DmaTrfCmdSize,
            FalconCoreRev,
   Diff in drivers/gpu/nova-core/regs.rs:33:
            Architecture,
            Chipset, //
        },
   +    mm::pramin::Bar0WindowTarget,
        num::FromSafeCast,
    };
    
>> Diff in drivers/gpu/nova-core/mm/pramin.rs:75:
    use kernel::devres::Devres;
    use kernel::io::Io;
    use kernel::new_mutex;
   -use kernel::revocable::RevocableGuard;
    use kernel::prelude::*;
   +use kernel::revocable::RevocableGuard;
    use kernel::sizes::{
        SZ_1M,
        SZ_64K, //
   Diff in drivers/gpu/nova-core/mm/pramin.rs:179:
        /// Create a pin-initializer for PRAMIN.
        ///
        /// `vram_region` specifies the valid VRAM address range.
   -    pub(crate) fn new(bar: Arc<Devres<Bar0>>, vram_region: Range<u64>) -> Result<impl PinInit<Self>> {
   +    pub(crate) fn new(
   +        bar: Arc<Devres<Bar0>>,
   +        vram_region: Range<u64>,
   +    ) -> Result<impl PinInit<Self>> {
            let bar_access = bar.try_access().ok_or(ENODEV)?;
            let current_base = Self::read_window_base(&bar_access);
    
   Diff in rust/kernel/gpu/buddy.rs:305:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
   Diff in rust/kernel/gpu/buddy.rs:305:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
   Diff in rust/kernel/gpu/buddy.rs:305:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
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
