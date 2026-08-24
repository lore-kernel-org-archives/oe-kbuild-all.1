Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F6E370D7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787540696; cv=none; b=OgTYCPrhuYvPds6CvAsP/UExOe1lDoFoc1btE/TUE95JY/kGHO2C/HpyKcn5RZwkxawXQLIUW5QjhQ1Qn6kI8AphtpwQpKH0TFVVgxMUy94l/KqH9q3KSmjKbeNXjiUCfmIx+68dJbgI17T2hEkoRRa9LJeX7kmnRYKpi9bepXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787540696; c=relaxed/simple;
	bh=Yq6o13di5hWJyXRINTuWg4qvkAwj3WYmPyQ05Clpkq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RhmAleONoxpnaZwk97xCzzPNALAxyD5xa+SXtOq/5xYYevCiV2/82/nNx+EFvXEAJZDe6gd+ta8HnZGvFufhEiZRqQWKHKVHXbX4znxgTshJ3XY+hB7FgCdFRZ1xzivbnHY8fNPxIFZJsd9+wK9Qam+SVG8SUa01U8K4ET885Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj007Gs7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj007Gs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787540693; x=1819076693;
  h=date:from:to:cc:subject:message-id;
  bh=Yq6o13di5hWJyXRINTuWg4qvkAwj3WYmPyQ05Clpkq0=;
  b=aj007Gs7RIreS+iPzjYswv57piOcuOIx1/JqNXuEik0EGe0okp3bSVwn
   y/29QFSsZAPWXBY/XZOsafVHii/l5fM+haEH4QcVkuJNYlX7PktjBzNVn
   P22rKHppEV/RtS0IwU1Gi6KxMu2Escm4exqq7F/5E9wY1zSoZXrfa1VpT
   u1RnYcdg1I7iM43iak974Wusn3BW63xEBN36rDzYi9u2dvs7NCoFBNsMY
   4XV3RJSP7sTUESZbP9gcmuWHPSH9Pa5ELA+vA5ch7mP/v4LU1YwoZZOZ+
   0U88kS1vZ1qPrGNbcYQE0nxRsp1gmdEwTFTL/7Pzu3pbZfamkH5CNjiBU
   A==;
X-CSE-ConnectionGUID: QPV7UTlVTGusrCRknxaKQQ==
X-CSE-MsgGUID: ElSIhvnrToacFQIo/9ax0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91796212"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="91796212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 20:04:52 -0700
X-CSE-ConnectionGUID: bSjmrfTrQRG6Y/HgXL4+RQ==
X-CSE-MsgGUID: uXQkExtbQv+HMRUZIsLQYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="290399913"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2026 20:04:50 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyKzQ-000000000FX-1oca;
	Mon, 24 Aug 2026 03:04:48 +0000
Date: Mon, 24 Aug 2026 05:04:47 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 41/79] warning: associated items
 `zeroed` and `as_raw` are never used
Message-ID: <202608240407.yP5TrUYj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: ecfe14f109e44ec7e5bef5d696c40030aed24d94 [41/79] rust: io: resource: Add owned Resource initialiser
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240407.yP5TrUYj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240407.yP5TrUYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240407.yP5TrUYj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `zeroed` and `as_raw` are never used
   --> rust/kernel/io/resource.rs:83:19
   |
   81 | impl Resource {
   | ------------- associated items in this implementation
   82 |     /// Create a new zeroed [`Resource`]
   83 |     pub(crate) fn zeroed() -> Self {
   |                   ^^^^^^
   ...
   90 |     pub(crate) fn as_raw(&self) -> *mut bindings::resource {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
--
>> warning: used a field initializer for a tuple struct
   --> rust/kernel/io/resource.rs:84:9
   |
   84 | /         Resource {
   85 | |             0: Opaque::<bindings::resource>::zeroed(),
   86 | |         }
   | |_________^ help: use tuple initialization: `Resource(Opaque::<bindings::resource>::zeroed())`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#init_numbered_fields
   = note: `-W clippy::init-numbered-fields` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::init_numbered_fields)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
