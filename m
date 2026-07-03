Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949AB3A9D84
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076326; cv=none; b=cKj41KPgx/hQIZIfZbF+r72fsw82te08mZM+oLE4cnAv/ndLEbPaOu2iCbYLPTevVTY/M//lQLZ7AFjFiMV7MKJU1BnqQgzOnSdDBDpx1yLBwnsO5GLldN6HDKTu4h+cFtDf12ayQd/UWTcNubRh3bA4ubF8HOYbY6yf+PHsA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076326; c=relaxed/simple;
	bh=VuqzVae8292TnsrkDkdwd+BJ3tlFKoRfvTOJP4cMrCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cJorW3NzqIOBSXKwNKLeg93qIecixXAXSC7Chqihy4dRY+3wM2On41xZmjQkXmPymAs0vBhIqrcHQ2HcAONjVryllB2A8at4i66E+wZ1HZeATeE0VPjYqxLhMUwWhIRQMe+GxC+wEpTsegcpIoU79jCUiaWBknn56Vg6a+dQ3IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCMd6WKd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCMd6WKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783076325; x=1814612325;
  h=date:from:to:cc:subject:message-id;
  bh=VuqzVae8292TnsrkDkdwd+BJ3tlFKoRfvTOJP4cMrCg=;
  b=cCMd6WKd56Cow9OlT4NhoOIUSKmLZWtBk0kqvM+SrLupk/mawuRnYCOq
   LK9lCiqBKu/g231NmYAWb8kp+7rt+tJ31Re2UNCq9pOUKYo6jpcdRJdcq
   wEJoCo5BN6ojDi3PrE79aOHTgdJ0p2Q7BoxDHXf9PuYtADLH5BtOwtExe
   rciTkBy098qct62ZE7v87KjwQaUfbo4LXhuOMVTRrvfFlPSwoFx5rEul9
   b7yXGdYe9Diwt9kMVzUOrTDVqv3ctNpXH6gO5qjYfVOpUFMHHL5wqUAWF
   Nh0RFAD2fjBrCXCGIIhjnrQnGJQucuh9606W/3lF4tlrCOxD10VZoVblt
   A==;
X-CSE-ConnectionGUID: D64me8waR2KLS65n+Cgpdw==
X-CSE-MsgGUID: NQc1z9x2TaytZx6y/L3aLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83959027"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83959027"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 03:58:44 -0700
X-CSE-ConnectionGUID: sbB5+F1QSGGpZ1nG5Y7iBg==
X-CSE-MsgGUID: 7Hoi4fTbTaW+AcBNCGVbNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277420874"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2026 03:58:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfbbT-00000000C1p-0K5u;
	Fri, 03 Jul 2026 10:58:39 +0000
