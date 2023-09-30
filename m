Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1923C17D0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696063216; x=1727599216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0plwC1KJUYXOPULriFW6Yw2DS/Ao17SFyhhINypnQiY=;
  b=ADlZpXT1YuzK8TxreOH7zYLRb6WCKe+Ss2OjxtuLm8e1NlTHSh9u+eQo
   wfZyCk+kTb3EQeOjDD3ndfyv409bXanGiUV76sdhmv2uLH+YtFHswDNbY
   v3TmabLF8RMMJh4+4p6nx07tnhoI1Tfro9WtcYb7pTWhFS53Ykzl9402Z
   D094XFD3U/eJoGg8HZs6cvIOMYIICr5TA+hSWVVCCzFPL3HC4ABsCsdoe
   nTmvEB5Xz0HYmgYdEwP9Gv8LKu2al/Oj+iXnHm1eZjQ2g8uzmOFvU7PNs
   puSafMMrjE4NlB5ty15HL8rDFnneVERJAu6pYQmjUg0YQ1vJh2Ae9cy5r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="4004910"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="4004910"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 01:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865962827"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="865962827"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2023 01:40:10 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmVWC-0003vG-1I;
	Sat, 30 Sep 2023 08:40:08 +0000
Date: Sat, 30 Sep 2023 16:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:enc-dec-cmd 238/242]
 drivers/media/platform/allegro-dvt/allegro-core.c:2822:17: error: implicit
 declaration of function 'v4l2_m2m_last_buffer_done'; did you mean
 'v4l2_m2m_dst_buf_remove'?
Message-ID: <202309301653.nZuoufuU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git enc-dec-cmd
head:   dfe65790629e114a9b188d18d7169711b5900482
commit: cbacad8dbbd805b28458c624c88eb2a5f79b8355 [238/242] media: core: v4l2-mem2mem: remove v4l2_m2m_last_buffer_done
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230930/202309301653.nZuoufuU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301653.nZuoufuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301653.nZuoufuU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/allegro-dvt/allegro-core.c: In function 'allegro_buf_queue':
>> drivers/media/platform/allegro-dvt/allegro-core.c:2822:17: error: implicit declaration of function 'v4l2_m2m_last_buffer_done'; did you mean 'v4l2_m2m_dst_buf_remove'? [-Werror=implicit-function-declaration]
    2822 |                 v4l2_m2m_last_buffer_done(channel->fh.m2m_ctx, vbuf);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 v4l2_m2m_dst_buf_remove
   cc1: some warnings being treated as errors
--
   drivers/media/platform/verisilicon/hantro_v4l2.c: In function 'hantro_buf_queue':
>> drivers/media/platform/verisilicon/hantro_v4l2.c:892:17: error: implicit declaration of function 'v4l2_m2m_last_buffer_done'; did you mean 'v4l2_m2m_dst_buf_remove'? [-Werror=implicit-function-declaration]
     892 |                 v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vbuf);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 v4l2_m2m_dst_buf_remove
   cc1: some warnings being treated as errors
--
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: In function 'mxc_jpeg_set_last_buffer':
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1336:9: error: implicit declaration of function 'v4l2_m2m_last_buffer_done'; did you mean 'v4l2_m2m_dst_buf_remove'? [-Werror=implicit-function-declaration]
    1336 |         v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, next_dst_buf);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         v4l2_m2m_dst_buf_remove
   cc1: some warnings being treated as errors


vim +2822 drivers/media/platform/allegro-dvt/allegro-core.c

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2804  
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2805  static void allegro_buf_queue(struct vb2_buffer *vb)
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2806  {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2807  	struct allegro_channel *channel = vb2_get_drv_priv(vb->vb2_queue);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2808  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2809  	struct vb2_queue *q = vb->vb2_queue;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2810  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2811  	if (V4L2_TYPE_IS_CAPTURE(q->type) &&
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2812  	    vb2_is_streaming(q) &&
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2813  	    v4l2_m2m_dst_buf_is_last(channel->fh.m2m_ctx)) {
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2814  		unsigned int i;
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2815  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2816  		for (i = 0; i < vb->num_planes; i++)
05fd87b8d9a607 drivers/media/platform/allegro-dvt/allegro-core.c Dafna Hirschfeld 2021-12-01  2817  			vb2_set_plane_payload(vb, i, 0);
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2818  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2819  		vbuf->field = V4L2_FIELD_NONE;
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2820  		vbuf->sequence = channel->csequence++;
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2821  
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02 @2822  		v4l2_m2m_last_buffer_done(channel->fh.m2m_ctx, vbuf);
0e13f6f6ff9d06 drivers/media/platform/allegro-dvt/allegro-core.c Michael Tretter  2020-12-02  2823  		allegro_channel_eos_event(channel);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2824  		return;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2825  	}
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2826  
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2827  	v4l2_m2m_buf_queue(channel->fh.m2m_ctx, vbuf);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2828  }
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c  Michael Tretter  2019-05-28  2829  

:::::: The code at line 2822 was first introduced by commit
:::::: 0e13f6f6ff9d065cf0aba26a6f4f9c851c92a9d2 media: allegro: remove custom drain state handling

:::::: TO: Michael Tretter <m.tretter@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
