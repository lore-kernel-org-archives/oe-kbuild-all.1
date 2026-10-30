Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341649;
	b=SCuSRBtKwcrdsbp0/hAUtxJqXT+/zs+gWaE9mgHeb7WQK4MRh0lA1gFXy1HeZgFno7oo
	 3GmA93lpXQTg4QVp4EqJqSlJ5s3w6YM4foUPcFHyIy28zohWon137VbtVl/Oc50O4ojxp
	 JUH6PKsSA0PUon0U7hWveDZ33dLppWOfcniWi3EVo+mO06D+15SzCGBLBJkZEvQG300KN
	 BoxKhUV5AOC71g8bSdiJa7WuIla1LAyI+OoOIKGQRqZTdjhjjOSNDehk6ib9dCo2OE75K
	 9eriraDWUcd9oQRgOOASn39+qDqCgcK5fSqOxb/2GgWAckE0UwflShgPxxRlRIQ0GPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341649;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SeiH2uO1OvW7cZ+RJoOK5q8UIp8Rkl+rvl/9rYUv9Xs=;
	b=POLvolrLIig00/4dCjdeS+fCTjBunwuhbIO5QJplY3PapPxyKp1fx9iMEPS3VzxbpNVA
	 pG4H7IPplg8dk6D0R6XJvIE3jeWIkbeKfThzBi6R5RFyyUKSpxtj/6xymbr3BxmClktKS
	 VlJFgiN7Ox242HHrx9qMzLEW6WiIW0Ml/48Ly9TEbIl5LBAxzaNFkfOIUhcFuT+IQFcPJ
	 +3tes2Pw8P0milnDVoqXq8+jMu7gDnND/XWlXeqSjmM1KcfCeIUswEfKVw4JIasBSH9lX
	 Kzpfql5XdirADcGGydhvCbTmTmmUQJyk5rEIm5WqAgPGrB2TjpfjKfMnjzSaYmsI+Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="YUB5M3/f";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF40606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 06:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YUB5M3/f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793341649; x=1824877649;
  h=date:from:to:cc:subject:message-id;
  bh=EAMlGtwxW8z4o1DKX4YSIJHN5m/UjJ0o3OpujthaWs4=;
  b=YUB5M3/faJbVda1z8/npmcjwsPoUJBygIi69chmfnkI69T6paxug65pe
   Vs8psr1sUT75zFYj9Zdb+SnFlxz9lQWWxJ+qxe0qvwOwwdHFvQjNAb4q/
   WMn4onUS48v7BWjmXCzJQLzU6+pmXmcE2bpFKNjoNh90/XUdfa293Mf2c
   9gmHApbBuM9+OFAAzSNez69Jeg/VqPKWeWQUO4JLUxLg6ZYI7x/U90X2J
   7gaEQUU+IR/+/Gb6X7I66FPMLGGQxXL6c4snzxxyOgHb/09kUFf377Qdt
   m48bfCNr+Qt1VAukGx118RfpIRyAy5xj8IBdSVDJ1mPggx+unKALA9s/8
   Q==;
X-CSE-ConnectionGUID: 92RcObecRduglmoOKEuqcQ==
X-CSE-MsgGUID: IJL8m/I4Teiu6pU7OglTTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2126898"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2126898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 23:27:28 -0700
X-CSE-ConnectionGUID: 7S6T9Rx7TcGgasuzjS0k+A==
X-CSE-MsgGUID: vqcgIZvIRRipvv8ytSlszw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5478352"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2026 23:27:25 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMg5D-000000005Vf-1O8q;
	Fri, 30 Oct 2026 06:27:23 +0000
Date: Fri, 30 Oct 2026 07:26:55 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 drivers/remoteproc/remoteproc_coredump.c:169:33: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202610300739.EYoukx6C-lkp@intel.com>
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
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261030/202610300739.EYoukx6C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300739.EYoukx6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300739.EYoukx6C-lkp@intel.com/

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
