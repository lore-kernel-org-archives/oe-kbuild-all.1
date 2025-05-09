Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89088239090
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811962; cv=none; b=hM0ifS4CCcQOxIjBxGG+1YPOBfFJpoAzlUIRtNiMYqbtffoCQUzDToyMimaylS+TheQgW/ohyvcKtddL8xl8Y/XHBw/pwdBxHRmrx7Q4GDqpO6iXox5h0I8gKPcJzinBDOUOVuVEkxVTL6Nk0tE+1aBv0wCHdriprqJdxw5WhUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811962; c=relaxed/simple;
	bh=WjwlWWjm1bsIqujLBuGDl837ofHqjMJxaTku5ey7XYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pMZCxQwzRYq8e429EBVK/pxTZQcv06w+XScBjaONtydT5BXqDb+HuZzNzfe8D+5Ra/DPA2taslij3I74UU5SbI14hBIU0OHBIY1Nmya95zLdkBueolDbqaHkqQgNjWHQRvI84E4hG+IoO1ee5bFUwE3oakjOfNPj1gnaz/E/0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLyPwi0o; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLyPwi0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746811960; x=1778347960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WjwlWWjm1bsIqujLBuGDl837ofHqjMJxaTku5ey7XYw=;
  b=hLyPwi0o+8gzm65XSKpRFRW6OyVCFkUPKR7tvGf3FkCrtkXHzKkaq0nl
   n0P2GDjH/ityeNfa0/Csm9sWL7Ec+RM03kUboAe+Hpc4dggQ42snP2JUL
   Fd9G5PCxR/GBvsOpT/UkDPy0VIWGHwUTa+BHE//GLCqXn1pkMKA/iiIC7
   bilfZN7IInSrjTOYcA1bMG/hsXPAyIa9mhncuYsy3QJ7YJpGhhjD4Wsn9
   43ddLBTX/lpa7kDFrSr2FvC7YloyUliawAAUrU1PIz6mmkQYJyHM3lzeB
   uS99/GztIuW6ig0+83MyqaPZXl4AtS5qpz4C0N3gqNpnV1ocmkYEPgBrX
   Q==;
X-CSE-ConnectionGUID: 5Aou2HseQgmXRA3S+2UC8w==
X-CSE-MsgGUID: OM90oMxFT9OwKVHMKTqZjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66059007"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="66059007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 10:32:39 -0700
X-CSE-ConnectionGUID: PYa0Q7I/QTKAKLq6ZeXmDA==
X-CSE-MsgGUID: Prf4A+jQSHSrLUI2khfzkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137190953"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2025 10:32:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDRaN-000CIt-1M;
	Fri, 09 May 2025 17:32:35 +0000
Date: Sat, 10 May 2025 01:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/dave-test 6/12] Diff in
 drivers/gpu/nova-core/driver_dave.rs at line 1:
Message-ID: <202505100154.rUoj97il-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/dave-test
head:   51179bd57494a767d7d6f446ebaa0b0ec740369e
commit: 32b8fcca1fa87bf60a01046fd72734feefe74d28 [6/12] Migrate Daves code to upstream kernel (150 errors)
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250510/202505100154.rUoj97il-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100154.rUoj97il-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100154.rUoj97il-lkp@intel.com/

