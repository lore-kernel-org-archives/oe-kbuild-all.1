Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8641F5FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 01:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736560231; cv=none; b=l/Bx6LWh2tYxWlUXe6UdP1HDbUpa5wNKB8HmBt8bha1D1bdqsZ/GvsGJl2Bb9ceuEocQC6pgg4TJcXsKZthpJWfmXClVqE3VnjXpLghWC2UVg5YJa0m0osWTMzFdWKOV0nHVVAH8Q0lfMKoqqJh9Gd3/h/2DcgafYFIeieshW4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736560231; c=relaxed/simple;
	bh=IJsfIu/b2Al3DRrd+TizlD+uIPklhZVYrccwNzHXa7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqavZ5SMBx4LPpfBgeXJCcUCGJOIWDGYi+4TvubfCRnI7g7z+vG5aDjK2jy5RWqWg3kLRdAWp1WSjPooPEbkSGK/bewl0lULYfqY9eIkNPY0TmYLagIbWsNL0NI19SqWFisjR8cYyOI4fx1/0A0ozNx1KoNF44VBIPgJO008UHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNMC+cEp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNMC+cEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736560229; x=1768096229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJsfIu/b2Al3DRrd+TizlD+uIPklhZVYrccwNzHXa7k=;
  b=BNMC+cEpUzr9Jiy8vHLd2BBreD3fbONAF3Ff+U/PMQrxfGKEtcKenICh
   /+xPC+1lTmoF4hO0BONnY48l7dMDjepbTg0wg2hLSQ0U6o312sOqxOgz6
   KGzKcLN0Sq3VlUVQsVLt2IXaHt1scf1muqPEDhYjH0DacNifHH3rg3zIU
   I4uVGGviaFKrujoZBOKMBM/lyoyFvjwJ9cwO0XZ5l8aZ8nztc7HY7dhTQ
   2KbUL/jTGauEHjyd7FOA6B0eOQvtpVtEoQgla1M2hGLP/h4O6J/Bw1r+4
   /uCZG+3duCqVpxTDdl17rk+R6xWc0yU2Fa+WmzhTCHDxrlyFS+5PSeDhE
   g==;
X-CSE-ConnectionGUID: Q6HwF8aATQiAleLY7/vVmg==
X-CSE-MsgGUID: y8ArVw3hRUuamSIPPU8MiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37028517"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="37028517"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 17:50:26 -0800
X-CSE-ConnectionGUID: KdkZLu/eTFyiKPIaCqwFJQ==
X-CSE-MsgGUID: E5zuJkb7SSWo2Nxv7psh9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="104070309"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jan 2025 17:50:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWQdq-000K15-1o;
	Sat, 11 Jan 2025 01:50:22 +0000
Date: Sat, 11 Jan 2025 09:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1817/1817]
 drivers/irqchip/irq-loongson-eiointc.c:54:17: sparse: sparse: symbol
 'extioi_node_maps' was not declared. Should it be static?
Message-ID: <202501110955.EqrH7xh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   628e30bc9a3c48a6ab38868cb77fc6497d6ebaa5
commit: c0d9a87efd7845c763e936a5bd9c482c62f8ceb4 [1817/1817] LoongArch: eiointc: fix ext irq route error
config: loongarch-randconfig-r132-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110955.EqrH7xh1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250111/202501110955.EqrH7xh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110955.EqrH7xh1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-loongson-eiointc.c:54:17: sparse: sparse: symbol 'extioi_node_maps' was not declared. Should it be static?
   drivers/irqchip/irq-loongson-eiointc.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/14.2.0/include/larchintrin.h:291:10: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrrd_d'
   ../lib/gcc/loongarch64-linux/14.2.0/include/larchintrin.h:329:3: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrwr_d'
   ../lib/gcc/loongarch64-linux/14.2.0/include/larchintrin.h:281:10: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrrd_w'
   ../lib/gcc/loongarch64-linux/14.2.0/include/larchintrin.h:319:3: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrwr_w'

vim +/extioi_node_maps +54 drivers/irqchip/irq-loongson-eiointc.c

    53	
  > 54	extioi_node_map extioi_node_maps = EXTIOI_NODE_MASK_NONE;
    55	
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
