Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91417D2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 02:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770948960; cv=none; b=IWJUcgony1nhMenVFZIDR0FtE51P/9TLx7GqHC5WB/nXD3IAJZXkJpLUrMx7vdQptMZSvM1J0lx2wYvdPNOaw94gO03905v74gd5QrLDPDvPAPJD/4KGNYxcLCW+nmt7jP1RzCk5ODyo/I2DUXj7QcTIxgNxJu5AIt04njKoRP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770948960; c=relaxed/simple;
	bh=n6ODPch9WajSMYJP0Oxh5+ni/vR+Gf0X2ZdeGR3S3nA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mAoGx1Qy1WUkbCV4xOR1/120AWu7U5e0/vgQyd34PJFhjVRZfe4h6KXh1Cryzs89Db8VscODVNCKOxmQ+YePEuSw/1jqzdutg/i1kulsfKQUGSMtkkBOcQQYKgmq2c2k3BjGDSjVDdTSrUX3tLQalT9KsD4GrgueqwPOLJXIBFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSx1gt5u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSx1gt5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770948959; x=1802484959;
  h=date:from:to:cc:subject:message-id;
  bh=n6ODPch9WajSMYJP0Oxh5+ni/vR+Gf0X2ZdeGR3S3nA=;
  b=fSx1gt5uSofy0XGrr9k1ayEYMrS7BENKSEp04qLcxVfDnpVgy4kXmdoI
   pcoJ5yZASDGGiOtdqnaUc9HlS+RAnq57ZCvtDKC6MmruDiEc3pwc3EgJ7
   StJhQu+nGXQfextHvbaw2SQ+2bqDgZkijr6pc8mNL4RKNgHMopsPZSL2h
   vILjMBsfJYAM2Mm4tPLb3iANMKcBTnzruyU+nnzDDFtCXZ52znnlFxG1c
   3evtCzw4wKk9M60SGhP5VwTTZiJUuhsgo3mS+iCxLcRujNxZ4bvDZ1jDZ
   w/ItFucurbc3iUu4vLrnosvgkkaLuuIKVuh4KgIZp8wGRd/4nwlhSmRC1
   A==;
X-CSE-ConnectionGUID: DCdBU3udSIm3smgkCvvguw==
X-CSE-MsgGUID: ywjJzpLaRYGIRWYf2xaUig==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72039462"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72039462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 18:15:59 -0800
X-CSE-ConnectionGUID: KtnzGUohTGmA8xGajQ7Uhg==
X-CSE-MsgGUID: Syb5yLSLSjOPtH7soLe43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="217330197"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2026 18:15:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqiio-00000000uZt-0gMI;
	Fri, 13 Feb 2026 02:15:54 +0000
Date: Fri, 13 Feb 2026 10:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Finn Thain <fthain@linux-m68k.org>
Subject: {standard input}:44576: Error: pcrel offset for branch to
 .LS0066 too far (0x3a)
Message-ID: <202602131056.yW8CcR2i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   582a1ef360a05bff4350bbf6e383f61d26b804f0
commit: 80047d84eed25e9c92cfb9169980a0dfec110246 atomic: add alignment check to instrumented atomic operations
date:   2 weeks ago
config: csky-randconfig-r071-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131056.yW8CcR2i-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131056.yW8CcR2i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131056.yW8CcR2i-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:44576: Error: pcrel offset for branch to .LS0066 too far (0x3a)
--
   {standard input}: Assembler messages:
>> {standard input}:16916: Error: pcrel offset for branch to .LS0027 too far (0x3c)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
