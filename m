Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088DAD33
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694419613; x=1725955613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RtcrzKvQgWVJXzkVTU/sS1Qaz92emNFsoglMfEEOXws=;
  b=mk9+kwA9giQFWJxhSEOcqzvE/GUeW0Q2LSLYOxhALoUNilJhjlA4IcFu
   HtTPHybYCH3LN4JJXksPHju4qmi9bQdXLGxelHZ8mN74hWgKV2tALufvD
   BLH36B3zVcNcSpgI5oKdi+yj5jRowN2EN26AJyqJNgCaAyjixlGu/9v8S
   WP1aiujNL22YyXvqBYI4Oatp8UC8P5Xq51dApXUMRP2F/zRTUrVUVVwMv
   9h8J6HhJ9FNJaY+2XTwG0KrrpCBmtAamx8TAZUP9frg+XTo4m8nKSGk+G
   ZpIVRD6Sz7AI1CRVERq9IBdk/uOPgBQVMeidrz9CnVgk5ujcN1gRhNWn/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="363047273"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="363047273"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 01:06:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="866850648"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="866850648"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Sep 2023 01:06:47 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfbwS-0005yf-35;
	Mon, 11 Sep 2023 08:06:44 +0000
Date: Mon, 11 Sep 2023 16:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	laurent.pinchart@ideasonboard.com
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
	gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
	kernel@pengutronix.de
Subject: Re: [PATCH 1/3] usb: gadget: uvc: stop pump thread on video disable
Message-ID: <202309111506.64B9KHI7-lkp@intel.com>
References: <20230911002451.2860049-2-m.grzeschik@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911002451.2860049-2-m.grzeschik@pengutronix.de>

Hi Michael,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next media-tree/master linus/master v6.6-rc1 next-20230911]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Grzeschik/usb-gadget-uvc-stop-pump-thread-on-video-disable/20230911-082623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230911002451.2860049-2-m.grzeschik%40pengutronix.de
patch subject: [PATCH 1/3] usb: gadget: uvc: stop pump thread on video disable
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309111506.64B9KHI7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111506.64B9KHI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111506.64B9KHI7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/uvc_video.c: In function 'uvcg_video_enable':
>> drivers/usb/gadget/function/uvc_video.c:502:17: error: 'uvc' undeclared (first use in this function)
     502 |                 uvc->state = UVC_STATE_CONNECTED;
         |                 ^~~
   drivers/usb/gadget/function/uvc_video.c:502:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/uvc +502 drivers/usb/gadget/function/uvc_video.c

   486	
   487	/*
   488	 * Enable or disable the video stream.
   489	 */
   490	int uvcg_video_enable(struct uvc_video *video, int enable)
   491	{
   492		unsigned int i;
   493		int ret;
   494	
   495		if (video->ep == NULL) {
   496			uvcg_info(&video->uvc->func,
   497				  "Video enable failed, device is uninitialized.\n");
   498			return -ENODEV;
   499		}
   500	
   501		if (!enable) {
 > 502			uvc->state = UVC_STATE_CONNECTED;
   503	
   504			cancel_work_sync(&video->pump);
   505			uvcg_queue_cancel(&video->queue, 0);
   506	
   507			for (i = 0; i < video->uvc_num_requests; ++i)
   508				if (video->ureq && video->ureq[i].req)
   509					usb_ep_dequeue(video->ep, video->ureq[i].req);
   510	
   511			uvc_video_free_requests(video);
   512			uvcg_queue_enable(&video->queue, 0);
   513			return 0;
   514		}
   515	
   516		if ((ret = uvcg_queue_enable(&video->queue, 1)) < 0)
   517			return ret;
   518	
   519		if ((ret = uvc_video_alloc_requests(video)) < 0)
   520			return ret;
   521	
   522		if (video->max_payload_size) {
   523			video->encode = uvc_video_encode_bulk;
   524			video->payload_size = 0;
   525		} else
   526			video->encode = video->queue.use_sg ?
   527				uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
   528	
   529		uvc->state = UVC_STATE_STREAMING;
   530	
   531		video->req_int_count = 0;
   532	
   533		queue_work(video->async_wq, &video->pump);
   534	
   535		return ret;
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
