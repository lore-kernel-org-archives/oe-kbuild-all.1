Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C02222DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010230; cv=none; b=Hvho5lV6eRkE2RTh2mScRxYVDygDmIHHDmJsO+eLKPMMmFMMiNgMUWdtikBbr7BVwzbVMG0GU7jpNxtv7WZoICluVJd1rTKLaq6b6sfyJElB5OpKf5KDT1Szo/dIMrJQNsKp0iTCW0I801wo6rIjg/yvp5YXOJYK8z6r21R3woY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010230; c=relaxed/simple;
	bh=Mbm+u3QizKBZ40iFAnVyDC65anxDLftBvvbQxnugJVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB9Qij9QZRgtmYCs8KWHYhrACaItJ0GecrZoQVNzjvLOtOXw5V1o1FPf1ilCY378kK5ioL+BFgnAg2vQO8yZySRA/i5RYfsJhZhCxP0R+phua/HkB8X6RwZeWFwVObg2UXTjQ2xGi6RAinGawstq2MQp6f8fTz6lWhxgEf8A84M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFCgjXZj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFCgjXZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743010229; x=1774546229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mbm+u3QizKBZ40iFAnVyDC65anxDLftBvvbQxnugJVg=;
  b=VFCgjXZjxcffpIxyJJ33wR4jJl3xSiOz8uR+AVCNo5cGnIIphO/yhG4C
   Vn0U0fFjwauGcMEb7gFsIY3wGibIMr/baBjiDhmDEZjJhyjeIk7aGk+tr
   6HzeoDNR2vl/ClBRaM6Xkpnh4Qz5beE8mw3s62jEYKvlJL4y/3n9chTqu
   FIiTV+DK80qky+b92mp8mEsHlYGVCwc9kz/U1+Hw+6VdWOZRvirPzwS1U
   wGM3mi6aE7hELONbvX1AnJewWy483oASYcH6/qxAf/cTrcbqJ5oLcT+J2
   Rk7KxGaPwBirJxlfcIDmIBF4oNWqGs08WMbrbmn/06coF04b41+VUDDbs
   w==;
X-CSE-ConnectionGUID: 394nQ1muSdCRK9pXXqbGcg==
X-CSE-MsgGUID: Pj3yBYAtQmmToIMjV1as1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54963831"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="54963831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 10:29:54 -0700
X-CSE-ConnectionGUID: UIK73DulR02oLJP0y32Jng==
X-CSE-MsgGUID: /KhZetHOQU2AmYDSKiRyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="125304370"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Mar 2025 10:29:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txUZY-0005wX-1i;
	Wed, 26 Mar 2025 17:29:48 +0000
Date: Thu, 27 Mar 2025 01:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Subject: Re: [PATCH v9 2/5] rust: Rename AlwaysRefCounted to RefCounted
Message-ID: <202503270014.4G907YMY-lkp@intel.com>
References: <20250325-unique-ref-v9-2-e91618c1de26@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-unique-ref-v9-2-e91618c1de26@pm.me>

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4701f33a10702d5fc577c32434eb62adde0a1ae1]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Mangold/rust-types-Add-Ownable-Owned-types/20250325-200247
base:   4701f33a10702d5fc577c32434eb62adde0a1ae1
patch link:    https://lore.kernel.org/r/20250325-unique-ref-v9-2-e91618c1de26%40pm.me
patch subject: [PATCH v9 2/5] rust: Rename AlwaysRefCounted to RefCounted
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250327/202503270014.4G907YMY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270014.4G907YMY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270014.4G907YMY-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/pid_namespace.rs at line 9:
    
    use crate::{
        bindings,
   -    types::{AlwaysRefCounted, RefCounted, Opaque},
   +    types::{AlwaysRefCounted, Opaque, RefCounted},
    };
    use core::ptr;
    
>> Diff in rust/kernel/pid_namespace.rs at line 9:
    
    use crate::{
        bindings,
   -    types::{AlwaysRefCounted, RefCounted, Opaque},
   +    types::{AlwaysRefCounted, Opaque, RefCounted},
    };
    use core::ptr;
    
   make[2]: *** [Makefile:1816: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make: Leaving directory '/kbuild/src/consumer'
   make[1]: Target 'rustfmtcheck' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
