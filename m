Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E1C408033
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781184087; cv=none; b=HT2dxvPXcZdUC/WGrtcL5C4p/35fBdkuk398ELJOrv0B83xtCAcK7VNPT9xpJ106twHhLQ4M/Rz04G/ZSMnRCo5Snlu0zpqKRzgWN6tmYhrf0Ts3xiN2IYN2P4Fc8xXKF4KDZGyzwSKB5ApGhMczslq3q+PRazUDetS8DjXoZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781184087; c=relaxed/simple;
	bh=SZOIxmx7HM4Y7AmrNWuir5jACTpL6mtGF2djj6I1qXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UW3aLnLHPI667K6a8Q9K0tslTy1QfQ9ryPASNPSaT/C+WUJO9mkhawbccNuWewz9Q46vinel910mAdBwKgI4e5rtGMb5ubYHQB99VFLGlM9H/mFhRr5zqch2ops9Z8sK8/XC2onNbnto/B9rmW5VCFSgbXC2B+Li8jZ7TWGH/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chY7DIt0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chY7DIt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781184082; x=1812720082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZOIxmx7HM4Y7AmrNWuir5jACTpL6mtGF2djj6I1qXA=;
  b=chY7DIt0+uidF3MgbQHeQ0s+MvXgntzKzN4uLNT5EJ+yGTe+SHMWOtP3
   hx/s42llxmuC/OLLUN/X8iR5ZPnIKvVAdoT8hJBEJl9taii0CEPIwaYiC
   9ao3RP7r64AJo7hxNPKJORVbvC3f5UbuEfGfiPJxaVVMHEzqi0vvo108f
   M5ecmhBmGbacWFfjTrrMJ0Al56K2JNLrTLchO+pCJlwUBjVmI1D7hY1OJ
   60gTcaxbmkhWm9PhBEHfkYfVX940GJoKUxXLP8kw9jp+ThLwWpeF9yAQF
   qEZ5uxh5UI6+JcnS3rdWyaV22lo+mCtxf9t37/eCibKd4Dp6Mlr+mVCcb
   A==;
X-CSE-ConnectionGUID: Dp01YsxiTU6+nuDZL7Hoig==
X-CSE-MsgGUID: MmH62BJSQQ66js9NUQfClw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81977162"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81977162"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:21:21 -0700
X-CSE-ConnectionGUID: OJWjcA50RzO6Pjq6LEESDg==
X-CSE-MsgGUID: jtSREQtbS2ab378fJYTxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246564439"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2026 06:21:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXfLR-00000000N46-3mbH;
	Thu, 11 Jun 2026 13:21:17 +0000
Date: Thu, 11 Jun 2026 21:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 3143/13002]
 drivers/block/drbd/drbd_nl_gen.c:641:42: warning: 'drbd_nl_mcgrps' defined
 but not used
Message-ID: <202606112136.Kj19id9g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 8098eeb693c4cc4e774c62fbd4875197cb5578ce [3143/13002] drbd: replace genl_magic with explicit netlink serialization
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260611/202606112136.Kj19id9g-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112136.Kj19id9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112136.Kj19id9g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/drbd/drbd_nl_gen.c:641:42: warning: 'drbd_nl_mcgrps' defined but not used [-Wunused-const-variable=]
     641 | static const struct genl_multicast_group drbd_nl_mcgrps[] = {
         |                                          ^~~~~~~~~~~~~~


vim +/drbd_nl_mcgrps +641 drivers/block/drbd/drbd_nl_gen.c

   640	
 > 641	static const struct genl_multicast_group drbd_nl_mcgrps[] = {
   642		[DRBD_NLGRP_EVENTS] = { "events", },
   643	};
   644	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
