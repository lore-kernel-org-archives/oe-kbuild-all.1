Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A41C694
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720354915; cv=none; b=ogZU7cLnSK3zq3gpdsehptSaGLKG3vNrzQiIRj39D4ZCLA/FM9iwjEUhJetGVl/x7p1H6W10jU4vFCa9392RTMxb6/kY5lrsecgVDGeE7gn/FvGwE0xxolVjzjTfBgrK055WapTbxqq0FMxZ0I2fzhOYrg7CIB2l5uZYTrHLLv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720354915; c=relaxed/simple;
	bh=rlRbowr1XjndXyw4ijNPDrEPyYtxWyMD/uo6ADmseXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=meeXV/RxG7ye8HZBgsaAkKuI2WaF/6oNLpJba13kuVIF5q+imJd8ETUqVsfnsozDSUs5szlbJ/9YUNqjmmGTQmlNJLDJunzK7kLXN8xu73NHnbi+ocUXGpKB/PcJqmlZdcUKDQ9VvwYvGZkZ3K/MfsH/NUKjQJf23jVk5amHzNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2msCuY2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2msCuY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720354914; x=1751890914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlRbowr1XjndXyw4ijNPDrEPyYtxWyMD/uo6ADmseXM=;
  b=Q2msCuY2l3AZfo6f816Z2mVJ9iPXPcYFHyUogJF6gRtoEpHPODMZ/qtd
   d3acFn7/UvIyvKMrI540qqGqH7V4dO7EH/nCXXWSL8NK4gces37607jj2
   a1c6T3SmyUyM+1jOUFzqIMV9WMkCt3AA6/yYjp3DKrF7txxHL9/Zw3c6I
   r/r8np+tWnLWrh8v8X7ETKIaEGlXQuwYjoJSTH2xGho9YDqxvuPly/JZ+
   541+zTz+1rHCrnA1s53OLOE0ws3BPWjtczjVrU1A046ixSRdyWn9NhnAv
   wAK/CLyfxAZM5081PUXhYeMA+iP6WcMHPYiBEN3ovxaUDGQfzcHnAAkxw
   g==;
X-CSE-ConnectionGUID: n+TP9dAnRFS8CgWvm56w7Q==
X-CSE-MsgGUID: /WtNKsswR4qJ+cOstLd3qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21336166"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="21336166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 05:21:53 -0700
X-CSE-ConnectionGUID: BPgghrIdR/imF6Dceoju3g==
X-CSE-MsgGUID: YdspCJtrTu6we/hO3Hs56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47145811"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2024 05:21:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQQto-000Uvi-3D;
	Sun, 07 Jul 2024 12:21:48 +0000
Date: Sun, 7 Jul 2024 20:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 5/13] inode.c:undefined reference to `__bad_cmpxchg'
Message-ID: <202407072016.4MYfp4Ff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   fa5a1c2afda6cefb7faa1963ddf30a8c33ab43f4
commit: 7ae9113ce4764896d7901a2a9c247234637e6895 [5/13] fs: add infrastructure for multigrain timestamps
config: arm-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240707/202407072016.4MYfp4Ff-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072016.4MYfp4Ff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407072016.4MYfp4Ff-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/inode.o: in function `inode_set_ctime_current':
>> inode.c:(.text+0xba0): undefined reference to `__bad_cmpxchg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
