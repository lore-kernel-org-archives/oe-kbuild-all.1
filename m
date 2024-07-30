Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE7318A92A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722334237; cv=none; b=CPmwTwnXHW6pNHfR0fCJqfSPoycaWlS2jmDPNqsLHLogcHWw4EsN2wHF2HhH4INYuBMr+laiGLEXX7vqurtS2SRNnoHvgymhn8s9HFLHnIZDsdLpBWU0IU9cN0XfBQI6MSjbzQXVP4DBlvja8/5BLONHAL5VXdxleeLyccvgg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722334237; c=relaxed/simple;
	bh=tYHEt6aQ/dIq7kqRNgqwKHlKYJyE+wQ8PEJdg6uzXP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sgb0jlnnSKs+x4XHG/7KwlqNNnhoMQz01XvT98PW4/Aq2VGGsRiYIH69q49blb7QuPO4ojqg3kG4y+0PrEWm4IxCJe2IaMGl9z8Z/8rhIt3bjNW/T6dd8YYzYEJJchbXNFwIXkMQK7U2tJSFoqxpYVCuANbaS8Tk+WID2o8pmoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1usnJ50; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1usnJ50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722334235; x=1753870235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYHEt6aQ/dIq7kqRNgqwKHlKYJyE+wQ8PEJdg6uzXP8=;
  b=L1usnJ50PhRgsL6Xe0JEkzMMthelSL5pxmzH+iXMugBKo73I1c8DMLZt
   +lKFDvhfdO/HEw0D5ySDoitr0UQ2JF1pgkvoQ45CeUpu37WnhpCb/FO1A
   5ZbbVBy33q4uQpHFBcMoEBk25aT7x3hV0rqLs4DoVlR7ci1miWTxA5wvR
   xNM1f2ENHPxVv8vs4NEJGETeGPy6MWevztSMymRe5nF+2W/58/Wqmu5o/
   ou3+K3RV205Ie85l/fujFyiRP5mmQRaICZR5Rb9Hx89ejCMh5IBiVmEql
   DX2pSi+GO+pW4d836eGLY0+Rea/irTEYSYwJn7RWkbvkLHtrzsV6hhIlo
   Q==;
X-CSE-ConnectionGUID: +lMbK50GRFmE3Svmmp3LxQ==
X-CSE-MsgGUID: dvvhxiDvR4+KYq53HhLzJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31286772"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="31286772"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 03:10:34 -0700
X-CSE-ConnectionGUID: 3TYbmAXvTEymZg87UciF0Q==
X-CSE-MsgGUID: pZMg2QQGTPiTU2/+UfvBPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="53995688"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2024 03:10:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYjoM-000skK-2z;
	Tue, 30 Jul 2024 10:10:30 +0000
Date: Tue, 30 Jul 2024 18:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:asahi-wip 1060/1158] warning: unsafe impl missing a
 safety comment
Message-ID: <202407301818.PCzhKoJf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   15b881fcbe5bdc0bdbfa1a22cc1adc38ad484e30
commit: c1a65f4ec22c4985b3462675d434f080fbe8fb76 [1060/1158] fixup! rust: of: Add OF node abstraction
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240730/202407301818.PCzhKoJf-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301818.PCzhKoJf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301818.PCzhKoJf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:435:1
   |
   435 | unsafe impl FromBytes for u16 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
   note: the lint level is defined here
   --> rust/kernel/lib.rs:25:9
   |
   25  | #![warn(clippy::undocumented_unsafe_blocks)]
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:447:1
   |
   447 | unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:468:1
   |
   468 | unsafe impl AsBytes for u16 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:469:1
   |
   469 | unsafe impl AsBytes for u32 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:470:1
   |
   470 | unsafe impl AsBytes for u64 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:471:1
   |
   471 | unsafe impl AsBytes for usize {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:472:1
   |
   472 | unsafe impl AsBytes for i8 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:473:1
   |
   473 | unsafe impl AsBytes for i16 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:474:1
   |
   474 | unsafe impl AsBytes for i32 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:475:1
   |
   475 | unsafe impl AsBytes for i64 {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/types.rs:476:1
   |
   476 | unsafe impl AsBytes for isize {}
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
