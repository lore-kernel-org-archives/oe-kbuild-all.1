Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84B40DFB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777681089; cv=none; b=OmkRc+hHOArqVSVj4g9FVKwc1Ha/s2CSMCIH6x7sreuLk2w0D0o+BEeJM6YBG3Byb0Tot8U8j1N2wB5uTYc0M7A5omKRXIzBvnpZkDq84qme6OPfc7T4/1NTuWqVdAbo/BdiASw41FwxSIR2z8sm4GrOq+xkY1onTH8Xm3uYrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777681089; c=relaxed/simple;
	bh=7yY8L2heGICpGoJ0Ees3239CI++/zxv1xI4xkbWdr5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DTZ1JjLeEHL0sTP66eCODlaJz+eP7vSJXUPKpSinGBrNDx9NOn1w1ttvDz+xTgt+OzV2o2zHKXTghwdT8LgDkWNUfDAlWa2HXgMt90yibPjOCiKD1GsHDwOh4uQit2bAbfTEYT4mi2AZ+CGHjHuFz8uK4XZ9VybV7GFJcqHcqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=el5uzQF+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="el5uzQF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777681087; x=1809217087;
  h=date:from:to:cc:subject:message-id;
  bh=7yY8L2heGICpGoJ0Ees3239CI++/zxv1xI4xkbWdr5Y=;
  b=el5uzQF+k8DRE1tPpZPK7Dt0nUUVQkT+doDTTCaMI8wW9S06+eo+NIs0
   +n0/yDjdFqcut0tqxj8pJgq5hJAyZaEa7PimvaRjW0vfGcdvrCtydmGBz
   MIuoymCosWHY5YtRvjl7tRAehBFJGfihHiiARpDfph3mtg96SYDmHDLiH
   Fal3reWuk1lUgqLLW5P8RWERIXaZXt1a+7EeYhNilDI+9jMxZ0jv+eRKR
   C8jv3/OTRPRgi/M/Xg8VowGIUIc3/8WJOAkdd6iY0uNCXP4ZFKgOn+b2N
   Af5daQOw+7/PUXndhdjyAEAIPpegpPYoXp9Azjndqb42npcwB7WUuMCsB
   A==;
X-CSE-ConnectionGUID: vdHlOMNjSn6iULbuFNGwfA==
X-CSE-MsgGUID: hN3UQ4SVRmimTkOPo8/AWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82493881"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="82493881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 17:18:06 -0700
X-CSE-ConnectionGUID: Wqy0E7N0QFupz2sQ7kX9cw==
X-CSE-MsgGUID: B6oPrjUFQ7mh5m/t3wS9RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="258606529"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2026 17:18:05 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIy3W-00000000105-3LJz;
	Sat, 02 May 2026 00:18:02 +0000
Date: Sat, 02 May 2026 08:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs-7.2.procfs 1/12] fs/proc/generic.c:849:6:
 warning: no previous prototype for 'impl_proc_make_permanent'
Message-ID: <202605020844.35JGSyLg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.2.procfs
head:   16b3565414446449677ec503a8a25d802c7512a7
commit: b26811a2ab5878e84275d8ad8e709bba9147c62c [1/12] proc: allow to mark /proc files permanent outside of fs/proc/
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605020844.35JGSyLg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020844.35JGSyLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020844.35JGSyLg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/generic.c:849:6: warning: no previous prototype for 'impl_proc_make_permanent' [-Wmissing-prototypes]
     849 | void impl_proc_make_permanent(struct proc_dir_entry *pde)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/impl_proc_make_permanent +849 fs/proc/generic.c

   844	
   845	/*
   846	 * Not exported to modules:
   847	 * modules' /proc files aren't permanent because modules aren't permanent.
   848	 */
 > 849	void impl_proc_make_permanent(struct proc_dir_entry *pde)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
