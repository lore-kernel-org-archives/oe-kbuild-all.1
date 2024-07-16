Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C5B1A0B03
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158760; cv=none; b=Wl0VmtOhSx7X+RKeU2YvpJA3WsfVxi4DuwnHYXt3NU71Y+tZvyQC2o0wd5c89xfUWsGwHCmgsdgKx3Y2OSMPw8PG3fZ5HK+v1tPzN63Cm46dLFIY3sW4UMEyLH3HWl5j7dbz15+rE6katU8H4+4cno1dOvGG7b38+0Naa0eKftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158760; c=relaxed/simple;
	bh=BfO8jd2/io79mdywN0Dwb383NbFFInThTmsv7EhTrys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJU0YrLlQ3P2ojjO6tF3sDUSzgBB+JctQPgta8Dtz4uZcAHCaHMkaAsQZ/q8pSTMABg3qFlyQRKOz1cn5AaYPFfILgPrePPkak2r2yCc4CB7C8YnzREWghW8Q8zFf9aWtGEycnUELYDsuqxVVKELkgdbKh8/Ppi4LnpMQ/ElEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeHDmbCF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeHDmbCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721158758; x=1752694758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BfO8jd2/io79mdywN0Dwb383NbFFInThTmsv7EhTrys=;
  b=BeHDmbCFeCl84fxA4TH7YCQiK4TeH4k6QZTSmPcmixq7ve3ADalA7v4v
   i49MWTI7pUnkHS0vvov4UkJBSXB5jWEI1+lrgi6FlVRVucdGkQvUpijB3
   uIqGkBQxe+rXxQVV5TVHAafJC6D7ovLHnM7e7bvIkfmUOsV0mMS5CfLPI
   BovZrXovp6JcLycCHPvvTetQgj6gJAxELOsDauxxLgQZ4Nos/AesDYIKt
   c7K/WY93z7EyCDHClN0dktiFXDIcoDl3uf7NZ6hSyZcTKivYLqLs8qIsb
   VRrS6t2lxXweNavKL72idMFy9vc4uUbTxkKE8oLF+RrgCvVPewWcPbf2k
   Q==;
X-CSE-ConnectionGUID: 7DFVtGLgTgWlV6x1x/NJJQ==
X-CSE-MsgGUID: 3PpY/QSmTjGbUYcT+c9NyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18471777"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18471777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 12:39:17 -0700
X-CSE-ConnectionGUID: 5b5CgaiJQliltlF4gSZ1cg==
X-CSE-MsgGUID: sChybrkSRCaIFtAcnRR3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="55016004"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2024 12:39:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTo12-000fbm-1E;
	Tue, 16 Jul 2024 19:39:12 +0000
Date: Wed, 17 Jul 2024 03:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 40/44]
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:377:33: warning:
 variable 'dec_buf' set but not used
Message-ID: <202407170328.gAKETv4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   57a6017c36af1015d5e7ac626d8ab1de0ccb6c22
commit: 1d17f0e0791113f27e3c018cf4903dad448b865d [40/44] media: chips-media: wave5: Add support for dmabuf import
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240717/202407170328.gAKETv4M-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170328.gAKETv4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170328.gAKETv4M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c: In function 'wave5_vpu_dec_finish_decode':
>> drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:377:33: warning: variable 'dec_buf' set but not used [-Wunused-but-set-variable]
     377 |         struct vb2_v4l2_buffer *dec_buf = NULL;
         |                                 ^~~~~~~


vim +/dec_buf +377 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c

