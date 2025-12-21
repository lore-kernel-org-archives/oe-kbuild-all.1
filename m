Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363A1427A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 00:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766275913; cv=none; b=aI2tctpx28y1MKrGda5oKbFFgMURc0v+e6LlCFRQ4AfGnAc51DeVHeFvS6Xt+gG/vxEptgolJBtXnVlmlF8Rx5g1us+S2f0tV+jDcZo/HfYiXhb0TqGilKCExnGiNrUXEjGBidQvMxxkjj4swUjcevYNK7nADjZAproF/MUjZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766275913; c=relaxed/simple;
	bh=1/yKFxGolvoi6QgV+qBU3p966qzNAae7hpL/VIvskYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bd9GSMuhn+QD6KhT9huvr9otaVJuxRv4aseGJGqdEa4urspZH9Si+liBQYAHHGa0l57qo5//7xXdrep3Un5g32xgEYUPXmKqRobXsZta8xmTNkwC3EJWVq/fkS4t2t+cCy4zR4lPqvDU0wUrCGg8rbVrRen4Mh/0+mcOqHk0Dtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHkIro08; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHkIro08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766275912; x=1797811912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/yKFxGolvoi6QgV+qBU3p966qzNAae7hpL/VIvskYI=;
  b=fHkIro08zOWkQIaY0NQiwMPe0+eRwjycffjwu2mB8/A+7s49puZ+bm6A
   ylgHD76FvL8lRi9Jkysf0lWqS7s4B/LUbq1JlYOnnWZrjmOAImmQIg/6p
   yP5qjCz6/uJ0KRaYx5cM5XLspVUgUHcXHVFyO6XUTE2LVYJheRXA4Ucmq
   GCu9apzUNGe8cBwW529f87nXFPgavmNzN1OfisoVoSBM2XuJKBSYe6Ki6
   uJNjh+RXdYNLCBkqYs9Z0a9C1/v++91PaL/ujli0atB2S+SSEKi00onHP
   EshkmTpnDHKTGQmcuzgv7k2XUqBZZo2K36gutiaPiMic3XxUfNz24IAgy
   Q==;
X-CSE-ConnectionGUID: Uu8lhz+GT1Gp9Aq3GVR0BA==
X-CSE-MsgGUID: W8Nw9114SmqMCq67L8G6dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79643463"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79643463"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 16:11:52 -0800
X-CSE-ConnectionGUID: na3clGN0RiC/O5pxrAjUXA==
X-CSE-MsgGUID: AdKh3Nd0QDuZJJ6ZmXuQZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203660828"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 16:11:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX736-000000004qe-15pW;
	Sun, 21 Dec 2025 00:11:48 +0000
Date: Sun, 21 Dec 2025 01:11:31 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 129/131] Warning: kernel/sys.c:3251 expecting prototype
 for sys_setfsuid(). Prototype was for __sys_setfsuid() instead
Message-ID: <202512210158.yjFmDujD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: d905125c2e0652ca410fcece9b90b862974f9e53 [129/131] kernel/api: add API specification for sys_setfsuid
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512210158.yjFmDujD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210158.yjFmDujD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210158.yjFmDujD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sys.c:1998 expecting prototype for sys_setuid(). Prototype was for __sys_setuid() instead
>> Warning: kernel/sys.c:3251 expecting prototype for sys_setfsuid(). Prototype was for __sys_setfsuid() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
