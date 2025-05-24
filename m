Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C701E19DF62
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081206; cv=none; b=cLn7F1rZXCzHFwgXs1Qo3ZVulrQf+DEoGcvcXi3lDXlYcmbBVK+WYTFY2z5ng985Lr7Ln2dFYyPMXkHcIs/tW/4xOU2dX/crX5hmNQLvCC/yXFK7BbV7iMVfnpAxgIkroFswbqjhKgTuAayaEAMDyiRxbV+1jwd3pXPK+H4+DiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081206; c=relaxed/simple;
	bh=05jjz13hTAHAXcCfaW0kdYhGC0y/9k8y9URK2GbdKjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dko72siFxdRPliVJ9xHpRCaMtyuNL33bDjamDz6dYlZCmb7oGN9/hLJ7aURClAqus2NJi1mBp/jO0/DTKeqSUPUvCrtH5k1VyDZTFcA+CugD+lYs2fKlItizXKbHtzdgh0DZ4UU6Dk4T+OvUr4e8Pk0i2tdcOgdikmW2WSKdeZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/apyplO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/apyplO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748081204; x=1779617204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05jjz13hTAHAXcCfaW0kdYhGC0y/9k8y9URK2GbdKjM=;
  b=l/apyplOqajIy/DNjo2NQys9kxrVhYiBLl7NHs4Y/1upUHkfCbLDH/uV
   RlV37736zItwRcsUpceEwMFIU3Ij+72k3o3iYqdt9MUCsX/VOuROPNzdB
   +bZgYugcaa8TCiniwZkmpYQJENo6xyClikKtyVH56DfBPglFeMu0GPDQo
   Fmfpz5QuZdk4tDebtSB5PHxhgvMMIRICSfm20umy6WwxHyW9z0BMJNUyi
   4X/kj0OQqGIeLkQCsnE3tJxaiA4HV2BgcBkt/c4DnHkyZcOB90Asxx7Xe
   UBKI01Drhrwf69KBCWeetlsZmvcL4zkPPtVqr7p+b3B8dop7ie82PDYNd
   Q==;
X-CSE-ConnectionGUID: RrXHDoRsQGic2rR54vPmdg==
X-CSE-MsgGUID: THu7piukSwS+b7CejvsRkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52749782"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="52749782"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:06:43 -0700
X-CSE-ConnectionGUID: P/WLw7KCQL+6lXj5Q8z1VQ==
X-CSE-MsgGUID: ReL4xGt+Q8ippTmli5B4zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141373183"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2025 03:06:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIlm3-000R6K-2m;
	Sat, 24 May 2025 10:06:39 +0000
Date: Sat, 24 May 2025 18:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 26/29] Diff in
 drivers/gpu/nova-core/gsp/sequencer.rs at line 112:
