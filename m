Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA98528E37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894166; cv=none; b=ba0ftPuWGzg+/akn4jyHVIPCfOPH8YRh9UCQMrzHbzB6K3e/0h8xplWUUrEYu7ffzGU1Th9IkSJ2puTpv3ecpv+L7iX1pd3YYIl8Jti57TbnR6qWgVaToLnQQpcscCzW8rj8F9Z8aBKuMMVZFoOIHC5NMPX5c7K5U5hojyg0Jrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894166; c=relaxed/simple;
	bh=Oi+ZpGUHO/S8bA9UsMz9/1Xqc+y5P9J2P+lUui9HpRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYEIT8rLkaSgoKa4gQcWVWNK20w4ZOw26foRsnJe5Z/R1MsGutaInhX37Abr/KgAoeKvT9A4UhGpcAmjJL9qXQrqiD6vkWY0Fw/A1QbB2qqm7NzQXS7oHa8xw0E6NtKe5dOluJ3LD+F35Yqwn/oBvU5J+JaecRwVk1UiMo9SYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZaHqD2j; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZaHqD2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744894165; x=1776430165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oi+ZpGUHO/S8bA9UsMz9/1Xqc+y5P9J2P+lUui9HpRY=;
  b=HZaHqD2jeVR7AoRR43OPUZdeDlfSkPH2Mg2LsRShw0wvjUbBp9cbU6Od
   9QE4bGK8HxnScNMYcbtvlos8nHoh2e/q94qxX1kYUrZ+QJ3v40PZeleC5
   4tGrEQTlpPxejOyiJ6iqggKmyMY4M2V/0ebARzfSonwHn9cQcSk+YcLY/
   G9/lcLz7sYfbiQafaC0SYCx2TPhGNBJ7X2n2wpkvNjKSWK91GkwGTit+I
   7HgeG0yDLU1mqX17RwH6gjEYmg5BAcHwjQ/Hq69EufIUl3xXPGtFkeI7k
   RrIarEMOn40i+uZQyxWplIMtacEizRTmDO3hLHxYYtDEVrpC4y8T1OT/q
   A==;
X-CSE-ConnectionGUID: TeOrwft5Qoa0bWu7Ne+hbg==
X-CSE-MsgGUID: KgcgP44ZRTC8q9ZK58B1zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50298714"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50298714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 05:49:23 -0700
X-CSE-ConnectionGUID: 2OeODUEwRfeddwfnUwxPpg==
X-CSE-MsgGUID: 8uK5/6e9THqFMAUSGLwljQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131105136"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 05:49:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5OgB-000Mk6-1F;
	Thu, 17 Apr 2025 12:49:19 +0000
Date: Thu, 17 Apr 2025 20:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 5/33] ERROR: modpost:
 "asm_xen_read_pmc" [arch/x86/events/amd/amd-uncore.ko] undefined!
Message-ID: <202504172008.DV7kOsKU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   140acd0d1aabb49e359a0419fa7dcb5fe73d7448
commit: eb32db0c69ecb6dbd2de3ce457265f87dabb4390 [5/33] x86/msr: Use the alternatives mechanism to read PMC
config: x86_64-buildonly-randconfig-002-20250417 (https://download.01.org/0day-ci/archive/20250417/202504172008.DV7kOsKU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504172008.DV7kOsKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504172008.DV7kOsKU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "asm_xen_read_pmc" [arch/x86/events/amd/amd-uncore.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
