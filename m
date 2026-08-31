Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9314A3A4F58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158066; cv=none; b=sQiuldDPysMS7EOavuvoK//7nDyY/9ratQykPUmvJS7MV8inQLxKv6F6yewTKXiMMBzVIBph8MkltTWEdD4wcrPDi0QBZsiVDTJvMu4W5fGeq3fuh7C42z3ZS2EMpqLrEo4VQD9VKJ7wZrRHjRKdS8THNqr/OTAeaUR5uhfx8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158066; c=relaxed/simple;
	bh=HhhVQNxRRiM72gSG0MGQk1S6xKE8WoGmOeN+VOqpMh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HpEFkid2y3U67Ur+ZYYWFRNuc2GMmCeG6XRXnd95ZYpQbn2oF6/oFLDPzgX6Drq+YO8pC1o27CBW2lufnefmI6LYzPA8d+ORYjC6C++EHOpyV2np+b7g0VZ6cunmdNVJSUMY8TtUJjsZ3WuRsGeKx0Sfow2HbVFwUAApE7rILMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKFxhmI1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKFxhmI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788158064; x=1819694064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhhVQNxRRiM72gSG0MGQk1S6xKE8WoGmOeN+VOqpMh4=;
  b=FKFxhmI1a4QgiwAxlZ4BXpooJ5SL6CC+f+qE6+1c6FZ+NhggSxuy3Prd
   yPabdTPTt6Hl67CVFHqXoh4h9iDA8FnsyKHgNkdcC9QMbX0IOMhgrNY8n
   6c88byZWed97xZvPXubq9ksiFQ8f/sLLfzmIFKrupJD6NMaR92LJRJAyg
   TjxYU2WqUk+vBLTsGy7k9U8O5FIcwEwV/f0+BCuGRZWENCGchirdhsDFc
   REK1pcBqHK6DreLRZMe/t4Cd70b1FSn8+MpYg1AalzwceMfbeb9CIRj9a
   uoL0Sht2UQu8ZA1ftSeFo6mgEuRHz8msC84V2s6JJEDyuNbIB4GmtmI6W
   Q==;
X-CSE-ConnectionGUID: oBXXOQ+JRJObTumxqaaTBA==
X-CSE-MsgGUID: +nqBMga8R4WKk3aGjrl81g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88317386"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88317386"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 23:34:23 -0700
X-CSE-ConnectionGUID: DwPgTQw7QOGGPv1JssLGRw==
X-CSE-MsgGUID: /+L6tBqrTpqFqwuQOnD8Bg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Aug 2026 23:34:21 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0vb1-000000000Ql-2F4U;
	Mon, 31 Aug 2026 06:34:19 +0000
Date: Mon, 31 Aug 2026 08:34:04 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 15/26] Diff in
 lib/vdso/check/vdsocheck.rs:41:
Message-ID: <202608310810.SCyLJWK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-absolute-reloc
head:   9df12e491e28d74ac27d382915c11e6675d9247e
commit: 978b910a0e9d188e9d4752dd43ae0a32972a5998 [15/26] x86/vdso: Enable the vdsocheck tool
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260831/202608310810.SCyLJWK0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310810.SCyLJWK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310810.SCyLJWK0-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j128 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in lib/vdso/check/vdsocheck.rs:41:
                    bindings::R_386_GOTPC,
                ],
                ..Default::default()
   -        }.into(),
   +        }
   +        .into(),
            bindings::EM_X86_64 => AllowedRelocations {
                in_object_file: &[bindings::R_X86_64_PC32, bindings::R_X86_64_PLT32],
                ..Default::default()
   Diff in lib/vdso/check/vdsocheck.rs:48:
   -        }.into(),
   +        }
   +        .into(),
            _ => None,
        }
    }
   make[2]: *** [Makefile:2057: rustfmt] Error 123
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