Message-ID: <202505241747.RuxxT7f7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   a22572729f81a31e3c4e9a09fdc9dd28c53f8f4e
commit: 8bffafc37c335a94feb293fc19f6bd5a70f2e149 [26/29] WIP: nova-core: Implement the GSP sequeuncer
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250524/202505241747.RuxxT7f7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241747.RuxxT7f7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241747.RuxxT7f7-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/gpu.rs at line 329:
            dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
    
            let wpr_meta = gsp::build_wpr_meta(pdev.as_ref(), &fw, &fb_layout)?;
   -        let mut libos = crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
   +        let mut libos =
   +            crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
            let libos_handle = libos.libos.dma_handle();
            let wpr_handle = wpr_meta.dma_handle();
    
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 34:
                // Note that try_read32() is only available for fixed-offset registers.
                with_bar!(?bar, |b| {
                    Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(b))
   -            }).ok().and_then(|val| {
   +            })
   +            .ok()
   +            .and_then(|val| {
                    if val.boot_stage_3_handoff() {
                        Some(true)
                    } else {
   Diff in drivers/gpu/nova-core/regs.rs at line 135:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
>> Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 112:
    }
    
    pub(crate) trait GspSeqCmdRunner {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result;
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result;
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 119:
        // TODO: Can we return Result instead of  Result?
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
            let addr = self.addr as usize;
            let val = self.val;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 128:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!(
                "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 147:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!(
                "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 171:
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
   +                if (current & self.mask) == self.val {
   +                    Some(())
   +                } else {
   +                    None
   +                }
   +            })
            })?;
            Ok(())
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 184:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
   -    fn run<'a>(&self, _sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, _sequencer: &GspSequencer<'a>) -> Result {
            pr_info!("DelayUs: val=0x{:x}\n", self.val);
            sleep(Duration::from_micros(self.val as u64));
            Ok(())
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 192:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            let addr = self.addr as usize;
            let index = self.index;
    
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 213:
    }
    
    impl GspSeqCmdRunner for GspSeqCmd {
   -    fn run<'a>(&self, seq: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, seq: &GspSequencer<'a>) -> Result {
            match self {
                // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
                // moving logic into this block itself. But may not be worth it if
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 261:
                    seq.sec2_falcon.start(seq.bar)?;
    
                    // Check if GSP-RM resumed.
   -                seq.gsp_falcon.check_reload_completed(seq.bar, Duration::from_secs(2))?;
   +                seq.gsp_falcon
   +                    .check_reload_completed(seq.bar, Duration::from_secs(2))?;
    
                    // Check for any errors in the SEC2 mailbox registers.
                    let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 271:
                    }
    
                    // Write the OS version to the GSP falcon.
   -                seq.gsp_falcon.write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
   +                seq.gsp_falcon
   +                    .write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
    
                    // Check if the RISC-V core is active, return error if not
                    if !seq.gsp_falcon.is_riscv_active(seq.bar)? {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 381:
            })
        }
    
   -    pub(crate) fn run(&self) ->  Result {
   +    pub(crate) fn run(&self) -> Result {
            pr_info!("Running CPU Sequencer commands\n");
    
            for cmd_result in self {
>> Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 112:
    }
    
    pub(crate) trait GspSeqCmdRunner {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result;
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result;
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 119:
        // TODO: Can we return Result instead of  Result?
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
            let addr = self.addr as usize;
            let val = self.val;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 128:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!(
                "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 147:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!(
                "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 171:
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
   +                if (current & self.mask) == self.val {
   +                    Some(())
   +                } else {
   +                    None
   +                }
   +            })
            })?;
            Ok(())
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 184:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
   -    fn run<'a>(&self, _sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, _sequencer: &GspSequencer<'a>) -> Result {
            pr_info!("DelayUs: val=0x{:x}\n", self.val);
            sleep(Duration::from_micros(self.val as u64));
            Ok(())
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 192:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            let addr = self.addr as usize;
            let index = self.index;
    
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 213:
    }
    
    impl GspSeqCmdRunner for GspSeqCmd {
   -    fn run<'a>(&self, seq: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, seq: &GspSequencer<'a>) -> Result {
            match self {
                // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
                // moving logic into this block itself. But may not be worth it if
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 261:
                    seq.sec2_falcon.start(seq.bar)?;
    
                    // Check if GSP-RM resumed.
   -                seq.gsp_falcon.check_reload_completed(seq.bar, Duration::from_secs(2))?;
   +                seq.gsp_falcon
   +                    .check_reload_completed(seq.bar, Duration::from_secs(2))?;
    
                    // Check for any errors in the SEC2 mailbox registers.
                    let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 271:
                    }
    
                    // Write the OS version to the GSP falcon.
   -                seq.gsp_falcon.write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
   +                seq.gsp_falcon
   +                    .write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
    
                    // Check if the RISC-V core is active, return error if not
                    if !seq.gsp_falcon.is_riscv_active(seq.bar)? {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 381:
            })
        }
    
   -    pub(crate) fn run(&self) ->  Result {
   +    pub(crate) fn run(&self) -> Result {
            pr_info!("Running CPU Sequencer commands\n");
    
            for cmd_result in self {
   Diff in drivers/gpu/nova-core/gsp.rs at line 341:
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 446:
    
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 458:
                            }
   -                    },
   +                    }
                        Err(e) => {
                            pr_info!("Error creating CPU sequencer: {:?}\n", e);
                        }
   Diff in drivers/gpu/nova-core/gsp.rs at line 755:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 34:
                // Note that try_read32() is only available for fixed-offset registers.
                with_bar!(?bar, |b| {
                    Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(b))
   -            }).ok().and_then(|val| {
   +            })
   +            .ok()
   +            .and_then(|val| {
                    if val.boot_stage_3_handoff() {
                        Some(true)
                    } else {
   Diff in drivers/gpu/nova-core/gpu.rs at line 329:
            dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
    
            let wpr_meta = gsp::build_wpr_meta(pdev.as_ref(), &fw, &fb_layout)?;
   -        let mut libos = crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
   +        let mut libos =
   +            crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
            let libos_handle = libos.libos.dma_handle();
            let wpr_handle = wpr_meta.dma_handle();
    
>> Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 112:
    }
    
    pub(crate) trait GspSeqCmdRunner {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result;
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result;
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 119:
        // TODO: Can we return Result instead of  Result?
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
            let addr = self.addr as usize;
            let val = self.val;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 128:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!(
                "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 147:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            pr_info!(
                "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
                self.addr,
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 171:
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
   +                if (current & self.mask) == self.val {
   +                    Some(())
   +                } else {
   +                    None
   +                }
   +            })
            })?;
            Ok(())
        }
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 184:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
   -    fn run<'a>(&self, _sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, _sequencer: &GspSequencer<'a>) -> Result {
            pr_info!("DelayUs: val=0x{:x}\n", self.val);
            sleep(Duration::from_micros(self.val as u64));
            Ok(())
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 192:
    }
    
    impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
   -    fn run<'a>(&self, sequencer: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, sequencer: &GspSequencer<'a>) -> Result {
            let addr = self.addr as usize;
            let index = self.index;
    
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 213:
    }
    
    impl GspSeqCmdRunner for GspSeqCmd {
   -    fn run<'a>(&self, seq: &GspSequencer<'a>) ->  Result {
   +    fn run<'a>(&self, seq: &GspSequencer<'a>) -> Result {
            match self {
                // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
                // moving logic into this block itself. But may not be worth it if
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 261:
                    seq.sec2_falcon.start(seq.bar)?;
    
                    // Check if GSP-RM resumed.
   -                seq.gsp_falcon.check_reload_completed(seq.bar, Duration::from_secs(2))?;
   +                seq.gsp_falcon
   +                    .check_reload_completed(seq.bar, Duration::from_secs(2))?;
    
                    // Check for any errors in the SEC2 mailbox registers.
                    let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
   Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 271:
                    }
    
                    // Write the OS version to the GSP falcon.
   -                seq.gsp_falcon.write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
   +                seq.gsp_falcon
   +                    .write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
