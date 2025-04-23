Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD082D98
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745440970; cv=none; b=d5eWPAhvgwkJGtogP1SnBayiFdjjfFle4Ya7llQgE6sP5HEtcBJqOtsSRaJL6gMsbLCKlYXTECb1pLB7N2zFz4hnzD8ovjkNGjnKNOPVwl5DyEtE1vdLI5dP5tsd3ipVo3fyJsZr7CcdmoKZ3OQjxt5w4lS3SM34ReQHhScqpP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745440970; c=relaxed/simple;
	bh=omLNYKGkERpx9N90OywdIIrpDhhZI5iEAfncMzSgUAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYa3l4XYYGvY89lR0oVGepgJr/ocW81+4+0wTeDnNWCd4dq3aON72IrD1hhf2iER5ghkF0be41kDLWNDORUZBokfnPS2KQc28gIkMdricy2dvkKA6upp8fOGDXEX8oLFjr74afMhLNrL2Cc/QrPmrWe+sD7V31NKqbHMv3hl8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0+x/mDx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0+x/mDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745440968; x=1776976968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omLNYKGkERpx9N90OywdIIrpDhhZI5iEAfncMzSgUAM=;
  b=C0+x/mDxjZ4SwWjpF85RA5yJ/9gFI6erSwcNCdH5kbqS1KhRiX/f4TFW
   v1T/Kjknn8B+uAl2hQ4Vk2dXK+wl/XWJ0GyC0dOXGNpbKdMBLfTpi3oMW
   widdGAxRpgmH98HxTH8N1yYgZmItwwUpxDhmZ+IkGE+mnjpndAgBc7tUn
   2g2aZs+XtmGu+HWdbQHrug7Q7IfITm4IHvvDVR6DomcoyJwoGC794ePMF
   0ad4ZLIj4lrW1sS8fPEPHheG7BUSCLg4fyU2mNrI3v3GQoTVgueh0N0lD
   D2n8m1h2LdkRR05p/4/vDzuS4Qqz8+326sIWebJwjfLTY5pQU9V+/VSRk
   Q==;
X-CSE-ConnectionGUID: lMWo68NQTdSFoq4RGd229g==
X-CSE-MsgGUID: kMIo0hMYTyGfHQHBqdMSJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64579486"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="64579486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 13:42:46 -0700
X-CSE-ConnectionGUID: NwRAXzAfTx2QgUBTwhPKEg==
X-CSE-MsgGUID: UV8yiwFhRWmuORrXHecV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="133308538"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2025 13:42:45 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7gvb-0003cJ-1a;
	Wed, 23 Apr 2025 20:42:43 +0000
Date: Thu, 24 Apr 2025 04:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 6/6]
 drivers/dma-buf/dma-buf.c:77:5: warning: no previous prototype for function
 'get_dmabuf_debugfs_data'
Message-ID: <202504240432.94lOZTtN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2702b613398960226fb5496ee2b48f631186f8f1
commit: 4e54be02ffdb8819ccb4390b922690c1a9e55ce2 [6/6] ANDROID: dma-buf: Export API to iterate through dmabuf debugfs info
config: arm-imx_v4_v5_defconfig (https://download.01.org/0day-ci/archive/20250424/202504240432.94lOZTtN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240432.94lOZTtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240432.94lOZTtN-lkp@intel.com/

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
