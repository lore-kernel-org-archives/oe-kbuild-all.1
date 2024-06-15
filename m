Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3873D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 03:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718420439; cv=none; b=MEk0rhzaq11GTgyEUTez2FXrXz5+vt29s4qYyLjQzm2wzfhpB/Ov4ltWm75mRI4PnBtxm2aYpKkcpY+9XJ9oOwisdxf1y42CKCvrz0CZF9eENrTrh9tN8leUVoxM/FIHfX0U/DK+FFL8QfK6pOorU8v4k8jLUWxLTv3OVohHE7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718420439; c=relaxed/simple;
	bh=vE6IhGM7yPmQmzLU2z5eSL5+uxe3Jnvjb3TIeAowNcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q352zYb31vz7neQAt7s/8DJaoUoezYEd7vmT11RqXVNZoMJPuzD0g5KhWlZU7cu+x4BrmjH+aMqq4jHe9aLYn36r5HN21m3xPEOphJ7rdXh6UjpR2mN7HYzq058jYjqSUcwgL4ht48mtsv/Lw4CHY6h++GB0FNP1PMO4xWMWRNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZDb1uqs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZDb1uqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718420438; x=1749956438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vE6IhGM7yPmQmzLU2z5eSL5+uxe3Jnvjb3TIeAowNcM=;
  b=jZDb1uqsF1R9Nkf1L3a9SeUb7WWFfR1+ssQI3pMGuU0UprqbOZc0iFYc
   y5qxNK/ZnGhQePkxIGiLhAdLv02g2b9o9pEaFT4l8m8PD1+8XbL7ogRsm
   yWIBDa60nSni1WMyeFU15iPQiFKcFgNG1PYsnZ+8ZGIj/+I7fn3fnCSgW
   AlV72qdSPuHzLKIFDtF7AkSTznCNTF1V1iQTHmwhH8m3u9F5H2ARsONg3
   yEXJnf92WE7fW4rvmWC/PNh1x6Lk7oBfwagZuLyUm/YVUA3GjXCmTFkUJ
   +I1YOx+zc6SEhf7RmszW8BUK1IfdXORrPg0MOxhdyXoOUIAzhNF/qo8Ci
   g==;
X-CSE-ConnectionGUID: JcU/Oi0KQ9qVVlmOmF7T5Q==
X-CSE-MsgGUID: GGWKmN/3S6GoVkof5FbZMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15461636"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="15461636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 20:00:38 -0700
X-CSE-ConnectionGUID: zK4iPQWoSeeOS59gf3wKJg==
X-CSE-MsgGUID: jYd58/JIR/iB3ZAq8krWXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="45100634"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jun 2024 20:00:36 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIJeb-00024D-2D;
	Sat, 15 Jun 2024 03:00:33 +0000
Date: Sat, 15 Jun 2024 10:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [mediatek:v6.10-next/dts64 44/53]
 arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/syscon@10006000: failed to
 match any schema with compatible: ['mediatek,mt8365-scpsys', 'syscon',
 'simple-mfd']
Message-ID: <202406151352.R650eixq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
head:   2f950510411a33d98eea28c22d7880eeb48adb61
commit: b5ded35667ce9eb330083116e67af1f2f7886102 [44/53] arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151352.R650eixq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/syscon@10006000: failed to match any schema with compatible: ['mediatek,mt8365-scpsys', 'syscon', 'simple-mfd']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
