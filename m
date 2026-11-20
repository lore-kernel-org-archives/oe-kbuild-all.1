Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194855;
	b=5D7SkuNAcICamFb6ZK+yP82ruBA7x/m4m3Evzfu0wspWwIqyfAfjL8K/vRJAVJ+4j+3R
	 iLEbU1MADofGGmVWhlUoedXfxMcG0uGsBNRTTNFi517fIQ1Om0Btw1WLYEKgFiXDRI73X
	 jduYz+eSNh/XWud4AlG9X7snPsG5xAuH2jnZQ3OWKRjfE2urYvPY3uLMLVUa0Y8sYOFaO
	 F0+6YeLPQ7EWeejhJQDX3OAEqPLJqNh5Vd5lxwXLWIMi0fNqAab0JCrf3IYHg04Vbihb8
	 c5VebBohrOWremtQVtZrU3/YX5WPE5S6ZmrzJFhGa8ZYC3s+xp0ByZ/yhU/f/fCgmtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194855;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wGVmEQp9zHlWF4Oecy0MygofVbx/pjwEgFji0+7LbuI=;
	b=v91fnmJW0KYYNmo8hWtEF52KdurtA9Of8Jipk1AdJ2Ck7xC8pSKg2hR16AM6yNOJWEoU
	 UiEMBOxq2+Ahdzq9J1BSQhQaAzEjgCfayJeAdYxVO1tIlDA58aV3ZrlfRN9sKfLc/GHku
	 T3HvnZ2ZcZv5FTEsefBFMI8G7hU01+5pUzYKWld0uNPOYk7VzE+uE2kq+yrePQ0xzhh0U
	 eEHfhCakWfAKZCURcPXDBGG1DHustNCmJ20UYJ/RQ/T1YA+QczcGSY6J76ZuvfQus+DaE
	 vUcJjYREl0Kqu+8x4jHPUhr/eJn/3nQJNJXWE2xIOaQAD9+nQuDPca2Y4/HzmkIfVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HPhOoksk;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D66606A32C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 17:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D66606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HPhOoksk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795194854; x=1826730854;
  h=date:from:to:cc:subject:message-id;
  bh=a7RqgSJWUqgUoLS2q7jjRKWeYo1mpKAB97Lm0nGfQ64=;
  b=HPhOokskSr5ViVMXm5GlsTHnXyILBzkS3FNiSKE6XJSHX9//g9yZoE22
   6SMj1gtRpHsFgKeOAk/y6UHVaZCZ8oznPw+NjUaAxkrl7kNCgC337IAYY
   oq1jl4+6VrMelZiYdwv9z8/rdeV5PsevOPyAtuu4AXLnLk4rQSBlWRXOh
   Ps87koQyZZIhQKJlgLNpyNwPfXwgG3DDHWPuVfQLewJBeQlkVj3THdISR
   IcJG1ePji8xJH4MAjE4dSyD6Ce9e+nHDBalJfoObK895oETnC7t6VWUGe
   aK0/qppY98l04n9xjyeQwXFQ5x0rEwScAjgYW6RbQNgilWd2KmeKWzUxu
   g==;
X-CSE-ConnectionGUID: IYkn8bGXRs+si15NxhaoBQ==
X-CSE-MsgGUID: Zh90GaBbStmrGuH2W378Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4119635"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4119635"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 09:14:13 -0800
X-CSE-ConnectionGUID: nEcxVjBJSrWAVcdjXX2dSg==
X-CSE-MsgGUID: J5KugUBxTzu68xyGtEEVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11162650"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2026 09:14:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUSBd-0000000046H-3SO1;
	Fri, 20 Nov 2026 17:14:09 +0000
Date: Fri, 20 Nov 2026 18:13:34 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-linus-next:linus-next 29/46] ERROR: modpost:
 drivers/platform/asus/asus-wmi.ko: symbol 'platform_profile_cycle' undefined!
Message-ID: <20261120181059.GypXyRIq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   aab799f53c8a83520a9fc5d4231cb1e613edd817
commit: eca57a9649ee5935e7c3151cc4c29bbd24cdec88 [29/46] Merge branch 'pm-next' into all-next
config: riscv-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120181059.GypXyRIq-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120181059.GypXyRIq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120181059.GypXyRIq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/platform/asus/asus-wmi.ko: symbol 'platform_profile_cycle' undefined!
>> ERROR: modpost: drivers/platform/asus/asus-wmi.ko: symbol 'devm_platform_profile_register' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
