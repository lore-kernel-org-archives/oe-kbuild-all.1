Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF981FF7C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 00:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782174156; cv=none; b=cUjRvgrblIAPhvHHnxBqQ587egJqr6oUBxZd1CzpTwT5JAh5Lld6lO09/QiYI8NoGTAHBddRkoXvwuPYx6q/f2cnMdbbX8dTv3dsBYOw8DC+DnZuCFSVJK5WNAOkJnBfKfibkEoJ4t6IzIDPVZ8YI2ki3zJKvpT5RQ1DtI4Fweg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782174156; c=relaxed/simple;
	bh=4BqEESr5vbGnBrVhc9KO1PFUL+1dqSyJuElv0wdD1LU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q1p/SC/ZqL0OeRajeb3Q9YHB6PItK8w/4ypQiXvZez04wZVRI4HS80T1XMkb1ZGrwDg9x7M/S8EPSEtPqwiU4TwL6RgEQxxto8k9n7MqaLI29u1UHKIhIWJ+oWXQsq9yossgEr3DvRgStJCS/wQP40FytAdwKEiN+NIgJ7uCSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9MB/PAG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9MB/PAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782174155; x=1813710155;
  h=date:from:to:cc:subject:message-id;
  bh=4BqEESr5vbGnBrVhc9KO1PFUL+1dqSyJuElv0wdD1LU=;
  b=b9MB/PAGpeW8zlSEqSGbUXFFA3SX51Rs310F7KCjKFZ5TopZzYJoqzWm
   MoovTygJD9arN76zDvqyqoe0WZl0eS/EYRKGWOxeBCSoPZ29f5wxXRl6/
   PAR76vH/gryi3kZk99nj5v4350lMhEZKe140qxkWIvWenK8WaMx5DyQVZ
   sjDLpbKz8M40RQfj3+ejtunRp8hdlLVOtkd7ZdDa2i1la4z0VjBFVehn1
   qaBLlJJAUfjLRG5eeCFY8MwdYpuF5HpCAOuj95N5F75Q3gMQ4ULCumpex
   X8jqNXbjcFXFXeQ/vJIMZ4BfsqwSBHGAJ+qxhp+HnJr5aYifL7pBu1knE
   w==;
X-CSE-ConnectionGUID: Qj4Xi4kcRCu7rTOj1yJbeA==
X-CSE-MsgGUID: jZP5TTgsTqO9hPvYPdAirQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100338079"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="100338079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 17:22:35 -0700
X-CSE-ConnectionGUID: g9+pQFteRRW4K4djjsyxxQ==
X-CSE-MsgGUID: 9by51uhrQI2PPUm77K7SYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="279542810"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2026 17:22:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbouN-0000000026V-0qiT;
	Tue, 23 Jun 2026 00:22:31 +0000
Date: Tue, 23 Jun 2026 08:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, xiane <sangch.go@gmail.com>
Subject: [tobetter:odroid-7.1.y 64/64]
 drivers/gpu/drm/panel/panel-sitronix-st7701.c:545:13: warning:
 'odroid_vu5s_gip_sequence' defined but not used
Message-ID: <202606230834.MiADlnH4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.1.y
head:   dbb4f6bd9fe8a1786673783249095632aff93442
commit: 6dc6d1337ee2e0b5ba85b9affd8ce10480dda8a7 [64/64] ODROID-M1/M1S: gpu/drm: add ODROID-Vu5S panel to ST7701 driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230834.MiADlnH4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230834.MiADlnH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230834.MiADlnH4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701.c:545:13: warning: 'odroid_vu5s_gip_sequence' defined but not used [-Wunused-function]
     545 | static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=y] && (ARCH_MESON || COMPILE_TEST [=y]) && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (ARCH_MESON || COMPILE_TEST [=y] && COMMON_CLK [=y])


vim +/odroid_vu5s_gip_sequence +545 drivers/gpu/drm/panel/panel-sitronix-st7701.c

   544	
 > 545	static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
   546	{
   547		ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
   548		ST7701_WRITE(st7701, 0xE1, 0x08, 0x00, 0x0A, 0x00, 0x07,
   549				0x00, 0x09, 0x00, 0x00, 0x33, 0x33);
   550		ST7701_WRITE(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   551				0x00, 0x00, 0x00, 0x00, 0x00);
   552		ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x33, 0x33);
   553		ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
   554		ST7701_WRITE(st7701, 0xE5, 0x0E, 0x60, 0xA0, 0xA0, 0x10, 0x60, 0xA0, 0xA0,
   555				0x0A, 0x60, 0xA0, 0xA0, 0x0C, 0x60, 0xA0, 0xA0);
   556		ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x33, 0x33);
   557		ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
   558		ST7701_WRITE(st7701, 0xE8, 0x0D, 0x60, 0xA0, 0xA0, 0x0F, 0x60, 0xA0, 0xA0,
   559				0x09, 0x60, 0xA0, 0xA0, 0x0B, 0x60, 0xA0, 0xA0);
   560		ST7701_WRITE(st7701, 0xEB, 0x02, 0x01, 0xE4, 0xE4, 0x44, 0x00, 0x40);
   561		ST7701_WRITE(st7701, 0xEC, 0x02, 0x01);
   562		ST7701_WRITE(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x01, 0xFF, 0xFF, 0xFF,
   563				0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
   564	
   565		ST7701_WRITE(st7701, 0xCC, 0x10);
   566		ST7701_WRITE(st7701, 0xB9, 0x10);
   567	
   568		ST7701_WRITE(st7701, 0x3A, 0x70);
   569		ST7701_WRITE(st7701, 0x53, 0xEC);
   570		ST7701_WRITE(st7701, 0x55, 0xB3);
   571		ST7701_WRITE(st7701, 0x5E, 0xFF);
   572	}
   573	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
