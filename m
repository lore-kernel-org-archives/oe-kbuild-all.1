Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54649276038
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 05:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778908885; cv=none; b=CREY8wkYR+M4oGkdLiwAS8BO5Pvfid0h1HdoCj88ZPZe0vyLHqU/96kggkmhYyw82/GHpk2CQOyYTYKPJnrrkhjHzseR6HVHZav8U9NFI0abJJtezmmGPkRZwQBsGzl3i8rul3s4VxsumWRcCS2xwvP2OTSmJUwAV+EdE0AoWio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778908885; c=relaxed/simple;
	bh=Qr7+AS3FTEU+4j3W7yhmJYBEjwnXapx5wSeHZWSksVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h4Uo+3UOU2Z0MbuFaCdPVRRSjPvaUBvM5NIYUqq9Lll6fuxNTnbyS9L7ujpa2OTkZnt27vc6THMNMpr4M33Kk3yhscFCXGhQKYuWWJWHkAfIs/d6hyj43dK0tjoDUT4+qaT44lDKe2YPzHPVI87kI+P4M5LCwMgSIhx42TBDDnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=midL3IcP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="midL3IcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778908883; x=1810444883;
  h=date:from:to:cc:subject:message-id;
  bh=Qr7+AS3FTEU+4j3W7yhmJYBEjwnXapx5wSeHZWSksVg=;
  b=midL3IcPqIVsg5I7ocCSrPXQjAuZJHw+3lZZfyhXwN9Gw3/E7+fvA5UX
   MD57YrjstPB8l0Rpq1SfAnp/ALrumR6+i6Qcq2IH2PPll+8AjcU2t2T1j
   3OTvq4PTx6FmqUTVXITeIIlvGuF8UjKE+IQ3WILwutiHCQhAjh3lROVEd
   ChsJf5drqIdNL3F1nu36xTjcqVqiOh+MAYjVqBaGKtBn+Xs8KDqy7L6SA
   TaoI+T7CEoY11hXpc7m8t60+S9beC6F7aGTJew25HnK6aaAbbkw54dZ0V
   89bXSzatr15s/nyJczeBSKTzmp4w3kbgFm94kxQAafHe8pH2qjN7CfWP0
   A==;
X-CSE-ConnectionGUID: BreQfOwcSUK95RsJAmo4/Q==
X-CSE-MsgGUID: DPrAjtJhRFyBpV+mTmxMQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79836828"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79836828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 22:21:21 -0700
X-CSE-ConnectionGUID: rq0K4HbfRr+2hRyMPTDCsA==
X-CSE-MsgGUID: 1lN27Y1ySemPjuqEySSk7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="235858046"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 May 2026 22:21:19 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO7Se-000000000Wv-2LOQ;
	Sat, 16 May 2026 05:21:16 +0000
Date: Sat, 16 May 2026 13:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Sagar <vishal.sagar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Neel Gandhi <neel.gandhi@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18 624/871]
 drivers/media/platform/xilinx/xilinx-dma.c:423:25: warning: format '%lu'
 expects argument of type 'long unsigned int', but argument 4 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202605161338.qOH1uArd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18
head:   8ad23fcb26beeb807a7f0f3341137ec98e93f390
commit: 98206f29c4045c3081e6c4eb0e614f5f41eeff41 [624/871] v4l: xilinx: dma: Add support for tile formats
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605161338.qOH1uArd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161338.qOH1uArd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161338.qOH1uArd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma/xilinx_dma.h:11,
                    from drivers/media/platform/xilinx/xilinx-dma.c:14:
   drivers/media/platform/xilinx/xilinx-dma.c: In function 'xvip_dma_buffer_queue':
