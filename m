Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652917F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 04:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692849666; x=1724385666;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ASzSKuUjeGbs9Q3SZBsBFZLIMs50dm2N/XFkCPgL0dA=;
  b=kxHWL65MWR7DfYy+PkzNi0tbHoJ1KxWIV2Jj4xsqWlcRtpsqWCSPF+nr
   maOd4guh8e8O50xISev152zNmE4DDKnNMvCrcVtzBFgzMt2pzP+dJ2FWB
   7g9vausaLxj4YfIwosxzKRaUP10jkwJZ/JDQgXPOOSi1fN4ihs+8ihxtA
   +7UuGGS4cQFsqv2zqicJpKLUe+7Ko6e8zY0Ml0szVqZJqDjk6F2VRp4zt
   XtwrDEpobxNEd1yKCpe31wpMXckJIphRfp9FRkLnhZmTvOJ6PAyMvHIxn
   tKqI3lLLf/nsyQJZxc67tT4vEA66zwhWOi5QYLWVw7/RB3VXbDTUcDBUE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364508444"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364508444"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 21:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="983547632"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="983547632"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Aug 2023 21:00:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ1Wk-0001kH-0g;
	Thu, 24 Aug 2023 04:00:58 +0000
Date: Thu, 24 Aug 2023 12:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:split-m2m 6/6]
 drivers/media/platform/qcom/venus/vdec.c:556:15: error: implicit declaration
 of function 'v4l2_m2m_ioctl_try_decoder_cmd'
Message-ID: <202308241137.2Rm0bAMP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://linuxtv.org/hverkuil/media_tree.git split-m2m
head:   7927435ed3620970cca5adaad787634066a6655a
commit: 7927435ed3620970cca5adaad787634066a6655a [6/6] media: v4l2-mem2mem.h: move codec bits to v4l2-mem2mem-codec.h
config: sparc64-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241137.2Rm0bAMP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241137.2Rm0bAMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241137.2Rm0bAMP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/qcom/venus/vdec.c: In function 'vdec_decoder_cmd':
>> drivers/media/platform/qcom/venus/vdec.c:556:15: error: implicit declaration of function 'v4l2_m2m_ioctl_try_decoder_cmd' [-Werror=implicit-function-declaration]
     556 |         ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/vdec.c: At top level:
>> drivers/media/platform/qcom/venus/vdec.c:621:35: error: 'v4l2_m2m_ioctl_try_decoder_cmd' undeclared here (not in a function)
     621 |         .vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/qcom/venus/venc.c: In function 'venc_encoder_cmd':
>> drivers/media/platform/qcom/venus/venc.c:535:15: error: implicit declaration of function 'v4l2_m2m_ioctl_try_encoder_cmd' [-Werror=implicit-function-declaration]
     535 |         ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/venc.c: At top level:
>> drivers/media/platform/qcom/venus/venc.c:600:35: error: 'v4l2_m2m_ioctl_try_encoder_cmd' undeclared here (not in a function)
     600 |         .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/v4l2_m2m_ioctl_try_decoder_cmd +556 drivers/media/platform/qcom/venus/vdec.c

