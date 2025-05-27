Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42036198A2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324073; cv=none; b=nl1/mCxgE1Xlkc3aCPE5nYrw6pXRAFbA6MyWjMT7iNOqSaMuJ5xO1iIv6TJ7GmcUKCduvDZP8ecb6m0VeUDLHGHfANtLhRjNGb4RkxrOVBBavLr5qLXj/p+yeY56qMOtxHDBwTT9c/DTr4UskEAvBHWoSOJXfOFphH5LksHkO9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324073; c=relaxed/simple;
	bh=0Uigl6U6U1Q0op5XLQZ78k0Eb2sWB0T3ncuGXFWaFqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUy8fijHpHrjQgOUshwNMZJ05UpgzfGuA5GqI83uw/TU0NhFgRm5+KP5TwuoDQsxeFLGjAr/UGdrt/QhG1MSxM3BJmAjASmThHW3t0/+cEKXkLrM2u0FSEpxFoTX88/a+o2YTvwIQn6ymLU5NRiSzChs4gEoG3phqNpeuteXtt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQrs0hsW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQrs0hsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748324071; x=1779860071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Uigl6U6U1Q0op5XLQZ78k0Eb2sWB0T3ncuGXFWaFqA=;
  b=mQrs0hsWqs/XHmXE7ZxzO6j6W1MsrA9Lus6zJ5/NAH0IUPhT58Fp5bIS
   8p8oVzUzCHfXnKKhVxZhupKQNWtsA8sAKovEbtk3YEHTYx0pmTomHJhL9
   O7o/iRRfUhymUpP7VDUMWuDKbdfEjSmcJt/UwyCqjLHr/0s9cdLbXZPCJ
   qSeR6xmM4YHYQs8CyVcyUGSytO8bIqgUcydMhX2dfvtWtyyDH6/+/Sbrw
   YtC6iu5n5KeDoTatXxtC4A2D779jwf7COzIClLgKRweC8A7TqlZD2djnK
   81cvQNex+vsS7SgjBAIPahf5JX6KKOHSdBtXW1NddIJ0x0GVj/Kiwimuj
   Q==;
X-CSE-ConnectionGUID: DdJF9EpxQIakHIM5UXiHXg==
X-CSE-MsgGUID: z9jXa0EfSjW0wmb7sDaMpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49407628"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="49407628"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:34:30 -0700
X-CSE-ConnectionGUID: ibYtHObdQ+e4UVmr77QlEA==
X-CSE-MsgGUID: f/A/fYu9Q0qLm0/xckOn6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="179834191"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2025 22:34:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJmxG-000SuG-2s;
	Tue, 27 May 2025 05:34:26 +0000
Date: Tue, 27 May 2025 13:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 31/34] Diff in drivers/gpu/nova-core/diag.rs
 at line 1:
