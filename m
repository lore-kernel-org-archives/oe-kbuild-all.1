Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5781217A2EA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773000026; cv=none; b=Jy/ZAF5EPj23SLrOLAfk05Ig6gXCZdDvhctW33uUTbsvIRqOhCYHzD2FCkVQIcyDC1kzqBLfXbyGcZbDembVBNone5cwUbQRWLnzSEQgMD+z1SrIyrbI3hebUrxIXCi9tAy9g7+I8Bvqy3HVAy5xXiiJctSHAMmz3ovhczMTaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773000026; c=relaxed/simple;
	bh=m4EXh/2p6ugcd6aQjBcVbSVDHn0hO/JM/eJIxbIIvXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NQZXae4Z45+Yrvt0D/+R4cLrEGqxiZVBLGVPQg2WVTjbd4ByDD8U2Hp34gTObF/tPMKoeX9JyuL0wZSFcjdqdORbj8D0mjiklvUqHBbQrng3mLYUYsaV7YdctY/cmHcecWlFG5fvUnr9B1r3MtWnOB23+ArMbs3VJ7Lv2DY/8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+fffLgM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+fffLgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773000023; x=1804536023;
  h=date:from:to:cc:subject:message-id;
  bh=m4EXh/2p6ugcd6aQjBcVbSVDHn0hO/JM/eJIxbIIvXo=;
  b=V+fffLgMbRIgIX4XN5yC5yEacK3vHinASpUQ/MFeLgyMaOUJkDbe6I4P
   JNihv/cJE4vQQ6B6SdyJ3oX3BBhPGcxNtbvPdZg3JsXhAeq8T8g+xnzrk
   HC0Df5E28SICJdSrsBGi6IvoTwavPxm/Q1bJtE1rl8+DUS/Zb5Ds/o/eT
   4iJXQsre8Jtrt0YmR8/C7lXMiRf130ZmIL8cdHym6NrNv3ml18TYjYlCU
   wd6VtUBLkaNNNWk7XzeHAUFrCoqsQSYYlNga4/WrN9ZxJNZBi6CwC7Mk2
   R11kUS2cFNfl+RnnNf2F877ptGo9vDh9xcV7KyRI24NzC9hC0dLVzt3oh
   Q==;
X-CSE-ConnectionGUID: wTu4NQs8R0WgZHAzsI2b0Q==
X-CSE-MsgGUID: K3lcmEURQ3CdVhsE6tdASQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99499922"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="99499922"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 13:00:22 -0700
X-CSE-ConnectionGUID: lwSAMhAhRDOUEEo2J2JUfg==
X-CSE-MsgGUID: dbuZaG3oTGGLo8pCH7EoWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216126181"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Mar 2026 13:00:21 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzKIV-000000002i1-0r6W;
	Sun, 08 Mar 2026 20:00:19 +0000
Date: Sun, 08 Mar 2026 20:59:27 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 19/27] Diff in
 drivers/gpu/nova-core/mm/vmm.rs:94:
Message-ID: <202603082002.IiRIOLzw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   f93bd1f081990c55183e8e7d0bcf33b6c895720d
commit: 221e304650dc9024261cc95f8e4e39c478ac7069 [19/27] gpu: nova-core: mm: Add virtual address range tracking to VMM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260308/202603082002.IiRIOLzw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082002.IiRIOLzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082002.IiRIOLzw-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:94:
            num_pages: usize,
            va_range: Option<Range<u64>>,
        ) -> Result<(Vfn, Pin<KBox<AllocatedBlocks>>)> {
   -        let size = num_pages
   -            .checked_mul(PAGE_SIZE)
   -            .ok_or(EOVERFLOW)?;
   +        let size = num_pages.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)?;
    
            let mode = match va_range {
                Some(r) => {
   Diff in drivers/gpu/nova-core/mm/pagetable.rs:132:
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
   Diff in drivers/gpu/nova-core/mm/pagetable.rs:132:
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
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:94:
            num_pages: usize,
            va_range: Option<Range<u64>>,
        ) -> Result<(Vfn, Pin<KBox<AllocatedBlocks>>)> {
   -        let size = num_pages
   -            .checked_mul(PAGE_SIZE)
   -            .ok_or(EOVERFLOW)?;
   +        let size = num_pages.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)?;
    
            let mode = match va_range {
                Some(r) => {
   Diff in drivers/gpu/nova-core/mm/pagetable.rs:132:
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
>> Diff in drivers/gpu/nova-core/mm/vmm.rs:94:
            num_pages: usize,
            va_range: Option<Range<u64>>,
        ) -> Result<(Vfn, Pin<KBox<AllocatedBlocks>>)> {
   -        let size = num_pages
   -            .checked_mul(PAGE_SIZE)
   -            .ok_or(EOVERFLOW)?;
   +        let size = num_pages.checked_mul(PAGE_SIZE).ok_or(EOVERFLOW)?;
    
            let mode = match va_range {
                Some(r) => {
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
