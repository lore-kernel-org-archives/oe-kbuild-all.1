Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F728EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729390514; cv=none; b=NNOgtOyTEnootEZ62vmteaBqaaLoD9Xpk9NNQ+OAfSj2klC7P1XCweIm351T1RRzpPExIzUiSekzgvJRs015LggiIMGtEhw2dtwFr9d5+qpNsE+zc9jf6WhvSVZKQx6nV6tQpHTP5KVlySm47mJmyyqSsjcZf5RC5UOz3wY+DGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729390514; c=relaxed/simple;
	bh=NqvArtLjUTOEtmaTT9sI0TV4u+ps27vxj2gwXi2Cg1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIX/s1Zh9WTqh5nVMoiZp8edY+VvVeswH8b4BkYF1RtuVdTwNejMr1TRAUgZec1FdGqdyC5Hxsu82UNJraoS1FuUaXnSmiZFelPDyil421JqKUmcil/6U1mJ/Fy0xjN5VKIckW+Q2QQBqF7T5iwgWpkx3kSvsYYe5HhynaaGxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN/3zCYO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN/3zCYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729390513; x=1760926513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqvArtLjUTOEtmaTT9sI0TV4u+ps27vxj2gwXi2Cg1M=;
  b=KN/3zCYOEIVn8ddVf4hWvfqJOFgGcCz8RotJzT+A9iCuWa1muhEXs1/Q
   opGh3XonyW01X1KP7yAAARZ9Wmzzq7nZBx9ZunybUBTbcBSv1fwh8mr/E
   jtQn0mCO28l2+wSBCATOarZt0UK2TDGzAEoUZtfD1+dwm07ELNOE3oZj5
   H/XDHuEbrJ8BX7wa/Vu1Q/03LafgK6ua5QrLLh4rE+zVON36hDwOGCk8Q
   WS4xu6QMArOxg33sOPlgTWPzCJXlDoPWv/TTxJ178XFyYT1UN/li4ruVZ
   zkAGzcrQ51m/kFc5VoWhHobjHUuTD8zBq6DAOTUKvZFg1z+EDwIEMpkFn
   w==;
X-CSE-ConnectionGUID: g3cNjggGT0Svh9ZQTNF1lw==
X-CSE-MsgGUID: epd5vcjkRVOtTEhgS4K5hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28773453"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28773453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 19:15:13 -0700
X-CSE-ConnectionGUID: joWSQSqjRpi0gm/JnXk6FA==
X-CSE-MsgGUID: yR4HJIRgRNuWE0eljLPUgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="102514125"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Oct 2024 19:15:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2LTI-000Pmb-2W;
	Sun, 20 Oct 2024 02:15:08 +0000
Date: Sun, 20 Oct 2024 10:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 8/8] drivers/virtio/virtio_msg_ffa.c:48:30:
 error: invalid application of 'sizeof' to incomplete type 'struct
 virtio_msg_ffa'
Message-ID: <202410201034.3MOP04aj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   087414af579a53d448c1a3f74eeaef61c197c504
commit: 087414af579a53d448c1a3f74eeaef61c197c504 [8/8] virtio: Add support for FFA based channel bus
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241020/202410201034.3MOP04aj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201034.3MOP04aj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201034.3MOP04aj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_ffa.c:45:32: warning: 'struct virtio_msg_ffa' declared inside parameter list will not be visible outside of this definition or declaration
      45 | static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
         |                                ^~~~~~~~~~~~~~
   In file included from include/linux/string.h:374,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/arm_ffa.h:10,
                    from drivers/virtio/virtio_msg_ffa.c:13:
   drivers/virtio/virtio_msg_ffa.c: In function 'msg_prepare':
>> drivers/virtio/virtio_msg_ffa.c:48:30: error: invalid application of 'sizeof' to incomplete type 'struct virtio_msg_ffa'
      48 |         memset(msg, 0, sizeof(*msg));
         |                              ^
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/virtio/virtio_msg_ffa.c:48:9: note: in expansion of macro 'memset'
      48 |         memset(msg, 0, sizeof(*msg));
         |         ^~~~~~
