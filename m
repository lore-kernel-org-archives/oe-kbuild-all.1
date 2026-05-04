Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503E3A4F2D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891176; cv=none; b=cC/TsPqnPGIzB+EBU//ksEFwtCY7Zaz4mjT6z7J03vttmRyV2DZL0cx+5jtfURzB3IhhLwVwHcG4Uptb3/7FH2jWNjkYs1jfGJTN4iC3fy0XGOBBuq9dt9bSXqBfo4qvWSLR6wOKFvTkF1vxbJWY3K8/bXxvT0b0du766Q34dQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891176; c=relaxed/simple;
	bh=xKHwiMP9OVNekO5ZVaUyR1jiLVaa+m10QPtLg/L7M6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hAZQHSzpZsGG/Gg2DEbluN31MRLBipbUNtq+6/S7sYvZYgLPbnSpulFx41TQD+R/f9WFAeiGwI8X07qZI0q1xy3nfsPrjg+02rSkXEHjn4jMGfJAMRXILE03JJ/RsYMaugve1sKXUzz5dzUaCJAD6jtyo9GME6+Qp2NWYOxgIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJ335DrQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJ335DrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777891176; x=1809427176;
  h=date:from:to:cc:subject:message-id;
  bh=xKHwiMP9OVNekO5ZVaUyR1jiLVaa+m10QPtLg/L7M6w=;
  b=kJ335DrQdncTnPg0LLB1mwQmBwKBhhK9p5Zm+qbHvoyQizdbLROcUGJv
   Mzphdrjg2Kl7zlPp+HrlV7YIEzwoBaF4q1BIearyINqgTLNxBt8iTHKHq
   1K+r+n2YYkfvVkmdgKx9py213g3BUeJQz6ngYRZuwFsybL3AKPD2jdiKs
   MuyKBoQOsBOB9iCsDwM911S263Fkj3lPFF3P7Pf1kgYmmalWlY5sQY7R+
   7WZQO5iVGZb0Qs6cC28Ato5DlxpNh28HQFIhr7uAP8+9zOfnaXgRznbdC
   aJCIe+naTypj7w7f0xAwEVbhZ7V/teDA+qEjzDCQzKrsFr72x/USFIiYN
   Q==;
X-CSE-ConnectionGUID: VWMbqRcsQUGhwhyHJ1iHOg==
X-CSE-MsgGUID: fOZeRwFETMGGepyzWtNn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89437702"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="89437702"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 03:39:35 -0700
X-CSE-ConnectionGUID: zKjaoI27QiartVh2JZS5fQ==
X-CSE-MsgGUID: Cw4WEUORQqWBMd4km+kiRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240468295"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2026 03:39:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJqi3-000000005oj-1SWX;
	Mon, 04 May 2026 10:39:31 +0000
Date: Mon, 04 May 2026 12:38:54 +0200
From: kernel test robot <lkp@intel.com>
To: Arnav Sharma <arnav4324@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in rust/kernel/error.rs:234:
Message-ID: <202605041235.zQcg17Vh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Arnav-Sharma/rust-error-implement-Display-for-Error/20260504-141358
head:   382178c0b5936378f39857f4ed888e13a4ec5a71
commit: 382178c0b5936378f39857f4ed888e13a4ec5a71 rust: error: implement Display for Error
date:   4 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260504/202605041235.zQcg17Vh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041235.zQcg17Vh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041235.zQcg17Vh-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/error.rs:234:
                // Print out the numeric error code if no name can be found.
                None => write!(f, "Unknown error {}", -self.0.get()),
                // SAFETY: These strings are ASCII-only.
   -            Some(name) => f.pad(unsafe {
   -                core::str::from_utf8_unchecked(name.to_bytes())
   -            }),
   +            Some(name) => f.pad(unsafe { core::str::from_utf8_unchecked(name.to_bytes()) }),
            }
        }
    }
>> Diff in rust/kernel/error.rs:234:
                // Print out the numeric error code if no name can be found.
                None => write!(f, "Unknown error {}", -self.0.get()),
                // SAFETY: These strings are ASCII-only.
   -            Some(name) => f.pad(unsafe {
   -                core::str::from_utf8_unchecked(name.to_bytes())
   -            }),
   +            Some(name) => f.pad(unsafe { core::str::from_utf8_unchecked(name.to_bytes()) }),
            }
        }
    }
   make[2]: *** [Makefile:1952: rustfmt] Error 123
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
