Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C373463
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774903716; cv=none; b=fo/k2oibSXZqzxmiXeAZgETuT8/+AqqYVYY0NuOSQSPG6UyJ6W7bl1hrCx0KXOYpn9yFQXIj7GlYmb7BHfbcz64ywiITnzuO5zHx+fnoG+rmg8R8g4QmhjV+2TS4v7eXCQJNcfaj2pTP7NL4awXauN7zQMChmECvJU+7rOZNu/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774903716; c=relaxed/simple;
	bh=W9+eIdAqmeZntt04uFEAI/Z6bHdF8Jss0xy94j+1i3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GcRGad27A5lK2d7yAU41Z0jAz/gDtoVeBiHwzx5hsJOHbICpyGTWgFVA/IkOoCZHcOfDXL65Gr2kxfleYpwIxavVbnX9M71EIG22uFDvCGFkS1bZBnIDfG6fqFeR/Ms4HbMAPNMZITPuzkccZ3L5sh2Szmt6M4vRMnMcYYC/f2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLuDv6hc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLuDv6hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774903715; x=1806439715;
  h=date:from:to:cc:subject:message-id;
  bh=W9+eIdAqmeZntt04uFEAI/Z6bHdF8Jss0xy94j+1i3A=;
  b=QLuDv6hchg+50Z37CyspZ4HjbEFQsdbuhF7Gt9XullHlnGuoo298dnkl
   jsP1QR8Hkxo6X2rfTtaP6xjeu7vXrgq0698SPVrY8BmZp8Ci/GLRL8x7U
   s0baUJUQRCu/Ck2TTFWARzxqpELtfFHLpNONwpKEuJA78aF/AcLL1yiB+
   lZaBBiA4i36aU4xDAXBa3yP+WC4MuIcX8GCEMCS9BeOmaMrcb0aqKu8VW
   VM2sK93Ww62Ipq3gCLN20hrLXJdk7rxSefnTIPUeoYCpvi+IpdD6EaRMr
   be1MU2L0jSE5gZekUYRaxvZeUwIkWno4Zy88p8XMgVMUfapkvvUtfiMLD
   A==;
X-CSE-ConnectionGUID: qtu7uMYWSMCaKZB3iXkvpA==
X-CSE-MsgGUID: S5gr6J0QSsiq2urLB7cxJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86525840"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86525840"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 13:48:35 -0700
X-CSE-ConnectionGUID: SBulKJM0QTewxiAZbal1Hw==
X-CSE-MsgGUID: K2mR/paMSy2DdTplwARI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230963926"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Mar 2026 13:48:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7JXD-000000008CX-0fBN;
	Mon, 30 Mar 2026 20:48:31 +0000
Date: Mon, 30 Mar 2026 22:47:51 +0200
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 1/1] Warning: mm/slub.c:5287 function
 parameter 'token' not described in '_kmalloc_nolock'
Message-ID: <202603302214.d39KTVmW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   6347bd6a238222ad586e6595a04c9b07c668e2f2
commit: 6347bd6a238222ad586e6595a04c9b07c668e2f2 [1/1] slab: support for compiler-assisted type-based slab cache partitioning
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260330/202603302214.d39KTVmW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302214.d39KTVmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302214.d39KTVmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:5287 function parameter 'token' not described in '_kmalloc_nolock'
>> Warning: mm/slub.c:5287 expecting prototype for kmalloc_nolock(). Prototype was for _kmalloc_nolock() instead
>> Warning: mm/slub.c:6743 function parameter 'token' not described in '__kvmalloc_node'
>> Warning: mm/slub.c:6743 function parameter 'token' not described in '__kvmalloc_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
