Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932031632C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 03:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652038; cv=none; b=ZlXO5lelSKUXqx1hMkf3Wa7Sl1KDulVPWvMyaaZBQk2Y2cckJv9AaEl2KFues9/9YlcTY4pSvM3U18B+XNK3GNp2bf533yhKoxFKuXkImY+UAFmF5f6Ub+Rke7JhEt5nBIrij+5mF1uUZdG+8I0jo1/N8lE1fH/zYgDi2U4TmoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652038; c=relaxed/simple;
	bh=BaoKPp369LWk9eG96OtM4P5MiLNocZmZBdRElcGcs4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uk1FBulHFTfPwMoI1N8sWUWDqNU4RnCw7CIKa9G8P6fwEy9mUetPNYSFQ5FHBDBA0pG/s74FE7D33HIclSPoUseEyZMnub/tXpKd4RUgkW5O64yvBUk9sGTK+x6iAt0Yev0BCGPtgRFOTa9/uBVk/FCshwMTFEV1MiV9h0y11VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO2TvGau; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO2TvGau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743652036; x=1775188036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaoKPp369LWk9eG96OtM4P5MiLNocZmZBdRElcGcs4Q=;
  b=DO2TvGau/PsUGA+4zJJXkc3NJQU+oezaBpCgy3OoQw1U39FGta0bUrYU
   EkJGgpR7O3Z4Nh4FSavKHV5JpdquGOOVLBYG2I5RR0QtXZXAayHuj/djt
   PbRmZlEhoPBkpye1lbYNPhSGgBILOedFAMmYAVQ9j0rzmGFTlhYc26Yzy
   EVH/WeaNRj1N55vhBTrKKAG6C3RAwQbzQ91y75lds0rKAIxUTkLBIjnrH
   /DYWEY3N5Eldm//3FwNN4EorUCafEIsbMNpa66crFMYz9S+QIXjGx22Ro
   XFmbICaqJ4ig3D7LhqEx/rzb6I0euXLwLkTWqOlvc847tdXKeh0Mc2Lcq
   Q==;
X-CSE-ConnectionGUID: IoPVEwR0S2GLb7zAhFdYLg==
X-CSE-MsgGUID: dPEvLiJORW6cQJcmBYik5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56416718"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56416718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 20:47:14 -0700
X-CSE-ConnectionGUID: ZOWoLhYMSba8BddGli0bUw==
X-CSE-MsgGUID: R8XUu+CpRju/UBN2vBSv5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127797217"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2025 20:47:11 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0BXp-00003Z-1S;
	Thu, 03 Apr 2025 03:47:09 +0000
Date: Thu, 3 Apr 2025 11:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 23/23] Diff in drivers/gpu/nova-core/bios.rs at line
 68:
Message-ID: <202504031136.Dar9tfdr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   9b32eb412238889329b6227230aa25a70c8c9c13
commit: 9b32eb412238889329b6227230aa25a70c8c9c13 [23/23] Add support to fetch the falcon data ptr from the PciAt image. Gives 75b60
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250403/202504031136.Dar9tfdr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031136.Dar9tfdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031136.Dar9tfdr-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in rust/kernel/reg.rs at line 1:
    
   -
    
