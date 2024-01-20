Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE2EEC8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705733373; cv=none; b=DQRZ0zYZ6Zz5x7xTiJ/ZIfXFV3VwA+WFiAQmtr2jFHS4HM3BMky50Hgk0cQ4pPuICFZN5TCDUgQ4M4nIrqgbgCS1cK0Sk5jUwn02wzugxj7nh7IwumHAAM+0jRTNEDLYCVRYmluRJA1xFoGiKw7xvvAs4jUvmKJgfIkJzyJ2Isg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705733373; c=relaxed/simple;
	bh=MMWwNt5MOxGMXm3FJiYLqSd1Ipcj/z0M/x8jjF8dEQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pO0K9FniBsDUwiDyi6PLFTtEJBakfnru3xc5+6l0U2Kf3Kex+2QXjxNg+uPon3nN0/Z+BR5O3hr08LSax4lOUH8TmBqdeoOOmHWijIlhwCHxQ6mgzcCgyk1GuE2/XHFV4LVjW8TQuofWjJkKdDzsJvkVButQ9oYDhuPL7KUdsIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrFLqAEu; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrFLqAEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705733371; x=1737269371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMWwNt5MOxGMXm3FJiYLqSd1Ipcj/z0M/x8jjF8dEQU=;
  b=nrFLqAEuXKENVdPmb9ALk63lXKWFw18CHUwfmlKpSGfeJOc1m4NO33Hi
   BpniFmDAgDPIB3Q8xn+dof21mHQLCYNnAJQDCBPgIy+IpEodH5l77uNlu
   cp0szifeINKZcNitruKWF5BPnTCPzMWHsIji1QFTBfrHmWpkXuJzoMLTn
   kMuZ4bsiBUOe2Dqssjj3bERUNt6x/10nb90w8uvUSmvU9vAsSzEToFg6p
   J2bifeo1/D+snKcUHwz7UUw1Qq0yNnKLpYDu/bkOEKhePQokDcxsT6vjQ
   zKM+dMBrthSuJynz94gAOMDg4aoA4Dy3C0oh7Fjlw5KUp25L0iaj52nZ8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="391363417"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="391363417"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 22:49:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="838685"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jan 2024 22:49:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR5AV-0004pq-1E;
	Sat, 20 Jan 2024 06:49:27 +0000
Date: Sat, 20 Jan 2024 14:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Fullway Wang <fullwaywang@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.misc 9/10] fs/romfs/storage.c:243:22: error:
 'buflen' undeclared; did you mean 'maxlen'?
Message-ID: <202401201418.VbU1Rgti-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   31081ab305a184c2685e701ee1a8ca33b76bf7eb
commit: 530041d36e377a71958148b25b98ac217ff50419 [9/10] fs: romfs: Fix potential uninitialized memory leak
config: i386-randconfig-014-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201418.VbU1Rgti-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201418.VbU1Rgti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201418.VbU1Rgti-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/romfs/storage.c: In function 'romfs_dev_strnlen':
>> fs/romfs/storage.c:243:22: error: 'buflen' undeclared (first use in this function); did you mean 'maxlen'?
     if (pos >= limit || buflen > limit - pos)
                         ^~~~~~
                         maxlen
   fs/romfs/storage.c:243:22: note: each undeclared identifier is reported only once for each function it appears in


vim +243 fs/romfs/storage.c

   233	
   234	/*
   235	 * determine the length of a string in romfs
   236	 */
   237	ssize_t romfs_dev_strnlen(struct super_block *sb,
   238				  unsigned long pos, size_t maxlen)
   239	{
   240		size_t limit;
   241	
   242		limit = romfs_maxsize(sb);
 > 243		if (pos >= limit || buflen > limit - pos)
   244			return -EIO;
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
