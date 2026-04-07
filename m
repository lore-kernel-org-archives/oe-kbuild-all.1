Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB32210F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775590633; cv=none; b=ItyFdz/xzVZEhk0XdVmIMu2lIeKzNNLZnfhqVxY0YUcy95fcWyeUuuE7IWFTrDQtGkKKtjFkYwTqGozjPIPD6dTSYqyAjfMN+gOB+UQwnsLMva7rz/QsahFFIRl4VWoND1EDaYSQ1wa/fn0MRTodSiV6CUvfVQmxU1LmmtLdIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775590633; c=relaxed/simple;
	bh=0BhFtuI+btpcAPIiDDtPdYPBdSmUi8gnHiThsVEEqRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eHkTQdNIN8I2MPj45ZDM/oMTyBsv26e8epfkqyfVUiYXP5FWeZXOnSz/21B4mLVPBWpAdbpVXTsGTar9xnUoFH//o6BL3i5OAL38Mw2737XV/gCFW50Q4AhuGQqQTTONKrhzO6QHQwwIS5lFY9oN+LDDNv6FWQy6iXO5toN3br0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0IvQIaI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0IvQIaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775590632; x=1807126632;
  h=date:from:to:cc:subject:message-id;
  bh=0BhFtuI+btpcAPIiDDtPdYPBdSmUi8gnHiThsVEEqRU=;
  b=Q0IvQIaIAK38FJObmRr3Jmft4qCSdnY5dIdKqmyTh1mhcruAPXgy80H3
   d598DT32EoFTyrjCXUaSz7uvqcY2qzbKNJ/Rz5ZjrtEgEm62yo64nv0t+
   FdVMXniqgSd84kbXiO4uNNYSiQ6H2a3gbzX8y9oSduQp53B8GcGH3lWFk
   5SQy69uRWBCW/aMHKUZb4qXwI5XAzoFMen3ZRZteRDPZpkLmZ90tP4TQs
   MMp/Ll84/tp8wfjzyW132PaBQZ5ugW4SIRYUBwhZB12Doby3ZfpM/aE9u
   P0foYH2mDCywFJPdfMpo68mgyh9aDRalK8LuYiDyGhKjOkVXorwDNYuR7
   Q==;
X-CSE-ConnectionGUID: 9CW9gtN1QOaZjHcAqVoB4Q==
X-CSE-MsgGUID: BS/O6E77QFy4K5epmiO+eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80424077"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="80424077"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 12:37:11 -0700
X-CSE-ConnectionGUID: wE3SuDncSY+sCdY3FEMuwg==
X-CSE-MsgGUID: MbNDqjnRQDGFtAkjkmd80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="225084044"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Apr 2026 12:37:10 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wACEV-000000000y5-3VF6;
	Tue, 07 Apr 2026 19:37:07 +0000
Date: Wed, 08 Apr 2026 03:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:assert 4/6] arch/x86/kernel/nmi_selftest.c:27:8:
 error: must use 'struct' tag to refer to type 'cpumask'
Message-ID: <202604080314.G7Txqn0o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux assert
head:   5e88fbeeb3c7355139ca86067d68ea8c77534b92
commit: 7a49ab0bc5eb96c752ad339794e476c19613cb5d [4/6] nmi_selftest
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260408/202604080314.G7Txqn0o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604080314.G7Txqn0o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604080314.G7Txqn0o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/nmi_selftest.c:27:8: error: must use 'struct' tag to refer to type 'cpumask'
      27 | static cpumask nmi_ipi_mask  __initdata;
         |        ^
         |        struct 
   1 error generated.


vim +27 arch/x86/kernel/nmi_selftest.c

    25	
    26	/* check to see if NMI IPIs work on this machine */
  > 27	static cpumask nmi_ipi_mask  __initdata;
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
