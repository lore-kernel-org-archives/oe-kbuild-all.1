Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1F19CC2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957519; cv=none; b=X+a91aI/VQyv7qqwn2BETr1mLmb7y9Bgl+5nzNe/JVD0GM02zgLoXpCwQ++G0V4H6iEL/m8Ef2BjGalKk+nlrffbfN/RI5SNtG5KIF/m+IeIVGrfHovE1prtQyoTzN+E5JN4w+9uAhma7NPfdiUl5dguZrDhrLo/S1sY0EEKPcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957519; c=relaxed/simple;
	bh=0B1PHPYYRVkoUCEq8gNVXnuXlRqnVJ1xQjc1Cm1Buvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3P1zFbueEczlzS9WMh+RNjfSoRTsjoHQdG0WaPn9BWL7VlcYo2/Dr+4eNVmtPacWMqzGnp/CesHIiRSynf+vJQvHfwyf/hz9QOkdqPyFcYGIqRBKqGbieQZaozRyVuiTq1p/Z4apRdlBb6xdueGiJ0tAdaKGQOkgXYp6YXdcrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QT7O1JCE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QT7O1JCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736957518; x=1768493518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0B1PHPYYRVkoUCEq8gNVXnuXlRqnVJ1xQjc1Cm1Buvs=;
  b=QT7O1JCEbdn74awDzjLPSPcqI4RYLLZia7wu3cZCr72ZIHOJxyykUiAk
   N89bvxoHGhlb+TBA0pN7pPA/EIbs+r9wcjMUzPsAJuq3FKmhbzoEeYdFG
   bI9TEsvb9nZcBInTwIWNnJkTvM/bSNEWJ97zN5M3k/Pf+j1vv3GJf7zqb
   NWNNfxK/KCr4Xf2fxQx1Zfr1gpG5M6uvzmcVy/ZbSunkzCgwUPsA3Nag9
   1FyINlDlicxmNLWG2LsJ6FyTqNAhmWEwsTpD0IMG7vkYal68lRp2mT3yH
   8D8Dc2wix8NGEoUGy47f80S+JBXJB6Xb2FskO6B7nX2/0BORapwmzNSmP
   g==;
X-CSE-ConnectionGUID: an/i2IoPQO+Y/WXBRlJTWg==
X-CSE-MsgGUID: NhipAnJIR5uN/WelZ3XFYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37413211"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37413211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 08:11:58 -0800
X-CSE-ConnectionGUID: iyGfzylKRr66yztkiXwQJw==
X-CSE-MsgGUID: EiVpdWskRhqICjscrXw6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128456425"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2025 08:11:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY5zl-000QYt-2t;
	Wed, 15 Jan 2025 16:11:53 +0000
Date: Thu, 16 Jan 2025 00:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: [linux-next:master 5605/8908] dmem.c:undefined reference to
 `page_counter_set_low'
Message-ID: <202501160039.ioV3GsXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7bb221a638962d487231ac45a6699fb9bb8f9fa
commit: b168ed458ddecc176f3b9a1f4bcd83d7a4541c14 [5605/8908] kernel/cgroup: Add "dmem" memory accounting cgroup
config: m68k-randconfig-r132-20250115 (https://download.01.org/0day-ci/archive/20250116/202501160039.ioV3GsXw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250116/202501160039.ioV3GsXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160039.ioV3GsXw-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/cgroup/dmem.o: in function `get_cg_pool_unlocked':
>> dmem.c:(.text+0x6be): undefined reference to `page_counter_set_low'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `dmem_cgroup_state_evict_valuable':
>> dmem.c:(.text+0x210): undefined reference to `page_counter_calculate_protection'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `set_resource_min':
>> dmem.c:(.text+0x234): undefined reference to `page_counter_set_min'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `set_resource_low':
   dmem.c:(.text+0x246): undefined reference to `page_counter_set_low'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `set_resource_max':
>> dmem.c:(.text+0x258): undefined reference to `page_counter_set_max'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `dmemcs_offline':
   dmem.c:(.text+0x5a8): undefined reference to `page_counter_set_min'
>> m68k-linux-ld: dmem.c:(.text+0x5ae): undefined reference to `page_counter_set_low'
>> m68k-linux-ld: dmem.c:(.text+0x5b4): undefined reference to `page_counter_set_max'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `get_cg_pool_unlocked':
   dmem.c:(.text+0x784): undefined reference to `page_counter_set_min'
   m68k-linux-ld: dmem.c:(.text+0x79a): undefined reference to `page_counter_set_max'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `dmem_cgroup_try_charge':
>> dmem.c:(.text+0xad6): undefined reference to `page_counter_try_charge'
   m68k-linux-ld: kernel/cgroup/dmem.o: in function `dmem_cgroup_uncharge':
>> dmem.c:(.text+0x1178): undefined reference to `page_counter_uncharge'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
