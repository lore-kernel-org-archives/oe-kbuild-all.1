Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062BC20B1F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730244279; cv=none; b=NFc6ZEfFU/l3l/WT9TsTIycaTPL98QL5kYeboz/ze/puSvvNNrA2o6iPD321pRRhRiLPpuDgiRFyTk4mVuED7SpgJMKfYqmLSac65kEGW6lahP7+fIzZc1/QXOzDKoOysP6Xc65hWELhIoXZ4Ns7Yx7MAEpzIe29nftBDI+QiSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730244279; c=relaxed/simple;
	bh=yWq3T3WYAtGhznk4rWq2BGfRmEqkOddHXUHwl35V+sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGd6jJICLS++WR4vNLpOrPo8QDnUFa1x/0/W8o86PhqGg6ueT6UjpFqIcVdyaJXMPVKX2YgqEO+S1PUUrnSmPTWqImNtfOV20nmKGnFXhOf3qCKGdWLWvZEep34kOn84BQjwiW6M1SaHZtvAZGMnqjIFewE54SgW/f7XrPm6TfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEoGgfFx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEoGgfFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730244278; x=1761780278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWq3T3WYAtGhznk4rWq2BGfRmEqkOddHXUHwl35V+sk=;
  b=nEoGgfFxCXqvB5aIB8qzHmMsx+1rEAqVhy8Q3U+iH8/wEITFK0Wr09MI
   OC/hMlikaSnUPLzpIiMBEP42nQ2AvhtH9+2UQy7PfG+Ibgr/zqHB4dFap
   POO4QAgYr+AI9A5EfRwUQ+1X/48MF2+I91BolwWfFHM4+HqR40s/Cxg7S
   4PbIEuWZq2P1efu7Z0I8ll04ozG3jLrXyKKjdjkROGQ1NuDlgw43H7LrB
   eG2JslDq9QVD6mKf8buJCCAi7Gcval2h3GDCLxd0gr/tJURBx9GTDoJSs
   P5dGYeMfhIgQez0Hg0R1gWiKa0yg20fXJxmmdGU0c8Ma8JZfOm9YrCGzM
   g==;
X-CSE-ConnectionGUID: OYE54/VuQgWGIiUTVSgdwg==
X-CSE-MsgGUID: ZXW0OcpgSF6iDIvC/YwAHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47381052"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47381052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 16:24:37 -0700
X-CSE-ConnectionGUID: gQ9wEGF0QCq1gM4veNbbgg==
X-CSE-MsgGUID: S9tbrbTLReezFt9Qc52I7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86876325"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2024 16:24:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5vZg-000eGU-3B;
	Tue, 29 Oct 2024 23:24:32 +0000
Date: Wed, 30 Oct 2024 07:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18718/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype
 for 'uburma_jfr_event_cb'
Message-ID: <202410300700.74552znZ-lkp@intel.com>
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
head:   ffc5791ca9102a55d29c6dea26de38d32f052b01
commit: 79b60243a9ff771b76add8e16cfe55cc4f5edef2 [18718/30000] ub: uburma add cmd create jfr implementation.
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300700.74552znZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300700.74552znZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300700.74552znZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     156 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~


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
