Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3CC2D611
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713333407; cv=none; b=UWKWWJ72D97e7otfF3E69yp+pFsvtURCamt7uK6lelr41VM6QPAEmQ166QBH4aZHiMlGkq7+LCUjkbhTKwNhpiZSaP+JZoZCb8VJRLNc6EvxvO+uaJTbVAQjnrY2Ch8TfLYgeDoL5cyZMw4QVWUqWAlFbiQQEs+xsAdjqJwkTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713333407; c=relaxed/simple;
	bh=rSbwt7kKoku3pkSigTSwzArDIzyYE/IhFyzDJNG9WZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twPwP1kyofqe+5T/fWEaldkV2lM9ROfAy0fyyoGwuKAQ7ADPA9PZe8U6JurHX19/2vHlwiUQOMFmkfc/rcdIerD+Xvk8E5RTKSpY6+WNLuCziGoSeMtCkqyHp+YAzaFuf6hF7YNkvJIIW24YUdzbCY4b0Ovk/4qqxlZ2303l0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdQgzrk6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdQgzrk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713333405; x=1744869405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rSbwt7kKoku3pkSigTSwzArDIzyYE/IhFyzDJNG9WZs=;
  b=hdQgzrk6su7wYNirF8FQBTGtJVJS0my7P5chO3xFD9ro5Rkn3kC1zCYV
   yK6zdSI9gUgBrnHmgMgCDQK1DnzG38cWNI1Btheffna4UpQs4SMe9lM4h
   ZODkDrFoQewuZ3BVk7ZDTmPXV69yfTUFOJ4XJis4Y/ktRnBclEsaBNo6u
   FHwHuegvNNDdZGF0pgUlWNtSFSkJIQZTvhNd+nbBtZXLCBQ1WKQRWUAvb
   XTad86jgk9uzQOoco4cFYOSWOKR+jtMu8qdRmVmc0wj9Q2oWJB4cSPDuZ
   cEJttmAizR2x4GvzOGPUBEscHg7mqlpS5X3gpyX4SaQSxszW48U3vaKU9
   w==;
X-CSE-ConnectionGUID: EgfSpvc3SxaF3/qRQJQJDQ==
X-CSE-MsgGUID: qw9CPiB/S2iTicMFSLTRbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34195159"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="34195159"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 22:56:45 -0700
X-CSE-ConnectionGUID: yfhC6qnLRQCdyAuUkXoPWQ==
X-CSE-MsgGUID: cvL6yiZRQiKf68A8QQ3cBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="53707780"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2024 22:56:44 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwyHi-0006C2-0K;
	Wed, 17 Apr 2024 05:56:42 +0000
Date: Wed, 17 Apr 2024 13:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 456/460] sort.c:(.text+0xb86): dangerous
 relocation: call8: call target out of range
Message-ID: <202404171354.PvhjFlHl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   7c3356f2aba32597d2b4927b2e237bc980fe3a07
commit: 453a5a8eb61754fa8704bdf75d87c6c852df474c [456/460] eytzinger: Promote to include/linux/
config: xtensa-randconfig-002-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171354.PvhjFlHl-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171354.PvhjFlHl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171354.PvhjFlHl-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: lib/sort.o: in function `eytzinger0_sort_r':
   sort.c:(.text+0x584): multiple definition of `eytzinger0_sort_r'; fs/bcachefs/eytzinger.o:eytzinger.c:(.text+0x244): first defined here
   xtensa-linux-ld: lib/sort.o: in function `eytzinger0_sort':
   sort.c:(.text+0xbb8): multiple definition of `eytzinger0_sort'; fs/bcachefs/eytzinger.o:eytzinger.c:(.text+0x878): first defined here
   lib/sort.o: in function `eytzinger0_sort_r':
>> sort.c:(.text+0xb86): dangerous relocation: call8: call target out of range

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
