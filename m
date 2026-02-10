Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6232B9BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706337; cv=none; b=gsTmTOnZpuPb7OX1/OunT2Rqs/GZjJTMoVgjMSL7zwSkhF3dUx1hQwal9MeeywxfpsO5+rMOaXhnovhRTBoZB45C96HL9DEsFk7kaO4Zwspxl3oow562Sq9SN4CaBAwtedSzmqIaha0PztWhJoASOgLzxufFvpAGFKWZEUwVIFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706337; c=relaxed/simple;
	bh=oy53PKHRy+YkmX+oypM3N1JPpSJbQ2mNJFUChkYgNG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2ygSmE8jzzbJCa10O/JMCYdPFr5NFZ+9CepL+YEQfqPQBiYXHX4q5P7uHfgedOR1ktfYAYURyihypI4M42Pvy75alStb4JgnY/Vnc1qgYQSvtIKGZLpeSDdX3gEt0KheXUIFwuD1Uhh7+yG6RPL8vxXOge1zZP0KBebzGcDfNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6hQ232R; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6hQ232R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770706336; x=1802242336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oy53PKHRy+YkmX+oypM3N1JPpSJbQ2mNJFUChkYgNG0=;
  b=B6hQ232Rrutm/j9dBZTuNhzuTgoU4/6rVlpinPl7Wb58zOgvx5xADLQ0
   EiYXqAtEie1UVnQzSPu2oVSwxm0M8SC76bAiuEGkH3+HCHAsxGs4zkuGO
   089xZD9nfVKc4BgzZ5+U/93tpj2GKZSNCL/AeiRzYzcyg5ZlSJF4FPntj
   0D/SY6/DOxH2kagLfjPe058zquQXA3TpypYRlHpSIt478NaPK4S6UPyMD
   i4g4yv4/Ch8+7XB2HUUXMgBUTH+V5rJy59TZ/x1xC9bstPGMpBBqX7dS9
   lAsLuSFJNwzKydNEsI9a6+AbJKXjIJKnFHvgvsLEsR1JTOB1VmE6oryM8
   w==;
X-CSE-ConnectionGUID: uqDw7vngSYmXEKBVLBKmwg==
X-CSE-MsgGUID: /CXWQi/4S1aHxdOM/74dxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71928102"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71928102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:52:16 -0800
X-CSE-ConnectionGUID: HmVfBsX+S3SKysfF6v+xww==
X-CSE-MsgGUID: hryxJ2f9ToWDPdiy2Ny4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216335280"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2026 22:52:09 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vphbT-000000000hV-2L0R;
	Tue, 10 Feb 2026 06:52:07 +0000
Date: Tue, 10 Feb 2026 07:51:39 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH -next v8 1/3] rust: clist: Add support to interface with
 C linked lists
Message-ID: <202602100751.ldfRitCJ-lkp@intel.com>
References: <20260209214246.2783990-2-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209214246.2783990-2-joelagnelf@nvidia.com>

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260209]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-clist-Add-support-to-interface-with-C-linked-lists/20260210-054655
base:   next-20260209
patch link:    https://lore.kernel.org/r/20260209214246.2783990-2-joelagnelf%40nvidia.com
patch subject: [PATCH -next v8 1/3] rust: clist: Add support to interface with C linked lists
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260210/202602100751.ldfRitCJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100751.ldfRitCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100751.ldfRitCJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in tools/perf/tests/workloads/code_with_type.rs:10:
    
    #[no_mangle]
    pub extern "C" fn test_rs(count: u32) {
   -    let mut b =  Buf { data1: 0, data2: String::from("data"), data3: 0};
   +    let mut b = Buf {
   +        data1: 0,
   +        data2: String::from("data"),
   +        data3: 0,
   +    };
    
        for _ in 1..count {
            b.data1 += 1;
>> Diff in rust/kernel/clist.rs:93:
    use pin_init::{
        pin_data,
        pin_init,
   -    PinInit //
   +    PinInit, //
    };
    
    /// Wraps a `list_head` object for use in intrusive linked lists.
>> Diff in rust/kernel/clist.rs:93:
    use pin_init::{
        pin_data,
        pin_init,
   -    PinInit //
   +    PinInit, //
    };
    
    /// Wraps a `list_head` object for use in intrusive linked lists.
   make[2]: *** [Makefile:1903: rustfmt] Error 123
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
