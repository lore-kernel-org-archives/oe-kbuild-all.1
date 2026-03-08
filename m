Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD12727F3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998765; cv=none; b=T1FcUm2OL67rhnUQ0A9uJ8ztq0Cf+OkrJWYJ3iMq8Co9q+Cag2tHYBwpl+n9FY0cXZkjhPrghwpghH72sufVYbFlVSdbS8ULbbqfls4KKGkJ1mcGGUG9nswVftiMXQGBaPgGey3r8PurcAwO+mLTW+ztwoq9pe5trthzHvIFZOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998765; c=relaxed/simple;
	bh=fQ2muq+Jl5D1uhjfaw2odnLvTFKzLJ27XV0LKE39v28=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j1Z48r6gXHAQW57tNcTZQ5k/UjANUesvPTZ2rZej2OKl6tOE/7S2a9fCpFlTs4oWe2vFBNAK3pqm2NVqCeEl0rres0S6RUzY/wPeqJgVnt3iWQc2U6DQrzbiKGFYTcSupRCEUTS9WfAud71p9VAK/p+L7OTEaKsy+Ng4uyfCwsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuxhFWn8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuxhFWn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772998764; x=1804534764;
  h=date:from:to:cc:subject:message-id;
  bh=fQ2muq+Jl5D1uhjfaw2odnLvTFKzLJ27XV0LKE39v28=;
  b=CuxhFWn8h2XvAKOn5qiYTanyrBs1LCIzuqHsvymm0ggPLn1zTmaDJTPC
   IBMYyO+dxH21+32bK/WpEBT7MF4xN9exwC3/yq2QXSGc+Ry7upiJJH+jf
   gLRf9kHPgYJBesvvm/JLshyBPTOjVdLVCSlWmWAs2W4aEaNTMYPOBr0Ha
   EeiFAmiIczj6QHE/l8IIytnIBlMGJkqXvOd3OBE+CUr15UIX2Fow8VYP0
   6CyeiVMYnIxoIzqdCVpO2wZuzYqqJWZ/Bxv8dskgFvcLZOMIuhaVoUuei
   u814cu54IY2/l+poHpy9HFwskJhPPvItqP7hap9bhI4d3Zk/szwsoAXIu
   A==;
X-CSE-ConnectionGUID: vJKDzFMDTSOY+/JCJfmHKw==
X-CSE-MsgGUID: /GATNzjTRgavmz7pJoiwow==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91413061"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="91413061"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 12:39:23 -0700
X-CSE-ConnectionGUID: 5PP2iECVQ0+THqduAyhKew==
X-CSE-MsgGUID: e5hMa944QlK+2A81FnOxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245608876"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2026 12:39:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzJyA-000000002hB-2VxI;
	Sun, 08 Mar 2026 19:39:18 +0000
Date: Sun, 08 Mar 2026 20:38:53 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 16/27] Diff in
 drivers/gpu/nova-core/mm/pagetable.rs:131:
Message-ID: <202603082016.5EaqHKCX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   f93bd1f081990c55183e8e7d0bcf33b6c895720d
commit: 163f7c87070ad03d752a0e46ff29faa1ae7d40b7 [16/27] gpu: nova-core: mm: Add unified page table entry wrapper enums
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260308/202603082016.5EaqHKCX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082016.5EaqHKCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082016.5EaqHKCX-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:131:
                Self::V2 => match level {
                    // TODO: Calculate these values from the bitfield dynamically
                    // instead of hardcoding them.
   -                PageTableLevel::Pdb => 4,   // PD3 root: bits [48:47] = 2 bits
   -                PageTableLevel::L3 => 256,  // PD0 dual: bits [28:21] = 8 bits
   -                _ => 512,                   // PD2, PD1, PT: 9 bits each
   +                PageTableLevel::Pdb => 4, // PD3 root: bits [48:47] = 2 bits
   +                PageTableLevel::L3 => 256, // PD0 dual: bits [28:21] = 8 bits
   +                _ => 512,                 // PD2, PD1, PT: 9 bits each
                },
                Self::V3 => PAGE_SIZE / self.entry_size(level),
            }
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:131:
                Self::V2 => match level {
                    // TODO: Calculate these values from the bitfield dynamically
                    // instead of hardcoding them.
   -                PageTableLevel::Pdb => 4,   // PD3 root: bits [48:47] = 2 bits
   -                PageTableLevel::L3 => 256,  // PD0 dual: bits [28:21] = 8 bits
   -                _ => 512,                   // PD2, PD1, PT: 9 bits each
   +                PageTableLevel::Pdb => 4, // PD3 root: bits [48:47] = 2 bits
   +                PageTableLevel::L3 => 256, // PD0 dual: bits [28:21] = 8 bits
   +                _ => 512,                 // PD2, PD1, PT: 9 bits each
                },
                Self::V3 => PAGE_SIZE / self.entry_size(level),
            }
>> Diff in drivers/gpu/nova-core/mm/pagetable.rs:131:
                Self::V2 => match level {
                    // TODO: Calculate these values from the bitfield dynamically
                    // instead of hardcoding them.
   -                PageTableLevel::Pdb => 4,   // PD3 root: bits [48:47] = 2 bits
   -                PageTableLevel::L3 => 256,  // PD0 dual: bits [28:21] = 8 bits
   -                _ => 512,                   // PD2, PD1, PT: 9 bits each
   +                PageTableLevel::Pdb => 4, // PD3 root: bits [48:47] = 2 bits
   +                PageTableLevel::L3 => 256, // PD0 dual: bits [28:21] = 8 bits
   +                _ => 512,                 // PD2, PD1, PT: 9 bits each
                },
                Self::V3 => PAGE_SIZE / self.entry_size(level),
            }
   make[2]: *** [Makefile:1912: rustfmt] Error 123
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
