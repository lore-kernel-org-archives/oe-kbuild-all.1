Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471418A6CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753551130; cv=none; b=pjNXHwqMQJpDyvmX2v5O6aS6MHl1mxxWTtn1Mnw3AgsUEmfwv3xJxGtAZK8h99qVjzj5Q7dnkunqoOqqSqqNeUlmu0T3J6t9J6HZA//+/NMm0PCsJ3jdUl5sq9Owo19IVH+F3c9DOD2uRjGI6tOolrMwY9RzBwwEPUBbVjD6/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753551130; c=relaxed/simple;
	bh=7skZem+ZAUvC1olgqzjCgVaStfzkaYce5ZlkrKzeHZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNivnJOg0RCtDYL50xs4xXgxstaeG7FafNQlyOXGfx8nUlYNQsDI+7junBXzjHM2uELPC0MrbfJhIfVpm+XpfQrgDQVf/9Pl4cwOnSx/f/nbrer1049HQYK8cKtlcLiPs2BdLzWS1j3tThXJEsrMsTqfMn9dXXPVskJ/Dg6syuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Id9nJQ2S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Id9nJQ2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753551129; x=1785087129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7skZem+ZAUvC1olgqzjCgVaStfzkaYce5ZlkrKzeHZQ=;
  b=Id9nJQ2SOyi2C1JCJ0l4oQkrKPRcYaaGiFODTjI290yE/Q3WcY+v0SFo
   ynH8wxpppQOFvYKJYjQZhqAM7YIBZqa0zD/BPfdLreEkQ5euikYIq7CeX
   LYd9AWC3i+PqZZTvq8uzhY3d2363nynMc9qlZOTYFEHNyijTIPm5GIKo9
   xmAGp0H6bOujFadneoZiCd9upFUm90XRGlJe+Et3fQQORzwErq63oUwZZ
   4h48p3tJMFuUHqpdwIZAlEEaPtH/kK/mNjimF7rx4Vq5WsFnU7oTnMmat
   lOCcAn7pIohEABfKEs1qUBI0lmpCrRFts2vXFirdPgwIgrRawfl7/ID4x
   A==;
X-CSE-ConnectionGUID: wKLkcJ2CQ3+h8BhjwWwUBg==
X-CSE-MsgGUID: ElGn1jz8Rh+Gr1NHQUipug==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="73441334"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73441334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 10:32:08 -0700
X-CSE-ConnectionGUID: nOpb7g/2SRyWb0P/2YMwZg==
X-CSE-MsgGUID: DhgEs/D0Q7+7U6X1c4Zwrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160952040"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jul 2025 10:32:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufike-000MA3-1d;
	Sat, 26 Jul 2025 17:32:04 +0000
Date: Sun, 27 Jul 2025 01:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [mcgrof:20250723-migrate-folio-stats 2/16]
 mm/backing-dev.c:1029:19-43: WARNING: casting value returned by memory
 allocation function to (struct bdi_writeback_ctx *) is useless.
Message-ID: <202507270157.5d8tctXb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kundan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250723-migrate-folio-stats
head:   e857aaf49afadc31be5f460664cd176bfd972ffe
commit: f229eb84613087d77c04907f927703025096ef0e [2/16] writeback: add infra for parallel writeback
config: hexagon-randconfig-r064-20250726 (https://download.01.org/0day-ci/archive/20250727/202507270157.5d8tctXb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270157.5d8tctXb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/backing-dev.c:1029:19-43: WARNING: casting value returned by memory allocation function to (struct bdi_writeback_ctx *) is useless.

vim +1029 mm/backing-dev.c

  1015	
  1016	int bdi_init(struct backing_dev_info *bdi)
  1017	{
  1018		bdi->dev = NULL;
  1019	
  1020		kref_init(&bdi->refcnt);
  1021		bdi->min_ratio = 0;
  1022		bdi->max_ratio = 100 * BDI_RATIO_SCALE;
  1023		bdi->max_prop_frac = FPROP_FRAC_BASE;
  1024		bdi->nr_wb_ctx = 1;
  1025		bdi->wb_ctx = kcalloc(bdi->nr_wb_ctx,
  1026					  sizeof(struct bdi_writeback_ctx *),
  1027					  GFP_KERNEL);
  1028		INIT_LIST_HEAD(&bdi->bdi_list);
> 1029		bdi->wb_ctx[0] = (struct bdi_writeback_ctx *)
  1030				kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
  1031		INIT_LIST_HEAD(&bdi->wb_ctx[0]->wb_list);
  1032		init_waitqueue_head(&bdi->wb_ctx[0]->wb_waitq);
  1033		bdi->last_bdp_sleep = jiffies;
  1034	
  1035		return cgwb_bdi_init(bdi);
  1036	}
  1037	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
