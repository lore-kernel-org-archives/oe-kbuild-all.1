Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B71310E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 00:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706403493; cv=none; b=FS4cq/7QcM7XFmpeEz81egxLl2HMToNBIbApP1XwU1B14x61WAmh59GaO+6MGkSORzknMU01UTYapQBVTIFzpvpcxrYqSNF9jRQ4X+x45VujN0Sv1bb09Kovvno9Tgd84MkSgmqqypLDF8I5UVssFYrTqwDGTcYlMH4k4Bo/q+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706403493; c=relaxed/simple;
	bh=0kGn2w2e8V6QGlYXm7mCoerI+fwCJxiIrHiWOEj3ddk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6t/0efa3oeoP/vefNt+zfUkOoDT+aNUi5BMLeTmOg8u8eNim0ztJZApUlW9HyHhH41nRsBLy+bgPyUWqA/sjpQwphZ6rD1LeGk93MFbGIWUyydfPZvkKWvNDDw81h1aNNo7NRnG0agNabo+haMyf1hmhoGhR0ZttlyklN0jH/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPv84JeD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPv84JeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706403492; x=1737939492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kGn2w2e8V6QGlYXm7mCoerI+fwCJxiIrHiWOEj3ddk=;
  b=jPv84JeDh7kWSpA5Md18geavH2QgQqph1JCvdj/IXnPf0ejfgCP9U8n7
   gD2uyE7Vv9AwRN6E030MNjpOEXtldqx/d9COExRstRtvvGD9f2LzAUVuC
   zQN1h2hOItZ110HcT0nWAONE0AUIeTzP3ercA2a37yhjC0UT96Q68jpsY
   YPZt2wEyWfhb1Z2YV5dZzRMNl/93QQLye3Q4hTc8kCEXyyLoYbFguJ43O
   oQFn3iirjyjo+0nOUrL3bVH6uLP3tNwv5X1hWv5wjsWkvnejHCmA2Ub6e
   adhDrCdOmkvzku4qYb/UvzYquToK+QTow1bCi+nDbVWjYKRIAokzf0+56
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16087034"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16087034"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="737031122"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="737031122"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Jan 2024 16:58:09 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTtUs-0002vq-2t;
	Sun, 28 Jan 2024 00:58:06 +0000
Date: Sun, 28 Jan 2024 08:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382] aarch64-linux-ld: ID map text
 too big or misaligned
Message-ID: <202401280824.I1ukIUNz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   a3301d5cd75f78159753d3c59d2e70ee78e74e58
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: arm64-randconfig-004-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280824.I1ukIUNz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280824.I1ukIUNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280824.I1ukIUNz-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>> aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
   spi-cadence-quadspi.c:(.text+0xec): undefined reference to `spi_mem_exec_op'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
