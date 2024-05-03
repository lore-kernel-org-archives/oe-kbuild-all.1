Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12561153BED
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744357; cv=none; b=eY6X8+rk0utZB3SewxC5XjMYHIA9M/k3M3WV5P7m0I5SSwPqAOjDDOwSJnxvJCDytICRN1apgCC0Snz8lnMejYNOppVs16EhGQJShiq94Qk0CAkthZY7+nK/H/zYcbtMaKVhMGYMzmDE0gCBPOEEDm+Nq7QEv3zsmC3oPsgb4sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744357; c=relaxed/simple;
	bh=ut7S/vNgQ7TXbs3F1CEQtGUDV25YA3pKfQrnFVZ301k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W41AZZTXSVCujlwI4yKF0VLchztFEBqmkYGkAgQ8Ayb/oSVwt37wYJduCrhF+l6rMxhzHn5txIsev314RGrmn7aE/NpGkZi1RQbiFIFcR9pSKc2u6QltZnDNtnC18hA91hed88LDi9m0T8u6wA38ncto2iXBY479GG7LfclnYoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVQYXVF0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVQYXVF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744356; x=1746280356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ut7S/vNgQ7TXbs3F1CEQtGUDV25YA3pKfQrnFVZ301k=;
  b=SVQYXVF0L6Q5paQyuYgsYNDluTdAE6eONv3yAzfs9/seLmr2W24buPBm
   7uEbNgyZvz+gJqSv/BQiDrW96tGFV1X99idJpd5u6BnDjFjLl2OI23Qlt
   4PgIyLyXEdjn2rAQu/qMOyezGWxweei91B4U8mcwhprT0qGjJvfb9YGvV
   vLWeCsWV9iZ5QOlt5DyKJ8rl8m25W6juq4pFWEzsJBD0KSBoJy8XhC82U
   s3y8s4Zi6e/6ZUKtQFDhbEmI28XKgwLPLNHG1K1hw/H03Egkb35fw66Un
   FHCWUFSmmUGXpBlPESgWUYkwa7M7oi0a/RJabSpgdBssewG3HvEGJHu7K
   g==;
X-CSE-ConnectionGUID: fdH2Ks0nRJa8ViYrYevDCQ==
X-CSE-MsgGUID: pUWjs2ynRsSl7PynBXdi5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10714415"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10714415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:36 -0700
X-CSE-ConnectionGUID: 8VLKqGa3RK6uT7bODamYaA==
X-CSE-MsgGUID: IE4UoIELQSitDrhzyfWTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27481251"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2024 06:52:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2tKy-000Bk4-1b;
	Fri, 03 May 2024 13:52:32 +0000
Date: Fri, 3 May 2024 21:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 950/1143]
 drivers/gpu/drm/ast/ast_post.c:351:28: error: 'AST_IO_MISC_PORT_WRITE'
 undeclared
Message-ID: <202405032117.YBWW5bWI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 12af9e35efffa226dc9ced8d18b00a6c88d1c1d2 [950/1143] drm/ast: Fix boot-up hang if no vbios
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240503/202405032117.YBWW5bWI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032117.YBWW5bWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032117.YBWW5bWI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ast/ast_post.c: In function 'ast_post_gpu':
>> drivers/gpu/drm/ast/ast_post.c:351:28: error: 'AST_IO_MISC_PORT_WRITE' undeclared (first use in this function)
     351 |         ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x0b);
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_post.c:351:28: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/ast/ast_post.c:352:32: error: 'AST_IO_GR_PORT' undeclared (first use in this function)
     352 |         ast_set_index_reg(ast, AST_IO_GR_PORT, 6, 0x05);
         |                                ^~~~~~~~~~~~~~


vim +/AST_IO_MISC_PORT_WRITE +351 drivers/gpu/drm/ast/ast_post.c

   345	
   346	void ast_post_gpu(struct drm_device *dev)
   347	{
   348		struct ast_device *ast = to_ast_device(dev);
   349	
   350		ast_set_def_ext_reg(dev);
 > 351		ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x0b);
 > 352		ast_set_index_reg(ast, AST_IO_GR_PORT, 6, 0x05);
   353	
   354		if (IS_AST_GEN7(ast)) {
   355			if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
   356				ast_dp_launch(dev);
   357		} else if (ast->config_mode == ast_use_p2a) {
   358			if (IS_AST_GEN6(ast))
   359				ast_post_chip_2500(dev);
   360			else if (IS_AST_GEN5(ast) || IS_AST_GEN4(ast))
   361				ast_post_chip_2300(dev);
   362			else
   363				ast_init_dram_reg(dev);
   364	
   365			ast_init_3rdtx(dev);
   366		} else {
   367			if (ast->tx_chip_types & AST_TX_SIL164_BIT)
   368				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);	/* Enable DVO */
   369		}
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
