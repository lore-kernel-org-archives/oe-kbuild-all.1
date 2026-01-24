Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD017A2FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769220233; cv=none; b=kX4kO//gXmnX1zx0RH/AoDTrw5S/mBg5MJSmw16caXl6leR9TWT8i37noU/aAeBC43XeadE7Q6Vs0h1EcE9U4L1gtAYoVBU1k88JO1xFKkqrT12LLcr7HrtHxOq50myD7gC+XGpQOVGzobS9kLwaUmfOKbSegQp/ovw8/jhdTI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769220233; c=relaxed/simple;
	bh=P2A3XC1qmApx1cbptINt8Aj81OJzg/txQjOBWJn8PZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NiP4o+MJMnK+lrH3AqasZRKHLourHo9LRgrWaO78Fp+UyorepvkIxo/yVCcdKmvYp826IWHIrxeIKmZa+8AKBC8NOda9mOoCE24XGEcWe4B/0AS1C9H9ZDZU/u/mHVYamtU/7DS2c4FZihmn1FAPlDR7Z2QOybIIL6Chb7wyWz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0XGYRWo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0XGYRWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769220232; x=1800756232;
  h=date:from:to:cc:subject:message-id;
  bh=P2A3XC1qmApx1cbptINt8Aj81OJzg/txQjOBWJn8PZE=;
  b=I0XGYRWoQDx0Jdf/bSceOeY9w7j4z/w4OKQN89tSmttGKcc1KTXRZsQl
   smuUgX+pje0l42CP9dSBiQPPxqR9HzvhF8uaQT3zeeI1aPZlBa3KAuPsQ
   LVkFYBi5ahOVjECrojlnrtc1FEP8FDBkwKytNlylryAMhezMU3mDeLzd6
   9hCempTqIh7Yj/BKZ4q4zEGHaPZEM51F6FSSyxxAHUU5PqtociHOyULHH
   SWDrN9yRWShoSL0mix2SVIE20yrvEtSsju4E+z/UIr4KOyrkz+PJZl7+X
   mN7twB6W9QXpaLurLU5Bx0KHGYZaTYOy4T6HMGGKqs402/OJ0wFRDA1gx
   Q==;
X-CSE-ConnectionGUID: Qycj5ZO0R2iExKZ9eHCY/g==
X-CSE-MsgGUID: uz8BqplDT4C5X18JliTaBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69669988"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="69669988"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 18:03:52 -0800
X-CSE-ConnectionGUID: wEQI0ZJHT3eq5H9bgmq67Q==
X-CSE-MsgGUID: mGc9xlADT/aR99CZdx2DhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="212033254"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jan 2026 18:03:50 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjT08-000000000rt-2HOM;
	Sat, 24 Jan 2026 02:03:48 +0000
Date: Sat, 24 Jan 2026 03:03:07 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 25/30] Diff in
 drivers/gpu/nova-core/mm/bar_user.rs:249:
Message-ID: <202601240350.oNoK6ozr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   89462eb192ebd620dca084ef612b250231bc7aa1
commit: 31279138cb6b12d16394d8bd217bbc2d16ac9f1a [25/30] nova-core: mm: Add memory management self-tests
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260124/202601240350.oNoK6ozr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240350.oNoK6ozr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240350.oNoK6ozr-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/bar_user.rs:249:
            }
    
            if pdb_entry.aperture() != AperturePde::VideoMemory {
   -            dev_info!(dev, "MM: Self-test SKIPPED - requires VRAM-based page tables\n");
   +            dev_info!(
   +                dev,
   +                "MM: Self-test SKIPPED - requires VRAM-based page tables\n"
   +            );
                return Ok(());
            }
        }
>> Diff in drivers/gpu/nova-core/mm/bar_user.rs:249:
            }
    
            if pdb_entry.aperture() != AperturePde::VideoMemory {
   -            dev_info!(dev, "MM: Self-test SKIPPED - requires VRAM-based page tables\n");
   +            dev_info!(
   +                dev,
   +                "MM: Self-test SKIPPED - requires VRAM-based page tables\n"
   +            );
                return Ok(());
            }
        }
>> Diff in drivers/gpu/nova-core/mm/bar_user.rs:249:
            }
    
            if pdb_entry.aperture() != AperturePde::VideoMemory {
   -            dev_info!(dev, "MM: Self-test SKIPPED - requires VRAM-based page tables\n");
   +            dev_info!(
   +                dev,
   +                "MM: Self-test SKIPPED - requires VRAM-based page tables\n"
   +            );
                return Ok(());
            }
        }
   make[2]: *** [Makefile:1871: rustfmt] Error 123
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