>> drivers/virtio/virtio_msg_ffa.c:50:12: error: invalid use of undefined type 'struct virtio_msg_ffa'
      50 |         msg->type = VIRTIO_MSG_TYPE_BUS;
         |            ^~
   drivers/virtio/virtio_msg_ffa.c:52:20: error: invalid use of undefined type 'struct virtio_msg_ffa'
      52 |                 msg->type |= VIRTIO_MSG_TYPE_RESPONSE;
         |                    ^~
   drivers/virtio/virtio_msg_ffa.c:54:12: error: invalid use of undefined type 'struct virtio_msg_ffa'
      54 |         msg->id = msg_id;
         |            ^~
   drivers/virtio/virtio_msg_ffa.c: In function 'request_msg_prepare':
>> drivers/virtio/virtio_msg_ffa.c:59:9: error: implicit declaration of function 'virtio_msg_prepare'; did you mean 'virtio_msg_restore'? [-Werror=implicit-function-declaration]
      59 |         virtio_msg_prepare(msg, true, msg_id);
         |         ^~~~~~~~~~~~~~~~~~
         |         virtio_msg_restore
   drivers/virtio/virtio_msg_ffa.c: In function 'virtio_msg_ffa_bus_name':
>> drivers/virtio/virtio_msg_ffa.c:100:22: error: 'struct virtio_msg_ffa_device' has no member named 'name'
     100 |         return vmfdev->name;
         |                      ^~
   drivers/virtio/virtio_msg_ffa.c: In function 'bus_configure':
