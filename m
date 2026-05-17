Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E152853F8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779001301; cv=none; b=bvaXhcrnZ3PEVMAnG9omAieiwDQI+NREPFTn4OFrBKggKWyY6fihxwgAN5ZsP1hWSOecH1KOariuI40ID91IL2Ug4dXyzRpKvPCpxY86ezaKLLA8r4x6Q+bQ6R1dqIXwyYjUPix/E0Ci5NdgVYTyEwFSFJP+JCm/NIwF851ZCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779001301; c=relaxed/simple;
	bh=UF+N1nQg70cM124pIz0P6NXBxuTqU5Xap2/GQrSUJsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aKrepoZBeGqnwuRV29JDiPhUy9fMjlke4OBZnsnpBVOOLBJfjLaY3V7kspF2FeUv8LBg/nrmsrR380jyD9hD4hcVAockBUaT3KppV/1DJ6U3k1VIBqcwYYbv4Bnj2pLoyHYb3z6jdna6n9s30ZCrOse8N+Gsx4aP4q0sE7iC7bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lc/jx4zX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lc/jx4zX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779001300; x=1810537300;
  h=date:from:to:cc:subject:message-id;
  bh=UF+N1nQg70cM124pIz0P6NXBxuTqU5Xap2/GQrSUJsQ=;
  b=lc/jx4zXyeiUhouajclzG3eGXOQVW+6i+0V4JhB18lTzIK5H4ddAHuHY
   lhPYAaIUG9ZaSax2fmxPVsd4x+s2J+GT2QodEhJYo4TH+w4uQvOg47Wvk
   LD7mpN9E7mtETGVCX52iVAZxOI65utC0v+jZh3CuzTzk7Pp1kc8HsDbio
   bpme3QtxSns7CPH+Jo9GaSC448sc5MaX9JHiZaA2Xm1MaxD5fbzEp4Ub0
   TqE5KXlMAKVBhzjBB9oCI5FBwQRH1xsUguHTWjmaVtOfX+kxApbABybwx
   y/mFCphvqtTDdsvEQZp8UGEW9VnCKH/sl1JcDP0PW9hc/LcISZc4OAcJ5
   w==;
X-CSE-ConnectionGUID: CPsTNZu/Qraxe26BvwGaWA==
X-CSE-MsgGUID: h5zwKpX+TFynZNp5eTHJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90587469"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90587469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 00:01:39 -0700
X-CSE-ConnectionGUID: XhjcK8dCQNCV4Mafl907Kw==
X-CSE-MsgGUID: YtwlcrzmT/S3qyCx1d8h2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="234657195"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 17 May 2026 00:01:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOVVI-000000009UD-0l6h;
	Sun, 17 May 2026 07:01:36 +0000
Date: Sun, 17 May 2026 09:00:54 +0200
From: kernel test robot <lkp@intel.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: make[4]: *** No rule to make target
 'arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova-tower.dtb', needed by
 'arch/arm64/boot/dts/rockchip/'.
Message-ID: <202605170808.5wiFjCfi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-power-supply-sgm41542-document-sgm41542/20260516-062341
head:   0944fbd26e870f0a45af3d3ce6c9c569fed08ea6
commit: 0944fbd26e870f0a45af3d3ce6c9c569fed08ea6 arm64: dts: rockchip: Add Anbernic RG Vita-Pro
date:   33 hours ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260517/202605170808.5wiFjCfi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170808.5wiFjCfi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170808.5wiFjCfi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova-tower.dtb', needed by 'arch/arm64/boot/dts/rockchip/'.
>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova-test.dtb', needed by 'arch/arm64/boot/dts/rockchip/'.
   make[4]: Target 'arch/arm64/boot/dts/rockchip/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
