Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695537;
	b=XOT4+csb052sXttRsX16cFl/OFqHnbGKnfXelCM2QnLHqMcj7te6wo1RWtNwH+4kUQ8I
	 xnb+JD+2lM27y76Vfo/elhCp48iLlB1A5sywe0XU1M/eY7FVpg8RRNTUgPLzArtbpMihU
	 yVHvm9K6gi9PAJzJtV0g+CG3hiBtlagPAvzu/7/8VnqYUbMzynK2y6eHLDsZHWKMwslCN
	 5a9AXXwhwdhzRFFvPQvEPGtW2OxnnI1QO90xMcp8AjAbVvCmrlW4dsECWV9p2+q8Ouazj
	 pNmnjhjDkYBPqYSJK7nxKzgv6e1aWbJ94NlEPNGrOYIpC0EWXBa8Qi4gsZCq7M6f1Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695537;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=O2JLg4vHW/uDO72xCdO8Hs3Q5MYIGUUT14xKc239JHY=;
	b=GwGghGub96aSWnIZAcJhYDJgJdBVkCWruQcZCoBvU8rbTKyZz5LuRqPLco9iNekZdaRw
	 eFZk0chHA/JGsvkxyr7n3G3OaR0EZ2lYs1P8SZ7lNtj8lkbLgFrs/8bdqm0ivBqF0CC+t
	 nvlaOO9pkpU7tblgx9yO/NU2eLhGbIa35f3cwsjecsuGC52qYyBZbVL7ZhBVZFpT0B21w
	 HHP9sYAhHN6vxjcBchFZvOG+DDTFrLvH2xqOkj2l1acEGd0Hja2zKuXZJk4gdlC407s0d
	 blSUzcBYFRCoP7AYUmAXoUMzkCxhHvqElssX3vJutld7NeKnyauNbcBQ0LbFb2TmfUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcWr0WEm;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED2606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 12:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEED2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcWr0WEm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795695537; x=1827231537;
  h=date:from:to:cc:subject:message-id;
  bh=p5rn2aWcR4krAscA5h1eQfPOxWwqZfQNiCqauNlck3k=;
  b=fcWr0WEmZ9zDNxw59aY06ORRI9CaegxQR0oBz6fzftY4Hubth151MKL7
   vlH8XL1hDqOl82DJbnsk1aqaNrGzxo5RLna99IIpNCp6j/Pt655BGWDwX
   mkVkGGTkW8hqxYk68OgTYu44BEXXSCx9WdxaF6UFS2ZGzM5aVstmUSlFC
   jsf3sDBPjcnfRHVS6LAh34OE4/wZszYkn/ldzpVt2hFajn2d20ybaTT2h
   gYg7Vh0Oa6Q9SiP9wgh0dkKDUE3GzSmsoHxlCipIOp7aL1QrUIm5z+5jO
   5P6ayQ4cgjcyMbe6xFXn/kkCgjqUS7q32bTsWskrC+w7SXapfLxiBVOpj
   Q==;
X-CSE-ConnectionGUID: wr3iVVh4SsmktTako4u2nw==
X-CSE-MsgGUID: YxeoBqJaQOWVTK8jEb0cNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4688860"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4688860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:18:57 -0800
X-CSE-ConnectionGUID: t3/9I/ooSTWSKDHlTbSHXA==
X-CSE-MsgGUID: 8E/bj7BCRbGLE3EZIKWQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12458031"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2026 04:18:55 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWYRA-0000000003K-2GST;
	Thu, 26 Nov 2026 12:18:52 +0000
Date: Thu, 26 Nov 2026 13:18:26 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 1/1]
 mm/gcma_sysfs.c:11:16: sparse: sparse: symbol 'vendor_mm_kobj' was not
 declared. Should it be static?
Message-ID: <20261126130805.sjk5zf1N-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   067fb13199f981ad630ad46001077bb8e721a155
commit: 3f3d84c99a6730553294bbe20941ea977fb9c437 [1/1] ANDROID: mm: add GCMA sysfs stats
config: arm-randconfig-r2302-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126130805.sjk5zf1N-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126130805.sjk5zf1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126130805.sjk5zf1N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gcma_sysfs.c:11:16: sparse: sparse: symbol 'vendor_mm_kobj' was not declared. Should it be static?

vim +/vendor_mm_kobj +11 mm/gcma_sysfs.c

    10	
  > 11	struct kobject *vendor_mm_kobj;
    12	static struct kobject gcma_kobj;
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
