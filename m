Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775F6A332
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733044308; cv=none; b=g7Bbqt7+9lwPZ6IpeNPmyTFQ2l+2TrNI0jB2SzDq+8vT+foADZRCxpTWcJmxcgVPyyBor/P6eBR05ej8rhZ7GMTO0J4AOpms9vKXvyDkjf5Hsu8e68M+7jAB67Oez0YQYBgjbuW2szBRszHIDA7fOLNn50iHl+X3ilKl3aoHjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733044308; c=relaxed/simple;
	bh=EUVKCkg6RRydzQ9YKGhjSlXy0SZza3CXdzIELpOS9yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VC5Qpj4e5kMUMr1+ap8LBhg3aY3fJCTyvzoRgIYL/a2Pe/fIPIUCdvgbBztErRECsVf5uiu1iSRJDSg3rqugFrHhaSu5Lfh7E7OQCpFmhWbC3m/5WrIBu6/JjPlRGwBIpFhfN1k7HvWmP6Kclv2kjzUA0S37TzSi79EBgO1Mk8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsqJID+7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsqJID+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733044306; x=1764580306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EUVKCkg6RRydzQ9YKGhjSlXy0SZza3CXdzIELpOS9yQ=;
  b=CsqJID+7KrT5BO/hryqh6hA4AoGZKxlyDantgeO3zy3UVeGlpdIT1sKV
   Dl2zV2kY73ZxUzKzb0ToBVajjqzcVkL8/ii/IdnUrv+AMit9auvQBjiZr
   0xRHbkWFKKrc9W5Wz7JQMyh4AGkoE4IMqqsVNjRlzcosrp6UY8GXGPHHk
   CPCK49EXqfIZ5xCPpvY6NMRuu8Iph5CMLB/ZamUSZl1rvuYwjXYwnXB4p
   ceng7S5MMZ+uVj+E4xLc6yZSewyPpqhtZLQoMcJmUodUoIGRgCDDy7sf6
   yJQhbvJ/PA4558xPkcI33d4Jqsr7AGGDFSTZ6H6LEeDT88wiO9R2XTbxX
   w==;
X-CSE-ConnectionGUID: /2neo9yHQV6QYXItnjdKwQ==
X-CSE-MsgGUID: ///phDSsQzyFWYDarkPWOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="58614807"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="58614807"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 01:11:46 -0800
X-CSE-ConnectionGUID: 8/UroO1vTHa0sLUnO8u+uQ==
X-CSE-MsgGUID: bA/4TS/sRc21T7zYUsLFdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="96910262"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Dec 2024 01:11:40 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHfy1-0001PZ-1r;
	Sun, 01 Dec 2024 09:10:42 +0000
Date: Sun, 1 Dec 2024 17:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback-dev 36/36]
 drivers/media/v4l2-core/v4l2-loopback.c:2115:43: warning: cast to pointer
 from integer of different size
Message-ID: <202412011712.ZnFCRp1t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback-dev
head:   e9e580c2c0c82531940eaad3597b95fe5a09cb10
commit: e9e580c2c0c82531940eaad3597b95fe5a09cb10 [36/36] media: v4l2-loopback: Refine the ioctl API
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241201/202412011712.ZnFCRp1t-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011712.ZnFCRp1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011712.ZnFCRp1t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-loopback.c: In function 'inner_try_setfmt':
   drivers/media/v4l2-core/v4l2-loopback.c:419:14: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
     419 |         char buf[5];
         |              ^~~
   drivers/media/v4l2-core/v4l2-loopback.c: In function 'vidioc_s_fmt_out':
   drivers/media/v4l2-core/v4l2-loopback.c:1247:14: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
    1247 |         char buf[5];
         |              ^~~
   drivers/media/v4l2-core/v4l2-loopback.c: In function 'v4l2_loopback_add':
