Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC69193435
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720384; cv=none; b=Tyh84LMM0+qD7pgoMUggi4Mex+07rCAADUkC8vld4IpRyc0dJgoHMJ1Hh/LK4UsSE4SNwIN6YnG5pHvBKGOlRcUs4EJOeFxC1PvQiJkMyfEbM7rk3q9NmpcQk7Wo1816bkrgr1Jk/xjYwbf4t+KahDr6pUO4b6oh6CuWewlnB5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720384; c=relaxed/simple;
	bh=y7uDvzOZui/1HpDs7+uT19cukIlcjUi8GcEj3xszKFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzftPgdy6P6WjkFgP9HC+8FJLrnuaszSdYao1ECYpudzBxlX50UpE5zPAZ2zBeLpqOO1GVaPcEZ5nRIAtEmBl0bt/DM6zcLXMeHmruBabiOs4DvHUUdlvzvJthAM82GfWme3OOcv87PweUMiW19GTeZLhPsHFfhTggqhcSR08w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNku836k; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNku836k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720383; x=1765256383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7uDvzOZui/1HpDs7+uT19cukIlcjUi8GcEj3xszKFQ=;
  b=nNku836k/hc7tZb+sJQbMQQRfVY5pYTnVpd+E7Pngm88s+VN0TVJyFKV
   4+efSVzWKuMvq9LyQk4v7Mef+0Dk60gN2HlZQRfHLt7RSxjIGSehXtW45
   QxGgPMtCNmoIbOgOwBeAQMXNnwudvqSfZOcF9EzZTIwlQF4syjALjEYMt
   ReS3OX1HTXfHXozSjeKXrGLzVImYT4XDnME8fEDnxpThU0WNqa3o9dj9t
   V1iNEhQ99IY+F+EyeN8yPEJhSeCs+qRoOOOxPF7Ff+iiDyG19o46UK4bB
   tqjapNvlQB7RA+3eqqCo+94ZYoR2Dy6zLaQiwIKv03UjmqYAa0XdEHssE
   A==;
X-CSE-ConnectionGUID: 6kUg5SKYRSqpOPEemFYIEg==
X-CSE-MsgGUID: A9nIHn5dSJuKd71sCMLxeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51417059"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51417059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:59:42 -0800
X-CSE-ConnectionGUID: 4vx+EkJASSqGWgjLxwjTkw==
X-CSE-MsgGUID: UEGhoBDIQ16nNW/k6rDM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95408620"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Dec 2024 20:59:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVru-0003wu-22;
	Mon, 09 Dec 2024 04:59:38 +0000
Date: Mon, 9 Dec 2024 12:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:2448:58: sparse: sparse: non
 size-preserving integer to pointer cast
