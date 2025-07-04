Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D81367
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 04:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751602624; cv=none; b=ICoUymnmrD8zxWxST62p9zBYYZNOHcm8YMtEfmAsl0eYmiK3dlWNbJKt//A+rhVE0VlREWLPxQqQJaAoI+Cvxa5GC6FApDqCDUh4KnM5vbSoBGgEMuUsWl8UWiqrdMXzdAPQmeB2Y8v4OONGF9seUjoqHkHOth7krtOeDX1oJAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751602624; c=relaxed/simple;
	bh=Hb1HeCf+ikPN6jxZnfYnoVH1gfD+eVQx9dxI7PDWVyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGoUNBHHBZXI53HldcYCo4uOyPgwDLCVWZQ/ceeRACEyeVi18xGpOaTjDf5qYXGBeibJUQbFmEteJvm2ERQYP62zxrMaxOZdeXPWQu7DRhApNUp6IsVQDP+3X6Hl0n7BmTpoRTAuH+lL1/JN0Suir4hjiKoIC+rgNCtQp4/j6CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HITZ46+Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HITZ46+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751602622; x=1783138622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hb1HeCf+ikPN6jxZnfYnoVH1gfD+eVQx9dxI7PDWVyg=;
  b=HITZ46+ZA+uNK0BYo6KTFBTNj7AH6upsr8hTTgqZDTJkbtPcijgbLY2X
   WGrvSg+dAdRXPN066sBkPY5EqcDrGfPIphcls+dBUnCKC+9PK0bJwnvPK
   hyOGT386FsAdnftf37CsRKQxpFlau96PtfATKj6U1xSJhgjxNyOsZ/PQw
   lSYWN5gLX6Sth9HPKgx97N4tI4t+BtimoAmsrO6duHDyDvyFePnHREq8B
   DNmCTzIfVOAwkEZTeiJ5zASUno2N3lu5T/5clVXJzC35hjBwFRp2D7GTI
   w1guzpfdoQY6kjo+85yOkWH+S7AqW3+fiV63yEjTCv6CPLfNA1uk1Jbh5
   Q==;
X-CSE-ConnectionGUID: wz4ThOdfTZertH0vaFakSw==
X-CSE-MsgGUID: Yms8LGN5TPGm9R1ULbvViA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53158988"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53158988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 21:17:02 -0700
X-CSE-ConnectionGUID: 9632drBRQui1Rvx/6BQFCA==
X-CSE-MsgGUID: DoNLrmTaRtmPmVmG0/h7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="178213693"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2025 21:17:01 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXXr8-0000ap-2L;
	Fri, 04 Jul 2025 04:16:58 +0000
Date: Fri, 4 Jul 2025 06:16:34 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 5202/7039]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dtb:
 ethernet@c8009000 (intel,ixp4xx-ethernet): 'fixed-link' does not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202507040609.K9KytWBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6c58332c7a8ba025fcfa76888b6c37dbce9633
commit: c9cc6b6a7d23eea7ada69a9185a550c4f0b62319 [5202/7039] ARM: dts: Fix up wrv54g device tree
config: arm-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250704/202507040609.K9KytWBA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040609.K9KytWBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040609.K9KytWBA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dtb: ethernet@c8009000 (intel,ixp4xx-ethernet): 'fixed-link' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrv54g.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
