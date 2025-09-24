Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388332BC16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758745889; cv=none; b=m7m8xGYKPIrT1jWJuMiLwKXVvEO7CGsYXzSeZY7MkDmrmQTR8K+cQ1I40FZHgQGpih8jrj9FHCFriIAQW7aalyy/gfU+Kmttrfd/y2eL/xXIR/lp/OVwBQftWZYtAZaUK2q+WYasaS9PpAUyFMHw7dewDU4/PxH8x9Wa2LdSFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758745889; c=relaxed/simple;
	bh=OXEomdTq9WqVq3WSHu9hMhAMgZfON7/p5oqct70Y7xs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWIDrmM4DilJgrhGLddPCoNpNRzGiG+OVYJiOJwWvO0tiZBERwzqArveIOnBvD7uiPU6yktEcU6cd+/KYdAUiQhWBzD7shH0S58HdGzw6z7civQLDSDWx6ixfayoroOf7rNbaUwVxZQeIWHMR6+QXntkjZVjv5+3aPPX2E8wZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nlg2hhrk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nlg2hhrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758745888; x=1790281888;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OXEomdTq9WqVq3WSHu9hMhAMgZfON7/p5oqct70Y7xs=;
  b=Nlg2hhrkcK0sZM6kLmpjPzoxmF30MKIulRfGGCAar3G5Ih7BrzwBntCz
   7uHSVWrHtsyqylfo64WOCoPeeBLIoGq4+vkzCth1hS8ichqV6jJVpzBuM
   4c48kXBEl5TORfUU4N/E/KbJyP1GOE71+SnGHdMnC0GwaBIPuPUyyvTcz
   xjUKg0URdukE+z/pVKh08KV9G0A9KfwVg7sslUxjgb5hgCXS1v1F0Wl31
   WivStB/jwrPNEQtpvG+aHATrk7Ua3YKBFzcMqeFQchxYOlf3jScbXtfUg
   urz1tMmjFJbsUYHMnwqPPCrlHO+gdYKPqxg8l10R5pm9AYtmVmj0c8TN4
   Q==;
X-CSE-ConnectionGUID: b9SyEk3HRSi8T7KX5vki6g==
X-CSE-MsgGUID: pAH7vJN1SBOX6rXcjJR0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83659579"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="83659579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 13:31:28 -0700
X-CSE-ConnectionGUID: MlNdmx44Qwu/ct6sFcFsXg==
X-CSE-MsgGUID: vLAoYYd7SAW88585RESexw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177058372"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 24 Sep 2025 13:31:27 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1W96-000000004eD-1c0z;
	Wed, 24 Sep 2025 20:31:24 +0000
Date: Wed, 24 Sep 2025 22:31:10 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/android_u 3/3] htmldocs:
 ./include/media/v4l2-subdev.h:371: warning: Function parameter or member
 'two_dim' not described in 'v4l2_mbus_frame_desc_entry'
Message-ID: <202509242250.lJxFj8xy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   038b979913cc03833b6d6cc18d3a50f11d1040b6
commit: c0331b3c0b6fa900557521b1c33846267133a0fb [3/3] Squash of commits porting 4.19 IPU to 5.15
reproduce: (https://download.01.org/0day-ci/archive/20250924/202509242250.lJxFj8xy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509242250.lJxFj8xy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/media/v4l2-ctrls.h:394: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_handler'
   ./include/media/v4l2-ctrls.h:447: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_config'
   ./include/media/v4l2-dev.h:217: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_file_operations'
   ./include/media/v4l2-dev.h:316: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'video_device'
   ./include/media/v4l2-dev.h:316: warning: Function parameter or member 'ANDROID_KABI_RESERVE(2' not described in 'video_device'
>> ./include/media/v4l2-subdev.h:371: warning: Function parameter or member 'two_dim' not described in 'v4l2_mbus_frame_desc_entry'
>> ./include/media/v4l2-subdev.h:371: warning: Function parameter or member 'bus' not described in 'v4l2_mbus_frame_desc_entry'
>> ./include/media/v4l2-subdev.h:814: warning: Function parameter or member 'get_routing' not described in 'v4l2_subdev_pad_ops'
>> ./include/media/v4l2-subdev.h:814: warning: Function parameter or member 'set_routing' not described in 'v4l2_subdev_pad_ops'
>> ./include/media/videobuf2-v4l2.h:58: warning: Function parameter or member 'reserved' not described in 'vb2_v4l2_buffer'
   ./include/media/videobuf2-v4l2.h:58: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'vb2_v4l2_buffer'
   Error: Cannot open file ./include/linux/parport.h
   Error: Cannot open file ./include/linux/parport.h
   Error: Cannot open file ./include/linux/pwm.h
   Error: Cannot open file ./include/linux/pwm.h


vim +371 ./include/media/v4l2-subdev.h

   340	
   341	/**
   342	 * struct v4l2_mbus_frame_desc_entry - media bus frame description structure
   343	 *
   344	 * @flags: V4L2_MBUS_FRAME_DESC_FL_* flags
   345	 * @bpp: bits per pixel
   346	 * @pixelcode: media bus pixel code, valid if FRAME_DESC_FL_BLOB is not set
   347	 * @start_line: start line of the data for 2D DMA
   348	 * @start_pixel: start pixel of the data for 2D DMA
   349	 * @width: image width for 2D DMA
   350	 * @height: image height for 2D DMA
   351	 * @length: number of octets per frame, valid if V4L2_MBUS_FRAME_DESC_FL_BLOB
   352	 *	    is set
   353	 * @csi2: CSI-2 specific bus configuration
   354	 */
   355	struct v4l2_mbus_frame_desc_entry {
   356		u16 flags;
   357		u8 bpp;
   358		u32 pixelcode;
   359		union {
   360			struct {
   361				u16 start_line;
   362				u16 start_pixel;
   363				u16 width;
   364				u16 height;
   365			} two_dim;
   366			u32 length;
   367		};
   368		union {
   369			struct v4l2_mbus_frame_desc_entry_csi2 csi2;
   370		} bus;
 > 371	};
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