Date: Fri, 03 Jul 2026 18:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dale Farnsworth <dale@farnsworth.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>, Benoit Parrot <bparrot@ti.com>,
 Sukrut Bellary <sbellary@baylibre.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: drivers/media/platform/ti/vpe/vip.c:3236:undefined reference
 to `v4l2_async_nf_unregister'
Message-ID: <202607031826.vOPABT39-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: fc2873aa4a21355593b55eb49ff534d31f81c584 media: ti: vpe: Add the VIP driver
date:   6 months ago
config: mips-randconfig-r061-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031826.vOPABT39-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031826.vOPABT39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031826.vOPABT39-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: drivers/media/platform/ti/vpe/vip.o: in function `free_port':
>> drivers/media/platform/ti/vpe/vip.c:3236:(.text+0x31b8): undefined reference to `v4l2_async_nf_unregister'
>> mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3237:(.text+0x31c0): undefined reference to `v4l2_async_nf_cleanup'
>> mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3236:(.text+0x31e8): undefined reference to `v4l2_async_nf_unregister'
   mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3237:(.text+0x31f0): undefined reference to `v4l2_async_nf_cleanup'
   mips64-linux-ld: drivers/media/platform/ti/vpe/vip.o: in function `vip_register_subdev_notify':
>> drivers/media/platform/ti/vpe/vip.c:3339:(.text.unlikely+0x9a8): undefined reference to `v4l2_fwnode_endpoint_parse'
>> mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3346:(.text.unlikely+0xa44): undefined reference to `v4l2_async_nf_init'
>> mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3348:(.text.unlikely+0xa54): undefined reference to `__v4l2_async_nf_add_fwnode'
>> mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3352:(.text.unlikely+0xadc): undefined reference to `v4l2_async_nf_cleanup'
>> mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3357:(.text.unlikely+0xb08): undefined reference to `v4l2_async_nf_register'
   mips64-linux-ld: drivers/media/platform/ti/vpe/vip.c:3360:(.text.unlikely+0xb80): undefined reference to `v4l2_async_nf_cleanup'


vim +3236 drivers/media/platform/ti/vpe/vip.c

  3230	
  3231	static void free_port(struct vip_port *port)
  3232	{
  3233		if (!port)
  3234			return;
  3235	
> 3236		v4l2_async_nf_unregister(&port->notifier);
> 3237		v4l2_async_nf_cleanup(&port->notifier);
  3238		free_stream(port->cap_streams[0]);
  3239	}
  3240	
  3241	static int get_field(u32 value, u32 mask, int shift)
  3242	{
  3243		return (value & (mask << shift)) >> shift;
  3244	}
  3245	
  3246	static int vip_probe_complete(struct platform_device *pdev);
  3247	static void vip_vpdma_fw_cb(struct platform_device *pdev)
  3248	{
  3249		dev_info(&pdev->dev, "VPDMA firmware loaded\n");
  3250	
  3251		if (pdev->dev.of_node)
  3252			vip_probe_complete(pdev);
  3253	}
  3254	
  3255	static int vip_create_streams(struct vip_port *port,
  3256				      struct v4l2_subdev *subdev)
  3257	{
  3258		int i;
  3259	
  3260		for (i = 0; i < VIP_CAP_STREAMS_PER_PORT; i++)
  3261			free_stream(port->cap_streams[i]);
  3262	
  3263		if (get_subdev_active_format(port, subdev))
  3264			return -ENODEV;
  3265	
  3266		port->subdev = subdev;
  3267	
  3268		if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL) {
  3269			port->flags |= FLAG_MULT_PORT;
  3270			port->num_streams_configured = 1;
  3271			alloc_stream(port, 0, VFL_TYPE_VIDEO);
  3272		} else if (port->endpoint.bus_type == V4L2_MBUS_BT656) {
  3273			port->flags |= FLAG_MULT_PORT;
  3274			port->num_streams_configured = 1;
  3275			alloc_stream(port, 0, VFL_TYPE_VIDEO);
  3276		}
  3277		return 0;
  3278	}
  3279	
  3280	static int vip_async_bound(struct v4l2_async_notifier *notifier,
  3281				   struct v4l2_subdev *subdev,
  3282				   struct v4l2_async_connection *asd)
  3283	{
  3284		struct vip_port *port = notifier_to_vip_port(notifier);
  3285		int ret;
  3286	
  3287		if (port->subdev) {
  3288			v4l2_info(&port->dev->v4l2_dev, "Rejecting subdev %s (Already set!!)",
  3289				  subdev->name);
  3290			return 0;
  3291		}
  3292	
  3293		v4l2_info(&port->dev->v4l2_dev, "Port %c: Using subdev %s for capture\n",
  3294			  port->port_id == VIP_PORTA ? 'A' : 'B', subdev->name);
  3295	
  3296		ret = vip_create_streams(port, subdev);
  3297		if (ret)
  3298			return ret;
  3299	
  3300		return 0;
  3301	}
  3302	
  3303	static int vip_async_complete(struct v4l2_async_notifier *notifier)
  3304	{
  3305		return 0;
  3306	}
  3307	
  3308	static const struct v4l2_async_notifier_operations vip_async_ops = {
  3309		.bound = vip_async_bound,
  3310		.complete = vip_async_complete,
  3311	};
  3312	
  3313	static struct fwnode_handle *
  3314	fwnode_graph_get_next_endpoint_by_regs(const struct fwnode_handle *fwnode,
  3315					       int port_reg, int reg)
  3316	{
  3317		return of_fwnode_handle(of_graph_get_endpoint_by_regs(to_of_node(fwnode),
  3318								      port_reg, reg));
  3319	}
  3320	
  3321	static int vip_register_subdev_notify(struct vip_port *port,
  3322					      struct fwnode_handle *ep)
  3323	{
  3324		struct v4l2_async_notifier *notifier = &port->notifier;
  3325		struct fwnode_handle *subdev;
  3326		struct v4l2_fwnode_endpoint *vep;
  3327		struct v4l2_async_connection *asd;
  3328		int ret;
  3329		struct vip_dev *dev = port->dev;
  3330	
  3331		vep = &port->endpoint;
  3332	
  3333		subdev = fwnode_graph_get_remote_port_parent(ep);
  3334		if (!subdev) {
  3335			v4l2_dbg(3, debug, &dev->v4l2_dev, "can't get remote parent\n");
  3336			return -EINVAL;
  3337		}
  3338	
> 3339		ret = v4l2_fwnode_endpoint_parse(ep, vep);
  3340		if (ret) {
  3341			v4l2_dbg(3, debug, &dev->v4l2_dev, "Failed to parse endpoint:\n");
  3342			fwnode_handle_put(subdev);
  3343			return -EINVAL;
  3344		}
  3345	
> 3346		v4l2_async_nf_init(notifier, &port->dev->shared->v4l2_dev);
  3347	
> 3348		asd = v4l2_async_nf_add_fwnode(notifier, subdev, struct v4l2_async_connection);
  3349		if (IS_ERR(asd)) {
  3350			v4l2_dbg(1, debug, &dev->v4l2_dev, "Error adding asd\n");
  3351			fwnode_handle_put(subdev);
> 3352			v4l2_async_nf_cleanup(notifier);
  3353			return -EINVAL;
  3354		}
  3355	
  3356		notifier->ops = &vip_async_ops;
> 3357		ret = v4l2_async_nf_register(notifier);
  3358		if (ret) {
  3359			v4l2_dbg(1, debug, &dev->v4l2_dev, "Error registering async notifier\n");
  3360			v4l2_async_nf_cleanup(notifier);
  3361			ret = -EINVAL;
  3362		}
  3363	
  3364		return ret;
  3365	}
  3366	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
