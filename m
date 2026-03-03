Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E061FECBA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 02:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772505855; cv=none; b=dtY1xWQwXm4DYMuKKBNvYcjILHC2ZF9WLGnsIszVz+Wso8Awgb1k01/toOZq9UhNaGCad/O1as+4RjO9je0Cpr7Q77LXugqnjBMJ9obcpe1jjED+O8BqWQxtW41Ylny+F/cQD+nvrtb+yC61VISTZg+Q2k+7klzAoOnzOoAU+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772505855; c=relaxed/simple;
	bh=aAP7G7WyHSKcOdsvgdqOpkGYEXov5RVmeziAshoiIpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lvxIXCRKj2r8HukYBGqImfNIZw/ugmscvf7nTp59ztcBbL4BFyI6dlIttTcMVr9WZaLn3FqlZtgBVg/JTiVH3gQcKbMdKXMWzOf0QqFw1SymC6VnoWLURLdsBSkgmapWcP6c1sLfkzQtBuaPON6dPqgZ6tYI7WTaaFP7C9HbDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhjQAX+y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhjQAX+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772505853; x=1804041853;
  h=date:from:to:cc:subject:message-id;
  bh=aAP7G7WyHSKcOdsvgdqOpkGYEXov5RVmeziAshoiIpU=;
  b=hhjQAX+yY3iF1g3ahSfm2nFFTxp6+u42TAUHdSpI/kQdF6zvB3xfJ4Pn
   0My47R0mOADlhU2LDv4cP407w7zS5k6oSgb6Uojh0q3/LByjRKlNOINEq
   OH6HFf2ixif8ncIXtEbvkKwSHPmUnHY3DZCjBRQbLnId6ZVsrgGenankH
   n5pvxdRypQ0Xw/HUyuusd96PtPIbeAe8mgkWGDiOEUNkHeq7ABOLbnL9Z
   bpTwlGX4yeyN5qJEB4cXAeR65TUezA9qHfrp8YkHr8LKU5TGIV5vPDoGB
   o3WDXSHJTpHs7S92NeTvo2Uzx+RheE1SIlu7CWVNKaSIAj0VKm17jK3mC
   g==;
X-CSE-ConnectionGUID: i5F9+1FGRRqOh6En7a+FUg==
X-CSE-MsgGUID: s/y7LrXOTHK6c5zeNUGuHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73435164"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73435164"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:44:13 -0800
X-CSE-ConnectionGUID: E5jA8E5MSmW8QnAVLWgcbg==
X-CSE-MsgGUID: XOUBZC7CQzGWYFh6cUrQoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="240862233"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 02 Mar 2026 18:44:11 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxFk1-000000001M1-3hV2;
	Tue, 03 Mar 2026 02:44:09 +0000
Date: Tue, 03 Mar 2026 03:43:54 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm-snapshot-3-1-2025 35/35] Diff in
 rust/kernel/gpu/buddy.rs:304:
Message-ID: <202603030332.aCiXJEmz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm-snapshot-3-1-2025
head:   0f6796073506b5f84d2e6f0be478ccb7001d3703
commit: 0f6796073506b5f84d2e6f0be478ccb7001d3703 [35/35] fixup! fixup! fixup! fixup! rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260303/202603030332.aCiXJEmz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603030332.aCiXJEmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603030332.aCiXJEmz-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/gpu/buddy.rs:304:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
>> Diff in rust/kernel/gpu/buddy.rs:304:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
>> Diff in rust/kernel/gpu/buddy.rs:304:
        pub chunk_size: u64,
    }
    
   -
    /// Inner structure holding the actual buddy allocator.
    ///
    /// # Synchronization
   make[2]: *** [Makefile:1903: rustfmt] Error 123
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
