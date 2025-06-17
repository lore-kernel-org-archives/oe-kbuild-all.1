Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3178F52
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 00:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120646; cv=none; b=aaR5kvqguCpRJKCojHZRT+lbOc1MXpShccuEOyXXhPFs9REgmIZBgIDq8rpcbgUO9WDJVR0wrCwo+GeWcKOnQHZCEOLfpq8IbTceD8bwcloqw6ED6VDFdTfJ2zQJcuX0BjDcvzip90LYgVcqAF/uTPWlkN0UybaYsE8+SKSMaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120646; c=relaxed/simple;
	bh=iq4VEDBeyxf+4IaxR8HFmn8y6flaxqFZc63YpPJaV6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BdYhBlBEmH6I1dxosaP9yub+AiLXhjYpRNCyk1KE/kc5XeEYR4Oe2++SzEsIzJZTuNXhEZTaE3KgV/lJu8DR7uvoMTQPmiALmuFBwaRi++Jl/5T+w/gCZa+wOEGLUADk7bMbBeX9eKXNz1zVD/sS+cLcD31k0m3liRmE9mJIY8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/NK2D8T; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/NK2D8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750120645; x=1781656645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iq4VEDBeyxf+4IaxR8HFmn8y6flaxqFZc63YpPJaV6o=;
  b=L/NK2D8TfkdKfuSBHuuyN0vHFRamkAhdxVUb2dYNzaXmnxGh7E1+AB7T
   8ejfi97w6ON9AudlJ/nJs7k+Ge47xR92BzRs3BxJxaZnd2T7vnQJmYCkV
   +pLP50Qk2OzgsdwF6P8K4eMIt48Lg/2medQuMD3zOrir2bkQX4nN9vkTL
   Ha7zOeQhLNEhWQsbNw/o90KO6SM0MdVj02wWgDGEkIYyLvZ0zM78f7OBt
   gf7DRliqGPpwF8uCcVrz/z3UN/VdOZIP+GToK5jJIGOG9XVWANiq7xt9X
   uMMhioK2fIJUKS3rCVKF8JY2eysT1Q+kiDNpXSWS4CJgWkQN+sE9inkc4
   w==;
X-CSE-ConnectionGUID: HUXotar2QsGyNEz8Zv4rRQ==
X-CSE-MsgGUID: r5xsI5blTIqH/ocXAcOmAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52144970"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52144970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 17:37:24 -0700
X-CSE-ConnectionGUID: cFUTpjKpTQGf5FBWuAwOjg==
X-CSE-MsgGUID: w4gdBcdcTOyCkj83bWJhRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179495492"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2025 17:37:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRKKG-000FSi-07;
	Tue, 17 Jun 2025 00:37:20 +0000
Date: Tue, 17 Jun 2025 08:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 13/21] Diff in
 drivers/gpu/nova-core/gsp/sequencer.rs at line 13:
Message-ID: <202506170808.Q2KXEU6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   56bbeece5cd3f0e548634d74272506361802de97
commit: 3fb13e39f1d12e1dee7448c78db34103f24cbed4 [13/21] nova-core: Implement the GSP sequencer
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250617/202506170808.Q2KXEU6B-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170808.Q2KXEU6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170808.Q2KXEU6B-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
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
   Diff in drivers/gpu/nova-core/gpu.rs at line 312:
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
    
>> Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 13:
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
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            let addr = self.addr as usize;
            let index = self.index;
    
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 231:
    }
    
    impl GspSeqCmdRunner for GspSeqCmd {
   -    fn run(&self, seq: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, seq: &GspSequencer<'_>) -> Result {
            match self {
                // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
                // moving logic into this block itself. But may not be worth it if
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 279:
                    seq.sec2_falcon.start(seq.bar)?;
--
                    if !seq.gsp_falcon.is_riscv_active(seq.bar)? {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 403:
            // TODO: Replace with actual RPC header size calculation from your codebase
            // For example: let rpc_header_size = RpcMsg::ver::get_gsp_rpc_hdr_size() as usize;
            let rpc_header_size = 0; // Replace with actual size when available
   -        
   +
            // Dump RPC header
            pr_info!("RPC header ({} bytes):", rpc_header_size);
            if rpc_header_size > 0 && self.data.len() >= rpc_header_size {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 412:
            } else {
                pr_info!("(RPC header not available or size unknown)\n");
            }
   -        
   +
            // Dump run structure (seq_info)
            let run_struct_size = size_of::<fw::rpc_run_cpu_sequencer_v17_00>();
            let run_struct_start = rpc_header_size;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 419:
   -        
   +
            pr_info!("Run structure ({} bytes):", run_struct_size);
            if self.data.len() >= run_struct_start + run_struct_size {
                let run_struct_slice = &self.data[run_struct_start..run_struct_start + run_struct_size];
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 424:
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
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 438:
            }
        }
    
   -    pub(crate) fn run(&self) ->  Result {
   +    pub(crate) fn run(&self) -> Result {
            pr_info!("Running CPU Sequencer commands\n");
            self.dump_bytes();
    
   Diff in drivers/gpu/nova-core/gsp.rs at line 584:
    
            let result = match rpc.function {
                fw::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
   -                let args_vec: &[u8] = unsafe { core::slice::from_raw_parts(args_ptr as *mut u8, rpc.length as usize) };
   +                let args_vec: &[u8] = unsafe {
   +                    core::slice::from_raw_parts(args_ptr as *mut u8, rpc.length as usize)
   +                };
    
                    // Create and run the GSP sequencer
                    self.bar.try_access_with(|bar| {
   Diff in drivers/gpu/nova-core/gsp.rs at line 591:
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 597:
                                }
   -                        },
   +                        }
                            Err(e) => {
                                pr_info!("Error creating CPU sequencer: {:?}\n", e);
                            }
   Diff in drivers/gpu/nova-core/gsp.rs at line 993:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
   Diff in drivers/gpu/nova-core/regs.rs at line 188:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
>> Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 13:
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
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            let addr = self.addr as usize;
            let index = self.index;
    
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 231:
    }
    
    impl GspSeqCmdRunner for GspSeqCmd {
   -    fn run(&self, seq: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, seq: &GspSequencer<'_>) -> Result {
            match self {
                // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
                // moving logic into this block itself. But may not be worth it if
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 279:
                    seq.sec2_falcon.start(seq.bar)?;
    
                    // Check if GSP-RM resumed.
   -                seq.gsp_falcon.check_reload_completed(seq.bar, Duration::from_secs(2))?;
   +                seq.gsp_falcon
   +                    .check_reload_completed(seq.bar, Duration::from_secs(2))?;
    
                    // Check for any errors in the SEC2 mailbox registers.
                    let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 289:
                    }
    
                    // Write the OS version to the GSP falcon.
   -                seq.gsp_falcon.write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
   +                seq.gsp_falcon
   +                    .write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
    
                    // Check if the RISC-V core is active, return error if not
                    if !seq.gsp_falcon.is_riscv_active(seq.bar)? {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 403:
            // TODO: Replace with actual RPC header size calculation from your codebase
            // For example: let rpc_header_size = RpcMsg::ver::get_gsp_rpc_hdr_size() as usize;
            let rpc_header_size = 0; // Replace with actual size when available
   -        
   +
            // Dump RPC header
            pr_info!("RPC header ({} bytes):", rpc_header_size);
            if rpc_header_size > 0 && self.data.len() >= rpc_header_size {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 412:
            } else {
                pr_info!("(RPC header not available or size unknown)\n");
            }
   -        
   +
            // Dump run structure (seq_info)
            let run_struct_size = size_of::<fw::rpc_run_cpu_sequencer_v17_00>();
            let run_struct_start = rpc_header_size;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 419:
   -        
   +
            pr_info!("Run structure ({} bytes):", run_struct_size);
            if self.data.len() >= run_struct_start + run_struct_size {
                let run_struct_slice = &self.data[run_struct_start..run_struct_start + run_struct_size];
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 424:
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
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 438:
            }
        }
    
   -    pub(crate) fn run(&self) ->  Result {
   +    pub(crate) fn run(&self) -> Result {
            pr_info!("Running CPU Sequencer commands\n");
            self.dump_bytes();
    
>> Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 13:
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
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            let addr = self.addr as usize;
            let index = self.index;
    
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 231:
    }
    
    impl GspSeqCmdRunner for GspSeqCmd {
   -    fn run(&self, seq: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, seq: &GspSequencer<'_>) -> Result {
            match self {
                // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
                // moving logic into this block itself. But may not be worth it if
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 279:
                    seq.sec2_falcon.start(seq.bar)?;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
