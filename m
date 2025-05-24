Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15316801
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748076820; cv=none; b=TGzrC/5eBSntc3prjWZXdUyqfy9bRSulVz/b66AAtJHy618Rd4O0eSkDL0AzJZO6uQsi4wUAE4aTffe603Br4ZujvmzUDqzNWtINOqTKsAze9e9wHBg8Nte8UqjBJ1JHYw8fEU+qKwddq/QlZFCkLUdo+kohcA7JAz/ep0wEzlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748076820; c=relaxed/simple;
	bh=X1FIx6huetPc6ZZra6qp7Su8OwEK/UsCdpZzGjLt3Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njR4LaMi2gka/wsEQngfMT63fJkLgA7vGFaBPjw6b/JtYgZeY4zgXdAFky8w+8OWjZfXqCX0HrxTXkWSKUfkUkpuavvYV8IhWw7P9FDRSPNGFR980vC+8gyYk4rQqB3vdS26EuzV8FhbXR8uDeWCkKffMPa+hm62Q7W9KRiqeo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvzgFyCP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvzgFyCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748076818; x=1779612818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X1FIx6huetPc6ZZra6qp7Su8OwEK/UsCdpZzGjLt3Ns=;
  b=HvzgFyCP5aBfJwO1fdwPS4OusKZUg8q+rQu6l1QSSh3ISD5uRsG00FhN
   8P8/r7KNkfaFt1iOFSZ7TN+SHj81FgTX7buFLwabLvTzxC5W6wmry5Rgi
   o7XYmdLCYpGYgA/Nns/+2hDjL2f1YXeEuX+297CBtfAegjILx+sgMyxxf
   qMw9zyl88DLt7zRXtx1UzaHmpPnpfrahQ558pLOS7oww7SVPike8astNI
   liqOPlhqltUsC/yydUnJVmY92onJVkHhJ/QQ7KE5/AX4KwUwqTdw3IoZ4
   dggfhU2RxH1Zpv2LJHODb9mS1rKGScxChq+wRUiSle0ExesJtcNddPFyh
   g==;
X-CSE-ConnectionGUID: rrAa/RyvSoasfxAT085iuw==
X-CSE-MsgGUID: i5vasuW/R4+6iRJtex3cZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50046396"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50046396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 01:53:37 -0700
X-CSE-ConnectionGUID: 19oe0eIwRQ+BsNmFkkKZfQ==
X-CSE-MsgGUID: ooRyGOByQ2ivBC3z+ricOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141895048"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2025 01:53:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIkdK-000R48-13;
	Sat, 24 May 2025 08:53:34 +0000
Date: Sat, 24 May 2025 16:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 19/29] Diff in drivers/gpu/nova-core/regs.rs
 at line 135:
Message-ID: <202505241647.ja0nU2Wy-lkp@intel.com>
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
commit: 7320dce83b2192e41bcf791e8e84c5ad1d4931e0 [19/29] nova-core: falcon: Add support to write firmware version
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250524/202505241647.ja0nU2Wy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241647.ja0nU2Wy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241647.ja0nU2Wy-lkp@intel.com/

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
    
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 35:
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
>> Diff in drivers/gpu/nova-core/regs.rs at line 135:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
   Diff in drivers/gpu/nova-core/gsp.rs at line 340:
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 739:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 35:
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
    
   Diff in drivers/gpu/nova-core/gsp.rs at line 340:
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
   Diff in drivers/gpu/nova-core/gsp.rs at line 739:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
>> Diff in drivers/gpu/nova-core/regs.rs at line 135:
        31:0    value as u32;
    });
    
   -
    // Used to store version information about the firmware running
    // on the Falcon processor.
    register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
   Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 35:
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
   make[2]: *** [Makefile:1828: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