>> drivers/media/platform/xilinx/xilinx-dma.c:423:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     423 |                         "xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:422:17: note: in expansion of macro 'dev_dbg'
     422 |                 dev_dbg(dma->xdev->dev,
         |                 ^~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:423:43: note: format string is defined here
     423 |                         "xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
         |                                         ~~^
         |                                           |
         |                                           long unsigned int
         |                                         %u
   drivers/media/platform/xilinx/xilinx-dma.c:423:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     423 |                         "xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:422:17: note: in expansion of macro 'dev_dbg'
     422 |                 dev_dbg(dma->xdev->dev,
         |                 ^~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:423:58: note: format string is defined here
     423 |                         "xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
         |                                                        ~~^
         |                                                          |
         |                                                          long unsigned int
         |                                                        %u
   drivers/media/platform/xilinx/xilinx-dma.c:423:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     423 |                         "xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:422:17: note: in expansion of macro 'dev_dbg'
     422 |                 dev_dbg(dma->xdev->dev,
         |                 ^~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:423:68: note: format string is defined here
     423 |                         "xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
         |                                                                  ~~^
         |                                                                    |
         |                                                                    long unsigned int
         |                                                                  %u
   drivers/media/platform/xilinx/xilinx-dma.c:423:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     423 |                         "xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/xilinx/xilinx-dma.c:422:17: note: in expansion of macro 'dev_dbg'
     422 |                 dev_dbg(dma->xdev->dev,


vim +423 drivers/media/platform/xilinx/xilinx-dma.c

   359	
   360	static void xvip_dma_buffer_queue(struct vb2_buffer *vb)
   361	{
   362		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
   363		struct xvip_dma *dma = vb2_get_drv_priv(vb->vb2_queue);
   364		struct xvip_dma_buffer *buf = to_xvip_dma_buffer(vbuf);
   365		struct dma_async_tx_descriptor *desc;
   366		dma_addr_t addr = vb2_dma_contig_plane_dma_addr(vb, 0);
   367		u32 flags = 0;
   368		u32 luma_size;
   369		u32 padding_factor_nume, padding_factor_deno, bpl_nume, bpl_deno;
   370		u32 fid = ~0;
   371		u32 bpl;
   372	
   373		if (dma->queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
   374		    dma->queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
   375			flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
   376			dma->xt.dir = DMA_DEV_TO_MEM;
   377			dma->xt.src_sgl = false;
   378			dma->xt.dst_sgl = true;
   379			dma->xt.dst_start = addr;
   380		} else if (dma->queue.type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
   381			   dma->queue.type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
   382			flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
   383			dma->xt.dir = DMA_MEM_TO_DEV;
   384			dma->xt.src_sgl = true;
   385			dma->xt.dst_sgl = false;
   386			dma->xt.src_start = addr;
   387		}
   388	
   389		/*
   390		 * DMA IP supports only 2 planes, so one datachunk is sufficient
   391		 * to get start address of 2nd plane
   392		 */
   393		if (V4L2_TYPE_IS_MULTIPLANAR(dma->format.type)) {
   394			struct v4l2_pix_format_mplane *pix_mp;
   395			size_t size;
   396	
   397			pix_mp = &dma->format.fmt.pix_mp;
   398			bpl = pix_mp->plane_fmt[0].bytesperline;
   399	
   400			xilinx_xdma_v4l2_config(dma->dma, pix_mp->pixelformat);
   401			xvip_width_padding_factor(pix_mp->pixelformat,
   402						  &padding_factor_nume,
   403						  &padding_factor_deno);
   404			xvip_bpl_scaling_factor(pix_mp->pixelformat, &bpl_nume,
   405						&bpl_deno);
   406			dma->xt.frame_size = dma->fmtinfo->num_planes;
   407	
   408			size = ((size_t)dma->r.width * dma->fmtinfo->bpl_factor *
   409				padding_factor_nume * bpl_nume) /
   410				((size_t)padding_factor_deno * bpl_deno);
   411			dma->sgl.size = size;
   412	
   413			dma->sgl.icg = bpl - dma->sgl.size;
   414			dma->xt.numf = dma->r.height;
   415	
   416			dev_dbg(dma->xdev->dev,
   417				"pix height: %u, width: %u, dma height: %u, width: %u\n",
   418				pix_mp->height, pix_mp->width, dma->r.height, dma->r.width);
   419			dev_dbg(dma->xdev->dev,
   420				"bpl: %u, padding_num: %u, padding_deno: %u, bpl_nume: %u, bpl_deno: %u\n",
   421				bpl, padding_factor_nume, padding_factor_deno, bpl_nume, bpl_deno);
   422			dev_dbg(dma->xdev->dev,
 > 423				"xt.frame_size: %lu, sgl_size: %lu, ICG: %lu, numframes: %lu\n",
   424				dma->xt.frame_size, dma->sgl.size, dma->sgl.icg, dma->xt.numf);
   425			/*
   426			 * dst_icg is the number of bytes to jump after last luma addr
   427			 * and before first chroma addr
   428			 */
   429	
   430			/* Handling contiguous data with mplanes */
   431			if (dma->fmtinfo->buffers == 1) {
   432				dma->sgl.dst_icg = (size_t)bpl *
   433						      (pix_mp->height - dma->r.height);
   434			} else {
   435				/* Handling non-contiguous data with mplanes */
   436				if (dma->fmtinfo->buffers == 2 || dma->fmtinfo->buffers == 3) {
   437					dma_addr_t chroma_addr =
   438						vb2_dma_contig_plane_dma_addr(vb, 1);
   439					luma_size = bpl * dma->xt.numf;
   440					if (chroma_addr > addr)
   441						dma->sgl.dst_icg = chroma_addr -
   442							addr - luma_size;
   443				}
   444				/* Handle the 3rd plane for Y_U_V8 */
   445				if (dma->fmtinfo->buffers == 3) {
   446					dma_addr_t chroma_addr =
   447						vb2_dma_contig_plane_dma_addr(vb, 1);
   448					dma_addr_t third_plane_addr =
   449						vb2_dma_contig_plane_dma_addr(vb, 2);
   450					u32 chroma_size = bpl * dma->xt.numf;
   451	
   452					if (third_plane_addr > chroma_addr)
   453						dma->sgl.dst_icg = third_plane_addr -
   454							chroma_addr - chroma_size;
   455				}
   456			}
   457		} else {
   458			struct v4l2_pix_format *pix;
   459			size_t size;
   460			size_t dst_icg;
   461	
   462			pix = &dma->format.fmt.pix;
   463			bpl = pix->bytesperline;
   464			xilinx_xdma_v4l2_config(dma->dma, pix->pixelformat);
   465			xvip_width_padding_factor(pix->pixelformat,
   466						  &padding_factor_nume,
   467						  &padding_factor_deno);
   468			xvip_bpl_scaling_factor(pix->pixelformat, &bpl_nume,
   469						&bpl_deno);
   470			dma->xt.frame_size = dma->fmtinfo->num_planes;
   471			size = ((size_t)dma->r.width * dma->fmtinfo->bpl_factor *
   472				padding_factor_nume * bpl_nume) /
   473				((size_t)padding_factor_deno * bpl_deno);
   474			dma->sgl.size = size;
   475			dma->sgl.icg = bpl - dma->sgl.size;
   476			dma->xt.numf = dma->r.height;
   477			dma->sgl.dst_icg = 0;
   478			dst_icg = (size_t)bpl * (pix->height - dma->r.height);
   479			dma->sgl.dst_icg = dst_icg;
   480		}
   481	
   482		desc = dmaengine_prep_interleaved_dma(dma->dma, &dma->xt, flags);
   483		if (!desc) {
   484			dev_err(dma->xdev->dev, "Failed to prepare DMA transfer\n");
   485			vb2_buffer_done(&buf->buf.vb2_buf, VB2_BUF_STATE_ERROR);
   486			return;
   487		}
   488		desc->callback = xvip_dma_complete;
   489		desc->callback_param = buf;
   490		buf->desc = desc;
   491	
   492		if (buf->buf.field == V4L2_FIELD_TOP)
   493			fid = 1;
   494		else if (buf->buf.field == V4L2_FIELD_BOTTOM)
   495			fid = 0;
   496		else if (buf->buf.field == V4L2_FIELD_NONE)
   497			fid = 0;
   498	
   499		xilinx_xdma_set_fid(dma->dma, desc, fid);
   500	
   501		spin_lock_irq(&dma->queued_lock);
   502		list_add_tail(&buf->queue, &dma->queued_bufs);
   503		spin_unlock_irq(&dma->queued_lock);
   504	
   505		/*
   506		 * Low latency capture: Give descriptor callback at start of
   507		 * processing the descriptor
   508		 */
   509		if (dma->low_latency_cap)
   510			xilinx_xdma_set_earlycb(dma->dma, desc,
   511						EARLY_CALLBACK_START_DESC);
   512		dmaengine_submit(desc);
   513	
   514		if (vb2_is_streaming(&dma->queue))
   515			dma_async_issue_pending(dma->dma);
   516	}
   517	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
