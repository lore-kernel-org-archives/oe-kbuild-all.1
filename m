Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E01F8723
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330725; cv=none; b=XtRSg08WEJWMgb7PxshSc4jTANVbTOCZ7yysv89qGXpSM2Lm0aXWl7KTNMPGIz20+3jHiy8xBKvEpBAzk7rcw0pexDi9V//xJ7JgPFkICh6xZRV2j4sy4wrlv8/CJWyuv1Y05Jzg48vPaG+KieEv8tIe3veOKmmXtF1kd6jww68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330725; c=relaxed/simple;
	bh=3LLXTFx5FioamDfac4fb5WCCSAFKmiMEgGj3cJN+x2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRCO7LvCgwSFcqGbGXEyyfbY566mnqUOJgA2duKupnEV1l5UCj6kObbj8CWFwthndXoROa9J2Az1pdWadrI5mcroX5rQr5/fxHfBemurFO6pJmP1zHhwvhzBEMdjdoRVIoiD1ArP6OX7em31R2ej/PN4ZCpzvf8YkUeqkZdXZ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMQx1rqQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMQx1rqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762330723; x=1793866723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LLXTFx5FioamDfac4fb5WCCSAFKmiMEgGj3cJN+x2M=;
  b=mMQx1rqQ9LYvcOuwP+l3VozNZ8aJqHTkklOBsQE2G+blbHDzHR/uxf0e
   O0eKDcDNtR4QcYPSFc8knVVAZZEG8e8LxkRLMy9ql7PetPen2srV1ivu3
   88ms9mc95ZUP1XQ1Al5Smm/fbq5uNX6wGODzRvKUDu10zwC/MbDXnI2wN
   hNc7Pmhod8SR0Iavc7g6tW9e1oFFZ6R5lmy68Hit2HcXBQkTiv/leBif4
   xPU+IoNgNVjsKTzed4gam+gA8awQFsJRhjwbfU29QRtxUZQFlzpVq0x3o
   QXcPy47H21ODC8hYa4mcEWFi+l/NyHQvOHN89PxuN8ngR33JO1LBp8Wi0
   Q==;
X-CSE-ConnectionGUID: QdWC8sodTzOMnlIOaQluCA==
X-CSE-MsgGUID: BBtGuV4yTEeQHkqbMydwPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64134318"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64134318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 00:18:43 -0800
X-CSE-ConnectionGUID: CmaR7olaTYOjOeEbgJeGYA==
X-CSE-MsgGUID: cxO9B4CST/6rt0fQ7mv4KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187080877"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 00:18:42 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGYj1-000000002Ua-34qL;
	Wed, 05 Nov 2025 08:18:39 +0000
Date: Wed, 5 Nov 2025 09:18:26 +0100
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 17/27] mm/oom_kill.c:252:27: warning: unused
 variable 'oom_constraint_names'
Message-ID: <202511050905.DVqym98n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   176f3f07db49e29a193bd0b986301486bc19a5a1
commit: 1de15690efff0a4668efe386cf2b9bacab17e0ee [17/27] mm: allow specifying custom oom constraint for BPF triggers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251105/202511050905.DVqym98n-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050905.DVqym98n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050905.DVqym98n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:252:27: warning: unused variable 'oom_constraint_names' [-Wunused-const-variable]
     252 | static const char * const oom_constraint_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/oom_constraint_names +252 mm/oom_kill.c

   251	
 > 252	static const char * const oom_constraint_names[] = {
   253		[CONSTRAINT_NONE] = "CONSTRAINT_NONE",
   254		[CONSTRAINT_CPUSET] = "CONSTRAINT_CPUSET",
   255		[CONSTRAINT_MEMORY_POLICY] = "CONSTRAINT_MEMORY_POLICY",
   256		[CONSTRAINT_MEMCG] = "CONSTRAINT_MEMCG",
   257	};
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
