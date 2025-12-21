Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F53227BA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766351651; cv=none; b=Vt+iIyFdUmRc0UYDYYl8tWOisAJEt5c/Ga8ckc7dWMYEr2qJ/xPmDtVvOXKgp6e+HbGAjWHnW7fU7SbS4mSc7lWm8akIegvPnKKMC2+R3viHMKQVmE7W4WBZc7qvj6HWBYSZDe1Ion8aj/fZUbLuk65KMscO7Uy0XRRhVJCxJT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766351651; c=relaxed/simple;
	bh=yEyQVbpM9kYDWIXc9/obPJkPnv9uLec0FOYkgAbpDnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7CBxZST3ivlT22fIMd2hFqv+gubNuIzNEQvuIy0Xx4kyZ1SmbRWE+BJXaLvySXSQAOEk4NgAkSddOZywds5z8iLV5PTcU9+DphAXI2wQd40VU6q2osO2OAYQz4xKU9QsWM+DR1DLr0zPkrSvXhc72kA+VXtGRFu3qY1cRyZx0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsMpNyH5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsMpNyH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766351650; x=1797887650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEyQVbpM9kYDWIXc9/obPJkPnv9uLec0FOYkgAbpDnc=;
  b=EsMpNyH5FLgnxqneI7K1paWgbmf+K7qDYNIQmF5nM1J7ehzPQyGJ+ATu
   iU7z0wIEyVr8fDFLjnOWclljEw9qGpaD+1KZvE8xG5ce3XD9JKF6UYVrl
   wIGUFujOQ8j/sZoVFyQNwN5tgzcfOvF2M+qw4FKtp//BibduHHZt/Iv1k
   VKKxYM0/ViIKBwCzm2AfxBnBFO4WTlYkoKOuyt3JtjOCFsyclTw5PG1YD
   oiKKyul/JOr3DgCpxeZcbZhRSZPa6w9V8VjKyC39CK0ChqJN8CnxYIh2E
   cy+UzMoJGtc/KZ3ki+wP7N0fM5LmDt/iLl4QVUVCrn/8aWETI02v0EDOT
   A==;
X-CSE-ConnectionGUID: fo7Hoj5UTGmw91BJGmnCIg==
X-CSE-MsgGUID: gSUjpZcpSBa3z01aTyC8uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68263904"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68263904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 13:14:09 -0800
X-CSE-ConnectionGUID: ALQbxjDJRryi3tlA+BwszQ==
X-CSE-MsgGUID: kd9dyBJDQ6eoM+O5tSXpEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204305531"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2025 13:14:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXQkg-000000005FE-0m06;
	Sun, 21 Dec 2025 21:14:06 +0000
Date: Sun, 21 Dec 2025 22:13:40 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 54/62] warning: unresolved link to `remove`
Message-ID: <202512212212.d2YTbefb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 0b0f4d27d8f7f71a26deb80d8611e83dc75d0dc7 [54/62] rust: alloc: kvec: WIP(?): Add swap_remove() for AOP series
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512212212.d2YTbefb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212212.d2YTbefb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212212.d2YTbefb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `remove`
   --> rust/kernel/alloc/kvec.rs:807:58
   |
   807 |     /// If you need to preserve the element order, use [`remove`] instead.
   |                                                          ^^^^^^ no item named `remove` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
