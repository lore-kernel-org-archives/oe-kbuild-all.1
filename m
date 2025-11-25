Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718FB277C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 07:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054042; cv=none; b=L+lZmR71ie6K9roUFa3QtPVFmcmS0UNVEAPWE24j57fzka2YJy78NzABnj2YwoZ/sPBWJu3d3GYPBvySb6e1FIoYeJ7t6eWnLyDWZXf8DrZ/kacICM0FwzvWNKLMQDp6mpttt/loE1BQU7Nw0XC8ZJE2VurcOfeCOur910q2So8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054042; c=relaxed/simple;
	bh=nOIgoLDFKM7g1XzILosrVfRJ2LM9zJyXdWGfk1wSySU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXPNLiQLYGq02c0qA+9quKVMe4/op6tK9HVU4vxKhjxtR6a9kQBAQvEAXTlNCjsTICwkgMUFSnJaU808SqOSUIqY4RC49FwF9rJDmOoqThaDg+7x/VdRXBebagnOqqxa6jxdzNNHnr3of59gScXqcqX1jJUOZn/49GPVRCNAW9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rtb27BkF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rtb27BkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764054040; x=1795590040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nOIgoLDFKM7g1XzILosrVfRJ2LM9zJyXdWGfk1wSySU=;
  b=Rtb27BkFVKlD+LW5ZDY3P0S7bFHG5tx4F4lMRt07q6tWYN7f2TVi89jT
   iQK/DL1J8qD+duRp4wstd7ZuKWb0MwkDnFYbEDzrXOl5CFKO860ODehSU
   qS7vbc94QyVw+OuhXlipsw8fitzWmBEkb/JCEPt0G51sUtwRZs1nmGC+V
   qKtOPZZz94xKmymcxjIo50vowPny1LE2X3CsMiD9WP3USvbLRsyc1QWJ4
   WPNhIpqg8r2DUx6HvTL033Yi8IpXmtNLyGsFZrfdfHbeRUYrHyWfFma/o
   wZst+Y7XqXLDQEuUcnbo3zCR+vhAkUImDYSam/g4IlA718HmB+CHUxHy2
   Q==;
X-CSE-ConnectionGUID: iIQU57x4TaWmTAQoett8bQ==
X-CSE-MsgGUID: ek0gZp/1TRWGx9Z+Vc1BKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69688199"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="69688199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:00:40 -0800
X-CSE-ConnectionGUID: j40h4oj3RAWpWLx508Pjhw==
X-CSE-MsgGUID: mZWgYfyZTpi7Eo2DreTk8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="191692981"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 24 Nov 2025 23:00:39 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNn2S-000000000Rd-3b5b;
	Tue, 25 Nov 2025 07:00:36 +0000
Date: Tue, 25 Nov 2025 07:59:45 +0100
From: kernel test robot <lkp@intel.com>
To: lsig <ls4121@columbia.edu>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1208 1/2] warning: useless conversion to the same type:
 `usize`
Message-ID: <202511250717.r6Gee7EG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1208
head:   9bba107357a10d7bc2b6d669bfecb41e498bbb5d
commit: 164b9197c1a207e977fee62d940a1bd07f748377 [1/2] [Read Sb] checkpoint
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251125/202511250717.r6Gee7EG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250717.r6Gee7EG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250717.r6Gee7EG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: useless conversion to the same type: `usize`
   --> rust/kernel/inode.rs:93:17
   |
   93 |                 index.try_into()?,
   |                 ^^^^^^^^^^^^^^^^
   |
   = help: consider removing `.try_into()`
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#useless_conversion
   = note: `-W clippy::useless-conversion` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::useless_conversion)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
