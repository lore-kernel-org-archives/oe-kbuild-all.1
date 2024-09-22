Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC163D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727020261; cv=none; b=hAF7t1VoWV8crBIPyiGJfmTb/U4iCAhnnLUsQ5g9XZBGCTnNz3SliuO9Mhyqr8jI0U71/NDHihg+Qla2GIaz5xXwcSP7O52ln4GHz/3jUIFw+Ycq/1lscBrVDIzMgX6dSySFJVD+/oeQe8rWJqzDN1pPfegKIPGxIQFPRclTR8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727020261; c=relaxed/simple;
	bh=VJEWvyMqJKgzLUU8a8TQbFNs1uMJ90G6wDpja8lkHVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJYYlqAKVpdVNNsyONgYyXxK8y2g47nq3G6lPiYr3whiCIHo4+aOw8ErZQJgf4kfk3O0X9Wv/dlJPADl3MYce7Afe7M4Y52GH8LWPOWbXEFTUiPQae1qJFa8fwlzWorAG668fX2y+vQC0oqcjtTGZ8pa+x9K2EPcxLEbqbMeVsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTB/Awc/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTB/Awc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727020260; x=1758556260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJEWvyMqJKgzLUU8a8TQbFNs1uMJ90G6wDpja8lkHVg=;
  b=LTB/Awc/esZCyFbSXbRtLMkie5ZutOm19m0R9ByYlbH2bKyxJMH3Bu5P
   Aa9sSvCZjXVOZ8tcWoNS2R8NooU7CR8LtYsKLj9FvHkLz8vX7BxTd97Bx
   vQMIp4RMBPRN3X2Ni1Z50r57mToMDVRFwv2GUsWS4F0eu+PWqU9t5eAmx
   u5gr6BBOcqaJ+Rzo5wZ4aBfT6igKBbPRIDTt0rqrwJWkal7S3U9sMmaZQ
   CTftxJ/RoqhzWM8QaBxBwpuyW9QBP1i9PfVEr2aJmUl21DdEzcSpF9rVx
   w9cvoRoH+Mqcd2PMojWCTVh/RbzPVxWdofdsbDUkeucr/q1rJep6f1hJO
   A==;
X-CSE-ConnectionGUID: yQv0bTYIR9C2v7UdNHeysQ==
X-CSE-MsgGUID: jvljFcAFSgmQdOqShybFGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25836923"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25836923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 08:50:59 -0700
X-CSE-ConnectionGUID: CBf88FjhRySgUDTo4g+RGQ==
X-CSE-MsgGUID: 83HkFbCwQKiokGrBwTBY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71146407"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Sep 2024 08:50:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssOrO-000GR0-36;
	Sun, 22 Sep 2024 15:50:54 +0000
Date: Sun, 22 Sep 2024 23:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19319/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:180:6: warning: no previous prototype
 for 'uburma_jetty_event_cb'
Message-ID: <202409222352.T2dIjY0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   108b9a92793f61e1abf94d341c676515421e57a2
commit: c3af5be3e72710b357d9f23a5bdcafe8f96d6dfd [19319/30000] ub: uburma add cmd create jetty implementation.
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240922/202409222352.T2dIjY0d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222352.T2dIjY0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222352.T2dIjY0d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfc_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfc_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     156 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:168:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     168 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:180:6: warning: no previous prototype for 'uburma_jetty_event_cb' [-Wmissing-prototypes]
     180 | void uburma_jetty_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/uburma_jetty_event_cb +180 drivers/ub/urma/uburma/uburma_cmd.c

   179	
 > 180	void uburma_jetty_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
   181	{
   182		struct uburma_jetty_uobj *jetty_uobj;
   183	
   184		if (event->element.jetty == NULL)
   185			return;
   186	
   187		jetty_uobj = (struct uburma_jetty_uobj *)event->element.jetty->jetty_cfg.jetty_context;
   188		uburma_write_async_event(ctx, event->element.jetty->urma_jetty, event->event_type,
   189					 &jetty_uobj->async_event_list, &jetty_uobj->async_events_reported);
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
