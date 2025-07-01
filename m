Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD127CCEE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386538; cv=none; b=p6qUE8LUXg7Q6jue+FSw4wey7utn4M2gcTyQyk4AJEj/KVNZSqXqdKIoYRtc3SRQbiJiQ2qV2eKDhbE6LpYwAkjK2QcnLM7JVxCse+JB6Pop/iyoKD0wVyxsBUP/CIBNwaqzhwxs2oseZXDhrvRCviCVCUfIgEWAoJrw00VPCE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386538; c=relaxed/simple;
	bh=/d6voatqDVW/D4fpbT6M/GLREeIeTQPs+baPH3e+1o8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5PNooFGXq5Pk0NPVnxFUMwPfs3O6BJM/0/vTvFB05xXpWI2sSh/zm4i8iKSK1QwnpWDB86GOV6aLp5pz6Oogpa7ZVjyGkUPbvoNFZVq3tEtYSwYmNQF8aNIXd5egUZUPXu4/EhvukVhLcqvRcNbdgctfIkEsPKZxRrVPWDHSrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1NAjls1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1NAjls1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751386536; x=1782922536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/d6voatqDVW/D4fpbT6M/GLREeIeTQPs+baPH3e+1o8=;
  b=l1NAjls13DhwiJlMcC9J88wmFco2GGsV291tKDXSUrmTrhUYlpW7ZTuP
   95Vvb65tJ2kODluwWddJTJVxO3UPWBEp4tSCmZsV774rke5YiCZ0FkOJU
   3umW0frtdQF+llZJ2JZx0ATs3BFSxI7mSDUCmK5UAP+wsIozb5/alfrxx
   tY0mxgG27I5UNFwNQiTXxCCgPaDa8MFyu06PDRlpQB/ovK/efmp7+wHGS
   ks0iFePXmJ5dk93sQ7XjE5aZXyqQKiyuTha5v840Eet/X/fTqQPQk3vzP
   KkAwZPF8NbCE5RRTfYX56HfISyZphs7//tu66BGxk3qW6bM34zTqEbH69
   w==;
X-CSE-ConnectionGUID: XElWeTk1R8KK2xo3/c3prg==
X-CSE-MsgGUID: PXEZodBrSJCY1jAYpQFpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53782187"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53782187"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 09:15:36 -0700
X-CSE-ConnectionGUID: l7JTHm8FQx6UXW+RzNUwdw==
X-CSE-MsgGUID: FyAcLn70TAKzOgJV9N7FNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184861984"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jul 2025 09:15:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWddr-000aPI-2x;
	Tue, 01 Jul 2025 16:15:31 +0000
Date: Wed, 2 Jul 2025 00:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>
Subject: [jfern:nova/master 72/87] Diff in drivers/gpu/nova-core/debugfs.rs
 at line 1:
