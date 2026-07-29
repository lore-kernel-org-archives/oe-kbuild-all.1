Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4C248F7C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314262; cv=none; b=dZoX357w/M62t5NEFxH+i1uNo/XI0QmNm5oMyCsep6GtO4BCLs8xMe7e/4zQYU6jwdf4GlaGsCNN2sYaCwS+HRTc+TTZ4cih6JrE7lrO+OXnyQS6FsC2C7nWENdK66GwT+qnTnnFJOkz535WXCBakpuJNUlhDPD4BpMRVhkPtNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314262; c=relaxed/simple;
	bh=y9JgoVPzB+RKAkaWQostgN8SjHiWeDEIfBLIpznI1B8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2JS/i+mGkP1wJe6VF/6cvakqtD6ZETferOFBdxSXo4QNcaHDzk2qswllDwC17/qjy73VmWmdC10WIG8D742bylsiY4XLpGApwoduEtpnO6Wr4MUqfmvh8BfonzAtPtE0s6XPXcYztpNgBcdkZjK4Ysgec9+N3QhmmFVKzOzT0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiBBvXWR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiBBvXWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785314261; x=1816850261;
  h=date:from:to:cc:subject:message-id;
  bh=y9JgoVPzB+RKAkaWQostgN8SjHiWeDEIfBLIpznI1B8=;
  b=RiBBvXWR5znKuSsZZiAlSdy3o4auee6KXJt6MLD0rMO+dZSU5EunY8ay
   BoXpGDKMqBh9WTpvlluYBNLanG08TEFCFla7lkVq+AAJSPkHGCVaMdDLW
   ei1SdV8P+PwG2XBv4KrasxJuHoM1K36h5P6IGhvxvgSmj5wKVI9HrDpF4
   K6LnU7j17C+/+T0kwcf6onZjG5p8LwH65oMITurc2sYrn8C4wPN6XZo7u
   xFrWUrjlchB1O4QejiBbxyimIpQIJXbggN49wg5QKGv0KzZFXiY0RrCAZ
   7mW4hmxiAdaplbazsh8wBEifxTtmjCCUiJDVk0QscUVd1csF5KB8GaRZl
   A==;
X-CSE-ConnectionGUID: 4CIYx7w9TD+1veXlQkseRg==
X-CSE-MsgGUID: bJ/B8qxaTq6k91DWiNpSJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85765596"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85765596"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 01:37:40 -0700
X-CSE-ConnectionGUID: JhtP3lRJRSmlCMzNtBK9OA==
X-CSE-MsgGUID: e9xpmLs+TVSsIjKX3YKNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="298168009"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2026 01:37:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wozn2-00000000fCU-3WLs;
	Wed, 29 Jul 2026 08:37:29 +0000
Date: Wed, 29 Jul 2026 16:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v4 1/14]
 drivers/dma-buf/dma-buf-io.c:28:28: sparse: sparse: symbol
 'dma_buf_io_fence_ops' was not declared. Should it be static?
Message-ID: <202607291603.Ful8UFgW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v4
head:   26dcd0ae5c87a3ada5710b14b6894ef343cec6fe
commit: bc20381e8daf85ac58811c344325d8192cde9d1e [1/14] dma-buf: introduce initial file I/O infrastructure
config: m68k-randconfig-r132-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291603.Ful8UFgW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291603.Ful8UFgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291603.Ful8UFgW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf-io.c:28:28: sparse: sparse: symbol 'dma_buf_io_fence_ops' was not declared. Should it be static?

vim +/dma_buf_io_fence_ops +28 drivers/dma-buf/dma-buf-io.c

    27	
  > 28	const struct dma_fence_ops dma_buf_io_fence_ops = {
    29		.get_driver_name = dma_buf_io_fence_drv_name,
    30		.get_timeline_name = dma_buf_io_fence_timeline_name,
    31	};
    32	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
