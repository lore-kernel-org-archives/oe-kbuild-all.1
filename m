Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1171146A66
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714721541; cv=none; b=WIxp6yFdn8FtylMlStBlRWPvjh5LK5S7DNvuMuawxD094TQ9mhGHNH9X1OBBsbYdwvK6hDFh8KQcWdHV69Moyv+ve/SuXK85o99hxo6RJ99iRhJa6mlHdbPobvV1/wDwaRgsRh45nOAF/2GfN63u4QCIVItFrXXz7BolXEjx5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714721541; c=relaxed/simple;
	bh=6PdqXzv85QGObWkHvAJ7Hdqh3/wrQM6ZOSs41qBss2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgOhIzFSutXMD4RCTBrm0Ry47YEncdBdL1sLJ0O8osK+Skvo/uGdGG6/vloUwXv/ziALELr1kYTlqqpHWS5jyW2H3ETGxkxsxY2m0LrxrqG4UCdbMqgm0D6WvghyCYG1rntRNo7SSpYsSeoEWeWivIL7ycDTEBFxSrR6jcIMflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsPElzgB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsPElzgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714721540; x=1746257540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PdqXzv85QGObWkHvAJ7Hdqh3/wrQM6ZOSs41qBss2Y=;
  b=ZsPElzgBzIKvKXB2321qNtceIZOdN7wmyNYhyh/8oAFAJA1E/IVOn3xQ
   9S65aPKAGuPhwH9OynaGi/82UB3rL1ARbX+tk3HJtuTsmgjtXM15O3Z9Q
   J7Ggbb+LGMBXPh3dtw7n4YQ+98XlKrHtQMTSOYLZIi4FRTYcYX2QwHpih
   ehylP4N+yZRU7n7g9+9BNMwkyJlkJ1QLrCqxZHpW/bjTUDjj2rOW+F0BV
   ORxrt0FCUEDbdo/b6Dixr8ItAQZ33d2D0A+PNcQoNy3t4qehC06U6tQ9L
   sz3zWqwzfmTwveetyQbOww4EVN+RarRFX1yil9eDfDkkQ937ttHinUjgk
   A==;
X-CSE-ConnectionGUID: efkZwBzuR32zpZe92Q1m2Q==
X-CSE-MsgGUID: mSO/eXGBRlqiJxOLeHyYHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10683874"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10683874"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 00:32:19 -0700
X-CSE-ConnectionGUID: dvwcwS1RSludF40r8p14yA==
X-CSE-MsgGUID: pFabIjbZQaCE7fSQ9iUOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27353331"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 May 2024 00:32:18 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2nOx-000BQC-33;
	Fri, 03 May 2024 07:32:15 +0000
Date: Fri, 3 May 2024 15:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10455/10463]
 include/linux/blkdev.h:733:(.text+0x260): relocation truncated to fit:
 R_RISCV_GPREL_I against `.LANCHOR1'
Message-ID: <202405031559.2nHyrpwv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
commit: 5070493a645c67e42b3e86b5cad9796e831281dc [10455/10463] Merge branch 'sysctl-next' of git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git
config: riscv-randconfig-c023-20221031 (https://download.01.org/0day-ci/archive/20240503/202405031559.2nHyrpwv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031559.2nHyrpwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031559.2nHyrpwv-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: section .data LMA [00000000012ee000,000000000215c197] overlaps section .text LMA [00000000000b7734,0000000002b4b903]
   riscv64-linux-ld: section .data..percpu LMA [00000000031e8000,0000000003206a5f] overlaps section .rodata LMA [0000000002b4db00,000000000326a2ad]
   riscv64-linux-ld: section .init.pi.text VMA [ffffffff82b4b904,ffffffff82b4da37] overlaps section .data VMA [ffffffff82000000,ffffffff82e6e197]
   riscv64-linux-ld: section .got VMA [ffffffff82e6e198,ffffffff82e6e1a7] overlaps section .rodata VMA [ffffffff82b4db00,ffffffff8326a2ad]
   riscv64-linux-ld: section .init.pi.rodata.str1.8 VMA [ffffffff8326a2b0,ffffffff8326a332] overlaps section .bss VMA [ffffffff82f61000,ffffffff83ef965f]
   block/genhd.o: in function `bdev_nr_sectors':
>> include/linux/blkdev.h:733:(.text+0x260): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR1'
   block/genhd.o: in function `genhd_device_init':
>> block/genhd.c:890:(.init.text+0xa): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR1'
   block/early-lookup.o: in function `devt_from_partuuid':
   block/early-lookup.c:71:(.init.text+0x188): relocation truncated to fit: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata section in block/genhd.o
   drivers/clk/clk.o: in function `of_clk_src_onecell_get':
   drivers/clk/clk.c:4975:(.text+0x5bac): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR3'
   drivers/clk/clk.o: in function `trace_clk_unprepare':
   include/trace/events/clk.h:74:(.init.text+0x5b4): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR3'
   drivers/base/core.o: in function `memalloc_flags_restore':
   include/linux/sched/mm.h:355:(.text+0x46d6): relocation truncated to fit: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata section in block/genhd.o
   drivers/base/devtmpfs.o: in function `devtmpfs_create_node':
   drivers/base/devtmpfs.c:131:(.text+0x98a): relocation truncated to fit: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata section in block/genhd.o
   drivers/base/devtmpfs.o: in function `dev_mynode':
   drivers/base/devtmpfs.c:295:(.text.unlikely+0x1a0): relocation truncated to fit: R_RISCV_GPREL_I against symbol `block_class' defined in .rodata section in block/genhd.o
   block/blk-mq-tag.o: in function `kmalloc_node_noprof':
   include/linux/slab.h:677:(.text+0x4ace): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR1'
   block/blk-stat.o: in function `rcu_read_unlock':
   include/linux/rcupdate.h:868:(.text+0x127e): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR2'
   block/blk-mq-sysfs.o: in function `blk_mq_hw_sysfs_nr_reserved_tags_show':
   block/blk-mq-sysfs.c:79:(.text+0x52): additional relocation overflows omitted from the output


vim +733 include/linux/blkdev.h

322cbb50de7118 Christoph Hellwig 2022-01-24  730  
322cbb50de7118 Christoph Hellwig 2022-01-24  731  static inline sector_t bdev_nr_sectors(struct block_device *bdev)
322cbb50de7118 Christoph Hellwig 2022-01-24  732  {
322cbb50de7118 Christoph Hellwig 2022-01-24 @733  	return bdev->bd_nr_sectors;
322cbb50de7118 Christoph Hellwig 2022-01-24  734  }
322cbb50de7118 Christoph Hellwig 2022-01-24  735  

:::::: The code at line 733 was first introduced by commit
:::::: 322cbb50de711814c42fb088f6d31901502c711a block: remove genhd.h

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
