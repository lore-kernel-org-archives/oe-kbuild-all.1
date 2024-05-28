Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D50B17997A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929201; cv=none; b=stocPJSLXpKLQycArmr16NBeJrTTzv96qE+BWNem6l9b20JjwxCeLJRskfy5qtvfz+5870x+5c3+JsQUepYmlHolYZqtE9VosBLhkoBrx7e9kNBx9YUElQAiJDwtPVzXdrYMk6JPN71MgaglxEOT7b/25+7idkSUUfxLeEYKFzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929201; c=relaxed/simple;
	bh=+6fP9tXmEFHyue4ceGUMpeEtPT8nsuUYNqXUkRYSWio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tf/pWF+Ter7GB3AKTl3dpnYgANAFX4LQnjOjB8wzqew9rIXyXYZOqg+XebkDSUSW6uP8LZvXK802wDJl5Yb4wLd7VOOuBYZBQScbXfLUrNViO+lY7/vxSlNE52/N0Fohdhf+Ma66KvzQGAq/+d8BPp7gINBK/O6np1BFP2tTqDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQFIyll3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQFIyll3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716929199; x=1748465199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+6fP9tXmEFHyue4ceGUMpeEtPT8nsuUYNqXUkRYSWio=;
  b=bQFIyll3pvzk8FtXtTWZq68ZxV+69RP0e/SHUw7WGE7sjf7NqXAEBp83
   jA5fspMg9QX94L5MNCcM+13mPGbNFJCBw30DwYyunCEbKeZbMT7VHJ8q1
   DEfkILctoaihGQRTODIKfWU5aMFyX+rVtSs1gt+rDenH3bGBgWFGDWQdN
   EnQ5ED4+pXO1KOLTl6jOtWwOwWx4PTzx7x5GPqEyZsNHBLnjxJkeOZepI
   Hzel5ngW7XzPJfnsN+1ToSKlcLrrKUORCjjx7I4isvHkyq1xcV12FEY2m
   wksyLWMOVJDYGJi7JnieWPfTfLG0GrCPDabXsxLMIAX/b3B9oukHqEvkP
   w==;
X-CSE-ConnectionGUID: fauIwVh8RwmjcgnR6G2QxA==
X-CSE-MsgGUID: +0omwksNSfe04YBqyW1JIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30803747"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="30803747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 13:46:37 -0700
X-CSE-ConnectionGUID: hh61DQeEQtyU6MjDkmcEWw==
X-CSE-MsgGUID: 2oYes5x/QFC4pVR8mF3ZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35801777"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 May 2024 13:46:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC3iL-000Ck5-2P;
	Tue, 28 May 2024 20:46:33 +0000
Date: Wed, 29 May 2024 04:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 10/29] drm_connector_test.c:undefined
 reference to `drm_hdmi_compute_mode_clock'
Message-ID: <202405290438.TOYhXMIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   c7ce956bb6d0f32ab921b6ffba1a6a834df96f21
commit: abb6f74973e20956d42e8227dde6fb4e92502c14 [10/29] drm/tests: Add HDMI TDMS character rate tests
config: arc-randconfig-002-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290438.TOYhXMIn-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290438.TOYhXMIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290438.TOYhXMIn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_12_bpc':
>> drm_connector_test.c:(.text+0x140): undefined reference to `drm_hdmi_compute_mode_clock'
>> arc-elf-ld: drm_connector_test.c:(.text+0x140): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_10_bpc':
   drm_connector_test.c:(.text+0x288): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drm_connector_test.c:(.text+0x288): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o: in function `drm_test_connector_hdmi_compute_mode_clock_yuv422_8_bpc':
   drm_connector_test.c:(.text+0x3d0): undefined reference to `drm_hdmi_compute_mode_clock'
   arc-elf-ld: drivers/gpu/drm/tests/drm_connector_test.o:drm_connector_test.c:(.text+0x3d0): more undefined references to `drm_hdmi_compute_mode_clock' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
   Selected by [y]:
   - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
