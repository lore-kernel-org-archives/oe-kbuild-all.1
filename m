Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD11558BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991906; cv=none; b=FQk7tn5ktdgzsh4TLNP99voXqTGUzvwtcsBAf7OrSGYXXG2Rio0xc2n2qAjwrJ6anFtxt9TRPTpjgEwdDvi4MMI2RwMMg19JYQGe0JAVzCGZUuoqqz9L2JZ2iKz2c05UxKGGAUKqC2oxhmh+auSeiBcN57IUu3AD63YgI545mto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991906; c=relaxed/simple;
	bh=ICj4/N9USnpPu9U/N+awjMyNJz7AMkndLHW09rl2q/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbWNsfnXN+K09Z8KO5Ti1MePfNStPV2ZIJZQkqYhQbs6zstVH89I6knfvKktDAZbVagFgExZEgqqrkEaGyRQ4lJfNMhIy+Xgak7AGd2rxvuuSDEnLJZSqhfy7DfCEvKl8iUWc9SWWL0dX70Zd6waOYZ3frG8OdCcHJpkx74+KOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NucpCRE7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NucpCRE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733991904; x=1765527904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ICj4/N9USnpPu9U/N+awjMyNJz7AMkndLHW09rl2q/c=;
  b=NucpCRE7w6cNO5St58r94WKdAjsK1k9nkkCpct2h72LVkCjjNwaJUBDu
   Y3GsvLDp38zi0rTdvmdYDCnlIXZMGhAPtBz27WH0E66gfXhhDVeIS2Oze
   iy3mO0DIaTiAGz35YTERIGjm1s+MjmPrQpb+F0zNdb3SG4EVp0DNvN2oF
   tDQDEGr1YtGcIPHg1VXD7/lxZt5ogYXEoweYZ9EZMkNKwVk11paO6QSTR
   8sht+lQQTNdUJcwuDbjRCMaaONwoWMfAChT49CJ9Y2juVKsYTN4MBEeXH
   akMOJeWqJi9LImpgjuKM+yQDy5+zqzXjQbpxbOQ6wPtKZkE1QZ18SIfBU
   Q==;
X-CSE-ConnectionGUID: J4OXezb2RhCwkfn91IKnng==
X-CSE-MsgGUID: n7b7x7NFSIqd5lL6hVtjgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34442273"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34442273"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 00:25:04 -0800
X-CSE-ConnectionGUID: o84HF7sHRZaFSm8pTb35Xw==
X-CSE-MsgGUID: VwVSH3a6Spy7c6PF5OM3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119403134"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Dec 2024 00:25:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLeVI-0007c4-2J;
	Thu, 12 Dec 2024 08:25:00 +0000
Date: Thu, 12 Dec 2024 16:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:1276:49: warning: '%s' directive
 output may be truncated writing up to 63 bytes into a region of size 32
Message-ID: <202412121623.9I5dRbb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   a3f82e653c46a6e972edb5f623ab83190db10758
commit: a3f82e653c46a6e972edb5f623ab83190db10758 [2/2] media: v4l2-loopback
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241212/202412121623.9I5dRbb9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121623.9I5dRbb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121623.9I5dRbb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-loopback.c: In function 'inner_try_setfmt':
   drivers/media/v4l2-core/v4l2-loopback.c:748:14: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
     748 |         char buf[5];
         |              ^~~
   drivers/media/v4l2-core/v4l2-loopback.c: In function 'vidioc_s_fmt_out':
   drivers/media/v4l2-core/v4l2-loopback.c:1576:14: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
    1576 |         char buf[5];
         |              ^~~
   drivers/media/v4l2-core/v4l2-loopback.c: In function 'vidioc_querycap':
>> drivers/media/v4l2-core/v4l2-loopback.c:1276:49: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 32 [-Wformat-truncation=]
    1276 |         snprintf(cap->card, sizeof(cap->card), "%s", dev->vdev->name);
         |                                                 ^~
   drivers/media/v4l2-core/v4l2-loopback.c:1276:9: note: 'snprintf' output between 1 and 64 bytes into a destination of size 32
    1276 |         snprintf(cap->card, sizeof(cap->card), "%s", dev->vdev->name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1276 drivers/media/v4l2-core/v4l2-loopback.c

  1261	
  1262	/* V4L2 ioctl caps and params calls */
  1263	/* returns device capabilities
  1264	 * called on VIDIOC_QUERYCAP
  1265	 */
  1266	static int vidioc_querycap(struct file *file, void *priv,
  1267				   struct v4l2_capability *cap)
  1268	{
  1269		struct v4l2_loopback_device *dev = v4l2l_getdevice(file);
  1270		int device_nr =
  1271			((struct v4l2l_private *)video_get_drvdata(dev->vdev))
  1272				->device_nr;
  1273		__u32 capabilities = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
  1274	
  1275		strscpy(cap->driver, "v4l2 loopback", sizeof(cap->driver));
> 1276		snprintf(cap->card, sizeof(cap->card), "%s", dev->vdev->name);
  1277		snprintf(cap->bus_info, sizeof(cap->bus_info),
  1278			 "platform:v4l2loopback-%03d", device_nr);
  1279	
  1280		if (dev->announce_all_caps) {
  1281			capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT;
  1282		} else {
  1283			if (dev->ready_for_capture) {
  1284				capabilities |= V4L2_CAP_VIDEO_CAPTURE;
  1285			}
  1286			if (dev->ready_for_output) {
  1287				capabilities |= V4L2_CAP_VIDEO_OUTPUT;
  1288			}
  1289		}
  1290	
  1291		dev->vdev->device_caps = cap->device_caps = cap->capabilities = capabilities;
  1292		cap->capabilities |= V4L2_CAP_DEVICE_CAPS;
  1293		memset(cap->reserved, 0, sizeof(cap->reserved));
  1294		return 0;
  1295	}
  1296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
