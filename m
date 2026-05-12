Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB72F6918
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572207; cv=none; b=U2Cr8FXMni95buRbzGxEfjaRUXWw/JnJGI5IIfZmnhiymsUeuAVF4h+iF8GouVUNKDSjIaA4iB1pVjmmcgvp1Bpf0K1kmYpOpAsvugKTAew3u/MJpThC4qcYnH+mXAHqfaRwlFvXFPK87ZlWiB83gcSs9f9NmOskTpyyCfR5ntQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572207; c=relaxed/simple;
	bh=KrMfr1PcFYMqw1Ze6wFt+zGuqeTABt50B9NpaLAD94M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=spkkrSvEt3CQBjLL5oOZr3pfEvCH5Yw4uojjTxuQNnflTDuwelgc+qCYlH0GpSv5hdYwvFJlYuo648EAhff1zgUWs38i1LFgckj1ZuXwGEZ0+v4/HJ3uFOoqGohM2wl3/mhzgTfxKWPv7CRKvYQwiyqG+0LK0D4nAlLZXboYPDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQOx4PCF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQOx4PCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778572207; x=1810108207;
  h=date:from:to:cc:subject:message-id;
  bh=KrMfr1PcFYMqw1Ze6wFt+zGuqeTABt50B9NpaLAD94M=;
  b=ZQOx4PCFR94wBbha7h80fvq0rnAmxHAxqsBek29Wjnbu7vzQ4S+hIxnh
   gXnMS/p5JxQpsdrgk5Ni2ZonPP3MAn41VcqEIlUrxOBH6a9k50Clvpexy
   AG9/2EoPR44hWN03qs63rCrMSsu+nAV4CjTahtCkKqYTgLN57ElIi3HIT
   XZi58QI6mMP6btNX12bS+H6J+dotCIQMFQUAS4ULMKcHxEM4GgfIlDRad
   DllI7EtlFwCPrCC38s3j7josmUuXxgp0mwhtYQ0nfruWXcO0NzH6X1Q7e
   vI1rxnEAbkhGSVCK7PWUyDvcLDSOfQAz+RGORpT0MC5GjMrl3syuGwIQb
   g==;
X-CSE-ConnectionGUID: U8hXzJrnTeioK5baGiK6ow==
X-CSE-MsgGUID: C6V9dScPRYiqbrt8c/sesA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90939106"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90939106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 00:49:59 -0700
X-CSE-ConnectionGUID: dEw4JoH8RAGOsjq8Czc6ig==
X-CSE-MsgGUID: C8fjo1oYS7+w+/KLhUX23Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="235029538"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 May 2026 00:49:57 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMhsJ-000000001oL-2KXJ;
	Tue, 12 May 2026 07:49:55 +0000
Date: Tue, 12 May 2026 15:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate 6/12] block/fops.c:954:16: error:
 too few arguments to function 'add_swap_extent'
Message-ID: <202605121545.GHd1zW6p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   7414a67e6a700a2e9fef1fcd2ccce5592290e575
commit: a6dced0d47f7bb6e1a86b11007c47874e50c7370 [6/12] swap,block: move the block device swapon code into block/fops.c
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260512/202605121545.GHd1zW6p-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121545.GHd1zW6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121545.GHd1zW6p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   block/fops.c: In function 'blkdev_swap_activate':
>> block/fops.c:954:16: error: too few arguments to function 'add_swap_extent'
     954 |         return add_swap_extent(sis, sis->max, 0);
         |                ^~~~~~~~~~~~~~~
   In file included from include/linux/suspend.h:5,
                    from block/fops.c:17:
   include/linux/swap.h:529:19: note: declared here
     529 | static inline int add_swap_extent(struct swap_info_struct *sis,
         |                   ^~~~~~~~~~~~~~~
>> block/fops.c:955:1: warning: control reaches end of non-void function [-Wreturn-type]
     955 | }
         | ^


vim +/add_swap_extent +954 block/fops.c

   951	
   952	static int blkdev_swap_activate(struct file *file, struct swap_info_struct *sis)
   953	{
 > 954		return add_swap_extent(sis, sis->max, 0);
 > 955	}
   956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
