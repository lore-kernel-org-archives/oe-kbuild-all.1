Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3962130E844
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750367750; cv=none; b=BYiqSkzq1ZNLxjkQqKYWrn71uTecthEgvaZn1YsemPp2GfOJQbNTNe0J0p22hgp7qqML7E635xaodF0HnQZ7VO396hS1lQ+MPMuO0p+7qGF7olPUrRfFZEMhsPy8HNARvUw7LsBnKuQZhkwHOkvGOCX/3TuuYpVN7McgYzr7Wog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750367750; c=relaxed/simple;
	bh=RaL2tbUT+Y6B7FMTwDYqyL/P50gsvpbuiyXwe+8hId0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHFGXvpX7Sjvyw2uTwnxwYNjsmlv4LdO1uHnN21VgSlw00bSLj/SIc92iOdVPPEw6NrWNM9WMQb/pokmr2/c97lF7DdbziCEse2wyo0qKc8gmBfd9VlpM89kzOTFDypMPaCk1MzU1gSekblgXmIsZ5byFzv4OkmLI2FZLuyWEpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehEWHCfx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehEWHCfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750367749; x=1781903749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RaL2tbUT+Y6B7FMTwDYqyL/P50gsvpbuiyXwe+8hId0=;
  b=ehEWHCfx14rNCpLEuT7+cvzHCGYd8v6PGYd19864SLiZKvYhGZM5GDvP
   7gEuKcwJ1oV74QmkWUSv6xRtM1s9PGZLAYpAAtOx/US1US/8rJ5cbUWej
   Pj+J22rdfluejZIikQiEh/l8veSy+DaTzIvpwSBajqLdO4H8tWX7XHq6N
   PpxFsjyLr2xa8lu2/mX2gyxZOSiz/tqu5dsBu5TuzITzI21hvKTgY9pRm
   OEk1JBN4EH/aLAEB92EyIbCFljIiyDO+Ee3M7C9uYhXurk6RVc77OKzVn
   /2VWKXXoGqaJ9rmEXlgUujghslXLj2GTgJPlIfCVMFp1O/XSaFKy0Txbf
   A==;
X-CSE-ConnectionGUID: STPKZWCPT/S6LQowXhgxWw==
X-CSE-MsgGUID: r4jNw2BRTAqkjNIxrGwUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62889986"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="62889986"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 14:15:48 -0700
X-CSE-ConnectionGUID: 8ARj+dHdTaaknM1iR0g0/A==
X-CSE-MsgGUID: qXVQd4l2Ty+6mruT9ZhDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150233276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2025 14:15:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSMbn-000L7I-37;
	Thu, 19 Jun 2025 21:15:43 +0000
Date: Fri, 20 Jun 2025 05:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/irq 22/23] Diff in drivers/gpu/nova-core/irq.rs at line
 2:
