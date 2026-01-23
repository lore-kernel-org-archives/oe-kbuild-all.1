Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE42BEC23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169237; cv=none; b=Q6kOQDLi0C0rAmx+pOiC1/kT1rmnqCeNS2kgMIJAmVEpJpvUjHQyEaaryZ4mYoRCFSTzekateIkrvnVBRAKSE44unB0U4LKxnPJoNUakcDPjUtiUeNHvI9W434pUR+oMjYLqAqvnfi+ShQaMo1QnEdmjwWlOX1Q0Y6HhflWVEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169237; c=relaxed/simple;
	bh=KS/M3ZeQL2AT+NuE7h4qQQmAFz1R8+EOMNPkCaQBfqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t88ERyD/URw4+NQzmyCviOHP7497BYkW2n7FCmecx6WJQB7UAkWq/ds767u6xet2iHFUXJRSnPeeWqqUBY7u8JKXSUcJRlzb+UFFiiu5jP7Lc0RS/wBTEZFrxU3uKf+5nNYfhbSKWDHGFYzZ80CK8yYdvtqEvTtx5TCzYwMoUfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQcIlDMA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQcIlDMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769169235; x=1800705235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KS/M3ZeQL2AT+NuE7h4qQQmAFz1R8+EOMNPkCaQBfqw=;
  b=XQcIlDMAbbyUDMI0tbprlfL4PPVncE3v1uWNnUavfLru8U2ev/GKLhAu
   NrbtcwWxQajPabh0hbp7WVc1Qx33mL8kkm/Ivy9PFZ6r5A2V5T53i8IrV
   crMMEDtGKmIip3e/e7ovbkR8RgbP0/KwjVqQEVFe9aDFHOACXScjyS6Rr
   gWysA6uYqEtprU4Ys51rnB1yt5RTSuTd41p3HlHY1kkcNXgxTt3Sy1OB8
   2kOf468bSdxRVv0leKnSOgRd35HiKhLB2Yxzm+xVnySqW0iXVoVELsmPs
   RJ31lxpnRfA4sGS81E6rMmNL80PVFcBC75BHnXCUKNmOAExxEnt18KWcB
   w==;
X-CSE-ConnectionGUID: Jfk5wLu6Q96cOItkVcmvSw==
X-CSE-MsgGUID: rJ1fEeoRR/evG55RQzpIVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="80727741"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="80727741"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:53:54 -0800
X-CSE-ConnectionGUID: FdyXe1pUSRO28pec1anK+w==
X-CSE-MsgGUID: J2gdZ2Y2RqSf9wncS3n1fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="212013287"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Jan 2026 03:53:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjFja-00000000TuQ-2DIW;
	Fri, 23 Jan 2026 11:53:50 +0000
Date: Fri, 23 Jan 2026 19:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 2/4] decoder: Add V4L2 stateless H.264 decoder
 driver
Message-ID: <202601231952.jnd4dEc3-lkp@intel.com>
References: <20260121-b4-s4-vdec-upstream-v3-2-4496aec3d79e@amlogic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-b4-s4-vdec-upstream-v3-2-4496aec3d79e@amlogic.com>

Hi Zhentao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhentao-Guo-via-B4-Relay/media-dt-bindings-Add-Amlogic-V4L2-video-decoder/20260121-185011
base:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
patch link:    https://lore.kernel.org/r/20260121-b4-s4-vdec-upstream-v3-2-4496aec3d79e%40amlogic.com
patch subject: [PATCH RFC v3 2/4] decoder: Add V4L2 stateless H.264 decoder driver
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260123/202601231952.jnd4dEc3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231952.jnd4dEc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231952.jnd4dEc3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/parisc/include/asm/bug.h:97,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/media/v4l2-ctrls.h:12,
                    from include/media/v4l2-h264.h:13,
                    from drivers/media/platform/amlogic/vdec/h264.c:6:
   drivers/media/platform/amlogic/vdec/h264.c: In function 'alloc_colocate_cma':
