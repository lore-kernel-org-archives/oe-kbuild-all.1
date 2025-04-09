Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7EA261572
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203239; cv=none; b=pPZtWv7NRmNGtjSN3mSL1EfaLz+NIfVbkBcu3/J6tK1ABc9+MVNbj53XwAKsg1CU9N8Uw+F/1+tQYhXLDS+uxKSIiqj2/Q52RJYi26tkeMMNyhHxhtL7HOuhEnbjJ9Dq6UF5O4Z2/2/MQWMdqq+TkCQdc9HHVmVbdwso7KA50PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203239; c=relaxed/simple;
	bh=wDHM7NU/9+1ltX+M+LIx+YJv8RH6OxvMhNxAdclovls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mug+kiciG4w2AtfQDbD1qKt2DsM3NoGo1097CtjfaRqocDCA1sCxrB20fjbuTAc8KOE/jGmIyklYchZVYsYPuFwUOcwU6GwezNTWOKkK1RA2LuBqlT+sNBpJBKrIuG5GSOwLSVxF7B/40j1w+Gkq+Co6c4XUdORTaoA7mLMMI74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Av39AvcC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Av39AvcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744203238; x=1775739238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDHM7NU/9+1ltX+M+LIx+YJv8RH6OxvMhNxAdclovls=;
  b=Av39AvcCH0q9/3TfYONlM4IcKnbhXVEZ6gj/ou2yyTuAiHaMrmehVZZE
   DLHh3vCh/3XNumZ8rtYt3fVmAj73pegarTLjRSmw2FsiMSZIpfw2+PUU9
   GCz30+bslaMzHT7juYlBpalNDQ2YO6YBfsXTkNKmpSAj+oVZoQdIxZdpS
   kIFrRAdv1tHKIvWWWBr6QX7u2SuOCi7SMpocBDQYI+KiUHU2gxFkDBMyV
   k5IQAR0/MhnWZLQh4wkkaZR+TWq8j1oL/f6Txhu6VhW1XYsATf5FmLi08
   ezIOdwJgx+oF0i5lKYLGqiQxpb5AjukCzoW44csQUG76TChbLWXIwC+VC
   w==;
X-CSE-ConnectionGUID: +LauUg9MRpSLMRktvdBl9g==
X-CSE-MsgGUID: /qyp0QaGQ/mQPbMPWuhluQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="57046447"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="57046447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 05:53:56 -0700
X-CSE-ConnectionGUID: H1ZglmVRQLeWMDNwhEG9Bw==
X-CSE-MsgGUID: JKo6cFEaTGKM4/2F6xdFtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129095066"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 05:53:55 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2UwD-0008rH-1j;
	Wed, 09 Apr 2025 12:53:53 +0000
Date: Wed, 9 Apr 2025 20:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] drivers/dma-buf/dma-buf.c:77:5:
 warning: no previous prototype for 'get_dmabuf_debugfs_data'
Message-ID: <202504092055.LR3JHiqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   06d2d8d2072717071054edabc0f4d8cbc8d1cbb1
commit: 4e54be02ffdb8819ccb4390b922690c1a9e55ce2 [1/1] ANDROID: dma-buf: Export API to iterate through dmabuf debugfs info
config: arm-tegra_defconfig (https://download.01.org/0day-ci/archive/20250409/202504092055.LR3JHiqU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092055.LR3JHiqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092055.LR3JHiqU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:77:5: warning: no previous prototype for 'get_dmabuf_debugfs_data' [-Wmissing-prototypes]
      77 | int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
         |     ^~~~~~~~~~~~~~~~~~~~~~~


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
