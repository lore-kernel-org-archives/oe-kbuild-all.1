Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44276219E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743042169; cv=none; b=c2J7Nwv7w7ApFr/ydZbrLu73JrujSLZgaqVDes9xrP1DIHdgwCihrcksvJMKMvrCUiCqpeR8mg6bgb2bW5EvGRnk+iyqyYW29Cdv19nMEwDnIu+NE5lCxTRVkt+tZV26TiI7BzyuftvnxaOINYUJAAAkSLLg2KvYm6UbO/WX+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743042169; c=relaxed/simple;
	bh=9NFw779GgLugtFeSBM3Tx/Wv0TI7Cnkv1V8vazPL1u0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXG9vpwzHMjvzOXPjt+HEJMabxAtfirBw5t62SMKkHbb2tYKKfFOdijxsepgTXBocmmd4v33W3YZevikma3DxjqBuiq1w1bHVhYNfGIWo35xvNKGV2PWFH0ppO1PuVGtIj+mFLu9hxW+c7/HdneqqiJeOP6xIp76gZ0rXKKUlWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fq9DrPuY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fq9DrPuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743042167; x=1774578167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9NFw779GgLugtFeSBM3Tx/Wv0TI7Cnkv1V8vazPL1u0=;
  b=fq9DrPuYlQVw62dzQH+J5umHgs6kEEKBdns52YSOZ9EU5LWriL/WkoCf
   OHnMv8m9o/YDVIKP9kP8qI1/g+e9L6TMbxL5oxhagR1neAEqplwCQev7D
   EFIDIcR5Jc+bgWLDzC/8r4DPAw/q56JUQ+XqKHyYqFsm1MwgjcRs6kPRU
   fGgtZ42bJOHBRpTakxrRUVjWybOYWSXwM94gFNIRzGy/HBRHtXdKQkgv/
   rCYLhREE9ulOg8Tpy4dJfLXL5w1RAGbDHu31u6SxmH5+RwVeQV/fZ5S1p
   9R8o/l22VQ7kQOz8pW8H7wJR2LL8s3GE6r2PJ54FDuSJf63ewxNdWodO2
   w==;
X-CSE-ConnectionGUID: ZnUy8SvOQXqjUT49w6lHaA==
X-CSE-MsgGUID: NoQiRb+/T96HrV+ku8RSBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61753968"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="61753968"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 19:22:42 -0700
X-CSE-ConnectionGUID: m8U1e/iySE+hX83Yij8v+A==
X-CSE-MsgGUID: oxoJOc/bTvWqkErNET31ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="130110915"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2025 19:22:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txcsa-0006I7-0m;
	Thu, 27 Mar 2025 02:22:05 +0000
Date: Thu, 27 Mar 2025 10:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 5/7] -use kernel::error::Result;
Message-ID: <202503271028.WGtkrwkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   d7240b42d196d03d4c8b7d5ed8febd5fbfbc7c2b
commit: 786e85413c476ee0739f4a6f5afe5b6b5cdd8750 [5/7] Add functionality to enable rom shadowing
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250327/202503271028.WGtkrwkM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271028.WGtkrwkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271028.WGtkrwkM-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make W=1 --keep-going LLVM=1 -j16 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/regs.rs at line 238:
    register!(RomShadow@0x00088050;
        31:0    val => as u32
    );
   +
   Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
   -use core::convert::TryFrom;
    use crate::driver::Bar0;
>> -use kernel::error::Result;
   -use kernel::devres::Devres;
    use crate::regs::RomShadow;
   +use core::convert::TryFrom;
   +use kernel::devres::Devres;
   +use kernel::error::Result;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 223:
            Err(ENOENT)
        }
    }
   +
   Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
   -use core::convert::TryFrom;
    use crate::driver::Bar0;
>> -use kernel::error::Result;
   -use kernel::devres::Devres;
    use crate::regs::RomShadow;
   +use core::convert::TryFrom;
   +use kernel::devres::Devres;
   +use kernel::error::Result;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 223:
            Err(ENOENT)
        }
    }
   +
   Diff in drivers/gpu/nova-core/regs.rs at line 238:
    register!(RomShadow@0x00088050;
        31:0    val => as u32
    );
   +
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
