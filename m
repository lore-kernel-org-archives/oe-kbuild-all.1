Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901712EB5D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754997762; cv=none; b=DQxdzin3Q516y6wzQdZ4ImifrdcqlgY259Iv0EdpRqQ3o8nC/F5bZnsXtz8oZ37ulkF9TMaFgY0JVTf0giDToCmTbVCgUr9hOJBAiZNHmjXSJ8YKmcttFMnnWgmqoCvqQgDLgrMOB1dCGIHCK59J0IcsUWP3u07lST9xNBSYd4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754997762; c=relaxed/simple;
	bh=XbA/AqyXgXyjgrw/SXWZDKMf+TLl7GQQf/RTrfGGGlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FdsBuXHLNKpwObBMqJ3z1PfTbdEF0hJ/EmZWvlPfnMHb7g4NYELJ+6EGXjH8stxrqBBSpjuebdn3YU9lsdmnfZS08486GxgMcEMcaw5Du0M+UuxxId+Y4H9iM2VghEBJG5X+zovhPGsZrviukeHgkk61DrHeeAQd9mVAeTqdteY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLztIlkS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLztIlkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754997760; x=1786533760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XbA/AqyXgXyjgrw/SXWZDKMf+TLl7GQQf/RTrfGGGlo=;
  b=aLztIlkSv+Y3dm4ueRCfIKErUCBzFH1w7FF6aGENiG8kqiUsJtKkiWdx
   qZGC58JQUiuXeCZ+zVnhrNfZdp6idggcGgVu8R6y5BFMnzZ8Vn+duvBPM
   fOuK5cH5+BFKuTHR8FQBnxobE7aZyqLGt8eK57sh/zGX//ufo8FreO+iP
   PwXM4y96+iyh47wHPFoW88clljoWAPn0xPBRxjQcs6dAWibpNOAeVdZjl
   3Fj3Py5pUknpRQaijnLDTL9qvpDewlnf918vIzSOL2bp1wHXg6oNlS3zH
   vLrgPi6LsPUAbFXn7nrCxIVTJcJJnt61L3JjxW0kQaLdFRrz+Pm99PGDO
   g==;
X-CSE-ConnectionGUID: A7dX/9AYT4iZBmh9jwlWRQ==
X-CSE-MsgGUID: gQofjc6oSJuloLKHnGw72A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68724117"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68724117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 04:22:39 -0700
X-CSE-ConnectionGUID: Xdag2dgKQXKGsM79NB0+7Q==
X-CSE-MsgGUID: oTE4Ksz5SByvKgth7V7Flw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="171421142"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2025 04:22:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uln4p-0006iq-2h;
	Tue, 12 Aug 2025 11:22:18 +0000
Date: Tue, 12 Aug 2025 19:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/3] ERROR: modpost:
 vmlinux: local symbol 'set_task_cpu' was exported
Message-ID: <202508121919.IOK6dlpQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   057e7ec2a313d49a0a9835e14a9e1c9c0f7cdb48
commit: c05e84a239bffd0a739f4237a6b6c13c3735252d [0/3] Merge bf76f23aa1c1 ("Merge tag 'sched-core-2025-07-28' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip") into android-mainline
config: x86_64-buildonly-randconfig-002-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121919.IOK6dlpQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121919.IOK6dlpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121919.IOK6dlpQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: local symbol 'set_task_cpu' was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
