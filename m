Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D5AD51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742056672; cv=none; b=aO8RMaU9dKqHQ3jk1KG1qA9DW/4b8Z+EXEuW487XNjc5uuABrd7ZuPMnECUZQGNypfXy4Oa03YVxJfjXnEeXI9aKZObtYd08YbDitZaDiw4/JOX/waLl1eP7/RqN8no0Ddt7g6o/t17y/kEMFYtsR/lP8mKRDyojUxM2uLf+AiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742056672; c=relaxed/simple;
	bh=RvjCFKm1WfQjV4+2Xm2HQCzNiVNcfj7UPvZej/UgVZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNeb/DaEMYLBTPtv0kXCoRV2BgH7124K/qDS5QCNNjkt/FczsvG5Ib+IYoSfTezEXgEgqbQZXKnHWPF913Te3WQ33T+DmzeYqUEgD5ZICgFfIhUqqxa2mpQKOJOYVOljx+O4A+4OXQnaO1g0vM1eALvbPuCkDHv4Rvv2zDyG2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoFYN4m8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoFYN4m8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742056670; x=1773592670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RvjCFKm1WfQjV4+2Xm2HQCzNiVNcfj7UPvZej/UgVZ4=;
  b=XoFYN4m8pJ7EV3TQmQ45Z+G8XuH8vBpksDvt6I6Oe8rl1G1BaktSDTcr
   WB93n1972EOdIIDA607foZCLxqddZVPtJXAAXYSMMJfp0iBMLDHH3u9oB
   SRlJ1tPiAm7IpOc6ZqQAHLjSaHopyM/rBJa86mLQVWqd+rP1kALEY8wYX
   ypsPEyWCwDqMszz9SaU9msDHOScmCvLNVxOYJjgdlXVqRIoFGvxI70ppp
   Tslq+UqHt1BATpEqZFzmJVx0TMVXLTonLRttLGt+9/b97EYSI5suc3TnG
   JzfWxfCgFbnf4Mfo0cDzMydhI+X61BMuwzChJ/cNy2mkn//yaZeOoohq0
   g==;
X-CSE-ConnectionGUID: uIX6j9NTQ5OGTCxR3/mOtA==
X-CSE-MsgGUID: NaCCWpcsTGm+8XH3ZTRksw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43229157"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43229157"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 09:37:49 -0700
X-CSE-ConnectionGUID: mK13j/0EQt++7FaqK63pmA==
X-CSE-MsgGUID: vlBXJK0kQSqSH0fOS8JZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121494913"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Mar 2025 09:37:47 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttUW9-000BTT-1f;
	Sat, 15 Mar 2025 16:37:45 +0000
Date: Sun, 16 Mar 2025 00:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [btrfs:pr/1157 153/155] ERROR: modpost: "__udivdi3"
 [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202503160031.DREliXmv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   ba17f60c94e718376b5573cced1493563b1d4300
commit: 49c863d9d6690e1ba2ffa093994e03a0cefd50ad [153/155] btrfs: prepare extent_io.c for future large folio support
config: powerpc-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250316/202503160031.DREliXmv-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160031.DREliXmv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160031.DREliXmv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
