Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B44F1993B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730383951; cv=none; b=stGP8d8wOqV4deZg6LP73yfd9gY2taA7c0H8MS2MWf8EFBAfNihSBN494tLxkQOCIgjpp4hQ9+tppzd8LwekAyQ3GrSBexbMxjGwUHu665r3uK5qdxRMmsziTemNFYK+VGV0d4CkqLyOKTkDY0VjjTOTwEsQTaMwUO7wHiNZ0VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730383951; c=relaxed/simple;
	bh=04k3K4nrwrB1JYogSbLO/1EQqnNnuLqgnW+51bwA2u4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPpLk7IQil3wp2O+CwG25BQzsaJcP30KyVjTpsfpoXsPm9xpG+Lp3YEIJZM3kB0YEA0L1R0DmNnqitYpHpOI3J8C3hunQRTgi7AE5GzGoDGg6v63LQR80GB1ibCJl9vRkBrpP6LwwMYXu2o/9HeppTkB/s6R8EW1EhTF/uKymqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlpN8Kv3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlpN8Kv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730383949; x=1761919949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04k3K4nrwrB1JYogSbLO/1EQqnNnuLqgnW+51bwA2u4=;
  b=AlpN8Kv3H5pXTvPXtSjalsPTIkLqevCt0GPzUroVQIqObrxJpPfCQzd+
   NIKJES5rxwKI885Y0Bcx3fWwex5Dznar9TVFA4n+284mTbwKElLKX3xXH
   mH5PzAxOv7y+L1bEsBZ4kzvtO+Gfmr4l0bPzy9SC9mCS7MDE4UQSh2m5O
   c1GJl4PNSQsGzuYdddTgEe7HlUy33HdSLKcmkXWPeSx/Wzy1qYu3esHzg
   DcjYEYGJkD1XR6CvpYq8dhW3lu8bVELjo1wNzffOIO401y28WfBaoWoIr
   tpAPUN1oR7JE4Ylw6LyOx+BxdzD8M14FlZnA6LkSNugmRqWE8mp9KdCSD
   w==;
X-CSE-ConnectionGUID: ZkBdtWWITG6VLIKle/6h5A==
X-CSE-MsgGUID: bSZwTueDTy2d4/e0Lk5LEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52679334"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52679334"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:12:27 -0700
X-CSE-ConnectionGUID: 0HddzXSDQGefmsqE6miQ/Q==
X-CSE-MsgGUID: nzoevTi0RyKsi/oYkTZE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="86560455"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2024 07:12:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6VuR-000gH2-0u;
	Thu, 31 Oct 2024 14:12:23 +0000
Date: Thu, 31 Oct 2024 22:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18658/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfc_event_cb'
Message-ID: <202410312229.yZTH5DDS-lkp@intel.com>
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
head:   42d618475732fa8f470a2094cb00ac363f7e46fc
commit: c4cd0655c0c898569c0a70162f36258fd5c50eeb [18658/30000] ub: uburma add cmd create jfc implementation.
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241031/202410312229.yZTH5DDS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312229.yZTH5DDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312229.yZTH5DDS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfc_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfc_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     156 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:168:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     168 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/uburma_jfc_event_cb +144 drivers/ub/urma/uburma/uburma_cmd.c

   143	
 > 144	void uburma_jfc_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
   145	{
   146		struct uburma_jfc_uobj *jfc_uobj;
   147	
   148		if (event->element.jfc == NULL)
   149			return;
   150	
   151		jfc_uobj = (struct uburma_jfc_uobj *)event->element.jfc->jfc_cfg.jfc_context;
   152		uburma_write_async_event(ctx, event->element.jfc->urma_jfc, event->event_type,
   153					 &jfc_uobj->async_event_list, &jfc_uobj->async_events_reported);
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
