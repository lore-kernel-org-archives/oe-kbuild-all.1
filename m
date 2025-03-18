Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FE21148B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742318906; cv=none; b=HakXvEdwNiIgsD4bpRWF7zDsQ6gkZrpMa8/YO9F+rKeOOvsw3OUzJR8cs2OaI8S7rWtdXoSsB902YwakohniEaMPjX9HnwgwQ8+I/19HZjQAiO4nGsdOGHtjMtJwoeZ/PLXIVk33NWEp+FHIVWqTyjJ88nf9n3nxg+Vr3/XStyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742318906; c=relaxed/simple;
	bh=dmZQv3Za0g671n0cYx0ETKIWO6zh3r/Eq4AuM7AQEto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NgXJTa/w4ZbmAxPJYi6jAd6ycrBTSELtN27D16tirJ3TdekjNT/K8aifwhz6BVdzNjnF+8LtrhubsLF/lJjIoeVknyX6LS+dnxnVlyBlxYEXj416UA4o6VnQaHRgA9jS7S2bBjTfS+T9PM3SwhieRJb3vvXzxnnY2Xob40vA4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebrhYXqS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebrhYXqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742318905; x=1773854905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmZQv3Za0g671n0cYx0ETKIWO6zh3r/Eq4AuM7AQEto=;
  b=ebrhYXqSWZWmbOfVTg3LSulccwwFUy5981H66n7CobmrQtqG13h3SqoU
   RUBdYyLuHVYUNWA7i8gqjpEWjPEyNPAy118jmDjX4dt7Uw5GFYQ+2R+nj
   wu20D5gmxagT0ScLNZEVQgUUHFoSHu+RukLDJZTyyq+f9R6AX5FQQun/e
   8hBVSil007EeHBBoOFZTq+2R08oZTr9TGAf8DhA6baRi6IT3WpPxneSRp
   CByyCrZInrQ5fgvwQmlYavk8Qth5RJY0NBCYnZuDp/wWVrVWp8PjTU1SO
   z7bLJWLSO0Om6fjnjEihtZY/Ijk17KaXaNWHa9h2QOisXRoXqDiJUFE7J
   A==;
X-CSE-ConnectionGUID: VtfcrND/Q+ST6aa24D4K/g==
X-CSE-MsgGUID: fL3fiQ1oRJygtgxSWw0osQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="65939611"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="65939611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 10:28:24 -0700
X-CSE-ConnectionGUID: UE4OgHcnSF6ryKzt8DwaPw==
X-CSE-MsgGUID: PHKGR8NgQsGfXQl9TMyI9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122510616"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2025 10:28:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuajk-000E1Q-28;
	Tue, 18 Mar 2025 17:28:20 +0000
Date: Wed, 19 Mar 2025 01:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 64/65] WARNING: modpost: lib/test_dynamic_debug_submod
 (.gnu.linkonce.prop.__dyndbg_descriptors): unexpected non-allocatable
 section.
Message-ID: <202503190139.SQm1Nq3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   ad63ebc0b5699b5e64f4f96e8c56cf6e8353f6dc
commit: 2267d252cf660769ffdb5f557da27fbb97f18de0 [64/65] dyndbg: POC declare header struct manually in test-mod
config: xtensa-randconfig-001-20250318 (https://download.01.org/0day-ci/archive/20250319/202503190139.SQm1Nq3X-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190139.SQm1Nq3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190139.SQm1Nq3X-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: lib/test_dynamic_debug_submod (.gnu.linkonce.prop.__dyndbg_descriptors): unexpected non-allocatable section.
Did you forget to use "ax"/"aw" in a .S file?
Note that for example <linux/init.h> contains
section definitions for use in .S files.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
