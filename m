Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5A41DE2CF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112773; cv=none; b=YAhU0ahKxz5gzHybPgBxT8qZRXfQaj3vB3gaBScJxHvr15+fFnQaCGLJWNelqK06to/AnTraRGY5kQRsJBq/gorQb3sswdSRBu+JRIur2MC2r5juMsi1ehLu8ds1NBEBslZo1FUlVOc/Y1xpB2zwVkboEyzlRY7A3TJNoXETlzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112773; c=relaxed/simple;
	bh=+KoM6ZTb9XRKoKz+QCViRxnYKTmpcf8Ouk4UChGMTT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+Z0CEHamxl0t/hsyzgpaRrswUXCVngByOwL1uYoxdoOAUDQk+wPNwtj7uiFwRBYRd8mNsfzD0VE+WMCnb+3qORLc1phI5LMutzDjryWV8/r5/7ZRirM6yEiUGCrXFrIAQ7yeBnz4M4lm/Dh6yN/S+FXekzYdS9jgIpjs1nfJdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzTFCYRG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzTFCYRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750112772; x=1781648772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+KoM6ZTb9XRKoKz+QCViRxnYKTmpcf8Ouk4UChGMTT8=;
  b=LzTFCYRGJPcr0WNir/BmGoLy+w6JqA97hbB8a/20atSwAv7REaQDWLmU
   vShqCQQMEdOmYX9uDNK0GjWB68W+MwNhPOxMw/w1AE9x62Bql8a2HdA2Q
   wK9zJ9EJaidCdnICy+KoE7JA/i8WTMgalliSdzUqqdwYLHxA3OHdzITP8
   tnE0cpwpsXcdiQqnytzYL24B4Uj+15Yp03XiMQEoSNZFoeqsjTrk3T9Cr
   S+eF/e7SdUEo8eiBZ37MB3fJx+7L4TO1KtaOB0GDACI4FDr1EWg8TRB+S
   pAojZqlSmR0IgqSe0rTlGlpvzXyqJwuPQCxqBgtrwZwQvyZryUCuihdfb
   Q==;
X-CSE-ConnectionGUID: 7xSq6v6UTcuQTM8RDl6rUw==
X-CSE-MsgGUID: XW1n2Pb3SoWigyJEnBRChQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52355703"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52355703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 15:26:10 -0700
X-CSE-ConnectionGUID: LPn0akCKQ4uXeAs0kIRoiw==
X-CSE-MsgGUID: AK0bqyx9SSmTaBPWNrtlGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="171823915"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2025 15:26:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRIHG-000FOi-2k;
	Mon, 16 Jun 2025 22:26:06 +0000
Date: Tue, 17 Jun 2025 06:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 7/21] Diff in drivers/gpu/nova-core/falcon/gsp.rs at
 line 29:
Message-ID: <202506170645.tdXjuMc9-lkp@intel.com>
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
commit: bcc87d950dd3871464e65f252bc99253bfc8e1d4 [7/21] nova-core: gsp: Add support for checking if GSP reloaded
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250617/202506170645.tdXjuMc9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170645.tdXjuMc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170645.tdXjuMc9-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 29:
    
        /// Function to check if GSP reload/resume has completed during the boot process.
        #[expect(dead_code)]
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Duration,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Duration) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 29:
    
        /// Function to check if GSP reload/resume has completed during the boot process.
        #[expect(dead_code)]
   -    pub(crate) fn check_reload_completed(
   -        &self,
   -        bar: &Bar0,
   -        timeout: Duration,
   -    ) -> Result<bool> {
   +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Duration) -> Result<bool> {
            wait_on(timeout, || {
                let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
                if val.boot_stage_3_handoff() {
>> Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 29:
    
        /// Function to check if GSP reload/resume has completed during the boot process.
        #[expect(dead_code)]
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
    
   Diff in drivers/gpu/nova-core/gsp.rs at line 963:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
   Diff in drivers/gpu/nova-core/gsp.rs at line 963:
    
    impl GspMessageElement for fw::GspSystemInfo {}
    
   -fn set_system_info<'a>(
   -    dev: &pci::Device<device::Bound>,
   -    cmdq: &mut GspCmdq<'a>,
   -) -> Result {
   +fn set_system_info<'a>(dev: &pci::Device<device::Bound>, cmdq: &mut GspCmdq<'a>) -> Result {
        let mut info = unsafe { MaybeUninit::<fw::GspSystemInfo>::zeroed().assume_init() };
    
        info.gpuPhysAddr = dev.resource_start(0)?;
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
