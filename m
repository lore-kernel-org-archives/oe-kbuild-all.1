Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649BE18734B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 05:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726205979; cv=none; b=lAwVhDsNW9OeRC9ZlSrODIsWBXJDG2+iYs/APKALj9fKOhsXudN86IDtyJSKdnhJPzKu0iIUuC3Cw4bdKxxPqJx/3nH4UU4LtFvPcJ1oiMhe/+57Q/NpMOpKKdIAQK6y0TT2N6lN2G+Qt8hwXIqJKPnwefA4F/BCm/dOc6oAKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726205979; c=relaxed/simple;
	bh=7VKYr6A4O2fX+dRTeUcqJx8z5Vz7TLlRbF5Mmm6YGzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TDFQIOKvFdKAbAPjnVnkjivcQXhuhTAnzIpMwkSlFCEEHiwZiYxOngVbOlbq2u9iA8S9p2DXuMSWVSPz9FA9T8DQmTs31rbp/O4coKW5hHomFIBqsJrGx79gekEOL4vnAKVhZWEwYaamFAWOWOXNuaDPC7olGGzvu7G1j+69/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvWXOx3g; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvWXOx3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726205977; x=1757741977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7VKYr6A4O2fX+dRTeUcqJx8z5Vz7TLlRbF5Mmm6YGzA=;
  b=ZvWXOx3gj5FXnQLojSAEVt2DVCSwllQip7gunvZVJZSzf90lL72vKk0F
   Bs8GGPxGlj8L4lAfVfIOEYpXtAUXxIIvrOCu0reNiXObth97ZS5eTYhCE
   Ng2/SI9nqOFXktWIlhZkdDhVR6N2CQ2Rs7rf5tF3g/ZQ6/LhX+B2gK1J4
   p443tHcagZ98uY1BYuYCkmjsIu2uEw5FNbWC2D3sowVr7YDBE4DD65Adm
   W3i/huoR0joGXrTwtjf3H58gnSYj6wY6uykg3umhQ6NrNqXX6I70jVx3A
   Yp53rfqevaT71rpdUUWNz2Uo0gryko1dI8dyYQufL4j7KdIgUzfDHezsx
   A==;
X-CSE-ConnectionGUID: a8upLiZ+TA6gBkn78Ww9kg==
X-CSE-MsgGUID: gxJ2GWLAR/6MS0y2PmNpzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13506959"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="13506959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 22:39:36 -0700
X-CSE-ConnectionGUID: umXERJRvTn60jzMqcqLEPQ==
X-CSE-MsgGUID: 3AuHwj8dRDScqMhPs+dt9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72048946"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 22:39:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soz1p-00063a-1A;
	Fri, 13 Sep 2024 05:39:33 +0000
Date: Fri, 13 Sep 2024 13:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19394/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfs_event_cb'
Message-ID: <202409131316.GLZstznv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: dd9641804ad19402838975c28003465d0b42042a [19394/30000] ub: uburma add cmd create/delete jfs implementation.
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240913/202409131316.GLZstznv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131316.GLZstznv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131316.GLZstznv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/uburma_jfs_event_cb +144 drivers/ub/urma/uburma/uburma_cmd.c

   143	
 > 144	void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
   145	{
   146		struct uburma_jfs_uobj *jfs_uobj;
   147	
   148		if (event->element.jfs == NULL)
   149			return;
   150	
   151		jfs_uobj = (struct uburma_jfs_uobj *)event->element.jfs->jfs_cfg.jfs_context;
   152		uburma_write_async_event(ctx, event->element.jfs->urma_jfs, event->event_type,
   153					 &jfs_uobj->async_event_list, &jfs_uobj->async_events_reported);
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
