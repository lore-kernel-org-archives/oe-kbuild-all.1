Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA72DC779
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 03:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983915; cv=none; b=LpWLYD1381kNWCYJByGhRgVhOA9Uvkyl+QcQZZhqeP9JQthq0Oyy+FBw4U2y3hWZQo8zWr9vFmoO47gV1UmxjNP0rGFaOvSBfvj28CssUgkC0nuV5k0K8xRQZucdCp15jEH3Fit26a/BCdsu1EdhXEHnL+H3eUKVNG/b0T29T+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983915; c=relaxed/simple;
	bh=U0XKphbLwsxbwiVOu5WGh68BWyFRnHdJik4IOG8+qrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RjYAgwofpNUV6XRY18YCXbls1r7MU78L3G52Zn2KztaZxBfpx/MNcFBegAMKOxp3p3oEuVxYmsEuJVxdqtZ87SsWj8UJgrRK4ebmVVB/5C4BxNECIhmZnbPm1TPjJtBfnQW4hErop/89QaJjlSYLLePeIiO4aO2gkEomAx5rjkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR8p9hfb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR8p9hfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745983913; x=1777519913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0XKphbLwsxbwiVOu5WGh68BWyFRnHdJik4IOG8+qrU=;
  b=gR8p9hfbO9Kpbmf1RXyQ7lrLXgmkEJgB0q5uTg1kSsnDsa3k8lMxk2XK
   VyxuS3SEIoxB9X9Zs/vJNqKvDInjzbRCKjyPU5TZFxfl3r6hCIEiv/1Yh
   MKnryida8jweqxcd39SO0WEAzqEpjpnHXQnV9Y7Z6TVcx+M7e2SrmpYL9
   krellQon8FWApJu0p1UFhZ23d94W/0/gIrZCOKaFxQPhHlnC+YpRwg8nT
   dwZGsJ93lPYIlMQ/I3gSxDHLqE7D59xbB/XieasHlUH0XDLeVkEqdSzj0
   XoHhBF/aDvLe5GjhaH8akmXbVsXH6AvghRDFhbNaQhsKybO5nsPLZFKea
   Q==;
X-CSE-ConnectionGUID: THfIrXr4RhS/b3Lpd6sVew==
X-CSE-MsgGUID: berZqnd0SlaPfnO4MIo9eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58286732"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58286732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 20:31:52 -0700
X-CSE-ConnectionGUID: w4KGKujwT5GtYIsMflx8Ow==
X-CSE-MsgGUID: SjbNS5dQQA2TGUQum/q/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138016307"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2025 20:31:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9yAn-00038f-28;
	Wed, 30 Apr 2025 03:31:49 +0000
Date: Wed, 30 Apr 2025 11:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot/v6.15-rc3 100/110]
 include/linux/debugfs.h:419:16: error: 'return' with a value, in function
 returning void
Message-ID: <202504301144.q2mG07pA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.15-rc3
head:   2cc3eff27207d40f181a59f04660a1e8e9746ff8
commit: 482d40a25255bb2c3df8cebda0f06cd2af2d4b95 [100/110] debugfs: Add stub to fix the build when debugfs is not enabled
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250430/202504301144.q2mG07pA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301144.q2mG07pA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301144.q2mG07pA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/panic.c:35:
   include/linux/debugfs.h: In function 'debugfs_create_cpumask':
>> include/linux/debugfs.h:419:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
     419 |         return ERR_PTR(-ENODEV);
         |                ^~~~~~~~~~~~~~~~
   include/linux/debugfs.h:416:20: note: declared here
     416 | static inline void debugfs_create_cpumask(const char *name, umode_t mode,
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/return +419 include/linux/debugfs.h

   415	
   416	static inline void debugfs_create_cpumask(const char *name, umode_t mode,
   417						  struct dentry *parent, struct cpumask *value)
   418	{
 > 419		return ERR_PTR(-ENODEV);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
