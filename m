Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D907FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 05:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718687498; cv=none; b=aSiho7s/xCdl07QNPP4TwvjZxVGy/zXul1pbsgctzisvhdrB8yRXwYnc21qq81/ADZlUB23spkAE33bxiaAiJxwiMnxOV5g8OSUP/I88URNF+OaCtN7mbkbmO9DNN+uzre+bU9FOD2XLCViEVEVqTV3UQos7zcYKY71eNFDfbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718687498; c=relaxed/simple;
	bh=RAjXZJ+nxCR4xhblVrKFJBYZhyGLUPz6SwCoevT8Wkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gq6KnMmxV2jnZa0URv1PlyXffmoM+jOwbwVIFoGWb0pb9plr2WRFVm1eNJdJ0QGLOgOVeD9Dcc3wl/Df/8QJQ5Jt1mNhAkkRTKpmBp+FBYSvzWQBCWS0K+iUZ62x9WHc+2MzJzf++cqr3Skg/d6tzoNoAofR/SuRbO8w+VxKbsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSWDqCaH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSWDqCaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718687496; x=1750223496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RAjXZJ+nxCR4xhblVrKFJBYZhyGLUPz6SwCoevT8Wkg=;
  b=jSWDqCaHGbI8Ycix++hhDxG67eLBjWPeIEE7xiL17L5FTPkTY8oscS40
   JiDqvNSIAYQD0qAbZEVii1lnpIpDwJZrh3HrfIH8b42ZqE3j6A0y2kQCx
   IXuIgo7zCkCcMW1ChH4cFBXvn/59dxZKCtD0D41+yrWzjji2Wru5/6+II
   3l7ICkfAVQ8S1U4pJbWnh71qIwi3asEHrl2kj/no+4C1SmU5jZeoOD6YN
   DyyeeNv8vowFN3bsTx/0ODlSD9AnsP55Sjpi1JYYu7U2xJYTelWsV6CDn
   5SNUDxA6rvxAFI1rpYBOZ5JO5SpivhIvvspTKwt8uFMnnUN9hG5plrWHt
   A==;
X-CSE-ConnectionGUID: QOdfkFSsS16TOJL0VUIiNg==
X-CSE-MsgGUID: B/8dMZ2wQ8+bxdUk/4olcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33011644"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="33011644"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 22:11:35 -0700
X-CSE-ConnectionGUID: BM2xdYtmScaAmsWiznWNWg==
X-CSE-MsgGUID: Tsv+fuB9Tb+qJ3eh271dCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="41894130"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jun 2024 22:11:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJR7z-0005E1-2L;
	Tue, 18 Jun 2024 05:11:31 +0000
Date: Tue, 18 Jun 2024 13:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, Dom Cobley <popcornmix@gmail.com>
Subject: [kbingham-rcar:kbingham/rpi-6.10.y/vchiq-dma-mask 643/686] ERROR:
 modpost: "backlight_set_display_name" [drivers/gpu/drm/drm_kms_helper.ko]
 undefined!
Message-ID: <202406181303.sg3pyNPE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git kbingham/rpi-6.10.y/vchiq-dma-mask
head:   ace1099e2d55805827b3b3b2b6833c10a86242fc
commit: 7e3d53fef699ac357cf8a1ea6a9260bf01b7e05c [643/686] drm/bridge: panel: Name an associated backlight device
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240618/202406181303.sg3pyNPE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181303.sg3pyNPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181303.sg3pyNPE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libsha256.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_accel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_DAC1064.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/matrox/matroxfb_Ti3026.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/macmodes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-dj.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
>> ERROR: modpost: "backlight_set_display_name" [drivers/gpu/drm/drm_kms_helper.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
