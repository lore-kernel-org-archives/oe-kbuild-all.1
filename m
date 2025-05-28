Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADBD7FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 00:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748392551; cv=none; b=EvQ1PpVPI0Vy2u80VSzNX9SRm69SAsIwB78CFED5H09KKMPUoj7wNtUIAbMlqMet+ETpfygU3xopzLZpslMiNMlvlnsHd4xBMZku6AfoJTtX40AWWN5QJFQ2rRoOFQo1U7QNhmvv31Oquzalb/RvCMGlsy+anLG0s9PVMiBCnMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748392551; c=relaxed/simple;
	bh=U5KOXbTTsfMlTjiNbNor6HBIl3q0hjFdLLlwK63Gk0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jge63hKQEg+acT1UBvFDE1BsyYpFlNFuXXVojkk6IhIHsV4kHJFh/mAeQQK5sj5OPYMKFL9dO4iUc7bEAtVkFJr1q92wo+Wzfe+Xl8D0qICT2qjOmXSGsveaksJRbt9cS72k48cC4uCbmUfdDeBDsGFXLajbCOaSjbnAMspnz9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjszEKXK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjszEKXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748392549; x=1779928549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5KOXbTTsfMlTjiNbNor6HBIl3q0hjFdLLlwK63Gk0k=;
  b=QjszEKXK7VwV90+R1XhbTOsGLGkJWTV4tVKRt8w04bfmOAQ83tcyMY+I
   kWDUIa2bmVTUkn9tHJ0sDf/O9hJtIycl7aswHRN0/wfxJ8cpZqVtMUrQm
   7Hmqxg5SndU8lmwa7XkOfpByD0BUIym2vuQS3QfTnzdpSGpiSNXlVE8H5
   AJ3xZwAbFcrUJtIKuk72oUxxE3skhv4yNni7J/Ic65mmug6KxVuCbcGcq
   /4GeNYlDh1teDdzE/QsCugXk6hZZuQsRbuTkpKMThkAg0zB/NJW0IfZ4o
   7wEnb7NVAYQfYaGzL/4HjaQM2rKfbmYs7OwoInQRTiDl+PmfkGPQ7OItN
   g==;
X-CSE-ConnectionGUID: tAN8UYTUQjW4WClFjXOlHA==
X-CSE-MsgGUID: wv6zQlx5St+UePUqU0cL4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60655514"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="60655514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 17:35:49 -0700
X-CSE-ConnectionGUID: 1x+d4n+eRH2stSw5wMe15g==
X-CSE-MsgGUID: KHD0fpdHQf2x1rwW8rrapg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142958145"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 May 2025 17:35:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK4ll-000V7c-37;
	Wed, 28 May 2025 00:35:45 +0000
Date: Wed, 28 May 2025 08:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/sequencer 34/46] Diff in drivers/gpu/nova-core/gpu.rs at
 line 329:
Message-ID: <202505280858.h5ue8jB4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   b48f53d28bffb259ca376c30ab62b72e69bd0234
commit: e6066bb619788776e76a1d79497925d909d33a57 [34/46] nova-core: gsp: Pass data structures we need to cmdq
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250528/202505280858.h5ue8jB4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280858.h5ue8jB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280858.h5ue8jB4-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/gpu.rs at line 329:
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
>> Diff in drivers/gpu/nova-core/gpu.rs at line 329:
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