Message-ID: <202505271323.ZH5yf8CJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   6c4aa76c21a517b9b2d25dacff4c821bf8bd335e
commit: d3f21d42225bb48cfd2087537df9eb0e5a267bac [31/34] JOEL: debug: Add a parser for nocat records
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250527/202505271323.ZH5yf8CJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271323.ZH5yf8CJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271323.ZH5yf8CJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/diag.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
    //! GSP Diagnostic Module - NOCAT Record Parser
   -//! 
   -//! This module handles parsing and displaying NOCAT (NVIDIA Operational Critical 
   +//!
   +//! This module handles parsing and displaying NOCAT (NVIDIA Operational Critical
    //! Assessment and Triage) records received from the GSP firmware.
    
   -use kernel::prelude::*;
   -use kernel::{pr_info, pr_err, pr_warn};
    use core::ffi::c_void;
   +use kernel::prelude::*;
   +use kernel::{pr_err, pr_info, pr_warn};
    
    /// Maximum string length for NOCAT fields
    const NOCAT_JOURNAL_MAX_STR_LEN: usize = 65;
   Diff in drivers/gpu/nova-core/diag.rs at line 62:
    /// RPC structure for GSP_POST_NOCAT_RECORD event
    #[repr(C)]
    pub struct RpcGspPostNocatRecord {
   -    pub data: u32,  // This is actually the start of the NOCAT record data
   +    pub data: u32, // This is actually the start of the NOCAT record data
    }
    
    impl NocatJournalInsertRecord {
   Diff in drivers/gpu/nova-core/diag.rs at line 71:
            if data.is_null() {
                return Err(EINVAL);
            }
   -        
   +
            // The NOCAT record starts at the data field
            let record = &*(data as *const Self);
            Ok(record)
   Diff in drivers/gpu/nova-core/diag.rs at line 78:
        }
   -    
   +
        /// Convert source field to string
        fn source_as_str(&self) -> Result<&str> {
            // Find null terminator or use full length
   Diff in drivers/gpu/nova-core/diag.rs at line 83:
   -        let len = self.source.iter()
   +        let len = self
   +            .source
   +            .iter()
                .position(|&c| c == 0)
                .unwrap_or(NOCAT_JOURNAL_MAX_STR_LEN);
   -        
   -        core::str::from_utf8(&self.source[..len])
   -            .map_err(|_| EINVAL)
   +
   +        core::str::from_utf8(&self.source[..len]).map_err(|_| EINVAL)
        }
   -    
   +
        /// Convert faulting engine field to string
        fn faulting_engine_as_str(&self) -> Result<&str> {
            // Find null terminator or use full length
   Diff in drivers/gpu/nova-core/diag.rs at line 94:
   -        let len = self.faulting_engine.iter()
   +        let len = self
   +            .faulting_engine
   +            .iter()
                .position(|&c| c == 0)
                .unwrap_or(NOCAT_JOURNAL_MAX_STR_LEN);
   -        
   -        core::str::from_utf8(&self.faulting_engine[..len])
   -            .map_err(|_| EINVAL)
   +
   +        core::str::from_utf8(&self.faulting_engine[..len]).map_err(|_| EINVAL)
        }
   -    
   +
        /// Dump the NOCAT record to kernel log
        pub fn dump(&self) {
            pr_info!("=== GSP NOCAT Record ===\n");
   Diff in drivers/gpu/nova-core/diag.rs at line 105:
            pr_info!("Timestamp: {:#x}\n", self.timestamp);
   -        pr_info!("Record Type: {:?} ({})\n", 
   -            NocatRecordType::from(self.rec_type), self.rec_type);
   +        pr_info!(
   +            "Record Type: {:?} ({})\n",
   +            NocatRecordType::from(self.rec_type),
   +            self.rec_type
   +        );
            pr_info!("Flags: {:#x}\n", self.flags);
   -        
   +
            if self.bugcheck != 0 {
                pr_err!("Bugcheck Code: {:#x}\n", self.bugcheck);
            }
   Diff in drivers/gpu/nova-core/diag.rs at line 113:
   -        
   +
            if let Ok(source) = self.source_as_str() {
                if !source.is_empty() {
                    pr_info!("Source: {}\n", source);
   Diff in drivers/gpu/nova-core/diag.rs at line 117:
--
   Diff in drivers/gpu/nova-core/gsp.rs at line 25:
    use crate::regs::NV_PGSP_FALCON_ENGINE;
    use crate::regs::NV_PGSP_QUEUE_HEAD;
    
   +pub(crate) mod diag;
    pub(crate) mod fb;
    pub(crate) mod sequencer;
   -pub(crate) mod diag;
    
    pub(crate) const GSP_PAGE_SHIFT: usize = 12;
    pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
   Diff in drivers/gpu/nova-core/gsp.rs at line 342:
            ptr
        }
    
   -    fn send<A: GspMessageElement>(
   -        self: &mut Self,
   -        function: u32,
   -        args: &A,
   -    ) -> Result<()> {
   +    fn send<A: GspMessageElement>(self: &mut Self, function: u32, args: &A) -> Result<()> {
            let mut msg = GspMsgHeader {
                auth_tag_buffer: [0; 16],
                aad_buffer: [0; 16],
   Diff in drivers/gpu/nova-core/gsp.rs at line 447:
    
            let result = match rpc.function {
                fw::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
   -                let args_vec: &[u8] = unsafe { core::slice::from_raw_parts(args_ptr as *mut u8, size as usize) };
   +                let args_vec: &[u8] =
   +                    unsafe { core::slice::from_raw_parts(args_ptr as *mut u8, size as usize) };
    
                    // Create and run the GSP sequencer
   -                match sequencer::GspSequencer::new(args_vec, self.bar, self.sec2_falcon,
   -                                                   self.gsp_falcon, self.libos_dma_handle,
   -                                                   self.fw) {
   +                match sequencer::GspSequencer::new(
   +                    args_vec,
   +                    self.bar,
   +                    self.sec2_falcon,
   +                    self.gsp_falcon,
   +                    self.libos_dma_handle,
   +                    self.fw,
   +                ) {
                        Ok(sequencer) => {
                            if let Err(e) = sequencer.run() {
                                pr_info!("Error running CPU sequencer: {:?}\n", e);
   Diff in drivers/gpu/nova-core/gsp.rs at line 459:
                            }
   -                    },
   +                    }
                        Err(e) => {
                            pr_info!("Error creating CPU sequencer: {:?}\n", e);
                        }
   Diff in drivers/gpu/nova-core/gsp.rs at line 466:
                }
                fw::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => {
                    pr_info!("Received GSP_POST_NOCAT_RECORD event\n");
   -                
   +
                    // Parse and display the NOCAT record
                    if let Err(e) = diag::parse_nocat_record(args_ptr) {
                        pr_err!("Failed to parse NOCAT record: {:?}\n", e);
   Diff in drivers/gpu/nova-core/gsp.rs at line 473:
                    }
   -                
   +
                    // Return a dummy result for now
                    GspCmdq::create_result::<NoArgs>(args_ptr, 0)
                }
   Diff in drivers/gpu/nova-core/gsp.rs at line 775:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
   Diff in drivers/gpu/nova-core/regs.rs at line 135:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
   Diff in drivers/gpu/nova-core/gpu.rs at line 329:
            dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
    
            let wpr_meta = gsp::build_wpr_meta(pdev.as_ref(), &fw, &fb_layout)?;
   -        let mut libos = crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
   +        let mut libos =
   +            crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
            let libos_handle = libos.libos.dma_handle();
            let wpr_handle = wpr_meta.dma_handle();
    
>> Diff in drivers/gpu/nova-core/diag.rs at line 1:
    // SPDX-License-Identifier: GPL-2.0
    
    //! GSP Diagnostic Module - NOCAT Record Parser
   -//! 
   -//! This module handles parsing and displaying NOCAT (NVIDIA Operational Critical 
   +//!
   +//! This module handles parsing and displaying NOCAT (NVIDIA Operational Critical
    //! Assessment and Triage) records received from the GSP firmware.
    
   -use kernel::prelude::*;
   -use kernel::{pr_info, pr_err, pr_warn};
    use core::ffi::c_void;
   +use kernel::prelude::*;
   +use kernel::{pr_err, pr_info, pr_warn};
    
    /// Maximum string length for NOCAT fields
    const NOCAT_JOURNAL_MAX_STR_LEN: usize = 65;
   Diff in drivers/gpu/nova-core/diag.rs at line 62:
    /// RPC structure for GSP_POST_NOCAT_RECORD event
    #[repr(C)]
    pub struct RpcGspPostNocatRecord {
   -    pub data: u32,  // This is actually the start of the NOCAT record data
   +    pub data: u32, // This is actually the start of the NOCAT record data
    }
    
    impl NocatJournalInsertRecord {
   Diff in drivers/gpu/nova-core/diag.rs at line 71:
            if data.is_null() {
                return Err(EINVAL);
            }
   -        
   +
            // The NOCAT record starts at the data field
            let record = &*(data as *const Self);
            Ok(record)
   Diff in drivers/gpu/nova-core/diag.rs at line 78:
        }
   -    
   +
        /// Convert source field to string
        fn source_as_str(&self) -> Result<&str> {
            // Find null terminator or use full length
   Diff in drivers/gpu/nova-core/diag.rs at line 83:
   -        let len = self.source.iter()
   +        let len = self
   +            .source
   +            .iter()
                .position(|&c| c == 0)
                .unwrap_or(NOCAT_JOURNAL_MAX_STR_LEN);
   -        
   -        core::str::from_utf8(&self.source[..len])
   -            .map_err(|_| EINVAL)
   +
   +        core::str::from_utf8(&self.source[..len]).map_err(|_| EINVAL)
        }
   -    
   +
        /// Convert faulting engine field to string
        fn faulting_engine_as_str(&self) -> Result<&str> {
            // Find null terminator or use full length
   Diff in drivers/gpu/nova-core/diag.rs at line 94:
   -        let len = self.faulting_engine.iter()
   +        let len = self
   +            .faulting_engine
   +            .iter()
                .position(|&c| c == 0)
                .unwrap_or(NOCAT_JOURNAL_MAX_STR_LEN);
   -        
   -        core::str::from_utf8(&self.faulting_engine[..len])
   -            .map_err(|_| EINVAL)
   +
   +        core::str::from_utf8(&self.faulting_engine[..len]).map_err(|_| EINVAL)
        }
   -    
   +
        /// Dump the NOCAT record to kernel log
        pub fn dump(&self) {
            pr_info!("=== GSP NOCAT Record ===\n");
   Diff in drivers/gpu/nova-core/diag.rs at line 105:
            pr_info!("Timestamp: {:#x}\n", self.timestamp);
   -        pr_info!("Record Type: {:?} ({})\n", 
   -            NocatRecordType::from(self.rec_type), self.rec_type);
   +        pr_info!(
   +            "Record Type: {:?} ({})\n",
   +            NocatRecordType::from(self.rec_type),
   +            self.rec_type
   +        );
            pr_info!("Flags: {:#x}\n", self.flags);
   -        
   +
            if self.bugcheck != 0 {
                pr_err!("Bugcheck Code: {:#x}\n", self.bugcheck);
            }
   Diff in drivers/gpu/nova-core/diag.rs at line 113:
   -        
   +
            if let Ok(source) = self.source_as_str() {
                if !source.is_empty() {
                    pr_info!("Source: {}\n", source);
   Diff in drivers/gpu/nova-core/diag.rs at line 117:
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
