Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF312737EE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441496; cv=none; b=mItijpMOe57xYOR+0a3mlK+kCX6GVwBFGEhQCjnRXvOVUI8IlyANIdRWHNGc5iSFPzcloBbggrei8BrlUlQWG4t02E2tCVctTyDOtGI3WoTGqsxuJhAxwoWRMXpOr6Ji1pZyWWhx5HObsfoOWHj136zy+Dg512QkkBhf+gNC+W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441496; c=relaxed/simple;
	bh=+bQjfMox0LYSANw6kFUEUHC5pwsK+yglyGHXY1J7mTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRvKGY2/KRkrdChFQVWhuHJn1vxuy52C57Sm1p2WYP1RbYGt1qLolXXBfGCQO4FMwxB+WjjD+QEte2OLWU596LZPCYBW4T8kqI6M+YTSXjeBOZYAcK5vdA/JZrrJRI+hh5Z2p6UJ2C80DngyEXowjTk20L235uCxnrbzcuvnzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExaE53wy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExaE53wy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759441495; x=1790977495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+bQjfMox0LYSANw6kFUEUHC5pwsK+yglyGHXY1J7mTk=;
  b=ExaE53wy+ETDDeE7lDkkSaAawzy3KoEg84IMYdviDZeyzfeje3jot+4d
   BJkOMvBzYTnIElCnQ4PLTFpjYTAOimL5fEETHZcNvSffmupFRFidW4zBi
   3xmbU//heYpmAuds2VYkqcT3ut8DXmNaTVrErj3b3Ks7VOctGVno8lowd
   4nqUnL1J0+3GLy9AdoO2AoePqbiuvk/AWCZ5g731g44kKZBuvhtvTWQL7
   iZ5Zskb2gE7E+svDEVP2IpoE9ObNrqIQWqAWJpwuzQuz4Pfqf0HgiY8nM
   DPMRPEON+i+1ZXcT5Iib1SOzEfttMatZUqzRRQluOExBZ7LO7AEGCPQZ5
   A==;
X-CSE-ConnectionGUID: t5ErTKeXSA+zdTEagyKLzA==
X-CSE-MsgGUID: 1Na8ez3QSeOr4j+I/G0ngA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61770308"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="61770308"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 14:44:54 -0700
X-CSE-ConnectionGUID: jfS8c8r1T8qbK/zClWus7A==
X-CSE-MsgGUID: uCEahISYSu20Xtv6VqmdzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="210114226"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2025 14:44:53 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4R6Z-00048Z-0W;
	Thu, 02 Oct 2025 21:44:51 +0000
Date: Fri, 3 Oct 2025 05:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:csi-v6 3/7] drivers/media/platform/video-mux.c:172:10: error:
 'const struct v4l2_subdev_video_ops' has no member named 'g_frame_interval'
Message-ID: <202510030540.zCd32Zmk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git csi-v6
head:   9afab5ec0a06e2fc9c2cb2b739bc6caececf815a
commit: 4d73fea00b5748e8b6fb7363f4fefa75bc998932 [3/7] media: staging/imx: add frame intervals back in
config: csky-randconfig-001-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030540.zCd32Zmk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030540.zCd32Zmk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030540.zCd32Zmk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/video-mux.c:172:10: error: 'const struct v4l2_subdev_video_ops' has no member named 'g_frame_interval'
     172 |         .g_frame_interval = vidsw_g_frame_interval,
         |          ^~~~~~~~~~~~~~~~
>> drivers/media/platform/video-mux.c:172:29: error: initialization of 'int (*)(struct v4l2_subdev *, void *, unsigned int *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_frame_interval *)' [-Wincompatible-pointer-types]
     172 |         .g_frame_interval = vidsw_g_frame_interval,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/video-mux.c:172:29: note: (near initialization for 'video_mux_subdev_video_ops.s_rx_buffer')
   drivers/media/platform/video-mux.c:145:12: note: 'vidsw_g_frame_interval' declared here
     145 | static int vidsw_g_frame_interval(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/video-mux.c:173:10: error: 'const struct v4l2_subdev_video_ops' has no member named 's_frame_interval'
     173 |         .s_frame_interval = vidsw_s_frame_interval,
         |          ^~~~~~~~~~~~~~~~
>> drivers/media/platform/video-mux.c:173:29: error: initialization of 'int (*)(struct v4l2_subdev *, u32)' {aka 'int (*)(struct v4l2_subdev *, unsigned int)'} from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_frame_interval *)' [-Wincompatible-pointer-types]
     173 |         .s_frame_interval = vidsw_s_frame_interval,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/video-mux.c:173:29: note: (near initialization for 'video_mux_subdev_video_ops.pre_streamon')
   drivers/media/platform/video-mux.c:155:12: note: 'vidsw_s_frame_interval' declared here
     155 | static int vidsw_s_frame_interval(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +172 drivers/media/platform/video-mux.c

   169	
   170	static const struct v4l2_subdev_video_ops video_mux_subdev_video_ops = {
   171		.s_stream = video_mux_s_stream,
 > 172		.g_frame_interval = vidsw_g_frame_interval,
 > 173		.s_frame_interval = vidsw_s_frame_interval,
   174	};
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
