Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30202264C9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767274083; cv=none; b=nBAPGrxB2GhoI+xLQZwN7hhTx+6n/B86/nYZmLLvL2uDqUtIqV3ZOPCKz3WO8C45ePcMTKztzJvPdrClp1I+DcdgMVzWVn7iYSGZ50hhY1ikDmYFdBFQ+O6lhUKKdbaIj5BEZkHRN9zIZw4tjZUAoGFNWapEdsrr+J2miBvfayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767274083; c=relaxed/simple;
	bh=+oE6AvgVD/LuWJHkjiNOsh+3SSCP3GYpc9G1vNLVgns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aKe2lICJe6CTVtIDsUKdpV2RYGMpyvyouoDYDtWw9AH/IGkcMcukr9zdN/G36BVqhs6MkJj5s6tbsOWj5HWjhRSiiZjB2DF6V/5a81BN2spOKkZefK3IS2M5HxvFZpYd1YKXY2G3FOtHHYqcOhxU1lTUvW+GNBPpRb8n6z1IfBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0lluYf0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0lluYf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767274080; x=1798810080;
  h=date:from:to:cc:subject:message-id;
  bh=+oE6AvgVD/LuWJHkjiNOsh+3SSCP3GYpc9G1vNLVgns=;
  b=Z0lluYf0GkX9Z9Hw1nimofeVVsZOL90rQKwdTlTRZHcDhHjvdP5CpaIh
   F5ZSn4IrsbqCA1sgOInEknfzn3mSaW6Gt4hWz4Jva+U1GVp5XbihAGnqW
   VZaq3gdZzfBPYl7lclhHMFF2vBGldkH+PZZuJADSsLgf05qdt6ud8cYtR
   qHA5y2QWC7YSyaKpA91C2fYREaaGuUs17/YX/m8oxpXa+RXUGVD1XgXMZ
   8BSuczVEEO2miCz7lqKeXWpSM/pVD3HoJ+1f5UbJZ9lM8BLr2kO7WTMMc
   NrPWEyD8yrFR9t2o7zmRR2vKFW7KC54mpcqXINyhITFAUGmmKfZAYinJ8
   w==;
X-CSE-ConnectionGUID: DYBjRCMNSGqKs/f2aqHIJw==
X-CSE-MsgGUID: /wRAQfEeSjeyP8yN9wlHUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68791108"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="68791108"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 05:28:00 -0800
X-CSE-ConnectionGUID: tse9UNMpR/W8Bl+obR0z6A==
X-CSE-MsgGUID: BU8/XlJJQrCQl8eNl5RvrQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jan 2026 05:27:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbIib-000000000I9-1hqm;
	Thu, 01 Jan 2026 13:27:57 +0000
Date: Thu, 01 Jan 2026 14:27:40 +0100
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 1503/2671] htmldocs:
 Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202601011410.4vVaIDB9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 977de00dfcf87e8d95f55dfc247955dc2f9da14d [1503/2671] VFS: move dentry_create() from fs/open.c to fs/namei.c
reproduce: (https://download.01.org/0day-ci/archive/20260101/202601011410.4vVaIDB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011410.4vVaIDB9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/dcache.h
   WARNING: No kernel-doc for file ./include/linux/dcache.h
   WARNING: ./fs/inode.c:1607 function parameter 'isnew' not described in 'ilookup5_nowait'
   WARNING: ./fs/namei.c:2853 function parameter 'state' not described in '__start_dirop'
   WARNING: ./fs/namei.c:2853 expecting prototype for start_dirop(). Prototype was for __start_dirop() instead
>> Documentation/filesystems/api-summary:56: ./fs/namei.c:4953: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/filesystems/api-summary:56: ./fs/namei.c:4943: ERROR: Unknown target name: "o". [docutils]
   ERROR: Cannot find file ./include/linux/buffer_head.h
   WARNING: No kernel-doc for file ./include/linux/buffer_head.h
   ERROR: Cannot find file ./include/linux/fscache-cache.h
   WARNING: No kernel-doc for file ./include/linux/fscache-cache.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