>> drivers/media/v4l2-core/v4l2-loopback.c:2115:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2115 |         if (strncpy_from_user(card_label, (char __user *)conf->card_label,
         |                                           ^


vim +2115 drivers/media/v4l2-core/v4l2-loopback.c

  2104	
  2105	static int v4l2_loopback_add(struct v4l2_loopback_add *conf)
  2106	{
  2107		struct v4l2l_private *vdev_priv = NULL;
  2108		char card_label[V4L2L_MAX_CARD_NAME];
  2109		struct v4l2_loopback_device *dev;
  2110		struct v4l2_ctrl_handler *hdl;
  2111		bool exclusive_caps = false;
  2112		int err;
  2113		int nr;
  2114	
> 2115		if (strncpy_from_user(card_label, (char __user *)conf->card_label,
  2116				      V4L2L_MAX_CARD_NAME - 1) < 0)
  2117			return -EFAULT;
  2118		if (conf->flags & ~1)
  2119			return -EINVAL;
  2120		if (conf->flags)
  2121			exclusive_caps = true;
  2122		if (conf->device_nr)
  2123			return -EINVAL;
  2124		if (conf->card_fd)
  2125			return -EINVAL;
  2126	
  2127		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
  2128		if (!dev)
  2129			return -ENOMEM;
  2130	
  2131		nr = idr_alloc(&v4l2l_index_idr, dev, 0, 0, GFP_KERNEL);
  2132		if (nr < 0) {
  2133			kfree(dev);
  2134			return nr;
  2135		}
  2136	
  2137		snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
  2138			 "v4l2loopback-%03d", nr);
  2139	
  2140		err = v4l2_device_register(NULL, &dev->v4l2_dev);
  2141		if (err)
  2142			goto out_free_idr;
  2143	
  2144		dev->vdev = video_device_alloc();
  2145		if (dev->vdev == NULL) {
  2146			err = -ENOMEM;
  2147			goto out_unregister;
  2148		}
  2149	
  2150		vdev_priv = kzalloc(sizeof(struct v4l2l_private), GFP_KERNEL);
  2151		if (vdev_priv == NULL) {
  2152			err = -ENOMEM;
  2153			goto out_unregister;
  2154		}
  2155	
  2156		video_set_drvdata(dev->vdev, vdev_priv);
  2157		if (video_get_drvdata(dev->vdev) == NULL) {
  2158			err = -ENOMEM;
  2159			goto out_unregister;
  2160		}
  2161	
  2162		snprintf(dev->vdev->name, sizeof(dev->vdev->name), "%s",
  2163			 dev->card_label);
  2164	
  2165		vdev_priv->device_nr = nr;
  2166	
  2167		init_vdev(dev->vdev, nr);
  2168		dev->vdev->v4l2_dev = &dev->v4l2_dev;
  2169		init_capture_param(&dev->capture_param);
  2170		err = set_timeperframe(dev, &dev->capture_param.timeperframe);
  2171		if (err)
  2172			goto out_unregister;
  2173		dev->keep_format = 0;
  2174		dev->sustain_framerate = 0;
  2175	
  2176		dev->announce_all_caps = exclusive_caps;
  2177		dev->min_width = V4L2L_MIN_WIDTH;
  2178		dev->min_height = V4L2L_MIN_HEIGHT;
  2179		dev->max_width = V4L2L_MAX_WIDTH;
  2180		dev->max_height = V4L2L_MAX_HEIGHT;
  2181		dev->max_openers = V4L2L_MAX_OPENERS;
  2182		dev->buffers_number = V4L2L_MAX_USED_BUFFERS;
  2183		dev->used_buffers = V4L2L_MAX_USED_BUFFERS;
  2184	
  2185		dev->write_position = 0;
  2186	
  2187		spin_lock_init(&dev->lock);
  2188		spin_lock_init(&dev->list_lock);
  2189		INIT_LIST_HEAD(&dev->outbufs_list);
  2190		if (list_empty(&dev->outbufs_list)) {
  2191			int i;
  2192	
  2193			for (i = 0; i < dev->used_buffers; ++i)
  2194				list_add_tail(&dev->buffers[i].list_head,
  2195					      &dev->outbufs_list);
  2196		}
  2197		memset(dev->bufpos2index, 0, sizeof(dev->bufpos2index));
  2198		atomic_set(&dev->open_count, 0);
  2199		dev->ready_for_capture = 0;
  2200		dev->ready_for_output = 1;
  2201	
  2202		dev->buffer_size = 0;
  2203		dev->image = NULL;
  2204		dev->imagesize = 0;
  2205		timer_setup(&dev->sustain_timer, sustain_timer_clb, 0);
  2206		timer_setup(&dev->timeout_timer, timeout_timer_clb, 0);
  2207		dev->reread_count = 0;
  2208		dev->timeout_jiffies = 0;
  2209		dev->timeout_image = NULL;
  2210		dev->timeout_happened = 0;
  2211	
  2212		hdl = &dev->ctrl_handler;
  2213		err = v4l2_ctrl_handler_init(hdl, 4);
  2214		if (err)
  2215			goto out_unregister;
  2216		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_keepformat, NULL);
  2217		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_sustainframerate, NULL);
  2218		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_timeout, NULL);
  2219		v4l2_ctrl_new_custom(hdl, &v4l2l_ctrl_timeoutimageio, NULL);
  2220		if (hdl->error) {
  2221			err = hdl->error;
  2222			goto out_free_handler;
  2223		}
  2224		dev->v4l2_dev.ctrl_handler = hdl;
  2225	
  2226		err = v4l2_ctrl_handler_setup(hdl);
  2227		if (err)
  2228			goto out_free_handler;
  2229	
  2230		/* TODO: Zero buffers. */
  2231	
  2232		dev->pix_format.width = V4L2L_WIDTH;
  2233		dev->pix_format.height = V4L2L_HEIGHT;
  2234		dev->pix_format.pixelformat = formats[0].fourcc;
  2235		dev->pix_format.colorspace =
  2236			V4L2_COLORSPACE_DEFAULT; /* do we need to set this ? */
  2237		dev->pix_format.field = V4L2_FIELD_NONE;
  2238	
  2239		dev->buffer_size = PAGE_ALIGN(dev->pix_format.sizeimage);
  2240		pr_debug("buffer_size = %ld (=%d)\n", dev->buffer_size,
  2241			 dev->pix_format.sizeimage);
  2242		if (dev->buffer_size && ((err = allocate_buffers(dev)) < 0))
  2243			goto out_free_handler;
  2244	
  2245		init_waitqueue_head(&dev->read_event);
  2246	
  2247		err = video_register_device(dev->vdev, VFL_TYPE_VIDEO, nr);
  2248		if (err) {
  2249			pr_err("failed to register video device\n");
  2250			goto out_free_device;
  2251		}
  2252	
  2253		conf->device_nr = dev->vdev->num;
  2254		/* TODO Return anonymous inode for writing stream. */
  2255		conf->card_fd = 0;
  2256		return 0;
  2257	
  2258	out_free_device:
  2259		video_device_release(dev->vdev);
  2260	
  2261	out_free_handler:
  2262		v4l2_ctrl_handler_free(&dev->ctrl_handler);
  2263	
  2264	out_unregister:
  2265		video_set_drvdata(dev->vdev, NULL);
  2266		kfree(vdev_priv);
  2267		v4l2_device_unregister(&dev->v4l2_dev);
  2268	
  2269	out_free_idr:
  2270		idr_remove(&v4l2l_index_idr, nr);
  2271		kfree(dev);
  2272		return err;
  2273	}
  2274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
