Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2008272E5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217836; cv=none; b=JDphozbStuCgl0FYXCQ/NewEQU/TYZHBN4Oar1Dq0CR3VLyMaEQFt+XLrXwrYPvDwom4JQT+LPwJ1nawTIyFSCe2susN9QkfkszYeN5jKx/P9x2heTDQKJwLeQt0N/QWanQNGdH/CRZ2JxQraZ1fsoA+5c234X2nqS5FkTeYQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217836; c=relaxed/simple;
	bh=pUhczTFxFK//x74/GLVSjCp54Mp/AI+ECRjcC7UguWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TYYG90J71L+7Sy8MsxaKFL5oLVvuKTy4IUGcWnlJt0hYis+w1jOFb+1RHnDzNeQXHUizgFodc3S0ZZOVWiu2rK8xnXjWcT7RNiVvMvafLyi6L5P58uQ1PYxSvZ+TsSaq3UeVoMJcDKSze75D3ZZ2QPAiuqT7SSqbIQpiDqMH8CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ht3Mkzoi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ht3Mkzoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747217831; x=1778753831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUhczTFxFK//x74/GLVSjCp54Mp/AI+ECRjcC7UguWA=;
  b=ht3Mkzoig0F31117BUoK4yd1A3A0Ga9428++Wf2cbfygLDeXAfFoIpJV
   d2jePk9KxhsIddLhUNAvMQwnFau02ueG3zaNVI9+Wlpk/loi3i/OC4BD/
   XTUGOLTrOderr1x+QNJ/boxwR9sgq55ohzeI55sqVeUaaD9kZ9MBWO1x1
   5ntEqe4245rkMKhA5+IcVBbvgj4UvnkUHGwL55TqV+3Oh2pi/OYZpxdWL
   qC4MjryCZNyaL3YsqS/eLMVcACW4K3cajNA28KCgURdCX/pO7PW2zaslz
   mDu/w79fwdgBPiZUlNvXuMIWc9whJE3H5xLmUoEI+u1KseRNCi4QvZVUI
   w==;
X-CSE-ConnectionGUID: cctsIMYWT9ii5XjxMjcTIA==
X-CSE-MsgGUID: nYwdazGuRE+KKRAqrY5ZRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49086961"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49086961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:17:08 -0700
X-CSE-ConnectionGUID: GjtIEYBDSbC+GWcxujFoIg==
X-CSE-MsgGUID: RGpChVc+T9m/faUahnP5vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="169094843"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 03:17:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF9Ae-000Gy1-20;
	Wed, 14 May 2025 10:17:04 +0000
Date: Wed, 14 May 2025 18:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2894/2894]
 drivers/ub/urma/ubcore/ubcore_main.c:890:41: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202505141824.YitLoE8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   731227d05f54b13300b28332fabd3f3aaf0950eb
commit: 84e122368ec3a37e074c9657bc09422b62f6ccd0 [2894/2894] ub: add new feature for urma
config: x86_64-randconfig-r121-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141824.YitLoE8O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141824.YitLoE8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141824.YitLoE8O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ub/urma/ubcore/ubcore_main.c:90:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:90:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:90:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:121:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:121:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:121:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:143:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:143:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:143:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:159:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:159:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:159:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:184:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:184:37: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:184:37: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:194:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:194:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:194:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:228:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:228:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:228:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:313:18: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:313:18: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:313:18: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:511:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:511:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:511:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:518:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:518:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:518:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:524:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:524:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:524:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:530:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:530:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:530:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:536:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:536:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:536:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:542:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:542:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:542:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:549:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:549:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:549:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:556:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:556:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:556:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:563:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:563:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:563:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:569:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:569:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:569:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:575:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:575:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:575:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:614:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:614:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:614:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:639:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:639:34: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:639:34: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:673:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:673:49: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:673:49: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:724:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:724:36: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:724:36: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:738:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:738:44: sparse:     expected void const *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:738:44: sparse:     got void [noderef] __user *
   drivers/ub/urma/ubcore/ubcore_main.c:764:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *args_addr @@     got void [noderef] __user * @@
   drivers/ub/urma/ubcore/ubcore_main.c:764:37: sparse:     expected void *args_addr
   drivers/ub/urma/ubcore/ubcore_main.c:764:37: sparse:     got void [noderef] __user *
>> drivers/ub/urma/ubcore/ubcore_main.c:890:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] reserved2 @@     got restricted __be32 [usertype] @@
   drivers/ub/urma/ubcore/ubcore_main.c:890:41: sparse:     expected unsigned int [usertype] reserved2
   drivers/ub/urma/ubcore/ubcore_main.c:890:41: sparse:     got restricted __be32 [usertype]
   drivers/ub/urma/ubcore/ubcore_main.c:891:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __be32 [usertype] ipv4 @@
   drivers/ub/urma/ubcore/ubcore_main.c:891:36: sparse:     expected unsigned int [usertype] addr
   drivers/ub/urma/ubcore/ubcore_main.c:891:36: sparse:     got restricted __be32 [usertype] ipv4
