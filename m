Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D231D6C5C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217567; cv=none; b=H6hCFEsjNH6d6QEfe8N9EEHQf6bgNoW8TxZvqh/HgN6ACYAN+XB3lV+ogkLNX9RddhpVISz7iO/RF9ibypGYCBfPhZYK2PvXw0wPMbklTYafm8ffDup5mvoTTjM1YQdE545fIp4eXW40ai54SM8SkQDaG0bYgRJhJwTpgb5a6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217567; c=relaxed/simple;
	bh=P+B9YEQdpF6gQitzmAwcw2pgg+bup13n3gq66WePkEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tn7L7cuZdloyFtlZ6Ih3Ff24Pd/RDs0+4fW45pKVDq5Gg1K7KqCil076YXZeDKXGztcM2skW9WhxDYkdEkxaIErWGsPBElXoz1SZbzd8KYTMnBzPNiSwOQOALZsX5O1wL/tT3Auy+glNxqYKcBXfcXdWSG2FFgymTEjtHgzyMlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDJqfXoQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDJqfXoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726217566; x=1757753566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P+B9YEQdpF6gQitzmAwcw2pgg+bup13n3gq66WePkEk=;
  b=BDJqfXoQe8EKtR4hHUEoyahYIRfcVI6vCTdvWMXEwPNtZAUJig41Ib7/
   J+VAZtenXsun+lI2iK/jyRslVBXhqn0Or5d1zpxmv4Hf7uz842RrsTrh5
   HUqocuReWBklmWLTzxUQMGrU3/DF9vUJVvG3nyQh7nf29DKeXwslzCipW
   jordnnpBKyIvdoO/QdumV9gJTzwuohSxArrb3UuKuas7TUko+qJgKGN2w
   KN0JS2PfrSt5uVejD4lzNhmVrC5aUUe/z2FqauZbtmNzypaJimYh8Hy46
   UCfDlRQhtH/ffvDSjI/ieqjGXuCoIYyNwxQXGGOmW0kx9xx3Bzty3O4cv
   w==;
X-CSE-ConnectionGUID: jH20nseaSWK+RPShvaxQ8w==
X-CSE-MsgGUID: vCV1Zi0HSg6IsNofdFDAdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25263071"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25263071"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 01:52:45 -0700
X-CSE-ConnectionGUID: H4R5UdzOS7WbYR9DY+bPXw==
X-CSE-MsgGUID: j8zhYPeTRyWkoCCti1injg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68073181"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Sep 2024 01:52:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp22j-0006G2-25;
	Fri, 13 Sep 2024 08:52:41 +0000
Date: Fri, 13 Sep 2024 16:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19395/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype
 for 'uburma_jfr_event_cb'
Message-ID: <202409131601.MyaN9hL3-lkp@intel.com>
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
commit: 79b60243a9ff771b76add8e16cfe55cc4f5edef2 [19395/30000] ub: uburma add cmd create jfr implementation.
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240913/202409131601.MyaN9hL3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131601.MyaN9hL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131601.MyaN9hL3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     156 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/uburma_jfr_event_cb +156 drivers/ub/urma/uburma/uburma_cmd.c

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
