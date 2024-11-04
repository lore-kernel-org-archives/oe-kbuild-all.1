Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F321AF0A8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714768; cv=none; b=i925s3R2PVr/jR7GSMzVJ+krrKIhHyYMWOSu5t1zZDypDnOPb02pWwcOiSwbDCo5AgiN7Lp7NIe3F5h4hzCrye/Hgb0AnOzdB3fX60a0s444o2LTnpzKdHWRZkg5SXkolb3ogiNLYMB8VW7YeXWbSkOc29Fsr+747Ws5Z4hjmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714768; c=relaxed/simple;
	bh=Xod1yEXAGdpYU4tYEd+Nah1kh/k99Q2zii1RjaEeOIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdkF8zT16tIwuhhdXRGri9wOys7MAWKTLHfsiTdt374DabSvD3SEy00VqCTxAxM0D8plg2vjmqJZh7KMRDsgFOUa+Ea+PnsjXqSqEo/NhdFXG4KlacroLOMmD8XfuxhD7vse7XyoUDkBE7JkRu5Out+HivtBkwM3C3Y1oqFcu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZMrFh4g; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZMrFh4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730714767; x=1762250767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xod1yEXAGdpYU4tYEd+Nah1kh/k99Q2zii1RjaEeOIQ=;
  b=gZMrFh4ggeSeIRszghBSiYgPC/l6rQ6/xH4sf/E8qWMQruIgVgsfBIxg
   l4DWle4J2TqCVGPDOP5DPUHE5ow/C24YI3Himz6q9/OC5JX27NlULkZxa
   Qui9tzTBgEPcp9s4WfGdwU8sdZhZR10fMTr4qjex0Ny3kXNlAcP/FDU6n
   02s0PdBhPbNvusmRbyAL4lU32zdSI+XcbKMvvfjigs3rw3a4H9pC9cVAc
   5spz6EEYWc7BTylMZrfARMCvLDzPEQiH+b5xZvfPFkQ3GE3KPhSAtNFyl
   W0X+WR1KRz1ejfb1th8PJOXjJX4D5M5QTZ3/1ZOTXMTknIMC+hdU8XDqQ
   Q==;
X-CSE-ConnectionGUID: QWq/3jGRRI6t+GUJl4z6nA==
X-CSE-MsgGUID: Q/gtqEQbQWy5jQknd6g6rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="34331595"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="34331595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 02:06:07 -0800
X-CSE-ConnectionGUID: TURrh7mMSN6g+F7LpMOr4Q==
X-CSE-MsgGUID: ibZPN91MRBGiAzTRPojnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83953452"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 02:06:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7tyE-000kiz-20;
	Mon, 04 Nov 2024 10:06:02 +0000
Date: Mon, 4 Nov 2024 18:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	chenchangcheng <ccc194101@163.com>
Subject: Re: [PATCH] media: uvcvideo:Create input device for all uvc devices
 with status endpoints.
Message-ID: <202411041605.VSoO1uus-lkp@intel.com>
References: <20241104023947.826707-1-ccc194101@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104023947.826707-1-ccc194101@163.com>

Hi chenchangcheng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-stage/master]
[also build test ERROR on linus/master v6.12-rc6 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chenchangcheng/media-uvcvideo-Create-input-device-for-all-uvc-devices-with-status-endpoints/20241104-104225
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20241104023947.826707-1-ccc194101%40163.com
patch subject: [PATCH] media: uvcvideo:Create input device for all uvc devices with status endpoints.
config: x86_64-buildonly-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041605.VSoO1uus-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041605.VSoO1uus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041605.VSoO1uus-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/usb/uvc/uvc_status.c: In function 'uvc_event_streaming':
>> drivers/media/usb/uvc/uvc_status.c:110:21: error: implicit declaration of function 'uvc_input_has_button' [-Werror=implicit-function-declaration]
     110 |                 if (uvc_input_has_button(dev)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/uvc_input_has_button +110 drivers/media/usb/uvc/uvc_status.c

    93	
    94	/* --------------------------------------------------------------------------
    95	 * Status interrupt endpoint
    96	 */
    97	static void uvc_event_streaming(struct uvc_device *dev,
    98					struct uvc_status *status, int len)
    99	{
   100		if (len <= offsetof(struct uvc_status, bEvent)) {
   101			uvc_dbg(dev, STATUS,
   102				"Invalid streaming status event received\n");
   103			return;
   104		}
   105	
   106		if (status->bEvent == 0) {
   107			if (len <= offsetof(struct uvc_status, streaming))
   108				return;
   109	
 > 110			if (uvc_input_has_button(dev)) {
   111				uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
   112					status->bOriginator,
   113					status->streaming.button ? "pressed" : "released", len);
   114				uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
   115			}
   116		} else {
   117			uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
   118				status->bOriginator, status->bEvent, len);
   119		}
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
