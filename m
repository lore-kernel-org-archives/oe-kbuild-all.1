Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B8676026
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769872099; cv=none; b=rRqSbB2V74op9lPXFNU+rXAyO26CGbM2DwZB9NWNnz/HC4DOVQeU44nHo3rRZjnywfMF6ZWD46qwuRx6T/TaVw6fVFbrSfJjcROjZxt76NRUquvMLyCDTQGMVPyr6Vjlv21VeR5h35oR/JXbgx86Lw6kFs3hDN2Fv2z8rJe3r80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769872099; c=relaxed/simple;
	bh=O4Wwx5Gh08o96LDdbdkLIU3Zh+Foicgxex47OwKwAZY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzmmWXl5zBqNfwQLuYD3+WH0bk0ADmv3sVvxmcnvm2S5mnkp8FlqBpIRmVGKCXyT/qgf6CUchPzOT7Uaarn1MOY+1k9ZVZ71nOFn0IdkD4knDkZFgTsfsGgKfEqKnEwVr6SmMY7fBD6W0eC52HqaekpCpexiLqYrcanFvN6N1I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QutPYRCq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QutPYRCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769872099; x=1801408099;
  h=date:from:to:cc:subject:message-id;
  bh=O4Wwx5Gh08o96LDdbdkLIU3Zh+Foicgxex47OwKwAZY=;
  b=QutPYRCqw+npbJ+2W0J2IVvcsBpvZVSjMRLcjP25dzCyw2y8fsEu2AB0
   3nWIZCie4dvT84YnPb7dRiNTCDdSrTIuzCy7yCQtSSrOUDTZdTdTmVlsc
   xK+UaAfepQH9LztEBWjY+W9FGqg05YhN824BcP1GQpsQYyjDY4SnMnGsI
   vt2bVH95yQUM93iOA1H7kHokgh/v3gK3qZVaU+MOAhOmAn8kk6SuY8eQp
   r8WAGDAS4a5afw35xjNnWLfjUoSHj6v5J4RPNm8JQGomF4W6tj7R0dDIv
   eMU7qbJJQqjEOolaBqOzP1seZAxaH+meaHN6OEON7PUgKCJIV1emK8c9x
   A==;
X-CSE-ConnectionGUID: 382GQLFWSEmyKBTPQssRSQ==
X-CSE-MsgGUID: ZQp8LexBQzCraGJ6yXDViw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88673927"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="88673927"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 07:08:18 -0800
X-CSE-ConnectionGUID: L0qOlxbzRVGYbVFkqLVrOA==
X-CSE-MsgGUID: gVl0zxLGQ6ecmDDi4GlSrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="214028272"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Jan 2026 07:08:17 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmCa6-000000002iP-0FWL;
	Sat, 31 Jan 2026 15:08:14 +0000
Date: Sat, 31 Jan 2026 16:07:59 +0100
From: kernel test robot <lkp@intel.com>
To: Zijing Zhang <zijing.zhang@ry.rs>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in drivers/gpu/nova-core/vbios.rs:1068:
Message-ID: <202601311630.eoGwXUug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zijing-Zhang/gpu-nova-core-vbios-harden-falcon-pointer-parsing/20260131-192421
head:   ccec3ef022b173ed65b91419e794ff51217326b2
commit: ccec3ef022b173ed65b91419e794ff51217326b2 gpu: nova-core: vbios: harden falcon pointer parsing
date:   4 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260131/202601311630.eoGwXUug-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311630.eoGwXUug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311630.eoGwXUug-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/vbios.rs:1068:
            let falcon_ucode_offset = self.falcon_ucode_offset;
    
            // The ucode data follows the descriptor.
   -        let ucode_data_offset = falcon_ucode_offset
   -            .checked_add(desc.size())
   -            .ok_or(ERANGE)?;
   +        let ucode_data_offset = falcon_ucode_offset.checked_add(desc.size()).ok_or(ERANGE)?;
            let size_u32 = desc
                .imem_load_size()
                .checked_add(desc.dmem_load_size())
>> Diff in drivers/gpu/nova-core/vbios.rs:1068:
            let falcon_ucode_offset = self.falcon_ucode_offset;
    
            // The ucode data follows the descriptor.
   -        let ucode_data_offset = falcon_ucode_offset
   -            .checked_add(desc.size())
   -            .ok_or(ERANGE)?;
   +        let ucode_data_offset = falcon_ucode_offset.checked_add(desc.size()).ok_or(ERANGE)?;
            let size_u32 = desc
                .imem_load_size()
                .checked_add(desc.dmem_load_size())
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
