Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0425D550
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 22:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750372136; cv=none; b=rjkNTp+9qCo37WRgQJPsnaqapt0dNgosOkRcXvVFY056DXXEdwVz9VRzLEiPhfsOrVZmM/Se5dOtlTU8J8JRtxeP/JD8aYIExj09WcmdiRotakttups0SJy0ORfT5pzEaZ9h9eIvzVfA18yM1AKpEbaSMREFRfTecAp4/gCdI5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750372136; c=relaxed/simple;
	bh=eslrrlz0NgDwflRf4KGX6h2F+1N0LRdSyFSQRqHL2Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gzzpPtmf/h4iHBDLdUfGyug6s9D50lgkXZye7K6zSIQs4U+ltdfJl1Cuth4mf8sG8FpioJ0HbPc87vRP4ftS5sBwUHnM5IKNDVgllhQ0wxFqBdbkwmSObuGg3qpG6rXxJobRYGPu1wqtfB8ebF5KL9c+mciAKTc0cb1Xux2khhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIsvb3Zt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIsvb3Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750372135; x=1781908135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eslrrlz0NgDwflRf4KGX6h2F+1N0LRdSyFSQRqHL2Og=;
  b=gIsvb3ZtigruZ/gTcgIul/sC5IPxKSjCvZj3UScD2hIuyBOr38KcIncV
   X4hbclO0SSxrT7WP2KNycNCNr99Guzs56qpTGJiDyLpqNPoXN7Gu6wjvu
   3LCm05QVeIv5qWi8s+hrzE9jfak+x9ZQKEuYbBR7xBJ5oxn7ALjYwKNVX
   wItZFlhekHtBB6TkTQGrhAzO7TbkkcE+yXZ3hOteZNdjzI0byI4lt8RK3
   jNuc/JeOoaX/pQUydR7ELfCvNdcCcQTbbsQtVXL+xq0T+z2e0J93dYrJ8
   tbgAsCfiBeTL7/V6ybgx56W3RW4Bcdyt4bzBdlZIKZy5DyvFjoYUwJDnP
   A==;
X-CSE-ConnectionGUID: 3wX+LFXZTGqB8HX2Rdoh1Q==
X-CSE-MsgGUID: wnkmKJAWTiyaybRYCG7+ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52770287"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52770287"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 15:28:54 -0700
X-CSE-ConnectionGUID: TjuXmXu4S0mCwvBLQAt7LQ==
X-CSE-MsgGUID: vZPHPg0vShm+AsZ8CBFhWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="155024857"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jun 2025 15:28:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSNkY-000L9C-1Q;
	Thu, 19 Jun 2025 22:28:50 +0000
