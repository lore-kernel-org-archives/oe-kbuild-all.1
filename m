Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16291A9FB7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758442370; cv=none; b=ufR6bUd9DDNQJjUhZAEk10hRwobWGPc+MaQ1Iz2Wp87CEAIry1c2XYk9J+jeFVrrI+ZsBOdYm7skHMzWTEBS0YLPU2IdkPlekiOa5HgEYuZ1Hfsc8/izFwMG6GseAFyLaC2TACvaoQmnybNcjn0zrx/kqejG9S8yEuW2Zzsdiro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758442370; c=relaxed/simple;
	bh=hWG3JZg+c5pXoeICM3DdfgNv6hASmYCq/2v3gspQlpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5M9yuQDq8VnzYpnAfctXX/JATnh2XJyB2j0Uxgnbwp0mnsh4tAkc0GUaPtbdLJL7WuuOKQHN/6asXElMTZLOox93vezdRkAPkSOpnRgoVSRnXML/m9/4kySSAIJxhghhNy/rLLyn0I9KE+dVMV8MS7GQxhjZlCXPuo5E2N+i0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dm7gOesd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dm7gOesd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758442368; x=1789978368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWG3JZg+c5pXoeICM3DdfgNv6hASmYCq/2v3gspQlpw=;
  b=Dm7gOesdOXkz9p49GHk+dxJ5evZJt4wcJDg0t9YyjJyeUXufSx9GsgCX
   VBthMZ8OZMhB4X4nMVtvNEeEHnef4sGyj/Nlcgi+mEP/gFo+r/72B5UEI
   zjcDD852GoGaHrCktUo2Ppfo1p+SIPajS1Hgt8xm9opEob60lG4DnBAqp
   GBrMNfz0Zo83Tg+HZ9USgfb7X5UyTLq3MeVcMbauO1hpdZOWdVSJ6bhHi
   3h7X/rQ2ThF2/pBsYUeEE+PjeQN/4LlvqivSY8YYrF/EBOlnSjHuywjE+
   sLVTsszb/GwAAn5o8izhk4CJ1O5sLvKlKJvVKTO1L3gy/YlAyCH822b9W
   g==;
X-CSE-ConnectionGUID: lvy+MSPaTJWOdpzMwkxQWg==
X-CSE-MsgGUID: qYaJ4qwWRR+IOHeemFjFqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="71412471"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="71412471"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 01:12:47 -0700
X-CSE-ConnectionGUID: NbHYYE8GRD+kV9eugBpebA==
X-CSE-MsgGUID: u1BZ/AGZTPWIAZ6JGDOTjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="175781191"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 21 Sep 2025 01:12:47 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0FBb-000000003Y9-3A5z;
	Sun, 21 Sep 2025 08:12:43 +0000
Date: Sun, 21 Sep 2025 10:12:36 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/dev-bitstruct 8/8] warning: casts from `u8` to `u32` can
 be expressed infallibly using `From`