>> drivers/media/platform/amlogic/vdec/h264.c:649:13: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     649 |             "collated_cma_addr = 0x%llx, one_col_buf_size = %x alloc_size = %x\n",
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:647:9: note: in expansion of macro 'dev_dbg'
     647 |         dev_dbg
         |         ^~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:649:39: note: format string is defined here
     649 |             "collated_cma_addr = 0x%llx, one_col_buf_size = %x alloc_size = %x\n",
         |                                    ~~~^
         |                                       |
         |                                       long long unsigned int
         |                                    %x
   drivers/media/platform/amlogic/vdec/h264.c: In function 'h264_config_decode_spec':
   drivers/media/platform/amlogic/vdec/h264.c:1270:33: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1270 |                                 "config canvas for poc %d canvas %d y_dma_addr 0x%llx c_dma_addr 0x%llx\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:1269:25: note: in expansion of macro 'dev_dbg'
    1269 |                         dev_dbg(&ctx->dev->plat_dev->dev,
         |                         ^~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:1270:85: note: format string is defined here
    1270 |                                 "config canvas for poc %d canvas %d y_dma_addr 0x%llx c_dma_addr 0x%llx\n",
         |                                                                                  ~~~^
         |                                                                                     |
         |                                                                                     long long unsigned int
         |                                                                                  %x
   drivers/media/platform/amlogic/vdec/h264.c:1270:33: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1270 |                                 "config canvas for poc %d canvas %d y_dma_addr 0x%llx c_dma_addr 0x%llx\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:1269:25: note: in expansion of macro 'dev_dbg'
    1269 |                         dev_dbg(&ctx->dev->plat_dev->dev,
         |                         ^~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:1270:103: note: format string is defined here
    1270 |                                 "config canvas for poc %d canvas %d y_dma_addr 0x%llx c_dma_addr 0x%llx\n",
         |                                                                                                    ~~~^
         |                                                                                                       |
         |                                                                                                       long long unsigned int
         |                                                                                                    %x
   drivers/media/platform/amlogic/vdec/h264.c:1305:33: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1305 |                                 "config canvas for poc %d canvas %d y_dma_addr 0x%llx c_dma_addr 0x%llx\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:1304:25: note: in expansion of macro 'dev_dbg'


vim +649 drivers/media/platform/amlogic/vdec/h264.c

   623	
   624	static int alloc_colocate_cma(struct aml_h264_ctx *h264_ctx,
   625				      struct aml_vdec_ctx *ctx)
   626	{
   627		int alloc_size = 0;
   628		int i;
   629		struct aml_vdec_hw *hw;
   630	
   631		if (h264_ctx->collated_cma_vaddr)
   632			return 0;
   633	
   634		hw = vdec_get_hw(ctx->dev);
   635		if (!hw)
   636			return -1;
   637	
   638		/* 96 :col buf size for each mb */
   639		h264_ctx->one_col_buf_size = h264_ctx->mb_total * 96;
   640		alloc_size = PAGE_ALIGN(h264_ctx->one_col_buf_size *
   641				(h264_ctx->max_num_ref_frames + COL_BUFFER_MARGIN));
   642		h264_ctx->collated_cma_vaddr = dma_alloc_coherent(hw->dev, alloc_size,
   643								  &h264_ctx->collated_cma_addr, GFP_KERNEL);
   644		if (!h264_ctx->collated_cma_vaddr)
   645			return -ENOMEM;
   646	
   647		dev_dbg
   648		    (&ctx->dev->plat_dev->dev,
 > 649		    "collated_cma_addr = 0x%llx, one_col_buf_size = %x alloc_size = %x\n",
   650		     h264_ctx->collated_cma_addr, h264_ctx->one_col_buf_size,
   651		     alloc_size);
   652		h264_ctx->collated_cma_addr_end =
   653		    h264_ctx->collated_cma_addr + alloc_size;
   654		memset(h264_ctx->collated_cma_vaddr, 0, alloc_size);
   655		h264_ctx->col_buf_alloc_size = alloc_size;
   656		h264_ctx->colocated_buf_map = 0;
   657		h264_ctx->colocated_buf_num = h264_ctx->max_num_ref_frames + COL_BUFFER_MARGIN;
   658	
   659		for (i = 0; i < H264_MAX_COL_BUF; i++)
   660			h264_ctx->colocated_buf_poc[i] = INVALID_POC;
   661	
   662		return 0;
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
