Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA782E1C7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 04:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774844008; cv=none; b=mHcUe5tDiH3lBUsV8+Uq73xsn3EfoYWDXfzTKqRg9GF6e6fcIsZoiH2LnOWtz0OyFXy4+19WeRy2uXLupc+n5p3MJlQOJ0kpU7wJF1jKW5LX7t9qtuTLfbWxfhDSYS6sRxmGq37UJrEp7Yl0sq7zoZpuRV4VkXeOaQOGIR8iopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774844008; c=relaxed/simple;
	bh=+m0s1bdX4Ze/Tt5VUO2RIs8aXJsGqD8DokHigurs4MM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YNytjqL7gsevVnKhHtfTuo2Ab6G5cIGt0zKBkJUvWeOAJMByh+BVD6T1Gep1dUGcSeAYS0gXVNSvRdhL/zkUTd7xvHHB/ewWZOa6D7hxNHL1V5sKRYWEXDk/wb6uZUHWwG6TiICN7qGUFko/PZjCB3f8N5PohlO1ygQnGKE08xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrA2CXqO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrA2CXqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774844007; x=1806380007;
  h=date:from:to:cc:subject:message-id;
  bh=+m0s1bdX4Ze/Tt5VUO2RIs8aXJsGqD8DokHigurs4MM=;
  b=TrA2CXqOUMe0oMjI9FSzcUL7LsBP6tK6Qt7hKhBLcQJ1x9zGMEffrU+B
   h5mv8Z74X+N+JHib8fWHSIh/+s5stVBj/M4jRwXgC9gxjb/J6nkUIBpkX
   yLBCVHWLpnxjvlnSg+2bNQUFxLuuuwUPx6fOJKobsRf8m1luigSQIubLl
   gK6yC3qnk9KGckylG0+grZo15f2nQ6YtRStlgYskWgaRG9ktkMT+ywo7u
   EGmEUOqKEfPfKfMs3FcFmmU33eFPmqVL4eGYUso2VfnubnOB3PConQYjC
   A3f+gJaEzw43mIIvjSBM88aFJ+VSAct+0GXd0Zv30w5XGopZL+A0CRTPG
   A==;
X-CSE-ConnectionGUID: uOxvWlHeQFmCdwQtVw3+8A==
X-CSE-MsgGUID: y430SiwKQyC3OoQkPHGwKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79731629"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79731629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 21:13:26 -0700
X-CSE-ConnectionGUID: xIy/Qo+VSQ6jBzC6/ObqRw==
X-CSE-MsgGUID: uDcfWzlaQdi/7AZWAia+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225826370"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Mar 2026 21:13:25 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w740A-000000000eb-2XV4;
	Mon, 30 Mar 2026 04:13:22 +0000
Date: Mon, 30 Mar 2026 12:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 0/4]
 drivers/dma-buf/dma-buf.c:77:5: warning: no previous prototype for function
 'get_dmabuf_debugfs_data'
Message-ID: <202603301215.KjwWRNYH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Oreoluwa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 4e54be02ffdb8819ccb4390b922690c1a9e55ce2 [0/4] ANDROID: dma-buf: Export API to iterate through dmabuf debugfs info
config: i386-buildonly-randconfig-005-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301215.KjwWRNYH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301215.KjwWRNYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301215.KjwWRNYH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:77:5: warning: no previous prototype for function 'get_dmabuf_debugfs_data' [-Wmissing-prototypes]
      77 | int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
         |     ^
   drivers/dma-buf/dma-buf.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
         | ^
         | static 
   1 warning generated.


vim +/get_dmabuf_debugfs_data +77 drivers/dma-buf/dma-buf.c

    66	
    67	static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
    68	{
    69		if (!dmabuf)
    70			return;
    71	
    72		mutex_lock(&debugfs_list_mutex);
    73		list_del(&dmabuf->list_node);
    74		mutex_unlock(&debugfs_list_mutex);
    75	}
    76	#else
  > 77	int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
    78				void *private)
    79	{
    80		return -EINVAL;
    81	}
    82	EXPORT_SYMBOL_NS_GPL(get_dmabuf_debugfs_data, DMA_BUF);
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
