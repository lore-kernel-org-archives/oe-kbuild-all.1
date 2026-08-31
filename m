Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEC42A80
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 00:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788137299; cv=none; b=BCU0T0bw/d+XbtFn9aXLbPIsdxt/vkkUi4nDAhoSk4PTAUFTcgahbX8/O5egjtdP1+Rz+Hw4Ucp/rlmMlvzzf7UCdk8i+yVf1QWkRIq+2TUDYhDi7gSW3+gVDNcKfeNznfq45gEnGM2dWzNT0QVrB91NNNsYgfUEc3WKWLZKGCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788137299; c=relaxed/simple;
	bh=ZQd+7gBUZiJIwvuNUaOIOcKyzLA6DiSnw/f/Vv8D8rc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L5Z2cFWXI4FaLsddOr0XdQHauIr2UjmLBTrLT/D4Qq0gttDsgLGxkddOJjUxNm/JJSK7ogTWi/jAZ22cAINVQApnIBPZ8ykOZhoYaX7KjK+KbTrsjQNSHfDGTGCahbbAiLDUlNp3VNv8jZrywEIFtnu7cOix+w2aU4kGPS1sdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDnqY0Xe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDnqY0Xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788137296; x=1819673296;
  h=date:from:to:cc:subject:message-id;
  bh=ZQd+7gBUZiJIwvuNUaOIOcKyzLA6DiSnw/f/Vv8D8rc=;
  b=NDnqY0Xe77zGpMBdIHfdET3HuTH3/lBNPikbFKzkw6qg6kppjZ2BqrnV
   xBXAryKk7M6AHOYaFMlBstjGfY0M/tjR/1woZr9NVbWgE5oOXWBJJOE2j
   QYLh7Kjib6Zin/t7jbRGOCf6XQEliPEsjLfvmJusU/p3bgZArGLTnI2X6
   zfH7BeOnHD/MVsuHKj5Fp0Htfm/D3t0S7aUnwIZxV+Y45NOMSRKjJe9hd
   CAWsoL/pIssAQAvUA/RkhKAQDr41SZVPRZ1TV8suP+BulZdV3gNRszHAj
   0eh8s3O+dhKz9SglqxzPWri+PDsUYlKiSTKiDFgt9NOlS/xr5Kly6FQSV
   g==;
X-CSE-ConnectionGUID: wEbPyOWqR2itQ97MOwkDTA==
X-CSE-MsgGUID: VnU/4oNzQH+nWm/b0CgYWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88392904"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88392904"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 17:48:15 -0700
X-CSE-ConnectionGUID: sN6EP5WwRGGr3rgOy4+BeQ==
X-CSE-MsgGUID: mCjCJg43QUOEXWNkzdoEcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="269235520"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Aug 2026 17:48:14 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0qC3-000000000J9-2uZ6;
	Mon, 31 Aug 2026 00:48:11 +0000
Date: Mon, 31 Aug 2026 02:47:24 +0200
From: kernel test robot <lkp@intel.com>
To: David Stevens <stevensd@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in rust/kernel/task.rs:348:
Message-ID: <202608310257.WibZYb7F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Stevens/Add-MEMCG-memcg_list_lru_alloc-implementation/20260827-162939
head:   bea0aa5f6ee4e605415210b8979072d03a4c7048
commit: 4535b81f546a9d40371c860407e522d1c088bc8c Set PF_RECLAIMABLE_STACK in various places
date:   3 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260831/202608310257.WibZYb7F-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310257.WibZYb7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310257.WibZYb7F-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j128 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/task.rs:348:
        /// Sets the given task flag bits on the current task.
        #[inline]
        pub fn set_flag_bits(&self, set: u32) {
   -            // SAFETY: The `flags` field of `current` is not modified from other threads, so
   -	    // the non-atomic update isn't a race.
   -	    unsafe { (*self.as_ptr()).flags |= set }
   +        // SAFETY: The `flags` field of `current` is not modified from other threads, so
   +        // the non-atomic update isn't a race.
   +        unsafe { (*self.as_ptr()).flags |= set }
        }
    
        /// Clears the given task flag bits on the current task.
   Diff in rust/kernel/task.rs:357:
        #[inline]
        pub fn clear_flag_bits(&self, clear: u32) {
   -            // SAFETY: The `flags` field of `current` is not modified from other threads, so
   -	    // the non-atomic update isn't a race.
   -	    unsafe { (*self.as_ptr()).flags &= !clear }
   +        // SAFETY: The `flags` field of `current` is not modified from other threads, so
   +        // the non-atomic update isn't a race.
   +        unsafe { (*self.as_ptr()).flags &= !clear }
        }
    }
    
>> Diff in rust/kernel/task.rs:348:
        /// Sets the given task flag bits on the current task.
        #[inline]
        pub fn set_flag_bits(&self, set: u32) {
   -            // SAFETY: The `flags` field of `current` is not modified from other threads, so
   -	    // the non-atomic update isn't a race.
   -	    unsafe { (*self.as_ptr()).flags |= set }
   +        // SAFETY: The `flags` field of `current` is not modified from other threads, so
   +        // the non-atomic update isn't a race.
   +        unsafe { (*self.as_ptr()).flags |= set }
        }
    
        /// Clears the given task flag bits on the current task.
   Diff in rust/kernel/task.rs:357:
        #[inline]
        pub fn clear_flag_bits(&self, clear: u32) {
   -            // SAFETY: The `flags` field of `current` is not modified from other threads, so
   -	    // the non-atomic update isn't a race.
   -	    unsafe { (*self.as_ptr()).flags &= !clear }
   +        // SAFETY: The `flags` field of `current` is not modified from other threads, so
   +        // the non-atomic update isn't a race.
   +        unsafe { (*self.as_ptr()).flags &= !clear }
        }
    }
    
   make[2]: *** [Makefile:1996: rustfmt] Error 123
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
