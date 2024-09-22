Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7628447F6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 06:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726988325; cv=none; b=aoGlSMAoktixXl6qd9xrYjcrmPz5InmnkMWT+F5BZiiqZ1zYU/VP5Fbkl539Cpw7HoSxbO5LU6skAwquMjpNd+QRbGnbrbtGrzSU0vTQk+PkhEgrZpR+y8qpNubPoClhKdEz1XUcilmqVLMSh8h/CWA3MNBnKE5bSGnR+RhP1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726988325; c=relaxed/simple;
	bh=A/nl+AbX4U6Rwe7wnDwTzMj1IHqCVUW9q/wxSf8aY7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/dCDxmbwxtr0grVGJNQolRoj+FEoXWUH5UH5pNl6NqbbxFkTh+WJS8iDeBIuxCAzIN7qwP5rpX83634N6KeEJL5Z44UtrPpZf2TJWuL1I+s4ogkWMDxYqj2mu1uX6eGmRWpH+z/lwDtp25UOET+jmAomJkJoLrMxATKzmax8Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnC2ZbMi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnC2ZbMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726988324; x=1758524324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/nl+AbX4U6Rwe7wnDwTzMj1IHqCVUW9q/wxSf8aY7A=;
  b=dnC2ZbMisjbQHo5VWIyziGhUS5AFIAo8zehcM766ie0obqIUospx/0vO
   oZuTeaejUE0BWobk/ohatGkKAmrYD44rA/pPYQaImv0MWw3obYog88RWR
   gWy2Ffmxj58xkoQ+/objfAAe03t5ajlgNYXGgruh+fWFDBQahTmdhjlci
   Sm+Q0dmvJxx8U1VCQenXYGc4tn4GgO7shJx+IW7z93tVIti6hoBRRCLZN
   X3S0P7YH2JjQW4zpu9BS4+RKtDqQzGQcgmlsRBIIf8SeeBGgLREHGd23E
   hsNXdGrGflaijEtvLbxSO/4rpIPQUZHYJ5XqaFWlnx1CP133ANzKmm3cZ
   Q==;
X-CSE-ConnectionGUID: 7eKPv5KlQQGJ16Yyja9Lvg==
X-CSE-MsgGUID: Aywp4HmMR/69LIzlNI0ELg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25776409"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25776409"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 23:58:43 -0700
X-CSE-ConnectionGUID: ioxVTiURS9Ol+oKiUcYWbQ==
X-CSE-MsgGUID: Vg+vgGwATbyIaaobTs57tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="108175015"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Sep 2024 23:58:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssGYJ-000G6e-1R;
	Sun, 22 Sep 2024 06:58:39 +0000
Date: Sun, 22 Sep 2024 14:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19316/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfc_event_cb'
Message-ID: <202409221433.k1AuxCcw-lkp@intel.com>
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
commit: c4cd0655c0c898569c0a70162f36258fd5c50eeb [19316/30000] ub: uburma add cmd create jfc implementation.
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240922/202409221433.k1AuxCcw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221433.k1AuxCcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221433.k1AuxCcw-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


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
