Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88DA48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744799504; cv=none; b=DH5ZYMME7k7nWX4AvOh+QqC75Z3R6bACMyGVmE/KK2qOZFH/rOsVr8o8fC5olZm/6DkO8eWRrLAxbAJOn3gjc+UOq+trOy0FmxOGlJ6lnqHDxOaP/BqNQ7M9kHWV6FFttw8JeI5zJ5wFy74tW9epvzkCVVbv6Dw9mGCOxtQ0jb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744799504; c=relaxed/simple;
	bh=Is8VeP1pmeUMjCGdhmxmYWWlWnk/4A518ZsYLAMrtKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IdrgVUNtRnC9Qw7WkhYUvVZnOGSS1oNeH9Q+Z2e7Ku7IZPBcLLuHb0zBDn0FhKlq9nQuJt7ctNpJIpw/vJZx3G5mmxSoeX38kXMKlJcEXwNkSeQSvtEh7tZucrbuSRAQH8kv7786ieVPSuZZnUPjzaII3bK+5dwwnyCb6uMP2Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vr+64OuJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vr+64OuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744799502; x=1776335502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Is8VeP1pmeUMjCGdhmxmYWWlWnk/4A518ZsYLAMrtKM=;
  b=Vr+64OuJOp7uD/tgFD8i8q3EETvu5sOk4IFY9sCEwGaSfr7r0Bp/7Je1
   tTJWkaWynmDfeR9PmCVucXredbxpEpgNPguSxxAhn9XRYqPhryE6gbABY
   h2vYG8AlR+lehPGAUz/6cjeskQ7uK8Dix9U8hDfLqQo2Nkj2pYP8Liesg
   f0U4uJpmMv2WVS0sXWuw5O1vznqQ111W35kq9yDMDKN1dhlkZVSGZLar7
   MoQAU6LvUat0kxoKoLzR51NCZlp1hynlLh64Bt85vtxEYz63xuUOIqkAz
   avVxd6A5pniwB8fsAtebm6NmzK1tOJD/XrijJ1yVLMXTIMn1GUAixG6Ou
   w==;
X-CSE-ConnectionGUID: ietn5S8uQza/PjtYS3+fdw==
X-CSE-MsgGUID: 9xTTJfuKR16XcU53W8haVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46055056"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46055056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 03:31:40 -0700
X-CSE-ConnectionGUID: 5I8dZ1ZcS1KEUCORWbWLnQ==
X-CSE-MsgGUID: L9Q/I+n8QNqR0P+Qis6eUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135273678"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 03:31:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u503M-000JXW-1f;
	Wed, 16 Apr 2025 10:31:36 +0000
Date: Wed, 16 Apr 2025 18:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2862/2862] mm/page_alloc.o: warning: objtool:
 __drain_all_pages()+0x87: unreachable instruction
Message-ID: <202504161818.Kxnq1s4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vlastimil,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2affea8965688b8231cf977864ba7539320d5db8
commit: e037ee4a8deaff7c579618c0aba1f066d6d14b11 [2862/2862] mm, page_alloc: disable pcplists during memory offline
config: x86_64-buildonly-randconfig-005-20250415 (https://download.01.org/0day-ci/archive/20250416/202504161818.Kxnq1s4P-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161818.Kxnq1s4P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161818.Kxnq1s4P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.o: warning: objtool: __drain_all_pages()+0x87: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
