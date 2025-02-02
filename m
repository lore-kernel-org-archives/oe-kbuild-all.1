Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB3E573
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 23:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738540441; cv=none; b=gnYNRvfqytuzAqS6xhAm1r5dII8VuB29kDGM8KKs40GxV/7nT51m/6uKC4xr9Y4YBcz/KqnuFemh47OBXeoZtCQaRLIRrz66cPAA2+QL3YdTDMK6Bo6Ke1rNLaQ+uLRCmatV8TDxuT6rNpaIm3c6/M1CfYtYeP9vymz9z040Eao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738540441; c=relaxed/simple;
	bh=3jjSRZlKYwf7nytIbxhttGGkePopfcrb0pPBZ+5dn9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzBD5T+am8CG7YqVx4VPnp4tjW2LknQDD3TMw6YX8idjhkhP0pAINE2N/oyvWTV0Ki+hUyd/c3+Ohx+3bzknlwOIRynxe1WmFLvwGdHVYYGiHs9k7p1NrOMG2GD42wQiaBFY4jYJ5hJPgInKVz72MrC65QjU9mydVNJpyymJjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2LB/1er; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2LB/1er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738540439; x=1770076439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3jjSRZlKYwf7nytIbxhttGGkePopfcrb0pPBZ+5dn9Q=;
  b=B2LB/1er6tpi2lRLz2IJ36B2XuLOz7ospA2hbz/B1hwIlAPSzMHC75uw
   avt0MF+p2BnII/UTwVvFH/FPoVSvol/g95i9J9gf0QrSQ2uAsVgLH+w/F
   DxMna2HIJIHbstTaOYAovOHXpOQ0Fn6L0YQDuUeq7Ej29MyYfHOwyXqOY
   +nQ51PFLXEEuPLC0UeWCsRMjD24nU7fHJY2y1YT26wrWjFnZ0aEl4I2s7
   pWiR489ieCk1CsQ4buJsMDExevhnY/8zXIfqesNk3ww+qkmxGr/yshfFF
   TJAgKOLu+vUgpgHwLxkA0P5WMdbhS/Mbs76qf/0adSr/P4l6U8+vJnSrd
   Q==;
X-CSE-ConnectionGUID: 9zF34I65ShOvYO0kSGPkVA==
X-CSE-MsgGUID: ovUTfEr8TNO4TQFZlp28tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38910843"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="38910843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 15:53:59 -0800
X-CSE-ConnectionGUID: wS+/kMgNTTyD5SfLmZV9xQ==
X-CSE-MsgGUID: ec80PO1+ScO0Mx4h+YOHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115292450"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2025 15:53:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tejml-000qGP-1T;
	Sun, 02 Feb 2025 23:53:55 +0000
Date: Mon, 3 Feb 2025 07:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 24/24]
 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:433:35:
 warning: cast from pointer to integer of different size
Message-ID: <202502030744.wfrCh5v8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   04a72490fa00fcebe6087be713eccf05755d2fe9
commit: 04a72490fa00fcebe6087be713eccf05755d2fe9 [24/24] CHROMIUM: media: mediatek: vcodec: encoder: Add VCP backend
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250203/202502030744.wfrCh5v8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030744.wfrCh5v8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030744.wfrCh5v8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/media/videobuf2-core.h:15,
                    from drivers/media/platform/mediatek/vcodec/encoder/venc/../mtk_vcodec_enc.h:11,
                    from drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:6:
   drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c: In function 'mtk_venc_mem_alloc':
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:433:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     433 |                        buf->size, (u64)buf->va, buf->iova);
         |                                   ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_util.h:61:25: note: in expansion of macro 'dev_dbg'
      61 |                         dev_dbg(&(plat_dev)->dev, "[MTK_VCODEC][%d]: %s, %d " fmt "\n", \
         |                         ^~~~~~~
   drivers/media/platform/mediatek/vcodec/encoder/venc/../mtk_vcodec_enc_drv.h:246:9: note: in expansion of macro 'mtk_vcodec_debug'
     246 |         mtk_vcodec_debug((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:431:9: note: in expansion of macro 'mtk_venc_debug'
     431 |         mtk_venc_debug(inst->ctx,
         |         ^~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c: In function 'mtk_venc_mem_free':
   drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:447:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     447 |                        buf->size, (u64)buf->va, buf->iova);
         |                                   ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/encoder/venc/../../common/mtk_vcodec_util.h:61:25: note: in expansion of macro 'dev_dbg'
      61 |                         dev_dbg(&(plat_dev)->dev, "[MTK_VCODEC][%d]: %s, %d " fmt "\n", \
         |                         ^~~~~~~
   drivers/media/platform/mediatek/vcodec/encoder/venc/../mtk_vcodec_enc_drv.h:246:9: note: in expansion of macro 'mtk_vcodec_debug'
     246 |         mtk_vcodec_debug((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:445:9: note: in expansion of macro 'mtk_venc_debug'
     445 |         mtk_venc_debug(inst->ctx,
         |         ^~~~~~~~~~~~~~
--
   drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c: In function 'handle_enc_init_msg':
>> drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c:27:37: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      27 |                 vpu->vsi = (void *)((__u64)mtk_vcodec_vcp_get_vsi(fw, 0) +
         |                                     ^
>> drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c:27:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      27 |                 vpu->vsi = (void *)((__u64)mtk_vcodec_vcp_get_vsi(fw, 0) +
         |                            ^
--
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:47: warning: Enum value 'VENC_BS_MODE_SPS' not described in enum 'venc_bs_mode'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:47: warning: Enum value 'VENC_BS_MODE_PPS' not described in enum 'venc_bs_mode'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:47: warning: Enum value 'VENC_BS_MODE_VPS' not described in enum 'venc_bs_mode'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:47: warning: Enum value 'VENC_BS_MODE_SEQ_HDR' not described in enum 'venc_bs_mode'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:47: warning: Enum value 'VENC_BS_MODE_FRAME' not described in enum 'venc_bs_mode'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:47: warning: Enum value 'VENC_BS_MODE_FRAME_FINAL' not described in enum 'venc_bs_mode'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:47: warning: Enum value 'VENC_BS_MODE_MAX' not described in enum 'venc_bs_mode'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:118: warning: Function parameter or member 'pa_64' not described in 'venc_work_buf'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:118: warning: Function parameter or member 'va' not described in 'venc_work_buf'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:118: warning: Function parameter or member 'va_padding' not described in 'venc_work_buf'
>> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c:118: warning: Function parameter or member 'size_padding' not described in 'venc_work_buf'


vim +433 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

   415	
   416	static int mtk_venc_mem_alloc(struct venc_inst *inst,
   417				      struct device *dev,
   418				      struct venc_work_buf *buf)
   419	{
   420		dma_addr_t dma_addr;
   421	
   422		if (!buf || buf->size == 0)
   423			return 0;
   424	
   425		buf->va = dma_alloc_coherent(dev, buf->size, &dma_addr, GFP_KERNEL);
   426		if (!buf->va)
   427			return -ENOMEM;
   428	
   429		buf->iova = (unsigned long long)dma_addr;
   430	
   431		mtk_venc_debug(inst->ctx,
   432			       "allocate buffer, size: %d, va: 0x%llx, iova: 0x%llx",
 > 433			       buf->size, (u64)buf->va, buf->iova);
   434	
   435		return 0;
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
