Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841A238C1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 22:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768688605; cv=none; b=gJAFruAxfEcYF7JklYwGb8qexhib9ghhS7IZMiEL90Jn0COezHA6m9ET+HQBDrSaR4XaMcvxDT84eq0c6IPxPp8tZHay35f30IW5bWI6tw6f8X8cLleVXKj7DHUgZSj0i9WByJ/lEdYNpwiN/RuPus4pbPI0mSulfPeufBmSE1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768688605; c=relaxed/simple;
	bh=fK4i7jLO9Y32rRo3N1HN3W1McBT6cU9ZggUsl2auxc0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XIURCAcj8Bi28Fq4byh8QaydEb8wFnsEdXm1lxUcCVP9KorTU75/yf9uyN4tc1NKZT+cy33BfwyoTrMyCkgJ+xhnXFITFb6nMyVgoPTZdYqrHmQz2PiKsiHmoAiB2PjDfHVl3k+PS7RX1UPHx3ZGR/sirFkPrMNCORda+TgWKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDHovuZ7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDHovuZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768688603; x=1800224603;
  h=date:from:to:cc:subject:message-id;
  bh=fK4i7jLO9Y32rRo3N1HN3W1McBT6cU9ZggUsl2auxc0=;
  b=MDHovuZ7cZRD3WYIbRH2lsP1Fxbr1DfnFP2gkm/Wgdnlrit77WUuJv74
   4kHoZYCrM2yL/0pFixYNA3m4QJLlS2LxyxsdpWxz79JQbnKb2J9zEXZIX
   Ha9SU0CTyUPSO+VGb+HUUdaG727p04aQENS7AdLha4OiQRwTW2E4YkHt1
   sXqiGClG8RoYyxYgdNLEt0JrjZEOF641AhjkFZCy2tKZGyg+S6xBTNRPW
   F7502LoncdDisMU3eHLNv1mAfKNq4ARipijcQugXIr8c6bGOY+vbqJK98
   HisVgty8emTNFOpU80VJ+BYV+OyNFzK7vKuOAZojas+Y5sKMRrrbaPI5R
   A==;
X-CSE-ConnectionGUID: c0xsaTyKSMGpVDnA/mrF0Q==
X-CSE-MsgGUID: wuT/H1ANRcyBKaYoCPEinQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="68969632"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="68969632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 14:23:22 -0800
X-CSE-ConnectionGUID: 4pWvSPrxRhikc4dRcYJAPw==
X-CSE-MsgGUID: knJGADr4SyuXuQQjQsNI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="228492955"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2026 14:23:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhEhS-00000000MIC-1nHp;
	Sat, 17 Jan 2026 22:23:18 +0000
Date: Sun, 18 Jan 2026 06:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:fsverity-cleanups 2/5] ERROR: modpost:
 "fsverity_lookup_info" [fs/ext4/ext4.ko] undefined!
Message-ID: <202601180638.7M4d1Vhw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git fsverity-cleanups
head:   4fc6474efca67b36e67c3b1cfad4b7b85dec83e8
commit: 6c09b70b12dd46653f2bd37664ffcf2961cd4120 [2/5] fsverity: use a hashtable to find the fsverity_info
config: x86_64-buildonly-randconfig-006-20260117 (https://download.01.org/0day-ci/archive/20260118/202601180638.7M4d1Vhw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180638.7M4d1Vhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180638.7M4d1Vhw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fsverity_lookup_info" [fs/ext4/ext4.ko] undefined!
>> ERROR: modpost: "fsverity_lookup_info" [fs/btrfs/btrfs.ko] undefined!
>> ERROR: modpost: "fsverity_lookup_info" [fs/f2fs/f2fs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
