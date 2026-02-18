Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731C2BEFEB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771376969; cv=none; b=TGRYAcv+ZJvEmFn0lsnVfNq1y5EAmj39O0J4PVN0US+gbgbuAsL5SKYHca9EOEKI+9d5hlC71D/8VuJYed0Tw2OPus2dj86YyXKxnnuwZAjfhhJg9uLq3GE3CdttlvPoB1pa+SdsP5hb3ukSsNCJu7gf0yPWysex9NDh8yGUOnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771376969; c=relaxed/simple;
	bh=7QcIFyKzRWQWJq/VntPsn8L1MDvaoJqoTs4rCgZv6vk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dh0W1PimnGIpSEI4uxO6tN37UvBkbW5rxm5I3mfsqQlIBlCmVvSMo373sK/ciB3U11f/VIDnB+tNCaP0Xgxu7GIX9lOrgqH+ud8S4M76CRNXN7p7eBwx6oyMTrlytNe8mAuotbQWYYVKTAw4ND4k5fhzTahaSANDybsJkgAhVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgTZLktP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgTZLktP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771376968; x=1802912968;
  h=date:from:to:cc:subject:message-id;
  bh=7QcIFyKzRWQWJq/VntPsn8L1MDvaoJqoTs4rCgZv6vk=;
  b=HgTZLktPFnVyFtnZ5s4OSkFc7kpJnUo0c3aNSX122wvkgLCHfd8cY9vi
   iAxyw4rSJOsNke0mPODdqJL1CRybspGJkbg6E/w2WleYH1PA2J3WCJqLI
   BZUGKMHOD1zmb41+sBg9gZtByY1Q/ttlmKGQAhrBhI+M3MIpdFcpDdOeX
   JEGF2vf46GpmWy6eIwfEmhrNugZhAfbal5TjG6H8l1PWkYRK//h9dO7Ho
   K/GE8Mc4FCa7hL2niisaKFHYKwTa9mHsoqfascIExECvY5pi/a/i6sCT6
   Dov3sUyUNi+YsQwmgTa6lH32ED5Xms0KZxE/nCd2NYep9/YvNKLKV5Z9t
   Q==;
X-CSE-ConnectionGUID: rrfmTqddQ6GyHB/k+wJokw==
X-CSE-MsgGUID: oiBlr+D+R+ShQF5QDfsX6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72169567"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72169567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 17:09:28 -0800
X-CSE-ConnectionGUID: +mZVe5OYSTWIPB8MUAC+eg==
X-CSE-MsgGUID: f94PPOlnRsG+GJ4yK3Z3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="218585846"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2026 17:09:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsW4B-000000011tc-1gZU;
	Wed, 18 Feb 2026 01:09:23 +0000
Date: Wed, 18 Feb 2026 09:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 7/7] fs/nfsd/export.c:388:2: error:
 '#endif' without '#if'
Message-ID: <202602180928.XBf0VA35-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   67896fe53a48a300b8826416c1b4023d407c852d
commit: 2529f9302b956a547b3458dd98d0a9b472feccc3 [7/7] nfsd: send nl_notfiy when a svc_export upcall is queued
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260218/202602180928.XBf0VA35-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180928.XBf0VA35-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180928.XBf0VA35-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nfsd/export.c: In function 'nfsd_nl_svc_export_get_doit':
>> fs/nfsd/export.c:384:13: warning: unused variable 'err' [-Wunused-variable]
     384 |         int err;
         |             ^~~
>> fs/nfsd/export.c:383:15: warning: unused variable 'hdr' [-Wunused-variable]
     383 |         void *hdr;
         |               ^~~
>> fs/nfsd/export.c:382:26: warning: unused variable 'nn' [-Wunused-variable]
     382 |         struct nfsd_net *nn = net_generic(net, nfsd_net_id);
         |                          ^~
   fs/nfsd/export.c: At top level:
>> fs/nfsd/export.c:388:2: error: '#endif' without '#if'
     388 | #endif
         |  ^~~~~


vim +388 fs/nfsd/export.c

   378	
   379	int nfsd_nl_svc_export_get_doit(struct sk_buff *skb, struct genl_info *info)
   380	{
   381		struct net *net = genl_info_net(info);
 > 382		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 > 383		void *hdr;
 > 384		int err;
   385	
   386		return 0;
   387	}
 > 388	#endif
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
