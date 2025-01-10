Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF60A6AA7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736470154; cv=none; b=AAym772yo3fUdTppg1eDo2iTVvKWnwDFGZh6NeD/bjYKPr0Hu21U9yNI3GiMnoxNY8dsgJqu51YVWykq/izBrEGRNmebGwzykb12S5xz9UQllDR4XtyCfenpn3dqUkOyLdFgvpiZoJCmH3iVqWQi45eCltH0jAyBVd2w3xRw6uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736470154; c=relaxed/simple;
	bh=kqL4/untIGQG3pVXkfbLBQuGajnLyXeBr+alwXuI4VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4qUOvUCHEWPDOqENwsgio0PkJ0rq0PH85WdqGSgmMAJIb1rP+2ryFIndfqcgDf3e2dGfNIQjblwuFYH1/Ikx5nq4Rsx75u1NQlK0J6oMW0libVM9DE8rpYxqIk1MpIv+FGoeG7z8SzEUb1XFvbuk0D8W/mdAlXA6sqFsLoaSX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEAGRH/y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEAGRH/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736470153; x=1768006153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kqL4/untIGQG3pVXkfbLBQuGajnLyXeBr+alwXuI4VU=;
  b=QEAGRH/yHMQuOkjBrWpt3ImOf2jQyzK/VcVdC4rmAWDqLrAqCyQXi0FX
   ZUKCQvjwRxrHipHSZbrrY64LdCux38JtDOwo9sMiGRK11z7MiOZ+hLKwn
   OdcVz1c7N7yxl4hOzBTFYCDF5IR5Hl/zQt009JR4Alog2Fu5fA9HTsP0Z
   BZkpOL/F02FM6Q/mmFjBPN1Yj3MFAEJI5QQYO43FVzwUgnf0MNSm37HzH
   zKbTNuTh8r4E/dGRvdNK3E19rGxTXEqg0CIagymmLxobGninJh3jwchmp
   NHbVJQUp7vcmm11UoQzHFNeNhocogATlecVA2w4rzUTKPmP32NZXpM1Mi
   g==;
X-CSE-ConnectionGUID: VNiJ60oTS/C4UiuIKLfWyA==
X-CSE-MsgGUID: wXV6dyj5RHC6Zzdrc7SuAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40436260"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="40436260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 16:49:13 -0800
X-CSE-ConnectionGUID: ed3GJVWHRXmVT93kJ3wuhg==
X-CSE-MsgGUID: wUO0b41hQ5+gfeeuF2+xaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="103765803"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jan 2025 16:49:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW3D3-000ILF-0H;
	Fri, 10 Jan 2025 00:49:09 +0000
Date: Fri, 10 Jan 2025 08:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1815/1815] block/blk-io-hierarchy/iodump.c:561:7:
 warning: no previous prototype for function '__bio_stage_hierarchy_start'
Message-ID: <202501100852.BzTb0ttz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c329afbe44a4c2722501c891e29b8409d2173549
commit: 67e0c6872f92397d82e9a938623105573f590fc3 [1815/1815] blk-io-hierarchy: support hierarchy stats for bio lifetime
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501100852.BzTb0ttz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100852.BzTb0ttz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100852.BzTb0ttz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-io-hierarchy/iodump.c:561:7: warning: no previous prototype for function '__bio_stage_hierarchy_start' [-Wmissing-prototypes]
     561 | void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
         |       ^
   block/blk-io-hierarchy/iodump.c:561:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     561 | void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
         | ^
         | static 
   1 warning generated.


vim +/__bio_stage_hierarchy_start +561 block/blk-io-hierarchy/iodump.c

1bf8f90fb90c60 Yu Kuai 2024-11-27  560  
1bf8f90fb90c60 Yu Kuai 2024-11-27 @561  void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
1bf8f90fb90c60 Yu Kuai 2024-11-27  562  				 loff_t *pos)
1bf8f90fb90c60 Yu Kuai 2024-11-27  563  {
1bf8f90fb90c60 Yu Kuai 2024-11-27  564  	struct pos_data *pdata = &bstage_ddata->pdata;
1bf8f90fb90c60 Yu Kuai 2024-11-27  565  	struct rq_dump_data *rq_ddata = &bstage_ddata->rq_ddata;
1bf8f90fb90c60 Yu Kuai 2024-11-27  566  
1bf8f90fb90c60 Yu Kuai 2024-11-27  567  retry:
1bf8f90fb90c60 Yu Kuai 2024-11-27  568  	if (stage_is_bio(pdata->stage)) {
1bf8f90fb90c60 Yu Kuai 2024-11-27  569  		struct list_head *list;
1bf8f90fb90c60 Yu Kuai 2024-11-27  570  		struct bio_dump_data *bio_ddata =
1bf8f90fb90c60 Yu Kuai 2024-11-27  571  			get_bio_stage_ddata(rq_ddata->q, pdata->stage);
1bf8f90fb90c60 Yu Kuai 2024-11-27  572  
1bf8f90fb90c60 Yu Kuai 2024-11-27  573  		if (!bio_ddata) {
1bf8f90fb90c60 Yu Kuai 2024-11-27  574  			bio_stage_start_next_stage(bstage_ddata, pos);
1bf8f90fb90c60 Yu Kuai 2024-11-27  575  			goto retry;
1bf8f90fb90c60 Yu Kuai 2024-11-27  576  		}
1bf8f90fb90c60 Yu Kuai 2024-11-27  577  
1bf8f90fb90c60 Yu Kuai 2024-11-27  578  		spin_lock_irq(&bio_ddata->lock);
1bf8f90fb90c60 Yu Kuai 2024-11-27  579  		list = seq_list_start(&bio_ddata->head, pdata->count);
1bf8f90fb90c60 Yu Kuai 2024-11-27  580  		if (list)
1bf8f90fb90c60 Yu Kuai 2024-11-27  581  			return list;
1bf8f90fb90c60 Yu Kuai 2024-11-27  582  
1bf8f90fb90c60 Yu Kuai 2024-11-27  583  		spin_unlock_irq(&bio_ddata->lock);
1bf8f90fb90c60 Yu Kuai 2024-11-27  584  		bio_stage_start_next_stage(bstage_ddata, pos);
1bf8f90fb90c60 Yu Kuai 2024-11-27  585  		goto retry;
1bf8f90fb90c60 Yu Kuai 2024-11-27  586  	}
1bf8f90fb90c60 Yu Kuai 2024-11-27  587  
1bf8f90fb90c60 Yu Kuai 2024-11-27  588  	if (pdata->stage == STAGE_BIO &&
1bf8f90fb90c60 Yu Kuai 2024-11-27  589  	    __rq_hierarchy_start(rq_ddata, pdata->count))
1bf8f90fb90c60 Yu Kuai 2024-11-27  590  		return bstage_ddata;
1bf8f90fb90c60 Yu Kuai 2024-11-27  591  
1bf8f90fb90c60 Yu Kuai 2024-11-27  592  	return NULL;
1bf8f90fb90c60 Yu Kuai 2024-11-27  593  }
1bf8f90fb90c60 Yu Kuai 2024-11-27  594  

:::::: The code at line 561 was first introduced by commit
:::::: 1bf8f90fb90c600d9f372e6be4ef251cc8905f04 block-io-hierarchy: core hierarchy stats and iodump implementation

:::::: TO: Yu Kuai <yukuai3@huawei.com>
:::::: CC: Yu Kuai <yukuai3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
