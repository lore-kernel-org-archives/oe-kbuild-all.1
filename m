Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E5D146580
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735879933; cv=none; b=sEC81MqsANwwE7sHOy9KGPGp2D3tnulomV3iWHizgJV7mO/zvWGQUVrZjErditak/nZQ30fQUNGJy0a9aJPY+fKzD66/j+9cTGLItWTKr5F+xj4Xbe2jewOG+AzJzYYda3RhPZFYOO80wlTlE4GSgz0QzPYC7PgcpOGNU0FxLgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735879933; c=relaxed/simple;
	bh=tIGYFSe8fCGm+25sY1GDscZsOEWh/BF6mHdHWB5pqmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+5DPQTD4g1gnCNCHfIv/7ZzVBxmApyRRk5c2rkloGpfoEoVSHYCfr9t8yqxyNLcS7/vwYCpHhIUSDZUGumbR4Oy56JjdnZiRivflT659OkHnb/GlLzZwh2EmFzkd0RnJWTHSzFVpHCts+b/Ui0k4DXKwlJwTyPFFCn4S52AWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h78YOpYL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h78YOpYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735879932; x=1767415932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tIGYFSe8fCGm+25sY1GDscZsOEWh/BF6mHdHWB5pqmA=;
  b=h78YOpYLsSbw225P72M04eKjhkJXLbEjs7xmyfmR8Cjw6ykCaq0ANaW7
   Y+IEUi01vCn340XSMNTT5kqBVGzGC+jQuEUnF42dVb5XNQHfSDFjjZk+z
   EPCb0vh56hMnTkQ8h70lAzFy11PfU78rc6/0yMlOcU+5vqnQKvcEWmBuf
   xYgi4s5Ine046rjMQ7fJdSGxsqqcwvUm4W9KWM5FCSQtCjnyPHlg9Uq39
   UEBgtxzCFkfphpiBrt5dJuNayc0GRNJL8gB0ZuV4ZIiRi0rOxTqppRSSd
   DlDEUxjFWEbqNECKx2jMJULEflWDyGNjzwmOcVEMV/7gvNG4tNAeaxLt2
   A==;
X-CSE-ConnectionGUID: Vzf3eonEQEmCw1xgm+oQhQ==
X-CSE-MsgGUID: mubJaQ97Qdm8Yr6DKJWYNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="38953126"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="38953126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 20:52:09 -0800
X-CSE-ConnectionGUID: zjy84SSEQWC6Q2HWP6Nu2Q==
X-CSE-MsgGUID: +lpddtohT+WGrkHZKu3enw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102193554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jan 2025 20:52:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTZfJ-0009E9-2H;
	Fri, 03 Jan 2025 04:52:05 +0000
Date: Fri, 3 Jan 2025 12:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/3]
 drivers/media/v4l2-core/v4l2-loopback.c:2918:61: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202501031201.wsUl5GoV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   77ded3bb83b3454b62521baaa44f0faabcf1aa39
commit: 62ee7cf235fa52381d3170035469abfd1057c6f7 [2/3] media: v4l2-loopback
config: i386-randconfig-061-20241230 (https://download.01.org/0day-ci/archive/20250103/202501031201.wsUl5GoV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031201.wsUl5GoV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031201.wsUl5GoV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/v4l2-core/v4l2-loopback.c:2030:40: sparse: sparse: symbol 'client_usage_ops' was not declared. Should it be static?
   drivers/media/v4l2-core/v4l2-loopback.c:2173:13: sparse: sparse: restricted __poll_t degrades to integer
   drivers/media/v4l2-core/v4l2-loopback.c:2291:27: sparse: sparse: cast removes address space '__user' of expression
   drivers/media/v4l2-core/v4l2-loopback.c:2291:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2291:27: sparse:     expected void [noderef] __user *to
   drivers/media/v4l2-core/v4l2-loopback.c:2291:27: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:2345:65: sparse: sparse: cast removes address space '__user' of expression
   drivers/media/v4l2-core/v4l2-loopback.c:2345:65: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2345:65: sparse:     expected void const [noderef] __user *from
   drivers/media/v4l2-core/v4l2-loopback.c:2345:65: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:2873:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2873:59: sparse:     expected void const [noderef] __user *from
   drivers/media/v4l2-core/v4l2-loopback.c:2873:59: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:2901:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2901:51: sparse:     expected void const [noderef] __user *from
   drivers/media/v4l2-core/v4l2-loopback.c:2901:51: sparse:     got void *
>> drivers/media/v4l2-core/v4l2-loopback.c:2918:61: sparse: sparse: Using plain integer as NULL pointer
   drivers/media/v4l2-core/v4l2-loopback.c:2925:60: sparse: sparse: Using plain integer as NULL pointer
   drivers/media/v4l2-core/v4l2-loopback.c:2946:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/media/v4l2-core/v4l2-loopback.c:2946:35: sparse:     expected void [noderef] __user *to
   drivers/media/v4l2-core/v4l2-loopback.c:2946:35: sparse:     got void *
   drivers/media/v4l2-core/v4l2-loopback.c:2989:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/media/v4l2-core/v4l2-loopback.c:2989:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/media/v4l2-core/v4l2-loopback.c:2989:27: sparse:     got unsigned int ( * )( ... )
   drivers/media/v4l2-core/v4l2-loopback.c:3139:47: sparse: sparse: Using plain integer as NULL pointer
   drivers/media/v4l2-core/v4l2-loopback.c:2636:53: sparse: sparse: self-comparison always evaluates to true

vim +2918 drivers/media/v4l2-core/v4l2-loopback.c

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
  2893			};
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
> 2918			    ((ret = v4l2loopback_lookup(capture_nr, 0)) < 0))
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
