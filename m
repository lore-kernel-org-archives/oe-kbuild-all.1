Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1914CB49
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 23:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmho7Ja+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702079801; x=1733615801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mYkeT968/7W0MI+cOCJ0+wS2CIfQJZVDY3pyhVxZcV4=;
  b=mmho7Ja+/u0E9b8fGW1fBvvbrZiR8oBfDXKuvB2e1sGk0eivodEUL6Ub
   DxF0c+E8K0S37gwnAJ53oVXfQKgf8K/kmBvCFEH34aikcQEkdZCyx1pWh
   CmwXHylyDKpCISRwUNnuHMNEejo4HY3exC9Un0tIpRcxtBHI82GVO8Byt
   jNT8cYPLEz5xo8m4fMMTGcfViaAL6r+Uli7n6HNIKQlG4yd5xGTK4Diva
   FU/7bl4J/w5Jd0k35WWEqsfrq32oumBlux5fSQYi8TY/D8HzI18CRdPIM
   SbRkJXC5HVzXrnyl7CAgBOpGl2ilphQWfikUj//udYGtfBlfUxKL4AgBm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="13175895"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="13175895"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 15:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890318957"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="890318957"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2023 15:56:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBkhv-000EYj-2w;
	Fri, 08 Dec 2023 23:56:35 +0000
Date: Sat, 9 Dec 2023 07:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	linux-usb@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	kernel@collabora.com
Subject: Re: [PATCH v2] usb: gadget: webcam: Make g_webcam loadable again
Message-ID: <202312090717.dUYTE5cM-lkp@intel.com>
References: <20231208131342.65671-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208131342.65671-1-andrzej.p@collabora.com>

Hi Andrzej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33cc938e65a98f1d29d0a18403dbbee050dcad9a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrzej-Pietrasiewicz/usb-gadget-webcam-Make-g_webcam-loadable-again/20231208-211513
base:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
patch link:    https://lore.kernel.org/r/20231208131342.65671-1-andrzej.p%40collabora.com
patch subject: [PATCH v2] usb: gadget: webcam: Make g_webcam loadable again
config: i386-buildonly-randconfig-002-20231209 (https://download.01.org/0day-ci/archive/20231209/202312090717.dUYTE5cM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090717.dUYTE5cM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090717.dUYTE5cM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/legacy/webcam.c:368:32: warning: 'uvcg_frame_mjpeg_720p' defined but not used [-Wunused-const-variable=]
     368 | static const struct uvcg_frame uvcg_frame_mjpeg_720p = {
         |                                ^~~~~~~~~~~~~~~~~~~~~


vim +/uvcg_frame_mjpeg_720p +368 drivers/usb/gadget/legacy/webcam.c

   367	
 > 368	static const struct uvcg_frame uvcg_frame_mjpeg_720p = {
   369		.fmt_type		= UVCG_MJPEG,
   370		.frame = {
   371			.b_length			= uvc_frame_mjpg_720p.bLength,
   372			.b_descriptor_type		= uvc_frame_mjpg_720p.bDescriptorType,
   373			.b_descriptor_subtype		= uvc_frame_mjpg_720p.bDescriptorSubType,
   374			.b_frame_index			= uvc_frame_mjpg_720p.bFrameIndex,
   375			.bm_capabilities		= uvc_frame_mjpg_720p.bmCapabilities,
   376			.w_width			= uvc_frame_mjpg_720p.wWidth,
   377			.w_height			= uvc_frame_mjpg_720p.wHeight,
   378			.dw_min_bit_rate		= uvc_frame_mjpg_720p.dwMinBitRate,
   379			.dw_max_bit_rate		= uvc_frame_mjpg_720p.dwMaxBitRate,
   380			.dw_max_video_frame_buffer_size	= uvc_frame_mjpg_720p.dwMaxVideoFrameBufferSize,
   381			.dw_default_frame_interval	= uvc_frame_mjpg_720p.dwDefaultFrameInterval,
   382			.b_frame_interval_type		= uvc_frame_mjpg_720p.bFrameIntervalType,
   383		},
   384		.dw_frame_interval	= (u32 *)uvc_frame_mjpg_720p.dwFrameInterval,
   385	};
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
