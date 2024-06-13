Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC70613248E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 03:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718249866; cv=none; b=tLmWW6TGcYpvQYbqIbF2KnHLCueuiBIRuh4+hjTkd5SfcrKO36xDf4viJ4cave3LxjGSpMS1bZq4HSNMxW4cjLpGIGfn8KL33PPMo4vTqZSwnJWtDPPI0uKaaRktJ9oSAeQt427T8QfiVWeGJwQb11ABUJw1VtTqO8GbKo+Ga5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718249866; c=relaxed/simple;
	bh=uL0FFDBe1UhXhlcQbQY5+5FflM51ppY2nQ7n6iLlDxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGLx1JH24TuaSNBiGsqaQhAXACek5TbU5V92VkCmahhQGc2VFLl1ROY3WGI+tX1PkH7zWIZSqgsqULSgXOkulUh9GZdyx4Jf8gCkZy6kbAIOkVtxm5ucFIczNuZY3rDhvliLhdbw8xj0gxmrBoXrw7el0XdXbLlZEPotaKk9IRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzZmG6k9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzZmG6k9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718249865; x=1749785865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uL0FFDBe1UhXhlcQbQY5+5FflM51ppY2nQ7n6iLlDxk=;
  b=gzZmG6k9Ab0DkfHRfWI4KywwPv9AL3spCfcOxqck/UrM41ZaBGhC6CGM
   zPzRBYpM/FbvOiBQ9MnouJFEy5HS946BFX7YeOkJuY5OkBJoYeRkJSU2Y
   lmRwstu1OKhGUtseDokXjCvL1Hk94nb+GAeDCtl2almrj7Pej+kkfBOHY
   DhpZXxRjcd6osD2MoClvfULzFhpjL/qWSF7lcVD/O87bnbF/vLd/FdPYm
   GjYsx2VrlY/Lru0ZD36M5HrxWgPpSUyk+dourh29Lj+lXa124bi95CtS3
   UpcgOcHy9f/xf4pRwFisggwtye1K6Q6aNQxGJH4cPJWQ10YAx2SB3tI+5
   w==;
X-CSE-ConnectionGUID: SExZKfVNQhmMcwm0vsc7aA==
X-CSE-MsgGUID: Ms/8GDEpS6WVsnXPZzGl2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18901588"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18901588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:37:31 -0700
X-CSE-ConnectionGUID: pQZzpF0lTf+Jtqx9X9zN0A==
X-CSE-MsgGUID: +jEMV5+AS1OP9mPpvE9sbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40470100"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 20:37:30 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbHD-0002BR-19;
	Thu, 13 Jun 2024 03:37:27 +0000
Date: Thu, 13 Jun 2024 11:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 111/179] ld.lld: error: undefined symbol:
 tee_shm_register_kernel_buf
Message-ID: <202406131120.iHgdedf6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   54e158be0e2d1bd1a2afb3bfd135663c03f63a27
commit: a0f3bf1449bdfbea99babee760c8886ee574e42a [111/179] BACKPORT: FROMLIST: mailbox: mediatek: Add CMDQ secure mailbox driver
config: arm64-randconfig-002-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131120.iHgdedf6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131120.iHgdedf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131120.iHgdedf6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tee_shm_register_kernel_buf
   >>> referenced by mtk-cmdq-sec-tee.c
   >>>               drivers/mailbox/mtk-cmdq-sec-tee.o:(cmdq_sec_allocate_wsm) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [m]:
   - TEST_MAPLE_TREE [=m] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
