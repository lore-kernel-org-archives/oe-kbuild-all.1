Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDF7081E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 03:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783395911; cv=none; b=bZRxnTX1ISWvg1DPGI4ueY1HEs1fTQUC/oIy5+6TWlIuiTbqIuOaCdgm+uxnOgTz3jYPjTDQqvnaUAEMW3xoWxZeA8sPI2CoFi4cS4ZxdPCLP/tAIN9GJA5TplQtO4dn+Xs5LbGAERP98lnbXreLyrofU2UC8VJw+9knWv7E/so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783395911; c=relaxed/simple;
	bh=qSjOCLZtQjW3ySyjPlYSJLazPvAWo1iRwHu9jV5VxXM=;
	h=Date:From:Cc:Subject:Message-ID; b=Tc37IktapaK8kljFDEfKbYDxfDuT4kF10kStOtnwE/aSGh0AhJknMqhXl44SBZTFh/fgE60rmI2ycp8hOEuxGtGM2qPGCGe8OXaKFQuGNKaa+MzAwzy2NeZHsbdHYvJewGg3lZzvZcssrnmWkMWoUcATCz9+u3KQ7Oy/sVP/fHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLIqSvDC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLIqSvDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783395909; x=1814931909;
  h=date:from:cc:subject:message-id;
  bh=qSjOCLZtQjW3ySyjPlYSJLazPvAWo1iRwHu9jV5VxXM=;
  b=CLIqSvDCgrEhyjJWaqsrOK5hjD3hCHgFcmVCDTRe+ryoP/2kgIJm1WXz
   Wdjz9qev4ffkukU4rZGyd8KVkEaWg+r70QY5e7RYiY2CAF00vDEYMaBN9
   sCwfvyBz+TuQLNZSSIlZTGnGheciwkmHs8AEcIW01pLpDUG6k62fKh/sl
   x361GnR4uRHsNWCG3qRbuj2SFgaNji35/unu0kqEsTSEFZUdyb6++KDx4
   f/CjXMVbmu0U81Kp2ITnJiHWooKdZH4KQKUhV3/csCXifPNXBeOHfAKsT
   mbdAu2Vq1an/aSf/swPuukcdap0SZcVt6XqCTCyFjDs0wFGgCaXYrhI+o
   w==;
X-CSE-ConnectionGUID: dAD4P7FERSGS36EcOwp0jA==
X-CSE-MsgGUID: KPHWZ0kYT/eE18bzMMHbjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="71557859"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="71557859"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 20:45:08 -0700
X-CSE-ConnectionGUID: hUA5HeHdSR6/vAmxM5j7JA==
X-CSE-MsgGUID: k17BHci6Tlmsqsa4Mgt7mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="255811431"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2026 20:45:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgwk4-00000000F1D-3ORQ;
	Tue, 07 Jul 2026 03:45:04 +0000
Date: Tue, 07 Jul 2026 11:44:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1] error[E0432]: unresolved imports
 `core::sync::atomic::AtomicI64`, `core::sync::atomic::AtomicU64`
Message-ID: <202607071113.GHdTtHVz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   5100e1c74efeba843945492f8d5840e6166c0392
commit: f843be76420412fd987d9ec945fbd46a72fe095b [1/1] rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
config: um-randconfig-001 (https://download.01.org/0day-ci/archive/20260707/202607071113.GHdTtHVz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071113.GHdTtHVz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607071113.GHdTtHVz-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
   641 | static int dts_version = 1;
   |            ^
   1 warning generated.
   scripts/mod/modpost.c:59:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
   59 | static bool extra_warn;
   |             ^
   1 warning generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:29:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   In file included from rust/helpers/helpers.c:16:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1 warning generated.
>> error[E0432]: unresolved imports `core::sync::atomic::AtomicI64`, `core::sync::atomic::AtomicU64`
   --> rust/kernel/debugfs/traits.rs:12:27
   |
   12 |     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
   |                           ^^^^^^^^^ no `AtomicI64` in `sync::atomic`              ^^^^^^^^^ no `AtomicU64` in `sync::atomic`
   |
   help: a similar name exists in the module
   |
   12 -     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
   12 +     AtomicI16, AtomicI32, AtomicI32, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
   |
   help: a similar name exists in the module
   |
   12 -     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
   12 +     AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU32,
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
