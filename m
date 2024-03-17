Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1163CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710665119; cv=none; b=DyOT6zfYlmhiOPhEEZSlVMI4hzQNv3nEfvhwR+Qxme2dlg0f9wGx6+DrC793C2dY/oyBMEYhemkg89n7tqon5aAJM6QMpuD0vdJOGcb7Ii+1HbNTnsi1ZS7vcyXZcm+kK0PVgIBAJRF/MzAQ52z1jfNu2FZPzH319q/LHGXLRlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710665119; c=relaxed/simple;
	bh=cMkosrJq6KfnMaL+PXKv4PjvhS5Ii+4XTCqH3uPiMGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZyMzsXBw2cURrii8SyuxbdyDutsbZcOJdSg7pW11/a2txwEcqyr4eoC/9SdztY13JkVaXtV6e7ok7rGPH6jYxPM/NDXXkshSjuAq53kly7In+M0r0a+VXz8u+HlU6xCG1oilcxaZN0+GrPX4YAC5DcyyVKUIGE/bl4Ily9m5c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrudNaLY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrudNaLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710665117; x=1742201117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cMkosrJq6KfnMaL+PXKv4PjvhS5Ii+4XTCqH3uPiMGs=;
  b=HrudNaLY9gJDleFvHywTz0iLsJRRpAgp55fd5dmGLRFWlOA/MRMSTUoX
   kreOMUbjdbGMluyFUqQqQW2KkmGp75YpWg4J2uqcxIclbvi6DFqdmqFnO
   JZjBseeIUkNws7qbwP83+iBtjjcxzoj77xdIH2EC/zMVdfbr5dIb8rfLh
   PUgfL1sm+Aq8QRNQ8oLJpxdErQYJ0Ddzhvw6gvJNrG7CkqXVAL4xK01YD
   6HEsnseEJXSnfIKikvF6qPgRYb8aiz/Xbl4jJT3vBHYsH/WSNv/Movk9B
   SQY80PGrtCuS+5h2sKjZW2xJEbMONNqZAOQ062MmfUf8+ehBHA2pb5Q+N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="27965896"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="27965896"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 01:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="17845980"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Mar 2024 01:45:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlm8m-000G8H-2Q;
	Sun, 17 Mar 2024 08:45:12 +0000
Date: Sun, 17 Mar 2024 16:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24824/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype
 for 'uburma_jfr_event_cb'
Message-ID: <202403171618.niakwAg5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   32bb7b0a7c87769858fbb9d60574b830383c28f7
commit: 79b60243a9ff771b76add8e16cfe55cc4f5edef2 [24824/30000] ub: uburma add cmd create jfr implementation.
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240317/202403171618.niakwAg5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171618.niakwAg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171618.niakwAg5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     156 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/uburma_jfr_event_cb +156 drivers/ub/urma/uburma/uburma_cmd.c

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
 > 156	void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
   157	{
   158		struct uburma_jfr_uobj *jfr_uobj;
   159	
   160		if (event->element.jfr == NULL)
   161			return;
   162	
   163		jfr_uobj = (struct uburma_jfr_uobj *)event->element.jfr->jfr_cfg.jfr_context;
   164		uburma_write_async_event(ctx, event->element.jfr->urma_jfr, event->event_type,
   165					 &jfr_uobj->async_event_list, &jfr_uobj->async_events_reported);
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
