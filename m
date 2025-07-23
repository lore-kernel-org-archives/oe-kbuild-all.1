Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD32494ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258081; cv=none; b=VEkjeumx/yqg/xH8UlXRQERP3sdPjupBozR38D4GfpcstZAxA5nUMjHTgPsSI/2CW5wH3APZqXQUXkyGO7DwbzFf1wCU932sM+bl3cvY+guVAGxvqfWGrAYPoAhaB4GWzedBfPS+S1DzXHXpg1FYFApXoosNu/nwPOsoXZkLZc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258081; c=relaxed/simple;
	bh=KtZ7ssWCh3S4KX99TLVhOCzT0F3WVzkJYNPTt1l8Dw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKLXBx+QZxWH4vUSmylSU/2DfdSWMriK7By2DKHdvBRLyt07gadC15Nlk412490GEjwiM+xFoHd2+ddJmuqJ1ram1IUxW5hdpbC1/BiyHGPBRC7eKyHXDEjdLYZpwPv4pyPrrtC3P9P77y6Aa7HtwmtrCs2JJeft9+CSf7XWiow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxzYZ9wS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxzYZ9wS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753258080; x=1784794080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtZ7ssWCh3S4KX99TLVhOCzT0F3WVzkJYNPTt1l8Dw8=;
  b=BxzYZ9wSIrFCTsYjV/MM6sDBPZpZhWlt7FEy5ZzR4kbv/gOzPhqijAec
   zUp89m+Pe5/5MEyPqlEzE9hchBYdqmYhJ5zrNO4y+eKCVn11Sau4WEpZe
   ORJBooviZbTcknd7l6Zgr2U4eU9aSQ+lbB+2JLwQQbHBhbpHISETmxgP0
   qyTuHG2lbVNWrHISCnlNbJLRvaRnXVSpRQpT7CTXvbMJ2Z6sHc0u8X4rf
   1hxOVn1cmQUBIXYQdAOh5fXmmy++rKbF7ft1BgKTql7GSukGH9LL3pQPb
   f7/eueQ5oILYetDVqGPpT0RIx9iMVMMpogJM/fQMhZZaPr1o8YRpRFY48
   A==;
X-CSE-ConnectionGUID: wwEFtfFoRg6NkRBqEsv8ig==
X-CSE-MsgGUID: EDYGuAeuTfqSGtTVO95+Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55485581"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55485581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 01:08:00 -0700
X-CSE-ConnectionGUID: MyTEZ+BaTniff6xxshcZUQ==
X-CSE-MsgGUID: wCXGt4hWQDyBUCq9r0HPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159675625"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2025 01:07:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueUW4-000J6z-22;
	Wed, 23 Jul 2025 08:07:56 +0000
Date: Wed, 23 Jul 2025 16:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.16.y 33/44]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20
 (rockchip,rk809): codec: 'mic-in-differential' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202507231608.QJ6B03Cp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: 872d2cf24a62a747b924b69fc6e07ad48962882a [33/44] ODROID-M1S: arm64/dts: add rk809 audio codec support
config: arm64-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250723/202507231608.QJ6B03Cp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231608.QJ6B03Cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231608.QJ6B03Cp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20 (rockchip,rk809): codec: 'mic-in-differential' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk817.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
