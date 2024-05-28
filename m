Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C017966D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 20:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929199; cv=none; b=XPc0m2qgahnI8FwFyFK/ByGsp4RJ9g8RnuYr0o1Ncy1gfB55eTL0ZKNSBDxsc3k+gIGhLigjjTwhqx0W/ZBQP0Pqnj3Kf5MnEj6eiPmWUwMfeNpIfAgIE/VXijWMhDBQPGJ+dcsdwRulkkY0Ranos7NpkUVSkACKk0cfi1Idl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929199; c=relaxed/simple;
	bh=Apx9Osnr3tgeVPJXLndRCLUFyp4SGW5D13xAh8N5qyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abvMfLT5dlSG+E66K2C0VBORgdrKZ0tUIohiBtCSdo2/DxCaGA9VmTiNvXFicduKFXOpPikiY2U5NKZWJH4nM/1E20hclkMDCskKOmUTHapxwXgov3DyItQdvywCf0ZRWMDj5A+c/++qFY6T4IEq8WYwocDolg8ePOgK3EfcCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsjJTC2B; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsjJTC2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716929197; x=1748465197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Apx9Osnr3tgeVPJXLndRCLUFyp4SGW5D13xAh8N5qyo=;
  b=FsjJTC2BEIWe1s61KJYmpVvGWKnoBOJAVXxM5windqSCpe05hNopNnZ6
   gcbqtLK9sOE8boGUxu1dJAw4np5G8OxLV+YlA3HsSItQJDKDasB0sSyGr
   g3f+BtckMow4xv5hk7JmkjyLt6gB4PJ/2yP30pKv0Vz9CiL7saOsOODtO
   8PnXXLUfNEoP1JuAW8z5XXJBzFpayG3+RTtPvEHK1Y6893HTg05Nan9mM
   OMfBT2YeChyYPLS9sr+qwLPmnbiwSubnSPZWJAmUwc177XargcfmxvhU8
   gkp4oca9RCBpQwDBnOf40LUfs3Ky0Tag8QkAnWUVszQd1OOMVrLKZm8tL
   g==;
X-CSE-ConnectionGUID: pdo6HEGbS4q0B23v9/zajQ==
X-CSE-MsgGUID: errpwdWeRe6UMY6lfo6K2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30803744"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="30803744"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 13:46:37 -0700
X-CSE-ConnectionGUID: 67zxuzjKS5KCgvg4w5T9uQ==
X-CSE-MsgGUID: Mfo29xe8R2a1pgWcrWnpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35801780"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 May 2024 13:46:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC3iL-000Cjz-2C;
	Tue, 28 May 2024 20:46:33 +0000
Date: Wed, 29 May 2024 04:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v5 4/13] mm/page_frag_cache.o: warning:
 objtool: __jump_table+0x0: special: can't find orig instruction
Message-ID: <202405290452.DxhIC80p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v5
head:   5fe53a7c019262862519bf2365207b2caf7773cf
commit: d480dbaf404842ea625384a125ea158018d32f30 [4/13] mm: move the page fragment allocator from page_alloc into its own file
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240529/202405290452.DxhIC80p-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290452.DxhIC80p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290452.DxhIC80p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_frag_cache.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __jump_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
