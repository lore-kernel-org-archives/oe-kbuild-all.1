Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BF14EC52
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717620009; cv=none; b=dmzmfQRZZdS8YENpXkuNrVR15E13N+JwFmXWn4tuhG7c6I4GBmNft9v+LuGtDuiuqqLxcW2Krrz4GN5mfcFk2GoLiy6j4ZfuXcrmT28w591kx0S10QeQy3y9ZjpypIgkYGXnjNzTkJDmzLhBLCFUzMEx96DbWGncRV2Uz2XiCvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717620009; c=relaxed/simple;
	bh=IAz5hNWndKZuuFvG221hpobSIgq7Dy8QGtnLI3nP/6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RrRCXbut47ur5W8MQ/xfSmqFOkShrLgnT73DZeBtNo5DGLv36chRy1I527IugD5b8rjqHf85HKa5QTi77MtCLuDF9EO0tQRq/Ahn1GwpNbeu0B9Ps2c6uxagE0bSjXjXen6Mnjrv33gkM0ZJGC51zn90cJCDjhDA8qyC9X9gg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FId8ay2A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FId8ay2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717620007; x=1749156007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IAz5hNWndKZuuFvG221hpobSIgq7Dy8QGtnLI3nP/6g=;
  b=FId8ay2A9d/17jsrf6c0rERiKz+NaK0ToZre/M5GBrt+CLaWoQYnn6eA
   HnVVcrL8YBRq1ZtM0hA4X7JPrAm/5GL+ixxCcfJK0Rgl8nNLyxZiXC49y
   4sc+ECn6AJ4wYI/yVfFjyWcbc7/4R3pTO2mX+1aMQan4hWKFTirtbsBuk
   5kFSOb3nwOghJBc2npskTmcoZ0qj6qRqoDLqYFb0Iv0X2ObGmnuy21b9f
   K92xN2KHMWYu3QBp+DqYc/SF9iUDmm5i7/axcn1KdveMggS7YOUsRyBPA
   i0GZm0ApeQcpV6g+O/lZTp8x4XfWQdmIax1kJ2xxgfbXKyZix6rABY5BE
   g==;
X-CSE-ConnectionGUID: 6vw1pQ74T8Oq+Fp3GnAohA==
X-CSE-MsgGUID: U9hcPzxkTgCtWKKa81mu2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24887160"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="24887160"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 13:40:07 -0700
X-CSE-ConnectionGUID: ada0nqkkQ0uQWF8i62j37Q==
X-CSE-MsgGUID: wGLocmXwSAefOkSGgDX5UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="42286664"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2024 13:40:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sExQR-0002E2-2Z;
	Wed, 05 Jun 2024 20:40:03 +0000
Date: Thu, 6 Jun 2024 04:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 13/23] zc_rx.c:undefined reference to
 `tcp_recvmsg'
Message-ID: <202406060446.6d7L6GJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   29852d1c1b9a57136f9fcb2c8a2a46ed5e723fe3
commit: bb34a467261478f55af42bf8d18638d67e300b5f [13/23] io_uring: add io_recvzc request
config: i386-buildonly-randconfig-006-20240605 (https://download.01.org/0day-ci/archive/20240606/202406060446.6d7L6GJT-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060446.6d7L6GJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060446.6d7L6GJT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: io_uring/zc_rx.o: in function `io_zcrx_recv':
>> zc_rx.c:(.text+0x10b6): undefined reference to `tcp_recvmsg'
>> ld: zc_rx.c:(.text+0x10fe): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
