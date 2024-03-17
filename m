Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2C41CD26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710695434; cv=none; b=oA4uUEBaLGDvfOzXCRiJLrhjxmzRkSvPSCFAGI5S8aK447Fzt8AyG9Iby7j1FMVOMqhYr9HQCWoJcXlBErLMly4oTo3n6oirS4dzqqLe4V7V2dO8bHY2TvhBFjoLFXWKKq4z2TUTHlXv1+7xk+Dj/6V61n7zEX2CFfYucV9n7l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710695434; c=relaxed/simple;
	bh=y2+kZ6w/Oq3Vfgfp2aOcCqfNixGZn1A3N0u3bJAstzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flJYgsO0eg3kF5cTaixNbbpYD4qBWGICemVdDGNFlPw3t1IEjkj0NuLynv8EX0UWltP+xm6VOMPsDdyysHqrLC5YIRscwuHzD/tiT7eCa/ShWjcaNyht3PZYHDhMn+VyHsgJTd2DzVXfRpHK8uthzEHQ6phmpz4IIudhdLoxG4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6tnrHau; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6tnrHau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710695432; x=1742231432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y2+kZ6w/Oq3Vfgfp2aOcCqfNixGZn1A3N0u3bJAstzc=;
  b=U6tnrHauaN/4yHCvLORZZ4GcSwGqR0cKwjTT07eoRb78RtNLNQ4y4nzG
   xwvez1CK/gRs2zpRBn3zxDK+deKxyZNYndHUB4ziFfR1j4YtXaCrIJlWk
   vb+ENtBBWyWusVE7Ogn1Nud4RJo2WXP8WPgV2xmNxJftab5kLpOH+Omwx
   fbLH4kez0b+yMCCeDiBN+MMo0ZN3OwuMOOmX8ZbzRHjYwpyaYAitkvjiZ
   p1N70J/ZpDZmT3t5p/GY2hsJCXzaTE94E3Y09mdvA2Vgel5uo3R1Ee1cZ
   7r/PEq+YKQoCq0fkJXL40M3eCcmW0c3iCIsZuker1OOF+mWHgB9LU8bMe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16908054"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="16908054"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 10:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13161624"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2024 10:10:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlu1j-000GNB-30;
	Sun, 17 Mar 2024 17:10:27 +0000
Date: Mon, 18 Mar 2024 01:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24826/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfc_event_cb'
Message-ID: <202403180149.ZWPewByz-lkp@intel.com>
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
commit: c4cd0655c0c898569c0a70162f36258fd5c50eeb [24826/30000] ub: uburma add cmd create jfc implementation.
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240318/202403180149.ZWPewByz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180149.ZWPewByz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180149.ZWPewByz-lkp@intel.com/

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
