Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E02BD038
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836288; cv=none; b=bYcMcv38RWUlA5ChSUkY3da9DcepDe7VqaNCQta4jFSXrZHNtc3O717vPvArIpS4pWtcjIaJLeDGZftSLG7WSQKQEYdrEXZBp7TT3LNHaePfgY/I4m9qLYb0ut5RgLUX7Ejm8G5Gnn4+XIdsepO73sJW50hfH7tCcrlrgmq+mro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836288; c=relaxed/simple;
	bh=rWkOVF/P5Lum1uOKyhInuaCLGAOyCx8ngF+WBJs3k4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZcccjsvIbEl+11Si7hap5fFs4gd2hkin3bjNtJpDWdid0vG1/Ks4xfVczbs1qfAmoOky9xrFPaydHO9o8qXaeWbj5zmWJ6JZ8SCJD3A+tUq/CZq6kYn03S1Tv2h4zo804ng3L2XZ/de8zumavN+0KH7UIkrW4TqP9WCoIV4A2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDaxhDLw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDaxhDLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752836287; x=1784372287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rWkOVF/P5Lum1uOKyhInuaCLGAOyCx8ngF+WBJs3k4o=;
  b=oDaxhDLwk2uJxqT7CdKIHLx/SBH0eq3cn98ielT4bVqNGfXr0nXq8z58
   el/rFRCI8bU48laFQ5l72jOR7Nuru7yQjUKQ5bSXDNaMBcqhvstlz6td6
   AxpwxdKwkmPP0Hog5aO9BV0EUgMfEfu9gBtfZHcxWkhoOm/6qg+5ktSgL
   mAngMp+z1b8o1xIsglYwDfB9kacf4rYB0bDzTgTw9Do6PLBlhsm4l0nOC
   rRicsDeD699uAaFYI/nm6M1zOKZOjfKkms+SIL/kgWXY4i8IMWAgijuI/
   cnSmowPpAseB2/G4Vwn1+XEdt2Ih3wo/RxSjwkoo3yOVazuqUzBXFN9PC
   Q==;
X-CSE-ConnectionGUID: WQ+kbVveTVC2WdGOt7i1/g==
X-CSE-MsgGUID: ppHfAA5DR9mdHLs4Kq63QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58908298"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="58908298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 03:58:06 -0700
X-CSE-ConnectionGUID: EbBOLQhNQFOhtb657pNayg==
X-CSE-MsgGUID: FsS1dgnXQUitJXpCG/4WVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="189015056"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2025 03:58:05 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucimx-0000sb-0i;
	Fri, 18 Jul 2025 10:58:03 +0000
Date: Fri, 18 Jul 2025 12:57:33 +0200
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 9014/10823] Warning:
 drivers/gpu/drm/drm_bridge.c:1241 function parameter 'connector' not
 described in 'drm_bridge_detect'
Message-ID: <202507181219.jtWUsunB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 5d156a9c3d5ea3dbec192121259dee2c2f938fa1 [9014/10823] drm/bridge: Pass down connector to drm bridge detect hook
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250718/202507181219.jtWUsunB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181219.jtWUsunB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181219.jtWUsunB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_bridge.c:1241 function parameter 'connector' not described in 'drm_bridge_detect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
