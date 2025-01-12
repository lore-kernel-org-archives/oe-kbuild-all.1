Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899CA192B62
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736674652; cv=none; b=VIIkRIw7cZc2CpdWkNUDpWl73eJgbtceCkPpcw8VhWVRyAj8yQhdfTRcME9VPZX9H/GmejqPB397KPGD8cNPDefkLBA90ztlRTyYdUsJZ0WdiJDWNW+tEFRAPcU8cYpJR7/KEZP8FFl6AVoIsapqEckTZdNViPNVCdHx87+DOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736674652; c=relaxed/simple;
	bh=yRHQl0lIsluuZ+iM8maitBdf1XafC4OYDutcCcqsBnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6HJi77cWrDp6dM3IfoFk4IgFZhtY8vs8raLGiZL0rt6pZs0Uc6QBColSpKO3ndSrusfI6EOe0lmQbcZIVPA4lTnXidhLqQvCJkoq/UYRxLpMdVaPThjdyH3ajESu+w8c7VRsEWzjTfKioMRw32EXABmAWAfhE1ah8iz7GRXx98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5QOypBh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5QOypBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736674651; x=1768210651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRHQl0lIsluuZ+iM8maitBdf1XafC4OYDutcCcqsBnc=;
  b=i5QOypBh3iulcdx34K/3cIeOX/lFKK94BGTmMT6ro7OWp/VYaF0LS7ga
   mPHiun6x4wswdvau/SaoXfdL5Gbm7hAj/4k0EgVwDfPHiaMsDTYqPXj4D
   Y/7lWGt/MG6CrzspsFJxkjtgf2pT9KptTCZmmXD3L/eLi5h4ZOK4XMtDT
   5TpcpJTFS31CHXXPx4XmG8VcqysUtrM6cs1zicELhf55i/JN0FWnMdFXq
   1lfQlmgp6zNVh8N0nojTqGFoLO/MXQUIZ/j2vyHRPUAN0P6+pEYrRPJJR
   IC6xW6XN0miPaWO8BFGt0ohjHTxH69BPiBIzr6dJP8/90o443U3rLuvhD
   Q==;
X-CSE-ConnectionGUID: w5MKpt/1TEKM9b4/Y5sX+g==
X-CSE-MsgGUID: sTwpJe+VQvmvTaYoQRL8/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36799315"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36799315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 01:37:30 -0800
X-CSE-ConnectionGUID: fntBk+KTSUO4s+ocvrGnow==
X-CSE-MsgGUID: XxcadAsASESrG1ZVnpemaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127422742"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2025 01:37:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWuPO-000Llt-1H;
	Sun, 12 Jan 2025 09:37:26 +0000
Date: Sun, 12 Jan 2025 17:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: undefined reference to `gen_pool_size'
Message-ID: <202501121716.x1gltIJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Grygorii,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62cef9a5c673f1b8083159f5dc03c1c5daced2f
commit: 99f629718272974405e8d180d2fa70c03c06d61f net: ethernet: ti: cpsw: drop TI_DAVINCI_CPDMA config option
date:   6 years ago
config: alpha-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20250112/202501121716.x1gltIJk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121716.x1gltIJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121716.x1gltIJk-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: warning: arch/alpha/lib/styncpy.o: missing .note.GNU-stack section implies executable stack
   alpha-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   alpha-linux-ld: warning: arch/alpha/lib/styncpy.o: missing .note.GNU-stack section implies executable stack
   alpha-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   alpha-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_desc_pool_destroy':
>> (.text+0x34): undefined reference to `gen_pool_size'
>> alpha-linux-ld: (.text+0x38): undefined reference to `gen_pool_size'
>> alpha-linux-ld: (.text+0x48): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0x50): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0xb4): undefined reference to `gen_pool_size'
   alpha-linux-ld: (.text+0xb8): undefined reference to `gen_pool_size'
   alpha-linux-ld: (.text+0xc8): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0xd0): undefined reference to `gen_pool_avail'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_desc_pool_create.constprop.0':
>> (.text+0x3f4): undefined reference to `devm_gen_pool_create'
>> alpha-linux-ld: (.text+0x428): undefined reference to `devm_gen_pool_create'
   alpha-linux-ld: (.text+0x4a4): undefined reference to `gen_pool_add_virt'
   alpha-linux-ld: (.text+0x4ac): undefined reference to `gen_pool_add_virt'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `__cpdma_chan_free':
>> (.text+0x714): undefined reference to `gen_pool_free'
   alpha-linux-ld: (.text+0x71c): undefined reference to `gen_pool_free'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_chan_submit':
>> (.text+0x1bcc): undefined reference to `gen_pool_alloc'
   alpha-linux-ld: (.text+0x1bd8): undefined reference to `gen_pool_alloc'
   alpha-linux-ld: (.text+0x205c): undefined reference to `gen_pool_free'
   alpha-linux-ld: (.text+0x206c): undefined reference to `gen_pool_free'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_check_free_tx_desc':
>> (.text+0x20f4): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0x20f8): undefined reference to `gen_pool_avail'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
