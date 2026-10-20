Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792532402;
	b=IiBLEcoMtSN8slLD6sn7JcGQOAD1MYmPXsBK2H6RG35K7adR0SqlOOhUyj1GO9rG8GWk
	 zUKigiO2DkMIBkPqC1x0VgLVVgevCEpvtdvj2JddHoZe1zGnFpZCcgPkrN0bCTrJXYO1N
	 X4Gl8oGqPg51CkqmN1kDPjJYOHLpuu3syipu/bjqmHUYGTpAbEylac7+p+ltbnw/qV2rd
	 gNUACcXbCr3dBXVjVrotfZ4yicB+roXj3cHy1KsCx4x55rLCrTvu6aswpnrzPLJIQvJoC
	 BxuMlJphaVfv9R8syMssPSdOzxLou1NPvCDLcks2thedYMDczNbOvyi1xyTB/Mbn1iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532402;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=m/nhI+oMmPwC45eFjBrpkPNrV2W9jgJG7UvMS0pWSUc=;
	b=htJfCLMhqmNciu2XfgbmLbhxZAiU3OKFwy4OKJc6UT9pl3EJ8AbbxHQ9yLQiXCBHbJhe
	 TG7ogg8jP1TN/z4Ug0EXy/sV3iG6WUT5QgL5rdzJHhPX/wj//O2jywcuBrTvq9refjjiv
	 t5QNEEaJD8AqeWrt/9i85TdVQSQ1JiFQ2G5W7WCrhDsqxb1VzSjH/mESk4QhsxKJnoInE
	 CwgaTLakLl8iY0ptxkB3ocxrUM/HULaFjQqNppC0gwRVGx2+abj9GpMDhfBiRynAZc6+N
	 7mNldYEEOQ1WgBjP9/pNllaHfWj1tzUYSk7zHixRiHHj+QNlGCmDGzEcCpfiyhKy11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvevmrG7;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78075606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 21:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78075606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvevmrG7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792532401; x=1824068401;
  h=date:from:to:cc:subject:message-id;
  bh=G2dN2DtLS4pHVz/1PZbAYRrAUTFjGcYTBio9w/aImkg=;
  b=DvevmrG7kwebJcvhPCl92Wt46YctvNnPJTvs/jcwOPKulxjmjWdRZwvy
   WQLWpWHK39epB7mOS0Kh51C3ibG8jVckhWAENJHHAut+7gU8WF/6246oT
   MYB+MkLKnWf42efobVWPr9leO922y3BJ1xBpjVfIun+KRKwxteOJi90DN
   AfR8cr3MROL8vOpNq65SUi54HrFMwaeNSYXRJKqygjSaQxRlTP2XLFcnZ
   MJZPJ/gD4Sw0LXnud9n3n0+jSQn31z2tHOexqxvSsfJ961bgoNKNOMnd2
   aX1Wc+rcF4e3LkHWGY4ZOH3+C16n+GQVqy35Ze4gigt3hzFuOJPhaltYS
   Q==;
X-CSE-ConnectionGUID: YoFxPA0BT+qNg5u/HoulwQ==
X-CSE-MsgGUID: 3HbBfgNQRquDfu78DJ8/uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1258794"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1258794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:40:01 -0700
X-CSE-ConnectionGUID: PvdZ0Vh1QMmHnj8WvJgNxA==
X-CSE-MsgGUID: 4cXVnH8xQtG4xeU8zswUDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2828315"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Oct 2026 14:39:59 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJHYq-000000006RT-0iRJ;
	Tue, 20 Oct 2026 21:39:56 +0000
Date: Tue, 20 Oct 2026 23:39:16 +0200
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, xiane <sangch.go@gmail.com>
Subject: [tobetter:odroid-7.3.y 53/59]
 drivers/gpu/drm/panel/panel-sitronix-st7701.c:546:13: warning:
 'odroid_vu5s_gip_sequence' defined but not used
Message-ID: <202610202345.VlE9WaUV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/tobetter/linux odroid-7.3.y
head:   c30cb664bead7336f81c7a7c7c82709ee1f803cf
commit: 9668f9aef9bdabc5f71819d776f07c1d904abdee [53/59] ODROID-M1/M1S: gpu/drm: add ODROID-Vu5S panel to ST7701 driver
config: powerpc-randconfig-r2202-20261020 (https://download.01.org/0day-ci/archive/20261020/202610202345.VlE9WaUV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610202345.VlE9WaUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610202345.VlE9WaUV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701.c:546:13: warning: 'odroid_vu5s_gip_sequence' defined but not used [-Wunused-function]
     546 | static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/odroid_vu5s_gip_sequence +546 drivers/gpu/drm/panel/panel-sitronix-st7701.c

   545	
 > 546	static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
   547	{
   548		ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
   549		ST7701_WRITE(st7701, 0xE1, 0x08, 0x00, 0x0A, 0x00, 0x07,
   550				0x00, 0x09, 0x00, 0x00, 0x33, 0x33);
   551		ST7701_WRITE(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   552				0x00, 0x00, 0x00, 0x00, 0x00);
   553		ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x33, 0x33);
   554		ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
   555		ST7701_WRITE(st7701, 0xE5, 0x0E, 0x60, 0xA0, 0xA0, 0x10, 0x60, 0xA0, 0xA0,
   556				0x0A, 0x60, 0xA0, 0xA0, 0x0C, 0x60, 0xA0, 0xA0);
   557		ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x33, 0x33);
   558		ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
   559		ST7701_WRITE(st7701, 0xE8, 0x0D, 0x60, 0xA0, 0xA0, 0x0F, 0x60, 0xA0, 0xA0,
   560				0x09, 0x60, 0xA0, 0xA0, 0x0B, 0x60, 0xA0, 0xA0);
   561		ST7701_WRITE(st7701, 0xEB, 0x02, 0x01, 0xE4, 0xE4, 0x44, 0x00, 0x40);
   562		ST7701_WRITE(st7701, 0xEC, 0x02, 0x01);
   563		ST7701_WRITE(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x01, 0xFF, 0xFF, 0xFF,
   564				0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
   565	
   566		ST7701_WRITE(st7701, 0xCC, 0x10);
   567		ST7701_WRITE(st7701, 0xB9, 0x10);
   568	
   569		ST7701_WRITE(st7701, 0x3A, 0x70);
   570		ST7701_WRITE(st7701, 0x53, 0xEC);
   571		ST7701_WRITE(st7701, 0x55, 0xB3);
   572		ST7701_WRITE(st7701, 0x5E, 0xFF);
   573	}
   574	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
