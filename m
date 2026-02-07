Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A6F1EB1AA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 01:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770428848; cv=none; b=C62MVEydlD1e7nI+QiB1ow0SrGFXNt2AGGqe1do+Ds+SEprfjXiGDRaU90/jpxg76a+XgnhSbdGm5Q3RJ50K734JqGvyJ+w3bsTpz4hcgVnrfOuHu5s2Uv0iCOrRnCG5lHHHY9m0CBCcJia7wwWLM+XisWvmpJu0Esn4ht+pb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770428848; c=relaxed/simple;
	bh=moz+8kVk8RJx6KM5MCRA0Ss0quLK/1slgnIPNM+t4No=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hM8blVZlH3L8dbH8JKy1UC24Vg8K93/+1vKZ1jcLxMRuBcrkm/aHkit7pWX0kPIHa8yNPCMi6SknGqlSUIWdHhD0/kGHMxnhV5woZZekAgUDB6gya7CxXaKRYKtlyNichSnf55oo+Uia48bJgBN5aCD99SeCC+P0WUEbkbiVQDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbZOm4SN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbZOm4SN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770428847; x=1801964847;
  h=date:from:to:cc:subject:message-id;
  bh=moz+8kVk8RJx6KM5MCRA0Ss0quLK/1slgnIPNM+t4No=;
  b=MbZOm4SN8tNjHDklGK1hshX287n1/xgDF0q86uG13K+7zH5iOs+KXBl2
   ODumEUNUMfrRDrtxZO//SH9W0XN+L+DcmZmg+bl3zj0mnVv2anCLwVJsx
   RkwL87qAsp0tOPdHTnupdBt1ckFMXLd5ZpV6Gh15Uiu4z+hFEQ8GFelf/
   +KhKWK9jSM24NudmkajvGr9SC5UtOGlTOc8+LRY5OuNzCqWSyFRI0mQ5M
   L1zxIP4V4XVIZTleGH4go9NvEu8Y8GNgwUO25B9Vsx3LigZCyPHSfp6CM
   8lbi+IhvhksgtSdTwsiIm1zCg4LtN4ztvEh17wOz5QTZ2OfNXd2Fxzh5w
   Q==;
X-CSE-ConnectionGUID: etRqr/eWTnSjjbaLGsgL9w==
X-CSE-MsgGUID: ddTzvdVlRcSvBj/Mzxie7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89057756"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="89057756"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 17:47:27 -0800
X-CSE-ConnectionGUID: gS//r9ZbQzqLzNFceZPtnA==
X-CSE-MsgGUID: HP8fBgkETXGjc/0kuKiFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210786432"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2026 17:47:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voXPv-00000000lKA-39R8;
	Sat, 07 Feb 2026 01:47:23 +0000
Date: Sat, 07 Feb 2026 09:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 3/3] fs/nfsd/export.c:381:14:
 error: implicit declaration of function 'genl_has_listeners'; did you mean
 'rtnl_has_listeners'?
Message-ID: <202602070956.auPKS6xU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   aef82be579c01a1995f0e0c98313f23e7e4893a0
commit: aef82be579c01a1995f0e0c98313f23e7e4893a0 [3/3] nfsd: send nl_notfiy when a svc_export upcall is queued
config: m68k-amiga_defconfig (https://download.01.org/0day-ci/archive/20260207/202602070956.auPKS6xU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070956.auPKS6xU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070956.auPKS6xU-lkp@intel.com/

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
