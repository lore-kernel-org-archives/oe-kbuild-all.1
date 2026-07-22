Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289F2403EB5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 07:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705100; cv=none; b=pM28f9H3nd80Bn+JFtnhKo9Hq3ON31b/QAiGcNDOrk6tZhxk2iyKI2BFFruJYoVZRo2QD3wIqR3siI7K5cCL/MqA7Kl9CGzpCmyzKWzUDs6cCsZxw4MF/8xmEhPiszr+DGIYqZ0w1Fq++DzddGe5BdQX1jSxht1Oik6FeimR2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705100; c=relaxed/simple;
	bh=I2impT9CYqtc0d6+EABepV8LLcEx3fZ/HhnqyzIMqXs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DrUx2HBiXCyjsF9e6OMTZqqYxPWwGakBCRpuF1yKWajh65vVOGlwOXNgVnBpou5M+mm24ZqqIVxwiZ6iYUFuyPG4/JxuDjT54gIjmGFrgzIkaR+UvQbRpQWhAbHe6dRJdnenRXutBtSiBhDXF3nBdVPGDekBAlmdL24LHiAaluA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exGExnz6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exGExnz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784705098; x=1816241098;
  h=date:from:to:cc:subject:message-id;
  bh=I2impT9CYqtc0d6+EABepV8LLcEx3fZ/HhnqyzIMqXs=;
  b=exGExnz6ew4XCTenR1EDW0C6s4KoN6RC+8O3TKBBLX2vgSz6MAXr+u/l
   MIdndC1mCDOaGhmjDs0iE4aFx8A9HFnsoiqv1W6Cb7uHGWpJ5UYgJLqH7
   7MI0H3724Nird42M/6iq9kUMB5Q1sGpBNM9ixzyPhBX6HDgt6qe1bi6S9
   Pr9GQ7Rt29ICltXf1A6C+JB2CbvI242x9P27NpOhNF1c7p1YQb94Bv7CL
   g3H1BX15lYH8wRfbYeWJvSjXI2fFz2g6Xbkb4zLqgF5D1DzBkpbgw9uPN
   HlSM3e6wgww8Ta+8EMZJSoIAVUNf8OGM+8F97cPC3Ofog4Jsk3d/0fR/I
   w==;
X-CSE-ConnectionGUID: vsGRtwsHREqYXapNGHeG5w==
X-CSE-MsgGUID: R867hGkhRUGJKfiyxQaL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96849534"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96849534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 00:24:58 -0700
X-CSE-ConnectionGUID: ZUXnNQUOSZexjhhs/ipyMA==
X-CSE-MsgGUID: aaXdXc+QRwyVp5cFsfwwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="282536759"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jul 2026 00:24:56 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmRK2-000000000Fm-0ZS3;
	Wed, 22 Jul 2026 07:24:54 +0000
Date: Wed, 22 Jul 2026 09:24:35 +0200
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_param 20/21] error[E0308]: mismatched types
Message-ID: <202607220950.H3Z5brzF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yury,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/norov/linux bitmap_param
head:   2ebf9d0d17a23d79cfabad902c9bf18f47c2adc9
commit: a13ae5f39450bd51f39aa7519689c3372e8225f0 [20/21] bitmap: use unsigned long for bit indices and sizes
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260722/202607220950.H3Z5brzF-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220950.H3Z5brzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220950.H3Z5brzF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/bitmap.rs:260:52
   |
   260 |         let ptr = unsafe { bindings::bitmap_zalloc(nbits_u32, flags.as_raw()) };
   |                            ----------------------- ^^^^^^^^^ expected `usize`, found `u32`
   |                            |
   |                            arguments to this function are incorrect
   |
   note: function defined here
   --> rust/bindings/bindings_generated.rs:24157:12
   |
   24157 |     pub fn bitmap_zalloc(nbits: ffi::c_ulong, flags: gfp_t) -> *mut ffi::c_ulong;
   |            ^^^^^^^^^^^^^
   help: you can convert a `u32` to a `usize` and panic if the converted value doesn't fit
   |
   260 |         let ptr = unsafe { bindings::bitmap_zalloc(nbits_u32.try_into().unwrap(), flags.as_raw()) };
   |                                                             ++++++++++++++++++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
