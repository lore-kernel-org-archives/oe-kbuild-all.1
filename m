Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDBC2EB5A1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772692906; cv=none; b=lNFdCgCzE23XK4wwRL2cN70Yh899VSy6n25aVo5COxx3RGRzTdnHnjPRIGBNqbRbTV5ibdOpIKFcS7qb9hW16YD9st02oKJy4u9IOvdQvwyNjKIfCC9xPxdil/VbQs7WgTF1doyU5lsdjHCzcNEeZWEH7KN7vki9TZEIXI+gmI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772692906; c=relaxed/simple;
	bh=gxld/Ie8WV1tUQcsInRDc4BUdNKfLT0ZV6+FSjZRQRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hax+7awAaA8Ga3hI/cGhPZsa6FFCTYZ9Eqh7xgH3VlIYFXJqDKpw9CwWY1NiC3K0dyGmBsEjCr+6PdDqlg4oVfA+bznL8t4410VURSuvimngLCdgZ7sv2+9/Cm6SIlaDudJPsEf8nBLb09gg0uFseOxKPPl0tWmM7g0NYI5wF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vo9LNrrv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vo9LNrrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772692905; x=1804228905;
  h=date:from:to:cc:subject:message-id;
  bh=gxld/Ie8WV1tUQcsInRDc4BUdNKfLT0ZV6+FSjZRQRk=;
  b=Vo9LNrrvH4GjlQwRAkb3qqmtQMTiZQB2tNy+ZQPliA4K6MRV+lv24WXh
   PPOPCkivHsTnFZX9Yp207BCr1OKZP0tlDcGDsRD/AqhhAXi9yWTjv89NH
   nNiijN+a0/wKb4mC28PGjDWQE80C++42+L0gx0W6h8A1uWDcsvf2kIsDx
   K0tPLO4zvT79AGzqib6zKiGGWlu3w9ttURlJPvj+961j5Lu6/5MJUGS8x
   1oueSZ5fbDAbGfXKkl4Yv6t82EwEcBK7RONJfiE30pDdNKwc2sE1dsgtF
   4IzVE6JfT4rIn0PiSiAde8OMTPoShxs05vYDJAdOQEqa8b/X1qZ0R9WMm
   g==;
X-CSE-ConnectionGUID: RkbvveQqStSWXmgwkZKLzQ==
X-CSE-MsgGUID: eJHvCUPLQheQNcJIFc9g0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73839387"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73839387"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 22:41:44 -0800
X-CSE-ConnectionGUID: 60nYed1oQ+uLmGS/VlTs9w==
X-CSE-MsgGUID: vrQxJhsBQjWOd5UGallwqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="217735780"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2026 22:41:43 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy2Ox-000000001xt-23dK;
	Thu, 05 Mar 2026 06:41:39 +0000
Date: Thu, 05 Mar 2026 07:40:42 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 6/24] Diff in
 drivers/gpu/nova-core/gsp/commands.rs:203:
Message-ID: <202603050738.8i1eyHKN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   1332f2111dd980926c1437960a555ac5e2049edc
commit: ef5546cf257750b57ce8afc2985562956fe7217c [6/24] gpu: nova-core: gsp: Extract usable FB region from GSP
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260305/202603050738.8i1eyHKN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050738.8i1eyHKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050738.8i1eyHKN-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/gsp/commands.rs:203:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            Ok(GetGspStaticInfoReply {
                gpu_name: msg.gpu_name_str(),
   Diff in drivers/gpu/nova-core/gsp/commands.rs:236:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
>> Diff in drivers/gpu/nova-core/gsp/commands.rs:203:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            Ok(GetGspStaticInfoReply {
                gpu_name: msg.gpu_name_str(),
   Diff in drivers/gpu/nova-core/gsp/commands.rs:236:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
>> Diff in drivers/gpu/nova-core/gsp/commands.rs:203:
            msg: &Self::Message,
            _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
        ) -> Result<Self, Self::InitError> {
   -        let (base, size) = msg
   -            .first_usable_fb_region()
   -            .ok_or(ENODEV)?;
   +        let (base, size) = msg.first_usable_fb_region().ok_or(ENODEV)?;
    
            Ok(GetGspStaticInfoReply {
                gpu_name: msg.gpu_name_str(),
   Diff in drivers/gpu/nova-core/gsp/commands.rs:236:
                .to_str()
                .map_err(GpuNameError::InvalidUtf8)
        }
   -
    }
    
    /// Send the [`GetGspInfo`] command and awaits for its reply.
   Diff in rust/kernel/gpu/buddy.rs:305:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
   Diff in rust/kernel/gpu/buddy.rs:305:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
   Diff in rust/kernel/gpu/buddy.rs:305:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1912: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
