Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636A280A35
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545391; cv=none; b=JMiBtSKaRAQz6FF7ebNzey+YB9J7a/TYYZgaBhX3zUr9eDLdWoOrJAj3jkukADe+yRxBzH6OYq12jUPF5SeeXkuPTF38fCgWao5PXzqNnfonwqB9VoH3ilRoHNrVIPEqWC7ytxIEeqeAf4J0NeabPUedeO1p+Mxi7do2fTs0Ea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545391; c=relaxed/simple;
	bh=LGpiiPl1J6bG8Kn1RzVQc+p/nd/q5fpCpehZd/J0UHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cx6mZ47QZk3OB3YByMZKPO66IrQsqP5N+zcNRpME5Pq5XTWsnPo+ie16GxPWZdrgQIfa9iSGZp2lqrTCSzgrlkTEURQuq5OJuCQ2JJk+hdJgxDTwUcuGhdgLtIUTYDcY8KpFMOJy/sE3i8t//Vqgt+AQ/yPePheYeQlowC4pKfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddkKfEt6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddkKfEt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749545390; x=1781081390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGpiiPl1J6bG8Kn1RzVQc+p/nd/q5fpCpehZd/J0UHg=;
  b=ddkKfEt6HyLSWN8AbfhurscZb1RGjEADHTiyMEJyXFImh/SOxQqQMPqi
   g+WoT739JxyRQ6zmFshLPAtdIwTOkNdMGMrIJ78dwJmy/Qn6Q5o7F+sd/
   51NlbwmUd+M0DMSL5yv0YHllHvfGGOGNIleDxJfJ4cEXslwebLOKpmiRS
   JNDq7S8glVTiYINfjaK1+lW49/DqPBAOI8CuDyk1uqNVmubLa9m48iZlg
   wfpXfJvbfDpo/Styt5cAGlX1H3ILIwNMpmTkN3aOzVBFhRoKVHobtUmOF
   uGHxBq02oxNuQge3mjge1FkaOtmEZVfm5fl+WZ8AQoCn666ICf+QGBDcF
   A==;
X-CSE-ConnectionGUID: firkYe3zQOeekbWtv/B3qw==
X-CSE-MsgGUID: 9yXnXEUwQpWxz6onuXl4UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74179034"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="74179034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:49:50 -0700
X-CSE-ConnectionGUID: N+/i6tTyS4OoqtOHGAB0kQ==
X-CSE-MsgGUID: 5uBcckJQTQmOzSM7XgRpPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147135254"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2025 01:49:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOufx-000801-1t;
	Tue, 10 Jun 2025 08:49:45 +0000
Date: Tue, 10 Jun 2025 16:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/debugfs 48/48] Diff in drivers/gpu/nova-core/debugfs.rs
 at line 1:
Message-ID: <202506101622.CuYyKFHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/debugfs
head:   85df17d24b655329043fa21f6d3d5ff5e95f02de
commit: 85df17d24b655329043fa21f6d3d5ff5e95f02de [48/48] JOEL: HACK: debugfs support to dump logrm, logintr, loginit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250610/202506101622.CuYyKFHj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101622.CuYyKFHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101622.CuYyKFHj-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/regs.rs at line 135:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
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
--
   -        
   +
            pr_info!("Run structure ({} bytes):", run_struct_size);
            if self.data.len() >= run_struct_start + run_struct_size {
                let run_struct_slice = &self.data[run_struct_start..run_struct_start + run_struct_size];
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 428:
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
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 442:
            }
        }
    
   -    pub(crate) fn run(&self) ->  Result {
   +    pub(crate) fn run(&self) -> Result {
            pr_info!("Running CPU Sequencer commands\n");
            self.dump_bytes();
    
   Diff in drivers/gpu/nova-core/gsp.rs at line 343:
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 448:
    
            let result = match rpc.function {
                fw::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
   -                let args_vec: &[u8] = unsafe { core::slice::from_raw_parts(args_ptr as *mut u8, rpc.length as usize) };
   +                let args_vec: &[u8] = unsafe {
   +                    core::slice::from_raw_parts(args_ptr as *mut u8, rpc.length as usize)
   +                };
    
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 460:
                            }
   -                    },
   +                    }
                        Err(e) => {
                            pr_info!("Error creating CPU sequencer: {:?}\n", e);
                        }
   Diff in drivers/gpu/nova-core/gsp.rs at line 648:
    
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 907:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
>> Diff in drivers/gpu/nova-core/nova_core.rs at line 56:
        }
    }
    
   +mod debugfs;
    mod devinit;
    mod dma;
    mod driver;
   Diff in drivers/gpu/nova-core/nova_core.rs at line 67:
    mod regs;
    mod util;
    mod vbios;
   -mod debugfs;
   -
   -
    
    kernel::module_pci_driver! {
        type: driver::NovaCore,
   Diff in drivers/gpu/nova-core/regs.rs at line 135:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
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
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 150:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_info!(
                "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 169:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
   -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
   +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
            pr_info!(
                "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 193:
            // and returns a Result<R>.
            wait_on(Duration::from_micros(timeout_us), || {
                with_bar!(?&sequencer.bar, |b|
   -                b.try_read32(addr)).ok().and_then(|current| {
   -                    if (current & self.mask) == self.val {
   -                        Some(())
   -                    } else {
   -                        None
   -                    }
   -                })
   +                b.try_read32(addr))
   +            .ok()
   +            .and_then(|current| {
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
