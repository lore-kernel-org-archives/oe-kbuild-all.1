Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616C186E40
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 08:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732436106; cv=none; b=kDwUntiNmY1s6UhLbN792N1L+dpoynpU+Hqr/pnJGMxatiLpamaGf2fZ5R5oAZneVCN1lVMTutWXfQw37C4a1oKyXfKg9Mm0QIantZTqifgCJb6pTPB5dbSvioL68bCnAA374rfNbNrk4wvRg+sM+cNpNGYidHnTN/Xzbjo2DxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732436106; c=relaxed/simple;
	bh=kkDv95+Z3qVb07h619dNl7UMQx5NhP1NMoulW18xUtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3nIVi9/xqHwbEQM7wjq3VfuGe+8vGQvS3h6iKtSTM7tHm8fOXuYEegmNwPuFl5vbnr2UhkRTmFVA+pk/oY5j1OSzERxE6WBzKzDVl8CljdMJY/RpMaCqUuSYoHiQ+Kg8rrC9MANJWQmAprlw0+vWUnsXw9aqiMJySs8vd6YpG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpvY8Nnv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpvY8Nnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732436104; x=1763972104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkDv95+Z3qVb07h619dNl7UMQx5NhP1NMoulW18xUtU=;
  b=jpvY8NnvWs4m2z0U7DbfNFqnW4NMFV18Er+M2NIX5BlXcH5gRYpwqJKK
   KBX1KQS0Q/aG1kJKfvy6q2pZlROu7GamhpVCzYBj6TTAiBu+9h8wvESj8
   9Y1JUS2T5OAGIO6j6ZC7P8WmPuTHSTcouGMw98X2CNA+R//B7nTPbjXdg
   3yt6cxfA3HbKlF1eu9F6U/p6cPJr+ub3xyFwTdnn81VtVrCqVbuRKjhd9
   EN+eah6vvHlBVppz1A+8+umF4kXtACjNUsMw1MN7Ez7MTMnp4Pz/JmBXn
   TWNVSe8NyTUk/jYPbd07ssQhXPfMyj9YnZPGNcojV/Sjf0N3SvDsd08Nt
   g==;
X-CSE-ConnectionGUID: EjOjHMuKRlm8SlgWRg6rBg==
X-CSE-MsgGUID: +GLzL+yRTlqM5ls9pmEpVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="36326001"
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="36326001"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 00:15:03 -0800
X-CSE-ConnectionGUID: ykZjCTDFRnGr4M7km2n+1A==
X-CSE-MsgGUID: CkuQfjB8TAqDzO7MtpY/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96040189"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2024 00:15:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tF7lk-0004wb-00;
	Sun, 24 Nov 2024 08:15:00 +0000
Date: Sun, 24 Nov 2024 16:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback-dev 6/16]
 drivers/media/v4l2-core/v4l2-loopback.c:2832:2-7: WARNING: NULL check before
 some freeing functions is not needed.
