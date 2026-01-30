Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FAF36F407
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775796; cv=none; b=UsEFfE9OJzkPwBD2GvaOd3AQCxzyeTYFRPRyYLRI8NQPKEl/td7K4ZBGhJGT9OdKcygBZC8ZTQ1b/3EKMi4R+JLxcQlqLKrctIxBZQFLq2qhR6tpfLwbnNlpPuWIT1KKuH4j87S5lzS82K5FcJDiPNlBpZyML8BhofUWinV7TWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775796; c=relaxed/simple;
	bh=bMZUOAMr0nS2KqlpLXn3BDN/QDQpaboew7ed3rh9IfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sOOgG9tlDKMYqJ+dWqGLdBQkFUj5LSzHdqpE8Bogs81U+MDd1I1QOZfN0LPJ+vaG5daL+wBV+stJUqMiEgLH+HF2qXGJPAr3KK104fkJlUCgaM2GfgyuIRTlG/U2+fwRFfA9hlj/pWZBPPFRnrFxU4RoJqPk997j9QUngBib4mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpBfUUZ7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpBfUUZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769775794; x=1801311794;
  h=date:from:to:cc:subject:message-id;
  bh=bMZUOAMr0nS2KqlpLXn3BDN/QDQpaboew7ed3rh9IfE=;
  b=DpBfUUZ7l17NvfykDCvN+HW2lZUUgHJWbACp7UwqE1KlvW2D3FyiR6v+
   eYs0Z4nltXLdCvyWbd9vRq1GnPdIAuEwqMSqUTvFrjnq0iw+sU6HthPZL
   B5OIMH7ZfVJpawa4id/3lxNL7HzoxTLNeSLuIl0RIHpZlTqDO9Y4QABRy
   eNqhzjwAdFRClsXLPNrMWIH7kkqf/NzhISd6g2keQOHuahwPJVCfLgTmE
   PeqfNCOidmXV3DhTJbdZBeN5duLYVvBaCcy3S2//BUilahfkosjllfCrE
   smNHxNHdCFTCxXN1dTdAQdG9pyoP7nA+scWDw0BI0kDyt0AoIS3bAGD+U
   A==;
X-CSE-ConnectionGUID: 6vdsmOz5QkSTY8V5IuuMcQ==
X-CSE-MsgGUID: P4h5mfiJTzKBTjCpH3z8tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74649869"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="74649869"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 04:23:13 -0800
X-CSE-ConnectionGUID: 5OJz9eN9TuiHRgFO85F/Iw==
X-CSE-MsgGUID: Qsrzel74QdGD5NGufc0aZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="208085607"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2026 04:23:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlnWn-00000000cxk-0tre;
	Fri, 30 Jan 2026 12:23:09 +0000
Date: Fri, 30 Jan 2026 20:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [mtd:mtd/next 24/24] drivers/mtd/mtdcore.c:2651:undefined
 reference to `mtd_virt_concat_destroy_joins'
Message-ID: <202601302048.TyA0Uh81-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
head:   285871f1ff3c251cba288e7dd9e373c04149a509
commit: 285871f1ff3c251cba288e7dd9e373c04149a509 [24/24] mtd: Add driver for concatenating devices
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20260130/202601302048.TyA0Uh81-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302048.TyA0Uh81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302048.TyA0Uh81-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/mtd/mtdcore.o: in function `cleanup_mtd':
>> drivers/mtd/mtdcore.c:2651:(.exit.text+0x8): undefined reference to `mtd_virt_concat_destroy_joins'
>> microblaze-linux-ld: drivers/mtd/mtdcore.c:2651:(.exit.text+0x14): undefined reference to `mtd_virt_concat_destroy_items'


vim +2651 drivers/mtd/mtdcore.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  2638  
^1da177e4c3f41 Linus Torvalds       2005-04-16  2639  static void __exit cleanup_mtd(void)
^1da177e4c3f41 Linus Torvalds       2005-04-16  2640  {
285871f1ff3c25 Amit Kumar Mahapatra 2026-01-29  2641  	mtd_virt_concat_destroy_joins();
285871f1ff3c25 Amit Kumar Mahapatra 2026-01-29  2642  	mtd_virt_concat_destroy_items();
e8e3edb95ce6a1 Mario Rugiero        2017-05-29  2643  	debugfs_remove_recursive(dfs_dir_mtd);
660685d9d1b473 Artem Bityutskiy     2013-03-14  2644  	cleanup_mtdchar();
^1da177e4c3f41 Linus Torvalds       2005-04-16  2645  	if (proc_mtd)
^1da177e4c3f41 Linus Torvalds       2005-04-16  2646  		remove_proc_entry("mtd", NULL);
15bce40cb3133b David Woodhouse      2009-04-05  2647  	class_unregister(&mtd_class);
9718c59c0a1604 Christoph Hellwig    2021-11-05  2648  	bdi_unregister(mtd_bdi);
fa06052d637bf3 Jan Kara             2017-04-12  2649  	bdi_put(mtd_bdi);
35667b9983a2a8 Johannes Thumshirn   2015-07-08  2650  	idr_destroy(&mtd_idr);
^1da177e4c3f41 Linus Torvalds       2005-04-16 @2651  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  2652  

:::::: The code at line 2651 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
