Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA71E5B71
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814349; cv=none; b=s8GFlMUduooE4+vmFK1zVBjOKfj0SnWQ2KHUppUF0M5h/UUjL8z2MsuZ+QUjlPCEEZQCBgu5bvRVefNRqNtHxhKSrlmklKOjYDLntmHXqsIvc6SQSXowNZosSFJ5DZ9a+qxCGNi0OMzSk2LYnC8yfl5HXV3zwyZ8sbcHr66t0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814349; c=relaxed/simple;
	bh=pQx8STeWCq9FDvENrff8bJF4x56thkU+PsTvtc3oVgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RD7gw+TpQuf9a9fvgZJl3AVimaHZt+vvqhqj1rAX7b+EJzjTDxMFT41De62mQtPQGQs4E/BADXN65u5/Xs+DRIqqk+QI4x9FrIAYkMMZQYgMRXWNvlpHwSCi5htNSLyBbRuqNaRItnLzvdtXAvwHWriMOylL/vy/8IUBt7Zn6T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDJf/L9m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDJf/L9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756814347; x=1788350347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQx8STeWCq9FDvENrff8bJF4x56thkU+PsTvtc3oVgY=;
  b=GDJf/L9mHsxdyu2SusAKGyBWse91r5Pwzpr/nrUqBxAItkDDPX5H7ZWB
   RPWfU08e5LikDv+X/tljtzObQJI9A/N7FE9SYxlCRU2AmwJ22fiCX9Sz6
   +qdM0rO17s3N55QqP1iI3WMPbdq02LSWeo1wLgaUlWDsBzEwlw25rXvN9
   lbA0R1WUDVpr8JT4l4nGWvlYML8k3uP1xaGPqhpCLf8PLB4khdrd/5+Yv
   3Ff5fS+tc6ojNvw2V931LHW/7XS30HydHFHVlt1QeFQuny9TlsOkDfUQ9
   VcX5GujAXqPGwzW31dMooV3QIozN5u//DFVcHN6ZUURfz6fPcXEyGgOaA
   g==;
X-CSE-ConnectionGUID: oI/NIE02T7m3Tehfxv1w+Q==
X-CSE-MsgGUID: oSwIPufsTIqI3RpLdJAXew==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58939859"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58939859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 04:59:06 -0700
X-CSE-ConnectionGUID: 4aFLjVMaRcuAU30m8/CxJg==
X-CSE-MsgGUID: CM0vACudTxG9QdCqQVNS7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="194896899"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2025 04:59:05 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utPfD-0001vd-0U;
	Tue, 02 Sep 2025 11:59:03 +0000
Date: Tue, 2 Sep 2025 19:57:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:btrfs-pi 23/23] ERROR: modpost:
 "fs_bio_integrity_generate" [fs/btrfs/btrfs.ko] undefined!
Message-ID: <202509021953.msuLyzbE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git btrfs-pi
head:   c965f607deb9e9de7c17c458278311e2fcfba5c8
commit: c965f607deb9e9de7c17c458278311e2fcfba5c8 [23/23] btrfs: wire-up generation and verification of PI in Btrfs
config: i386-buildonly-randconfig-002-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021953.msuLyzbE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021953.msuLyzbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021953.msuLyzbE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fs_bio_integrity_generate" [fs/btrfs/btrfs.ko] undefined!
>> ERROR: modpost: "fs_bio_integrity_alloc" [fs/btrfs/btrfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