Message-ID: <202411241625.pfoe9rHc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback-dev
head:   520e4971b3472a7b8822f07eb85b74f890158023
commit: 073bd4bf72f75ae932769859c7cdeb9437bc7060 [6/16] media: v4l2-loopback: Import the driver
config: alpha-randconfig-r061-20241124 (https://download.01.org/0day-ci/archive/20241124/202411241625.pfoe9rHc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411241625.pfoe9rHc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-loopback.c:2832:2-7: WARNING: NULL check before some freeing functions is not needed.
--
>> drivers/media/v4l2-core/v4l2-loopback.c:594:5-11: Unneeded variable: "result". Return "1" on line 599
--
>> drivers/media/v4l2-core/v4l2-loopback.c:2893:3-4: Unneeded semicolon

vim +2832 drivers/media/v4l2-core/v4l2-loopback.c

  2591	
  2592	/* init loopback main structure */
  2593	#define DEFAULT_FROM_CONF(confmember, default_condition, default_value)        \
  2594		((conf) ?                                                              \
  2595			 ((conf->confmember default_condition) ? (default_value) :     \
  2596								 (conf->confmember)) : \
  2597			 default_value)
  2598	
  2599	static int v4l2_loopback_add(struct v4l2_loopback_config *conf, int *ret_nr)
  2600	{
  2601		struct v4l2_loopback_device *dev;
  2602		struct v4l2_ctrl_handler *hdl;
  2603		struct v4l2loopback_private *vdev_priv = NULL;
  2604	
  2605		int err = -ENOMEM;
  2606	
  2607		u32 _width = V4L2LOOPBACK_SIZE_DEFAULT_WIDTH;
  2608		u32 _height = V4L2LOOPBACK_SIZE_DEFAULT_HEIGHT;
  2609	
  2610		u32 _min_width = DEFAULT_FROM_CONF(min_width,
  2611						   < V4L2LOOPBACK_SIZE_MIN_WIDTH,
  2612						   V4L2LOOPBACK_SIZE_MIN_WIDTH);
  2613		u32 _min_height = DEFAULT_FROM_CONF(min_height,
  2614						    < V4L2LOOPBACK_SIZE_MIN_HEIGHT,
  2615						    V4L2LOOPBACK_SIZE_MIN_HEIGHT);
  2616		u32 _max_width = DEFAULT_FROM_CONF(max_width, < _min_width, max_width);
  2617		u32 _max_height =
  2618			DEFAULT_FROM_CONF(max_height, < _min_height, max_height);
  2619		bool _announce_all_caps = (conf && conf->announce_all_caps >= 0) ?
  2620						  (conf->announce_all_caps) :
  2621						  V4L2LOOPBACK_DEFAULT_EXCLUSIVECAPS;
  2622		int _max_buffers = DEFAULT_FROM_CONF(max_buffers, <= 0, max_buffers);
  2623		int _max_openers = DEFAULT_FROM_CONF(max_openers, <= 0, max_openers);
  2624	
  2625		int nr = -1;
  2626	
  2627		_announce_all_caps = (!!_announce_all_caps);
  2628	
  2629		if (conf) {
  2630			const int output_nr = conf->output_nr;
  2631	#ifdef SPLIT_DEVICES
  2632			const int capture_nr = conf->capture_nr;
  2633	#else
  2634			const int capture_nr = output_nr;
  2635	#endif
  2636			if (capture_nr >= 0 && output_nr == capture_nr) {
  2637				nr = output_nr;
  2638			} else if (capture_nr < 0 && output_nr < 0) {
  2639				nr = -1;
  2640			} else if (capture_nr < 0) {
  2641				nr = output_nr;
  2642			} else if (output_nr < 0) {
  2643				nr = capture_nr;
  2644			} else {
  2645				printk(KERN_ERR
  2646				       "split OUTPUT and CAPTURE devices not yet supported.");
  2647				printk(KERN_INFO
  2648				       "both devices must have the same number (%d != %d).",
  2649				       output_nr, capture_nr);
  2650				return -EINVAL;
  2651			}
  2652		}
  2653	
  2654		if (idr_find(&v4l2loopback_index_idr, nr))
  2655			return -EEXIST;
  2656	
  2657		dprintk("creating v4l2loopback-device #%d\n", nr);
  2658		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
  2659		if (!dev)
  2660			return -ENOMEM;
  2661	
  2662		/* allocate id, if @id >= 0, we're requesting that specific id */
  2663		if (nr >= 0) {
  2664			err = idr_alloc(&v4l2loopback_index_idr, dev, nr, nr + 1,
  2665					GFP_KERNEL);
  2666			if (err == -ENOSPC)
  2667				err = -EEXIST;
  2668		} else {
  2669			err = idr_alloc(&v4l2loopback_index_idr, dev, 0, 0, GFP_KERNEL);
  2670		}
  2671		if (err < 0)
  2672			goto out_free_dev;
  2673		nr = err;
  2674		err = -ENOMEM;
  2675	
  2676		if (conf && conf->card_label[0]) {
  2677			snprintf(dev->card_label, sizeof(dev->card_label), "%s",
  2678				 conf->card_label);
  2679		} else {
  2680			snprintf(dev->card_label, sizeof(dev->card_label),
  2681				 "Dummy video device (0x%04X)", nr);
  2682		}
  2683		snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
  2684			 "v4l2loopback-%03d", nr);
  2685	
  2686		err = v4l2_device_register(NULL, &dev->v4l2_dev);
  2687		if (err)
  2688			goto out_free_idr;
  2689		MARK();
  2690	
  2691		dev->vdev = video_device_alloc();
  2692		if (dev->vdev == NULL) {
  2693			err = -ENOMEM;
  2694			goto out_unregister;
  2695		}
  2696	
  2697		vdev_priv = kzalloc(sizeof(struct v4l2loopback_private), GFP_KERNEL);
  2698		if (vdev_priv == NULL) {
  2699			err = -ENOMEM;
  2700			goto out_unregister;
  2701		}
  2702	
  2703		video_set_drvdata(dev->vdev, vdev_priv);
  2704		if (video_get_drvdata(dev->vdev) == NULL) {
  2705			err = -ENOMEM;
  2706			goto out_unregister;
  2707		}
  2708	
  2709		MARK();
  2710		snprintf(dev->vdev->name, sizeof(dev->vdev->name), "%s",
  2711			 dev->card_label);
  2712	
  2713		vdev_priv->device_nr = nr;
  2714	
  2715		init_vdev(dev->vdev, nr);
  2716		dev->vdev->v4l2_dev = &dev->v4l2_dev;
  2717		init_capture_param(&dev->capture_param);
  2718		err = set_timeperframe(dev, &dev->capture_param.timeperframe);
  2719		if (err)
  2720			goto out_unregister;
  2721		dev->keep_format = 0;
  2722		dev->sustain_framerate = 0;
  2723	
  2724		dev->announce_all_caps = _announce_all_caps;
  2725		dev->min_width = _min_width;
  2726		dev->min_height = _min_height;
  2727		dev->max_width = _max_width;
  2728		dev->max_height = _max_height;
  2729		dev->max_openers = _max_openers;
  2730		dev->buffers_number = dev->used_buffers = _max_buffers;
  2731	
  2732		dev->write_position = 0;
  2733	
  2734		MARK();
  2735		spin_lock_init(&dev->lock);
  2736		spin_lock_init(&dev->list_lock);
  2737		INIT_LIST_HEAD(&dev->outbufs_list);
  2738		if (list_empty(&dev->outbufs_list)) {
  2739			int i;
  2740	
  2741			for (i = 0; i < dev->used_buffers; ++i)
  2742				list_add_tail(&dev->buffers[i].list_head,
  2743					      &dev->outbufs_list);
  2744		}
  2745		memset(dev->bufpos2index, 0, sizeof(dev->bufpos2index));
  2746		atomic_set(&dev->open_count, 0);
  2747		dev->ready_for_capture = 0;
  2748		dev->ready_for_output = 1;
  2749	
  2750		dev->buffer_size = 0;
  2751		dev->image = NULL;
  2752		dev->imagesize = 0;
  2753	#ifdef HAVE_TIMER_SETUP
  2754		timer_setup(&dev->sustain_timer, sustain_timer_clb, 0);
  2755		timer_setup(&dev->timeout_timer, timeout_timer_clb, 0);
  2756	#else
  2757		setup_timer(&dev->sustain_timer, sustain_timer_clb, nr);
  2758		setup_timer(&dev->timeout_timer, timeout_timer_clb, nr);
  2759	#endif
  2760		dev->reread_count = 0;
  2761		dev->timeout_jiffies = 0;
  2762		dev->timeout_image = NULL;
  2763		dev->timeout_happened = 0;
  2764	
  2765		hdl = &dev->ctrl_handler;
  2766		err = v4l2_ctrl_handler_init(hdl, 4);
  2767		if (err)
  2768			goto out_unregister;
  2769		v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_keepformat, NULL);
  2770		v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_sustainframerate, NULL);
  2771		v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_timeout, NULL);
  2772		v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_timeoutimageio, NULL);
  2773		if (hdl->error) {
  2774			err = hdl->error;
  2775			goto out_free_handler;
  2776		}
  2777		dev->v4l2_dev.ctrl_handler = hdl;
  2778	
  2779		err = v4l2_ctrl_handler_setup(hdl);
  2780		if (err)
  2781			goto out_free_handler;
  2782	
  2783		/* FIXME set buffers to 0 */
  2784	
  2785		/* Set initial format */
  2786		if (_width < _min_width)
  2787			_width = _min_width;
  2788		if (_width > _max_width)
  2789			_width = _max_width;
  2790		if (_height < _min_height)
  2791			_height = _min_height;
  2792		if (_height > _max_height)
  2793			_height = _max_height;
  2794	
  2795		dev->pix_format.width = _width;
  2796		dev->pix_format.height = _height;
  2797		dev->pix_format.pixelformat = formats[0].fourcc;
  2798		dev->pix_format.colorspace =
  2799			V4L2_COLORSPACE_DEFAULT; /* do we need to set this ? */
  2800		dev->pix_format.field = V4L2_FIELD_NONE;
  2801	
  2802		dev->buffer_size = PAGE_ALIGN(dev->pix_format.sizeimage);
  2803		dprintk("buffer_size = %ld (=%d)\n", dev->buffer_size,
  2804			dev->pix_format.sizeimage);
  2805	
  2806		if (dev->buffer_size && ((err = allocate_buffers(dev)) < 0))
  2807			goto out_free_handler;
  2808	
  2809		init_waitqueue_head(&dev->read_event);
  2810	
  2811		/* register the device -> it creates /dev/video* */
  2812		if (video_register_device(dev->vdev, VFL_TYPE_VIDEO, nr) < 0) {
  2813			printk(KERN_ERR
  2814			       "v4l2loopback: failed video_register_device()\n");
  2815			err = -EFAULT;
  2816			goto out_free_device;
  2817		}
  2818		v4l2loopback_create_sysfs(dev->vdev);
  2819	
  2820		MARK();
  2821		if (ret_nr)
  2822			*ret_nr = dev->vdev->num;
  2823		return 0;
  2824	
  2825	out_free_device:
  2826		video_device_release(dev->vdev);
  2827	out_free_handler:
  2828		v4l2_ctrl_handler_free(&dev->ctrl_handler);
  2829	out_unregister:
  2830		video_set_drvdata(dev->vdev, NULL);
  2831		if (vdev_priv != NULL)
