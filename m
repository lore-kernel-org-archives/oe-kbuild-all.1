Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BC3175D4C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725828223; cv=none; b=owDhfL+CDvMmDRgONFz4FUZoohZRddFq3xTTWE9WabFTxWaTOoJ3N4cbrnlOI8qfsWwcv9nvd0fxor4V6p6EEQL0JnOaM+MyVvOrwAY/x1z8o0k3BQmAcPy3hpJytP2dby30X1Xz3FmfU+Ige4H7YbFx1aKD50Pwy3YckcsaYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725828223; c=relaxed/simple;
	bh=wIT+rER6pHJKu7Key9x5ftUsxF+D/o+8tVRYJSIvHOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=La3qoNNRoIgEyRHlK6eVpwqF2pmPgLA7I5GWZ/06m5RL030VQagDHrZiSs320RvML3svRWTd6jcX2yZSjoshus1ntkoOU3OueHBq2tJYbEEI/liKp9Bl40FXCTHH56ioUZsBEQ7c0LSJQQ8o4Jvm65JVCALkUXVj58UrB3ejDBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfDOvPke; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfDOvPke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725828222; x=1757364222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wIT+rER6pHJKu7Key9x5ftUsxF+D/o+8tVRYJSIvHOo=;
  b=dfDOvPkesfMhoYEgA3pyt4h5U8SCsvVb3HcqUZRSNqvvbODrgnvA83oT
   xNHWHF/4ijVNwE6Ol4gs5DmfgyirkB30MgSa1AyDcIymre1UJ7kwO1nyT
   BH+jbUXxa2d0/Qg+/L3ZGT6ybXt5XUyWCmdm57SfqwL5AxXm5zXaSwLHM
   L2ZtZogeBBYXFclDv2t2nnz5B1UvjVM5oNNcjMJ3w+4DHz3X3fxYlNXxd
   bYcO9xhmlSH1hia9SS/QRYgzifCSnvtZRIw3txgXYkHzJlng/nRmcic54
   j/1FufeW0Ipl6/OztBdRmla+XCNFHS54M3eb2PLD3CNiQLG1HmAa6JQEg
   A==;
X-CSE-ConnectionGUID: 8xnbTVn7R8yEclzkDPxh2w==
X-CSE-MsgGUID: 5dMpnYVnS4ClVcH2BZp70A==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24653836"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24653836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 13:43:41 -0700
X-CSE-ConnectionGUID: eWj3wzlJRDS9whsdOO0dTw==
X-CSE-MsgGUID: O3qkdLX4RzKc4hz194nhxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="71426199"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Sep 2024 13:43:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snOky-000Dxj-2x;
	Sun, 08 Sep 2024 20:43:36 +0000
Date: Mon, 9 Sep 2024 04:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [linux-next:master 8222/10296]
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000: compatible:
 ['renesas,r8a779a0-isp', 'renesas,rcar-gen4-isp'] is too long
Message-ID: <202409090429.0RWCQov3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: af9e91cb97923b79dc4be6f9eb8359c6bb98be52 [8222/10296] arm64: dts: renesas: r8a779a0: Add family fallback for CSISP IP
config: arm64-randconfig-053-20240904 (https://download.01.org/0day-ci/archive/20240909/202409090429.0RWCQov3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090429.0RWCQov3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090429.0RWCQov3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6ede000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
   arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: video@e6edf000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,vin-r8a779a0', 'renesas,rcar-gen4-vin'] is too long
   	'renesas,vin-r8a779a0' is not one of ['renesas,vin-r8a7742', 'renesas,vin-r8a7743', 'renesas,vin-r8a7744', 'renesas,vin-r8a7745', 'renesas,vin-r8a77470', 'renesas,vin-r8a7790', 'renesas,vin-r8a7791', 'renesas,vin-r8a7792', 'renesas,vin-r8a7793', 'renesas,vin-r8a7794']
   	'renesas,rcar-gen2-vin' was expected
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000: compatible: ['renesas,r8a779a0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed20000: compatible: ['renesas,r8a779a0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed30000: compatible: ['renesas,r8a779a0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed40000: compatible: ['renesas,r8a779a0-isp', 'renesas,rcar-gen4-isp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
