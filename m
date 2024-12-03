Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD21E25E5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223996; cv=none; b=XhH3Xj40OrUts/fl6Uph6Nxous/SGKeSt5b25kJxYgpnOlc0Uq7bVnfrD2CzqqMG6g31jL+GA9fjF5mqIkNOex4B7/Zv/COhoPXPDDAv7tm0ctni/c2xdw1gh980LjKAkhpFXrqAn+NJtKNTfjzDgMJQwqoImCY0aCQBAHEKJjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223996; c=relaxed/simple;
	bh=04u7K0kcSyPOmC3YjzEAg+xtydt/zv7+yEZyRIvdlIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8t/mqq7FdQNlHUsj96FRT7kBXWEZh/V/1O7JH06qu/s1RjxobC5HHTnPNXLOJtp6Y+NmUvDahSLaEFonv3v4WHSkfUGmKOpAdBgrStr5yWAh+xo28sEM0YclbWt+/CXUfQgoXe4kg4CTk51no7wHfHtRrjK67EnHStT+12yJ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghk+Np8j; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghk+Np8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733223995; x=1764759995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04u7K0kcSyPOmC3YjzEAg+xtydt/zv7+yEZyRIvdlIQ=;
  b=ghk+Np8j7WOocPuf9X0GRsI7/w/mFL5TkwcrJvDrOzQK4XbpfMg1Wngt
   hO7TcdvinGCKZ3w241VCX5aXEDxXUbkkJqbyop7hP/LPTgqoYA6VpwH6m
   OHONVXW540z0eM+gFIGqfZw1U4obJkOxweB/Ul1UZ4uln50QyHMDk9+KJ
   TLxRLU0eLLF2jWucFdc4XeeVeBTrQ/y6fYIdjm5qwIobjBgWsdsBd2DqN
   AlGuVg6VCY2un9MUsQXYxTDrCx8erDeHu7/vp7vWFdrHAbkpCv1Fibgmz
   r+rlF3WD0iFRmaSTicILUVbBeienVdOlySGT9cE7/c44hHoj7qHLeGfwr
   g==;
X-CSE-ConnectionGUID: 0HTGMkrdStKqxFUznnlq8A==
X-CSE-MsgGUID: miVmoLg4RxOx7gQP0adbWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33580141"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33580141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 03:06:34 -0800
X-CSE-ConnectionGUID: Ar2drZ5ZRmOQst1ZoOEG4g==
X-CSE-MsgGUID: 29Tj7zWySkKq3f8ycbBzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="124231737"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Dec 2024 03:06:33 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIQje-0000Zc-1O;
	Tue, 03 Dec 2024 11:06:30 +0000
Date: Tue, 3 Dec 2024 19:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfc_event_cb'
Message-ID: <202412031918.JBUCfUTV-lkp@intel.com>
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
head:   f030ffc8e0c6dac3503bebddbf49cc339003fcdb
commit: c4cd0655c0c898569c0a70162f36258fd5c50eeb [2516/2516] ub: uburma add cmd create jfc implementation.
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031918.JBUCfUTV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031918.JBUCfUTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031918.JBUCfUTV-lkp@intel.com/

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
