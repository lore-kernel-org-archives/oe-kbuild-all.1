Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19932D839C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764273631; cv=none; b=Wgtg2Nge16tXPH/dfK/HP5DiqJdChRYhjTMetJBJOsp1QM35z1ZahsB5eilmo0mfIeFE8U2yEvQVrvXiSlhK49/DAWINXI+0JPTaOFY2qyAQ8tlR53BoZA2I14cTls+KVu9ofl+r2/JJr75tTK9uC3b8pGtdVlGECVOSFbZbPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764273631; c=relaxed/simple;
	bh=DFB2E9T/PpAFNL0FnaJ6gRp8LRbDwJ2Ed0yKG3KT3tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNfrs4mIW0bAepjDyAzIPeVuf2u8UELbUL66pJ+qLr4ZraLotJimzNezomeaR+BM0vAsRybL3FUgso5a+on7id1vU8ewc4cAJFDSx8j40VOphLsrr9TSOek1D9g9vX+kNbJjIzGLWFTfm256987zYjJlOI0h6+smynJ6a8PfGLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHenk4CY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHenk4CY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764273629; x=1795809629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFB2E9T/PpAFNL0FnaJ6gRp8LRbDwJ2Ed0yKG3KT3tg=;
  b=mHenk4CYN0jkjS4GxZ1EH57byNJKY6UymJs0vSgbnNGunVO7cGCCd2uf
   ACEr7EUEPtI7JR9RiOKDPey2hBLT2NONlRyffsQluEqof2EggZOWlzTXr
   hrAua5SM80Wk4XcOC5NvzpliqaODXUmejWARTLIL9dgoFSABgE+QGBVG9
   Gf+KaaQaif8X2Ol17MZ428MSRtaBd2dg0RJ7EFerdHtB9PCgyaby0WIOC
   ysJOVZeqZS1S8eXQXuPkyKp7bizgbMmbVZIgTh5SVAgFJpzGLWF80ZQ1+
   cNMNCfIjMoYzpkrLHPMIey0YoYkplaKW4y9wmnvTt4dtPtw0BwjMaDCn8
   A==;
X-CSE-ConnectionGUID: DEhNPubuRdy7FrYaGWAihQ==
X-CSE-MsgGUID: vOmZH4w4TuisEzOg5lgtAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="69940407"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="69940407"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 12:00:29 -0800
X-CSE-ConnectionGUID: e7b+1DFbQdC1E5I9T+mJ9g==
X-CSE-MsgGUID: nl2h4LBZTw+QAh5WHnvfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="198409433"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2025 12:00:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOiAE-000000005bz-07SH;
	Thu, 27 Nov 2025 20:00:26 +0000
Date: Fri, 28 Nov 2025 03:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1938/1938]
 drivers/gpio/gpio-phytium-core.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202511280322.yR8eUCYF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d495515f012a96ae472e8ee75c66680fbdabaddb
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [1938/1938] gpio: add phytium gpio driver
config: x86_64-buildonly-randconfig-005-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280322.yR8eUCYF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280322.yR8eUCYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280322.yR8eUCYF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-phytium-core.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