>> drivers/virtio/virtio_msg_ffa.c:144:26: error: 'FFA_SCMI_CMD_CAPABILITIES' undeclared (first use in this function)
     144 |                 .data0 = FFA_SCMI_CMD_CAPABILITIES,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_msg_ffa.c:144:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/virtio/virtio_msg_ffa.c:157:22: error: 'FFA_SCMI_CAPS_MASK' undeclared (first use in this function)
     157 |         if (!(caps & FFA_SCMI_CAPS_MASK)) {
         |                      ^~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_msg_ffa.c:162:9: error: 'service' undeclared (first use in this function); did you mean 'device'?
     162 |         service->caps = caps;
         |         ^~~~~~~
         |         device
   drivers/virtio/virtio_msg_ffa.c: At top level:
>> drivers/virtio/virtio_msg_ffa.c:140:12: warning: 'bus_configure' defined but not used [-Wunused-function]
     140 | static int bus_configure(struct ffa_device *ffa_dev)
         |            ^~~~~~~~~~~~~
>> drivers/virtio/virtio_msg_ffa.c:57:13: warning: 'request_msg_prepare' defined but not used [-Wunused-function]
      57 | static void request_msg_prepare(struct virtio_msg *msg, u8 msg_id)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_msg_ffa.c:45:13: warning: 'msg_prepare' defined but not used [-Wunused-function]
      45 | static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
         |             ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +48 drivers/virtio/virtio_msg_ffa.c

    41	
    42	#define to_virtio_msg_ffa_device(_vmdev) \
    43		container_of(_vmdev, struct virtio_msg_ffa_device, vmdev)
    44	
  > 45	static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
    46	{
    47		/* Initialize all fields (including padding) to 0 */
  > 48		memset(msg, 0, sizeof(*msg));
    49	
  > 50		msg->type = VIRTIO_MSG_TYPE_BUS;
    51		if (!request)
    52			msg->type |= VIRTIO_MSG_TYPE_RESPONSE;
    53	
    54		msg->id = msg_id;
    55	}
    56	
  > 57	static void request_msg_prepare(struct virtio_msg *msg, u8 msg_id)
    58	{
  > 59		virtio_msg_prepare(msg, true, msg_id);
    60	}
    61	
    62	static int virtio_msg_ffa_send(struct virtio_msg_device *vmdev,
    63			struct virtio_msg *request,
    64			struct virtio_msg *response)
    65	{
    66		struct virtio_msg_ffa_device *vmfdev = to_virtio_msg_ffa_device(vmdev);
    67		struct ffa_device *ffa_dev = vmfdev->ffa_dev;
    68		int i, len = sizeof(struct virtio_msg) / sizeof(unsigned long);
    69	
    70		struct ffa_send_direct_data ffa_data = { };
    71		int rc;
    72	
    73		unsigned long *reqs = (unsigned long *) request;
    74		unsigned long *data = (unsigned long *) &ffa_data;
    75		for (i = 0; i < len; i++) {
    76			data[i] = reqs[i];
    77		}
    78	
    79		rc = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &ffa_data);
    80		if (rc) {
    81			pr_err("Unable to send direct FFA message rc %d\n", rc);
    82			return -ENOMEM;
    83		}
    84	
    85		if (!response)
    86			return -EINVAL;
    87	
    88		unsigned long *resps = (unsigned long *) response;
    89		for (i = 0; i < len; i++) {
    90			resps[i] = data[i];
    91		}
    92	
    93		return 0;
    94	}
    95	
    96	static const char *virtio_msg_ffa_bus_name(struct virtio_msg_device *vmdev)
    97	{
    98		struct virtio_msg_ffa_device *vmfdev = to_virtio_msg_ffa_device(vmdev);
    99	
 > 100		return vmfdev->name;
   101	}
   102	
   103	static void virtio_msg_ffa_synchronize_cbs(struct virtio_msg_device *vmdev)
   104	{
   105		struct virtio_msg_ffa_device *vmfdev = to_virtio_msg_ffa_device(vmdev);
   106		(void)vmfdev;
   107	}
   108	
   109	static void virtio_msg_ffa_release(struct virtio_msg_device *vmdev)
   110	{
   111		struct virtio_msg_ffa_device *vmfdev = to_virtio_msg_ffa_device(vmdev);
   112	
   113		kfree(vmfdev);
   114	}
   115	
   116	static int virtio_msg_ffa_vqs_prepare(struct virtio_msg_device *vmdev)
   117	{
   118		struct virtio_msg_ffa_device *vmfdev = to_virtio_msg_ffa_device(vmdev);
   119	
   120		(void)vmfdev;
   121		return 0;
   122	}
   123	
   124	static void virtio_msg_ffa_vqs_release(struct virtio_msg_device *vmdev)
   125	{
   126		struct virtio_msg_ffa_device *vmfdev = to_virtio_msg_ffa_device(vmdev);
   127	
   128		(void)vmfdev;
   129	}
   130	
   131	static struct virtio_msg_ops vmf_ops = {
   132		.send = virtio_msg_ffa_send,
   133		.bus_name = virtio_msg_ffa_bus_name,
   134		.synchronize_cbs = virtio_msg_ffa_synchronize_cbs,
   135		.release = virtio_msg_ffa_release,
   136		.prepare_vqs = virtio_msg_ffa_vqs_prepare,
   137		.release_vqs = virtio_msg_ffa_vqs_release,
   138	};
   139	
 > 140	static int bus_configure(struct ffa_device *ffa_dev)
   141	{
   142		const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
   143		struct ffa_send_direct_data data = {
 > 144			.data0 = FFA_SCMI_CMD_CAPABILITIES,
   145		};
   146		unsigned int caps = 0;
   147		int ret;
   148	
   149		ret = msg_ops->sync_send_receive(ffa_dev, &data);
   150		if (ret) {
   151			dev_err(&ffa_dev->dev, "Can't get FFA SCMI caps %d / %#x\n",
   152				ret, (u32)data.data0);
   153			return -EOPNOTSUPP;
   154		}
   155	
   156		caps = data.data1;
 > 157		if (!(caps & FFA_SCMI_CAPS_MASK)) {
   158			dev_err(&ffa_dev->dev, "FFA SCMI doesn't support neither direct nor indirect message\n");
   159			return -EOPNOTSUPP;
   160		}
   161	
 > 162		service->caps = caps;
   163	
   164		return 0;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