> 2832			kfree(vdev_priv);
  2833		v4l2_device_unregister(&dev->v4l2_dev);
  2834	out_free_idr:
  2835		idr_remove(&v4l2loopback_index_idr, nr);
  2836	out_free_dev:
  2837		kfree(dev);
  2838		return err;
  2839	}
  2840	
  2841	static void v4l2_loopback_remove(struct v4l2_loopback_device *dev)
  2842	{
  2843		free_buffers(dev);
  2844		v4l2loopback_remove_sysfs(dev->vdev);
  2845		kfree(video_get_drvdata(dev->vdev));
  2846		video_unregister_device(dev->vdev);
  2847		v4l2_device_unregister(&dev->v4l2_dev);
  2848		v4l2_ctrl_handler_free(&dev->ctrl_handler);
  2849		kfree(dev);
  2850	}
  2851	
  2852	static long v4l2loopback_control_ioctl(struct file *file, unsigned int cmd,
  2853					       unsigned long parm)
  2854	{
  2855		struct v4l2_loopback_device *dev;
  2856		struct v4l2_loopback_config conf;
  2857		struct v4l2_loopback_config *confptr = &conf;
  2858		int device_nr, capture_nr, output_nr;
  2859		int ret;
  2860	
  2861		ret = mutex_lock_killable(&v4l2loopback_ctl_mutex);
  2862		if (ret)
  2863			return ret;
  2864	
  2865		ret = -EINVAL;
  2866		switch (cmd) {
  2867		default:
  2868			ret = -ENOSYS;
  2869			break;
  2870			/* add a v4l2loopback device (pair), based on the user-provided specs */
  2871		case V4L2LOOPBACK_CTL_ADD:
  2872			if (parm) {
  2873				if ((ret = copy_from_user(&conf, (void *)parm,
  2874							  sizeof(conf))) < 0)
  2875					break;
  2876			} else
  2877				confptr = NULL;
  2878			ret = v4l2_loopback_add(confptr, &device_nr);
  2879			if (ret >= 0)
  2880				ret = device_nr;
  2881			break;
  2882			/* remove a v4l2loopback device (both capture and output) */
  2883		case V4L2LOOPBACK_CTL_REMOVE:
  2884			ret = v4l2loopback_lookup((int)parm, &dev);
  2885			if (ret >= 0 && dev) {
  2886				int nr = ret;
  2887				ret = -EBUSY;
  2888				if (dev->open_count.counter > 0)
  2889					break;
  2890				idr_remove(&v4l2loopback_index_idr, nr);
  2891				v4l2_loopback_remove(dev);
  2892				ret = 0;
> 2893			};
  2894			break;
  2895			/* get information for a loopback device.
  2896			 * this is mostly about limits (which cannot be queried directly with  VIDIOC_G_FMT and friends
  2897			 */
  2898		case V4L2LOOPBACK_CTL_QUERY:
  2899			if (!parm)
  2900				break;
  2901			if ((ret = copy_from_user(&conf, (void *)parm, sizeof(conf))) <
  2902			    0)
  2903				break;
  2904			capture_nr = output_nr = conf.output_nr;
  2905	#ifdef SPLIT_DEVICES
  2906			capture_nr = conf.capture_nr;
  2907	#endif
  2908			device_nr = (output_nr < 0) ? capture_nr : output_nr;
  2909			MARK();
  2910			/* get the device from either capture_nr or output_nr (whatever is valid) */
  2911			if ((ret = v4l2loopback_lookup(device_nr, &dev)) < 0)
  2912				break;
  2913			MARK();
  2914			/* if we got the device from output_nr and there is a valid capture_nr,
  2915			 * make sure that both refer to the same device (or bail out)
  2916			 */
  2917			if ((device_nr != capture_nr) && (capture_nr >= 0) &&
  2918			    ((ret = v4l2loopback_lookup(capture_nr, 0)) < 0))
  2919				break;
  2920			MARK();
  2921			/* if otoh, we got the device from capture_nr and there is a valid output_nr,
  2922			 * make sure that both refer to the same device (or bail out)
  2923			 */
  2924			if ((device_nr != output_nr) && (output_nr >= 0) &&
  2925			    ((ret = v4l2loopback_lookup(output_nr, 0)) < 0))
  2926				break;
  2927			MARK();
  2928	
  2929			/* v4l2_loopback_config identified a single device, so fetch the data */
  2930			snprintf(conf.card_label, sizeof(conf.card_label), "%s",
  2931				 dev->card_label);
  2932			MARK();
  2933			conf.output_nr = dev->vdev->num;
  2934	#ifdef SPLIT_DEVICES
  2935			conf.capture_nr = dev->vdev->num;
  2936	#endif
  2937			conf.min_width = dev->min_width;
  2938			conf.min_height = dev->min_height;
  2939			conf.max_width = dev->max_width;
  2940			conf.max_height = dev->max_height;
  2941			conf.announce_all_caps = dev->announce_all_caps;
  2942			conf.max_buffers = dev->buffers_number;
  2943			conf.max_openers = dev->max_openers;
  2944			conf.debug = debug;
  2945			MARK();
  2946			if (copy_to_user((void *)parm, &conf, sizeof(conf))) {
  2947				ret = -EFAULT;
  2948				break;
  2949			}
  2950			MARK();
  2951			ret = 0;
  2952			;
  2953			break;
  2954		}
  2955	
  2956		MARK();
  2957		mutex_unlock(&v4l2loopback_ctl_mutex);
  2958		MARK();
  2959		return ret;
  2960	}
  2961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
