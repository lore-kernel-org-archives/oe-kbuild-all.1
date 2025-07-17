Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789B32FE337
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 17:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752773770; cv=none; b=ggM68hBo1iXTn6EZo/QRgK/dXuHdE9H8tbpMSJ2hNyWSFKKxstzvy03STniofcmkmH5GAbU49o4QPTixmATk4gFI/1wRb/+Q4/UGw2mC+/KkZ+Mq+ETY2zFYQyb7t+mjsib0LlZqZbwd/6G/fmYax0JgOmyMvlvG+L53mdogF7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752773770; c=relaxed/simple;
	bh=Pwwnsf71m7xKM9k5av/y/8fdQy7wEPlCTWyOOjsHWkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iyhDE25SbghKdYxp1WXJlsCMEi5SvhsckhVttzOPDfoZQU2CcaNdB8JfcSCKQF+a/RClXfVcfBoc9wiM9SUS29Nwvm7eqN/XiR7Lu6w3E1h1xTamA6CRxgKn5KR3Rp492n8kHwxHm3kZ5s3GRHGfEDL2LyL5g8POGUI8P/gnPRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwdGDBMx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwdGDBMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752773768; x=1784309768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pwwnsf71m7xKM9k5av/y/8fdQy7wEPlCTWyOOjsHWkQ=;
  b=VwdGDBMxpZZOt4SO1vPdx8mTCmhESCzp3E/HV4wW11btbi/y6qY+dK87
   aEok20nkmNiMXq0S9Z1arIh3HUfECxu6LzHgf/AATs4zwyxTtzmD6a6UL
   VQhJKyz/0spMehnUabgC4zQKKzfd4XR/9w5huGLYsaOr/7SyD7MOyfwyO
   ucRcH13k+yhm01zktBvKJlrrjfL/xag0NEySY3WykMWvbpAxTkOAN0ifV
   PLiiNDEYnrrSa4vEQiPu889E+kvzQ0N1HsErqnTQjOShvQ8zE8RNeN/NT
   eZ6zYUFYs3B3Yi2gH4g6im7ULT2xiMOsZWyvUS0GgkeK5kkW1j+ByX4D8
   w==;
X-CSE-ConnectionGUID: RL03qItmQLes/LsE+4wsfw==
X-CSE-MsgGUID: WOzBgcWsRWSI3N15k78Lkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="80507501"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="80507501"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:36:07 -0700
X-CSE-ConnectionGUID: kdyzYw3jSkynZqDuMQpQKg==
X-CSE-MsgGUID: /ZECJz9jQ2aYvCvIXSlYJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="188835872"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2025 10:36:07 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucSWa-0000kP-20;
	Thu, 17 Jul 2025 17:36:04 +0000
Date: Thu, 17 Jul 2025 19:35:15 +0200
From: kernel test robot <lkp@intel.com>
To: Jann Horn <jannh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 10146/10823] Warning: fs/eventpoll.c:2198
 function parameter 'ep' not described in 'ep_get_upwards_depth_proc'
Message-ID: <202507171958.aMcW08Cn-lkp@intel.com>
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
commit: f2e467a48287c868818085aa35389a224d226732 [10146/10823] eventpoll: Fix semi-unbounded recursion
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250717/202507171958.aMcW08Cn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171958.aMcW08Cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171958.aMcW08Cn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/eventpoll.c:2198 function parameter 'ep' not described in 'ep_get_upwards_depth_proc'
>> Warning: fs/eventpoll.c:2198 function parameter 'depth' not described in 'ep_get_upwards_depth_proc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
