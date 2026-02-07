Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824892153EA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 00:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770424735; cv=none; b=RQjaSkO/3Q+HI2HTsPky49wl0dmFPb0A5DjOEFDt28ncg5o4e1FJu379MVeajBrDw+rRjzSq0YZChTssQlNyucF8Ge7YmEED9FSQmMR+HYsMF574bNVBxOz5QBdQ1ajVvXPJm3fJmd3FJn8v9KbJU4Ixd7i3tOmiEBQPQTxuXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770424735; c=relaxed/simple;
	bh=E2djtCsdKnGIK58gywsD94X/wVVazDJQpxswrIqWV+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Edgb3GIjT4FfN7lVm16JFr5LB3g3+hhIQB4CJBYQ+RTADGFR1KaqjIb4oKmWmu57GQMvQAZrlfqcjQtvarpi/OWdBk3G//QNzNONMqcUsAIN7IIdFiWnYvtrUs2eFsGzr/rKSaFqea7K5p7YDuElRlKIi88hArcaMqULuGfik24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivyOP6OE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivyOP6OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770424736; x=1801960736;
  h=date:from:to:cc:subject:message-id;
  bh=E2djtCsdKnGIK58gywsD94X/wVVazDJQpxswrIqWV+E=;
  b=ivyOP6OEgjAA8X/xNVOux5wZmXHqD68oQFtpDz1WQpYxerYe9AQbMCKD
   XSO2x2UUia/ujsoOc9no6UMj6Lc0R8eGfjP/fN6AVXD8NcO52hwO1GVu3
   mc8/g9TxjY9reaPhUjg6vwNva06Wz1nAV11cKYO2l+jfQOtykLJ7xmH2E
   YRIbw0HiccVbe0SkRMUuI0Y3ypnPl3gNLeKJoPCrpEZgfMtzXrZqRYwJt
   n5D1ROYCqPXle6Hg9E0J0fDbnyM91sEMNWOAxRN/wNwcyZXUtFLaQkzmv
   tbmVUaEwVtTC4RQvwGhJW5D/7yQpoxeIW9sKPhu6x+ecORYd3GqXIpRAB
   g==;
X-CSE-ConnectionGUID: 2YXxL03bRCq4z4FpA0cGYA==
X-CSE-MsgGUID: 0k9LKmXwSe2jwO34D3tbWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75484732"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75484732"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 16:38:55 -0800
X-CSE-ConnectionGUID: e54nrwl9Ql28fqMIGReINg==
X-CSE-MsgGUID: 6JCPhNRQQRewE/BfAfKJjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215192509"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 16:38:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voWLb-000000004lN-2o3z;
	Sat, 07 Feb 2026 00:38:51 +0000
Date: Sat, 07 Feb 2026 01:38:18 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 3/3] fs/nfsd/export.c:381:14:
 error: implicit declaration of function 'genl_has_listeners'; did you mean
 'rtnl_has_listeners'?
Message-ID: <202602070148.rZnvJ8Dw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   aef82be579c01a1995f0e0c98313f23e7e4893a0
commit: aef82be579c01a1995f0e0c98313f23e7e4893a0 [3/3] nfsd: send nl_notfiy when a svc_export upcall is queued
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260207/202602070148.rZnvJ8Dw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070148.rZnvJ8Dw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070148.rZnvJ8Dw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfsd/export.c: In function 'svc_export_genl_notify':
>> fs/nfsd/export.c:381:14: error: implicit declaration of function 'genl_has_listeners'; did you mean 'rtnl_has_listeners'? [-Wimplicit-function-declaration]
     381 |         if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
         |              ^~~~~~~~~~~~~~~~~~
         |              rtnl_has_listeners
>> fs/nfsd/export.c:381:34: error: 'exportd_nl_family' undeclared (first use in this function)
     381 |         if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
         |                                  ^~~~~~~~~~~~~~~~~
   fs/nfsd/export.c:381:34: note: each undeclared identifier is reported only once for each function it appears in
>> fs/nfsd/export.c:381:62: error: 'EXPORTD_NLGRP_EXPORTD' undeclared (first use in this function)
     381 |         if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
         |                                                              ^~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/export.c:384:15: error: implicit declaration of function 'genlmsg_new'; did you mean 'nlmsg_new'? [-Wimplicit-function-declaration]
     384 |         msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
         |               ^~~~~~~~~~~
         |               nlmsg_new
>> fs/nfsd/export.c:384:27: error: 'GENLMSG_DEFAULT_SIZE' undeclared (first use in this function); did you mean 'NLMSG_DEFAULT_SIZE'?
     384 |         msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           NLMSG_DEFAULT_SIZE
>> fs/nfsd/export.c:384:49: error: 'flags' undeclared (first use in this function)
     384 |         msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
         |                                                 ^~~~~
   fs/nfsd/export.c: At top level:
>> fs/nfsd/export.c:377:12: warning: 'svc_export_genl_notify' defined but not used [-Wunused-function]
     377 | static int svc_export_genl_notify(struct cache_detail *cd, struct cache_head *h)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +381 fs/nfsd/export.c

   376	
 > 377	static int svc_export_genl_notify(struct cache_detail *cd, struct cache_head *h)
   378	{
   379		struct sk_buff *msg;
   380	
 > 381		if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
   382			return -ESRCH;
   383	
 > 384		msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
   385		if (!msg)
   386			return -ENOMEM;
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
