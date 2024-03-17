Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA387173
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 00:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710634749; cv=none; b=QfrjwIBTOnQiFAfmb6vJ7TAE/QM9O2pIkIEHfLEL2UZtVSjhi/bTlZLjdJJVBix2zzWYDMYCd4pDghmeSy+rmp68Ksb9S5HEwVFk2nXHbuEcFGeBdbYAyeBMRm3ZUnTivtqepCX4rhNh0yqSWJFMoFxev+Ur6PQRSAaawYQhE2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710634749; c=relaxed/simple;
	bh=lITrCwgp7X3lbyjEVRE1II0/4vc6AinojrLfEAGsZjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MsOzr0xDwV6Oya/yYqOHEZ2MulGhMlMZdRwUWrpuv8dllwHmAScYjiU0fWCwjnsJtDdbJ6iDY4gn5V/JLgCLEDYTywjJZl2AAzmB4J2oFZ3vfpMGBwPCN3zMCrqHXA1IVelt6uyezqo+MFGCCeuzr/5n0ex7oUWYc3SpWTILGqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrAapXYi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrAapXYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710634747; x=1742170747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lITrCwgp7X3lbyjEVRE1II0/4vc6AinojrLfEAGsZjo=;
  b=jrAapXYivuvHaR8o8UPl37dz9oVe8GgP0JHCs4NkGbiHKGZL9NZLAcPt
   gNZfI29tS7Izr9N6lkIHZpybOARBqmSFOb6zoaMPysCHOu8LlqQ9IVc0E
   YLO4yQuyUf3U4KQSuUrQK1hGfmiuhrJsg1HqJE05CU6e1ZVe/ImQgaWiL
   KbcuMxrWXLlyoFnBFdBXDOx4iN4YOysTrUZ+/NwSQuqwezZM0F8G6ha9h
   GcLnqmQoAuZcczT8frdOaW7y5IZERUCsuN4bHDGWXpad59cwhp8XUKCST
   DKPujUm50U8uH7M7FkIpp4qATjrzki7kG3xX8uwsREOXy2xRd/AzMS3jr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="5339777"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="5339777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 17:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="43983194"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Mar 2024 17:19:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rleEw-000Fsv-1t;
	Sun, 17 Mar 2024 00:19:02 +0000
Date: Sun, 17 Mar 2024 08:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24823/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfs_event_cb'
Message-ID: <202403170825.fqJgay3X-lkp@intel.com>
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
commit: dd9641804ad19402838975c28003465d0b42042a [24823/30000] ub: uburma add cmd create/delete jfs implementation.
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240317/202403170825.fqJgay3X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170825.fqJgay3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170825.fqJgay3X-lkp@intel.com/

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
