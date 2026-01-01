Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6D1C84AB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 15:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767281823; cv=none; b=uzDb0GgLb0Q/Ks5aJBEGGmkRZhQSSCkDMJ/DcpoY+h/SRzbuacjHTsLpOxl1s+lu7Z2RU9SPfHeem/zz8I3FVrEXZ46JnZ0k4WzSrs9Qv0FaLvsKCR1UEPrWFTbrbNDnYWerusfRNYEx7JJfS9mB38DZycVF1GEtPi/PDjj4YM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767281823; c=relaxed/simple;
	bh=vIBsE+BI3zPgJkL4yynabYos/oys7ezYznLd0uQjL8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRBEkBsB87SeVMLZgrmJT8SuavYDzXfTsy+GqBINcK0D1kBmRoIBV290PUBnQwrfDqlXQpYsGAP1u0LTP8GHPeCDc+G0qjYFalNRmqEfM2QA1dk0edcElDV6yG5BYYcOCCzlHy6pGLgVSAkOAq1UUJ2G0LPBwXUXgdGRJnhuR3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GL/a1GSF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL/a1GSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767281821; x=1798817821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vIBsE+BI3zPgJkL4yynabYos/oys7ezYznLd0uQjL8Q=;
  b=GL/a1GSFbSoOKTG44T5qfAi7HJ5APQ26talCU4bXdt9eLnAscdz6spc3
   1DDTjIZ2gYD2XlWrAQUoPrmLFXnhHG8KdiibCPjlMNkWkMniGbKieUAKs
   15064COpSYmkefTrqKF7Q4Q6D00eMxgr3bOmOTqXn3RqRZh/3I40KyKB/
   HTzhU7zRVupMeavq5BTsvRrKS8QgXFQaKmMKQFgrYwwfO6VrhUKD5tTTe
   eDLiojGhktAKkXlFHzX5TuWPP5fzoCpmBQxHP+Uf8o7oOrPcRgHDB4j4g
   UGurviqmyz64veliYtdbgWUK6+afRK5vZC4Y6BwVPZyg+pWkQ9vot41TJ
   A==;
X-CSE-ConnectionGUID: 7KAI6lr5QvSKz4byUHEn8w==
X-CSE-MsgGUID: pAGQs1RtSVSBBJ51+1ET+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="80257813"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="80257813"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 07:37:01 -0800
X-CSE-ConnectionGUID: z5NwKrzpRg6JPDUkof/BcA==
X-CSE-MsgGUID: 5fp6MqYTSoGW4kaW9uWvyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201648572"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Jan 2026 07:36:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbKjR-000000000IH-2NK0;
	Thu, 01 Jan 2026 15:36:57 +0000
Date: Thu, 1 Jan 2026 16:36:31 +0100
From: kernel test robot <lkp@intel.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/6] rust: WIP: use ThisModule trait for initializing
Message-ID: <202601011613.fA0RPZ42-lkp@intel.com>
References: <20260101-this_module_fix-v1-3-46ae3e5605a0@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101-this_module_fix-v1-3-46ae3e5605a0@gmail.com>

Hi Kari,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kari-Argillander/rust-Enable-const_refs_to_static-feature/20260101-172411
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20260101-this_module_fix-v1-3-46ae3e5605a0%40gmail.com
patch subject: [PATCH RFC 3/6] rust: WIP: use ThisModule trait for initializing
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260101/202601011613.fA0RPZ42-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011613.fA0RPZ42-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011613.fA0RPZ42-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/pci.rs:5:
    //! C header: [`include/linux/pci.h`](srctree/include/linux/pci.h)
    
    use crate::{
   -    bindings,
   -    container_of,
   -    device,
   +    bindings, container_of, device,
        device_id::{
            RawDeviceId,
            RawDeviceIdIndex, //
>> Diff in rust/kernel/pci.rs:5:
    //! C header: [`include/linux/pci.h`](srctree/include/linux/pci.h)
    
    use crate::{
   -    bindings,
   -    container_of,
   -    device,
   +    bindings, container_of, device,
        device_id::{
            RawDeviceId,
            RawDeviceIdIndex, //
   make[2]: *** [Makefile:1877: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
--
>> warning: `crate` references the macro call's crate
   --> rust/kernel/configfs.rs:1021:83
   |
   1021 |                         $crate::configfs::ItemType::<$container, $data>::new::<N, crate::THIS_MODULE>(
   |                                                                                   ^^^^^ help: to reference the macro definition's crate, use: `$crate`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#crate_in_macro_def
   = note: `-W clippy::crate-in-macro-def` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::crate_in_macro_def)]`
--
>> warning: unresolved link to `macros::module::module`
   --> rust/kernel/lib.rs:214:11
   |
   214 |     //! [`macros::module::module`]. Mechanism is equivalent to `THIS_MODULE` in
   |           ^^^^^^^^^^^^^^^^^^^^^^ `module` is a macro, not a module or type, and cannot have associated items
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `this_module`
   --> rust/kernel/lib.rs:223:15
   |
   223 |     /// See [`this_module`]
   |               ^^^^^^^^^^^ no item named `this_module` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
--
>> warning: unresolved link to `this_module`
   --> rust/kernel/lib.rs:229:15
   |
   229 |     /// See [`this_module`]
   |               ^^^^^^^^^^^ no item named `this_module` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
