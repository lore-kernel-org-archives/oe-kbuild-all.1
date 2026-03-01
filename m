Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9416231A06C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772392979; cv=none; b=nMIzKSVtnTmYxQzz2bQtk4zhsxoOs1+vpUH4QUX6+xGTduCd7R2WDgZmFHdem6UKz2idPkg+G0FKQQKFi7y2t7rMDhSjLuwiIAo/X+T7hKIHAaH+QmfNtHRzqQQtYktOUWfUD/fwNr2C7v9/hNrKiN8pd9aspgI1H4TeqIGaXxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772392979; c=relaxed/simple;
	bh=H1M+BQJBXRCmloRGPd9jfzIjX5JBzfzrZOMde2VOA+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YDqdxkWE8wx8RIQgNfddPMv45jfL3y5xm7ABwRGfKgeYBYTo9pulQ8n+378YS6qItNrEU+KC/vL7OnzJkz1GexY1zXPPotoGcHUCBmR3eukwyMiCuW/5AaPj9xsNYEsFgkHWi/9Xlq/2tBYZMUTrgdYtEhzbZx7RtH/x1BBHTbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebZZStQj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebZZStQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772392979; x=1803928979;
  h=date:from:to:cc:subject:message-id;
  bh=H1M+BQJBXRCmloRGPd9jfzIjX5JBzfzrZOMde2VOA+Y=;
  b=ebZZStQj6w0LhsvaInVEQ1yQw6Y4Axdt3v5DmTKSph6eSszbesIY59qi
   uGQ6CZw1E8jJG+FFfILLr2Nx/yTt0T3eDs4+T6uWYzWZNppMYsegdk47x
   5Ji2nfQVatJVo8LEadu1SaInx0UY/wCLFGkqmJ+Plpoi7ZxVg999p++NX
   TgnWBoytjDAK4EhunVd4AmZry2iZJOunTlRXOPJQDvBVyzOHppGQHqhIl
   KRsvXBzzIZE776eObmZcZdrbUSciHMew+QczSFBHPZj1lQWAnpagI2quY
   KLlLgQpJ0jK7KEIZdyyaE3+eseRevzFE+ajkADg1cm01ZPl2W1ecVZne4
   A==;
X-CSE-ConnectionGUID: iuYAcm12SwGVuVlRJgPC3Q==
X-CSE-MsgGUID: GxpfYVLDSiiDhTvWw2H2tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73317059"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="73317059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 11:22:58 -0800
X-CSE-ConnectionGUID: 1g+yI5d2RtamlayOtP/z+A==
X-CSE-MsgGUID: lLeBAKEITYq9Wgk7EnaSYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="215475991"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2026 11:22:56 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwmNS-0000000012r-1QIw;
	Sun, 01 Mar 2026 19:22:54 +0000
Date: Sun, 01 Mar 2026 20:22:09 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 31/57] warning: unused import:
 `crate::error::to_result`
Message-ID: <202603012041.Uz5yms0G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   01c00561a643db1264ba75e8b464a87ec2db6126
commit: 3fbc0c3a68510319d0b8cd6e63ebe903ec41ef25 [31/57] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260301/202603012041.Uz5yms0G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603012041.Uz5yms0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603012041.Uz5yms0G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:19:5
   |
   19 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
