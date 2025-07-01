Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159417993
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751391981; cv=none; b=VzcXERHShQf2k+9ebp85AztySyzAgZxiDRRkV+nCJMDcBsPS60zSl2KhcetO8KCYvNj6XTAw3kSONKXYXxrFDmU4AMW3SOaaSGCb+jrx1+EKLRxgpBEX5py/pzwuixJD0ZR0wLmQV//Uyd1guwNj2j7kokWd45cns0ql2Ug7QIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751391981; c=relaxed/simple;
	bh=In0fGGUXA+2WsdtrNC5F304DA+bCOLKJXV+uQC3+fFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrR4fySTLzXg7lsupwkmcfv2sQNTsIvgPCMpeN6vdRrz1tKRjlslDDAMBb9LIOms02POa++aFT9BVsq7XHByFW2sOePU5M5vE1bx+ab7darvzbmC6gvO4IPu7Og/poJh4sYkK9SCJVFqFsQj9r+uldOzqx6Yt82On1Dw87epwJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nly8H3jn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nly8H3jn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751391978; x=1782927978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=In0fGGUXA+2WsdtrNC5F304DA+bCOLKJXV+uQC3+fFY=;
  b=nly8H3jntgOE270H1gHr0C/eAyuJSShRe5ni/VBJ3fyCT4PpVIphuOIH
   WT9vpfc2YAq/BNfgrBIBF26Xb6e4oHZDGig9ch82D4PdwOeojiUkF6JCk
   J4EYzXaRbh+B+zv8vx4zlSH4GG4RWG9dsM7djgXSXupDPHUFwHQUaRjw2
   b8oEbiuwRxvtu4tVccQR/sigO4C+ES63U/qQf0FmnzwRllLVE3DWijszF
   Q71tR65BKDZCerZR0x7Vt+vtDZ2K0x1RHZhTyJbTaYRuEPdrvUOZgcKGB
   VOTyOCNxGmnq8XHv0r8kWk3JxN2giHXrbO4N6kwok/RtsvPGVa5iWwwTc
   Q==;
X-CSE-ConnectionGUID: O1PtX0NDQAGrhLwahi0nKA==
X-CSE-MsgGUID: WB1GOSyTSQGHHnTOgQrlNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53606079"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53606079"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 10:46:18 -0700
X-CSE-ConnectionGUID: zT/Wh4aORu6bcEkThzuv0g==
X-CSE-MsgGUID: TqRFlVJJQS+f2anBbE8oiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="157868575"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jul 2025 10:46:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWf3e-000aUy-3C;
	Tue, 01 Jul 2025 17:46:14 +0000
Date: Wed, 2 Jul 2025 01:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/master 75/87] Diff in drivers/gpu/nova-core/gsp.rs at
 line 282:
Message-ID: <202507020156.d9eIyDeT-lkp@intel.com>
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
commit: d6f9c951f63cee4668b0e71f20d124f3fad79c61 [75/87] nova-core: put GspStaticConfigInfo_t on the heap
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250702/202507020156.d9eIyDeT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020156.d9eIyDeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020156.d9eIyDeT-lkp@intel.com/

All errors (new ones prefixed by >>):

    
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
    
>> Diff in drivers/gpu/nova-core/gsp.rs at line 282:
    impl GspMessageElement for fw::GspStaticConfigInfo_t {}
    
    // Helper function to create KBox<GspStaticConfigInfo_t> directly from slices
   -fn new_gsp_static_config_from_slices(slice_1: &[u8], slice_2: Option<&[u8]>) -> Result<KBox<fw::GspStaticConfigInfo_t>> {
   +fn new_gsp_static_config_from_slices(
   +    slice_1: &[u8],
   +    slice_2: Option<&[u8]>,
   +) -> Result<KBox<fw::GspStaticConfigInfo_t>> {
        if let Some(some_slice) = slice_2 {
            if slice_1.len() + some_slice.len() < size_of::<fw::GspStaticConfigInfo_t>() {
                return Err(EINVAL);
   Diff in drivers/gpu/nova-core/gsp.rs at line 318:
            let mut boxed_result = KBox::<fw::GspStaticConfigInfo_t>::new_uninit(GFP_KERNEL)?;
            let result_ptr = boxed_result.as_mut_ptr() as *mut u8;
            unsafe {
   -            core::ptr::copy_nonoverlapping(slice_1.as_ptr(), result_ptr, size_of::<fw::GspStaticConfigInfo_t>());
   +            core::ptr::copy_nonoverlapping(
   +                slice_1.as_ptr(),
   +                result_ptr,
   +                size_of::<fw::GspStaticConfigInfo_t>(),
   +            );
            }
            Ok(unsafe { boxed_result.assume_init() })
        }
   Diff in drivers/gpu/nova-core/nova_core.rs at line 25:
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
--
    
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
    
>> Diff in drivers/gpu/nova-core/gsp.rs at line 282:
    impl GspMessageElement for fw::GspStaticConfigInfo_t {}
    
    // Helper function to create KBox<GspStaticConfigInfo_t> directly from slices
   -fn new_gsp_static_config_from_slices(slice_1: &[u8], slice_2: Option<&[u8]>) -> Result<KBox<fw::GspStaticConfigInfo_t>> {
   +fn new_gsp_static_config_from_slices(
   +    slice_1: &[u8],
   +    slice_2: Option<&[u8]>,
   +) -> Result<KBox<fw::GspStaticConfigInfo_t>> {
        if let Some(some_slice) = slice_2 {
            if slice_1.len() + some_slice.len() < size_of::<fw::GspStaticConfigInfo_t>() {
                return Err(EINVAL);
   Diff in drivers/gpu/nova-core/gsp.rs at line 318:
            let mut boxed_result = KBox::<fw::GspStaticConfigInfo_t>::new_uninit(GFP_KERNEL)?;
            let result_ptr = boxed_result.as_mut_ptr() as *mut u8;
            unsafe {
   -            core::ptr::copy_nonoverlapping(slice_1.as_ptr(), result_ptr, size_of::<fw::GspStaticConfigInfo_t>());
   +            core::ptr::copy_nonoverlapping(
   +                slice_1.as_ptr(),
   +                result_ptr,
   +                size_of::<fw::GspStaticConfigInfo_t>(),
   +            );
            }
            Ok(unsafe { boxed_result.assume_init() })
        }
   Diff in drivers/gpu/nova-core/debugfs.rs at line 1:
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
