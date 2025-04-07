Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9AA20C022
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043583; cv=none; b=PhwN3i9PlyyTm/VrzBVoMu5PAf0x/Fb1m4bu2F6KBzIgHnEqmf/4z6wvfE+oUX33EJaTK98ZTFP7ILSsdL47VKgviMqAT+4ZTwBdg4W1YyW47zQWbaFno7NPx2KoiAsaHYNOZXvz6KnpumJEoPM5M+FJm3f0xVWPzGQwmY02egQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043583; c=relaxed/simple;
	bh=Qz6DeCIA20LRd/iH/nj9cMu5X0fbfswgaArV9AyhO4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HgzpFUHld4fNRcgj6UFtGLhMff0tc5V/TpPV4r45XbSKao6gNF+tcWWs+/AFWVJdupJykvjcOsoSypIOjUNqvsCCnzEbFYe+oRyTqJuZXpmPbDJey4cKt9jcUZNc8dU7JE6O30PEC/KaifJF1wgTHrEVID8LpQ+COcoBgznzd9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n02LsLp5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n02LsLp5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744043582; x=1775579582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qz6DeCIA20LRd/iH/nj9cMu5X0fbfswgaArV9AyhO4k=;
  b=n02LsLp55Wwa3SVJkxb4A6DL9NtEutZNHhxHxoOWamqMcdBjJX76TvyA
   3J3zU6EmYC/ghRiQiOgnIUC8e9zLQQvbTt04UioqOR/qdjwqAaBIPO4fk
   LViCrMtXTTfPvEfhJNKk4UZROQlv2M1I7Ff1t4+UP7X/YS53H60Df5Eis
   q6JMYDySt7DY6pPIbArqdPXffhpms/NaPTbB7QEdSdc9ibtO8/zcjJS6k
   P58LKmtB3gspVbESEaXR/CrVl/Ualz6v3O3rVeWjdat5Jo69VDaIi1Ejj
   9+7sowjMxp+wHUclGT+10aFWwTQRHIJfEtFp+7q1iGnv8BbeTmENG8vwX
   Q==;
X-CSE-ConnectionGUID: 5Y5E6kl/TfyE93FniaSHqA==
X-CSE-MsgGUID: hi2Ho+D/SNO6ICfRdW95mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62841538"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62841538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:33:01 -0700
X-CSE-ConnectionGUID: iQLQbc9QS0OQcxHPBsThog==
X-CSE-MsgGUID: 7WNkOmCnTb6GYqX18IIZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128009836"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Apr 2025 09:33:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1pP7-0003bT-2v;
	Mon, 07 Apr 2025 16:32:57 +0000
Date: Tue, 8 Apr 2025 00:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 6/6]
 drivers/net/ethernet/mellanox/Kconfig:27: unexpected 'if' within menu block
Message-ID: <202504080036.2a9QxEqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   f7e3ecf7fcc8051bc46bde3b34874ad55243d493
commit: f7e3ecf7fcc8051bc46bde3b34874ad55243d493 [6/6] drivers/lib: Move mlx5_core to dedicated place
config: riscv-randconfig-001-20250407 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080036.2a9QxEqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080036.2a9QxEqu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/Kconfig:27: unexpected 'if' within menu block
   drivers/net/ethernet/Kconfig:206: 'if' in different file than 'if'
   drivers/net/ethernet/mellanox/mlx5/core/Kconfig:6: location of the 'if'
   drivers/net/Kconfig:648: 'if' in different file than 'if'
   drivers/net/ethernet/mellanox/mlx5/core/Kconfig:6: location of the 'if'
>> drivers/Kconfig:252: unexpected 'menu' within if block
>> Kconfig:35: syntax error
>> drivers/Kconfig:2: missing end statement for this entry
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1 shuffle=412289413
   make[2]: *** [Makefile:731: oldconfig] Error 2 shuffle=412289413
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=412289413
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=412289413
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/net/ethernet/mellanox/Kconfig:27: unexpected 'if' within menu block
   drivers/net/ethernet/Kconfig:206: 'if' in different file than 'if'
   drivers/net/ethernet/mellanox/mlx5/core/Kconfig:6: location of the 'if'
   drivers/net/Kconfig:648: 'if' in different file than 'if'
   drivers/net/ethernet/mellanox/mlx5/core/Kconfig:6: location of the 'if'
>> drivers/Kconfig:252: unexpected 'menu' within if block
>> Kconfig:35: syntax error
>> drivers/Kconfig:2: missing end statement for this entry
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1 shuffle=412289413
   make[2]: *** [Makefile:731: olddefconfig] Error 2 shuffle=412289413
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=412289413
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=412289413
   make: Target 'olddefconfig' not remade because of errors.


vim +/if +27 drivers/net/ethernet/mellanox/Kconfig

5a2cc190eb3fe5 Jeff Kirsher 2011-05-13  26  
5a2cc190eb3fe5 Jeff Kirsher 2011-05-13 @27  endif # NET_VENDOR_MELLANOX

:::::: The code at line 27 was first introduced by commit
:::::: 5a2cc190eb3fe58fe519795c509b01b25795992e mlx4: Move the Mellanox driver

:::::: TO: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
