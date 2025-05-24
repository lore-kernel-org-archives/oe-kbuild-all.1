Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C354918
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748068589; cv=none; b=vAkxQuxd4fL87LGuUKdy7Jt2pF+tVrcRBXz42dVtqAJ6ifD702TcCI0c67b5vCkWhOzfavhoWQsw2i2893Vm3lrNj30XL0UZD1RM0NY9OPW7m4ruALHNuekcMXjwtO+7Xgc/qSv4QUvCwckcFi6fCjOZCDbqF6OKI36lJ/BCaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748068589; c=relaxed/simple;
	bh=84iMX7Ys48vIiP4tJ0aVirqymb2Szqde2XVbsU14T+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctGbr/N+8pqgnt5wtJZOFUUVfXYJ5dJ+hkKVroO1TrrMTIj5SH7ZMugz1fsxCdyVtT6yMFXr5Ajh08mORJ2nzM5m07mzkpOsoASKQHmjKqgmfoAhxHnwfitswaR1jOJ9I2pi7QjvsyBsudXnBMZTu7y2McG8lX/dVKFM7AKIUDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgtNg7KH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgtNg7KH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748068587; x=1779604587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84iMX7Ys48vIiP4tJ0aVirqymb2Szqde2XVbsU14T+4=;
  b=EgtNg7KHVQF50lkxX2oHUXSDTr6w+R60xIShCy0wInWFGnmZm2AdNLsM
   TUpohirMGv3ooESAhaMhIpd+9awPhyxmujoFgBD6J74LHkwatv94uxOqP
   kjU0mGhfFOQQQe/gI9mhIV1pPQ8SAHkR494mZqVN81u00ybkZ80mRQ+UF
   DS6qpV/ARm+LOgVwtnV+t8SlLOHtmnLigKTgxpWzOHW8nswg0h+6VPkcC
   S+ohN7Jo9Z7bY+bcE8xkixZRm2/a1uGBG3gou0YqOpKu34u1+VZK72/GU
   RNAwi8PvzdLwjxyc6dONERd4bhHcaGhz+HetluGuOYyjMER3p3zjb1q1i
   Q==;
X-CSE-ConnectionGUID: 9SdjeWBgR7+1MyKtc3BwoQ==
X-CSE-MsgGUID: CAAIGakgROqq9ovY+7S70Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49236389"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="49236389"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:36:26 -0700
X-CSE-ConnectionGUID: N4XJBtfHTBiLLIPpW+WAew==
X-CSE-MsgGUID: kkWSOnguR2mwCS1TrTVv+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146318398"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2025 23:36:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIiUZ-000QzM-1P;
	Sat, 24 May 2025 06:36:23 +0000
Date: Sat, 24 May 2025 14:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 9/29] Diff in drivers/gpu/nova-core/gsp.rs at
 line 340:
Message-ID: <202505241445.sEyT1Ps8-lkp@intel.com>
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
commit: 5e6597f89152e63e93ea3108f12977ce800ab5bf [9/29] nova-core: gsp: Pass data structures we need to cmdq
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250524/202505241445.sEyT1Ps8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241445.sEyT1Ps8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241445.sEyT1Ps8-lkp@intel.com/

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
    
>> Diff in drivers/gpu/nova-core/gsp.rs at line 340:
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
   Diff in drivers/gpu/nova-core/gpu.rs at line 329:
            dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
    
            let wpr_meta = gsp::build_wpr_meta(pdev.as_ref(), &fw, &fb_layout)?;
   -        let mut libos = crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
   +        let mut libos =
   +            crate::gsp::GspSharedMemObjects::new(pdev, &bar, &gsp_falcon, &sec2_falcon, &fw)?;
            let libos_handle = libos.libos.dma_handle();
            let wpr_handle = wpr_meta.dma_handle();
    
>> Diff in drivers/gpu/nova-core/gsp.rs at line 340:
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
