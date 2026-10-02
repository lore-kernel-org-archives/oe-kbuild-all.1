Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A230D209F43
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 03:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790913280; cv=none; b=jie0gcjYdC9lMlETAQ8U9YsrXWMjmFz7BRucmY7UBxmTXT5wTiGlbceOnqVnymeFDra9hAVQp2rpOyz6BomEmM9AOBejjztRRSZi94pnZ3Y3Z7UUt8bDJK8N+zCrV16UVJuaQUGhcrxrxlg4CqqeRU8Jnrdehh2EQFwyVp586O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790913280; c=relaxed/simple;
	bh=G0tZVo7LvJn5wDoYuNH49DtPkcBlaha9gX/RXTnIRSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Df4VDeKTtLVSPBvj3zCL9lmKst+yqi4ahmIx5k0bKOgGiHVcbqaByH68jvht1jF8uls9jTu9AkzP31K2u6yDptYR96An0CWWu2bVF5FsQ3lDzkOJWOd8gnKVC/vsfJoQAn9kW1nQJFdNRgfK5YWMGlJy9vsCgyKCScRddG69VFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwVyvpZA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwVyvpZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790913278; x=1822449278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0tZVo7LvJn5wDoYuNH49DtPkcBlaha9gX/RXTnIRSg=;
  b=WwVyvpZAo5Z3l7V5l9mORpRVryHqIi2CJ+8Xz2914AWWbg0lSm0jiWSe
   j0b664W2leC5qHUtA/ySSvyAis95fFQPlsA/QPk3wWS//xlNaYm/ODa8S
   4tcgx+WOZfYdIS+i9GorUmKrFgwk1JuMWznBbkwmM8O9UBIcdmtAsrpBs
   kOFKI5XysKyEyiz/QB6xkYAv9clEelf4lp3txlpgrNh7OozTg1OV/K00V
   NahNgR0yJvIEk2M89p8W4kMSNuSRD1BZuxPWsre8JQFrigFEYvxjcXd0L
   3wox7G4cGaglKj8aunw9M7vviO+edfwp6jiTDj3oCAP4XhHINtSFr+CkN
   A==;
X-CSE-ConnectionGUID: KPOlj2VmQWOHvTQhwStHlw==
X-CSE-MsgGUID: HgdxFVdcTkSG+59POzs0vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94394176"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94394176"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:54:37 -0700
X-CSE-ConnectionGUID: nFl5JDJkS1qi8H2PFGGXJg==
X-CSE-MsgGUID: gY6b7ga9T02LhrVyJLLkJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274246026"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 20:54:36 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCULv-000000000OZ-3ZAz;
	Fri, 02 Oct 2026 03:54:31 +0000
Date: Fri, 02 Oct 2026 05:54:24 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-kunit-assertion 6/10] Diff in
 rust/kernel/sync/atomic/predefine.rs:305:
Message-ID: <202610020520.Xb6jANEo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-kunit-assertion
head:   fbe73450cefcca4ff86e4228d44e205327d15c7f
commit: 0c121ebc74a143b8096ec774fcd95f2c438f886e [6/10] prep: atomic
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610020520.Xb6jANEo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020520.Xb6jANEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020520.Xb6jANEo-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
>> Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
>> Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
>> Diff in rust/kernel/sync/atomic/predefine.rs:305:
            let x = Atomic::new(&raw const v);
    
            assert_eq!(x.load(Acquire), &raw const v);
   -        assert_matches!(
   -            x.cmpxchg(&raw const u, &raw const u, Relaxed),
   -            Err(_)
   -        );
   -        assert_matches!(
   -            x.cmpxchg(&raw const v, &raw const u, Relaxed),
   -            Ok(_)
   -        );
   +        assert_matches!(x.cmpxchg(&raw const u, &raw const u, Relaxed), Err(_));
   +        assert_matches!(x.cmpxchg(&raw const v, &raw const u, Relaxed), Ok(_));
            assert_eq!(x.load(Relaxed), &raw const u);
        }
    
   make[2]: *** [Makefile:2038: rustfmt] Error 123
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
