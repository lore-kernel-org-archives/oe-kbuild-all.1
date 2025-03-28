Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5B14375D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152001; cv=none; b=tDzizuO52IeUMdTx3qMIl+En5YU0R2f60Gwm4jXTfYnxhZTf9m2ULARC68/QcVjdUVNb6QODjGWqzXEqKiDHyEzJ7tbSnQGhHNgqn9mbuT/2sZczxdZn58aqNL6DLFdZuYtq8QFLCfYyGSZI1qXhqoU3OR0/OrmxaSlNAFcxuMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152001; c=relaxed/simple;
	bh=EniF395fCHbpk0CzouBsudBE2lP7sqqzOvYFGIZ0S5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BTBVODdHFjaLfxvhbpupDu3X7roNtul3uwe2fb6cEL/xDtSXhFjxK43Jve5tkfV0L8uYoDKJi6gsVEJottOzPmtwng6lFsLIfEW+yGnyhyDbUMgWSOgs6muxl66s6zWyA3wnKKv+WMfURLYCEueL+L1kNkRffyDtEcAks8bMFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMoROvwj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMoROvwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743152000; x=1774688000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EniF395fCHbpk0CzouBsudBE2lP7sqqzOvYFGIZ0S5g=;
  b=YMoROvwjI5qWFUX8Gwrj8JLaLFd/JmG15833mO//mL984gNxcnC3eB+h
   u25oGMmIQ/Bmfnh7F4tqsW+hd6Eap+gNAMr6oVsWjFQ6vAKsNiLcJ129R
   m6D92rI4PNZgbfR3/cyfyDs2/j++nRyAxZhN0leron+2dUJcnu9Rkz3jQ
   WEu0M4ZPsbTHGRf6xEwTw6VKXZADmMDKaW9cCC/n6m7ywheAmFZmccutx
   h3CtmLuufncx2XN11/zT5oTpZ3UnOHxZJmDEEpA+TMV7f/fmU8WKQZImR
   BudoUlTStD2NM6K6ynqF5KsoPOKTbjBBrGkLdGt7kEgNW7JwA0G6Kb/jA
   w==;
X-CSE-ConnectionGUID: 0PSRJl4RSXGS6eevv7x96w==
X-CSE-MsgGUID: mzjBQxAcQNCI0dNx9xhYtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66980607"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="66980607"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 01:53:19 -0700
X-CSE-ConnectionGUID: UEQqIG28T2m4DY9IZjx0jg==
X-CSE-MsgGUID: 97KM/IMpRECtUkSgebx0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="162631241"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2025 01:53:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty5Sa-0007Gg-2T;
	Fri, 28 Mar 2025 08:53:08 +0000
Date: Fri, 28 Mar 2025 16:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Zetao <lizetao1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1528/1528]
 include/asm-generic/io.h:742:19: warning: 'reg' may be used uninitialized in
 this function
Message-ID: <202503281620.pNXaYE13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4d1e247486ffeef035a5a55a97f2659f68177357
commit: e44716ed4262a467260fccb7814e4c89588f438d [1528/1528] arm64: asm-bug: Add .align 2 to the end of __BUG_ENTRY
config: arm64-randconfig-003-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281620.pNXaYE13-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503281620.pNXaYE13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281620.pNXaYE13-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c: In function 'nv40_fifo_dma_engine_init':
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c:111:37: warning: 'ctx' may be used uninitialized in this function [-Wmaybe-uninitialized]
     111 |  nvkm_wo32(imem->ramfc, chan->ramfc + ctx, inst);
         |                                     ^
   In file included from arch/arm64/include/asm/io.h:213,
                    from include/linux/io.h:25,
                    from include/linux/pci.h:34,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5,
                    from drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv04.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c:24:
>> include/asm-generic/io.h:742:19: warning: 'reg' may be used uninitialized in this function [-Wmaybe-uninitialized]
     742 | #define iowrite32 iowrite32
         |                   ^~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c:97:12: note: 'reg' was declared here
      97 |  u32 inst, reg, ctx;
         |            ^~~
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c: In function 'nv40_fifo_dma_engine_fini':
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c:80:37: warning: 'ctx' may be used uninitialized in this function [-Wmaybe-uninitialized]
      80 |  nvkm_wo32(imem->ramfc, chan->ramfc + ctx, 0x00000000);
         |                                     ^
   In file included from arch/arm64/include/asm/io.h:213,
                    from include/linux/io.h:25,
                    from include/linux/pci.h:34,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/engine.h:5,
                    from drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/channv04.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c:24:
>> include/asm-generic/io.h:742:19: warning: 'reg' may be used uninitialized in this function [-Wmaybe-uninitialized]
     742 | #define iowrite32 iowrite32
         |                   ^~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/fifo/dmanv40.c:67:6: note: 'reg' was declared here
      67 |  u32 reg, ctx;
         |      ^~~


vim +/reg +742 include/asm-generic/io.h

9216efafc52ff9 Thierry Reding 2014-10-01  740  
9216efafc52ff9 Thierry Reding 2014-10-01  741  #ifndef iowrite32
9216efafc52ff9 Thierry Reding 2014-10-01 @742  #define iowrite32 iowrite32
9216efafc52ff9 Thierry Reding 2014-10-01  743  static inline void iowrite32(u32 value, volatile void __iomem *addr)
9216efafc52ff9 Thierry Reding 2014-10-01  744  {
9216efafc52ff9 Thierry Reding 2014-10-01  745  	writel(value, addr);
9216efafc52ff9 Thierry Reding 2014-10-01  746  }
9216efafc52ff9 Thierry Reding 2014-10-01  747  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  748  

:::::: The code at line 742 was first introduced by commit
:::::: 9216efafc52ff99e9351ef60de5fcafc2bc8adb6 asm-generic/io.h: Reconcile I/O accessor overrides

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
