Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F3081724
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 21:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755810362; cv=none; b=G+0Q9cU2P3UOekL2Ej1cFcjl5u2RfPiZu5ETAJQQbgyyCzVWsYqECpJoenkFQoN8nOQB1no54XwFDhklkqlJ7OlT8KUQVjGZGEw76XS3qI9Jbrq3XvX1ZuGGtS8e6mmZrpouBbVwBfc2WGpG4ZzuaFIINXQ27x68CEYOu2GCRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755810362; c=relaxed/simple;
	bh=lVJ0pCYRE78VyGkmcE57gxkUUiLfRzoHCtigSfBEIz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dPrSI3XBu8aU8TrJzCSsgIwKYKc9vcQ5MotczLJS6BUXFh2Fg3ZTOr8vV6boJidNCyWMRSGzLMV+691U6P52s2dweF5Q3Jwow+IvF5saZcOrqboLfwobhq7X6TGHHDgSxEC7jk1FP0I0H9M81PGYcDiIgKGjkjgIVBrpqS/EwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js8wJ/OE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js8wJ/OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755810360; x=1787346360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVJ0pCYRE78VyGkmcE57gxkUUiLfRzoHCtigSfBEIz8=;
  b=Js8wJ/OEb6jcpeBhNPintOemh7NUqsK+0QZuJIeONMcKN7YbzhC4ny2S
   Qenl1j80ayc+OsMKK+KmmQhRLPhZ2TIpxRLMBqNkxpBkYymKYqFuxNty5
   c2K8HH8XQcKx9uc7zFBeIlmpJXdmp91iHZ4HwtSN9MCVoqBXW0efdFgKq
   qz1olol4en5XwqiPwfFufAAOd4bJ6N9leOAtn8YiAhWEoSA1bf8Z/EMfI
   +KJjV8R5OJsjWcjpqlFGThdqw17iBwFVF5IQ6vSmjxIwi0iI9LV3nX8VN
   quNdLjNc6fbpWt/q96G3q/xGZA6Cd5tuU3Y4rPatWs4EYH0dK7Jqzm++e
   w==;
X-CSE-ConnectionGUID: 75ezs2isSHGwudnM6SZhRQ==
X-CSE-MsgGUID: JIf/VMM+SZC/Rza4TXCtjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83533719"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="83533719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 14:06:00 -0700
X-CSE-ConnectionGUID: 1m8B50DxTvK/8JHoy17tVQ==
X-CSE-MsgGUID: DSBjlJc6TTiIU9jNQlUKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168016208"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2025 14:05:59 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upCTs-0001nr-3B;
	Thu, 21 Aug 2025 21:05:56 +0000
Date: Thu, 21 Aug 2025 23:05:32 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5] vivid-osd.c:undefined
 reference to `fb_dealloc_cmap'
Message-ID: <202508212314.Bx0FE5Ba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4e823e0e1f45a7358a3393404a7c4067199c38a2
commit: ce5631988c89b3e9b662f50612a87526ea3d093c [5/5] UPSTREAM: media: vivid: Introduce VIDEO_VIVID_OSD
config: arm-randconfig-2006-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212314.Bx0FE5Ba-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212314.Bx0FE5Ba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212314.Bx0FE5Ba-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_release_buffers':
>> vivid-osd.c:(.text+0x300): undefined reference to `fb_dealloc_cmap'
   arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_init':
>> vivid-osd.c:(.text+0x7f8): undefined reference to `fb_alloc_cmap'
>> arm-linux-gnueabi-ld: vivid-osd.c:(.text+0x858): undefined reference to `register_framebuffer'
   arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_deinit':
>> vivid-osd.c:(.text+0x950): undefined reference to `unregister_framebuffer'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x4c): undefined reference to `fb_io_read'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x50): undefined reference to `fb_io_write'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x6c): undefined reference to `cfb_fillrect'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x70): undefined reference to `cfb_copyarea'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x74): undefined reference to `cfb_imageblit'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x88): undefined reference to `fb_io_mmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