Message-ID: <202506200459.GibGwWHx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/irq
head:   a4365b5800b5e1ffc954628d80dbffea234d3513
commit: 3161e2ad3c1c4feab39307b71d803f4d294db3d6 [22/23] [WIP] nova-core: Implement IRQ table retrieval from GSP
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250620/202506200459.GibGwWHx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200459.GibGwWHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200459.GibGwWHx-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/gpu.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
    use kernel::dma::CoherentAllocation;
   -use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, c_str};
   +use kernel::{c_str, device, devres::Devres, error::code::*, pci, prelude::*};
    
    use core::time::Duration;
    
   Diff in drivers/gpu/nova-core/gpu.rs at line 8:
   +use crate::debugfs::NovaDebugfs;
    use crate::driver::Bar0;
    use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
    use crate::fb::FbLayout;
   Diff in drivers/gpu/nova-core/gpu.rs at line 18:
    use crate::util;
    use crate::vbios::Vbios;
    use core::fmt;
   -use crate::debugfs::NovaDebugfs;
    use kernel::sync::{Arc, Mutex};
    
    static mut NOVA_DEBUGFS: Option<Arc<Mutex<NovaDebugfs>>> = None;
   Diff in drivers/gpu/nova-core/gpu.rs at line 318:
            dev_dbg!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
    
            let wpr_meta = gsp::build_wpr_meta(pdev.as_ref(), &fw, &fb_layout)?;
   -        let mut libos = crate::gsp::GspSharedMemObjects::new(pdev, &devres_bar, &gsp_falcon, &sec2_falcon, &fw)?;
   +        let mut libos = crate::gsp::GspSharedMemObjects::new(
   +            pdev,
   +            &devres_bar,
   +            &gsp_falcon,
   +            &sec2_falcon,
   +            &fw,
   +        )?;
            let libos_handle = libos.libos.dma_handle();
            let wpr_handle = wpr_meta.dma_handle();
    
   Diff in drivers/gpu/nova-core/gpu.rs at line 352:
            pr_info!("Waiting for INIT_DONE...\n");
            if let Err(e) = libos.cmdq.receive_until(
                fw::NV_VGPU_MSG_EVENT_GSP_INIT_DONE as u32,
   -            Duration::from_secs(2)
   +            Duration::from_secs(2),
            ) {
                pr_err!("Error receiving INIT_DONE: {:?}\n", e);
            } else {
   Diff in drivers/gpu/nova-core/gpu.rs at line 359:
                pr_info!("INIT_DONE received. GSP is running.\n");
   -            
   +
                // debugfs files for GSP log
                unsafe {
                    if NOVA_DEBUGFS.is_none() {
   Diff in drivers/gpu/nova-core/gpu.rs at line 364:
                        match NovaDebugfs::new("nova") {
                            Ok(debugfs) => {
                                match Arc::pin_init(
   -                                Mutex::new(debugfs, c_str!("nova_debugfs"), kernel::static_lock_class!()),
   -                                GFP_KERNEL
   +                                Mutex::new(
   +                                    debugfs,
   +                                    c_str!("nova_debugfs"),
   +                                    kernel::static_lock_class!(),
   +                                ),
   +                                GFP_KERNEL,
                                ) {
                                    Ok(arc) => {
                                        NOVA_DEBUGFS = Some(arc);
   Diff in drivers/gpu/nova-core/gpu.rs at line 394:
                pr_info!("Testing interrupt table retrieval...\n");
                match crate::irq::Irq::get_interrupt_table(&gsp_falcon, &mut libos.cmdq) {
                    Ok(table) => {
   -                    pr_info!("Successfully retrieved interrupt table with {} entries\n", table.len());
   -                },
   +                    pr_info!(
   +                        "Successfully retrieved interrupt table with {} entries\n",
   +                        table.len()
   +                    );
   +                }
                    Err(e) => {
                        pr_err!("Failed to retrieve interrupt table: {:?}\n", e);
                    }
>> Diff in drivers/gpu/nova-core/irq.rs at line 2:
    
    //! Nova Core IRQ (Interrupt) Module
    
   -use kernel::{
   -    prelude::*,
   -    error::Result,
   -};
   +use kernel::{error::Result, prelude::*};
    
    use core::mem::size_of;
    
   Diff in drivers/gpu/nova-core/irq.rs at line 12:
   -use crate::gsp::{GspCmdq, ControlResponse, GspMessageElement};
    use crate::falcon::{gsp::Gsp, Falcon};
   +use crate::gsp::{ControlResponse, GspCmdq, GspMessageElement};
    use crate::nvfw::r570_144 as fw;
    
    /// Control command, need to get from fw.
   Diff in drivers/gpu/nova-core/irq.rs at line 94:
        fn as_any(&self) -> &dyn core::any::Any {
            self
        }
   -    
   +
        fn size(&self) -> usize {
            size_of::<RpcGspRmControl>() + size_of::<NV2080CtrlInternalIntrGetKernelTableParams>()
        }
   Diff in drivers/gpu/nova-core/irq.rs at line 101:
   -    
   +
        fn byte_slice(&self) -> &[u8] {
   -        unsafe {
   -            core::slice::from_raw_parts(
   -                self as *const Self as *const u8,
   -                self.size(),
   -            )
   -        }
   +        unsafe { core::slice::from_raw_parts(self as *const Self as *const u8, self.size()) }
        }
    }
    
   Diff in drivers/gpu/nova-core/irq.rs at line 125:
            pr_info!("  hClient: {:#x}", GSP_INTERNAL_CLIENT_HANDLE);
            pr_info!("  hObject: {:#x}", GSP_INTERNAL_SUBDEVICE_HANDLE);
            pr_info!("  cmd: {:#x}", cmd);
   -        pr_info!("  paramsSize: {} bytes", size_of::<NV2080CtrlInternalIntrGetKernelTableParams>());
   -        
   +        pr_info!(
   +            "  paramsSize: {} bytes",
   +            size_of::<NV2080CtrlInternalIntrGetKernelTableParams>()
   +        );
   +
            // Allocate control message on heap to avoid stack overflow
   -        let msg = kernel::alloc::KBox::new(ControlMessage {
   -            control: RpcGspRmControl {
   -                hClient: GSP_INTERNAL_CLIENT_HANDLE,
   -                hObject: GSP_INTERNAL_SUBDEVICE_HANDLE,
   -                cmd,
   -                status: 0,
   -                paramsSize: size_of::<NV2080CtrlInternalIntrGetKernelTableParams>() as u32,
   -                flags: 0,
   +        let msg = kernel::alloc::KBox::new(
   +            ControlMessage {
   +                control: RpcGspRmControl {
   +                    hClient: GSP_INTERNAL_CLIENT_HANDLE,
   +                    hObject: GSP_INTERNAL_SUBDEVICE_HANDLE,
   +                    cmd,
   +                    status: 0,
   +                    paramsSize: size_of::<NV2080CtrlInternalIntrGetKernelTableParams>() as u32,
   +                    flags: 0,
   +                },
   +                params: params.clone(),
                },
   -            params: params.clone(),
   -        }, kernel::alloc::flags::GFP_KERNEL)?;
   -        
   +            kernel::alloc::flags::GFP_KERNEL,
   +        )?;
   +
            pr_info!("Nova IRQ: Sending control message, size = {}", msg.size());
   -        
   +
            // Send RM control RPC - KBox implements Deref, so we can use it directly
            match cmdq.send(fw::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL, &*msg) {
                Ok(_) => {
   Diff in drivers/gpu/nova-core/irq.rs at line 148:
                    pr_info!("Nova IRQ: rm_control - send completed, waiting for response");
   -                
   +
                    // Receive response from GSP
                    let (response_fn, response_data) = cmdq.receive()?;
   -                pr_info!("Nova IRQ: Received response for function {:#x}", response_fn);
   -                
   +                pr_info!(
   +                    "Nova IRQ: Received response for function {:#x}",
   +                    response_fn
   +                );
   +
                    // response should contain control message response
                    if response_fn == fw::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL {
--
            kernel::delay::sleep(Duration::from_secs(1));
   -        
   +
            // Return a dummy GspSystemInfo for now
            // This simulates successful RPC communication
            let dummy_info = fw::GspSystemInfo {
   Diff in drivers/gpu/nova-core/gsp.rs at line 659:
    
            let result = match rpc.function {
                fw::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
   -                let args_vec: &[u8] = unsafe { core::slice::from_raw_parts(args_ptr as *mut u8, rpc.length as usize) };
   +                let args_vec: &[u8] = unsafe {
   +                    core::slice::from_raw_parts(args_ptr as *mut u8, rpc.length as usize)
   +                };
    
                    // Create and run the GSP sequencer
                    self.bar.try_access_with(|bar| {
   Diff in drivers/gpu/nova-core/gsp.rs at line 666:
   -                    match sequencer::GspSequencer::new(args_vec, bar, self.sec2_falcon,
   -                                                       self.gsp_falcon, self.libos_dma_handle,
   -                                                       self.fw) {
   +                    match sequencer::GspSequencer::new(
   +                        args_vec,
   +                        bar,
   +                        self.sec2_falcon,
   +                        self.gsp_falcon,
   +                        self.libos_dma_handle,
   +                        self.fw,
   +                    ) {
                            Ok(sequencer) => {
                                if let Err(e) = sequencer.run() {
                                    pr_info!("Error running CPU sequencer: {:?}\n", e);
   Diff in drivers/gpu/nova-core/gsp.rs at line 672:
                                }
   -                        },
   +                        }
                            Err(e) => {
                                pr_info!("Error creating CPU sequencer: {:?}\n", e);
                            }
   Diff in drivers/gpu/nova-core/gsp.rs at line 815:
                    pr_info!("Received GSP_RM_CONTROL response\n");
                    // For control responses, we need to return the raw data
                    // The caller will parse it based on the specific control command
   -                let response_bytes = unsafe { 
   -                    core::slice::from_raw_parts(args_ptr as *const u8, rpc.length as usize) 
   +                let response_bytes = unsafe {
   +                    core::slice::from_raw_parts(args_ptr as *const u8, rpc.length as usize)
                    };
                    pr_info!("Control response size: {} bytes\n", response_bytes.len());
   -                
   +
                    // Allocate ControlResponse directly on heap
                    let mut result = KBox::<ControlResponse>::new_uninit(GFP_KERNEL)?;
                    unsafe {
   Diff in drivers/gpu/nova-core/gsp.rs at line 826:
                        let response_ptr = result.as_mut_ptr();
                        (*response_ptr).data = [0; 4096];
   -                    
   +
                        // Copy the response data from GSP
                        let copy_size = core::cmp::min(rpc.length as usize, 4096);
                        core::ptr::copy_nonoverlapping(
   Diff in drivers/gpu/nova-core/gsp.rs at line 861:
    
        #[allow(dead_code)]
        pub(crate) fn receive_until(&mut self, rpc_function: u32, timeout: Duration) -> Result {
   -        wait_on(timeout, || {
   -            match self.receive() {
   -                Ok((function, _)) if function == rpc_function => Some(()),
   -                Ok(_) => None,
   -                Err(_) => None,
   -            }
   +        wait_on(timeout, || match self.receive() {
   +            Ok((function, _)) if function == rpc_function => Some(()),
   +            Ok(_) => None,
   +            Err(_) => None,
            })
        }
    }
   Diff in drivers/gpu/nova-core/gsp.rs at line 1113:
        fn as_any(&self) -> &dyn core::any::Any {
            self
        }
   -    
   +
        fn copy_to_slice(
            &self,
            sub_index: usize,
   Diff in drivers/gpu/nova-core/gsp.rs at line 1245:
        }
    }
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
>> Diff in drivers/gpu/nova-core/irq.rs at line 2:
    
    //! Nova Core IRQ (Interrupt) Module
    
   -use kernel::{
   -    prelude::*,
   -    error::Result,
   -};
   +use kernel::{error::Result, prelude::*};
    
    use core::mem::size_of;
    
   Diff in drivers/gpu/nova-core/irq.rs at line 12:
   -use crate::gsp::{GspCmdq, ControlResponse, GspMessageElement};
    use crate::falcon::{gsp::Gsp, Falcon};
   +use crate::gsp::{ControlResponse, GspCmdq, GspMessageElement};
    use crate::nvfw::r570_144 as fw;
    
    /// Control command, need to get from fw.
   Diff in drivers/gpu/nova-core/irq.rs at line 94:
        fn as_any(&self) -> &dyn core::any::Any {
            self
        }
   -    
   +
        fn size(&self) -> usize {
            size_of::<RpcGspRmControl>() + size_of::<NV2080CtrlInternalIntrGetKernelTableParams>()
        }
   Diff in drivers/gpu/nova-core/irq.rs at line 101:
   -    
   +
        fn byte_slice(&self) -> &[u8] {
   -        unsafe {
   -            core::slice::from_raw_parts(
   -                self as *const Self as *const u8,
   -                self.size(),
   -            )
   -        }
   +        unsafe { core::slice::from_raw_parts(self as *const Self as *const u8, self.size()) }
        }
    }
    
   Diff in drivers/gpu/nova-core/irq.rs at line 125:
            pr_info!("  hClient: {:#x}", GSP_INTERNAL_CLIENT_HANDLE);
            pr_info!("  hObject: {:#x}", GSP_INTERNAL_SUBDEVICE_HANDLE);
            pr_info!("  cmd: {:#x}", cmd);
   -        pr_info!("  paramsSize: {} bytes", size_of::<NV2080CtrlInternalIntrGetKernelTableParams>());
   -        
   +        pr_info!(
   +            "  paramsSize: {} bytes",
   +            size_of::<NV2080CtrlInternalIntrGetKernelTableParams>()
   +        );
   +
            // Allocate control message on heap to avoid stack overflow
   -        let msg = kernel::alloc::KBox::new(ControlMessage {
   -            control: RpcGspRmControl {
   -                hClient: GSP_INTERNAL_CLIENT_HANDLE,
   -                hObject: GSP_INTERNAL_SUBDEVICE_HANDLE,
   -                cmd,
   -                status: 0,
   -                paramsSize: size_of::<NV2080CtrlInternalIntrGetKernelTableParams>() as u32,
   -                flags: 0,
   +        let msg = kernel::alloc::KBox::new(
   +            ControlMessage {
   +                control: RpcGspRmControl {
   +                    hClient: GSP_INTERNAL_CLIENT_HANDLE,
   +                    hObject: GSP_INTERNAL_SUBDEVICE_HANDLE,
   +                    cmd,
   +                    status: 0,
   +                    paramsSize: size_of::<NV2080CtrlInternalIntrGetKernelTableParams>() as u32,
   +                    flags: 0,
   +                },
   +                params: params.clone(),
                },
   -            params: params.clone(),
   -        }, kernel::alloc::flags::GFP_KERNEL)?;
   -        
   +            kernel::alloc::flags::GFP_KERNEL,
   +        )?;
   +
            pr_info!("Nova IRQ: Sending control message, size = {}", msg.size());
   -        
   +
            // Send RM control RPC - KBox implements Deref, so we can use it directly
            match cmdq.send(fw::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL, &*msg) {
                Ok(_) => {
   Diff in drivers/gpu/nova-core/irq.rs at line 148:
                    pr_info!("Nova IRQ: rm_control - send completed, waiting for response");
   -                
   +
                    // Receive response from GSP
                    let (response_fn, response_data) = cmdq.receive()?;
   -                pr_info!("Nova IRQ: Received response for function {:#x}", response_fn);
   -                
   +                pr_info!(
   +                    "Nova IRQ: Received response for function {:#x}",
   +                    response_fn
   +                );
   +
                    // response should contain control message response
                    if response_fn == fw::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
