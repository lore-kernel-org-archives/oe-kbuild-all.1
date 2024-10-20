Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E8632
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 01:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729388054; cv=none; b=HZP63NN+PDonZEWV5wl2F78rpy2Ujw37sRMCL2lXOaMTk6puAEEL8WlEAmQvROW2+fhFm85zcC/K1MCedtYNISpHmaDLyvN8cq16SKrvydMFbmuqo5LuBQ0DQfsvP5LURs+VVTIZgUtO2psCoe026RvBPsILTxmj+Zsbqh9LiTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729388054; c=relaxed/simple;
	bh=6irETWe1sb5gYQ5UlSE7+GvFUaOBfnsrgK77EtIFUIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSaWfjAbxccH5kVyjjW2t3Q6lxXe0bNxjSNxhG4jJ2uRIWG51YphMB/89hbiSmFl0iG9OJZ1bOsGnLLq8FJ4ZgKYx7npybUO29MONMxWx1mqhoK4zoMXnQ0sEYCTjCkIXNwzoHdEoRYe1qZZVNTiYgfTnyXthwGcTflA8VQ3n7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVYow0Fn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVYow0Fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729388052; x=1760924052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6irETWe1sb5gYQ5UlSE7+GvFUaOBfnsrgK77EtIFUIQ=;
  b=AVYow0FnO4a/Z91B5L5bdQetdyrWlGXFBNYIN8NB3BnVa1vcoMOVXFpv
   aWsVfqkRR/sTK1MFeRmTvG+pGGMbQEKkG3VQl9TsCwH4usSKCGrcvkZ96
   0Sx0NOc6RqwpKdHEYw4gAtNmoKh9IiZaLqiK0o17HKDYs36CLU7+Krz9s
   ys/c6cLQYNVwaWy3dpolBhmJhYWk5O2WvGXkcTIYt2QZpLVCvDsEQpPmN
   VAu/SLdk4NcaP393oWTfYC3UVm+cGAPJcDjOP7ofCxwLhL1MhiVu13Tuv
   iHHGnGoKHYAWizYbWfuvrlnmnoT5ang+rgsAZiwAocPyqmCkTG12Jh4ZE
   A==;
X-CSE-ConnectionGUID: zoSot/4ZSWWjwWVooavsDg==
X-CSE-MsgGUID: V+IwLdyDRBmL6bLiBOGB6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40254041"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="40254041"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 18:34:11 -0700
X-CSE-ConnectionGUID: 3wLHGLWqTCOLKVuWgLuzHA==
X-CSE-MsgGUID: Za8EsJnkRwmYzixpp7DduA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79603231"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Oct 2024 18:34:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Kpb-000Pl5-2b;
	Sun, 20 Oct 2024 01:34:07 +0000
Date: Sun, 20 Oct 2024 09:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 8/8] drivers/virtio/virtio_msg_ffa.c:48:23:
 error: invalid application of 'sizeof' to an incomplete type 'struct
 virtio_msg_ffa'
Message-ID: <202410200956.lyN2KLiL-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241020/202410200956.lyN2KLiL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200956.lyN2KLiL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200956.lyN2KLiL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_ffa.c:45:32: warning: declaration of 'struct virtio_msg_ffa' will not be visible outside of this function [-Wvisibility]
      45 | static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
         |                                ^
>> drivers/virtio/virtio_msg_ffa.c:48:23: error: invalid application of 'sizeof' to an incomplete type 'struct virtio_msg_ffa'
      48 |         memset(msg, 0, sizeof(*msg));
         |                              ^~~~~~
   include/linux/fortify-string.h:512:52: note: expanded from macro 'memset'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                                                    ^
   include/linux/fortify-string.h:502:35: note: expanded from macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/virtio/virtio_msg_ffa.c:45:32: note: forward declaration of 'struct virtio_msg_ffa'
      45 | static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
         |                                ^
>> drivers/virtio/virtio_msg_ffa.c:50:5: error: incomplete definition of type 'struct virtio_msg_ffa'
      50 |         msg->type = VIRTIO_MSG_TYPE_BUS;
         |         ~~~^
   drivers/virtio/virtio_msg_ffa.c:45:32: note: forward declaration of 'struct virtio_msg_ffa'
      45 | static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
         |                                ^
   drivers/virtio/virtio_msg_ffa.c:52:6: error: incomplete definition of type 'struct virtio_msg_ffa'
      52 |                 msg->type |= VIRTIO_MSG_TYPE_RESPONSE;
         |                 ~~~^
   drivers/virtio/virtio_msg_ffa.c:45:32: note: forward declaration of 'struct virtio_msg_ffa'
      45 | static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
         |                                ^
   drivers/virtio/virtio_msg_ffa.c:54:5: error: incomplete definition of type 'struct virtio_msg_ffa'
      54 |         msg->id = msg_id;
         |         ~~~^
   drivers/virtio/virtio_msg_ffa.c:45:32: note: forward declaration of 'struct virtio_msg_ffa'
      45 | static void msg_prepare(struct virtio_msg_ffa *msg, bool request, u8 msg_id)
         |                                ^
>> drivers/virtio/virtio_msg_ffa.c:59:2: error: call to undeclared function 'virtio_msg_prepare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      59 |         virtio_msg_prepare(msg, true, msg_id);
         |         ^
>> drivers/virtio/virtio_msg_ffa.c:100:17: error: no member named 'name' in 'struct virtio_msg_ffa_device'
     100 |         return vmfdev->name;
         |                ~~~~~~  ^
>> drivers/virtio/virtio_msg_ffa.c:144:12: error: use of undeclared identifier 'FFA_SCMI_CMD_CAPABILITIES'
     144 |                 .data0 = FFA_SCMI_CMD_CAPABILITIES,
         |                          ^
>> drivers/virtio/virtio_msg_ffa.c:157:15: error: use of undeclared identifier 'FFA_SCMI_CAPS_MASK'
     157 |         if (!(caps & FFA_SCMI_CAPS_MASK)) {
         |                      ^
>> drivers/virtio/virtio_msg_ffa.c:162:2: error: use of undeclared identifier 'service'
     162 |         service->caps = caps;
         |         ^
   drivers/virtio/virtio_msg_ffa.c:183:49: warning: shift count >= width of type [-Wshift-count-overflow]
     183 |         ret = dma_set_mask_and_coherent(&ffa_dev->dev, DMA_BIT_MASK(64));
         |                                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   2 warnings and 9 errors generated.


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
  > 54		msg->id = msg_id;
    55	}
    56	
    57	static void request_msg_prepare(struct virtio_msg *msg, u8 msg_id)
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
   140	static int bus_configure(struct ffa_device *ffa_dev)
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
