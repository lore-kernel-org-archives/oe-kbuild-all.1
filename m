Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59071632FE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 05:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205228; cv=none; b=k6IpJo4Pxfp5a4UDSHoXvt3GoehI6e1lPoZ+RaLCq8+Tntp/470FyKItJz5bs4B1Rch1qMWHjiyHACx9XWMXJE41JPZJgN4SI1MdMrMu8C90Md71JEnND3jnrb11hYy6MSJHXFgBTbt1+YXyVBB1JdSFIh41Y0+cWJ4FvVVSvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205228; c=relaxed/simple;
	bh=gS9UfvW3dN9e+7O2Od6xEQdZgxyyjEdn5bcQmd+mhRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OYmKBYkErM3CO0cVjYUkvKgs31ak0kZf3WfHIFApE8W9cwXBvPsZypqCRvHUeFl4+8t+vWnffErfy7556VVpGbjWaRAZZ8HHfAIYhWGPYu1S9yzc9xA3+oYpkVhEjiQ+hV7R4ogJFHK+Pii3sl9EO243HdDaAI3P/t+0PVxWeUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjD2Ac3K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjD2Ac3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733205227; x=1764741227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gS9UfvW3dN9e+7O2Od6xEQdZgxyyjEdn5bcQmd+mhRY=;
  b=SjD2Ac3KRs/vKu2wIfeRiCOUQOtIFSdOxnc6G0ObOUnEHMfNmkI621DA
   r74+roHxD9NtPlTzxKMepGbybBQ+rWIyXApms6ESuAGsvyAFOTpggWlsr
   Y1y5LXOEB3DF9B8wegLbUABa3aHowsGeF5LoXIQacJ1DlRB7IXYVXVNP+
   JWnU3yWbcEWFLI8XFhkMQLrSP6wem3QQeUkkxgkmn/KdAmBklXHdrbac+
   ildCUYmOFXb9/WWHUtOvJWCCK86E/x7HxbFsZMgPIzMsFsfrdXAHTvBj8
   5Unpd7CmMZPNx9h4IWCxtMsMjp60MBZiFOwEqYHYdw41ULE13F1pXojHS
   g==;
X-CSE-ConnectionGUID: P/+RXjwVRbWp2wpmgDLVMw==
X-CSE-MsgGUID: O8SKFkN7R7eZ9UEyel33mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43885722"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="43885722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 21:53:44 -0800
X-CSE-ConnectionGUID: RSVFQbJBT3arhj/b6EzK4w==
X-CSE-MsgGUID: 3RRumFHXSVCBN5l6zPJ5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97390969"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 21:53:43 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tILqv-0000BH-1G;
	Tue, 03 Dec 2024 05:53:41 +0000
Date: Tue, 3 Dec 2024 13:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfs_event_cb'
Message-ID: <202412031343.msPaVrnc-lkp@intel.com>
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
head:   020e0507954f21291b7b3a0a280128270a0d8959
commit: dd9641804ad19402838975c28003465d0b42042a [2516/2516] ub: uburma add cmd create/delete jfs implementation.
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031343.msPaVrnc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031343.msPaVrnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031343.msPaVrnc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~


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
