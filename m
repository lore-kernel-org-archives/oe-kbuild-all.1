Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFA116CD33
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755341566; cv=none; b=rbBlbyq4Bwp48VTSlST2gtw8h4QgA/NnAcACkmPncK4s4vmvG3ACOrKA9FBmS89sBlaANLOmg5KPSN+oOOXAhxeLHF9xLbsVn/A1xeA7Ion0fgc93xXM/rkp3FEdChBtstp//YIawlINDNjjq4WFgoa1ZgTlECAMPgI3zz9suQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755341566; c=relaxed/simple;
	bh=Z2MuxVgorsAafhddRcA5fWJnCHZBFT4gDBBNNe+FwoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P9Yqt/XHOYa4tzfqogAcLXwTEnCQ2n7WwiFpld7lvGYHi0UXbqrq0kshFJrxgb13otZOdYxsYxqygcuo8EOXclM3x/9iMIMXAjxx6wPID3wJbagNrn+cgiiqQMc6kNZ2UNbxWVFi005OZXTjkWJoEO/Z6lRQWnMzsGs8/HY9uF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lh06qrKA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lh06qrKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755341564; x=1786877564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z2MuxVgorsAafhddRcA5fWJnCHZBFT4gDBBNNe+FwoY=;
  b=lh06qrKAO782Vi74XFbjYlM0Md3tdw9vTPC4DwgDyKrd+4r5Cy6H5LOV
   CsnLToCYfJ816P32v3jMKLHHRkjCnFia+rzj6p/4PieMc4yQ+PmebFK7q
   5NNgv6pZ44QQIZ6SPE5pIFSMTY+w6vbCL0z46DslSFxY2T63jq9NQG8Qa
   cfYJ3QNNZ+oy0OL5JEfCaa5kgfpzAsm8nw74d/BcQjfSmNgQzlAijqbA4
   J3pPCJiYm3RU+Kyxs1BEbKFwa9Be70G9bXKWjZGhGDDwCJJJGUse+v0RR
   BsKglclg/umivuN0ipX8Y+vffhgvLXZiOuKKaQOmfGcbeLXPycsjEdR1N
   w==;
X-CSE-ConnectionGUID: vgvQovCrRoGjGkf/049IbA==
X-CSE-MsgGUID: KsHN/1ejRI6Q32TJo/Ic2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68732323"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68732323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 03:52:43 -0700
X-CSE-ConnectionGUID: ISUnCNK9QT6AhXVgkDgYbQ==
X-CSE-MsgGUID: PMh/00SISaaFLg+JFVei5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166687100"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2025 03:52:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unEWd-000CpM-23;
	Sat, 16 Aug 2025 10:52:39 +0000
Date: Sat, 16 Aug 2025 18:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dongsheng Yang <dongsheng.yang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Mikulas Patocka <mpatocka@redhat.com>
Subject: [linux-next:master 2532/2770]
 drivers/md/dm-pcache/backing_dev.c:134:26: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202508161838.BV3mincB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1357b2649c026b51353c84ddd32bc963e8999603
commit: 6fb8fbbaf147fe4153177320ee354c457605800a [2532/2770] dm-pcache: add persistent cache target in device-mapper
config: riscv-randconfig-r132-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161838.BV3mincB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce: (https://download.01.org/0day-ci/archive/20250816/202508161838.BV3mincB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161838.BV3mincB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/md/dm-pcache/backing_dev.c:134:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted blk_status_t [usertype] bi_status @@
   drivers/md/dm-pcache/backing_dev.c:134:26: sparse:     expected int ret
   drivers/md/dm-pcache/backing_dev.c:134:26: sparse:     got restricted blk_status_t [usertype] bi_status

vim +134 drivers/md/dm-pcache/backing_dev.c

   127	
   128	static void backing_dev_bio_end(struct bio *bio)
   129	{
   130		struct pcache_backing_dev_req *backing_req = bio->bi_private;
   131		struct pcache_backing_dev *backing_dev = backing_req->backing_dev;
   132		unsigned long flags;
   133	
 > 134		backing_req->ret = bio->bi_status;
   135	
   136		spin_lock_irqsave(&backing_dev->complete_lock, flags);
   137		list_move_tail(&backing_req->node, &backing_dev->complete_list);
   138		queue_work(BACKING_DEV_TO_PCACHE(backing_dev)->task_wq, &backing_dev->req_complete_work);
   139		spin_unlock_irqrestore(&backing_dev->complete_lock, flags);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
