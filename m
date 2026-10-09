Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8B1AF0BB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 01:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510919; cv=none; b=ZuGSJvm3poasGdGdlkIj8MLN7kfELX4BgYOpHUjFVNkwRfN0HwwRoZDAM/mBb4vG5RrsBCbtQChlT/dKZhlETU63m2o06FJFPZU5zzMcZL87aCfUJ2hZMmGrz+37hwGX1ecpqsQAjbXf3XGjfzSWaW78oeiQuN7NY1OYOyD75yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510919; c=relaxed/simple;
	bh=wh4AxssFiKuqRYLxyMnb2GdgGDPN+BWBy5++cR/JvI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LOwCg812V5PkBwrsbpzDPnKB9qWYC6+QFK+h5qp1uWqsJGoD2yGSvEOkBhRWAZ1wkVdsdu6lYjRMkt+PWDaQh0bzoiErBYF8esPureRkUeNHv02HNBGUmqur2cpS41uA8EZd8+cguysdtYiGKCpVabau2gw0WjjY6AJPOARyb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OY9ntsVK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OY9ntsVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791510918; x=1823046918;
  h=date:from:to:cc:subject:message-id;
  bh=wh4AxssFiKuqRYLxyMnb2GdgGDPN+BWBy5++cR/JvI0=;
  b=OY9ntsVKcTStnNcruhy0IAttvXz1e4Dqbu8gbKCTTbo+kCznB0U4juKG
   BHG8IEWbudCkhhUoXFsWkjxqOTZGrMOqL93Vs12BKLNIi/Otjdnm/xK/s
   yq/l5hds4JMyiN7Tm2Xu1Oyxe34xZRzLYfGtD2arMjM//3Ygo/EeZ5GZ9
   CTCs4EVdP0T0g7X+iRrjBqr+GDbf96f7AjEnaynLz5ozJmWrSqudv+iPU
   0wODhJaimakAE7c7KgROusgj+cSbeW96Cx37JblO+ykheWijENWluf1un
   9rAH5YwsJm0veDOM9RdeyyICJ83cF94HaKFmYCdHV4racu3Y1CXIv2Gnt
   Q==;
X-CSE-ConnectionGUID: 6rD2zlR2SH6B2m46YxAv1g==
X-CSE-MsgGUID: la+sF7JISa+iv29YBSb+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="401719"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="401719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 18:55:15 -0700
X-CSE-ConnectionGUID: 5dKliD+LRwuAWz5oFND22Q==
X-CSE-MsgGUID: myNq7iQAR9C6mZAQtf9ymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="190626"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2026 18:55:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEzpH-000000006VF-3g4q;
	Fri, 09 Oct 2026 01:55:11 +0000
Date: Fri, 09 Oct 2026 03:55:09 +0200
From: kernel test robot <lkp@intel.com>
To: Scott Mayhew <smayhew@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Anna Schumaker <anna.schumaker@hammerspace.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 13283/15343] ERROR: modpost:
 fs/nfs/blocklayout/blocklayoutdriver.ko: symbol '__mulsi3' undefined!
Message-ID: <202610090317.bqbswYqy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Scott,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: 65a83a613c4630232fb3e382229719df8558f7ae [13283/15343] nfs: split up block layout and SCSI layout support
config: nios2-randconfig-r2301-20261008 (https://download.01.org/0day-ci/archive/20261009/202610090317.bqbswYqy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090317.bqbswYqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090317.bqbswYqy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: kernel/rcu/rcuscale.ko: symbol '__mulsi3' undefined!
ERROR: modpost: kernel/rcu/refscale.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/nfs/nfsv2.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/nfs/nfsv4.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/nfs/filelayout/nfs_layout_nfsv41_files.ko: symbol '__mulsi3' undefined!
>> ERROR: modpost: fs/nfs/blocklayout/blocklayoutdriver.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/nfs/flexfilelayout/nfs_layout_flexfiles.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/nls/nls_euc-jp.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/ocfs2/ocfs2_stack_o2cb.ko: symbol '__mulsi3' undefined!
ERROR: modpost: fs/ocfs2/ocfs2_stack_user.ko: symbol '__mulsi3' undefined!
WARNING: modpost: suppressed 907 unresolved symbol warnings because there were too many)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
