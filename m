Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7661FCF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726958892; cv=none; b=p07p6nGIpaGEn+5RmTxOlTGdei0DaqFCWWGra2KNl6n0P/cLDy4kekBBPWJ2sLAALN2e+7ULDH4FOm5gyhHwcJaMAnMW0aQR5mEcBFWQ0l5o1TEJUeySO3mq9oQF2yhmilDFzWxWj0QqW1scqnsoMcfz0Zdo7ONd69cnom6rApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726958892; c=relaxed/simple;
	bh=kFGakh2Go+h9Q1VkdhoXWYP8+uF8x2caQLOkdhdx8Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qU0qBbm76N/eAy524qldtSH4ZfkSUneMyLCNe0Cqkyx53T7mz6A+1G9yacZcS/a+durL9UKslLC0ttvi4amu18p5hyTo04o1BFA6p560pG3D6z/DXi16L+5lrvNVwXh6YAa/A5XYSUoJaW4Jicg/XQqu/zsmIrew20KNKKxiMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2qQYgTr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2qQYgTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726958891; x=1758494891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFGakh2Go+h9Q1VkdhoXWYP8+uF8x2caQLOkdhdx8Lc=;
  b=U2qQYgTrXBA4WMXc7oQu55I02yqYTTobMtZexOuiT2/5m6YrSJ70muzn
   Sy2QIPbkSMAIZWhAoBfmKIY+C496WqOIjsIWzydM7nbbInG4NqG5Znbv3
   Jj16MnKUxT2e0nYahmbvaygJyejIGCWbhHBz8JvvEMuz5Lkcu3OpEGb1H
   IX+CeHc3341aGleUqtGJaQcd5k6obd8haRPOn9yYExYNtmkNADedphMKz
   NdoY/e/Qc1PSmAFcfl5GQXvJvNOFushnwwjY8+KlSGYf8BpIAzH/k89wU
   4PWwO4Bw+iB+qx8a/MYlZbU79IivLZgNkRYEq39FCR329ugkoM9AvbY/H
   g==;
X-CSE-ConnectionGUID: HhpLh2m5SXSqz21fb/E8MQ==
X-CSE-MsgGUID: iPgKALw/Qhqd7CPPIz0wxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37310284"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="37310284"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 15:48:10 -0700
X-CSE-ConnectionGUID: iUCtl16YSaSBM3+Uywgo1A==
X-CSE-MsgGUID: 32KJRjXCSvq43EBwbjCbzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75442535"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2024 15:48:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss8ta-000Fqo-12;
	Sat, 21 Sep 2024 22:48:06 +0000
Date: Sun, 22 Sep 2024 06:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19314/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype
 for 'uburma_jfr_event_cb'
Message-ID: <202409220650.QvCRtuNe-lkp@intel.com>
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
commit: 79b60243a9ff771b76add8e16cfe55cc4f5edef2 [19314/30000] ub: uburma add cmd create jfr implementation.
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240922/202409220650.QvCRtuNe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220650.QvCRtuNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220650.QvCRtuNe-lkp@intel.com/

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
