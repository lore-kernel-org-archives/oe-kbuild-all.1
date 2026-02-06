Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113B1990A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 02:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770343475; cv=none; b=FCDbVY9CIvAy9ki8ijQmHfwpCabXDxtfX/1ta0mP/qDZffIvl+V4LpZpqbnB/V/U+caTuNlFkRI1SCVYe77TVrWVTKqSrU9YYPHXm/oVh8wfWr6rl7HcgeMnEs+SZgf/+Lo3NuymfRY1WmT5mWyMtRRI8DRmtjkiF9p9TGpiCa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770343475; c=relaxed/simple;
	bh=LJex7jW0PupUXOU6wCj0HdfjCSawE1KuOK+9+Ha1et0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kocAQutMQo78PmJlNkilHxh8bUbq0THUpk5GVk8pDphDKnzz+iQm64sMBsFdvDBOR86hI2Iuk3kdvC49pxNY2c8C7pRBKjeEfIZLRtWSBgX3uDtTNvw8635neVRISpEQEE/Snx0tkriHGqTu4zvzsQxY+//ePdpeX/8NdCQNP48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRic+D9D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRic+D9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770343474; x=1801879474;
  h=date:from:to:cc:subject:message-id;
  bh=LJex7jW0PupUXOU6wCj0HdfjCSawE1KuOK+9+Ha1et0=;
  b=QRic+D9DFHooQ1uR75OmE3+f6apw8L60mEG/E/HP+2EdI4KtmocOcbtE
   iu1vq9ZSwGRv3FBoa1Dv1bTT4Dk1iv/yHbmFmTSf3ub1qSlgj9mNVnmVr
   TkR31bYv+9duMLIRYgMxr7ZE7FXTCdsr8D5h/xVI8cb3x6mFjd/0hSrYK
   k7T7NoKIXCZ20GgOhpUJsHQrk9S+v/GPmyPxN0YG7M3HAoE9X/1jg0rLl
   sn6972uEtANVg8eOFV+OsAv7uKqY77IJxYxqWYRSJVF8pugO8MQtZ2u5x
   S1YEpzoLr3jyE0h7l93ADqSi9NssNXpVUROcXg8hXYcjMoAUjT9S/U3T7
   w==;
X-CSE-ConnectionGUID: s3ovDc7XSrqLFC/RsDP+VA==
X-CSE-MsgGUID: 8tvJazQRSFCt4EKBp2fnHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="88975834"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="88975834"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:04:34 -0800
X-CSE-ConnectionGUID: 3YPF4UTQTkCinWDiRZSLUw==
X-CSE-MsgGUID: 8qZKxawuR5Cf+EJVm1s/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210662588"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2026 18:04:32 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voBCw-000000004Ix-0gNE;
	Fri, 06 Feb 2026 02:04:30 +0000
Date: Fri, 06 Feb 2026 03:04:08 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 7/31] Diff in rust/kernel/gpu/buddy.rs:329:
Message-ID: <202602060339.zsFWzcet-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   89000e5819b4e3755de52118eb0e826431f3625f
commit: 9d34b48cab490454694aea8c7f40d52f8f4d3ab0 [7/31] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260206/202602060339.zsFWzcet-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060339.zsFWzcet-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060339.zsFWzcet-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/gpu/buddy.rs:329:
        /// Creates a buddy allocator that manages a contiguous address space of the given
        /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
        pub fn new(params: &GpuBuddyParams) -> Result<Self> {
   -        Ok(Self(Arc::pin_init(
   -            GpuBuddyInner::new(params),
   -            GFP_KERNEL,
   -        )?))
   +        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
        }
    
        /// Get the base offset for allocations.
>> Diff in rust/kernel/gpu/buddy.rs:329:
        /// Creates a buddy allocator that manages a contiguous address space of the given
        /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
        pub fn new(params: &GpuBuddyParams) -> Result<Self> {
   -        Ok(Self(Arc::pin_init(
   -            GpuBuddyInner::new(params),
   -            GFP_KERNEL,
   -        )?))
   +        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
        }
    
        /// Get the base offset for allocations.
>> Diff in rust/kernel/gpu/buddy.rs:329:
        /// Creates a buddy allocator that manages a contiguous address space of the given
        /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
        pub fn new(params: &GpuBuddyParams) -> Result<Self> {
   -        Ok(Self(Arc::pin_init(
   -            GpuBuddyInner::new(params),
   -            GFP_KERNEL,
   -        )?))
   +        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
        }
    
        /// Get the base offset for allocations.
   make[2]: *** [Makefile:1871: rustfmt] Error 123
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