7472c1c6913818 Stanimir Varbanov 2017-06-15  547  
7472c1c6913818 Stanimir Varbanov 2017-06-15  548  static int
7472c1c6913818 Stanimir Varbanov 2017-06-15  549  vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
7472c1c6913818 Stanimir Varbanov 2017-06-15  550  {
7472c1c6913818 Stanimir Varbanov 2017-06-15  551  	struct venus_inst *inst = to_inst(file);
50248ad9f190d5 Michał Krawczyk   2023-01-30  552  	struct vb2_queue *dst_vq;
e69b987a975994 Stanimir Varbanov 2017-10-13  553  	struct hfi_frame_data fdata = {0};
7472c1c6913818 Stanimir Varbanov 2017-06-15  554  	int ret;
7472c1c6913818 Stanimir Varbanov 2017-06-15  555  
beac82904a870b Stanimir Varbanov 2019-01-17 @556  	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
7472c1c6913818 Stanimir Varbanov 2017-06-15  557  	if (ret)
7472c1c6913818 Stanimir Varbanov 2017-06-15  558  		return ret;
7472c1c6913818 Stanimir Varbanov 2017-06-15  559  
7472c1c6913818 Stanimir Varbanov 2017-06-15  560  	mutex_lock(&inst->lock);
7472c1c6913818 Stanimir Varbanov 2017-06-15  561  
beac82904a870b Stanimir Varbanov 2019-01-17  562  	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
e69b987a975994 Stanimir Varbanov 2017-10-13  563  		/*
beac82904a870b Stanimir Varbanov 2019-01-17  564  		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
beac82904a870b Stanimir Varbanov 2019-01-17  565  		 * decoder input to signal EOS.
e69b987a975994 Stanimir Varbanov 2017-10-13  566  		 */
beac82904a870b Stanimir Varbanov 2019-01-17  567  		if (!(inst->streamon_out && inst->streamon_cap))
e69b987a975994 Stanimir Varbanov 2017-10-13  568  			goto unlock;
e69b987a975994 Stanimir Varbanov 2017-10-13  569  
e69b987a975994 Stanimir Varbanov 2017-10-13  570  		fdata.buffer_type = HFI_BUFFER_INPUT;
e69b987a975994 Stanimir Varbanov 2017-10-13  571  		fdata.flags |= HFI_BUFFERFLAG_EOS;
47f867cb1b6364 Dikshita Agarwal  2023-05-22  572  		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
83af5738dc13b4 Stanimir Varbanov 2021-04-02  573  			fdata.device_addr = 0;
83af5738dc13b4 Stanimir Varbanov 2021-04-02  574  		else
beac82904a870b Stanimir Varbanov 2019-01-17  575  			fdata.device_addr = 0xdeadb000;
7472c1c6913818 Stanimir Varbanov 2017-06-15  576  
e69b987a975994 Stanimir Varbanov 2017-10-13  577  		ret = hfi_session_process_buf(inst, &fdata);
e69b987a975994 Stanimir Varbanov 2017-10-13  578  
c8e8dabcd1a8c7 Fritz Koenig      2020-12-01  579  		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
beac82904a870b Stanimir Varbanov 2019-01-17  580  			inst->codec_state = VENUS_DEC_STATE_DRAIN;
c8e8dabcd1a8c7 Fritz Koenig      2020-12-01  581  			inst->drain_active = true;
c8e8dabcd1a8c7 Fritz Koenig      2020-12-01  582  		}
50248ad9f190d5 Michał Krawczyk   2023-01-30  583  	} else if (cmd->cmd == V4L2_DEC_CMD_START &&
50248ad9f190d5 Michał Krawczyk   2023-01-30  584  		   inst->codec_state == VENUS_DEC_STATE_STOPPED) {
50248ad9f190d5 Michał Krawczyk   2023-01-30  585  		dst_vq = v4l2_m2m_get_vq(inst->fh.m2m_ctx,
50248ad9f190d5 Michał Krawczyk   2023-01-30  586  					 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
50248ad9f190d5 Michał Krawczyk   2023-01-30  587  		vb2_clear_last_buffer_dequeued(dst_vq);
50248ad9f190d5 Michał Krawczyk   2023-01-30  588  
50248ad9f190d5 Michał Krawczyk   2023-01-30  589  		inst->codec_state = VENUS_DEC_STATE_DECODING;
beac82904a870b Stanimir Varbanov 2019-01-17  590  	}
beac82904a870b Stanimir Varbanov 2019-01-17  591  
e69b987a975994 Stanimir Varbanov 2017-10-13  592  unlock:
e69b987a975994 Stanimir Varbanov 2017-10-13  593  	mutex_unlock(&inst->lock);
e69b987a975994 Stanimir Varbanov 2017-10-13  594  	return ret;
7472c1c6913818 Stanimir Varbanov 2017-06-15  595  }
7472c1c6913818 Stanimir Varbanov 2017-06-15  596  
7472c1c6913818 Stanimir Varbanov 2017-06-15  597  static const struct v4l2_ioctl_ops vdec_ioctl_ops = {
7472c1c6913818 Stanimir Varbanov 2017-06-15  598  	.vidioc_querycap = vdec_querycap,
7e98b7b542a456 Boris Brezillon   2019-06-04  599  	.vidioc_enum_fmt_vid_cap = vdec_enum_fmt,
7e98b7b542a456 Boris Brezillon   2019-06-04  600  	.vidioc_enum_fmt_vid_out = vdec_enum_fmt,
7472c1c6913818 Stanimir Varbanov 2017-06-15  601  	.vidioc_s_fmt_vid_cap_mplane = vdec_s_fmt,
7472c1c6913818 Stanimir Varbanov 2017-06-15  602  	.vidioc_s_fmt_vid_out_mplane = vdec_s_fmt,
7472c1c6913818 Stanimir Varbanov 2017-06-15  603  	.vidioc_g_fmt_vid_cap_mplane = vdec_g_fmt,
7472c1c6913818 Stanimir Varbanov 2017-06-15  604  	.vidioc_g_fmt_vid_out_mplane = vdec_g_fmt,
7472c1c6913818 Stanimir Varbanov 2017-06-15  605  	.vidioc_try_fmt_vid_cap_mplane = vdec_try_fmt,
7472c1c6913818 Stanimir Varbanov 2017-06-15  606  	.vidioc_try_fmt_vid_out_mplane = vdec_try_fmt,
7472c1c6913818 Stanimir Varbanov 2017-06-15  607  	.vidioc_g_selection = vdec_g_selection,
7472c1c6913818 Stanimir Varbanov 2017-06-15  608  	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
7472c1c6913818 Stanimir Varbanov 2017-06-15  609  	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
7472c1c6913818 Stanimir Varbanov 2017-06-15  610  	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
7472c1c6913818 Stanimir Varbanov 2017-06-15  611  	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
7472c1c6913818 Stanimir Varbanov 2017-06-15  612  	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
7472c1c6913818 Stanimir Varbanov 2017-06-15  613  	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
7472c1c6913818 Stanimir Varbanov 2017-06-15  614  	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
7472c1c6913818 Stanimir Varbanov 2017-06-15  615  	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
7472c1c6913818 Stanimir Varbanov 2017-06-15  616  	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
7472c1c6913818 Stanimir Varbanov 2017-06-15  617  	.vidioc_s_parm = vdec_s_parm,
7472c1c6913818 Stanimir Varbanov 2017-06-15  618  	.vidioc_enum_framesizes = vdec_enum_framesizes,
7472c1c6913818 Stanimir Varbanov 2017-06-15  619  	.vidioc_subscribe_event = vdec_subscribe_event,
7472c1c6913818 Stanimir Varbanov 2017-06-15  620  	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
beac82904a870b Stanimir Varbanov 2019-01-17 @621  	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
7472c1c6913818 Stanimir Varbanov 2017-06-15  622  	.vidioc_decoder_cmd = vdec_decoder_cmd,
7472c1c6913818 Stanimir Varbanov 2017-06-15  623  };
7472c1c6913818 Stanimir Varbanov 2017-06-15  624  

:::::: The code at line 556 was first introduced by commit
:::::: beac82904a870b220d45b883e493b869d8d0dce5 media: venus: make decoder compliant with stateful codec API

:::::: TO: Stanimir Varbanov <stanimir.varbanov@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
