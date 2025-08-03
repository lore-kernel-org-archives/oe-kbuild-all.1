Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF27B2E3705
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 17:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754243946; cv=none; b=OlSvgyT79Kt/4YeMsTSZU48bwOGIqGoGsCSWfw5UirtaeVDLtkzhrlYi9XoV7WPY3Eawy4i3/EP+Rqpjsvm7BAAha6/f+t8vreWaHSF8Cv88GDj5hPc6QCJp/HVBhbJqwfoH3gypSgl+UU78PrsmpezxQ3m0e6XhIDBpdVYSZLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754243946; c=relaxed/simple;
	bh=CcaBIu6fNRNZF7dYtjrta5ZcXX6JJNeYdGriW4w/+9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnI0BEvsqpv1c0kRP5mHGUrotFF7xE2tIS8uRGcG7NOnu0zroz5neOkbAhknM3A98cgQ4xByd/ljMRUBTPebnEf7M4OyUeV/+kEnAusUCmm73Sn7VmCBslBrscTQXjG3WtAmBIMQKxD2EEJhyddhowqzK9TY7ff7x/e8ux+RK7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUP5BGNB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUP5BGNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754243944; x=1785779944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CcaBIu6fNRNZF7dYtjrta5ZcXX6JJNeYdGriW4w/+9s=;
  b=OUP5BGNBPzkTza/TXXPwS/KOzSir+/JiB0kb6NGrs18wvbtsuiWeMlX5
   ozZwAo8+AvwLTylHsMmG+LjsxSmc/mOLRfIUG9/7uxGELku1T8XhJq6RU
   RM4L31XuMAc0cH/QYXvGfcaZeBiQJ4to8Xb0Exlna2FUHwJZtw1capa9z
   20XwDxdgiPL3Kjq93/anY/8bUwnFYYn/Fy1hXKTd1ofGJ6WVtj1JfZ9N5
   DgmpM0LUA3nHJj9HKVpKw2WJ6CbYzGo6jMx7xWKpV57A5iEC2JPNYJF/4
   1xbuQUCHG6q1w2Xx0shSW8BkO1IkisOudKwOkazW8XSyCAHfhZA47c6M3
   A==;
X-CSE-ConnectionGUID: c54rWBVgSMa5feoDFWeQsQ==
X-CSE-MsgGUID: mr8qFv0sR+OaBXEGHBir2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56656666"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56656666"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 10:59:03 -0700
X-CSE-ConnectionGUID: zhksAZMATKuJ1oT4BDT1Pw==
X-CSE-MsgGUID: ytNSH+sVRPGfTWhpnfRcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163900043"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 03 Aug 2025 10:59:02 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uicz6-0001f1-20;
	Sun, 03 Aug 2025 17:59:00 +0000
Date: Sun, 3 Aug 2025 19:58:42 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 59/85] error[E0425]: cannot find function
 `of_reserved_mem_region_to_resource_byname` in crate `bindings`
Message-ID: <202508031923.RTf0UXM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   0add3be48d55f089eeafb4b329e169bd375ba5cc
commit: 1f6e7d2b09da1c3c1fdc8fa5693dc0ecd9440023 [59/85] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250803/202508031923.RTf0UXM8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508031923.RTf0UXM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508031923.RTf0UXM8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `of_reserved_mem_region_to_resource_byname` in crate `bindings`
   --> rust/kernel/of.rs:222:23
   |
   222 |             bindings::of_reserved_mem_region_to_resource_byname(
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
