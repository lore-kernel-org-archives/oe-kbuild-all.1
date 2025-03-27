Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C991AA795
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 03:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045977; cv=none; b=Sk41caYBkCbVwCR4jR0VpF/VVjn3lDhOp+herRx2VLD8DsTG3QlMLZ54cghVA4JZ9cTOHm+62VI0L+GTUdnVW8j4KFU9jgsh+teqoIJRDG/Xv8cIBR+OX1+qZuvZ8SfvAwRqnrjljggyDwp8u97oUB+luP0pzV/+F5oN3PKMIOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045977; c=relaxed/simple;
	bh=i8+x1whVkT8SBlJd9cTV+4Y3hXNB9EE6KsBA9RsYdLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iu7G0fswcE3r/DP4P3DqWhkuNcYImmT4SntOjcRjyME8pMmbAxg2FE4P6OUd/RqKueQlpYxZkv7UtuqvTeFaQUsy9/J1f1A27MtMObqFJa1KPpPkILBUjKI/6lFG/rOVmzZFRq/dQOJDH4Edr2mslFR9qDIL5MCAzDJkVuB3xAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZ83pycQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZ83pycQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743045976; x=1774581976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8+x1whVkT8SBlJd9cTV+4Y3hXNB9EE6KsBA9RsYdLs=;
  b=TZ83pycQfSGkaruAbgN2LH1FYJoPcA2geygjOTeej0BaqT6wWSexoEbW
   lukrfLD94/mXjFEJcdtSVwVxz4qq2zi97jYI2SR9j2dLIiYkVBkPrLRCh
   5KIV3ao4R8Aj7QBoyTPgv+whIy0cqhmeLwHFLHI9s3IOIR7Ai65PNhuBf
   sbGO7aPqc+oz4mn+1Lu6Qrtfpk7mu95xZCN8uQihfI364dPHbU8hjxXFX
   v7Y39+268NDA0MHGCpF9UkHzDqME27nyTv4YzTn7jMXYIEVl8MQ+3Doio
   q0XvmHCVW1Bzuk7j7Uo2cwQGH78PM5FAob0BNe2tdaUVhb1bG46pYBrJn
   w==;
X-CSE-ConnectionGUID: AyWjFrIHSS6bbRQ7fmHLEg==
X-CSE-MsgGUID: Ni0GFPzyTw62ao8z/cv3Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44237600"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44237600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 20:26:13 -0700
X-CSE-ConnectionGUID: PM4Quuy8RSuCVia6qJ+lzQ==
X-CSE-MsgGUID: SFok9L96TRy80Sj+ZOqHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="125463071"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Mar 2025 20:26:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txdsb-0006K3-2A;
	Thu, 27 Mar 2025 03:26:06 +0000
Date: Thu, 27 Mar 2025 11:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 6/7] Diff in drivers/gpu/nova-core/gpu.rs at line 5:
Message-ID: <202503271105.o0aXFVnf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   8a5d4dee8e431c4d46aa04b30d0928d29a4d3522
commit: d7240b42d196d03d4c8b7d5ed8febd5fbfbc7c2b [6/7] Add support to read from and dump first 32 bytes from Bios
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250327/202503271105.o0aXFVnf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271105.o0aXFVnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271105.o0aXFVnf-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make W=1 --keep-going LLVM=1 -j16 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/gpu.rs at line 5:
    };
    
    use crate::bios::Bios;
   -use crate::vbios::Vbios;
    use crate::dma::DmaObject;
    use crate::driver::Bar0;
    use crate::falcon::FalconBromParams;
   Diff in drivers/gpu/nova-core/gpu.rs at line 15:
    };
    use crate::timer::Timer;
    use crate::util;
   +use crate::vbios::Vbios;
    use crate::{devinit, regs};
    use core::fmt;
    use core::time::Duration;
   Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
   -use core::convert::TryFrom;
    use crate::driver::Bar0;
   -use kernel::error::Result;
   -use kernel::devres::Devres;
    use crate::regs::RomShadow;
   +use core::convert::TryFrom;
   +use kernel::devres::Devres;
   +use kernel::error::Result;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 70:
    
        /// Probe for VBIOS extraction
        pub(crate) fn probe(bar0: &'a Devres<Bar0>) -> Result<Self> {
   -        let mut vbios = Self { bar0, version: 0,  data: KVec::new() };
   +        let mut vbios = Self {
   +            bar0,
   +            version: 0,
   +            data: KVec::new(),
   +        };
    
            // Enable ROM shadowing so the ROM is accessible on the BAR
            pr_info!("Enabling ROM shadowing\n");
   Diff in drivers/gpu/nova-core/vbios.rs at line 272:
            Err(ENOENT)
        }
    }
   +
   Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
   -use core::convert::TryFrom;
    use crate::driver::Bar0;
   -use kernel::error::Result;
   -use kernel::devres::Devres;
    use crate::regs::RomShadow;
   +use core::convert::TryFrom;
   +use kernel::devres::Devres;
   +use kernel::error::Result;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 70:
    
        /// Probe for VBIOS extraction
        pub(crate) fn probe(bar0: &'a Devres<Bar0>) -> Result<Self> {
   -        let mut vbios = Self { bar0, version: 0,  data: KVec::new() };
   +        let mut vbios = Self {
   +            bar0,
   +            version: 0,
   +            data: KVec::new(),
   +        };
    
            // Enable ROM shadowing so the ROM is accessible on the BAR
            pr_info!("Enabling ROM shadowing\n");
   Diff in drivers/gpu/nova-core/vbios.rs at line 272:
            Err(ENOENT)
        }
    }
   +
>> Diff in drivers/gpu/nova-core/gpu.rs at line 5:
    };
    
    use crate::bios::Bios;
   -use crate::vbios::Vbios;
    use crate::dma::DmaObject;
    use crate::driver::Bar0;
    use crate::falcon::FalconBromParams;
   Diff in drivers/gpu/nova-core/gpu.rs at line 15:
    };
    use crate::timer::Timer;
    use crate::util;
   +use crate::vbios::Vbios;
    use crate::{devinit, regs};
    use core::fmt;
    use core::time::Duration;
   Diff in rust/kernel/reg.rs at line 1:
    
   -
    
   make[2]: *** [Makefile:1811: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