Date: Fri, 20 Jun 2025 06:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/irq 23/23]                      if e ==
 kernel::error::code::EINVAL {
Message-ID: <202506200647.iCnlBvb6-lkp@intel.com>
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
commit: a4365b5800b5e1ffc954628d80dbffea234d3513 [23/23] Attempt GET_GSP_STATIC_INFO
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250620/202506200647.iCnlBvb6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200647.iCnlBvb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200647.iCnlBvb6-lkp@intel.com/

All errors (new ones prefixed by >>):

   -            data: ptr::null_mut(),
   -            size: 0,
   -        }, GFP_KERNEL)?;
   +        let logrm_info = KBox::new(
   +            NovaLogBufferInfo {
   +                name: c_str!("LOGRM").as_char_ptr() as *const i8,
   +                data: ptr::null_mut(),
   +                size: 0,
   +            },
   +            GFP_KERNEL,
   +        )?;
    
            Ok(Self {
                ptr,
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
   Diff in drivers/gpu/nova-core/gpu.rs at line 400:
                        let client = static_info.hInternalClient;
                        let device = static_info.hInternalDevice;
                        let subdevice = static_info.hInternalSubdevice;
   -                    
   +
                        // Print each value separately
                        pr_info!("GSP Internal Client Handle:{:#x}\n", client);
    
   Diff in drivers/gpu/nova-core/gpu.rs at line 407:
                        pr_info!("GSP Internal Device Handle:{:#x}\n", device);
   -                    
   +
                        pr_info!("GSP Internal Subdevice Handle:{:#x}\n", subdevice);
   -                },
   +                }
                    Err(e) => {
                        pr_err!("Failed to get GSP static info\n");
>>                      if e == kernel::error::code::EINVAL {
   Diff in drivers/gpu/nova-core/gpu.rs at line 416:
                        pr_err!("This suggests GSP needs additional initialization\n");
                    }
                }
   -            
   +
                // Test interrupt table retrieval
                pr_info!("Testing interrupt table retrieval...\n");
                match crate::irq::Irq::get_interrupt_table(&gsp_falcon, &mut libos.cmdq) {
   Diff in drivers/gpu/nova-core/gpu.rs at line 424:
                        let len = table.len();
                        pr_info!("Successfully retrieved interrupt table\n");
                        pr_info!("Table has entries (count suppressed to avoid stack issues)\n");
   -                },
   +                }
                    Err(_e) => {
                        pr_err!("Failed to retrieve interrupt table\n");
                    }
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
        }
    
        /// Function to check if GSP reload/resume has completed during the boot process.
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Duration,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Duration) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
   Diff in drivers/gpu/nova-core/irq.rs at line 2:
    
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
    
   Diff in drivers/gpu/nova-core/irq.rs at line 127:
            pr_info!("  hClient: {:#x}", h_client);
            pr_info!("  hObject: {:#x}", h_object);
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
   -                hClient: h_client,
   -                hObject: h_object,
   -                cmd,
   -                status: 0,
   -                paramsSize: size_of::<NV2080CtrlInternalIntrGetKernelTableParams>() as u32,
   -                flags: 0,
   +        let msg = kernel::alloc::KBox::new(
   +            ControlMessage {
   +                control: RpcGspRmControl {
   +                    hClient: h_client,
   +                    hObject: h_object,
   +                    cmd,
   +                    status: 0,
--
                ptr,
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
        }
    
        /// Function to check if GSP reload/resume has completed during the boot process.
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Duration,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Duration) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
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
   Diff in drivers/gpu/nova-core/gpu.rs at line 400:
                        let client = static_info.hInternalClient;
                        let device = static_info.hInternalDevice;
                        let subdevice = static_info.hInternalSubdevice;
   -                    
   +
                        // Print each value separately
                        pr_info!("GSP Internal Client Handle:{:#x}\n", client);
    
   Diff in drivers/gpu/nova-core/gpu.rs at line 407:
                        pr_info!("GSP Internal Device Handle:{:#x}\n", device);
   -                    
   +
                        pr_info!("GSP Internal Subdevice Handle:{:#x}\n", subdevice);
   -                },
   +                }
                    Err(e) => {
                        pr_err!("Failed to get GSP static info\n");
>>                      if e == kernel::error::code::EINVAL {
   Diff in drivers/gpu/nova-core/gpu.rs at line 416:
                        pr_err!("This suggests GSP needs additional initialization\n");
                    }
                }
   -            
   +
                // Test interrupt table retrieval
                pr_info!("Testing interrupt table retrieval...\n");
                match crate::irq::Irq::get_interrupt_table(&gsp_falcon, &mut libos.cmdq) {
   Diff in drivers/gpu/nova-core/gpu.rs at line 424:
                        let len = table.len();
                        pr_info!("Successfully retrieved interrupt table\n");
                        pr_info!("Table has entries (count suppressed to avoid stack issues)\n");
   -                },
   +                }
                    Err(_e) => {
                        pr_err!("Failed to retrieve interrupt table\n");
                    }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 13:
    use crate::nvfw::r570_144 as fw;
    use crate::util::wait_on;
    
   -use kernel::{pr_info, pr_cont};
   +use kernel::{pr_cont, pr_info};
    
    /// Print a byte slice using pr_info, with bytes_per_line bytes on each line.
    /// Each line is formatted as [0xAA, 0xBB, ...].
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 21:
        for chunk in bytes.chunks(bytes_per_line) {
            // Print opening bracket
            pr_info!("[");
   -        
   +
            // Print each byte with comma separators
            for (i, byte) in chunk.iter().enumerate() {
                if i > 0 {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 29:
                }
                pr_cont!("0x{:02X}", byte);
            }
   -        
   +
            // Print closing bracket and newline
            pr_cont!("]\n");
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 134:
    }
    
    pub(crate) trait GspSeqCmdRunner {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result;
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 141:
        // TODO: Can we return Result instead of  Result?
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_info!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
            let addr = self.addr as usize;
            let val = self.val;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 149:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_info!(
                "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 159:
    
            let addr = self.addr as usize;
            if let Ok(temp) = sequencer.bar.try_read32(addr) {
   -            sequencer.bar.try_write32((temp & !self.mask) | self.val, addr);
   +            sequencer
   +                .bar
   +                .try_write32((temp & !self.mask) | self.val, addr);
            }
            Ok(())
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 166:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_info!(
                "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 202:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
   -    fn run(&self, _sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
            pr_info!("DelayUs: val=0x{:x}\n", self.val);
            sleep(Duration::from_micros(self.val as u64));
            Ok(())
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 210:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
