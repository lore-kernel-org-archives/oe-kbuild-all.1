Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242908822
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674510987; x=1706046987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gin93OuKIs2N51BBdQ6F9PMhRpXV/gqY2xo7LJr40nw=;
  b=Eq3GbAxCjkfFu5OMIzhukimrySDXQxvO6NK49RoI8pmukUCGFYZyGpnl
   JVh0s7vgy/xViqSc0ljN7fRjLVcgl0NOQiHHNPnfKHEv4bpNk9246eikq
   nl4LB1vnnF0ibO1rQ9E64zoeJ5g0Xp+gwMA1jQOknw7NN4BfQBtMi4eCm
   SEWeXSj3LEMnYfbL9hlT64STmmjLEyLXbrPWy+XDxbearkEje2StwT9T+
   vc2D1r7wUF1XImBhE3Ds7og1NbqGZiB7JXhbxYbDYWlvuLKBGftybyqcG
   c02LVz6ivQLiaKo1wxZc8hbKlXoXkoMaYsKnx252bPq1d+N1wbRM4G+DW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309736232"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="309736232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 13:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663839615"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663839615"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 13:56:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK4nf-0005ud-0R;
	Mon, 23 Jan 2023 21:56:23 +0000
Date: Tue, 24 Jan 2023 05:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yunke Cao <yunkec@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/3] media: uvcvideo: reimplement privacy GPIO as a
 separate subdevice
Message-ID: <202301240550.TKbKrY1e-lkp@intel.com>
References: <20230111-uvc_privacy_subdev-v1-3-f859ac9a01e3@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111-uvc_privacy_subdev-v1-3-f859ac9a01e3@chromium.org>

Hi Yunke,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on 7dd4b804e08041ff56c88bdd8da742d14b17ed25]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-v4l2-ctrls-Expose-v4l2_ctrl_fill_event/20230111-165418
base:   7dd4b804e08041ff56c88bdd8da742d14b17ed25
patch link:    https://lore.kernel.org/r/20230111-uvc_privacy_subdev-v1-3-f859ac9a01e3%40chromium.org
patch subject: [PATCH RFC 3/3] media: uvcvideo: reimplement privacy GPIO as a separate subdevice
config: i386-randconfig-s003-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240550.TKbKrY1e-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/d3146a6db90c6391240092912ea9440f81fc7380
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunke-Cao/media-v4l2-ctrls-Expose-v4l2_ctrl_fill_event/20230111-165418
        git checkout d3146a6db90c6391240092912ea9440f81fc7380
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/media/usb/uvc/uvc_driver.o: in function `uvc_gpio_irq':
>> drivers/media/usb/uvc/uvc_driver.c:1216: undefined reference to `uvc_gpio_event'


vim +1216 drivers/media/usb/uvc/uvc_driver.c

c0efd232929c2c drivers/media/video/uvc/uvc_driver.c Laurent Pinchart 2008-06-30  1207  
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1208  /* -----------------------------------------------------------------------------
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1209   * Privacy GPIO
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1210   */
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1211  
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1212  static irqreturn_t uvc_gpio_irq(int irq, void *data)
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1213  {
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1214  	struct uvc_device *dev = data;
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1215  
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23 @1216  	uvc_gpio_event(dev);
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1217  	return IRQ_HANDLED;
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1218  }
2886477ff98740 drivers/media/usb/uvc/uvc_driver.c   Ricardo Ribalda  2020-12-23  1219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
