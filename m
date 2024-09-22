Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740C7EEC5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727041935; cv=none; b=jALlhfRW1Zn2Y850svAIKFJtNm1O7fG6XjPXhytz9uAUnTGbQesWdDTljyaxJkNYmAtV8/R/s5W22j+qk9GthsZZL7v0dxB8qmRqXMxUhUhXtqi775xn36zbDgWdl1SJy4pu+FLBrGeM5nqVNqHta+75G/xbUBFDnMHFr37bvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727041935; c=relaxed/simple;
	bh=FhGgwt/FFFMe/g1Rlx+4ya4kf1FT/nMdWHDoJU3hhQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJKG0+jo4CE06Xk16aaEJudv4URM8ifdZQ0tfAH332P6IhigygQwJR6fVjHrfEh3nJa7HEUa338ZQOkuk+bopffx/WJBythwnXl1FfEBHME6xKfGsMM5LBLdZ+XAsSbn5pws0Q2duJ7E/IU9yiOc4NA4ZI4xgjGrj2nY/0mT5Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yt+UtbKW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yt+UtbKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727041934; x=1758577934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FhGgwt/FFFMe/g1Rlx+4ya4kf1FT/nMdWHDoJU3hhQI=;
  b=Yt+UtbKWpWEe3uA0r6gn1hwsFMrRL5IWb64+rEQ+6r3IlYZ2we3zhaGK
   ku/ZmhTrijXk1Vb/byOiifHkYcj8bzTHt32tTaH7ejueRRHo63kHF7sJH
   ckhV6iL8k708VEbJmMAk4KaUp2Q3zs31KFkN8bWneYo2zb+9n5kQQiwT5
   A3WdZSLC6q/V8MvosYKxUxgVwwqXYagJFILqi0EDhTIr35LTToTy8zezA
   2DzptCBHdRoIQW1YjiXU8k8VbodLwcT7cDpiy65crC75z7nQcnoBZ91Jj
   lZZOfeV/1SULi53Vkhz5+wFfx6Q7iHjuh3rtywXCoKe148qrjhSpmWY9a
   Q==;
X-CSE-ConnectionGUID: IwV6q7KJQiKRDgqaDTVloA==
X-CSE-MsgGUID: pIoE94SXRzuhg30m5U8RNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25804764"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25804764"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:52:13 -0700
X-CSE-ConnectionGUID: pWeOu6aSR4S6nnOj0/1ExQ==
X-CSE-MsgGUID: ZymA+UzaTmKkcOyErkz+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70876408"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Sep 2024 14:52:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssUUz-000Gga-1i;
	Sun, 22 Sep 2024 21:52:09 +0000
Date: Mon, 23 Sep 2024 05:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:rnvme-device-id-without-macro 1/1] error:
 `core::mem::MaybeUninit::<T>::as_mut_ptr` is not yet stable as a const fn
Message-ID: <202409230552.kuk0QwBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux rnvme-device-id-without-macro
head:   c2e2bb0c0ced07e4133c2353d87bf238cba96ca1
commit: c2e2bb0c0ced07e4133c2353d87bf238cba96ca1 [1/1] DeviceId without macros
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240923/202409230552.kuk0QwBP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230552.kuk0QwBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230552.kuk0QwBP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> error[E0658]: inline-const is experimental
   --> rust/kernel/device_id.rs:57:28
   |
   57 |         let mut raw_ids = [const { MaybeUninit::<T::RawType>::uninit() }; N];
   |                            ^^^^^
   |
   = note: see issue #76001 <https://github.com/rust-lang/rust/issues/76001> for more information
   = help: add `#![feature(inline_const)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> error[E0658]: inline-const is experimental
   --> rust/kernel/device_id.rs:58:26
   |
   58 |         let mut infos = [const { MaybeUninit::uninit() }; N];
   |                          ^^^^^
   |
   = note: see issue #76001 <https://github.com/rust-lang/rust/issues/76001> for more information
   = help: add `#![feature(inline_const)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> warning: unused import: `core::marker::PhantomData`
   --> rust/kernel/device_id.rs:8:5
   |
   8 | use core::marker::PhantomData;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> error: `core::mem::MaybeUninit::<T>::as_mut_ptr` is not yet stable as a const fn
   --> rust/kernel/device_id.rs:68:17
   |
   68 |                 raw_ids[i].as_mut_ptr()
   |                 ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: add `#![feature(const_maybe_uninit_as_mut_ptr)]` to the crate attributes to enable
--
>> error: `core::ptr::mut_ptr::<impl *mut T>::write` is not yet stable as a const fn
   --> rust/kernel/device_id.rs:68:17
   |
   68 | /                 raw_ids[i].as_mut_ptr()
   69 | |                     .byte_offset(T::DRIVER_DATA_OFFSET as _)
   70 | |                     .cast::<usize>()
   71 | |                     .write(i);
   | |_____________________________^
   |
   = help: add `#![feature(const_ptr_write)]` to the crate attributes to enable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
