Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADFA47
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726929775; cv=none; b=MGqYulNkp1Apj48WJpXPcO+QULjv5jeRHGs/imFXRiQjX1EJX7BR9dQDXZR98+ww4Vx/VvfXoj8Wmdi76ZxAgeqQEOIftVzoG67rh5kuTGsK+m886PwtapaKdudqQOuO7FYbBY0jjRcYdO8cpePvUdXsx8K9RqnTimfmYpGqk/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726929775; c=relaxed/simple;
	bh=g7nAeAebcEvC/W6YVFQTIgaaDYxKxgtXU7FQiUNjA44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UchX/0y1c2OZuNOO6MXYhKNr4+rZkFSm+2BjfP1FjRtJSSaeJWrQwSuYWzYYaQp72OIOZqRcDIg6zL4mHZ3I2J83zVVUGZJgEz48qVcVt9wdDxizPksLHqLkjm0lk82zS8KjqzHKmaBxDtGv1F8YDAO8xwBhpUfilTqu2bG4s94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2/zsgWW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2/zsgWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726929773; x=1758465773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g7nAeAebcEvC/W6YVFQTIgaaDYxKxgtXU7FQiUNjA44=;
  b=k2/zsgWWHb/wM3gUYjTduVbH4tqBmIwsyLw+sAZx3OcFMpAvmDVuZOwP
   jIDQX1zGBK9zdhwa5jR3BuSh4ifLKehcGalIdNXPMvzL0NGk7IDbk5V72
   /Pcx3I01pdU1RwnQIwuumcNooSMXHg21oXl3vFO1K0F9xK9384QIEG3ZI
   EGxj463yge36kWc6aIyfLXupqpdw6ZfNfTmYAWwwiqg2wnsGH3Gh446oM
   omivMYTSMPmJA5ybL7LTeFRoSqeO8gB09tsdCUyVuM+qVn8lvp8tPT3xJ
   EwNosQwUd/u8hL2EmTXlFHsx6AkMOIoN5cqi6e3ejNBxX9jL7Tl9Flisc
   w==;
X-CSE-ConnectionGUID: 4/wuxFYlTqqaknfUS8Z3Zg==
X-CSE-MsgGUID: 8xro2qqVQOeVb2SpSBiTOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26077187"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="26077187"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 07:42:52 -0700
X-CSE-ConnectionGUID: aghyPDU/Qa+fFwZYJDCHHA==
X-CSE-MsgGUID: 2je8Yf2MTnqyH/+9teZwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70892296"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Sep 2024 07:42:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss1Jw-000FUX-2Q;
	Sat, 21 Sep 2024 14:42:48 +0000
Date: Sat, 21 Sep 2024 22:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19313/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfs_event_cb'
Message-ID: <202409212219.Vif0Ex0V-lkp@intel.com>
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
head:   108b9a92793f61e1abf94d341c676515421e57a2
commit: dd9641804ad19402838975c28003465d0b42042a [19313/30000] ub: uburma add cmd create/delete jfs implementation.
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240921/202409212219.Vif0Ex0V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212219.Vif0Ex0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212219.Vif0Ex0V-lkp@intel.com/

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
