Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF61DB127
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 18:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754592072; cv=none; b=nkFgknw0cHFXJH87kSMC24EmK0dAywRwHT1zQu8IThr+rrBawpMfQWeqC+R3Zt1vq4SkfP3VvUHLOLtJNtADuBiIJhngVpb8RrhH6BS6OFYpzno2rlfwt0WomHkmrvoEULppg/StH9oI7PuCqRzG3+hjcld0Rm80mZvlk1/UThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754592072; c=relaxed/simple;
	bh=HdNkaE42MyztXQAtagp5bU1g3diap8e6U18J+p0H6Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2R8D0qH8jT+qurd9XRaZo+EDX3KtHSIpe0ST6j3brKodmYIH/zAwB4U4iA+D5rfJ/MIkJNZEVreZ4/IWZJwkzBMU6nhgFtRBKdG/8Wz6D5ESuP7Lo2Vjk4epShomql4ZNUID4LayyUV4KUxGSp4xVwoxFJ0izRpZQ93TfNHMh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJN2gcvp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJN2gcvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754592071; x=1786128071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdNkaE42MyztXQAtagp5bU1g3diap8e6U18J+p0H6Xg=;
  b=aJN2gcvpa4WUAqc/lwym1GoRQaHTnOfulV1ytJ/VC/+MUNBIdlsFuKj6
   V62YHB0XP2xEP9B+l/yH4jFgEJtMIh7WazMga7/dg3dAmOM1j6YvNUOsq
   LFrLUqtMI8E1F3HzGPSH5FHuW0HluUSNsAhHTL6+dq2vvCzwAjk6wVxU0
   0sAaok3DmeksbhhI6YVfYGIxMB9ZTHFLNVbYJTe/WCPF5LM7grI4wrbgP
   ARgzpuqU3V58DgyBC0krnG47g+/vkyosYHBZO92RKdFKA9Ey7ZUKJKiav
   XZ6a6lJ+PZnLXmMAP1Q1qhtfjHedq4fW3a6jwfRzBWh/onIv/PLqy10nS
   g==;
X-CSE-ConnectionGUID: 5WBBkJcGRcyawdX7GL7krw==
X-CSE-MsgGUID: QYTKrfy3SIe/gFl6gqThyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56145721"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56145721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 11:41:10 -0700
X-CSE-ConnectionGUID: iI7Hg061QfGhu/ynfbSlkQ==
X-CSE-MsgGUID: 8P8jJjztQAm+PjRWo/wrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169366520"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2025 11:41:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk5Y3-00036w-0D;
	Thu, 07 Aug 2025 18:41:07 +0000
Date: Fri, 8 Aug 2025 02:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:vsrv 4/7] drivers/net/ethernet/vlsi/vlsi-mac.c:504: Error:
 unrecognized instruction `nop'
Message-ID: <202508080217.KSVypevC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux vsrv
head:   58e54ef4640355003af8e733da39cafa53ad38a9
commit: 17e17550692a1c7e7c8b2c8ddc155ccf02676e65 [4/7] net: vlsi: Add VLSI ethernet driver
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250808/202508080217.KSVypevC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080217.KSVypevC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080217.KSVypevC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/vlsi/vlsi-mac.c: Assembler messages:
>> drivers/net/ethernet/vlsi/vlsi-mac.c:504: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:506: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:508: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:814: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:814: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:856: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:856: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:573: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:573: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:573: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:573: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:576: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:578: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:635: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:635: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:632: Error: unrecognized instruction `nop'
   drivers/net/ethernet/vlsi/vlsi-mac.c:632: Error: unrecognized instruction `nop'


vim +504 drivers/net/ethernet/vlsi/vlsi-mac.c

   500	
   501	static void vsrves01_mac_flushrx(struct vsrves01_private *dev)
   502	{
   503		dev->regmap->cf |= ETH_CF_RXMEMON;
 > 504		asm volatile("nop");
   505		dev->regmap->cf &= ~ETH_CF_RXMEMON;
   506		asm volatile("nop");
   507		dev->regmap->cf |= ETH_CF_RXMEMON;
   508		asm volatile("nop");
   509		dev->regmap->cf &= ~ETH_CF_RXMEMON;
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
