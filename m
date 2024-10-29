Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCBF1422AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 21:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730238096; cv=none; b=MABMrGYEg7BX4Dn8KSyhwvPsa07r0glQyaucqdSYVzMDTBw56QtabOnszOMZ0rJ3+wKI4wTMx+IEvMwlgi3prxf2xhUCXxH4oH6wZU3tRLj8joh0tHSSKyKaYfclyI+OiqowbZ65x+t4QQ5VpZONFYKUUgVLP++WHa8PzroJU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730238096; c=relaxed/simple;
	bh=OdvuBcJQOgLvBP7NS1Aqs8pZzW9KDUZClURBdr660jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQZT9nnVYaaZ61fB3uOzKMNaVpqSiIF6irk5Wgp/vY+b3pKmyOhE7N3Y77gVUZOSavQjwLhqWTJYKHETJQqla1RvkR3Fnxu+Wi6kIf2WI80BLAKL1XwqlMyinDtYIjHSUe3H7xek5XMA3cs1cOBp+bOV+TMHCc4yTN38dnniPSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biiOxTlm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biiOxTlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730238093; x=1761774093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OdvuBcJQOgLvBP7NS1Aqs8pZzW9KDUZClURBdr660jY=;
  b=biiOxTlmXjkQgu5nINjV1RyrvDQANZO8fOHPw4hLbC1qSc2WJkDqteac
   X9hiksXecCw+kQapCJfrbP03cFG+K96+/7mdiUD7YylZSHXdca72LyP4G
   UI9QO2u3Wod7IArcCAJ33xqAl5f8PZaVTDM4+iidIo0Rz0Moe3o80F1YZ
   3QjyDiG6xoz0C43MHNWBx6vI80+XzyiWbNNY6CZUjj5f04LBvQOSFvpVY
   NMESedex6EXHbCMnX7LoW4B7DTVdc4AOmARpOH4iei8bTqNWnpf+2DTeW
   F6MIvWkWts2sV2N6MXF0f7ZJx9yuadPfc7D1NaF4SjGTGj3qHwkFNti+g
   A==;
X-CSE-ConnectionGUID: WHz+fgQwQNWXNPBSmeDI4w==
X-CSE-MsgGUID: 9sN7a3+pS5WzFrDTcDxR1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41011475"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41011475"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 14:41:33 -0700
X-CSE-ConnectionGUID: FrdVXEluQJSxwind/3KaYw==
X-CSE-MsgGUID: GryT/Y8YROeaAXgW0e3q4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82247717"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 14:41:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5txw-000eBY-1W;
	Tue, 29 Oct 2024 21:41:28 +0000
Date: Wed, 30 Oct 2024 05:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg_trace_v4_5e 71/102] drivers/mtd/mtdpstore.c:76:9:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202410300535.ENksi6nu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyndbg_trace_v4_5e
head:   95ff6ff44a0206ea02936387ab66f6c39cfd20c7
commit: dc75936e9a1db05417181e3707b9179624d2b689 [71/102] dyndbg: move flags field to a new structure
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300535.ENksi6nu-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300535.ENksi6nu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300535.ENksi6nu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/mtdpstore.c:76:9: sparse: sparse: Initializer entry defined twice
   drivers/mtd/mtdpstore.c:76:9: sparse:   also defined here
   drivers/mtd/mtdpstore.c:66:9: sparse: sparse: Initializer entry defined twice
   drivers/mtd/mtdpstore.c:66:9: sparse:   also defined here
   drivers/mtd/mtdpstore.c:66:9: sparse: sparse: Initializer entry defined twice
   drivers/mtd/mtdpstore.c:66:9: sparse:   also defined here
--
   fs/affs/bitmap.c: note: in included file:
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/dir.c: note: in included file:
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/inode.c: note: in included file:
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:255:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:255:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/namei.c: note: in included file:
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
--
   fs/affs/amigaffs.c: note: in included file:
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/super.c: note: in included file:
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/affs/file.c: note: in included file:
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:255:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:255:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
   fs/affs/affs.h:238:9: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:238:9: sparse:   also defined here
>> fs/affs/affs.h:283:17: sparse: sparse: Initializer entry defined twice
   fs/affs/affs.h:283:17: sparse:   also defined here
--
   fs/ext4/mballoc.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, fs/ext4/ext4_jbd2.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> fs/ext4/mballoc.c:5662:9: sparse: sparse: Initializer entry defined twice
   fs/ext4/mballoc.c:5662:9: sparse:   also defined here
   fs/ext4/mballoc.c:5679:25: sparse: sparse: Initializer entry defined twice
   fs/ext4/mballoc.c:5679:25: sparse:   also defined here
   fs/ext4/mballoc.c:5683:17: sparse: sparse: Initializer entry defined twice
   fs/ext4/mballoc.c:5683:17: sparse:   also defined here
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   drivers/dma/xilinx/xdma.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/dma/xilinx/xdma.c: note: in included file:
>> drivers/dma/xilinx/../virt-dma.h:105:9: sparse: sparse: Initializer entry defined twice
   drivers/dma/xilinx/../virt-dma.h:105:9: sparse:   also defined here
   drivers/dma/xilinx/xdma.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +76 drivers/mtd/mtdpstore.c

78c08247b9d3e0 WeiXiong Liao 2020-03-25  69  
78c08247b9d3e0 WeiXiong Liao 2020-03-25  70  static inline void mtdpstore_mark_unused(struct mtdpstore_context *cxt,
78c08247b9d3e0 WeiXiong Liao 2020-03-25  71  		loff_t off)
78c08247b9d3e0 WeiXiong Liao 2020-03-25  72  {
78c08247b9d3e0 WeiXiong Liao 2020-03-25  73  	struct mtd_info *mtd = cxt->mtd;
78c08247b9d3e0 WeiXiong Liao 2020-03-25  74  	u64 zonenum = div_u64(off, cxt->info.kmsg_size);
78c08247b9d3e0 WeiXiong Liao 2020-03-25  75  
78c08247b9d3e0 WeiXiong Liao 2020-03-25 @76  	dev_dbg(&mtd->dev, "mark zone %llu unused\n", zonenum);
78c08247b9d3e0 WeiXiong Liao 2020-03-25  77  	clear_bit(zonenum, cxt->usedmap);
78c08247b9d3e0 WeiXiong Liao 2020-03-25  78  }
78c08247b9d3e0 WeiXiong Liao 2020-03-25  79  

:::::: The code at line 76 was first introduced by commit
:::::: 78c08247b9d3e03192f8b359aa079024e805a948 mtd: Support kmsg dumper based on pstore/blk

:::::: TO: WeiXiong Liao <liaoweixiong@allwinnertech.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