Message-ID: <202507020022.CTF71Rpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/master
head:   dfa2b234298399a62d48d2a78ce8f3f58d21cda1
commit: 70794f2c1436933de0355b0bc0eb6faf16e968f8 [72/87] DEBUG: nova-core: debugfs support to dump logrm, logintr, loginit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250702/202507020022.CTF71Rpm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020022.CTF71Rpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020022.CTF71Rpm-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j28 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/regs.rs at line 204:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::{
        driver::Bar0,
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
        }
    
        /// Function to check if GSP reload/resume has completed during the boot process.
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Delta,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
>> Diff in drivers/gpu/nova-core/debugfs.rs at line 1:
   -use kernel::prelude::*;
   -use kernel::{error::to_result, c_str};
   +use crate::gsp::GspSharedMemObjects;
    use core::ffi::c_void;
    use core::ptr;
   -use crate::gsp::GspSharedMemObjects;
   +use kernel::prelude::*;
   +use kernel::{c_str, error::to_result};
    
    extern "C" {
        fn nova_debugfs_create(name: *const i8) -> *mut c_void;
   Diff in drivers/gpu/nova-core/debugfs.rs at line 32:
    impl NovaDebugfs {
        pub(crate) fn new(name: &str) -> Result<Self> {
            let name_cstr = kernel::str::CString::try_from_fmt(fmt!("{}", name))?;
   -        
   +
            let ptr = unsafe { nova_debugfs_create(name_cstr.as_char_ptr() as *const i8) };
   -        
   +
            if ptr.is_null() {
                return Err(ENOMEM);
            }
   Diff in drivers/gpu/nova-core/debugfs.rs at line 41:
   -        
   -        let loginit_info = KBox::new(NovaLogBufferInfo {
   -            name: c_str!("LOGINIT").as_char_ptr() as *const i8,
   -            data: ptr::null_mut(),
   -            size: 0,
   -        }, GFP_KERNEL)?;
   -        
   -        let logintr_info = KBox::new(NovaLogBufferInfo {
   -            name: c_str!("LOGINTR").as_char_ptr() as *const i8,
   -            data: ptr::null_mut(),
   -            size: 0,
   -        }, GFP_KERNEL)?;
   -        
   -        let logrm_info = KBox::new(NovaLogBufferInfo {
   -            name: c_str!("LOGRM").as_char_ptr() as *const i8,
   -            data: ptr::null_mut(),
   -            size: 0,
   -        }, GFP_KERNEL)?;
   -        
   +
   +        let loginit_info = KBox::new(
   +            NovaLogBufferInfo {
   +                name: c_str!("LOGINIT").as_char_ptr() as *const i8,
   +                data: ptr::null_mut(),
   +                size: 0,
   +            },
   +            GFP_KERNEL,
   +        )?;
   +
   +        let logintr_info = KBox::new(
   +            NovaLogBufferInfo {
   +                name: c_str!("LOGINTR").as_char_ptr() as *const i8,
   +                data: ptr::null_mut(),
   +                size: 0,
   +            },
   +            GFP_KERNEL,
   +        )?;
   +
   +        let logrm_info = KBox::new(
   +            NovaLogBufferInfo {
   +                name: c_str!("LOGRM").as_char_ptr() as *const i8,
   +                data: ptr::null_mut(),
   +                size: 0,
   +            },
   +            GFP_KERNEL,
   +        )?;
   +
            Ok(Self {
                ptr,
                loginit_info,
   Diff in drivers/gpu/nova-core/debugfs.rs at line 64:
                logrm_info,
            })
        }
   -    
   +
        pub(crate) fn create_log_files(&mut self, gsp_mem: &GspSharedMemObjects) -> Result {
            self.loginit_info.data = gsp_mem.loginit.start_ptr() as *mut c_void;
            self.loginit_info.size = gsp_mem.loginit.size();
   Diff in drivers/gpu/nova-core/debugfs.rs at line 71:
   -        
   +
            self.logintr_info.data = gsp_mem.logintr.start_ptr() as *mut c_void;
            self.logintr_info.size = gsp_mem.logintr.size();
   -        
   +
            self.logrm_info.data = gsp_mem.logrm.start_ptr() as *mut c_void;
            self.logrm_info.size = gsp_mem.logrm.size();
   -        
   +
            let ret = unsafe {
                nova_debugfs_create_log_files(
                    self.ptr,
   Diff in drivers/gpu/nova-core/debugfs.rs at line 83:
                    &mut *self.logrm_info as *mut _,
                )
            };
   -        
   +
            to_result(ret)?;
   -        
   +
            pr_info!("Nova debugfs: Created log files\n");
            Ok(())
        }
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::{
        driver::Bar0,
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
        }
    
        /// Function to check if GSP reload/resume has completed during the boot process.
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Delta,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
>> Diff in drivers/gpu/nova-core/gpu.rs at line 16:
    use crate::util;
    use crate::vbios::Vbios;
    
   -use core::fmt;
    use crate::debugfs::NovaDebugfs;
   +use core::fmt;
    use kernel::sync::{Arc, Mutex};
    
    static mut NOVA_DEBUGFS: Option<Arc<Mutex<NovaDebugfs>>> = None;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 5:
    use core::{mem::size_of, slice, time::Duration};
    use kernel::delay::sleep;
    use kernel::devres::Devres;
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::driver::Bar0;
    use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 15:
    use crate::nvfw::r570_144 as fw;
    use crate::util::wait_on;
    
   -use kernel::{pr_info, pr_cont};
   +use kernel::{pr_cont, pr_info};
    
    /// Print a byte slice using pr_info, with bytes_per_line bytes on each line.
    /// Each line is formatted as [0xAA, 0xBB, ...].
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 23:
        for chunk in bytes.chunks(bytes_per_line) {
            // Print opening bracket
            pr_info!("[");
   -        
   +
            // Print each byte with comma separators
            for (i, byte) in chunk.iter().enumerate() {
                if i > 0 {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 31:
                }
                pr_cont!("0x{:02X}", byte);
            }
   -        
   +
            // Print closing bracket and newline
            pr_cont!("]\n");
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 136:
    }
    
    pub(crate) trait GspSeqCmdRunner {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result;
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 143:
        // TODO: Can we return Result instead of  Result?
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_debug!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
            let addr = self.addr as usize;
            let val = self.val;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 151:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_info!(
                "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 161:
    
            let addr = self.addr as usize;
            if let Ok(temp) = sequencer.bar.try_read32(addr) {
   -            sequencer.bar.try_write32((temp & !self.mask) | self.val, addr);
   +            sequencer
   +                .bar
   +                .try_write32((temp & !self.mask) | self.val, addr);
            }
            Ok(())
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 168:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_debug!(
                "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 204:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
   -    fn run(&self, _sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
            pr_info!("DelayUs: val=0x{:x}\n", self.val);
            sleep(Duration::from_micros(self.val as u64));
            Ok(())
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 212:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            let addr = self.addr as usize;
            let index = self.index;
    
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 233:
    }
    
    impl GspSeqCmdRunner for GspSeqCmd {
   -    fn run(&self, seq: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, seq: &GspSequencer<'_>) -> Result {
            match self {
                // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
                // moving logic into this block itself. But may not be worth it if
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 281:
                    seq.sec2_falcon.start(seq.bar)?;
    
                    // Check if GSP-RM resumed.
   -                seq.gsp_falcon.check_reload_completed(seq.bar, Delta::from_secs(2))?;
   +                seq.gsp_falcon
   +                    .check_reload_completed(seq.bar, Delta::from_secs(2))?;
    
                    // Check for any errors in the SEC2 mailbox registers.
                    let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 291:
                    }
    
                    // Write the OS version to the GSP falcon.
   -                seq.gsp_falcon.write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
   +                seq.gsp_falcon
   +                    .write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
    
                    // Check if the RISC-V core is active, return error if not
                    if !seq.gsp_falcon.is_riscv_active(seq.bar)? {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 400:
            // TODO: Replace with actual RPC header size calculation from your codebase
            // For example: let rpc_header_size = RpcMsg::ver::get_gsp_rpc_hdr_size() as usize;
            let rpc_header_size = 0; // Replace with actual size when available
   -        
   +
            // Dump RPC header
            pr_info!("RPC header ({} bytes):", rpc_header_size);
            if rpc_header_size > 0 && self.data.len() >= rpc_header_size {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 409:
            } else {
                pr_info!("(RPC header not available or size unknown)\n");
            }
   -        
   +
            // Dump run structure (seq_info)
            let run_struct_size = size_of::<fw::rpc_run_cpu_sequencer_v17_00>();
            let run_struct_start = rpc_header_size;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 416:
   -        
   +
            pr_info!("Run structure ({} bytes):", run_struct_size);
            if self.data.len() >= run_struct_start + run_struct_size {
                let run_struct_slice = &self.data[run_struct_start..run_struct_start + run_struct_size];
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 421:
            } else {
                pr_info!("(Run structure not available or not enough data)\n");
            }
   -        
   +
            // Dump opcode data (first 200 bytes)
            let opcode_data_start = run_struct_start + run_struct_size;
   -        
   +
            pr_info!("First 200 bytes of opcode data:");
            if self.data.len() > opcode_data_start {
                let opcode_data_len = core::cmp::min(200, self.data.len() - opcode_data_start);
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 435:
            }
        }
    
   -    pub(crate) fn run(&self) ->  Result {
   +    pub(crate) fn run(&self) -> Result {
            pr_info!("Running CPU Sequencer commands\n");
            self.dump_bytes();
    
>> Diff in drivers/gpu/nova-core/nova_core.rs at line 25:
        }
    }
    
   +mod debugfs;
    mod dma;
    mod driver;
    mod falcon;
   Diff in drivers/gpu/nova-core/nova_core.rs at line 37:
    mod regs;
    mod util;
    mod vbios;
   -mod debugfs;
    
    pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
    
   Diff in drivers/gpu/nova-core/regs.rs at line 204:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::{
        driver::Bar0,
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
        }
    
        /// Function to check if GSP reload/resume has completed during the boot process.
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Delta,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 5:
    use core::{mem::size_of, slice, time::Duration};
    use kernel::delay::sleep;
    use kernel::devres::Devres;
   -use kernel::time::Delta;
    use kernel::prelude::*;
   +use kernel::time::Delta;
    
    use crate::driver::Bar0;
    use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 15:
    use crate::nvfw::r570_144 as fw;
    use crate::util::wait_on;
    
   -use kernel::{pr_info, pr_cont};
   +use kernel::{pr_cont, pr_info};
    
    /// Print a byte slice using pr_info, with bytes_per_line bytes on each line.
    /// Each line is formatted as [0xAA, 0xBB, ...].
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 23:
        for chunk in bytes.chunks(bytes_per_line) {
            // Print opening bracket
            pr_info!("[");
   -        
   +
            // Print each byte with comma separators
            for (i, byte) in chunk.iter().enumerate() {
                if i > 0 {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 31:
                }
                pr_cont!("0x{:02X}", byte);
            }
   -        
   +
            // Print closing bracket and newline
            pr_cont!("]\n");
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 136:
    }
    
    pub(crate) trait GspSeqCmdRunner {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result;
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 143:
        // TODO: Can we return Result instead of  Result?
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_debug!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
            let addr = self.addr as usize;
            let val = self.val;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 151:
    }
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