Message-ID: <202509211019.shmVL9ew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/dev-bitstruct
head:   88ed8df883ccc4292779f4a55de116730bffbda3
commit: 88ed8df883ccc4292779f4a55de116730bffbda3 [8/8] rust: bitfield: Use 'as' operator for setter type conversion
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250921/202509211019.shmVL9ew-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211019.shmVL9ew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211019.shmVL9ew-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casts from `u8` to `u32` can be expressed infallibly using `From`
   --> rust/kernel/bits/bitfield.rs:248:38
   |
   248 |               { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
   |                                        ^
   ...
   456 | /     bitfield! {
   457 | |         struct TestWideFields: u8 {
   458 | |             3:0       nibble      as u32;
   459 | |             7:4       high_nibble as u32;
   ...   |
   462 | |     }
   | |_____- in this macro invocation
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
   = note: this warning originates in the macro `::kernel::bitfield` which comes from the expansion of the macro `bitfield` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: use `<$type>::from` instead
   |
   248 -             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
   248 +             { |f| <$into_type>::from(<$type>::from(f) as $type) } $into_type => $into_type $(, $comment)?;);
   |
--
>> warning: casts from `bool` to `u64` can be expressed infallibly using `From`
   --> rust/kernel/bits/bitfield.rs:303:26
   |
   303 |               let value = ((value as $storage) << SHIFT) & MASK;
   |                            ^^^^^^^^^^^^^^^^^^^
   ...
   414 | /     bitfield! {
   415 | |         struct TestPageTableEntry: u64 {
   416 | |             0:0       present     as bool;
   417 | |             1:1       writable    as bool;
   ...   |
   425 | |     }
   | |_____- in this macro invocation
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
   = note: requested on the command line with `-W clippy::cast-lossless`
   = note: this warning originates in the macro `::kernel::bitfield` which comes from the expansion of the macro `bitfield` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: use `<u64>::from` instead
   |
   303 -             let value = ((value as $storage) << SHIFT) & MASK;
   303 +             let value = (<u64>::from(value) << SHIFT) & MASK;
   |
--
>> warning: casts from `bool` to `u64` can be expressed infallibly using `From`
   --> rust/kernel/bits/bitfield.rs:303:26
   |
   303 |               let value = ((value as $storage) << SHIFT) & MASK;
   |                            ^^^^^^^^^^^^^^^^^^^
   ...
   414 | /     bitfield! {
   415 | |         struct TestPageTableEntry: u64 {
   416 | |             0:0       present     as bool;
   417 | |             1:1       writable    as bool;
   ...   |
   425 | |     }
   | |_____- in this macro invocation
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
   = note: this warning originates in the macro `::kernel::bitfield` which comes from the expansion of the macro `bitfield` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: use `<u64>::from` instead
   |
   303 -             let value = ((value as $storage) << SHIFT) & MASK;
   303 +             let value = (<u64>::from(value) << SHIFT) & MASK;
   |
--
>> warning: casts from `bool` to `u16` can be expressed infallibly using `From`
   --> rust/kernel/bits/bitfield.rs:303:26
   |
   303 |               let value = ((value as $storage) << SHIFT) & MASK;
   |                            ^^^^^^^^^^^^^^^^^^^
   ...
   427 | /     bitfield! {
   428 | |         struct TestControlRegister: u16 {
   429 | |             0:0       enable      as bool;
   430 | |             3:1       mode        as u8;
   ...   |
   435 | |     }
   | |_____- in this macro invocation
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
   = note: this warning originates in the macro `::kernel::bitfield` which comes from the expansion of the macro `bitfield` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: use `<u16>::from` instead
   |
   303 -             let value = ((value as $storage) << SHIFT) & MASK;
   303 +             let value = (<u16>::from(value) << SHIFT) & MASK;
   |
--
>> warning: casts from `bool` to `u8` can be expressed infallibly using `From`
   --> rust/kernel/bits/bitfield.rs:303:26
   |
   303 |               let value = ((value as $storage) << SHIFT) & MASK;
   |                            ^^^^^^^^^^^^^^^^^^^
   ...
   437 | /     bitfield! {
   438 | |         struct TestStatusRegister: u8 {
   439 | |             0:0       ready       as bool;
   440 | |             1:1       error       as bool;
   ...   |
   445 | |     }
   | |_____- in this macro invocation
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
   = note: this warning originates in the macro `::kernel::bitfield` which comes from the expansion of the macro `bitfield` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: use `<u8>::from` instead
   |
   303 -             let value = ((value as $storage) << SHIFT) & MASK;
   303 +             let value = (<u8>::from(value) << SHIFT) & MASK;
   |
--
>> warning: casts from `bool` to `u8` can be expressed infallibly using `From`
   --> rust/kernel/bits/bitfield.rs:303:26
   |
   303 |               let value = ((value as $storage) << SHIFT) & MASK;
   |                            ^^^^^^^^^^^^^^^^^^^
   ...
   447 | /     bitfield! {
   448 | |         struct TestPartialBits: u8 {
   449 | |             0:0       ready       as bool;
   450 | |             1:1       error       as bool;
   ...   |
   453 | |     }
   | |_____- in this macro invocation
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
   = note: this warning originates in the macro `::kernel::bitfield` which comes from the expansion of the macro `bitfield` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: use `<u8>::from` instead
   |
   303 -             let value = ((value as $storage) << SHIFT) & MASK;
   303 +             let value = (<u8>::from(value) << SHIFT) & MASK;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
