Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9861A9F9B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 00:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764636292; cv=none; b=nD6buTxTc+6lBtgFx8fJk90bfC5NMeqowYAuvDFFUYm1X5u5/TqwoLyfJ1P6wVHvOXBtrfdwzGUXrAf+K4Kwr4CxzB2TaPeFvCnaAOp2KKdIvPaI0kd2oQ6kc2KZkD1JarRzn5DsSXK21atOIfe7dDSFKeHe2Ys8nB5sUcFc92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764636292; c=relaxed/simple;
	bh=dFe5jngPYYbKyZpB6tjaEm8WTwMIyWSg9yK2ot0PGdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjaKTTjWtf0rzJN0LzZ+NJPR0rvZtjN9UExIgAp7vWTaF6X+rCBZeOglQcErRCXl7hV/Nof/owuc1xZSXSxKlMXz4Lc8OlFXHVT29LeAYNizDLIK40cNjsFrkoIv6M5X3NPbgqgbxacW4eaDiM0Ol3KR8JEYi7xAqzT+kGGtur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ju3Qp8OP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ju3Qp8OP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764636291; x=1796172291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFe5jngPYYbKyZpB6tjaEm8WTwMIyWSg9yK2ot0PGdA=;
  b=ju3Qp8OPmX1G2jnMQqAyvn6PC/TCBiVSF9pIwzXaCf4LMoIORVrShG3E
   2fEB0UY0MEiwtZFFGOWLB2kAbZPnxyCuDZ2vTZBTX/0Df036PTF2bn+sN
   TluUhyMFhiyVDyfAvGFuKb+ksbSEmDz1Bs1yC3AOJV2lwqoZOxs1ZDXzD
   LNzb8jwL+j+UkiFoK5PQ0eSXBKWjJhcC9BMcTxUWxT9ztAmCL+D7IXAGg
   DMsH6wNfbKw4n8gFHsqTccLtkQ2F4qQ/8MU9mKY69U1UKVDLtyYZeyKzp
   sfioZCglZcsEBFBaXz5ye0FQm0CxPpx+sNLuAAUufHCr/WCcTv1hoJoc9
   g==;
X-CSE-ConnectionGUID: ILRQXJUEQV2fSqXHS+h5/Q==
X-CSE-MsgGUID: UsC9MK1pQxG7eM/WWBV/ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76912573"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="76912573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 16:44:48 -0800
X-CSE-ConnectionGUID: 6EyjZMNFR6GC5L4HR4We6A==
X-CSE-MsgGUID: MANPGDETSK6+tFsIjA6XAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193498843"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 16:44:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQEVX-000000009GZ-2JS0;
	Tue, 02 Dec 2025 00:44:43 +0000
Date: Tue, 2 Dec 2025 08:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>
Subject: error[E0560]: struct `blk_mq_tag_set` has no field named `timeout`
Message-ID: <202512020837.06YOmYyY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
commit: ccb8ce526807fcbd4578d6619100d8ec48769ea8 ARM: 9441/1: rust: Enable Rust support for ARMv7
date:   8 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020837.06YOmYyY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020837.06YOmYyY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020837.06YOmYyY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `blk_mq_tag_set` has no field named `timeout`
   --> rust/kernel/block/mq/tag_set.rs:51:21
   |
   51 |                     timeout: 0, // 0 means default which is 30Hz in C
   |                     ^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `numa_node`
   --> rust/kernel/block/mq/tag_set.rs:52:21
   |
   52 |                     numa_node: bindings::NUMA_NO_NODE,
   |                     ^^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `queue_depth`
   --> rust/kernel/block/mq/tag_set.rs:53:21
   |
   53 |                     queue_depth: num_tags,
   |                     ^^^^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `cmd_size`
   --> rust/kernel/block/mq/tag_set.rs:54:21
   |
   54 |                     cmd_size,
   |                     ^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `submit_bio`
   --> rust/kernel/block/mq/gen_disk.rs:116:13
   |
   116 |             submit_bio: None,
   |             ^^^^^^^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `open`
   --> rust/kernel/block/mq/gen_disk.rs:117:13
   |
   117 |             open: None,
   |             ^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `release`
   --> rust/kernel/block/mq/gen_disk.rs:118:13
   |
   118 |             release: None,
   |             ^^^^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `ioctl`
   --> rust/kernel/block/mq/gen_disk.rs:119:13
   |
   119 |             ioctl: None,
   |             ^^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `compat_ioctl`
   --> rust/kernel/block/mq/gen_disk.rs:120:13
   |
   120 |             compat_ioctl: None,
   |             ^^^^^^^^^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `check_events`
   --> rust/kernel/block/mq/gen_disk.rs:121:13
   |
   121 |             check_events: None,
   |             ^^^^^^^^^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `unlock_native_capacity`
   --> rust/kernel/block/mq/gen_disk.rs:122:13
   |
   122 |             unlock_native_capacity: None,
   |             ^^^^^^^^^^^^^^^^^^^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
