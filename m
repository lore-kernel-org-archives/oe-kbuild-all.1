Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DA08C11
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215996; cv=none; b=Rk9wNMxV9Spl5lYIQpxNdxvm8KnnDrDiDMRE0czcLqtTeJm0A8FtT9iuF48TCxPWHWyIhqdqRvUiQW1zEq2+EGat7104/aL6IuyXULOd7FFxbcUuFh2xr8fpi4cmr6LwLN5UzwwH/iqVVFTsvkHPjPdj0dMAJxAEGqtL5ptjqK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215996; c=relaxed/simple;
	bh=Pu+lXEuQuBjxQ6ieEAg9KvvoWF/27MpcVXicqQ7WXd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NSmyn9L8edb88DuT5OPZ6OMtykGYTDWbnErHhFgkyqrTgfv4Xgva0qJUlNyCJnFzc944kWSOotdIk5V+AnG0VHe/+/Ksx2SJeNu/2BT4cMvy5FwvxmwxtYKZy9VGtiVojHfI58GJnuz8ElS3/Gf10b5tZHecKAPwMSxcI0SX/Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZjbk82S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZjbk82S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733215995; x=1764751995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pu+lXEuQuBjxQ6ieEAg9KvvoWF/27MpcVXicqQ7WXd0=;
  b=CZjbk82Sm8aS1/74dbH+u3ZkZF8APCj08NSK1K3jMI3DdhUWZVN3BUe2
   fCYQPPPxxll63ySfjv0nZr+jksAcPXEvcMcEMNo21jtNoatdnsghR5tay
   cAgi2DbhFcN9LVygHqJECwxrR6hJrbw81JqtgXMLod7tayZ3cLQ87opoK
   xsJH3XmHITVO4C0N0WX9f2iMyy0nEnJavyOgg5Jt6xsTC106W6ZMJcvsx
   9u5cACkOhMMoUKgyLVqCPUuUNvFQFZWA9fh44qXrrIkX60VFq82Pg5iyM
   depFQ+iKSSvh7eG2eq9/PX+JYXLBqToczy1rjSDdsTCS+XIyeP0p4+/Jd
   A==;
X-CSE-ConnectionGUID: kE2zjuDSRYm/xdIAbQzmig==
X-CSE-MsgGUID: ILKJbHkLQ7KCml2/egeCwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33337514"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33337514"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:53:14 -0800
X-CSE-ConnectionGUID: w8Jrh0bTSVeG+fvc1o8hnA==
X-CSE-MsgGUID: FGf9OrY9Rr6b3vDFBe3k9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93566421"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2024 00:53:13 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIOec-0000QV-1V;
	Tue, 03 Dec 2024 08:53:10 +0000
Date: Tue, 3 Dec 2024 16:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype
 for 'uburma_jfr_event_cb'
Message-ID: <202412031613.U2IyZ3gY-lkp@intel.com>
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
head:   930fc4e0720aefe8131ce1113fc933a6a695f82e
commit: 79b60243a9ff771b76add8e16cfe55cc4f5edef2 [2516/2516] ub: uburma add cmd create jfr implementation.
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031613.U2IyZ3gY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031613.U2IyZ3gY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031613.U2IyZ3gY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     144 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:156:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     156 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/uburma_jfr_event_cb +156 drivers/ub/urma/uburma/uburma_cmd.c

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
