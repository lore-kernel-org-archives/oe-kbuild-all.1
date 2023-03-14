Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF132565
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678778484; x=1710314484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9VQ9m+bDLFvsTRx+tow1UVLXopy/Kf4eFlBUqvMASQI=;
  b=Rib0AZbfevq2QMzUtxUdnW6WL/AW9sd0kDd7poX7kvCQBTvlAeYp62hK
   axWdRceAhUyUdxyhiNeSrVnkKx0yODHzdL7kh6uKGCH6CurG0AzPw+nuq
   hiVf1+lQ91prDasI9iDjLcqf/wblZMgXOGv/6ZNqZrfmYGGgDkQu5YuaJ
   1EyRBGA0nSIIguhXOUbgOB5qPvbaKOClFo9mjZTs3CbVaPligB3JoBlP2
   mJkBaHLH/cgTtwaXUCGQXdObr28CD+r95qI4OkMItCwC1K4YEBcrKzdpk
   3EPgZn5L/txtYAHkgRfmCO62oCbhBqZ1BsDW6fxJLGZbWMuYBYR/HeNGc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317739043"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="317739043"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 00:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="678993561"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="678993561"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Mar 2023 00:21:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbyyI-0006f2-0k;
	Tue, 14 Mar 2023 07:21:22 +0000
Date: Tue, 14 Mar 2023 15:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Message-ID: <202303141529.kHv8YSba-lkp@intel.com>
References: <20230313135916.862852-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313135916.862852-3-benjamin.gaignard@collabora.com>

