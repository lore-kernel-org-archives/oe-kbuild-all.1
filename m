Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BFE25CC40
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 03:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764644764; cv=none; b=joHGIQde8cMRynr8hjIkHLK4z1TAefFN2wda3NWgUvRUbNyP0v+AMLn62KJf7Qfg7UlJl2a4mf2xbViqsDeEpxIvk9+r6Jg46BDbWG0MSPbFFW+vf4XmcPZQ43Qfg0XddQb+4VDa8qJHmYdlrz/d1eWvTetHs4X4bAuUV1uU0DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764644764; c=relaxed/simple;
	bh=CC6yt3msoS4Fi7vSn0SKqLgnBKAY+5qX6AwKLYoRbTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YxAlCIwUjeqS5k2UQqTyQnGiHrelteO3SqL8MbyURvzvSOTPf/LgDlWR/sJ7EAtKW+0j4Em9wwrIIqf1lL97rPjphUzIFCqAVzuVsYJwY1BAuJiYgAU8v+NzMWoT0uS3/xkfQc1Gva+sKC6jaRNB96pvodF2EBhq/p29QBNX+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1fhNLwQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1fhNLwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764644763; x=1796180763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CC6yt3msoS4Fi7vSn0SKqLgnBKAY+5qX6AwKLYoRbTc=;
  b=c1fhNLwQyQd/MHpf3imp3QEN6S6pqogO5PG4zPucZe17xYmYAJbQ+cC8
   d1S/daJwKfjJtXERvagoxUnagddBlFvCMNLcV0OQ/qwrEJC6BUVAoZLFY
   y7TwjTlp84aocfRSNwpeRfORKD0EsAp4RRyq2YPvwcPmN0xuCv7Uj/7qa
   YQ+e3hyKWlvMtOQcKB24W9vTiNgUcsdvw48DflvfqIat0tPwmSl/6CdNh
   uHd8Thrr+utv/8fRwHaCnxC3bBx4BdeBYujMujiRf6XtsglbvoL/s/Dhf
   9bL3uJ+WXfE0tQNwyCEbdYZP7PPvI4+w5wexJ+Gb0D9MPwSum6v6c0BYa
   Q==;
X-CSE-ConnectionGUID: X5U1JAL7Q++dTDbHV7wbgw==
X-CSE-MsgGUID: rOUPRhEvRGirjW1c2NlpAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89249735"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="89249735"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 19:05:54 -0800
X-CSE-ConnectionGUID: J917mVnJTqy4lClq8lTVCQ==
X-CSE-MsgGUID: +VY5TZJjT5aDNj6acE0Qpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198453104"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2025 19:05:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQGi6-000000009MU-2J3C;
	Tue, 02 Dec 2025 03:05:50 +0000
Date: Tue, 2 Dec 2025 11:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: error[E0609]: no field `su_group` on type `configfs_subsystem`
Message-ID: <202512021007.njLxXEZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4664fb427c8fd0080f40109f5e2b2090a6fb0c84
commit: 446cafc295bfc0e89da94a482fe8290bd8b429fb rust: configfs: introduce rust support for configfs
date:   7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251202/202512021007.njLxXEZ1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021007.njLxXEZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021007.njLxXEZ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `su_group` on type `configfs_subsystem`
   --> rust/kernel/configfs.rs:159:49
   |
   159 | ...                   &mut (*place.get()).su_group,
   |                                           ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `su_group` on type `configfs_subsystem`
   --> rust/kernel/configfs.rs:228:56
   |
   228 |         unsafe { &raw const (*(*this).subsystem.get()).su_group }
   |                                                        ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `su_group` on type `configfs_subsystem`
   --> rust/kernel/configfs.rs:233:88
   |
   233 |         let c_subsys_ptr = unsafe { container_of!(group, bindings::configfs_subsystem, su_group) };
   |                                                                                        ^^^^^^^^
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `cg_subsys` on type `config_group`
   --> rust/kernel/configfs.rs:310:36
   |
   310 |     let is_root = unsafe { (*this).cg_subsys.is_null() };
   |                                    ^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `cg_item` on type `config_group`
   --> rust/kernel/configfs.rs:400:86
   |
   400 |         let c_child_group_ptr = unsafe { container_of!(item, bindings::config_group, cg_item) };
   |                                                                                      ^^^^^^^
   |
   = note: available field is: `_address`
--
>> error[E0560]: struct `configfs_group_operations` has no field named `make_item`
   --> rust/kernel/configfs.rs:420:9
   |
   420 |         make_item: None,
   |         ^^^^^^^^^ `configfs_group_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `configfs_group_operations` has no field named `make_group`
   --> rust/kernel/configfs.rs:421:9
   |
   421 |         make_group: Some(Self::make_group),
   |         ^^^^^^^^^^ `configfs_group_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `configfs_group_operations` has no field named `disconnect_notify`
   --> rust/kernel/configfs.rs:422:9
   |
   422 |         disconnect_notify: None,
   |         ^^^^^^^^^^^^^^^^^ `configfs_group_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `configfs_group_operations` has no field named `drop_item`
   --> rust/kernel/configfs.rs:423:9
   |
   423 |         drop_item: Some(Self::drop_item),
   |         ^^^^^^^^^ `configfs_group_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `configfs_group_operations` has no field named `is_visible`
   --> rust/kernel/configfs.rs:424:9
   |
   424 |         is_visible: None,
   |         ^^^^^^^^^^ `configfs_group_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `configfs_group_operations` has no field named `is_bin_visible`
   --> rust/kernel/configfs.rs:425:9
   |
   425 |         is_bin_visible: None,
   |         ^^^^^^^^^^^^^^ `configfs_group_operations` does not have this field
   |
   = note: available fields are: `_address`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
