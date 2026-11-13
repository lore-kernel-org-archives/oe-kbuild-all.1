Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597679;
	b=wPHdNpotl5sVjH77x3MI13zI/bJlohynBrKhqO5cTiJ2hqI6UxFBdFLDHjo8G5PvhKeu
	 UoglNgFVKHU5e1/GBf4+fYb53bNdF3gSxoVPY9VVZRLwsprLn8srQus4H+rJi/es+MSBN
	 sgaCSdJdmbK3DMUI2RkNKrC3jQzW2mcJSiBvmHbUOA8ku47KHHayuKAwddZKthz0trGQg
	 A9AybvxvxU/qIq0uFzouPitWO83rAFppnz2zYCQYzQjvp+4uHo5aNogJRaoo8NkFi+Dnd
	 LQSlXCvh+o9yCWl3vROWb55vkXg+QXVL4P3dPCUVuZBWrbnw+zRWweL4lnu/f/JQNbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597679;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=w+kdCxq0nYWTGTjlKUusOLJCQLbNcooMu/3XXWaczL8=;
	b=oGh4e4Nbv1qG/jgKDMcI7arM/wspdCjvY6bLgv82RvjUSwSkmRTDSAp8zVq28GbQ5bHP
	 4GYcydTykp1hmGfYjwDJrRlSumFAODSJinK/6B2xJCkAHrS7kCdfKg7gZoUYpJIzBLpFn
	 Yfx09E6xwSw3FZiqlbnQ187FIH1tbuRYizGR5CSPdTB4KIKaDg955vLoPYbjnVqHu7Y2L
	 b16zgMqnJvHfWeQaY6TzhpBe7pnvgshMFRNk5HtNzM/L7lwzyLngwm28eDzWGLFkjVhed
	 C42kKBPNBbkB+3o5hQOXIMTHw/UCfuEvCO5Ree9JMuHxBZAlsQVwhVurNWmYQ8ah7tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bvJvK96P;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49378606A32E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 19:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49378606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bvJvK96P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794597678; x=1826133678;
  h=date:from:to:cc:subject:message-id;
  bh=dYA1maPmDMuzVe068OSLzI2HuQnSFeRFfEYG+vXSivo=;
  b=bvJvK96PDR4IJTIYy1Wr2nRiZHI4+zQLe3RHUSg9+DMCphaZXH0+6PPg
   louCcpNnemXP2RPEo2tZCeR3+O67IfxLPeTLeOQgPBqeKvOOa37o1ONNt
   ZpzDFRbhI30VeBlfIsJmQIjRZ4o9MLXe7+x/I56VLIfPamoUpz0xmMN5S
   fmblaGy1IeikYopKlOFMNT6A3mFkvdVXS8bC3sEhJwPa+p9Y3TijnW1gv
   CgdY2oW+2XulYv+fnQkjcawfLcNF/RKjITT2Ed0WM9EYhQ6D+h8NydSc9
   ro9hQv2ez43wGnHIn59HPvdeOLppECuqn25uuZS/63MqIuxle1jJy7+pi
   g==;
X-CSE-ConnectionGUID: E3pkxWuDSQmCP1bZw7GpSA==
X-CSE-MsgGUID: HcbYKn6HQvCV2faRdEZ9eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3286890"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3286890"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 11:21:18 -0800
X-CSE-ConnectionGUID: 1xRs5QOPTBW5Ibip3/1oXQ==
X-CSE-MsgGUID: mvvegs5VQ2i4aSljZc8ucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8834315"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2026 11:21:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRwpl-000000013mr-2j09;
	Fri, 13 Nov 2026 19:21:13 +0000
Date: Sat, 14 Nov 2026 03:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kaushal Kumar <kaushal.kumar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Venkat Praveen Kancharlapalli <venkat.praveen.kancharlapalli@amd.com>,
 Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 354/1483]
 .tmp_gl_xilinx-isppipeline.o:undefined reference to `__udivdi3'
Message-ID: <202611140358.9DOIegil-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   85261a88dc955839e3dabe5339b3a8d86ec545db
commit: 7db29c21f0d26fbb3463152daaad8fa9a842a1ea [354/1483] media: xilinx: Add for ISP pipeline driver
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20261114/202611140358.9DOIegil-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140358.9DOIegil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140358.9DOIegil-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/mtd/spi-nor/core.o: in function `spi_nor_erase':
   .tmp_gl_core.o:(.text+0x7e10): undefined reference to `__udivdi3'
   microblaze-linux-ld: drivers/media/platform/xilinx/xilinx-isppipeline.o: in function `xisp_compute_data_reliability_weight':
>> .tmp_gl_xilinx-isppipeline.o:(.text+0x2d8): undefined reference to `__udivdi3'
>> microblaze-linux-ld: .tmp_gl_xilinx-isppipeline.o:(.text+0x35c): undefined reference to `__udivdi3'
   microblaze-linux-ld: .tmp_gl_xilinx-isppipeline.o:(.text+0x3c0): undefined reference to `__udivdi3'
   microblaze-linux-ld: .tmp_gl_xilinx-isppipeline.o:(.text+0x40c): undefined reference to `__udivdi3'
   microblaze-linux-ld: drivers/media/platform/xilinx/xilinx-isppipeline.o:.tmp_gl_xilinx-isppipeline.o:(.text+0x450): more undefined references to `__udivdi3' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
