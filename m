Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD336AB4D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334568; cv=none; b=fw012tQ6eUA5T55vLo6uZ5ALu4D+88Bs4FrjdCc+8z7DT37qsGMerpuWRL3c5cYaSN9o5a7nOuGgoOTSe27JQWXnOrFaZpCbUwsRbZx2CfjFKv5fBsyiw9miFdgVk99XXQIVepCl6C4qb0wq7xgrT0E/4ee7cBH5Rt32+u7KLGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334568; c=relaxed/simple;
	bh=b0bPc5G+zCe3shasuTpkFUZIHIx/omvxL37FxUhRA04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AejV95lqNppjcRlcl/71PaLYP4G5bz7bElfGrCitktEIFo1hVPh91/9ffvgmXz6NrLoYaX8c29fbmKKkl0c2sP9dmOBtd0HqCQwQphwMcHr1DU9lK/s+I7rmLtgQ/nYpRbJdZcppNldz7dDBb/7Rbu4+IwMzDE4A2OlPSdIEHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWpLTi6J; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWpLTi6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771334567; x=1802870567;
  h=date:from:to:cc:subject:message-id;
  bh=b0bPc5G+zCe3shasuTpkFUZIHIx/omvxL37FxUhRA04=;
  b=hWpLTi6JBMC9XnFZMdLqTVYZGTY5lz6kP/QB/8DNVCLvCI9urC8MIhEh
   69VMsEebXKFcZWB0mYcFBSCl4QDOA5cBl4tJxooupOCS1Er0DUjR3/b4M
   WNtRIlZNaE7+/uo/17yTPB5aIjFs7v3KiRwgk/vFNNGj1B/5+qLojAyeF
   TGkvWcW/hUwh6Fsd2lvTHA66Xe27cUFpmDMuZyJujYrcKB0+1krEyUIUZ
   uPjJzTNtmI8IQzGlGE4Q5O9VhtWhnJyKQyUkbeN1FJZ8X/xvo35X1+jj3
   xOuJTAVbyTeCSNSU2GZ9HvT7HoDO6bZZYd1SCjUCIYORFz9+oVd696RmZ
   w==;
X-CSE-ConnectionGUID: QFzSFFTGTzWZyIyWy1MxpQ==
X-CSE-MsgGUID: bVz2FkYQRxS189MKZEEXvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76241526"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="76241526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 05:22:45 -0800
X-CSE-ConnectionGUID: bnXxt3rdQWaj20HcQlVw5g==
X-CSE-MsgGUID: XtPoRsFpQeCGWnvRxIlsAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="212602915"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Feb 2026 05:22:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsL2H-0000000111G-3eQR;
	Tue, 17 Feb 2026 13:22:41 +0000
Date: Tue, 17 Feb 2026 21:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xor-improvements 12/24] arm-linux-gnueabi-ld:
 lib/raid/arm/xor-neon.o:lib/raid/arm/../xor-8regs.c:97: multiple definition
 of `xor_block_8regs'; lib/raid/xor-8regs.o:lib/raid/xor-8regs.c:97: first
 defined here
Message-ID: <202602172143.aHmZxKXe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   eb7f59de015dce21199b34b5923bf0622c333915
commit: 71959f9d99e650630437e6fce1ab2c916dacc4b9 [12/24] arm: move the XOR code to lib/raid/
config: arm-randconfig-004-20260217 (https://download.01.org/0day-ci/archive/20260217/202602172143.aHmZxKXe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602172143.aHmZxKXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602172143.aHmZxKXe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: lib/raid/arm/xor-neon.o:lib/raid/arm/../xor-8regs.c:97: multiple definition of `xor_block_8regs'; lib/raid/xor-8regs.o:lib/raid/xor-8regs.c:97: first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
