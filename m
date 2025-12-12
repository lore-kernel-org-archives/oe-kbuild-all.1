Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F8B309F02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765535209; cv=none; b=cVjkJapugUeUrFzNuoNBClOtH1wPHHPZpQJX36m3s57F4GoelnIsLLnmxJCaCQqDR/slJhOgRAWvh1pj8wMxtLElpbcsW234fn/DGXnrQZtSWWAsSxMYkxI62G28QlHDVvNrTVI65r8CtK9Tu1JtxhSfVX1iNO07A8CjDhlgLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765535209; c=relaxed/simple;
	bh=o4hVjsb4FXHoM4pnUcUHSgOUnueDGqJxNqEF+9799/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqCgwafXgaqtgX4e7G9aBT/oY22X6A42ABxERYacx7Ox/+kE6enWbeOZC4EAXoXaOcve3JAtnMx5CyEo6/5Aw3IKN5yosw43ydSl9CPS3k+j4tXNGA/3jflOUZBLNZMrcehS2EfJxA4uqShuLTq++y/nQeFadHEZozQkiCNTMjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5cEZp6g; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5cEZp6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765535207; x=1797071207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4hVjsb4FXHoM4pnUcUHSgOUnueDGqJxNqEF+9799/4=;
  b=H5cEZp6gWRUL7DOXt6OsNEH3t5eRbgMu3XwtyctGUguo8ZpLqiZXY8iP
   W2iij/A7qIt/zozmTknvtiH1awClrUtBknsOL6UeMSYhhOOYlkLaiZnfJ
   2DoFImGfWGsNrLHuUongZ5U4P28qM3wCsyFZtApSzRtcR9awkjVkUp3xK
   YRk3bqZGonwdUJPneU8hDTsUxkRW4KrHO2M3nkHjnjjLySZY6qrjt7Lvl
   Kq1jkvoXwBKiiHTNPjKtgOZKCuchnz8Zk7/Lp1QfPs5980vrwCAklrf+K
   Zem1S6aQn1uE8VSm0PzXz1VHhx/Wvf2+MQwK16OfR6ZLfd8ixzUUdoSkY
   A==;
X-CSE-ConnectionGUID: 8d3fK/ZMQPKS8EoHi6XJsQ==
X-CSE-MsgGUID: uFzx3j+NQQe/Kn629nhL/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78990402"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78990402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:26:47 -0800
X-CSE-ConnectionGUID: iCz7RzadQzevGh2wVU56Tg==
X-CSE-MsgGUID: GY4eYXVRRNSO08I/YVnMqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="228107482"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 02:26:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU0MG-000000005vV-0Qwn;
	Fri, 12 Dec 2025 10:26:44 +0000
Date: Fri, 12 Dec 2025 18:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5]
 drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for
 'wakeup_sources_stats_open'
Message-ID: <202512121822.cMkDdhUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   aede8f2a23afdacd71bb57369610179a20e859a7
commit: 5df128deb8f2e04a46acb77df6aec44b1d343583 [5/5] ANDROID: Allow vendor modules to get wakeup sources data.
config: x86_64-randconfig-013-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121822.cMkDdhUm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121822.cMkDdhUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121822.cMkDdhUm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for 'wakeup_sources_stats_open' [-Wmissing-prototypes]
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/wakeup_sources_stats_open +1219 drivers/base/power/wakeup.c

  1218	
> 1219	int wakeup_sources_stats_open(struct inode *inode, struct file *file)
  1220	{
  1221		return seq_open_private(file, &wakeup_sources_stats_seq_ops, sizeof(int));
  1222	}
  1223	EXPORT_SYMBOL_GPL(wakeup_sources_stats_open);
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
