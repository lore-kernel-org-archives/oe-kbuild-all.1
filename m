Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196DF234973
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787541353; cv=none; b=JJNgn4vnzeQqPDlRa9ZXr4HJS9gHKQRaz1VflH7DcXyh4v6iKITggEs7ukwLF0muS9lnTZe+cgUzn3y5Mr7GGsXZVaJ+Kjx4bKT4vZRMus+zokuZ9jcgKPmxYGMzD7rxiQ0wTws3OCKGgcGi/2GVXocjxM63+/f3HUrEu27Yfv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787541353; c=relaxed/simple;
	bh=FT8RkqBgsoLtUZeeTOZJxCnFSgFhgxova5/dl5GEZ2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wr2F4T3vSA2StBfXY/aIh8O2QVAsuDswLeVCc5p17TzXcx9htUvFPlnzj+u1UGrLOlf9TjFR89a3u0qal5LqMPLSyPk4lzrcCb3wx48F+kWPZJoRaJiszU6ZwhSFT9ZSk4MBedDf7WpD5vjEAViR8/8bLkTepr1MiNzQFQ+ILpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxftLxIl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxftLxIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787541352; x=1819077352;
  h=date:from:to:cc:subject:message-id;
  bh=FT8RkqBgsoLtUZeeTOZJxCnFSgFhgxova5/dl5GEZ2E=;
  b=kxftLxIlen1mx/mbmFaoisPp/8PsgJx/vl2GGmQkffL9KAEI2vlcbQR7
   rOzeViWZlG2bS3XDezsJw5iPRhRuERqdbGPVd4DfNfIeP+Y+Dt7YriOzu
   aHvZD5PiE8r2P2Wz7k1dFKrXR7tivqn+b0trPRdswj9i4mVPmQZxigNIw
   QPxP7uNP8nMp0F3IqZalF+ebVjQMLDvoUNlT6ZcGZR5quZMZsBSfGir48
   X61BcKqwuBXCu5naIDhcHKDOojH9XGiQ79ff102gGlpTvtjeUNPUI/8tf
   QmMXTK9puBvcwgNnEDUYvrULtKp58co3DBeaEQnh7bFWDHtH+qRSCbC9a
   g==;
X-CSE-ConnectionGUID: m/JFC/71THGMlntSv6oaSg==
X-CSE-MsgGUID: L2RUVuCWRW2Ti4OXfw7bOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91660792"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="91660792"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 20:15:51 -0700
X-CSE-ConnectionGUID: p8zmoGSdR9ev4R3Q+NWKhQ==
X-CSE-MsgGUID: 0oWRaQHETbiCtGVIQzW6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="265581836"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 23 Aug 2026 20:15:51 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyLA4-000000000Fb-24Lb;
	Mon, 24 Aug 2026 03:15:48 +0000
Date: Mon, 24 Aug 2026 05:15:19 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:asahi-wip-7.2 640/964] Diff in
 drivers/gpu/drm/nova/file.rs:4:
Message-ID: <202608240552.om2UzXim-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux asahi-wip-7.2
head:   57124f5176e4a4ceb553942a5f3de94cb5035877
commit: 9b31038f137dc8805cf04ac8f9499b5179b34bc6 [640/964] rust: drm: file: Add as_raw()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240552.om2UzXim-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240552.om2UzXim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240552.om2UzXim-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j128 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/drm/nova/file.rs:4:
    use crate::gem::NovaObject;
    use kernel::{
        alloc::flags::*,
   -    auxiliary,
   -    bindings,
   +    auxiliary, bindings,
        device::Bound,
        drm::{
            self,
>> Diff in drivers/gpu/drm/nova/file.rs:4:
    use crate::gem::NovaObject;
    use kernel::{
        alloc::flags::*,
   -    auxiliary,
   -    bindings,
   +    auxiliary, bindings,
        device::Bound,
        drm::{
            self,
   make[2]: *** [Makefile:1996: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
