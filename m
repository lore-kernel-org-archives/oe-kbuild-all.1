Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A502AE9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071713; cv=none; b=hzsaSvQRtAJMqFkpU8wIlAG4qIY6NpdiKPV7NdOSanFRzWlZMLf0KZIztTG4mZAX14FZ5HD9LTxgPro9j/5Ca77u0Ri9t0X0KT3Sx5vaDSol8JiZ91jeQuyJmEQ7x5/PYiYO/PlQFnM13/cixxjzVa97jtUsrmae9asAr8IOdOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071713; c=relaxed/simple;
	bh=ZjbA9NsgMkm4mNPTzv4hqjuolnEfiYviNpe1jS65MEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=McXt7+sunZ9yJsIe6bILEuHUQwqdItl+UWfpbU9gLDpfsswLKS7WOHuM7vosGZvyg6z2M+o0LPJFafiHTGzBI6sjdJBtJ+/N3C/i7wyJ7eef4VNu4j0WSRbmYWk0Vm2t4743SbTrXuliu7GixEeUOij4G9vOrmqGoKb3InOKlY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrtQnR8C; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrtQnR8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748071712; x=1779607712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjbA9NsgMkm4mNPTzv4hqjuolnEfiYviNpe1jS65MEI=;
  b=MrtQnR8CuVS73qfxZ67X8uli79jrfm6NZHLapz6ktHcN3tjsAyPWWD5h
   H8uGG3PVn9jFm6oRIDNwogabxD7v3Gc7dJyPNJror18ifN+opOKjmQWiS
   o08j1dbLGvPGJmBU1qroYkTc9Cq2aHmLl9rlKZSI4WMizUPtcYuQAg5T6
   YEEtmLgjOKQIbvrHFuLkBkojsKx6bamdXWLHPGw83HU508bbC8knU6gSv
   juO3gqGuNkuUzkWN+wU7wBimtDgvWjCZU9lyceI69eaLMPJZtxiMX8LEk
   OTEX94CHHVQKmb/DHM00vIinwM7pm/6aGB0qj2kImi/jKiT79V5+WlKcw
   w==;
X-CSE-ConnectionGUID: 8UxWkKoKSS6aAsqMZgP+SQ==
X-CSE-MsgGUID: KLWo+x9dSUalcdYeqk9F3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61527624"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61527624"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:28:31 -0700
X-CSE-ConnectionGUID: lrhGKGi3TeGqyYtqtR+N2w==
X-CSE-MsgGUID: P5EZbDkXQVu+F8O85M3YYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141524309"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 May 2025 00:28:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjIx-000R1K-30;
	Sat, 24 May 2025 07:28:27 +0000
Date: Sat, 24 May 2025 15:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 15/29] Diff in
 drivers/gpu/nova-core/falcon/gsp.rs at line 35:
Message-ID: <202505241554.myqCKeLC-lkp@intel.com>
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
commit: 7bb26dc82531eddbbf39641a502fe4ee5d99986c [15/29] nova-core: gsp: Add support for checking if GSP reloaded
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250524/202505241554.myqCKeLC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241554.myqCKeLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241554.myqCKeLC-lkp@intel.com/

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
    
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 35:
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
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 35:
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
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 35:
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
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
