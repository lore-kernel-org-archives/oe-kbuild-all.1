Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E627603C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767892034; cv=none; b=KMsMonFdlU0DKdO+bpCTjiUSNmpc+YXWLgTPaa537WIzLxkpdzXXlJUxLnnV6RcwLN+Z/wN1i9Fr60wHNYMIOQvuEYYAMYsiPpFGnJE8zLEE7XinujKcgZi2U67KxiIEEUcxhlhv2SGnjZOEHFp61kLvwItVWx9Mfp8SqBENAmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767892034; c=relaxed/simple;
	bh=reWeaTenqsgVPSAuN/p0xsgke3iK1nQX07G1gLwJKDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZI5GjQIDgul3axy7PODJDAmsn+1GnDjPYtGd6v3Dzvw9Uqt6mak81v1uKNLtY+eDl1w61qSOLP0haDYlDQ998LfischszDJasxm+h2tSnm4CDVpI8wAklcdsAGkinqco5cXv4KdOhH+rSMJtG5t+0Mp8ZC47fWxCj0FW1AzM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOcqV6jf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOcqV6jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767892033; x=1799428033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reWeaTenqsgVPSAuN/p0xsgke3iK1nQX07G1gLwJKDg=;
  b=FOcqV6jfmYr8v+jRKR7rEfUrNbnzGF+bes8f0QCvrn9TEsFl1w7dZqLS
   QZkhKG1dUDnNIJAiaOOftXJ/+1VlqfCoeJ+wQeGJW4sibj4uMrwMMeo4A
   c3FNuSo/KWeSTCnjC67QLqVncP9w0+CYoXbzctV75J+MlkCT2W4E7cDXb
   pSl6tOJdkUNmHkuu+9gX8oLYvoD+gBGUGI286uuUsqXzRefDfub7UIzbu
   ///Z0OGVQ5+BV+xN0UfnmGQ5CQ/YEB6rU1hdqdnR67Olw6Akw3vT9FNFl
   0TKP/qa6e39TKnneZsCXA5gHrOhklSW7VErCjp2BIgJNbDsEe/Ei/7SyI
   g==;
X-CSE-ConnectionGUID: IEZrkhO0Rti3nucUd8qymQ==
X-CSE-MsgGUID: NRYqvRVeSn2A0OkvWGFQFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="94745673"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="94745673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 09:07:12 -0800
X-CSE-ConnectionGUID: tpm0TJ/TQU69Xo/G5qg6aQ==
X-CSE-MsgGUID: orN5TIY/QoOP8UHMlI8U1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="207793345"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Jan 2026 09:07:12 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdtTY-000000001pE-3v5U;
	Thu, 08 Jan 2026 17:07:08 +0000
Date: Thu, 8 Jan 2026 18:06:43 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 05/11] rust: macros: use `quote!` for `module!` macro
Message-ID: <202601081843.m7Igjcoh-lkp@intel.com>
References: <20260107161729.3855851-6-gary@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107161729.3855851-6-gary@kernel.org>

Hi Gary,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-pin-init-internal-remove-proc-macro-2-and-quote-workarounds/20260108-020315
base:   9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
patch link:    https://lore.kernel.org/r/20260107161729.3855851-6-gary%40kernel.org
patch subject: [PATCH v2 05/11] rust: macros: use `quote!` for `module!` macro
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260108/202601081843.m7Igjcoh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081843.m7Igjcoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081843.m7Igjcoh-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/macros/module.rs:142:
                let param_type = &param.ptype;
                let param_default = &param.default;
    
   -            self.param_ts.extend(quote!{
   +            self.param_ts.extend(quote! {
                    #[allow(non_upper_case_globals)]
                    pub(crate) static #param_name:
                        ::kernel::module_param::ModuleParamAccess<#param_type> =
>> Diff in rust/macros/module.rs:142:
                let param_type = &param.ptype;
                let param_default = &param.default;
    
   -            self.param_ts.extend(quote!{
   +            self.param_ts.extend(quote! {
                    #[allow(non_upper_case_globals)]
                    pub(crate) static #param_name:
                        ::kernel::module_param::ModuleParamAccess<#param_type> =
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
