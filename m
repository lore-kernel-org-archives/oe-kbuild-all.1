Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE43370304
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 23:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763506948; cv=none; b=JNnbtraTz6dj7lUGF4q34cER1Y2ufuB+0wkiBTohtFqcu/yEAe+nwAZNO5aL0j6m8ESzORvFdftDDGhlELccGgC1zXox+rurzSxvZc0w30DtOZrAshScK8bRaRzELosivhF+LpDM8U+nP7P/m6NLJBuNT3KMEURBL/bN7bbxzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763506948; c=relaxed/simple;
	bh=vmDqkWD4nsHgWQHgQBC+ecs1fTr6KIRIDElabV8tbf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EbVNuj6cH4i5UvlwiI0pINpoacWiiRxQhVYyL5mRAVU+8PIB25P3J7LMFfJPmenwhSsOsPpkm/xAe7vLG+1YglxWehI4uTMD9HupSUkl+6fFC/qgG+h7+Ia5cp9w4NRCrLy2lSjzh6kj1QuLi/YkZpg0GP/RrdtFI8YWTaodjOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmiu8oZG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmiu8oZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763506947; x=1795042947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vmDqkWD4nsHgWQHgQBC+ecs1fTr6KIRIDElabV8tbf8=;
  b=dmiu8oZGKBtI5osgvtLeXV9X7W1B5vNthh8La3pepPmqoXB8PBhKt4/g
   8TERqLfW43kI+/o3PHc32nrY3tgJGsyBpdcBswq5dxQzZrlesWrzRCTkw
   DYoaKpfm50lo3YiBt6enrBDt/v/03h0XtrpxnW7Hz+TCc0Z14Z9qtEJw+
   8WMxIcoudR98bxGaAP/k7bQYLC+1b7hNPfYsvyVhEiB7RqTi3AdnrlklW
   Lbr2fMH0XRaBptyNvzzEvJgXTgNqE77QvELjnNKCWTCpkt2qXzFHg02ht
   dCvbOvoAaBd/wjFarZoZ/1v4Nk3xMZ6duASJQZci29ZeepVYjV/EU2Y/D
   w==;
X-CSE-ConnectionGUID: 5BbWdOafSPacI5NTXRVPDA==
X-CSE-MsgGUID: b10JWwzMSJu3DZ0mcly3+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65245123"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65245123"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 15:02:27 -0800
X-CSE-ConnectionGUID: aZ7mAEmsR7eResgRglIqSA==
X-CSE-MsgGUID: V7OI+WzhSnCwZR7RtKkJ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195004771"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Nov 2025 15:02:25 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLUiN-0002FO-20;
	Tue, 18 Nov 2025 23:02:23 +0000
Date: Wed, 19 Nov 2025 07:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18-rc6-2025-11-18-x5h-ironhide 18/29]
 drivers/mfd/rcar-mfis.c:64:18: sparse: sparse: symbol 'mfis_gen5_info' was
 not declared. Should it be static?
Message-ID: <202511190618.3g1UGqbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc6-2025-11-18-x5h-ironhide
head:   a621150dca9da7531945716ec4a387aad5e56774
commit: 15da84d92b11b88d272db64482b514c8d4433c16 [18/29] mfd: renesas: Support MFIS driver
config: sh-randconfig-r112-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190618.3g1UGqbz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190618.3g1UGqbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190618.3g1UGqbz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/rcar-mfis.c:64:18: sparse: sparse: symbol 'mfis_gen5_info' was not declared. Should it be static?

vim +/mfis_gen5_info +64 drivers/mfd/rcar-mfis.c

    63	
  > 64	struct mfis_info mfis_gen5_info = {
    65		.wp	= mfis_gen5_write_protect,
    66	};
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
