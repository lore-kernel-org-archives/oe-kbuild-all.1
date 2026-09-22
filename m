Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D66832E128
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Sep 2026 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119383; cv=none; b=JNREa2BMbUz7YIiJpitXkrv9WHkbw0Sa523yhb6yWwu7YRRlJ17Ll3++yTy7tAmdIw5Z2PfeXfgRIl21MnpREaE8j3AZeqF2N0BtqAmn86kM5RRKxEFbPubfg4jFrU6av7UeTwJuTRU5uKM0azScCMcPtdH99Vfp+ojTLPeCnNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119383; c=relaxed/simple;
	bh=1WwLo4Epts+RqDE15utZEzqopHDhbP3UU4Gr2xTD1+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ypv7rmNq38DkWKbrRsuOGPiWPu8E4BL06C/70QxwETKpok5MeowK9gMBt2kaRsqT813hGydVDQAC9fe+QXM7VcKy88aCwvnNFBviHBgRDlgRpgCsyRwe2tTyMv/ehjg2Clug+xC5O+sPmAx23c7kzsGrLu119zpskIQbDSKhmk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuEpqvLN; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuEpqvLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790119381; x=1821655381;
  h=date:from:to:cc:subject:message-id;
  bh=1WwLo4Epts+RqDE15utZEzqopHDhbP3UU4Gr2xTD1+M=;
  b=JuEpqvLNwx1Th9/vZksbFMMSjOIlWtYLc+mTahhl28pDGj7vQa/ocHE3
   ZqWVe2LY4us/a7g+1BUGc9DOsmfv+SjeQ3DgJKJujNRM0s4M4pnj6k3C+
   Aa8OeUs1xzcJ6hZXM3H7xK0Z2y9tb+zbdSWOYL3bAB23Z+mJgEDj9wig4
   Nhu4Nup9DuqpX2vuDETmNuOWTxG2F+sCAibnJZJGEiXZcgXu74m/Ijexg
   fcu5RAkuwgEtL2oFUZa2xjBYYt//csMehPIjZ7Dc4eeC4RadeKev7DzFr
   K8WlmmGztchHJGe50n+6GeF32sIsrf73HeULykVUaDV6wTYgF4EFA5Jz/
   Q==;
X-CSE-ConnectionGUID: y7wViog2TM+riEYuVpd3LA==
X-CSE-MsgGUID: Z2x/e2UMROGHD7JRMs/bTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1282508"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1282508"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 16:23:00 -0700
X-CSE-ConnectionGUID: d0dDCTGRQ4OjIY5FCtrpsg==
X-CSE-MsgGUID: XP0Eg/CoTO2uIUz93Z5jEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4637806"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 22 Sep 2026 16:23:00 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x99pB-000000000Nf-13vf;
	Tue, 22 Sep 2026 23:22:57 +0000
Date: Wed, 23 Sep 2026 01:22:28 +0200
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@nabladev.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 1377/8910]
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb:
 vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
Message-ID: <202609230104.FiyyplfO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/8910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260923/202609230104.FiyyplfO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230104.FiyyplfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230104.FiyyplfO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
