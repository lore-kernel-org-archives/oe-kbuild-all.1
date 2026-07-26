Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC062F3C07
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063984; cv=none; b=caRqNoPhlzQ1zisCEdIsJTD5B28p/9EZVVUOV+Sh+5MuqfFnXFJbUrM31FSCvOgogWI/bickWKKbYPg5QQsWHabm0/3Yb70hgn45BrvdzOL4a0z1o5uElGXqtRSXihySz3c82zxbgDIhSYcwx5pcpfUkCS/fgmBtFjHhproRQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063984; c=relaxed/simple;
	bh=bZ+gynTLUvRBjrG31/cEqcde0O9IJZKrfJueBsQhOmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BAfRyQ7AZYk10rWwO272Kna2w9YLZTjyJIIvTMtp22/V4hGM4yTGkLFTvsyoZOGLLApvb3fpzlZTbj93j5LegREGRDmXRxtWSDNrZw0dAveXPfdFfFzKxrPMacNfkaJUcdOs8ib77OQlHdxVUp1YAl1QHc0mFR2xHj9RzbYYTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHNVZSZa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHNVZSZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785063983; x=1816599983;
  h=date:from:to:cc:subject:message-id;
  bh=bZ+gynTLUvRBjrG31/cEqcde0O9IJZKrfJueBsQhOmg=;
  b=XHNVZSZahOEs8GRPWYXtvxQ8WXuZIGqpJ2FbiECKLPYW9dvalnY94BhM
   8XjhQ4v7kOOpN73EoeIjgP1wc91LGO8bPkXNKckCl5783IAi4m/KyUuEg
   x6i0TI7vaHVI4JZSUFqa6b/9p4mIW3Yj63j8u0+qLqcnbRpEZ1H+DVD6h
   S+rbmw4Qepgoxk0nl1jt3Vq3eW/S7xeO4+89mjrsBx2uVq3d/oKW09GiV
   N7fAupYH6M+1l7uMVLlR6VWdxOpvEBFqGRa9Hqlr/o61Ljnie+jZIoHjD
   RoGadTjWU+j6ioHLZbr3hrKUXCZ3nNHuRUObHOOreDwekox2l1s+GXgbr
   Q==;
X-CSE-ConnectionGUID: IIHxV9FNTTSPy1qOM5BF1w==
X-CSE-MsgGUID: NMXClSxGQoe2ezx3AoIzIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96013115"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="96013115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 04:06:23 -0700
X-CSE-ConnectionGUID: GSYua6cORp+0u4kvAHcQwA==
X-CSE-MsgGUID: v8tm11V9Q8uOSvITTkX1ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="254826619"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2026 04:06:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnwgT-00000000cUD-0xBT;
	Sun, 26 Jul 2026 11:06:17 +0000
Date: Sun, 26 Jul 2026 19:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-crc 55/59] sparc64-linux-ld:
 xfs_verify_media.c:undefined reference to `xfs_csum_verify'
Message-ID: <202607261847.NbFoqVhj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-crc
head:   10c7aa6f2c85085eec34737be592d6ae69583782
commit: 8ccb82b663f5424f58c201241853be9e4d75fece [55/59] xfs: verify data checksums during media verification
config: sparc-randconfig-r071-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261847.NbFoqVhj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261847.NbFoqVhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261847.NbFoqVhj-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: fs/xfs/xfs_verify_media.o: in function `xfs_submit_verify_bio_csum':
   xfs_verify_media.c:(.text+0x640): undefined reference to `xfs_rtcsum_read_async'
>> sparc64-linux-ld: xfs_verify_media.c:(.text+0x6c4): undefined reference to `xfs_csum_verify'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
