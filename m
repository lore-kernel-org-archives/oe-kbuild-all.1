Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E44331200
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904530; cv=none; b=T7hFvmiFJR2BCC7s/b9l4azO/UoURKZFElDP6bbkFvvL9hDuc/d6bWdtbuV6Y1ger/JgAFL3APKvOfJupyCP8qlRhBRFPAgn7fmIP9qKZrQAxURDwFLhGaj1e5Mu1c0/U7H18MeR+ISKmm5+i9MEYZxBjKPp7/YDYT1ccvTEhh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904530; c=relaxed/simple;
	bh=+ncHqqJS7wNteGQxN4Gc5F6WEYT9yPUOA0L1tjf31Cg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JYR9UqFjSKMUQSMDge2nvJUnHhOl1yw1k2MALGtRuzhq9Tae4CEo7JzphSdb4o76LmJMHv/pRTIw9C5Yq/I9pbsRzpAICAmKka2QrYZMDguy68GfKPQZ6ntFCERnPUHYWv5Pd2EVqdeeNWsfSJzM48QdlJ8AqVjedibmqaenJcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAhPTVCz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAhPTVCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790904528; x=1822440528;
  h=date:from:to:cc:subject:message-id;
  bh=+ncHqqJS7wNteGQxN4Gc5F6WEYT9yPUOA0L1tjf31Cg=;
  b=BAhPTVCzUd0d+NraGOtbA43qZrifbNJSgsSKWH2XOYziYBiNP2ii0rrd
   D+owcpz+41kQya7BDsb57Xj0hhiopwFSP7Wk4kTe6F3kELGURnIIsCiNJ
   ZummUHkWyveBcvQeFLI2xm83Ahhh5K+fbbsvXowh360Dbt5raIG8V4HeO
   fETo0oIKGXKElCBGc2gNd1WEUiXKirCO+iz73d6M+qkayq2h3C5UahZJ/
   dh+nGHEUia5JNA+6ly0aP40h+G0gQMvn18u3TMpfGdmdHnutfby+qENn6
   uPOlgbK2sTaFOIiwj20sUjyKQoIlWAs7mvnBi0r4jjOGsKC1chBN3+kLd
   Q==;
X-CSE-ConnectionGUID: Ja1QzngQQPKApdZ21usALw==
X-CSE-MsgGUID: 3A8DGA1ESgqaCyRLg/W01w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102199220"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="102199220"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:28:42 -0700
X-CSE-ConnectionGUID: Bgxxzvb3Sxyt+N9+ScgiHg==
X-CSE-MsgGUID: 562cPe2RSb2LDBODFAnmsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274228293"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 18:28:41 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCS4k-000000000KJ-0x3D;
	Fri, 02 Oct 2026 01:28:38 +0000
Date: Fri, 02 Oct 2026 03:28:11 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 40/49] blk.c:undefined reference to
 `blk_status_to_errno'
Message-ID: <202610020322.yF3RE32U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: be75423b67d512b1abdea0cc7cbef17ffd7e8040 [40/49] bpf: Add block device reads that complete into a coroutine
config: sh-randconfig-2000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020322.yF3RE32U-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020322.yF3RE32U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020322.yF3RE32U-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/bpf/blk.o: in function `bpf_blk_end_io':
>> blk.c:(.text+0x258): undefined reference to `blk_status_to_errno'
>> sh4-linux-ld: blk.c:(.text+0x274): undefined reference to `bio_put'
   sh4-linux-ld: kernel/bpf/blk.o: in function `bpf_blk_open':
>> blk.c:(.text+0x37c): undefined reference to `bdev_file_open_by_dev'
>> sh4-linux-ld: blk.c:(.text+0x384): undefined reference to `file_bdev'
   sh4-linux-ld: kernel/bpf/blk.o: in function `bpf_blk_read_coro':
>> blk.c:(.text+0x6cc): undefined reference to `fs_bio_set'
>> sh4-linux-ld: blk.c:(.text+0x6d0): undefined reference to `bio_alloc_bioset'
>> sh4-linux-ld: blk.c:(.text+0x6e8): undefined reference to `submit_bio'
>> sh4-linux-ld: blk.c:(.text+0x6fc): undefined reference to `bio_add_page'
   sh4-linux-ld: blk.c:(.text+0x77c): undefined reference to `bio_put'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