>> Diff in drivers/gpu/nova-core/bios.rs at line 68:
            let ptr: *const u32 = (self.bios_vec.as_ptr() as usize + addr as usize) as *const u32;
            unsafe { core::ptr::read_unaligned(ptr) }
        }
   -    
   +
        fn rd32_verbose(&self, offset: isize, prefix: &str) -> u32 {
   -        pr_info!("{} offset: {:#x}, image0_size: {:#x}, imaged_addr: {:#x}\n", prefix, offset, self.image0_size, self.imaged_addr);
   +        pr_info!(
   +            "{} offset: {:#x}, image0_size: {:#x}, imaged_addr: {:#x}\n",
   +            prefix,
   +            offset,
   +            self.image0_size,
   +            self.imaged_addr
   +        );
            let mut addr = offset;
            if addr >= self.image0_size && self.imaged_addr != 0 {
                addr -= self.image0_size;
   Diff in drivers/gpu/nova-core/bios.rs at line 77:
                addr += self.imaged_addr as isize;
            }
            let ptr: *const u32 = (self.bios_vec.as_ptr() as usize + addr as usize) as *const u32;
   -        pr_info!("{} addr: {:#x}, ptr: {:#x}, value: {:#x}\n", prefix, addr, ptr as usize, unsafe { core::ptr::read_unaligned(ptr) });
   +        pr_info!(
   +            "{} addr: {:#x}, ptr: {:#x}, value: {:#x}\n",
   +            prefix,
   +            addr,
   +            ptr as usize,
   +            unsafe { core::ptr::read_unaligned(ptr) }
   +        );
            unsafe { core::ptr::read_unaligned(ptr) }
        }
    
   Diff in drivers/gpu/nova-core/bios.rs at line 162:
            }
    
            if bit_p.version == 2 && bit_p.length >= 4 {
   -            pr_info!("joel reading pmu table base address at bit_p.offset {:#x} within fwsec\n", bit_p.offset);
   +            pr_info!(
   +                "joel reading pmu table base address at bit_p.offset {:#x} within fwsec\n",
   +                bit_p.offset
   +            );
                data = bios.rd32_verbose(bit_p.offset as isize, "joel");
            }
            if data != 0 {
   Diff in drivers/gpu/nova-core/gpu.rs at line 5:
    };
    
    use crate::bios::Bios;
   -use crate::vbios::Vbios;
    use crate::dma::DmaObject;
    use crate::driver::Bar0;
    use crate::falcon::FalconBromParams;
   Diff in drivers/gpu/nova-core/gpu.rs at line 15:
    };
    use crate::timer::Timer;
    use crate::util;
   +use crate::vbios::Vbios;
    use crate::{devinit, regs};
    use core::fmt;
    use core::time::Duration;
   Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
   -use core::convert::TryFrom;
    use crate::driver::Bar0;
   -use kernel::error::Result;
   -use kernel::devres::Devres;
    use crate::regs::RomShadow;
   +use core::convert::TryFrom;
   +use kernel::devres::Devres;
   +use kernel::error::Result;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub(crate) fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 68:
            self.read_more(bytes)
        }
    
   -    pub(crate) fn read_bios_image_at_offset(&mut self, offset: usize, bytes: usize) -> Result<BiosImage<'_>> {
   +    pub(crate) fn read_bios_image_at_offset(
   +        &mut self,
   +        offset: usize,
   +        bytes: usize,
   +    ) -> Result<BiosImage<'_>> {
            if offset + bytes > self.data.len() {
                match self.read_more_at_offset(offset as u32, bytes as u32) {
   -                Ok(_) => {},
   +                Ok(_) => {}
                    Err(e) => {
                        pr_info!("Failed to read more at offset {:#x}: {:?}\n", offset, e);
                        return Err(e);
   Diff in drivers/gpu/nova-core/vbios.rs at line 82:
            match BiosImage::try_from(&self.data[offset..offset + bytes]) {
                Ok(image) => Ok(image),
                Err(e) => {
   -                pr_info!("Failed to create BiosImage at offset {:#x}: {:?}\n", offset, e);
   +                pr_info!(
   +                    "Failed to create BiosImage at offset {:#x}: {:?}\n",
   +                    offset,
   +                    e
--
   +        pr_info!(
   +            "Found ROM header with PCIR ptr: {:#x}\n",
   +            rom_header.pci_data_struct_ptr
   +        );
    
            // Get the PCI Data Structure using the pointer from the ROM header
            let pcir_offset = rom_header.pci_data_struct_ptr as usize;
   Diff in drivers/gpu/nova-core/vbios.rs at line 812:
            if pcir_offset + 24 > data.len() {
   -            pr_info!("PCIR offset {:#x} out of bounds (data length: {})\n", pcir_offset, data.len());
   +            pr_info!(
   +                "PCIR offset {:#x} out of bounds (data length: {})\n",
   +                pcir_offset,
   +                data.len()
   +            );
                pr_info!("Consider reading more data for construction of BiosImage\n");
                return Err(EINVAL);
            }
   Diff in drivers/gpu/nova-core/vbios.rs at line 819:
            let pcir = match PcirStruct::try_from(pcir_data) {
                Ok(pcir) => pcir,
                Err(e) => {
   -                pr_info!("Failed to create PcirStruct at offset {:#x}: {:?}\n", pcir_offset, e);
   +                pr_info!(
   +                    "Failed to create PcirStruct at offset {:#x}: {:?}\n",
   +                    pcir_offset,
   +                    e
   +                );
                    return Err(e);
                }
            };
   Diff in drivers/gpu/nova-core/vbios.rs at line 831:
            };
    
            if let Some(ref npde) = npde {
   -            pr_info!("Found NPDE structure with sub-image length: {:#x}\n", npde.subimage_len);
   +            pr_info!(
   +                "Found NPDE structure with sub-image length: {:#x}\n",
   +                npde.subimage_len
   +            );
            }
    
            Ok(BiosImageBase {
   Diff in drivers/gpu/nova-core/vbios.rs at line 846:
    impl PciAtBiosImage<'_> {
        /// Find a byte pattern in a slice
        fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Option<usize> {
   -        haystack.windows(needle.len())
   +        haystack
   +            .windows(needle.len())
                .position(|window| window == needle)
        }
    
   Diff in drivers/gpu/nova-core/vbios.rs at line 875:
            let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
    
            // Make sure we don't go out of bounds
   -        pr_info!("Falcon data bit token data offset: {:#x}\n", token.data_offset);
   +        pr_info!(
   +            "Falcon data bit token data offset: {:#x}\n",
   +            token.data_offset
   +        );
            if token.data_offset as usize + 4 > self.base.data.len() {
                return Err(EINVAL);
            }
   Diff in drivers/gpu/nova-core/vbios.rs at line 884:
            let offset = token.data_offset as usize;
            let bytes: [u8; 4] = match self.base.data[offset..offset + 4].try_into() {
                Ok(bytes) => bytes,
   -            Err(_) => { return Err(EINVAL); }
   +            Err(_) => {
   +                return Err(EINVAL);
   +            }
            };
    
            let data_ptr = u32::from_le_bytes(bytes);
   Diff in drivers/gpu/nova-core/vbios.rs at line 917:
            pr_info!("Bit header token_size: {:#?}\n", bit_header.token_size);
    
            // print the bit header token_entries
   -        pr_info!("Bit header token_entries: {:#?}\n", bit_header.token_entries);
   +        pr_info!(
   +            "Bit header token_entries: {:#?}\n",
   +            bit_header.token_entries
   +        );
    
            // print the bit header checksum
            pr_info!("Bit header checksum: {:#?}\n", bit_header.checksum);
   Diff in drivers/gpu/nova-core/vbios.rs at line 924:
    
   -        Ok(PciAtBiosImage { base, bit_header: Some(bit_header),
   -                bit_offset: Some(bit_offset) })
   +        Ok(PciAtBiosImage {
   +            base,
   +            bit_header: Some(bit_header),
   +            bit_offset: Some(bit_offset),
   +        })
        }
    }
    
>> Diff in drivers/gpu/nova-core/bios.rs at line 68:
            let ptr: *const u32 = (self.bios_vec.as_ptr() as usize + addr as usize) as *const u32;
            unsafe { core::ptr::read_unaligned(ptr) }
        }
   -    
   +
        fn rd32_verbose(&self, offset: isize, prefix: &str) -> u32 {
   -        pr_info!("{} offset: {:#x}, image0_size: {:#x}, imaged_addr: {:#x}\n", prefix, offset, self.image0_size, self.imaged_addr);
   +        pr_info!(
   +            "{} offset: {:#x}, image0_size: {:#x}, imaged_addr: {:#x}\n",
   +            prefix,
   +            offset,
   +            self.image0_size,
   +            self.imaged_addr
   +        );
            let mut addr = offset;
            if addr >= self.image0_size && self.imaged_addr != 0 {
                addr -= self.image0_size;
   Diff in drivers/gpu/nova-core/bios.rs at line 77:
                addr += self.imaged_addr as isize;
            }
            let ptr: *const u32 = (self.bios_vec.as_ptr() as usize + addr as usize) as *const u32;
   -        pr_info!("{} addr: {:#x}, ptr: {:#x}, value: {:#x}\n", prefix, addr, ptr as usize, unsafe { core::ptr::read_unaligned(ptr) });
   +        pr_info!(
   +            "{} addr: {:#x}, ptr: {:#x}, value: {:#x}\n",
   +            prefix,
   +            addr,
   +            ptr as usize,
   +            unsafe { core::ptr::read_unaligned(ptr) }
   +        );
            unsafe { core::ptr::read_unaligned(ptr) }
        }
    
   Diff in drivers/gpu/nova-core/bios.rs at line 162:
            }
    
            if bit_p.version == 2 && bit_p.length >= 4 {
   -            pr_info!("joel reading pmu table base address at bit_p.offset {:#x} within fwsec\n", bit_p.offset);
   +            pr_info!(
   +                "joel reading pmu table base address at bit_p.offset {:#x} within fwsec\n",
   +                bit_p.offset
   +            );
                data = bios.rd32_verbose(bit_p.offset as isize, "joel");
            }
            if data != 0 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
   -use core::convert::TryFrom;
    use crate::driver::Bar0;
   -use kernel::error::Result;
   -use kernel::devres::Devres;
    use crate::regs::RomShadow;
   +use core::convert::TryFrom;
   +use kernel::devres::Devres;
   +use kernel::error::Result;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub(crate) fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 68:
            self.read_more(bytes)
        }
    
   -    pub(crate) fn read_bios_image_at_offset(&mut self, offset: usize, bytes: usize) -> Result<BiosImage<'_>> {
   +    pub(crate) fn read_bios_image_at_offset(
   +        &mut self,
   +        offset: usize,
   +        bytes: usize,
   +    ) -> Result<BiosImage<'_>> {
            if offset + bytes > self.data.len() {
                match self.read_more_at_offset(offset as u32, bytes as u32) {
   -                Ok(_) => {},
   +                Ok(_) => {}
                    Err(e) => {
                        pr_info!("Failed to read more at offset {:#x}: {:?}\n", offset, e);
                        return Err(e);
   Diff in drivers/gpu/nova-core/vbios.rs at line 82:
            match BiosImage::try_from(&self.data[offset..offset + bytes]) {
                Ok(image) => Ok(image),
                Err(e) => {
   -                pr_info!("Failed to create BiosImage at offset {:#x}: {:?}\n", offset, e);
   +                pr_info!(
   +                    "Failed to create BiosImage at offset {:#x}: {:?}\n",
   +                    offset,
   +                    e
   +                );
                    Err(e)
                }
            }
   Diff in drivers/gpu/nova-core/vbios.rs at line 90:
    
        /// Probe for VBIOS extraction
        pub(crate) fn probe(bar0: &'a Devres<Bar0>) -> Result<Self> {
   -        let mut vbios = Self { bar0, version: 0,  data: KVec::new() };
   +        let mut vbios = Self {
   +            bar0,
   +            version: 0,
   +            data: KVec::new(),
   +        };
    
            // Enable ROM shadowing so the ROM is accessible on the BAR

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
