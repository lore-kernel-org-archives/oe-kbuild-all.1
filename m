Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B80819AD90
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761682759; cv=none; b=ON3iqr4xzJmWT4LYT3Otv1rRyGRPrWDsCHaoWFw65xrUo/qCHjksK9nFOmNt7d2HjM8mB2XGPUOWPrI7zQ1tuXgVmCT9gJkOsEi/3Mr7OyAaCy6X2qSWgMWOL3/XljXGOrofFkU6z8rpfGiGEQkkB1o5NfnvrQ4KF3jTOskQn5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761682759; c=relaxed/simple;
	bh=TMNLh36POFnR6ARNuXJtKAcFZGpup0W8M1+XhGSE1kE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pcwz4yUdTQLOIng4DdDw8yvSud9/Z5YLlDCj858XUAvnahU9UqZhckLTOE0KVNNlEVEZOu6bPnhoi1l4BG+BmiQypqQ1qJjpyRC9QiprsFhGWl38IQI93CIZjNtD44XNH2iJDHtC9mgeyt2nYmSjisQPaJ/iPN5neSX0UPnVjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ho9jB25m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ho9jB25m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761682758; x=1793218758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMNLh36POFnR6ARNuXJtKAcFZGpup0W8M1+XhGSE1kE=;
  b=ho9jB25miPTQqfvC68CGiNjP2h/zhT3Hy61FoMnlQYuXM7cUBaBtLj06
   Vxj3xEqgKgygoYI7udQbuj4bcaS4jTk5f4WBKXHroxcwrVG69hLSciX68
   DUCoZDcwplP7AouJrgO0O9FMI+H4XO57A6eUJnNHhGtHv11l24Hj/uaLO
   k0AmVRUA9NjGjmXqrD/s1qEI0SYqk3CMdgPZ7dPpL8vtN1Or8wbAHzWmF
   kzflkywLmON8vGwGtKN57JA9t6yrid+V+yIY+ItJzswWdN4wRRSM13YBT
   jl2XhcMXe+YLyJpCl/kshBw00b9shr/noSMLlSbcAKz5x8hbcqyhUyo+B
   g==;
X-CSE-ConnectionGUID: AUHjpUjETUq0m3fWpLLsFQ==
X-CSE-MsgGUID: g6XIYC+GTQ2Y1Dp4y5XmrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67633886"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67633886"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 13:19:18 -0700
X-CSE-ConnectionGUID: 2TEo6R0nTkClRsHP27hoWw==
X-CSE-MsgGUID: wviSl/LqTtaxRTIlp91oTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185087622"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 13:19:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDq9t-000JiX-2b;
	Tue, 28 Oct 2025 20:19:11 +0000
Date: Wed, 29 Oct 2025 04:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202510290444.Q7NIX9MR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   b666a118d94213a178631db31191c565f5584a6c
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [1/1] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20251029/202510290444.Q7NIX9MR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290444.Q7NIX9MR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290444.Q7NIX9MR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
