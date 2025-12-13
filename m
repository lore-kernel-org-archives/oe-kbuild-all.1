Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7114E482EB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765604947; cv=none; b=t6FfLASuD41II7dBQxUI4NLVHFi6LEiR5UJ2Ch0vNeH4BObViZ8QTSkrVUuTS3GXMsnxNnjMJiH2krFRpb2Y3mAMCQkzPggJXEa5TQyQChpnvS+O8u5GLbO7zAJ5FBgUeFYAViMhoAd+hCaEnu3YPg6OpSGuioQcbI5hRRB+b1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765604947; c=relaxed/simple;
	bh=BdzsWj1peuyFYt92vkkjDBdZS2epOWn6H6FHuPh8T0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPusX7ng2JxTD4hD5oVhpdMq4SdYrbfh0WnRyWwPW06mazJJgq06xk9+q6TeDL470Nl98+S+RM34oYMNeEnbqrannPa6FLOSIo2rg7jttCPCWSr9oA44LJIu9XCjsH1XbVTfHp1sPd8eWisbko7cOmYyZE1PBvOjJlydF9zd81c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koRbyD7r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koRbyD7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765604945; x=1797140945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BdzsWj1peuyFYt92vkkjDBdZS2epOWn6H6FHuPh8T0w=;
  b=koRbyD7rNpz0GpZdCx48CYrlE4cQf/51hN80UWgTK7T8tl4QgMV/55Ti
   eswW1SHUgPQNxYsMBZoRdFRKZeW0w6g10/VMG2J4CE3G6c6BtPxSQy7yB
   9QXslr4N7fhmeT7wrf88zpXqw5G1DyE+RqiZWzCRjwAlRC60ZT5PvzKVt
   rgj/vBce/FRmMcKnYPfTe+XqvWLRxrkcxNZfgFuzxn7XoE4mNtdVO9RRa
   OffzhCDEqtOzzAxcqXIVM4Jhp9AlbXMkNTeixPceDCBUe7ChIPjKgdhAt
   K/jycLNLI+Fgaf23m6OAEZEPT9y6W+VvFhA5MjYzy6GpvxJy3aMHLljDZ
   Q==;
X-CSE-ConnectionGUID: no2sUX2GT3Su9Fi7mVpPsg==
X-CSE-MsgGUID: FWqmcm3cSY2H+ZPD5yoj+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67756966"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67756966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:49:04 -0800
X-CSE-ConnectionGUID: m19rxAxFR0C+9RB6rGspiw==
X-CSE-MsgGUID: iwzJJgHNSx6/QA7oiVpJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197760793"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 21:49:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIV3-0000000077n-1tQL;
	Sat, 13 Dec 2025 05:49:01 +0000
Date: Sat, 13 Dec 2025 13:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] fs/ext4/inode.c:3585:24: sparse:
 sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be
 static?
Message-ID: <202512131322.9GP5gEO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: a38e9381cf2ba6f3300c716b1cff4551bec0fbdf [3541/3541] ext4: implement buffered read iomap path
config: x86_64-randconfig-r134-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131322.9GP5gEO8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131322.9GP5gEO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131322.9GP5gEO8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/inode.c:3585:24: sparse: sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be static?

vim +/ext4_iomap_buffered_read_ops +3585 fs/ext4/inode.c

  3584	
> 3585	const struct iomap_ops ext4_iomap_buffered_read_ops = {
  3586		.iomap_begin = ext4_iomap_buffered_io_begin,
  3587	};
  3588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
