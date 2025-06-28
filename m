Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D321991BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751107716; cv=none; b=KxyZobU+kNs40s//Bbvsjw2eDB9pr88mxH/7h04RHEdhyVkGE4jH1GuKi7Quj317BEY6LKARjeOQp8M/1Fo+blpAiH6dYXWm90II0mezuBUQKHT+sVLkHouJd0ylt0NVlG2TSDKquaGkcfEvP9y9kPlB1IhTh7cNj11RHFJQjZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751107716; c=relaxed/simple;
	bh=oDKA/LCiwvAVCqHhpnKeMHCfJ9lFhel/gkTUf3q43SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdJ7SAgs554Ie99UwME7SIlSpZGUsSgXNMHjuRoCSkESG3QkCXTbMOqlcEJD4ub6DfpxH023fagOALz5nSwlrsKpc5G+UGm3QisUbISExLou0CFphntq5PHS/uLmY26a9xwL5kawtMQX6H92tEQGiMOhXJX10YhcZCxt9xN2XZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fqq/r97w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fqq/r97w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751107714; x=1782643714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDKA/LCiwvAVCqHhpnKeMHCfJ9lFhel/gkTUf3q43SM=;
  b=Fqq/r97w4EKUsD0kw+N3Jo26OflwyGrhmNLGiVVBHwsgKgnQhQz+hzBh
   wuirrppLZyRl5KAHjGYT5IGmAnVbJcde6xqwRTJuChq72PMsbVrHBi8MY
   hMCsACkxtvCaH4DxLV9Sn5WQYWKQBqUhfplozh4Dfwm6AOU2thCT9AZ8z
   blkolCDcjXjQxFPVaLZeXfbaOIIzsD2MMJEA6kuGOD/Y1r0kav7VdOUmF
   9tS+w35PY5k4OOXb3uNzvdepSfjJqZEVPayVXd6WhHjpAdqZLbjG3+oyw
   0OTuRB7gyir8K2OzGyA9eoNSUyG35wTTl/8mi/fQ8gzh+tssqChDQ2YQa
   Q==;
X-CSE-ConnectionGUID: WJfj8aWbT1CO359cpQswoA==
X-CSE-MsgGUID: i9lj+rsES2qJuLlxaTw01g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57207384"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="57207384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 03:48:34 -0700
X-CSE-ConnectionGUID: HVMRBn2XS5uLwy7m46EM8A==
X-CSE-MsgGUID: y2DSLV0SRkGjtz8kW4BmLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="176693841"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jun 2025 03:48:33 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVT6k-0000kd-1i;
	Sat, 28 Jun 2025 10:48:30 +0000
Date: Sat, 28 Jun 2025 12:48:03 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1] Warning:
 drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in
 'dma_heap'
Message-ID: <202506281249.lNqpCOic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   f9bc8b4ac2856e2ff487b62e9a5aa578644447e3
commit: a5f9b0171db0c1e78d2c8da744f82ee20b2064fb [1/1] Merge 3e443d167327 ("Merge tag 'docs-6.16' of git://git.lwn.net/linux") into android-mainline
config: i386-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250628/202506281249.lNqpCOic-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281249.lNqpCOic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281249.lNqpCOic-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'list' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_cdev' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'refcount' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_dev' not described in 'dma_heap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
