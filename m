Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DDEC4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736210910; cv=none; b=jpODgADc6RywGPxYn4ANk9VOQM53gnedRdwBZE8EEOq+JwFcZmLBoC+mZaR0dUZWoq1hvUVuT9l5gZAbxrSU5Di4C6oHDkBdBfcqN4UveqjManQXRQTCDD7t5oz5+BLmbht7pcBf2s1egKt8ID7vt2AJbeQEl/Qi6GLevLp42dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736210910; c=relaxed/simple;
	bh=q+jfq9BP8OOatQ+HKPP2LddMRLy/IJWfygIk+WVMaHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKFMJ+i6LCvylAVlqbd5ir++Z5fEYUVC0JYy6P2DIWIgUIGcXJqiInQVuv4zXhXPAZweTiUlTMdKaJKguMQB6Tkv1cdEF+1DIUAIcgXcLdn9pxwBkyiIXtQR8pC44H/uvNAbr9nWeVIFSuKYMs5B/QXztuFXz2jZml3SanPl1V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3n9CPj7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3n9CPj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736210909; x=1767746909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q+jfq9BP8OOatQ+HKPP2LddMRLy/IJWfygIk+WVMaHU=;
  b=i3n9CPj7+yD7DV9lcdE/xCcLrbpLlsl4+ad2bzXRQiR+8FBY87LZMNgP
   ANivAX5pp95bCv6K2JdIOs8Zx9R/RC9kGQ4ULpG1QHjqW6dof0Bp4W32Z
   ewlIUbEn8hHPaEL7G4FC5p3NpACSV6eymPXg3vrAtBV52TY9rk2lDGGyK
   3//Cc/JL2arOn4f8LMh217LSkAQDf54qtFId3sTLRZEYtt1u8DkHgSRGu
   w33byhv7fdzGUVSchwYkAC2aw9d9Z2Dv49QBmHKga0izKJooAaEuJU1lK
   d26gPqeOxnU0jkIU08CzxSd0/m3AygdWhffZlRvpMAuBF7wmRzQnfFmYd
   Q==;
X-CSE-ConnectionGUID: 7IhjTssyRTeNzEwwTkeoUA==
X-CSE-MsgGUID: 3OkhSc6qQ7u0gMr1w7vh/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35675691"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35675691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 16:48:27 -0800
X-CSE-ConnectionGUID: C10zMaSQSkiKMCixtnj61w==
X-CSE-MsgGUID: tGRW0p6oTCmV6A8j/E2AKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139956543"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Jan 2025 16:48:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUxlf-000E4V-1f;
	Tue, 07 Jan 2025 00:48:23 +0000
Date: Tue, 7 Jan 2025 08:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347]
 drivers/dma-buf/dma-buf.c:1487:52: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202501070804.MVtx3ITp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 9864ad538f275d7ca2aff5cc271460d6aeae66a8 [1347/1347] dmabuf: add ioctl that binds dmabuf pagepool to a netdevice
config: arm64-randconfig-r133-20250107 (https://download.01.org/0day-ci/archive/20250107/202501070804.MVtx3ITp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250107/202501070804.MVtx3ITp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070804.MVtx3ITp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf.c:1487:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *input_ptr @@
   drivers/dma-buf/dma-buf.c:1487:52: sparse:     expected void const [noderef] __user *from
   drivers/dma-buf/dma-buf.c:1487:52: sparse:     got void *input_ptr

vim +1487 drivers/dma-buf/dma-buf.c

  1478	
  1479	static long dma_buf_pages_ioctl(struct file *file, unsigned int op,
  1480					unsigned long arg)
  1481	{
  1482		struct dma_buf_pages_bind_rx_queue bind_rx_queue;
  1483		void *input_ptr = (void *)arg;
  1484	
  1485		switch (op) {
  1486		case DMA_BUF_PAGES_BIND_RX:
> 1487			if (copy_from_user(&bind_rx_queue, input_ptr,
  1488					   sizeof(bind_rx_queue)))
  1489				return -EFAULT;
  1490			return dma_buf_pages_bind_rx_queue(file, &bind_rx_queue);
  1491		default:
  1492			return -EINVAL;
  1493		}
  1494	}
  1495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
