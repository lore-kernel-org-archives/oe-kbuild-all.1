Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13FA3BF662
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733001; cv=none; b=F0jorvKWDZKgy5Ba+9Fy7Wx64gtNoWzCRs2d2E2Tzx9LkEDH9Uy9ARmrVeJAkZe40SrNiE5ncJE6TmGWSK0LkrojC83oydI/vcUkicwCfOZzegjufNU4QLLmWmsyiWMfv5J8jgjQkmPq4NRLQTP21cJbzghG/p1ilEqbYrge04c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733001; c=relaxed/simple;
	bh=u6XbYwT9ETDQbR4m91/5R2/ZziPYAJosvDo++5DHaHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FcEfzT+mDoNyl0fYgQA8tznTtAdP1iYEW95lMxZoeZBpvrx0pxKnaRoCCR93qxZndfvNOSDet/1CtIJz/W0Nw5mkhYFzx3H4wUEzARgfVh0bCpasxy03Q7oIISdifJJkLqK1asQh74TGkkz6LYYRZNz3ufPip7nDhuyl3l4+v8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmkbf2Ea; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmkbf2Ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775732998; x=1807268998;
  h=date:from:to:cc:subject:message-id;
  bh=u6XbYwT9ETDQbR4m91/5R2/ZziPYAJosvDo++5DHaHE=;
  b=bmkbf2EaT3p2X61/cqKRJ8lcw7r+6SFWLGUTym6BvKkIr1mr9GqJrJWj
   efcPBrfATQf4/ygdq9zj/n1gWn8+xg6J6t+AliwlL3YIkGb9ixynG4cx8
   TZsdPKhefJUqQUBCAAQw/PquL5NRkKexrVM3i8FZRAkGyK/n+jh9qcc+E
   onMhscVYIdDRKbbJVM910JRSRNM4XRVlDQ8q4GAGZETHxqrurpxvAp8Oy
   eNMUzq/Lpwnbn+8SN38fF2AuTZZxYD/HhDXKR3HqfEZZ7C2KipZdWYJdv
   fmWJKOOyg3KLtUZ+pSUcMKl0ikgnZ+IRmHp2V7X6QTH5mkpGBfLwB7J1M
   A==;
X-CSE-ConnectionGUID: Aipq4VB/TeOTFWy1rBbtJg==
X-CSE-MsgGUID: RX+xAG3iRo+R72bN36qg1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80595514"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="80595514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 04:09:58 -0700
X-CSE-ConnectionGUID: XyzvnmSyTg+S4TmVBnG09Q==
X-CSE-MsgGUID: Pr9/uewqR2eFyZnlQl7iLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="233721684"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Apr 2026 04:09:57 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAnGk-00000000Aej-2Svu;
	Thu, 09 Apr 2026 11:09:54 +0000
Date: Thu, 09 Apr 2026 13:09:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/21] Diff in
 rust/kernel/alloc/kvec.rs:5:
Message-ID: <202604091303.HPOO29GA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Shivam,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d4d2e1ec067818457c1043aacefcb93f2ce32dac
commit: 31ffab1230dd3867606f0eededc92a43abc9ffef [0/21] BACKPORT: FROMGIT: rust: kvec: implement shrink_to for KVVec
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260409/202604091303.HPOO29GA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604091303.HPOO29GA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604091303.HPOO29GA-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/alloc/kvec.rs:5:
    // May not be needed in Rust 1.87.0 (pending beta backport).
    #![allow(clippy::ptr_eq)]
    
   -use crate::page::PAGE_SIZE;
    use super::{
        allocator::{KVmalloc, Kmalloc, Vmalloc},
        layout::ArrayLayout,
   Diff in rust/kernel/alloc/kvec.rs:12:
        AllocError, Allocator, Box, Flags,
    };
   +use crate::page::PAGE_SIZE;
    use core::{
        fmt,
        marker::PhantomData,
>> Diff in rust/kernel/alloc/kvec.rs:5:
    // May not be needed in Rust 1.87.0 (pending beta backport).
    #![allow(clippy::ptr_eq)]
    
   -use crate::page::PAGE_SIZE;
    use super::{
        allocator::{KVmalloc, Kmalloc, Vmalloc},
        layout::ArrayLayout,
   Diff in rust/kernel/alloc/kvec.rs:12:
        AllocError, Allocator, Box, Flags,
    };
   +use crate::page::PAGE_SIZE;
    use core::{
        fmt,
        marker::PhantomData,
>> Diff in rust/kernel/alloc/kvec.rs:5:
    // May not be needed in Rust 1.87.0 (pending beta backport).
    #![allow(clippy::ptr_eq)]
    
   -use crate::page::PAGE_SIZE;
    use super::{
        allocator::{KVmalloc, Kmalloc, Vmalloc},
        layout::ArrayLayout,
   Diff in rust/kernel/alloc/kvec.rs:12:
        AllocError, Allocator, Box, Flags,
    };
   +use crate::page::PAGE_SIZE;
    use core::{
        fmt,
        marker::PhantomData,
   make[2]: *** [Makefile:1810: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:242: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
