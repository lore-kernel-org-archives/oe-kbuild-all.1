Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA171E8338
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994498; cv=none; b=HCKjqu7LN95w5ckBHm8pglk6aPvBTOSFXeiiMH+HBjxIDWPBukL3DW0TtDKUdHly1KcKFUXrJw7jWESyUjqQCXcqEHqnYDU3or02tKRQqbXmAIeqF70oSDQyGoyIujVy6I9Xwsz1a47cQpjYINsfwd5yr+CWmd3wtvAj4I9cstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994498; c=relaxed/simple;
	bh=gsryb9Xcf1cN/1v0f7kJC3Ua+rnhIxUMs7cexvjXJfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bvi7SSxo65hpWzkiMqbeLIKma7AsiP5/VOWFEfC1fmyGdfOVEFUQH3I9gaLFnb1tu3n/MurRnel2c4cC27qXEt1CsVSG38yGvu+/ol50EkCUqQQ0y7gf9h1BFmO6oAF8KEgnfzUggkbvMrmukZpxTHFbFu8MifExD8q8XBiTy40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqXPnHYH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqXPnHYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745994496; x=1777530496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gsryb9Xcf1cN/1v0f7kJC3Ua+rnhIxUMs7cexvjXJfY=;
  b=gqXPnHYHf0oHp0LxLHbfrtJe295W7jmlQ45Wb6NWsq8bZhPZgDI8loiX
   02Jydt6qh96DMDG+JAZ/HLbihRncVKDuihmbTRkVciEac9DLZ2znQ+Gvg
   KNGxBLIZaV/mf6kmURco2FvlIbtkbRKMOyYZ+xty+1fUUMLkN6fxoBvRR
   jDLGOBQkc0w3IvAv2EHjcqabk3w7/D+WhEsGEE14S8DV2dYaDW9CENLoU
   Krep/OYdBKQNDvkXP+d/8nkXz8nM5yunS4jP17IeYDr6lO39hYqDHFUo7
   Vs59oBAel1eSV0glKxZz40WS3UzuaA1Ayw3gTdsORxr2QxhPZdUqGzkgb
   w==;
X-CSE-ConnectionGUID: f4Yn5c2pSPSoQehL41Dzzg==
X-CSE-MsgGUID: RRzVcuV0SpiAqG0dLxvvyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="35251925"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="35251925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 23:28:15 -0700
X-CSE-ConnectionGUID: g8wwvlWXQ6a+KdUy8TPAzg==
X-CSE-MsgGUID: G/3/TEZPQ8WBGO8vTvb96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138847424"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2025 23:28:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA0vT-0003Eb-1H;
	Wed, 30 Apr 2025 06:28:11 +0000
Date: Wed, 30 Apr 2025 14:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-docs 9/9] Diff in drivers/gpu/nova-core/falcon.rs at
 line 59:
Message-ID: <202504301422.XpsafDbc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-docs
head:   48dda9ccdc08f9f27ec3a67498db90594d3c4789
commit: 48dda9ccdc08f9f27ec3a67498db90594d3c4789 [9/9] gpu: nova-core: Clarify falcon code
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250430/202504301422.XpsafDbc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301422.XpsafDbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301422.XpsafDbc-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/firmware/fwsec.rs at line 178:
    
        // Find the DMEM mapper section in the firmware.
        for i in 0..hdr.entry_count as usize {
   -        let app: &FalconAppifV1 =
   -            unsafe { transmute(fw, hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize) }?;
   +        let app: &FalconAppifV1 = unsafe {
   +            transmute(
   +                fw,
   +                hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize,
   +            )
   +        }?;
    
            if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                continue;
>> Diff in drivers/gpu/nova-core/falcon.rs at line 59:
    /// See falcon.rst for more details.
    pub(crate) enum FalconSecurityModel {
        #[default]
   -    None = 0,  // Non Secured (NS or PL0)
   +    None = 0, // Non Secured (NS or PL0)
        Light = 2, // Light Secured (LS or PL2)
        Heavy = 3, // Heavy Secured (HS or PL3)
    }
   Diff in drivers/gpu/nova-core/falcon.rs at line 150:
        Dmem, // Data memory
    }
    
   -
    /// FBIF (Framebuffer Interface) aperture type. Used to determine
    /// the memory type of the external memory access for a DMA memory
    /// transfer (by the Falcon's FramebufferDMA (FBDMA) engine located
   Diff in drivers/gpu/nova-core/falcon.rs at line 158:
    #[derive(Debug, Clone, Default)]
    pub(crate) enum FalconFbifTarget {
        #[default]
   -    LocalFb = 0,           // Local Framebuffer (GPU's memory)
   +    LocalFb = 0, // Local Framebuffer (GPU's memory)
        CoherentSysmem = 1,    // Coherent System Memory (DRAM)
        NoncoherentSysmem = 2, // Non-coherent System Memory (DRAM)
    }
   Diff in drivers/gpu/nova-core/firmware/fwsec.rs at line 178:
    
        // Find the DMEM mapper section in the firmware.
        for i in 0..hdr.entry_count as usize {
   -        let app: &FalconAppifV1 =
   -            unsafe { transmute(fw, hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize) }?;
   +        let app: &FalconAppifV1 = unsafe {
   +            transmute(
   +                fw,
   +                hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize,
   +            )
   +        }?;
    
            if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                continue;
>> Diff in drivers/gpu/nova-core/falcon.rs at line 59:
    /// See falcon.rst for more details.
    pub(crate) enum FalconSecurityModel {
        #[default]
   -    None = 0,  // Non Secured (NS or PL0)
   +    None = 0, // Non Secured (NS or PL0)
        Light = 2, // Light Secured (LS or PL2)
        Heavy = 3, // Heavy Secured (HS or PL3)
    }
   Diff in drivers/gpu/nova-core/falcon.rs at line 150:
        Dmem, // Data memory
    }
    
   -
    /// FBIF (Framebuffer Interface) aperture type. Used to determine
    /// the memory type of the external memory access for a DMA memory
    /// transfer (by the Falcon's FramebufferDMA (FBDMA) engine located
   Diff in drivers/gpu/nova-core/falcon.rs at line 158:
    #[derive(Debug, Clone, Default)]
    pub(crate) enum FalconFbifTarget {
        #[default]
   -    LocalFb = 0,           // Local Framebuffer (GPU's memory)
   +    LocalFb = 0, // Local Framebuffer (GPU's memory)
        CoherentSysmem = 1,    // Coherent System Memory (DRAM)
        NoncoherentSysmem = 2, // Non-coherent System Memory (DRAM)
    }
   Diff in drivers/gpu/nova-core/firmware/fwsec.rs at line 178:
    
        // Find the DMEM mapper section in the firmware.
        for i in 0..hdr.entry_count as usize {
   -        let app: &FalconAppifV1 =
   -            unsafe { transmute(fw, hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize) }?;
   +        let app: &FalconAppifV1 = unsafe {
   +            transmute(
   +                fw,
   +                hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize,
   +            )
   +        }?;
    
            if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                continue;
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1828: rustfmt] Error 123
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
