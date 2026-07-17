Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FC3DCDBD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 23:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330030; cv=none; b=RVneBzc0It44/fKQCLK0TkBVtn0sBKJWyAgVfFIq7Hme8VTwmPlv6F8zcnC9Xm1RUc7dXzuC9MFvbdJaochpm7WLQkj1phzccADdyBRZ/3U1tw09wkJ0XrLgQJTfYdPo/c2PudQSdDfzt4a4Rc9e4SuKIoZqLt4ft5KQT1wlcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330030; c=relaxed/simple;
	bh=MLT4YtquiqANk0HrEkQZjhqedHPpptoGH+Ox5y7b7qU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L03h/+n7gb68xH83YCx+VKcqjpP6wPq8PM7hZCygwf2FCBNYKQO0AfXc13LmSVMF6QfkUtZ6dVPnghMuSf779djVqPMIv5HCZnnIfkPasnVOhHjRlhQgWejGqEzvThtR//D8P6pNkUGwm1E+6xsjhMic5zsdDQilNDOX6p7VMfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5d/B5Fp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5d/B5Fp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784330023; x=1815866023;
  h=date:from:to:cc:subject:message-id;
  bh=MLT4YtquiqANk0HrEkQZjhqedHPpptoGH+Ox5y7b7qU=;
  b=S5d/B5FpHTnQ3yZpP+XZr+1Jv9Dc3yOBYhw+mvilgt92i2FZgY/kwV3B
   YqdlQ1D3r5z8cayaFRiOGHZx4ZvUl9ajPsNj6CBMDCwRn5Ade0TRAkkG/
   VHLlgnDzZcR2oWb43uNu6UfbVHkvl4k27+qS1HIg7xYJ6nVvjcRsVsr58
   McHGnFjSH1tW6DZOjcnleUhqSqAlh0WedqmcmTpJQUGNXHFLZhEJTqoDg
   RtUyupPemisM+JfpA/S0wyBDc5W2TGuAEBUOzTwMwbE5vTyDgO0PPMfWw
   IozxXzkatya8muuF4E5vfEdg/GfNSAlFwTgBinvf+24aYCz2YMokWHbYu
   w==;
X-CSE-ConnectionGUID: +xpdoA/ZRZ61jr7em08O4Q==
X-CSE-MsgGUID: 9MtcL91VQ8+1PATg8h0+CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85097944"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85097944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:13:39 -0700
X-CSE-ConnectionGUID: rNb8duvqSm2sQEHf7Spf2g==
X-CSE-MsgGUID: 3RXpRC9mRVuHddzAi/+iLA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2026 16:13:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkrjk-00000000TEM-0Pkz;
	Fri, 17 Jul 2026 23:13:07 +0000
Date: Sat, 18 Jul 2026 07:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 9/51] ioend.c:undefined reference to
 `fs_bio_integrity_generate'
Message-ID: <202607180620.LJWCLk0E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   ef3d55d014b3a800421b9dae3ac182577bfe2bd7
commit: a77902e5f160c28d37d861f2317c8c05d820f471 [9/51] iomap: add a IOMAP_IOEND_INTEGRITY flag
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260718/202607180620.LJWCLk0E-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180620.LJWCLk0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180620.LJWCLk0E-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/iomap/ioend.o: in function `iomap_ioend_writeback_submit':
>> ioend.c:(.text+0x288): undefined reference to `fs_bio_integrity_generate'
>> ioend.c:(.text+0x288): relocation truncated to fit: R_NIOS2_CALL26 against `fs_bio_integrity_generate'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
