Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573DA1509A8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714739135; cv=none; b=C/S9b08hYWOXJA0hAaSnNl+/N7xOak7REArssDjyZbeyVHfy0bv3g8h9XfOZEfujW0sJ3sX5mJiw9YTF02cStESAn0G1fq3nc/6ITZWTp0Oi3uCv/Lx558xfeL+X+gG1BG36VJQmnOOAj7/cTTJZ92G5AkLYhaj5LAevx9CBqwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714739135; c=relaxed/simple;
	bh=EsnEyi2okC/R3rqmzZtvET+7vMx1V05zhbbhQCXECQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DvX/lrT+ylX/rIUqrvfn7QvQjoHbSvPAtZ8nLASNo01jzhQ5SbHfMP1M9id2QYj1U9l6asZXPKOIw4s6O9rW7emLjbSLIYlzI4y+ZvYOxD2V655Frhr9QyqA9ak4LteSsQH9Q0g03RC2+XuFPgB6tuc9tY2dx6GlWr23CamLOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8JSK8mG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8JSK8mG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714739133; x=1746275133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EsnEyi2okC/R3rqmzZtvET+7vMx1V05zhbbhQCXECQ4=;
  b=b8JSK8mGjxUgVcE8oExS7BDv4FHmE7E9Oi73ES+mzEE4BloLhgPKJ8UJ
   ppFyXyD+Pg7UQB7wqTLYPnlibDzs5t3m58r+v3/9tVfStAN7tXpnU3o4e
   ZwicyQgZQTpKpIWRt3OvCGhDyMub5Cr2QvOwdj94ipPFgMR3IH0/+D9FF
   Mxf/xhEX4vce8xlJtyTktOP74CT1HYoh0Je1LayP2hQ5MT3YV/sEXlhqt
   EG7U5pIE0xbUQzn/AVhPW60CuhoWspux5IGTqk04/+rVm7ELGvht9thGK
   6f8mBeGIVx1sS5PNb0MeawXxDuwnUm9I5gd78lheB6bZ/HS8YbD733NmQ
   g==;
X-CSE-ConnectionGUID: lcCxOyoZTvuZ1VmeTaVlDA==
X-CSE-MsgGUID: clG1PqFYTR2JXZ5ouwxiVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="11083068"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="11083068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 05:25:32 -0700
X-CSE-ConnectionGUID: GZX51e8MT9+pKH3NBZbsaw==
X-CSE-MsgGUID: YxYPQpWqQYWCYkV8Pjatdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27953034"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2024 05:25:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2ryj-000BgS-0z;
	Fri, 03 May 2024 12:25:29 +0000
Date: Fri, 3 May 2024 20:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 950/1143]
 drivers/gpu/drm/ast/ast_post.c:351:21: error: use of undeclared identifier
 'AST_IO_MISC_PORT_WRITE'
Message-ID: <202405032008.dX2MxMzf-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240503/202405032008.dX2MxMzf-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032008.dX2MxMzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032008.dX2MxMzf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ast/ast_post.c:351:21: error: use of undeclared identifier 'AST_IO_MISC_PORT_WRITE'
     351 |         ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x0b);
         |                            ^
>> drivers/gpu/drm/ast/ast_post.c:352:25: error: use of undeclared identifier 'AST_IO_GR_PORT'
     352 |         ast_set_index_reg(ast, AST_IO_GR_PORT, 6, 0x05);
         |                                ^
   2 errors generated.


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
