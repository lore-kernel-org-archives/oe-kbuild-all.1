Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE2156CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765638996; cv=none; b=QEeBMxuwBDyUtZCUqvQtLo7Mdjdf6o8OloNX+nWrUSAYhrxDM9gOscGa8KH4LVhS14rKh3v1NCcwUZwx1GNyxBEI2X7HQ4TuOC6mfzJSxzbPlI/5BpiYVw7MzwWn0Qx7/ni9tA+H6JLwdu5ehZk1TZk0ZNtohPhhEqLrG4z56Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765638996; c=relaxed/simple;
	bh=JEsRUCBhD670uQlevAyJhB4rhDCGIwvuS1ed5/WU5LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OYBbW3Ly2IvQYyUC5SdeGQVMpnNmXR0kRO4LdbTkLdSSxn6U30FF81m4xqEZsW+kDlizGpY7Rnucm95xavXcxrQsnzyk3HTyIIPX8UIUfHjuLvirdWvIDrLPKiLe6F4GR//pC9+7r52tCFajiXcTU2KDVVN67h8QqVko/14GcR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxzZ4+PD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxzZ4+PD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765638994; x=1797174994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEsRUCBhD670uQlevAyJhB4rhDCGIwvuS1ed5/WU5LQ=;
  b=RxzZ4+PDmiEctIsksEiW3dqgMbToyij/pBRfnDqscRcwQ6yFLl8gaH04
   XCHMvgHFLKOYgvPo72dAgHa0d3Oqm9Zg7w3Wj53E84ciGGv/tXJYC9cDV
   nQechBH7iqfLToPbxP4EfIzIFUo5hLg3EkAq5fuxCqk5YtDVgPW88cjL9
   hz1wi4fx3O7fMyDdQ+GAzO+/Y5B5EB3q9b29BXbMNxMieJl9wtARZyw+k
   AqogmzE+WYS2E2WQk0aKmDh6ZneFR45Bgvi8Hw2lxSyL0pMVNOcbwdnFH
   fyHk9R84igTUZ8DNAdruf131zNWMIJdIMjz8NrDp/nNi45L+N5a8wjSbe
   A==;
X-CSE-ConnectionGUID: uggwCU0YS+KR+/pusrC7Ng==
X-CSE-MsgGUID: ouauEN5RRumo9++9Lqi9Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66786593"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66786593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 07:16:34 -0800
X-CSE-ConnectionGUID: yE0vBNb2TEiRuuL2qccUXA==
X-CSE-MsgGUID: KQyvkUyKQdm3g/8ZSuuZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197390762"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 07:16:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vURME-0000000026q-0yN2;
	Sat, 13 Dec 2025 15:16:30 +0000
Date: Sat, 13 Dec 2025 16:16:00 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
Message-ID: <202512131634.vtTgCftE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-pci-add-PCI-device-name-method/20251213-045436
head:   ec023bfe9bd24aff26db4e792e84587ff8bd7b9e
commit: 651232ded083675fae7c298707ff0399483b9310 gpu: nova-core: use pin projection in method boot()
date:   18 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131634.vtTgCftE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131634.vtTgCftE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131634.vtTgCftE-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
>> Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
>> Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
   Diff in drivers/gpu/nova-core/nova_core.rs:2:
    
    //! Nova Core GPU Driver
    
   -use kernel::{error::Error, pci, prelude::*, InPlaceModule, debugfs::Dir};
   -use pin_init::{PinInit, pinned_drop};
   +use kernel::{debugfs::Dir, error::Error, pci, prelude::*, InPlaceModule};
   +use pin_init::{pinned_drop, PinInit};
    
    #[macro_use]
    mod bitfield;
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