All errors (new ones prefixed by >>):

                            let _ = vfn.reset(inth.leaf, inth.mask);
                            res = match inth.handler.handle_vfn() {
   -                            Err(_) => { let _ = vfn.rearm(); return irq::Return::None; }
   -                            Ok(x) => { x }
   +                            Err(_) => {
   +                                let _ = vfn.rearm();
   +                                return irq::Return::None;
   +                            }
   +                            Ok(x) => x,
                            };
                            if res != 0 {
                                handled = true;
   Diff in drivers/gpu/nova-core/vfn.rs at line 88:
                            }
                        }
                    }
   -            },
   -            None => { let _ = vfn.rearm(); return irq::Return::None; }
   +            }
   +            None => {
   +                let _ = vfn.rearm();
   +                return irq::Return::None;
   +            }
            }
    
            let _ = vfn.rearm();
   Diff in drivers/gpu/nova-core/vfn.rs at line 98:
    }
    
    impl Vfn {
   -
        pub(crate) fn user_info() -> (u32, u32) {
            (VFN_BASE + VFN_USER_OFFSET, VFN_USER_SIZE)
        }
   Diff in drivers/gpu/nova-core/vfn.rs at line 105:
    
        pub(crate) fn new(bar: Arc<Devres<Bar0>>) -> Result<Arc<Self>> {
   +        let vfn = UniqueArc::pin_init(
   +            pin_init!(Self {
   +                bar,
   +                addr: VFN_BASE,
   +                inner <- new_mutex!(VfnInner { irq: None }),
   +                handlers <- new_mutex!(KVec::<Option<Inth>>::new()),
   +            }),
   +            GFP_KERNEL,
   +        )?;
    
   -        let vfn = UniqueArc::pin_init(pin_init!(Self {
   -            bar,
   -            addr: VFN_BASE,
   -            inner <- new_mutex!(VfnInner { irq: None }),
   -            handlers <- new_mutex!(KVec::<Option<Inth>>::new()),
   -        }), GFP_KERNEL)?;
   -
            Ok(vfn.into())
        }
    
   Diff in drivers/gpu/nova-core/vfn.rs at line 150:
            let mut handlers = self.handlers.lock();
            for inth_opt in handlers.iter_mut() {
                match inth_opt {
   -                Some (inth) => {
   +                Some(inth) => {
                        if Arc::ptr_eq(&inth.handler, &handler) {
                            *inth_opt = None;
                            break;
   Diff in drivers/gpu/nova-core/vfn.rs at line 157:
                        }
   -                },
   +                }
                    None => {}
                }
            }
   Diff in drivers/gpu/nova-core/vfn.rs at line 180:
            Ok((intr / 32, (1 << (intr % 32))))
        }
    
   -    pub(crate) fn intr_allow(&self, intr: u32) -> Result <()> {
   +    pub(crate) fn intr_allow(&self, intr: u32) -> Result<()> {
            let (leaf, mask) = self.xlat(intr)?;
    
            self.reset(leaf, mask)?;
   Diff in drivers/gpu/nova-core/vfn.rs at line 188:
            Ok(())
        }
    
   -    pub(crate) fn intr_block(&self, intr: u32) -> Result <()> {
   +    pub(crate) fn intr_block(&self, intr: u32) -> Result<()> {
            let (leaf, mask) = self.xlat(intr)?;
    
            self.block(leaf, mask)?;
   Diff in drivers/gpu/nova-core/vfn.rs at line 197:
    
        fn pending(&self) -> Result<Option<[u32; VFN_NUM_MASKS]>> {
            let intr_top = self.rd32(0x1600)?;
   -        let mut stat : [u32; 8] = Default::default();
   +        let mut stat: [u32; 8] = Default::default();
            let mut pending: bool = false;
            for leaf in 0..VFN_NUM_MASKS {
                if intr_top & (1 << (leaf / 2)) != 0 {
>> Diff in drivers/gpu/nova-core/driver_dave.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
   -use kernel::{
   -    bindings, c_str,
   -    device_id::IdArray,
   -    pci,
   -    prelude::*,
   -    sync::Arc,
   -    auxiliary_bus,
   -};
   +use kernel::{auxiliary_bus, bindings, c_str, device_id::IdArray, pci, prelude::*, sync::Arc};
    
   -use crate::{gpu_dave::Gpu};
   +use crate::gpu_dave::Gpu;
    use crate::mmu::mmu::DMA_BITS;
    
    pub(crate) struct NovaCoreDriver(Arc<NovaCoreData>);
   Diff in drivers/gpu/nova-core/driver_dave.rs at line 66:
            pdev.enable_msi();
    
            kernel::dma::dma_set_mask_and_coherent(pdev.as_dev(), (1_u64 << DMA_BITS) - 1);
   -        let bar = Arc::new(pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova"))?, GFP_KERNEL)?;
   +        let bar = Arc::new(
   +            pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova"))?,
   +            GFP_KERNEL,
   +        )?;
            let p = pdev.clone();
    
            let gpu = Gpu::new(&p, bar)?;
   Diff in drivers/gpu/nova-core/driver_dave.rs at line 73:
    
   -        let data = Arc::pin_init(try_pin_init!(NovaCoreData {
   -            gpu <- gpu,
   -            auxdev <- auxiliary_bus::RawDevice::new(pdev.as_dev(),
   -                                                    Some(nova_core_aux_release),
   -                                                    c_str!("device"),
   -                                                    0,
   -                                                    c_str!("NovaCore")),
   -            pdev: p,
   -        }), GFP_KERNEL)?;
   +        let data = Arc::pin_init(
   +            try_pin_init!(NovaCoreData {
   +                gpu <- gpu,
   +                auxdev <- auxiliary_bus::RawDevice::new(pdev.as_dev(),
   +                                                        Some(nova_core_aux_release),
   +                                                        c_str!("device"),
   +                                                        0,
   +                                                        c_str!("NovaCore")),
   +                pdev: p,
   +            }),
   +            GFP_KERNEL,
   +        )?;
    
            Ok(KBox::new(Self(data), GFP_KERNEL)?.into())
        }
   Diff in drivers/gpu/nova-core/driver_dave.rs at line 86:
    
   -    fn sriov_configure(
   -        pdev: &mut pci::Device,
   -        num_vfs: i32) -> Result<i32> {
   +    fn sriov_configure(pdev: &mut pci::Device, num_vfs: i32) -> Result<i32> {
            if num_vfs > 0 {
                return pdev.enable_sriov(num_vfs);
            } else {
>> Diff in drivers/gpu/nova-core/dma_dave.rs at line 1:
    #![allow(unused)]
    
   -use kernel::dma::CoherentAllocation;
   -use kernel::scatterlist::{*, DmaDataDirection::*};
   -use kernel::device;
   -use kernel::prelude::*;
   -use kernel::page::{PageSlice, Page, PAGE_SIZE, PAGE_SHIFT};
    use core::alloc::Layout;
    use core::ptr;
   +use kernel::device;
   +use kernel::dma::CoherentAllocation;
   +use kernel::page::{Page, PageSlice, PAGE_SHIFT, PAGE_SIZE};
   +use kernel::prelude::*;
   +use kernel::scatterlist::{DmaDataDirection::*, *};
    
   -pub (crate) struct DmaObject {
   +pub(crate) struct DmaObject {
        pub dma: CoherentAllocation<u8>,
        pub len: usize,
        pub name: &'static str,
   Diff in drivers/gpu/nova-core/dma_dave.rs at line 15:
    }
    
    impl DmaObject {
   -     pub(crate) fn new_from_data(dev: &device::Device,
   -				 data: &[u8], name: &'static str) -> Result<DmaObject> {
   -         let len = core::alloc::Layout::from_size_align(data.len(), PAGE_SIZE)?.pad_to_align().size();
   +    pub(crate) fn new_from_data(
   +        dev: &device::Device,
   +        data: &[u8],
   +        name: &'static str,
   +    ) -> Result<DmaObject> {
   +        let len = core::alloc::Layout::from_size_align(data.len(), PAGE_SIZE)?
   +            .pad_to_align()
   +            .size();
    
   -         let mut dma: CoherentAllocation<u8> = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
   +        let mut dma: CoherentAllocation<u8> =
   +            CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
    
   -	 pr_info!("vma: {} {:#x} {:#x}", name, dma.dma_handle(), data.len());
   -	 unsafe {
   -	     ptr::copy_nonoverlapping(data.as_ptr(),
   -				      dma.start_ptr_mut(),
   -				      data.len());
   -	 }
   +        pr_info!("vma: {} {:#x} {:#x}", name, dma.dma_handle(), data.len());
   +        unsafe {
   +            ptr::copy_nonoverlapping(data.as_ptr(), dma.start_ptr_mut(), data.len());
   +        }
    
   -	Ok(Self { dma, len, name })
   -     }
   +        Ok(Self { dma, len, name })
   +    }
    
   -     pub(crate) fn new_cleared(dev: &device::Device,
   -			       len: usize, name: &'static str) -> Result<DmaObject> {
   -         let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)?.pad_to_align().size();
   -         let dma: CoherentAllocation<u8> = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
   -	 Ok(Self { dma, len, name })
   -     }
   +    pub(crate) fn new_cleared(
   +        dev: &device::Device,
   +        len: usize,
   +        name: &'static str,
   +    ) -> Result<DmaObject> {
   +        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)?
   +            .pad_to_align()
   +            .size();
   +        let dma: CoherentAllocation<u8> =
   +            CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
   +        Ok(Self { dma, len, name })
   +    }
    
        pub(crate) fn wr32(&mut self, value: u32, offset: usize) -> Result<()> {
   -	let bytes = value.to_le_bytes();
   +        let bytes = value.to_le_bytes();
    
   -	unsafe {
   -	    let ptr = self.dma.start_ptr_mut().byte_offset(offset as isize);
   -	    ptr::copy_nonoverlapping(bytes.as_ptr(),
   -				     ptr,
   -				     4);
   -	}
   -	Ok(())
   +        unsafe {
   +            let ptr = self.dma.start_ptr_mut().byte_offset(offset as isize);
   +            ptr::copy_nonoverlapping(bytes.as_ptr(), ptr, 4);
   +        }
   +        Ok(())
        }
    
        pub(crate) fn wr64(&mut self, value: u64, offset: usize) -> Result<()> {
   Diff in drivers/gpu/nova-core/dma_dave.rs at line 54:
   -	let bytes = value.to_le_bytes();
   +        let bytes = value.to_le_bytes();
    
   -	unsafe {
   -	    let ptr = self.dma.start_ptr_mut().byte_offset(offset as isize);
--
    /// Initialise a graphics context on a client
   -pub unsafe extern "C" fn nova_core_chan_init_gr(auxdev: *mut bindings::auxiliary_device,
   -                                                client: *mut bindings::nova_core_gsp_client,
   -                                                vmm_ptr: *mut bindings::nova_core_vmm,
   -                                                chan_ptr: *mut bindings::nova_core_chan) -> i32 {
   +pub unsafe extern "C" fn nova_core_chan_init_gr(
   +    auxdev: *mut bindings::auxiliary_device,
   +    client: *mut bindings::nova_core_gsp_client,
   +    vmm_ptr: *mut bindings::nova_core_vmm,
   +    chan_ptr: *mut bindings::nova_core_chan,
   +) -> i32 {
        let core_driver = unsafe { container_of!(auxdev, NovaCoreData, auxdev) };
        let gpu = unsafe { &(*core_driver).gpu };
        let vmm: ArcBorrow<'_, GpuDeviceVmm> = unsafe { Arc::borrow((*vmm_ptr).arc) };
   Diff in drivers/gpu/nova-core/core_api.rs at line 811:
   -    let chan_arc: ArcBorrow<'_, Channel>=  unsafe { Arc::borrow((*chan_ptr).arc) };
   +    let chan_arc: ArcBorrow<'_, Channel> = unsafe { Arc::borrow((*chan_ptr).arc) };
        let dev: ArcBorrow<'_, GpuDevice> = unsafe { Arc::borrow((*client).gsp_device) };
    
        let chan: Arc<Channel> = Arc::<Channel>::from(chan_arc);
   Diff in drivers/gpu/nova-core/core_api.rs at line 816:
        let vmm_arc: Arc<GpuDeviceVmm> = Arc::<GpuDeviceVmm>::from(vmm);
    
        let gr_ctx_arc = match gpu.gr_ctx(&dev_arc, &chan, vmm_arc) {
   -        Err(x) => { return x.to_errno(); },
   -        Ok(gr) => gr
   +        Err(x) => {
   +            return x.to_errno();
   +        }
   +        Ok(gr) => gr,
        };
    
   -    unsafe { (*chan_ptr).gr_ctx_arc = gr_ctx_arc.into_foreign() as *mut core::ffi::c_void; }
   +    unsafe {
   +        (*chan_ptr).gr_ctx_arc = gr_ctx_arc.into_foreign() as *mut core::ffi::c_void;
   +    }
        0
    }
    
   Diff in drivers/gpu/nova-core/devinit_dave.rs at line 1:
   -use kernel::prelude::*;
   -use kernel::devres::Devres;
   -use kernel::delay::sleep;
   -use core::time::Duration;
   +use crate::chipsets_after;
    use crate::driver_dave::Bar0;
   -use crate::gpu_dave::GpuBase;
    use crate::gpu_dave::Chipset;
   -use crate::chipsets_after;
   +use crate::gpu_dave::GpuBase;
   +use core::time::Duration;
   +use kernel::delay::sleep;
   +use kernel::devres::Devres;
   +use kernel::prelude::*;
    
    pub(crate) fn wait(bar: &Devres<Bar0>) -> Result<()> {
        let bar = bar.try_access().ok_or(ENXIO)?;
   Diff in drivers/gpu/nova-core/devinit_dave.rs at line 12:
        let mut timeout = 50 + 2000;
    
        loop {
   -        if bar.try_readl(0x118128)? & 0x1 != 0 &&
   -           (bar.try_readl(0x118234)? & 0xff) == 0xff {
   +        if bar.try_readl(0x118128)? & 0x1 != 0 && (bar.try_readl(0x118234)? & 0xff) == 0xff {
                return Ok(());
            }
    
   Diff in drivers/gpu/nova-core/devinit_dave.rs at line 27:
        Err(ETIME)
    }
    
   -fn ga100_devinit_check_display_disable(bar: &Devres<Bar0>) -> Result<bool>
   -{
   +fn ga100_devinit_check_display_disable(bar: &Devres<Bar0>) -> Result<bool> {
        let bar = bar.try_access().ok_or(ENXIO)?;
        let reg = bar.try_readl(0x820c04)?;
    
   Diff in drivers/gpu/nova-core/devinit_dave.rs at line 35:
        Ok(reg & 0x1 != 0)
    }
    
   -fn tu102_devinit_check_display_disable(bar: &Devres<Bar0>) -> Result<bool>
   -{
   +fn tu102_devinit_check_display_disable(bar: &Devres<Bar0>) -> Result<bool> {
        let bar = bar.try_access().ok_or(ENXIO)?;
        let reg = bar.try_readl(0x021c04)?;
    
   Diff in drivers/gpu/nova-core/devinit_dave.rs at line 69:
        }
    }
    
   -pub(crate) fn vga_workspace_addr(gpu_base: &GpuBase, fb_size: u64, display_disabled: bool) -> Result<u64> {
   +pub(crate) fn vga_workspace_addr(
   +    gpu_base: &GpuBase,
   +    fb_size: u64,
   +    display_disabled: bool,
   +) -> Result<u64> {
        let bar = gpu_base.bar.try_access().ok_or(ENXIO)?;
        let base = fb_size - 0x100000;
        let mut addr: u64 = 0;
>> Diff in drivers/gpu/nova-core/dma_dave.rs at line 1:
    #![allow(unused)]
    
   -use kernel::dma::CoherentAllocation;
   -use kernel::scatterlist::{*, DmaDataDirection::*};
   -use kernel::device;
   -use kernel::prelude::*;
   -use kernel::page::{PageSlice, Page, PAGE_SIZE, PAGE_SHIFT};
    use core::alloc::Layout;
    use core::ptr;
   +use kernel::device;
   +use kernel::dma::CoherentAllocation;
   +use kernel::page::{Page, PageSlice, PAGE_SHIFT, PAGE_SIZE};
   +use kernel::prelude::*;
   +use kernel::scatterlist::{DmaDataDirection::*, *};
    
   -pub (crate) struct DmaObject {
   +pub(crate) struct DmaObject {
        pub dma: CoherentAllocation<u8>,
        pub len: usize,
        pub name: &'static str,
   Diff in drivers/gpu/nova-core/dma_dave.rs at line 15:
    }
    
    impl DmaObject {
   -     pub(crate) fn new_from_data(dev: &device::Device,
   -				 data: &[u8], name: &'static str) -> Result<DmaObject> {
   -         let len = core::alloc::Layout::from_size_align(data.len(), PAGE_SIZE)?.pad_to_align().size();
   +    pub(crate) fn new_from_data(
   +        dev: &device::Device,
   +        data: &[u8],
   +        name: &'static str,
   +    ) -> Result<DmaObject> {
   +        let len = core::alloc::Layout::from_size_align(data.len(), PAGE_SIZE)?
   +            .pad_to_align()
   +            .size();
    
   -         let mut dma: CoherentAllocation<u8> = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
   +        let mut dma: CoherentAllocation<u8> =
   +            CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
    
   -	 pr_info!("vma: {} {:#x} {:#x}", name, dma.dma_handle(), data.len());
   -	 unsafe {
   -	     ptr::copy_nonoverlapping(data.as_ptr(),
   -				      dma.start_ptr_mut(),
   -				      data.len());
   -	 }
   +        pr_info!("vma: {} {:#x} {:#x}", name, dma.dma_handle(), data.len());
   +        unsafe {
   +            ptr::copy_nonoverlapping(data.as_ptr(), dma.start_ptr_mut(), data.len());
   +        }
    
   -	Ok(Self { dma, len, name })
   -     }
   +        Ok(Self { dma, len, name })
   +    }
    
   -     pub(crate) fn new_cleared(dev: &device::Device,
   -			       len: usize, name: &'static str) -> Result<DmaObject> {
   -         let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)?.pad_to_align().size();
   -         let dma: CoherentAllocation<u8> = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
   -	 Ok(Self { dma, len, name })
   -     }
   +    pub(crate) fn new_cleared(
   +        dev: &device::Device,
   +        len: usize,
   +        name: &'static str,
   +    ) -> Result<DmaObject> {
   +        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)?
   +            .pad_to_align()
   +            .size();
   +        let dma: CoherentAllocation<u8> =
   +            CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
   +        Ok(Self { dma, len, name })
   +    }
    
        pub(crate) fn wr32(&mut self, value: u32, offset: usize) -> Result<()> {
   -	let bytes = value.to_le_bytes();
   +        let bytes = value.to_le_bytes();
    
   -	unsafe {
   -	    let ptr = self.dma.start_ptr_mut().byte_offset(offset as isize);
   -	    ptr::copy_nonoverlapping(bytes.as_ptr(),
   -				     ptr,
   -				     4);
   -	}
   -	Ok(())
   +        unsafe {
   +            let ptr = self.dma.start_ptr_mut().byte_offset(offset as isize);
   +            ptr::copy_nonoverlapping(bytes.as_ptr(), ptr, 4);
   +        }
   +        Ok(())
        }
    
        pub(crate) fn wr64(&mut self, value: u64, offset: usize) -> Result<()> {
   Diff in drivers/gpu/nova-core/dma_dave.rs at line 54:
   -	let bytes = value.to_le_bytes();
   +        let bytes = value.to_le_bytes();
    
   -	unsafe {
   -	    let ptr = self.dma.start_ptr_mut().byte_offset(offset as isize);
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