>> drivers/ub/urma/ubcore/ubcore_main.c:1061:51: sparse: sparse: restricted __be64 degrades to integer
   drivers/ub/urma/ubcore/ubcore_main.c:1168:66: sparse: sparse: restricted __be64 degrades to integer
   drivers/ub/urma/ubcore/ubcore_main.c: note: in included file:
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     expected void [noderef] __user *to
   drivers/ub/urma/ubcore/ubcore_cmd.h:133:33: sparse:     got void *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *args_addr @@
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/ubcore/ubcore_cmd.h:122:41: sparse:     got void const *args_addr

vim +890 drivers/ub/urma/ubcore/ubcore_main.c

   886	
   887	static void ubcore_ipv4_to_netaddr(struct ubcore_net_addr *netaddr, __be32 ipv4)
   888	{
   889		netaddr->net_addr.in4.reserved1 = 0;
 > 890		netaddr->net_addr.in4.reserved2 = htonl(UBCORE_IPV4_MAP_IPV6_PREFIX);
   891		netaddr->net_addr.in4.addr = ipv4;
   892	}
   893	
   894	static void ubcore_sip_init(struct ubcore_sip_info *sip, struct ubcore_device *pf_dev,
   895		const struct ubcore_net_addr *netaddr, uint32_t port_id, uint32_t prefix_len, uint32_t mtu)
   896	{
   897		(void)memcpy(sip->dev_name, pf_dev->dev_name, UBCORE_MAX_DEV_NAME);
   898		(void)memcpy(&sip->addr, netaddr, sizeof(struct ubcore_net_addr));
   899		sip->port_id[0] = (uint8_t)port_id;
   900		sip->port_cnt = 1;
   901		sip->prefix_len = prefix_len;
   902		sip->mtu = mtu;
   903	}
   904	
   905	static void ubcore_add_net_addr(struct ubcore_device *tpf_dev, struct ubcore_device *pf_dev,
   906		struct ubcore_net_addr *netaddr, struct net_device *netdev, uint32_t prefix_len)
   907	{
   908		struct ubcore_sip_info sip = {0};
   909		uint32_t index;
   910		uint32_t port_id;
   911		int ret;
   912	
   913		/* get driver set nedev port */
   914		port_id = ubcore_find_port_netdev(pf_dev, netdev);
   915	
   916		ubcore_sip_init(&sip, pf_dev,
   917			netaddr, port_id, prefix_len, (uint32_t)netdev->mtu);
   918	
   919		ret = ubcore_lookup_sip_idx(&sip, &index);
   920		if (ret == 0) {
   921			ubcore_log_err("sip already exists\n");
   922			return;
   923		}
   924		index = ubcore_sip_idx_alloc(0);
   925	
   926		if (tpf_dev->ops->add_net_addr != NULL &&
   927			tpf_dev->ops->add_net_addr(tpf_dev, netaddr, index) != 0)
   928			ubcore_log_err("Failed to set net addr");
   929	
   930		/* add net_addr entry, record idx -> netaddr mapping */
   931		(void)ubcore_add_sip_entry(&sip, index);
   932	
   933		/* nodify uvs add sip info */
   934		if (ubcore_get_netlink_valid() == true)
   935			(void)ubcore_notify_uvs_add_sip(tpf_dev, &sip, index);
   936	
   937		/* The ubcore sip table and up/down events are updated synchronously, and the uvs
   938		 * is abnormally disconnected. After waiting for the pull-up,
   939		 * the sip table in the kernel state is actively synchronized.
   940		 */
   941	}
   942	
   943	static void ubcore_delete_net_addr(struct ubcore_device *tpf_dev, struct ubcore_device *pf_dev,
   944		struct ubcore_net_addr *netaddr, struct net_device *netdev, uint32_t prefix_len)
   945	{
   946		struct ubcore_sip_info sip = {0};
   947		uint32_t port_id;
   948		uint32_t index;
   949	
   950		port_id = ubcore_find_port_netdev(pf_dev, netdev);
   951		ubcore_sip_init(&sip, pf_dev,
   952			netaddr, port_id, prefix_len, (uint32_t)netdev->mtu);
   953		if (ubcore_lookup_sip_idx(&sip, &index) != 0)
   954			return;
   955	
   956		if (tpf_dev->ops->delete_net_addr != NULL &&
   957			tpf_dev->ops->delete_net_addr(tpf_dev, index) != 0)
   958			ubcore_log_err("Failed to delete net addr");
   959	
   960		(void)ubcore_del_sip_entry(index);
   961		(void)ubcore_sip_idx_free(index);
   962		/* nodify uvs delete sip info */
   963		if (ubcore_get_netlink_valid() == true)
   964			(void)ubcore_notify_uvs_del_sip(tpf_dev, &sip, index);
   965	
   966		/* The ubcore sip table and up/down events are updated synchronously,
   967		 * and the uvs is abnormally disconnected. After waiting for the pull-up,
   968		 * the sip table in the kernel state is actively synchronized
   969		 */
   970	}
   971	
   972	static void ubcore_update_eid(struct ubcore_device *dev,
   973		struct ubcore_net_addr *netaddr, bool is_add)
   974	{
   975		union ubcore_eid *eid;
   976	
   977		if (dev->transport_type <= UBCORE_TRANSPORT_INVALID ||
   978			dev->transport_type >= UBCORE_TRANSPORT_MAX)
   979			return;
   980	
   981		if (!dev->dynamic_eid) {
   982			ubcore_log_err("static mode does not allow modify of eid");
   983			return;
   984		}
   985		eid = (union ubcore_eid *)(void *)&netaddr->net_addr;
   986		if (dev->cfg.pattern == (uint8_t)UBCORE_PATTERN_1)
   987			ubcore_update_pattern1_eid(dev, eid, is_add);
   988		else
   989			ubcore_update_pattern3_eid(dev, eid, is_add);
   990	}
   991	
   992	static int ubcore_handle_inetaddr_event(struct net_device *netdev, unsigned long event,
   993						struct ubcore_net_addr *netaddr, uint32_t prefix_len)
   994	{
   995		struct net_device *real_netdev;
   996		struct ubcore_net_addr real_netaddr;
   997		struct ubcore_device **devices;
   998		uint32_t num_devices = 0;
   999		struct ubcore_device *tpf_dev;
  1000		struct ubcore_device *dev;
  1001	
  1002		uint32_t i;
  1003	
  1004		if (netdev == NULL || netdev->reg_state >= NETREG_UNREGISTERING)
  1005			return NOTIFY_DONE;
  1006	
  1007		if (is_vlan_dev(netdev)) {
  1008			real_netdev = vlan_dev_real_dev(netdev);
  1009			(void)ubcore_fill_netaddr_macvlan(&real_netaddr, real_netdev, netaddr->type);
  1010		} else {
  1011			real_netdev = netdev;
  1012			real_netaddr = *netaddr;
  1013		}
  1014		tpf_dev = ubcore_find_tpf_device(&real_netaddr, UBCORE_TRANSPORT_UB);
  1015		devices = ubcore_get_devices_from_netdev(real_netdev, &num_devices);
  1016		if (devices == NULL) {
  1017			ubcore_put_device(tpf_dev);
  1018			return NOTIFY_DONE;
  1019		}
  1020		for (i = 0; i < num_devices; i++) {
  1021			dev = devices[i];
  1022			switch (event) {
  1023			case NETDEV_UP:
  1024				if (tpf_dev)
  1025					ubcore_add_net_addr(tpf_dev, dev, netaddr, netdev, prefix_len);
  1026				ubcore_update_eid(dev, netaddr, true);
  1027				break;
  1028			case NETDEV_DOWN:
  1029				if (tpf_dev)
  1030					ubcore_delete_net_addr(tpf_dev, dev, netaddr, netdev, prefix_len);
  1031				ubcore_update_eid(dev, netaddr, false);
  1032				break;
  1033			default:
  1034				break;
  1035			}
  1036		}
  1037		ubcore_put_device(tpf_dev);
  1038		ubcore_put_devices(devices, num_devices);
  1039		return NOTIFY_OK;
  1040	}
  1041	
  1042	static int ubcore_ipv6_notifier_call(struct notifier_block *nb,
  1043		unsigned long event, void *arg)
  1044	{
  1045		struct inet6_ifaddr *ifa = (struct inet6_ifaddr *)arg;
  1046		struct ubcore_net_addr netaddr;
  1047		struct net_device *netdev;
  1048	
  1049		if (ifa == NULL || ifa->idev == NULL || ifa->idev->dev == NULL)
  1050			return NOTIFY_DONE;
  1051	
  1052		netdev = ifa->idev->dev;
  1053		ubcore_log_info("Get a ipv6 event %s from netdev %s%s ip %pI6c prefixlen %u",
  1054			netdev_cmd_to_name(event), netdev_name(netdev), netdev_reg_state(netdev),
  1055			&ifa->addr, ifa->prefix_len);
  1056	
  1057		memset(&netaddr, 0, sizeof(struct ubcore_net_addr));
  1058		(void)memcpy(&netaddr.net_addr, &ifa->addr, sizeof(struct in6_addr));
  1059		(void)ubcore_fill_netaddr_macvlan(&netaddr, netdev, UBCORE_NET_ADDR_TYPE_IPV6);
  1060	
> 1061		if (netaddr.net_addr.in6.subnet_prefix == cpu_to_be64(UBCORE_LOCAL_SHUNET))
  1062			/* When mtu changes, intercept the ipv6 address up/down that triggers fe80 */
  1063			return NOTIFY_DONE;
  1064		return ubcore_handle_inetaddr_event(netdev, event, &netaddr, ifa->prefix_len);
  1065	}
  1066	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
