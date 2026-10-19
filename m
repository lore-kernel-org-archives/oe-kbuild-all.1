Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422105;
	b=lw6Oc4tc8ilgftYqoVOCj8mJrDQU+XjZ5e8ELIaJN/49FRSWYgfoy1qmdNZlNhMhJ9v3
	 qFWwXeyGZkvcDrTkM31gsnypf0miZ9UQbdhxqwsM3Fw54kU1BvEUMBioRy/BqgXsbg6C2
	 MICtkfTHnyW7h3tIbW+uDUwjF2k25Ciz2mU2bWHRQJ2iDgdfxTnrHDdUuzSbZXsMQ3Yte
	 AGPAlQBQ2CEwRkAzjKL+nQDgM8Pr7huNNE7bu73K6H4YucgSgpPO3T2MgiR2xVzYja8yC
	 thHLZDRiLMsZQ/alxusU1PAIXQn/vYVilUbsRU5fu900yGinkA7M8wyBAxuo9xcuPIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422105;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Oqb1j9z4rkPifsl+qWONz8jJ8bXPWSOfqMExu9EYgpY=;
	b=F6ozrQafa+IqBJETQlM7SPgHvJWpLWHE+1VTq3IWSBKbyoXrglsIBTPz2IW89YGglVi+
	 ZeVOQvar3bahONRN7CKGpSMB0DTyOmIys3YOgEwjC1mRL0T62qUgGOdNeGm8SQ0uJhoaO
	 XmZaBtC+gZqRToV5BswMt8UAjcTF3s1oOeBI6gi3UA4BjOMH3hbt3hiPTRy5Eg8QvyzEd
	 JPGiXelaqIEZYU8txuscxCV3gy7U4+gHjlAYEsymIVqJZOnSjnzCjkDfxZOJDAq8jtegJ
	 6kWnI0n8SbclVxV5SajgYyuXQ985Ve7HoYQN8aNMPm8u1qcRLBbI10MN9BtpM2k/FGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B8KpwXtb;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABD4607AF24
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 15:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABD4607AF24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B8KpwXtb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422104; x=1823958104;
  h=date:from:to:cc:subject:message-id;
  bh=KkiRozEYKA7AEY70guf2wPXmWBHcFxl9AIFrQ83Tp70=;
  b=B8KpwXtb0d9VeFp5blkRStD+PA5AiOS+/fc4dSw/TB1Ucp4se4puLKIJ
   NlewTCvJ/IwrO2LFJYwOW8VvnrzsBiFDRWqFKHpeoINm1D0/wlG8sazPa
   KHHSbtLhMeq5rMJbyHTrFGvOHkxnLwktTGOwHO2IzaBq28fZ/fZp++vrR
   U+ioq8TJzE9N2gL+SfBk83M3O2mNHp14AH3IO+RV0GNK9fxd0OYRVSk62
   HmT+rrIDXgImQKWdyu+yoas+mjg48dclxkrDy/SAMoTsiRk6uhNjXB0Yg
   Ef8zPRPrZNgg0O1Y86JwVUCeKFni9uEgA/dK/VHVnXEb9xY3fpwMH1iCa
   w==;
X-CSE-ConnectionGUID: fd7GXj+eSo+MKTwT6M8qPA==
X-CSE-MsgGUID: oam446v7RZqQpWqedDle6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1012934"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1012934"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:01:44 -0700
X-CSE-ConnectionGUID: IFK8eV57QCamSjBEYMuoVA==
X-CSE-MsgGUID: b1JLS3fcRtCmyP1KXI1aHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2620321"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Oct 2026 08:01:40 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIorq-000000005f9-2NQM;
	Mon, 19 Oct 2026 15:01:38 +0000
Date: Mon, 19 Oct 2026 17:00:37 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous
 prototype for 'acc_ctrlrequest_composite'
Message-ID: <202610191628.GaawZRNO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 30e6baaaac88f18b10ba5b7474ac35f5efdf4ef8 [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: arm64-randconfig-r2303-20261018 (https://download.01.org/0day-ci/archive/20261019/202610191628.GaawZRNO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191628.GaawZRNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191628.GaawZRNO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_accessory.c:975:5: warning: no previous prototype for 'acc_ctrlrequest' [-Wmissing-prototypes]
     975 | int acc_ctrlrequest(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_accessory.c:1088:5: warning: no previous prototype for 'acc_ctrlrequest_composite' [-Wmissing-prototypes]
    1088 | int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1441:6: warning: no previous prototype for 'acc_disconnect' [-Wmissing-prototypes]
    1441 | void acc_disconnect(void)
         |      ^~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_accessory.c:1546:5: warning: no previous prototype for 'acc_ctrlrequest_configfs' [-Wmissing-prototypes]
    1546 | int acc_ctrlrequest_configfs(struct usb_function *f,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~

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
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/acc_ctrlrequest_composite +1088 drivers/usb/gadget/function/f_accessory.c

  1087	
> 1088	int acc_ctrlrequest_composite(struct usb_composite_dev *cdev,
  1089				      const struct usb_ctrlrequest *ctrl)
  1090	{
  1091		u16 w_length = le16_to_cpu(ctrl->wLength);
  1092	
  1093		if (w_length > USB_COMP_EP0_BUFSIZ) {
  1094			if (ctrl->bRequestType & USB_DIR_IN) {
  1095				/* Cast away the const, we are going to overwrite on purpose. */
  1096				__le16 *temp = (__le16 *)&ctrl->wLength;
  1097	
  1098				*temp = cpu_to_le16(USB_COMP_EP0_BUFSIZ);
  1099				w_length = USB_COMP_EP0_BUFSIZ;
  1100			} else {
  1101				return -EINVAL;
  1102			}
  1103		}
  1104		return acc_ctrlrequest(cdev, ctrl);
  1105	}
  1106	EXPORT_SYMBOL_GPL(acc_ctrlrequest_composite);
  1107	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