Message-ID: <202412090856.PKpYb4ZH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   d30bd179ced57489fd4142f71a97a1f20fb95162
commit: d30bd179ced57489fd4142f71a97a1f20fb95162 [2/2] media: v4l2-loopback
config: hexagon-randconfig-r122-20241209 (https://download.01.org/0day-ci/archive/20241209/202412090856.PKpYb4ZH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241209/202412090856.PKpYb4ZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090856.PKpYb4ZH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/v4l2-core/v4l2-loopback.c:973:27: sparse: sparse: cast removes address space '__user' of expression
   drivers/media/v4l2-core/v4l2-loopback.c:973:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:973:27: sparse:     expected void [noderef] __user *to
   drivers/media/v4l2-core/v4l2-loopback.c:973:27: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:1080:65: sparse: sparse: cast removes address space '__user' of expression
   drivers/media/v4l2-core/v4l2-loopback.c:1080:65: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:1080:65: sparse:     expected void const [noderef] __user *from
   drivers/media/v4l2-core/v4l2-loopback.c:1080:65: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:1213:13: sparse: sparse: restricted __poll_t degrades to integer
   drivers/media/v4l2-core/v4l2-loopback.c:1242:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/media/v4l2-core/v4l2-loopback.c:1242:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/media/v4l2-core/v4l2-loopback.c:1242:27: sparse:     got unsigned int ( * )( ... )
   drivers/media/v4l2-core/v4l2-loopback.c:2166:40: sparse: sparse: symbol 'client_usage_ops' was not declared. Should it be static?
   drivers/media/v4l2-core/v4l2-loopback.c: note: in included file (through include/linux/smp.h, include/linux/alloc_tag.h, include/linux/vmalloc.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> drivers/media/v4l2-core/v4l2-loopback.c:2448:58: sparse: sparse: non size-preserving integer to pointer cast
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +2448 drivers/media/v4l2-core/v4l2-loopback.c

  2437	
  2438	static int v4l2_loopback_add(struct v4l2_loopback_add *conf)
  2439	{
  2440		struct v4l2l_private *vdev_priv = NULL;
  2441		char card_label[V4L2L_MAX_CARD_NAME];
  2442		struct v4l2_loopback_device *dev;
  2443		struct v4l2_ctrl_handler *hdl;
  2444		bool exclusive_caps = false;
  2445		int err;
  2446		int nr;
  2447	
> 2448		if (strncpy_from_user(card_label, (char __user *)conf->card_label,
  2449				      V4L2L_MAX_CARD_NAME - 1) < 0)
  2450			return -EFAULT;
  2451		if (conf->flags & ~1)
  2452			return -EINVAL;
  2453		if (conf->flags)
  2454			exclusive_caps = true;
  2455		if (conf->device_nr)
  2456			return -EINVAL;
  2457		if (conf->card_fd)
  2458			return -EINVAL;
  2459	
  2460		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
  2461		if (!dev)
  2462			return -ENOMEM;
  2463	
  2464		nr = idr_alloc(&v4l2l_index_idr, dev, 0, 0, GFP_KERNEL);
  2465		if (nr < 0) {
  2466			kfree(dev);
  2467			return nr;
  2468		}
  2469	
  2470		snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
  2471			 "v4l2loopback-%03d", nr);
  2472	
  2473		err = v4l2_device_register(NULL, &dev->v4l2_dev);
  2474		if (err)
  2475			goto out_free_idr;
  2476	
  2477		dev->vdev = video_device_alloc();
  2478		if (dev->vdev == NULL) {
  2479			err = -ENOMEM;
  2480			goto out_unregister;
  2481		}
  2482	
  2483		vdev_priv = kzalloc(sizeof(struct v4l2l_private), GFP_KERNEL);
  2484		if (vdev_priv == NULL) {
  2485			err = -ENOMEM;
  2486			goto out_unregister;
  2487		}
  2488	
  2489		video_set_drvdata(dev->vdev, vdev_priv);
  2490		if (video_get_drvdata(dev->vdev) == NULL) {
  2491			err = -ENOMEM;
  2492			goto out_unregister;
  2493		}
  2494	
  2495		snprintf(dev->vdev->name, sizeof(dev->vdev->name), "%s",
  2496			 dev->card_label);
  2497	
  2498		vdev_priv->device_nr = nr;
  2499	
  2500		init_vdev(dev->vdev, nr);
  2501		dev->vdev->v4l2_dev = &dev->v4l2_dev;
  2502		init_capture_param(&dev->capture_param);
  2503		err = set_timeperframe(dev, &dev->capture_param.timeperframe);
  2504		if (err)
  2505			goto out_unregister;
  2506		dev->keep_format = 0;
  2507		dev->sustain_framerate = 0;
  2508	
  2509		dev->announce_all_caps = exclusive_caps;
  2510		dev->min_width = V4L2L_MIN_WIDTH;
  2511		dev->min_height = V4L2L_MIN_HEIGHT;
  2512		dev->max_width = V4L2L_MAX_WIDTH;
  2513		dev->max_height = V4L2L_MAX_HEIGHT;
  2514		dev->max_openers = V4L2L_MAX_OPENERS;
  2515		dev->buffers_number = V4L2L_MAX_USED_BUFFERS;
  2516		dev->used_buffers = V4L2L_MAX_USED_BUFFERS;
  2517	
  2518		dev->write_position = 0;
  2519	
  2520		spin_lock_init(&dev->lock);
  2521		spin_lock_init(&dev->list_lock);
  2522		INIT_LIST_HEAD(&dev->outbufs_list);
  2523		if (list_empty(&dev->outbufs_list)) {
  2524			int i;
  2525	
  2526			for (i = 0; i < dev->used_buffers; ++i)
  2527				list_add_tail(&dev->buffers[i].list_head,
  2528					      &dev->outbufs_list);
  2529		}
  2530		memset(dev->bufpos2index, 0, sizeof(dev->bufpos2index));
  2531		atomic_set(&dev->open_count, 0);
  2532		dev->ready_for_capture = 0;
  2533		dev->ready_for_output = 1;
  2534	
  2535		dev->buffer_size = 0;
  2536		dev->image = NULL;
  2537		dev->imagesize = 0;
  2538		timer_setup(&dev->sustain_timer, sustain_timer_clb, 0);
  2539		timer_setup(&dev->timeout_timer, timeout_timer_clb, 0);
  2540		dev->reread_count = 0;
  2541		dev->timeout_jiffies = 0;
  2542		dev->timeout_image = NULL;
  2543		dev->timeout_happened = 0;
  2544	
  2545		hdl = &dev->ctrl_handler;
  2546		err = v4l2_ctrl_handler_init(hdl, 4);
  2547		if (err)
  2548			goto out_unregister;
  2549		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_keepformat, NULL);
  2550		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_sustainframerate, NULL);
  2551		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_timeout, NULL);
  2552		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_timeoutimageio, NULL);
  2553		if (hdl->error) {
  2554			err = hdl->error;
  2555			goto out_free_handler;
  2556		}
  2557		dev->v4l2_dev.ctrl_handler = hdl;
  2558	
  2559		err = v4l2_ctrl_handler_setup(hdl);
  2560		if (err)
  2561			goto out_free_handler;
  2562	
  2563		/* TODO: Zero buffers. */
  2564	
  2565		dev->pix_format.width = V4L2L_DEFAULT_WIDTH;
  2566		dev->pix_format.height = V4L2L_DEFAULT_HEIGHT;
  2567		dev->pix_format.pixelformat = formats[0].fourcc;
  2568		dev->pix_format.colorspace =
  2569			V4L2_COLORSPACE_DEFAULT; /* do we need to set this ? */
  2570		dev->pix_format.field = V4L2_FIELD_NONE;
  2571	
  2572		dev->buffer_size = PAGE_ALIGN(dev->pix_format.sizeimage);
  2573		pr_debug("buffer_size = %ld (=%d)\n", dev->buffer_size,
  2574			 dev->pix_format.sizeimage);
  2575		if (dev->buffer_size && ((err = allocate_buffers(dev)) < 0))
  2576			goto out_free_handler;
  2577	
  2578		init_waitqueue_head(&dev->read_event);
  2579	
  2580		err = video_register_device(dev->vdev, VFL_TYPE_VIDEO, nr);
  2581		if (err) {
  2582			pr_err("failed to register video device\n");
  2583			goto out_free_device;
  2584		}
  2585	
  2586		conf->device_nr = dev->vdev->num;
  2587		/* TODO Return anonymous inode for writing stream. */
  2588		conf->card_fd = 0;
  2589		return 0;
  2590	
  2591	out_free_device:
  2592		video_device_release(dev->vdev);
  2593	
  2594	out_free_handler:
  2595		v4l2_ctrl_handler_free(&dev->ctrl_handler);
  2596	
  2597	out_unregister:
  2598		video_set_drvdata(dev->vdev, NULL);
  2599		kfree(vdev_priv);
  2600		v4l2_device_unregister(&dev->v4l2_dev);
  2601	
  2602	out_free_idr:
  2603		idr_remove(&v4l2l_index_idr, nr);
  2604		kfree(dev);
  2605		return err;
  2606	}
  2607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
