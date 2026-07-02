Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85450317153
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782963083; cv=none; b=aLNjMfbqriY7xrNQ582pf4hA4OdY2gbjcKzdWf8oVhboBWShu2pQ++Q/BAFKqf/WsnhFvvnlUlOZL6HhTdkmANG06AAFNuF3320d2sHI+dnUBENcrHygt9dq+9yJb6doO9fxozDdecQ5gucgt5skdxF6nJ6wzXdWsbUTJnAqfXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782963083; c=relaxed/simple;
	bh=FtCjIFVmxtjabRf2TMaebHzScXKXqRHRdp1NOsgQmKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aOIXqvV9dNgQta+D84mDQtwm5zr7DouZd8FqCK/haR1Z13qJ900aOawUgMDpWVG3Ahf5utNwIiPMilnNFFji0GQjnEWfDvu0cxW4PSJX74OTrHODW2geDLVVoRq+dIAUk2jhR/dVGqw4y0p75YP8aegAUyZM51bLgMAcz2KtDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fox5EUjR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fox5EUjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782963082; x=1814499082;
  h=date:from:to:cc:subject:message-id;
  bh=FtCjIFVmxtjabRf2TMaebHzScXKXqRHRdp1NOsgQmKI=;
  b=fox5EUjRoCYWR2WG9NTaR/OJ2ZhApZ0ODUHh9HkislgrfSpTvXuBpTKX
   uweBxyj982vQySyC12kOlafT4zjG5ovmvgBLD82W7o4OFbzn7QcLirCZ7
   c/iUOH9hcAOXtGVgbjXdvYd/FY0c8v8QX6jR8/vSV18BTB3wmttAgBWR0
   WXDObWUi7GxP9PS8Pf4di275bDpTsl5+ofHlHtbvjVWn+4cVKaAXoU4zN
   wA1X3v1tYdf1J095Z1YU2pabUmM4a7+EehND5zRGxLYkeciyIsfIAm5oe
   UsT4SOGaXM7AL9WLikKRoBRlVo4rsT1UCT2nKJoElf0sgj5lOCqNGKFgY
   w==;
X-CSE-ConnectionGUID: 6o5/Z+cTSMqzaD+iVjYH7g==
X-CSE-MsgGUID: 28J9AqMvSH2gMg1wScpVLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83735676"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83735676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:31:14 -0700
X-CSE-ConnectionGUID: viCvTfSHQ1C3VzEvcW0Tow==
X-CSE-MsgGUID: +O84qAvHRBWoUwgXcP7OPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251010389"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2026 20:31:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf88q-000000009wd-3n8Y;
	Thu, 02 Jul 2026 03:31:08 +0000
Date: Thu, 02 Jul 2026 11:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.3.misc 9/9] Warning:
 fs/gfs2/inode.c:972 Excess function parameter 'excl' description in
 'gfs2_create'
Message-ID: <202607021108.ZTNE6DAq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.3.misc
head:   cfbd57798c634d544659b4f1329b3765e04af5ab
commit: cfbd57798c634d544659b4f1329b3765e04af5ab [9/9] Remove excl arg to ->create inode_operation
config: loongarch-randconfig-r073-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021108.ZTNE6DAq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021108.ZTNE6DAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021108.ZTNE6DAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/gfs2/inode.c:972 Excess function parameter 'excl' description in 'gfs2_create'
>> Warning: fs/gfs2/inode.c:972 Excess function parameter 'excl' description in 'gfs2_create'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
