Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5AE30B517
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 04:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778300846; cv=none; b=t15161xLMQtaXnmxvgOYzSez0WUr5iYt1jtQq8K9Ocv+H2zw8T088ETD1oj/dr67UeQ7Ea3T3rvoIWklSj+/5y1xNKlD6F6JjxAcr4wlhEY/wL2QHxnUaHJ0sI4d4L2vs+0Fr1J6PQ6x5hf3N8fhPSeHQn8O5jMsV+JRR2aSn3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778300846; c=relaxed/simple;
	bh=1XBkiyjVTlZbdvefieHAmSawseEvwG5nv2qM7L0rFLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q3i0ZUJhCWa1Beu8iRFo5TSQpDS4+PU/jwRtNxJstE8hnjZzEXn/psbS4yYFzTqfVRHo/Zl486aXrozLt5m7o0QEIEvqq87UOp67tGV2E5w993e7zzHCIb/LPRh4rFKVaTIsN+XZ4Vi9trBZS4bfnMaK5pVkJ2gIGX/51NJ0qFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=elPneN7J; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="elPneN7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778300845; x=1809836845;
  h=date:from:to:cc:subject:message-id;
  bh=1XBkiyjVTlZbdvefieHAmSawseEvwG5nv2qM7L0rFLw=;
  b=elPneN7JL2pftu1JWC+R6Nf7ioGyRjYt6kMUyBo81cjfi15mLZqS3yo3
   s4s3G5QoJJWLJ1WEbsCxWzjpxzE5z68CDiGbBHGHYUEGls0E2vVlXpkiT
   ngIS/7huSRL/41D44iUT7sJxVz56QNCWdBObdsDplSoubLWYFMX8a6WHH
   imVW/7C7wj/X2Iq5VobjFRsYvo2NR1GUV4JXGv4BZzNh7YskbZAbfl8XG
   5QaxQEN25s7Ju9EAUQxaCk2RZE20HncvfR5uMbHd6VmIjCrpv3ltZGAxM
   RQScWSl5Ls7ZUDHOgUqKXccC6uTznOQoyaNVkrNKNaYATgro9XWvZbWQf
   Q==;
X-CSE-ConnectionGUID: u90qmNeaTIGSavo4aSQF+w==
X-CSE-MsgGUID: G5It50dgTAudohrqH/jt7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="83146822"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="83146822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 21:27:22 -0700
X-CSE-ConnectionGUID: izz/7miWRlWIojnkqCzLvA==
X-CSE-MsgGUID: emGRVVGsQ+Wuk+sXXSDR7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="260669896"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2026 21:27:21 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLZHb-000000007MH-0den;
	Sat, 09 May 2026 04:27:19 +0000
Date: Sat, 09 May 2026 06:26:48 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 37/38] Diff in
 drivers/gpu/nova-core/mm.rs:52:
Message-ID: <202605090622.qjKMZdGT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   cdd1dd1e5a530d8f45f833cb477103783f85caec
commit: 699c2aa9545a6e983989cb5306bf1c65415fc3c1 [37/38] fixup! gpu: nova-core: mm: Add support to use PRAMIN windows to write to VRAM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260509/202605090622.qjKMZdGT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090622.qjKMZdGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090622.qjKMZdGT-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pramin.rs:299:
        define_pramin_write!(try_write64, u64);
    }
    
   -
    /// Offset within the VRAM region to use as the self-test area.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
    const SELFTEST_REGION_OFFSET: u64 = 0x1000;
   Diff in drivers/gpu/nova-core/mm/vmm.rs:170:
        }
    
        /// Allocate a contiguous virtual frame number range.
   -    fn alloc_vfn_range(
   -        &self,
   -        num_pages: usize,
   -        va_range: Option<Range<u64>>,
   -    ) -> Result<Vfn> {
   +    fn alloc_vfn_range(&self, num_pages: usize, va_range: Option<Range<u64>>) -> Result<Vfn> {
            let page_size: u64 = PAGE_SIZE.into_safe_cast();
    
            let start_vfn = match va_range {
>> Diff in drivers/gpu/nova-core/mm.rs:52:
        sync::Arc, //
    };
    
   -use crate::{
   -    driver::Bar0,
   -    gpu::Chipset,
   -};
   +use crate::{driver::Bar0, gpu::Chipset};
    
    pub(crate) use tlb::Tlb;
    
   Diff in drivers/gpu/nova-core/mm/vmm.rs:170:
        }
    
        /// Allocate a contiguous virtual frame number range.
   -    fn alloc_vfn_range(
   -        &self,
   -        num_pages: usize,
   -        va_range: Option<Range<u64>>,
   -    ) -> Result<Vfn> {
   +    fn alloc_vfn_range(&self, num_pages: usize, va_range: Option<Range<u64>>) -> Result<Vfn> {
            let page_size: u64 = PAGE_SIZE.into_safe_cast();
    
            let start_vfn = match va_range {
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pramin.rs:299:
        define_pramin_write!(try_write64, u64);
    }
    
   -
    /// Offset within the VRAM region to use as the self-test area.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
    const SELFTEST_REGION_OFFSET: u64 = 0x1000;
   Diff in drivers/gpu/nova-core/mm/pagetable/map.rs:340:
        ) -> Result {
            pt_map_dispatch!(
                self,
   -            install_mappings(dev, mm, pt_pages, page_table_allocs, vfn_start, pfns, writable)
   +            install_mappings(
   +                dev,
   +                mm,
   +                pt_pages,
   +                page_table_allocs,
   +                vfn_start,
   +                pfns,
   +                writable
   +            )
            )
        }
    
   Diff in drivers/gpu/nova-core/mm/pramin.rs:299:
        define_pramin_write!(try_write64, u64);
    }
    
   -
    /// Offset within the VRAM region to use as the self-test area.
    #[cfg(CONFIG_NOVA_MM_SELFTESTS)]
    const SELFTEST_REGION_OFFSET: u64 = 0x1000;
   Diff in drivers/gpu/nova-core/mm/vmm.rs:170:
        }
    
        /// Allocate a contiguous virtual frame number range.
   -    fn alloc_vfn_range(
   -        &self,
   -        num_pages: usize,
   -        va_range: Option<Range<u64>>,
   -    ) -> Result<Vfn> {
   +    fn alloc_vfn_range(&self, num_pages: usize, va_range: Option<Range<u64>>) -> Result<Vfn> {
            let page_size: u64 = PAGE_SIZE.into_safe_cast();
    
            let start_vfn = match va_range {
>> Diff in drivers/gpu/nova-core/mm.rs:52:
        sync::Arc, //
    };
    
   -use crate::{
   -    driver::Bar0,
   -    gpu::Chipset,
   -};
   +use crate::{driver::Bar0, gpu::Chipset};
    
    pub(crate) use tlb::Tlb;
    
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1916: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
