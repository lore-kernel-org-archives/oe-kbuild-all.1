Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F128F4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743015755; cv=none; b=RcRXqtsSrr3hgO8XlHnHx28bzZXDW56ebHF3vyYdRB6GMIkG2Ae75JErptZ52tWB5UxQabmplG1ZruOEC+pQB2b7csolFcFo6cmWK9gSZadIT2dpDqpaJkqQCTrBfow2bHpuPuOdMPUWfr4/ExjbdybW/z6Qc568zwmdp27oysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743015755; c=relaxed/simple;
	bh=fgpzqy3J+/nMe48p05qeKYax0WjKVX0mnwmbSSmpwhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKbvE+5xohQe0NJDdq0w2kU71/CILGOIIIaE/2UicJPiiiU4vjgY81cAo8WC3n93PXYIO6quNnx9aPDjuxEriAuWvXDUWdHUdWWQLZa7+OQ1yYypdU8Pr0QW1mARSSPye9DGKfh6AsaYkmL6nfbkz1eD6ndCsGFsd/d3+gn3jbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZVNSVOa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZVNSVOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743015753; x=1774551753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fgpzqy3J+/nMe48p05qeKYax0WjKVX0mnwmbSSmpwhs=;
  b=bZVNSVOaap6QGLIehxaZiy8TJ0HLbEZl09GwIsu3V+2mo2wPyYKmsIJV
   P1w/NV74G3YIIzHcwoJIRD2vkh9KmxkymsvVTZTJnR9VG73qn4rdiV+OW
   Y0i8qrIfj0bPBhT/8Jnmz63ZJ8cSkCt8kS/UX87oKN3FIsNiTb6DmD87O
   hD2DpABZMeI8BvNA15zi1/LK5tRIk2ILOwrKnejiDGVoE0t8i02BGNjCL
   QSzFhTrPF93gWVORuFaVrXvIr8cDn7bRfrxHkeZGCva8Hf6s9YrNuFP1f
   xy3CRi719/w2fbnRkMoc1TCzObgIwp3hqVDCJ0LgPGuMLv0uJwEmUoIZi
   A==;
X-CSE-ConnectionGUID: GxhmX/+MTfueSSG2fW+w+A==
X-CSE-MsgGUID: V76ZD45CSWGvuXx/R797Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44217826"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44217826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:02:32 -0700
X-CSE-ConnectionGUID: FwQsVO+PRkicq5DHVZsddg==
X-CSE-MsgGUID: sUJKFK02SaerOrldjMdUXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="130082835"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2025 12:02:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txW1E-0005zn-2s;
	Wed, 26 Mar 2025 19:02:28 +0000
Date: Thu, 27 Mar 2025 03:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 4/4] Diff in drivers/gpu/nova-core/vbios.rs at line
 1:
Message-ID: <202503270254.0w4VYk4U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   fe9f1c2329e9c32ae35ef006c8c786774241561f
commit: fe9f1c2329e9c32ae35ef006c8c786774241561f [4/4] vbios pcir and bit
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250327/202503270254.0w4VYk4U-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270254.0w4VYk4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270254.0w4VYk4U-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in rust/kernel/reg.rs at line 1:
    
   -
    
>> Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
    use core::convert::TryFrom;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 179:
            Err(ENOENT)
        }
    }
   +
>> Diff in drivers/gpu/nova-core/vbios.rs at line 1:
   -use kernel::prelude::*;
    use core::convert::TryFrom;
   +use kernel::prelude::*;
    
    /// Helper function to create u16 from two u8 values (little-endian)
    pub fn u16_from_u8s(high: u8, low: u8) -> u16 {
   Diff in drivers/gpu/nova-core/vbios.rs at line 179:
            Err(ENOENT)
        }
    }
   +
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
