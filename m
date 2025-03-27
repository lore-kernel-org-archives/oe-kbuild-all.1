Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDB4C7C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 00:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743035028; cv=none; b=nlO7EHQiCMy75L4CLknTITiCkUYrI4adZ82q9kV6qD3/V4cEVXO8k/dzYEqBM043nI65zVXKeGeioOigD88P06sCxdS330e85Q+HTfeFPzdH0R4sFiAQueXma8FR/QJoMO8vuEro2TrgrVBDUq2FKE4n+0XBKfBtMfx2oRtdMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743035028; c=relaxed/simple;
	bh=gfhAVjycjc86jv3L6bd3lQCTQx9jIN5OSGi4CVpOlVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUAASbNCJAthPwd9Wz43NS78Moc/MvhPN6HXB7xoctbIy5LhfxCQYWndPnQrPfGE0hunpH5vQH1jYYwTR1sd9t8fiMGQfmIKBcDWEFmQJG8Ikq6yWkDgjdwVk0g/PCUh9OJ67cCK0KBOjzwhk8Vxa8cj95ShjZdtvpyYj/x9kqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtAU/aw/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtAU/aw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743035027; x=1774571027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfhAVjycjc86jv3L6bd3lQCTQx9jIN5OSGi4CVpOlVc=;
  b=KtAU/aw/1vP/MkxYhI9Kkm36g8AbjxIiI6tXGpnN9H8b7fxewXzEDp9j
   q6HbMrD79AyNBPW2ZqfQ4Xf/djVou1HhF2dATWuO8IrQLGKIv0UYfQAaf
   jHYf82NVJOeb4fdqndsicdExfpuWTBS2cx+Sx013p2czFIhb8xpK3XQeK
   gMOLZ0mPLLtAtuuJ5bu4ANKnrIuuQhiohCCxCg+tj55ycTtVn1KT4x2ql
   m4myAfzc+JVE7XfY6vcIGWMZ3JX/Fj4Of/6hHZz7rwUOEeYPFMdUUaxmK
   5lrEuS2c2xzJ4wmXGFZ2nUFojcBByIFq6fMc5PA8MwIFk5e4r3ALmwdS8
   w==;
X-CSE-ConnectionGUID: a1lL6ofrTBuApf0Np7yiIA==
X-CSE-MsgGUID: 9EyydLaKTZicpJfKAQGDYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44071997"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44071997"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 17:22:57 -0700
X-CSE-ConnectionGUID: JCpq/iMNQnqeehzPFYDG6A==
X-CSE-MsgGUID: qTFy/5p4QCKP7H1fF/yR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="130070586"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2025 17:22:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txb19-0006Dn-0h;
	Thu, 27 Mar 2025 00:22:44 +0000
Date: Thu, 27 Mar 2025 08:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
Message-ID: <202503270730.qlrkmZkU-lkp@intel.com>
References: <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>

Hi Tamir,

kernel test robot noticed the following build errors:

[auto build test ERROR on 28bb48c4cb34f65a9aa602142e76e1426da31293]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/rust-retain-pointer-mut-ness-in-container_of/20250326-081159
base:   28bb48c4cb34f65a9aa602142e76e1426da31293
patch link:    https://lore.kernel.org/r/20250325-ptr-as-ptr-v7-7-87ab452147b9%40gmail.com
patch subject: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250327/202503270730.qlrkmZkU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270730.qlrkmZkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270730.qlrkmZkU-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/uaccess.rs at line 356:
            // kernel pointer. This mirrors the logic on the C side that skips the check when the length
            // is a compile-time constant.
            let res = unsafe {
   -            bindings::_copy_to_user(
   -                self.ptr as *mut c_void,
   -                value.cast::<c_void>(),
   -                len,
   -            )
   +            bindings::_copy_to_user(self.ptr as *mut c_void, value.cast::<c_void>(), len)
            };
            if res != 0 {
                return Err(EFAULT);
>> Diff in rust/kernel/uaccess.rs at line 356:
            // kernel pointer. This mirrors the logic on the C side that skips the check when the length
            // is a compile-time constant.
            let res = unsafe {
   -            bindings::_copy_to_user(
   -                self.ptr as *mut c_void,
   -                value.cast::<c_void>(),
   -                len,
   -            )
   +            bindings::_copy_to_user(self.ptr as *mut c_void, value.cast::<c_void>(), len)
            };
            if res != 0 {
                return Err(EFAULT);
   make[2]: *** [Makefile:1817: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
