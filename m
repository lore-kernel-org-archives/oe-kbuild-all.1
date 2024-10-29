Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3FA207A0E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234252; cv=none; b=dejmo6BwYEqJIUWpIkcJJxMe6IfyiYkoVUyz6Jue722S0UaMQUF0sC9oTaOfvbblZWB4Q/PreiwW4Bf5VcHSiIXjPQGU6JukQohTmjofEy69qCQ1u1WjpPo82hPQnTgQxqwdXlZ5Xfl+NPTj4AEd3QKhIqEhD9SRtG46Xhav6Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234252; c=relaxed/simple;
	bh=KLLT40kb3aKZF2HXEme+kUgTKTdopUj/yUsNiq8sSZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+6yf1HGKkECPSenlHjFkCvvgH1cK4w2Y0xUdhz+npZ1I60KbiD0IsUP05l/13Awc4td2UGrgod+5rFH4oWfpMbeIaWdlpyGt9NDiC+7NXtESlKG1tKu+Djo/tsc3Qoa+1NCMKuNASrBp6rGfufifv0XfIqf4U7ufEAnRls90Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eC8tmxBE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eC8tmxBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730234250; x=1761770250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KLLT40kb3aKZF2HXEme+kUgTKTdopUj/yUsNiq8sSZk=;
  b=eC8tmxBElUPWMj+TLCWVYEL5W9BI4xWBvEJ25QAUCCkAu8Qv67S3eOWo
   DcUbcuNojNxFygOB5v1KaU+lIUcB7svkcVgFPtSkxdnOl727yX/nh281v
   4eFwWFsao9TM49mIIdDG4N+WoFbkg87nstaprOlQcbFs94kMpx6i94JEL
   dDn5sQBgy6bESsDnKpQyj9LyoZYxAChbSBbDUfQykQlfHynrnR7HGCZlJ
   7Jx/DgFU+JOah6SmFj6hAKjt2wLzmgLN1rXubyG1Pkf5FYMIYYygBNyGF
   Uc5PAzoiopvJyUp3py6RKBXWZm7zs+SuBkXE5Bt6RD0QJs04W/ENQFzpl
   w==;
X-CSE-ConnectionGUID: dSoqE//NRB+rz0h6+k/Ylg==
X-CSE-MsgGUID: 7+lKEO+eSmyGA4nojWclHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29329459"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="29329459"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 13:37:29 -0700
X-CSE-ConnectionGUID: k6jW8XhiQeKuDIZm56dlFg==
X-CSE-MsgGUID: 2vFEPgM6Q0SP86zkNyabdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="105413900"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2024 13:37:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5sxy-000e7c-1Q;
	Tue, 29 Oct 2024 20:37:26 +0000
Date: Wed, 30 Oct 2024 04:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18717/30000]
 drivers/ub/urma/uburma/uburma_cmd.c:144:6: warning: no previous prototype
 for 'uburma_jfs_event_cb'
Message-ID: <202410300443.E0lKV9go-lkp@intel.com>
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
commit: dd9641804ad19402838975c28003465d0b42042a [18717/30000] ub: uburma add cmd create/delete jfs implementation.
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300443.E0lKV9go-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300443.E0lKV9go-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300443.E0lKV9go-lkp@intel.com/

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
