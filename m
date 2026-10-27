Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087010;
	b=4U6bFgAjdrODmqeHnFzXuVyxLMinP9bZiYvvvjM1c0NwbgasuaTx8wKpH4VniIhyWqpX
	 KEtjfZHKUdmGXT96fAIqIcQhF6T7lnXlUhr0bCpsQ0dY9538xuedvyczyahskKmzICA7G
	 /F+1+zVyEifNyK6G8DPC4rMQ/bNQ4SiR1q1tBgUkUsKr5quWmhFba3sNXJSA+8PY6Iwce
	 nAHcEM+4h7aZ3FFLgdvQiRDm8JNqI1prF09dQJj039xp7nHNpWGSJbtKI6frBZWne1AM8
	 0ja2CfCeVYNhU1T5K0ewpZb9Z5ZME1aQ0nxQAc3eP0wGzwEnZg3kryHRp056J7NT9AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087010;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wrR1nw9ZSAfCM46kLfzstUthdz8ToiY00V3EKohgKmk=;
	b=jjSCg1uKbHsgx+vPksHuFwnZUmwqaGd1OBQT7VxfH5Ty6AE/3s6kQmAqL/Ll/hftGBKe
	 Y1NjF6i92LAAelmmFMNTtYIlb67pj8iCBAcPqemTSBbtsWavZnMY+uxXP9kPVfvxwODMI
	 qH0zRBI4zngNJYtmJGum+2q0jGmvMq/XezzkJUKAO320hT25GCw1HVhlWN9RpqPPGAdr0
	 73g+Lz15kF/1q3VbO/31u+TSMtoYxQBn5v2hSAN7sQJIktXro7AAhUyNAbMr7Y+gW1Ys+
	 e5tmEBl4f2/UlXQnwTMJBEPAO2BTtQM8/1FGItjJdLhg3Poj9bTHxsQ3Z+tl4pgHAEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g97eNHFP;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22710606A31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 07:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22710606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g97eNHFP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793087009; x=1824623009;
  h=date:from:to:cc:subject:message-id;
  bh=WVILcqWre1UL4cjVKqra3+HCMBiGwafUNKTPZBWwr+E=;
  b=g97eNHFPt1KSN4u4fHSAvLf5ET7NCyd0/rcEcPfz/0n+TtTd9BHJ8WEN
   7nHQA2s48ufal7oJXHj6lGHZdRoUsJkaTh//WeaUA4vZCQ2f+DoSjXPNv
   gSgIjT2XPpN0n0YPIsDTLDwBfXJTEEXmbMmj1xZ8OhyQgbCAv5VLx9A+K
   aNhfGLbXCzoWTGGv4Gb5abzTL4uMtfgQ8Q5qurLBRDf7OnKoqrGOzQgzV
   kwIO5JDMlMkE1ipuwnI8K/nyXuaDGPhKNVKt+Dylxkjhc/KbcJLJ9oU6j
   ta8G+GCk/+BULeUU67CoRIj8oVySh5iJAYHiyPn7sYDeImWhqBS/JhqdL
   A==;
X-CSE-ConnectionGUID: rsdPHelPQjaEORAogRZXFw==
X-CSE-MsgGUID: NRT0DRWZTySyrwCvWhrohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1811642"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1811642"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:43:29 -0700
X-CSE-ConnectionGUID: 6Sn0Zq7aRq+OcCyecURvCg==
X-CSE-MsgGUID: 8t1z9WXsQEWa83oBGShqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4565603"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2026 00:43:28 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLbq8-000000004R1-0GoK;
	Tue, 27 Oct 2026 07:43:24 +0000
Date: Tue, 27 Oct 2026 08:43:12 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 drivers/remoteproc/remoteproc_coredump.c:169:33: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202610270855.RBMpV3De-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 0cf9435352d4caac1aa224ddfac371ba40a62ea4 [1/1] BACKPORT: FROMGIT: remoteproc: add is_iomem to da_to_va
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261027/202610270855.RBMpV3De-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270855.RBMpV3De-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610270855.RBMpV3De-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_coredump.c:169:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void *[assigned] ptr @@
   drivers/remoteproc/remoteproc_coredump.c:169:33: sparse:     expected void const volatile [noderef] __iomem *
   drivers/remoteproc/remoteproc_coredump.c:169:33: sparse:     got void *[assigned] ptr

vim +169 drivers/remoteproc/remoteproc_coredump.c

   150	
   151	static void rproc_copy_segment(struct rproc *rproc, void *dest,
   152				       struct rproc_dump_segment *segment,
   153				       size_t offset, size_t size)
   154	{
   155		void *ptr;
   156		bool is_iomem;
   157	
   158		if (segment->dump) {
   159			segment->dump(rproc, segment, dest, offset, size);
   160		} else {
   161			ptr = rproc_da_to_va(rproc, segment->da + offset, size, &is_iomem);
   162			if (!ptr) {
   163				dev_err(&rproc->dev,
   164					"invalid copy request for segment %pad with offset %zu and size %zu)\n",
   165					&segment->da, offset, size);
   166				memset(dest, 0xff, size);
   167			} else {
   168				if (is_iomem)
 > 169					memcpy_fromio(dest, ptr, size);
   170				else
   171					memcpy(dest, ptr, size);
   172			}
   173		}
   174	}
   175	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