Hi Benjamin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Use-vb2_get_buffer-as-helper-everywhere/20230313-220116
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230313135916.862852-3-benjamin.gaignard%40collabora.com
patch subject: [RFC 2/4] media: videobuf2: Replace bufs array by a list
config: arc-randconfig-r043-20230312 (https://download.01.org/0day-ci/archive/20230314/202303141529.kHv8YSba-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c6ebf39fc540139888f85f470b6984f2387d714b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/media-videobuf2-Use-vb2_get_buffer-as-helper-everywhere/20230313-220116
        git checkout c6ebf39fc540139888f85f470b6984f2387d714b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141529.kHv8YSba-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/common/videobuf2/videobuf2-core.c: In function '__vb2_queue_free':
>> drivers/media/common/videobuf2/videobuf2-core.c:550:42: error: 'struct vb2_queue' has no member named 'bufs'
     550 |                 struct vb2_buffer *vb = q->bufs[buffer];
         |                                          ^~


vim +550 drivers/media/common/videobuf2/videobuf2-core.c

e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  495  
2a87af6ba1b9df drivers/media/v4l2-core/videobuf2-core.c        Mauro Carvalho Chehab 2017-11-27  496  /*
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  497   * __vb2_queue_free() - free buffers at the end of the queue - video memory and
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  498   * related information, if no buffers are left return the queue to an
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  499   * uninitialized state. Might be called even if the queue has already been freed.
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  500   */
01cb370ff6c5ab drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-11-30  501  static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  502  {
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  503  	unsigned int buffer;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  504  
01cb370ff6c5ab drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-11-30  505  	lockdep_assert_held(&q->mmap_lock);
63faabfd89f4db drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2013-12-13  506  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  507  	/* Call driver-provided cleanup function for each buffer, if provided */
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  508  	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  509  	     ++buffer) {
ca690d47356726 drivers/media/common/videobuf2/videobuf2-core.c Benjamin Gaignard     2023-03-13  510  		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
256f3162c17595 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  511  
256f3162c17595 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  512  		if (vb && vb->planes[0].mem_priv)
a1d36d8c705e10 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-03-17  513  			call_void_vb_qop(vb, buf_cleanup, vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  514  	}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  515  
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  516  	/* Release video buffer memory */
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  517  	__vb2_free_mem(q, buffers);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  518  
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  519  #ifdef CONFIG_VIDEO_ADV_DEBUG
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  520  	/*
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  521  	 * Check that all the calls were balances during the life-time of this
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  522  	 * queue. If not (or if the debug level is 1 or up), then dump the
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  523  	 * counters to the kernel log.
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  524  	 */
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  525  	if (q->num_buffers) {
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  526  		bool unbalanced = q->cnt_start_streaming != q->cnt_stop_streaming ||
a10b2153257403 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-06-22  527  				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  528  				  q->cnt_wait_prepare != q->cnt_wait_finish;
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  529  
af3bac1a7c8a21 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-11-03  530  		if (unbalanced || debug) {
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  531  			pr_info("counters for queue %p:%s\n", q,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  532  				unbalanced ? " UNBALANCED!" : "");
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  533  			pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  534  				q->cnt_queue_setup, q->cnt_start_streaming,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  535  				q->cnt_stop_streaming);
a10b2153257403 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-06-22  536  			pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
a10b2153257403 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-06-22  537  				q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  538  			pr_info("     wait_prepare: %u wait_finish: %u\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  539  				q->cnt_wait_prepare, q->cnt_wait_finish);
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  540  		}
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  541  		q->cnt_queue_setup = 0;
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  542  		q->cnt_wait_prepare = 0;
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  543  		q->cnt_wait_finish = 0;
a10b2153257403 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-06-22  544  		q->cnt_prepare_streaming = 0;
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  545  		q->cnt_start_streaming = 0;
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  546  		q->cnt_stop_streaming = 0;
a10b2153257403 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-06-22  547  		q->cnt_unprepare_streaming = 0;
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  548  	}
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  549  	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29 @550  		struct vb2_buffer *vb = q->bufs[buffer];
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  551  		bool unbalanced = vb->cnt_mem_alloc != vb->cnt_mem_put ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  552  				  vb->cnt_mem_prepare != vb->cnt_mem_finish ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  553  				  vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  554  				  vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  555  				  vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  556  				  vb->cnt_buf_queue != vb->cnt_buf_done ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  557  				  vb->cnt_buf_prepare != vb->cnt_buf_finish ||
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  558  				  vb->cnt_buf_init != vb->cnt_buf_cleanup;
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  559  
af3bac1a7c8a21 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung          2015-11-03  560  		if (unbalanced || debug) {
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  561  			pr_info("   counters for queue %p, buffer %d:%s\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  562  				q, buffer, unbalanced ? " UNBALANCED!" : "");
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  563  			pr_info("     buf_init: %u buf_cleanup: %u buf_prepare: %u buf_finish: %u\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  564  				vb->cnt_buf_init, vb->cnt_buf_cleanup,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  565  				vb->cnt_buf_prepare, vb->cnt_buf_finish);
28d77c21cbeb2c drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2019-01-16  566  			pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
28d77c21cbeb2c drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2019-01-16  567  				vb->cnt_buf_out_validate, vb->cnt_buf_queue,
28d77c21cbeb2c drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2019-01-16  568  				vb->cnt_buf_done, vb->cnt_buf_request_complete);
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  569  			pr_info("     alloc: %u put: %u prepare: %u finish: %u mmap: %u\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  570  				vb->cnt_mem_alloc, vb->cnt_mem_put,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  571  				vb->cnt_mem_prepare, vb->cnt_mem_finish,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  572  				vb->cnt_mem_mmap);
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  573  			pr_info("     get_userptr: %u put_userptr: %u\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  574  				vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  575  			pr_info("     attach_dmabuf: %u detach_dmabuf: %u map_dmabuf: %u unmap_dmabuf: %u\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  576  				vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  577  				vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
2e33dbb06da407 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carvalho Chehab 2017-12-28  578  			pr_info("     get_dmabuf: %u num_users: %u vaddr: %u cookie: %u\n",
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  579  				vb->cnt_mem_get_dmabuf,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  580  				vb->cnt_mem_num_users,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  581  				vb->cnt_mem_vaddr,
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  582  				vb->cnt_mem_cookie);
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  583  		}
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  584  	}
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  585  #endif
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-01-29  586  
3e947c36af524b drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil          2022-08-10  587  	/* Free vb2 buffers */
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  588  	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  589  	     ++buffer) {
ca690d47356726 drivers/media/common/videobuf2/videobuf2-core.c Benjamin Gaignard     2023-03-13  590  		struct vb2_buffer *vb2 = vb2_get_buffer(q, buffer);
ca690d47356726 drivers/media/common/videobuf2/videobuf2-core.c Benjamin Gaignard     2023-03-13  591  
ca690d47356726 drivers/media/common/videobuf2/videobuf2-core.c Benjamin Gaignard     2023-03-13  592  		vb2_del_buffer(q, vb2);
ca690d47356726 drivers/media/common/videobuf2/videobuf2-core.c Benjamin Gaignard     2023-03-13  593  		kfree(vb2);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  594  	}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  595  
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Liakhovetski 2011-09-28  596  	q->num_buffers -= buffers;
a7afcaccfab2fb drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-02-24  597  	if (!q->num_buffers) {
ce4686702f8f56 drivers/media/common/videobuf/videobuf2-core.c  Satendra Singh Thakur 2017-12-28  598  		q->memory = VB2_MEMORY_UNKNOWN;
bd50d999d4d4f3 drivers/media/video/videobuf2-core.c            Marek Szyprowski      2011-10-25  599  		INIT_LIST_HEAD(&q->queued_list);
a7afcaccfab2fb drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil          2014-02-24  600  	}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  601  }
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak          2010-10-11  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
