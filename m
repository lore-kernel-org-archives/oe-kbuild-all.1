Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173679D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753727250; cv=none; b=n3VFXwC+KRQDFqUxryBtltai9CnXOjpDgrF2zruENfE/Z022+7UIng4WoK/wWgr+/Nw6jZzgIpY+GpxrxET7MxpLyUHIbYcvoE+4vqBrE49iKTbArfkws2uyMnfNNcdS2U6VqC9pGctSl4ohiqbNYDdk2V/RId/8hKOU7Ie+aLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753727250; c=relaxed/simple;
	bh=f/7ZnPXQj1anygIgXmHaq8keNiKvZ0R+xPhgLC2Phb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8YVO1wj0BSRhparlVbE78z7o1m9EGQ57yLr4MME6Bz2Wu51kGoKBG0Ewd6rg5BE0dUagl96aLgEQHuRLiWlT+4A67GE7cuonS4RMvNVo3cjIhI96Z7tl+7dgrJvkF4jrx9ToRn3FIJi2FnnONZ/I8rg0W/JXhxWh1WyjNyT3FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJL8p4wg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJL8p4wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753727249; x=1785263249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f/7ZnPXQj1anygIgXmHaq8keNiKvZ0R+xPhgLC2Phb4=;
  b=RJL8p4wgDEOyaChKijjeBoNuy9hFXXGd0PdRqNG1hnZKJ9R/TPlZ94bJ
   hEp2mHTKl+ELx54gLwTFXAKHX6rDKuD4dCoApwRldT89+Se7n6/lQd6V3
   +j9vIPQ1ZJk5gpbDf2KtfOcz1cZXTQ/aZwCIIgIJVSukA3z2cIwLSopDK
   tDqv82EJzu8y7ZjUDaQXGmilLwxxXeL95AnrDkdxkcmj4N3GQGeXJeMhU
   k0b1O+dHwPMJr8K/yOEpbtWZpS7RL4XdjwJ9FOYiaylrlI+NHLLWgUAHc
   GBiC6lClgFaSTEYt7fWU8XjqGwjRBfYvTBSHCFASsRmF1b9kH67pNFXvT
   w==;
X-CSE-ConnectionGUID: IFsWuyKaT9iTS6IiSLjfAw==
X-CSE-MsgGUID: JNLQszSBQlGAP96jJdd8tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59788937"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59788937"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 11:27:28 -0700
X-CSE-ConnectionGUID: 2WTNrXWvTGSP7MjhXX9Iyg==
X-CSE-MsgGUID: +GhzhQMORCq239+9MI2r5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="199627281"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2025 11:27:27 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugSZI-0000ff-1H;
	Mon, 28 Jul 2025 18:27:24 +0000
Date: Tue, 29 Jul 2025 02:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor):
 Unevaluated properties are not allowed ('vcc-supply' was unexpected)
Message-ID: <202507290436.b3rNZIuU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   47365056686efccb3d927cbe35a73cfa0d2e0122
commit: 4fd50f6980e2a491ab9b21b42db5f474e85badfa [1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250729/202507290436.b3rNZIuU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507290436.b3rNZIuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507290436.b3rNZIuU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
