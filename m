Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684D3168F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694721; cv=none; b=bfcMCCwCJxz6xl7LoUqYbXz0mU95yUtuHz+/2+49Pi0T8iEqNuzZ2HMGgg6Li+Dq1b/MY0NqzUSCl0pmqIc2YKxmXn71ru5JGGb0Q1P65gZQ9/6Q4JluWXSaoRwtxEY1j+MQhK+KYWCTGqkIuJ7Z8YIaZzfdivcE1hBowTe5hBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694721; c=relaxed/simple;
	bh=fVc0lKnIgfekV8Dts28Vfdc0a4UayxeToYplVwyUmIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o0tGWSEdDrAPPhmtKMVhrZg1ZTvSji1h/J47DMzy7sG1WRlh0e5pQu04S3IdQWYoLfWMFcfz4EoQPsmQTnj5NIDLdBUVpqzTGiLHucvstEvOgZBkDRuz8jFVaBi7WTFvM5CxmKKtZmaXH5LH67MtGd1NY5lv6cZBo4LMQOU++nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyZYSryf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyZYSryf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769694719; x=1801230719;
  h=date:from:to:cc:subject:message-id;
  bh=fVc0lKnIgfekV8Dts28Vfdc0a4UayxeToYplVwyUmIM=;
  b=nyZYSryfZ/ifgkRoe+lzXLL7+ZmKlqjSsPjjO5OeQJV6o3bVHLFmtb/p
   4/CTGFPe7guWrkCaGK2Gp+XJvaxcC5KE6kTIToRF2w28QQcK4HpUO6VDH
   fRjk834NlFaWqMKONXDiTFCkR3OOmWE28ALrtoPiEJO731s6eMjZBEM9c
   lXygY0MFOTKZ+9zCzTBcaDdeVW9TrQc5ZdbhfxYhtqyodj7ulkv4GUPEb
   3Xaai9ATZ74Z8ogv0qVJDeydNPnn+9pvlknhJxfbxjzV5NlIniPZGnXoL
   Yp/AW754ybdruwHL2PWwGevZW2m3E5kP17xcW8ZYs8EO9Pk84NppeXQht
   A==;
X-CSE-ConnectionGUID: UsKcwUPkRzqAyLe3cjxUTQ==
X-CSE-MsgGUID: kUaond65TruZCpx2ch5Tgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71020571"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="71020571"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 05:51:58 -0800
X-CSE-ConnectionGUID: 97vDGNoWTceyIt1rQplWYA==
X-CSE-MsgGUID: MEZcyJYTTW61W51JIX/6ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208945008"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jan 2026 05:51:57 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlSR9-000000002Ib-0v2U;
	Thu, 29 Jan 2026 13:51:55 +0000
Date: Thu, 29 Jan 2026 14:51:31 +0100
From: kernel test robot <lkp@intel.com>
To: HeeSu Kim <heesu0025.kim@lge.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in drivers/android/binder/process.rs:31:
Message-ID: <202601291402.BesVTWrI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/jongan-kim-lge-com/rust-pid-add-Pid-abstraction-and-init_pid_ns-helper/20260129-174126
head:   2514d7defdeea272dd7269075fd15c145269a709
commit: 2514d7defdeea272dd7269075fd15c145269a709 rust_binder: handle PID namespace conversion for freeze operation
date:   4 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260129/202601291402.BesVTWrI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291402.BesVTWrI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291402.BesVTWrI-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/android/binder/process.rs:31:
        sync::poll::PollTable,
        sync::{
            lock::{spinlock::SpinLockBackend, Guard},
   -        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, rcu, SpinLock, UniqueArc,
   +        rcu, Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
        },
        task::Task,
        types::ARef,
>> Diff in drivers/android/binder/process.rs:31:
        sync::poll::PollTable,
        sync::{
            lock::{spinlock::SpinLockBackend, Guard},
   -        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, rcu, SpinLock, UniqueArc,
   +        rcu, Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
        },
        task::Task,
        types::ARef,
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