02f03411f72b48 Nas Chung      2023-11-08  371  
02f03411f72b48 Nas Chung      2023-11-08  372  static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
02f03411f72b48 Nas Chung      2023-11-08  373  {
02f03411f72b48 Nas Chung      2023-11-08  374  	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
02f03411f72b48 Nas Chung      2023-11-08  375  	struct dec_output_info dec_info;
02f03411f72b48 Nas Chung      2023-11-08  376  	int ret;
02f03411f72b48 Nas Chung      2023-11-08 @377  	struct vb2_v4l2_buffer *dec_buf = NULL;
02f03411f72b48 Nas Chung      2023-11-08  378  	struct vb2_v4l2_buffer *disp_buf = NULL;
02f03411f72b48 Nas Chung      2023-11-08  379  	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
1d17f0e0791113 Brandon Brnich 2024-07-14  380  	int index_to_remove = -1;
1d17f0e0791113 Brandon Brnich 2024-07-14  381  	int tail = 0;
02f03411f72b48 Nas Chung      2023-11-08  382  
02f03411f72b48 Nas Chung      2023-11-08  383  	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
02f03411f72b48 Nas Chung      2023-11-08  384  
02f03411f72b48 Nas Chung      2023-11-08  385  	ret = wave5_vpu_dec_get_output_info(inst, &dec_info);
02f03411f72b48 Nas Chung      2023-11-08  386  	if (ret) {
02f03411f72b48 Nas Chung      2023-11-08  387  		dev_warn(inst->dev->dev, "%s: could not get output info.", __func__);
02f03411f72b48 Nas Chung      2023-11-08  388  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
02f03411f72b48 Nas Chung      2023-11-08  389  		return;
02f03411f72b48 Nas Chung      2023-11-08  390  	}
02f03411f72b48 Nas Chung      2023-11-08  391  
02f03411f72b48 Nas Chung      2023-11-08  392  	dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &dec_info.rd_ptr,
02f03411f72b48 Nas Chung      2023-11-08  393  		&dec_info.wr_ptr);
02f03411f72b48 Nas Chung      2023-11-08  394  
02f03411f72b48 Nas Chung      2023-11-08  395  	dev_dbg(inst->dev->dev, "%s: dec_info dec_idx %i disp_idx %i", __func__,
02f03411f72b48 Nas Chung      2023-11-08  396  		dec_info.index_frame_decoded, dec_info.index_frame_display);
02f03411f72b48 Nas Chung      2023-11-08  397  
6b313dd224ea74 Nas Chung      2024-06-25  398  	if (inst->std == W_AVC_DEC &&
6b313dd224ea74 Nas Chung      2024-06-25  399  	    dec_info.index_frame_decoded == DECODED_IDX_FLAG_SKIP &&
6b313dd224ea74 Nas Chung      2024-06-25  400  	    dec_info.index_frame_display == DISPLAY_IDX_FLAG_NO_FB) {
6b313dd224ea74 Nas Chung      2024-06-25  401  		struct vb2_v4l2_buffer *src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
6b313dd224ea74 Nas Chung      2024-06-25  402  
6b313dd224ea74 Nas Chung      2024-06-25  403  		if (src_buf)
6b313dd224ea74 Nas Chung      2024-06-25  404  			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
6b313dd224ea74 Nas Chung      2024-06-25  405  		return;
6b313dd224ea74 Nas Chung      2024-06-25  406  	}
6b313dd224ea74 Nas Chung      2024-06-25  407  
6b313dd224ea74 Nas Chung      2024-06-25  408  	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
6b313dd224ea74 Nas Chung      2024-06-25  409  
02f03411f72b48 Nas Chung      2023-11-08  410  	if (!vb2_is_streaming(dst_vq)) {
02f03411f72b48 Nas Chung      2023-11-08  411  		dev_dbg(inst->dev->dev, "%s: capture is not streaming..", __func__);
02f03411f72b48 Nas Chung      2023-11-08  412  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
02f03411f72b48 Nas Chung      2023-11-08  413  		return;
02f03411f72b48 Nas Chung      2023-11-08  414  	}
02f03411f72b48 Nas Chung      2023-11-08  415  
02f03411f72b48 Nas Chung      2023-11-08  416  	/* Remove decoded buffer from the ready queue now that it has been
02f03411f72b48 Nas Chung      2023-11-08  417  	 * decoded.
02f03411f72b48 Nas Chung      2023-11-08  418  	 */
02f03411f72b48 Nas Chung      2023-11-08  419  	if (dec_info.index_frame_decoded >= 0) {
02f03411f72b48 Nas Chung      2023-11-08  420  		struct vb2_buffer *vb = vb2_get_buffer(dst_vq,
02f03411f72b48 Nas Chung      2023-11-08  421  						       dec_info.index_frame_decoded);
02f03411f72b48 Nas Chung      2023-11-08  422  		if (vb) {
02f03411f72b48 Nas Chung      2023-11-08  423  			dec_buf = to_vb2_v4l2_buffer(vb);
1d17f0e0791113 Brandon Brnich 2024-07-14  424  			// dec_buf->vb2_buf.timestamp = inst->timestamp;
02f03411f72b48 Nas Chung      2023-11-08  425  		} else {
02f03411f72b48 Nas Chung      2023-11-08  426  			dev_warn(inst->dev->dev, "%s: invalid decoded frame index %i",
02f03411f72b48 Nas Chung      2023-11-08  427  				 __func__, dec_info.index_frame_decoded);
02f03411f72b48 Nas Chung      2023-11-08  428  		}
02f03411f72b48 Nas Chung      2023-11-08  429  	}
02f03411f72b48 Nas Chung      2023-11-08  430  
02f03411f72b48 Nas Chung      2023-11-08  431  	if (dec_info.index_frame_display >= 0) {
1d17f0e0791113 Brandon Brnich 2024-07-14  432  		if (inst->cap_io_mode == VB2_MEMORY_DMABUF) {
1d17f0e0791113 Brandon Brnich 2024-07-14  433  			mutex_lock(&inst->inst_lock);
1d17f0e0791113 Brandon Brnich 2024-07-14  434  			index_to_remove = inst->map_index[dec_info.index_frame_display];
1d17f0e0791113 Brandon Brnich 2024-07-14  435  			mutex_unlock(&inst->inst_lock);
1d17f0e0791113 Brandon Brnich 2024-07-14  436  			disp_buf = v4l2_m2m_dst_buf_remove_by_idx(m2m_ctx, index_to_remove);
1d17f0e0791113 Brandon Brnich 2024-07-14  437  		} else
1d17f0e0791113 Brandon Brnich 2024-07-14  438  			disp_buf = v4l2_m2m_dst_buf_remove_by_idx(m2m_ctx,
1d17f0e0791113 Brandon Brnich 2024-07-14  439  					dec_info.index_frame_display);
1d17f0e0791113 Brandon Brnich 2024-07-14  440  
02f03411f72b48 Nas Chung      2023-11-08  441  		if (!disp_buf)
02f03411f72b48 Nas Chung      2023-11-08  442  			dev_warn(inst->dev->dev, "%s: invalid display frame index %i",
02f03411f72b48 Nas Chung      2023-11-08  443  				 __func__, dec_info.index_frame_display);
02f03411f72b48 Nas Chung      2023-11-08  444  	}
02f03411f72b48 Nas Chung      2023-11-08  445  
02f03411f72b48 Nas Chung      2023-11-08  446  	/* If there is anything to display, do that now */
02f03411f72b48 Nas Chung      2023-11-08  447  	if (disp_buf) {
02f03411f72b48 Nas Chung      2023-11-08  448  		struct vpu_dst_buffer *dst_vpu_buf = wave5_to_vpu_dst_buf(disp_buf);
02f03411f72b48 Nas Chung      2023-11-08  449  
02f03411f72b48 Nas Chung      2023-11-08  450  		if (inst->dst_fmt.num_planes == 1) {
02f03411f72b48 Nas Chung      2023-11-08  451  			vb2_set_plane_payload(&disp_buf->vb2_buf, 0,
02f03411f72b48 Nas Chung      2023-11-08  452  					      inst->dst_fmt.plane_fmt[0].sizeimage);
02f03411f72b48 Nas Chung      2023-11-08  453  		} else if (inst->dst_fmt.num_planes == 2) {
02f03411f72b48 Nas Chung      2023-11-08  454  			vb2_set_plane_payload(&disp_buf->vb2_buf, 0,
02f03411f72b48 Nas Chung      2023-11-08  455  					      inst->dst_fmt.plane_fmt[0].sizeimage);
02f03411f72b48 Nas Chung      2023-11-08  456  			vb2_set_plane_payload(&disp_buf->vb2_buf, 1,
02f03411f72b48 Nas Chung      2023-11-08  457  					      inst->dst_fmt.plane_fmt[1].sizeimage);
02f03411f72b48 Nas Chung      2023-11-08  458  		} else if (inst->dst_fmt.num_planes == 3) {
02f03411f72b48 Nas Chung      2023-11-08  459  			vb2_set_plane_payload(&disp_buf->vb2_buf, 0,
02f03411f72b48 Nas Chung      2023-11-08  460  					      inst->dst_fmt.plane_fmt[0].sizeimage);
02f03411f72b48 Nas Chung      2023-11-08  461  			vb2_set_plane_payload(&disp_buf->vb2_buf, 1,
02f03411f72b48 Nas Chung      2023-11-08  462  					      inst->dst_fmt.plane_fmt[1].sizeimage);
02f03411f72b48 Nas Chung      2023-11-08  463  			vb2_set_plane_payload(&disp_buf->vb2_buf, 2,
02f03411f72b48 Nas Chung      2023-11-08  464  					      inst->dst_fmt.plane_fmt[2].sizeimage);
02f03411f72b48 Nas Chung      2023-11-08  465  		}
02f03411f72b48 Nas Chung      2023-11-08  466  
1d17f0e0791113 Brandon Brnich 2024-07-14  467  		tail = inst->time_stamp.tail;
1d17f0e0791113 Brandon Brnich 2024-07-14  468  		disp_buf->vb2_buf.timestamp = inst->time_stamp.buf[tail];
1d17f0e0791113 Brandon Brnich 2024-07-14  469  		inst->time_stamp.tail++;
1d17f0e0791113 Brandon Brnich 2024-07-14  470  
1d17f0e0791113 Brandon Brnich 2024-07-14  471  		if (IS_WRAP(inst->time_stamp.tail, MAX_TIMESTAMP_CIR_BUF) == 0)
1d17f0e0791113 Brandon Brnich 2024-07-14  472  			inst->time_stamp.tail = 0;
1d17f0e0791113 Brandon Brnich 2024-07-14  473  
02f03411f72b48 Nas Chung      2023-11-08  474  		/* TODO implement interlace support */
02f03411f72b48 Nas Chung      2023-11-08  475  		disp_buf->field = V4L2_FIELD_NONE;
02f03411f72b48 Nas Chung      2023-11-08  476  		dst_vpu_buf->display = true;
02f03411f72b48 Nas Chung      2023-11-08  477  		v4l2_m2m_buf_done(disp_buf, VB2_BUF_STATE_DONE);
02f03411f72b48 Nas Chung      2023-11-08  478  
02f03411f72b48 Nas Chung      2023-11-08  479  		dev_dbg(inst->dev->dev, "%s: frame_cycle %8u (payload %lu)\n",
02f03411f72b48 Nas Chung      2023-11-08  480  			__func__, dec_info.frame_cycle,
02f03411f72b48 Nas Chung      2023-11-08  481  			vb2_get_plane_payload(&disp_buf->vb2_buf, 0));
02f03411f72b48 Nas Chung      2023-11-08  482  	}
02f03411f72b48 Nas Chung      2023-11-08  483  
02f03411f72b48 Nas Chung      2023-11-08  484  	if ((dec_info.index_frame_display == DISPLAY_IDX_FLAG_SEQ_END ||
02f03411f72b48 Nas Chung      2023-11-08  485  	     dec_info.sequence_changed)) {
02f03411f72b48 Nas Chung      2023-11-08  486  		unsigned long flags;
02f03411f72b48 Nas Chung      2023-11-08  487  
02f03411f72b48 Nas Chung      2023-11-08  488  		spin_lock_irqsave(&inst->state_spinlock, flags);
02f03411f72b48 Nas Chung      2023-11-08  489  		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
02f03411f72b48 Nas Chung      2023-11-08  490  			switch_state(inst, VPU_INST_STATE_STOP);
02f03411f72b48 Nas Chung      2023-11-08  491  
02f03411f72b48 Nas Chung      2023-11-08  492  			if (dec_info.sequence_changed)
02f03411f72b48 Nas Chung      2023-11-08  493  				handle_dynamic_resolution_change(inst);
02f03411f72b48 Nas Chung      2023-11-08  494  			else
02f03411f72b48 Nas Chung      2023-11-08  495  				send_eos_event(inst);
02f03411f72b48 Nas Chung      2023-11-08  496  
02f03411f72b48 Nas Chung      2023-11-08  497  			flag_last_buffer_done(inst);
02f03411f72b48 Nas Chung      2023-11-08  498  		}
02f03411f72b48 Nas Chung      2023-11-08  499  		spin_unlock_irqrestore(&inst->state_spinlock, flags);
02f03411f72b48 Nas Chung      2023-11-08  500  	}
02f03411f72b48 Nas Chung      2023-11-08  501  }
02f03411f72b48 Nas Chung      2023-11-08  502  

:::::: The code at line 377 was first introduced by commit
:::::: 02f03411f72b4809dea93ebd2a1e82a01d90eaea media: chips-media: wave5: Add the v4l2 layer

:::::: TO: Nas Chung <nas.chung@chipsnmedia.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
