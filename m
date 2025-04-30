Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F511D61AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 05:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990709; cv=none; b=gdk/loZbWhtpEILWdpIKfylb2Ra2GmjRexTJxBk7Cve7Mh9E6fqUCKDVLuehelXNuwfpwc0Q2ZsPZGH4f9a/MLNGH03dxp4P5PvWHqGo1mPVDc+Z/oWziWLGiGe52vNHsfdI5E/lzNH81q7v5HhcC3s0VfGjQNT7a5nFs8+APv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990709; c=relaxed/simple;
	bh=Uvc9RpafogA/JqFCAM+QSwlrdFilfmktBoJdQKYTOwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkPVUP843C7AAIOHkPwJbeoii5sZIrypU5a4WT/ddlokexCyZk1mz/ZyuJMmIw8nv7Jn/mGdOu2qgoTlyZOkUURi7eoPUB6++C9syYBi+vgm/9DfNF2On3SOQcTQ1BtNChj1msLtzPNEVVMknJbowVUZlefnoQQCxzgyHNjBwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLXGteAX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLXGteAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745990707; x=1777526707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uvc9RpafogA/JqFCAM+QSwlrdFilfmktBoJdQKYTOwQ=;
  b=JLXGteAXmngPd1BXn/5nuMQs7LrUf6U/aJaS6pEWVBU3dVuV9VNjOFZE
   twF/aWkTznDUJh+Q1Yw8LkKuT2d6PvwHPlRmkfQcFAjh03C4lWvKp0cc4
   bP+9jI7YSoI5vvNx7WNLzpyZhT3rhqJl9OaXUs4EBFumDJlJrfMtHKxau
   g5O/m+DJhdWwYkLn4uRhWGmwkdv5oDOQChOvpM/UycJWcOWg+7D8HFqqa
   OBZ9u5kt0OB6flxRKn2+t850LYCGQ+Bz+KM1GK7YEL0JZptecFRXa1gRv
   YzDse9kj99qogm3QwFpzFPHjr6HciHZpYPqdKUPAQia2uZCBTzT2f/ZOB
   w==;
X-CSE-ConnectionGUID: jl69fn9iQraH7wBVFqr+VQ==
X-CSE-MsgGUID: wB4T0PeMSe6LfBi4c2I3hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50293929"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="50293929"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:25:06 -0700
X-CSE-ConnectionGUID: +VgXy0BZSE2oyKDCZZ7Wfg==
X-CSE-MsgGUID: 8+0cGS84RjCsARvCpypUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134542611"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2025 22:25:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9zwM-0003BN-2T;
	Wed, 30 Apr 2025 05:25:02 +0000
Date: Wed, 30 Apr 2025 13:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-docs 6/9] Diff in
 drivers/gpu/nova-core/firmware/fwsec.rs at line 178:
Message-ID: <202504301346.GD0zClWZ-lkp@intel.com>
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
commit: af511c6c5ba55c2835ec2480b7761eed4ed849c6 [6/9] gpu: nova-core: Clarify fields in FalconAppifHdrV1
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250430/202504301346.GD0zClWZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301346.GD0zClWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301346.GD0zClWZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/firmware/fwsec.rs at line 178:
    
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
>> Diff in drivers/gpu/nova-core/firmware/fwsec.rs at line 178:
    
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
>> Diff in drivers/gpu/nova-core/firmware/fwsec.rs at line 178:
    
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
