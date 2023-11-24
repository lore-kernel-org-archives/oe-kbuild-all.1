Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A0B2FC21
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 18:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iD6U2UKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700852087; x=1732388087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gL4+RUXmN01EELjLdqW8ltS0o2fsGEMXjXlPYFYCTBk=;
  b=iD6U2UKcCufxT98E5V95vsK0zrsuGj7QCPyhmQnwFMziBHgf3/nbbWkF
   1MoCGuQlml5mjiqeYn373c7ZPFdECUhEPyY7n6CYl9z7vEqaSBzKZtuQe
   761pE3iiJWm8Z4oR55Jzzl2OL4RsOu4Da2vveTLHPyqDIc55PKdDJ8FVj
   GIW0TdAWDesEu5CKAkMwCxFUUfdeU3n73sSafhdusOYjlLMjtLQ1crk50
   Js7oTWk9dIMGfcX1OCKRhRxCO/SrcHTCEAIOSmSWkom2MxxNBWMXG/lsD
   Hgri70vgfDc1TFemslbPNhv9EHV0xff+pegjmWHaWyLpHPl6zmqT1hKHW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="423600798"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="423600798"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 10:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="771334881"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="771334881"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Nov 2023 10:54:31 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6bJt-0003By-1N;
	Fri, 24 Nov 2023 18:54:29 +0000
Date: Sat, 25 Nov 2023 02:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Phi-bang Nguyen <pnguyen@baylibre.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>
Subject: [pinchartl:mtk/v6.7/pumpkin/camera 7/24] kismet: WARNING: unmet
 direct dependencies detected for MTK_SENINF30 when selected by MTK_CAMSV30
Message-ID: <202311250127.sZVYYJKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.7/pumpkin/camera
head:   7de36b7af14522937f8e11b9eb2a234c14088c03
commit: 459c656d39b812789b9cbef16eee01a622734ece [7/24] media: platform: mediatek: isp_30: add mediatek ISP3.0 camsv
config: x86_64-kismet-CONFIG_MTK_SENINF30-CONFIG_MTK_CAMSV30-0-0 (https://download.01.org/0day-ci/archive/20231125/202311250127.sZVYYJKE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250127.sZVYYJKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250127.sZVYYJKE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MTK_SENINF30 when selected by MTK_CAMSV30
   
   WARNING: unmet direct dependencies detected for MTK_SENINF30
     Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_V4L2_SUBDEV_API [=y] && MEDIA_CAMERA_SUPPORT [=n] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && OF [=y]
     Selected by [y]:
     - MTK_CAMSV30 [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_V4L2_SUBDEV_API [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && OF [=y] && PM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
