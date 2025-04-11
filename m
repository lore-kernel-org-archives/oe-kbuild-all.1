Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C344284B29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355563; cv=none; b=ROQkvY/vz3X2v1duMoMRkDUwcGIoqDZMFmeoCBb0WRX/gk3MiGLKx1iD5xupHGzsA4CS6UM6RhNUquwRlPUghg3+hQKOtivBWxZU41EnHh8mtEEpWJ8nflEVo3sYePJMAOrA5GaMBjCABE8qCP44T8VccJjTAwYH5ea8EaP9OZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355563; c=relaxed/simple;
	bh=V0XPf2rMg7/S9JtJkm0PJpows81PcE1izdzWaDpf8o8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CvNzWHVsDqNqcx4JbMej2kgVlzRru1XbI488oZCdCskJCPajj4dNNo4MuenepubnZolTouXrQYUvKvwPZOvcp3KEXvCemYdmg+wBniTbb4FeiWs7sVHR3mbNUc9+gBq5dzmRfTTKm09Q5pbtzzZuJ2Vsv09erd3JhPSgzae8YaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsBuKxZt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsBuKxZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744355561; x=1775891561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V0XPf2rMg7/S9JtJkm0PJpows81PcE1izdzWaDpf8o8=;
  b=JsBuKxZtEYEQkIHSpCzRc0n0/FL4TqtYz+rCumgrxgM0syr/ergwVmRP
   dynIl0/qCRjiv4F7fxXRjvS/MpXHbDTbxbK6pTrW3A8DkBRfNMiuBT+up
   cx/barEHUCS0qF3SMIWJ/5bR/4XE24/JPiXpIwyeInaPxUU1fkH9gJbKR
   ko+/Wr/SVwQAUCczX1lVMraIkbugaRYS5ZHsc+Jcmk41ma1QSBOctditT
   i98Ni6Elba8juLw2Bh8E3mSVmmfX4MZf3j+RJBnl78NZdY+0GhFpf8U22
   ph3maw+R8Jd/bcqnpiIdba/5RYbIN4zjOXnS73zX0rAEn4bOOqGaknSRk
   w==;
X-CSE-ConnectionGUID: jzXW4a06QxWgVFsdEjMgNw==
X-CSE-MsgGUID: eR24XP7zRU+W2far/Y9+Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48608240"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="48608240"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 00:12:40 -0700
X-CSE-ConnectionGUID: DFFVpQ74QiaYEPeGJVD4Fg==
X-CSE-MsgGUID: M9LENnJuSNywTFOo+r7dGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134229899"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2025 00:12:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u38Z3-000Av6-1I;
	Fri, 11 Apr 2025 07:12:37 +0000
Date: Fri, 11 Apr 2025 15:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1]
 drivers/hid/hid-playstation.c:816: undefined reference to
 `led_mc_calc_color_components'
Message-ID: <202504111538.J9AhWula-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roderick,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   2fa1cbcde02eaec9e00b4bca4179859f87f6fcea
commit: 392b327fe02113aaaa332ca4cf06e4edb36f5566 [0/1] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: i386-randconfig-063-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111538.J9AhWula-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111538.J9AhWula-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111538.J9AhWula-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_ctx_release':
   drivers/media/v4l2-core/v4l2-mem2mem.c:1245: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:1246: undefined reference to `vb2_queue_release'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_poll':
   drivers/media/v4l2-core/v4l2-mem2mem.c:950: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:973: undefined reference to `v4l2_event_pending'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:839: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:839: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_expbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:849: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:849: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:849: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:849: undefined reference to `vb2_expbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_create_bufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:839: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:839: undefined reference to `vb2_create_bufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:612: undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578: undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_querybuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:612: undefined reference to `vb2_querybuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_reqbufs':
   drivers/media/v4l2-core/v4l2-mem2mem.c:578: undefined reference to `vb2_reqbufs'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_dqbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:803: undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:803: undefined reference to `vb2_dqbuf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_prepare_buf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:817: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:822: undefined reference to `vb2_prepare_buf'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamoff':
   drivers/media/v4l2-core/v4l2-mem2mem.c:880: undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:880: undefined reference to `vb2_streamoff'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_streamon':
   drivers/media/v4l2-core/v4l2-mem2mem.c:860: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:860: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:860: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:860: undefined reference to `vb2_streamon'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.o: in function `v4l2_m2m_qbuf':
   drivers/media/v4l2-core/v4l2-mem2mem.c:760: undefined reference to `video_devdata'
   ld: drivers/media/v4l2-core/v4l2-mem2mem.c:772: undefined reference to `vb2_qbuf'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2070: undefined reference to `v4l_vb2q_enable_media_source'
   ld: drivers/hid/hid-playstation.o: in function `dualsense_lightbar_set_brightness':
>> drivers/hid/hid-playstation.c:816: undefined reference to `led_mc_calc_color_components'
   ld: drivers/hid/hid-playstation.o: in function `devm_led_classdev_multicolor_register':
>> include/linux/led-class-multicolor.h:105: undefined reference to `devm_led_classdev_multicolor_register_ext'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +816 drivers/hid/hid-playstation.c

   808	
   809	static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
   810		enum led_brightness brightness)
   811	{
   812		struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
   813		struct dualsense *ds = container_of(mc_cdev, struct dualsense, lightbar);
   814		uint8_t red, green, blue;
   815	
 > 816		led_mc_calc_color_components(mc_cdev, brightness);
   817		red = mc_cdev->subled_info[0].brightness;
   818		green = mc_cdev->subled_info[1].brightness;
   819		blue = mc_cdev->subled_info[2].brightness;
   820	
   821		dualsense_set_lightbar(ds, red, green, blue);
   822		return 0;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
