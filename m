Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2521EF0B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765637795; cv=none; b=o62MgjmD/7/qg47tqSiLewxUmtPS6ynyKWqfQLirmvkzPb2hRf9C7RDAbm5uHaYrVjwP4DmBzIpxLct80aV3Od7kFFlyOhYPNLaQ1yJl31kTRh8x7ypTNnUf2CBsmyWtxNE+wP09GGney/0kWBxFluhHcDVGdx8blWtxyZMVYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765637795; c=relaxed/simple;
	bh=JLONx4/7N6ub5DaYFgq+6EnJQmGMz/A0vBMJTSSnmRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abS0JZmtuiWgmQfLeIIb+XiiYFemydObaPX4npgV/+h+3wxViyy/1y+8cj9oE1FPB0AnvmzRTfqEThkTnbCepZWBgeyWyJ1ocx/hRHYNiW+IRE/RgGXKLefYNwasXpElJ0P2OdTcZdpMWr2/vgUgq3ziiVdlrdGSrrMS/AT8Qi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VAwmZkAs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VAwmZkAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637794; x=1797173794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLONx4/7N6ub5DaYFgq+6EnJQmGMz/A0vBMJTSSnmRM=;
  b=VAwmZkAs4DknXQBSJKaJwpkS8gMiziLLbTn6Lb+0oRXgraHitm6Yfxys
   xDHTkuVEIqAHU7+agsBqEFUd5eYYCwoJn34gInZiiiLnB7Iayd9Ad/Vfy
   qY85QfFOua4VryMb1uL4x8gLzF7Rir8QRiTaoMTbHK2NTQyzE+cKPOBD6
   h7YIHCXp/WR1QcJEgQBn+506crgSa5bjslWvMeqx2T957a5dj0p+vzYpl
   B49uOg13Rh+MaodOti7MD9rVA3ZkywUjza9COAz0uNh3QkMjVz7d/DJEC
   /v7g6dJ6xNRkD/PjXCsa0fM+P593qaJo9yshfWgoaeOpioJzgvslN7CQT
   w==;
X-CSE-ConnectionGUID: x3dMhI0LRPWExePkJM2vbw==
X-CSE-MsgGUID: Y/FW6KedSXCMj+rElPmnVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="90265467"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="90265467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 06:56:34 -0800
X-CSE-ConnectionGUID: bvUGDy1iQV6vSkIpVz6kFg==
X-CSE-MsgGUID: ZaiG3AcDTlmJgcgiwi15Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197221795"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 06:56:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUR2s-0000000026a-08jn;
	Sat, 13 Dec 2025 14:56:30 +0000
Date: Sat, 13 Dec 2025 15:56:23 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in drivers/gpu/nova-core/nova_core.rs:3:
Message-ID: <202512131555.XwFMDmwj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Timur,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-pci-add-PCI-device-name-method/20251213-045436
head:   ec023bfe9bd24aff26db4e792e84587ff8bd7b9e
commit: c8aa6ec357d46257b89b3f424ed086503f6f0614 gpu: nova-core: Replace module_pci_driver! with explicit module init
date:   18 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131555.XwFMDmwj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131555.XwFMDmwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131555.XwFMDmwj-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/nova_core.rs:3:
    //! Nova Core GPU Driver
    
    use kernel::{error::Error, pci, prelude::*, InPlaceModule};
   -use pin_init::{PinInit, pinned_drop};
   +use pin_init::{pinned_drop, PinInit};
    
    #[macro_use]
    mod bitfield;
   Diff in drivers/gpu/nova-core/nova_core.rs:41:
    
    #[pinned_drop]
    impl PinnedDrop for NovaCoreModule {
   -    fn drop(self: Pin<&mut Self>) {
   -    }
   +    fn drop(self: Pin<&mut Self>) {}
    }
    
    module! {
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
