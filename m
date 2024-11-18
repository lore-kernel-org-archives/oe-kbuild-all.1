Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A64423A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 03:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731901210; cv=none; b=MiWDKvoTsq3Nanl+efloAz5l5H82ZM+RHdA0VN64IjGHQHo8l6MjYvWBamu3+kuUwfBO73SUmZ3ntMUsm6C06zrgOr5LMhzUNsNHosxqdWt2Q6nHP8e7P5ccczaxcY2mVT33Yp0hZMllTQaIiJqcgovIE+afy2US7owxnLYSQZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731901210; c=relaxed/simple;
	bh=/FSiXsVOMTt6YeHUzhI+bBzJDkdf7s1e+f6VPiX8w6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5xPp3SdLRHMCYlr6q7t43ZmbzIb55a6mZuRvUstSx+c+Dw7FDCWDeRY+9lDCqYnkXMUyf6R1Bacp9iQQ66xLQXbAYvZ2/8U2sLzo67lYhm34zNBl28RW2lnV3pNVw3Qs/kMygeE8hF+/6s8x7Bdjjg94OjusHdUvOL2deZo9Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jttxc0q/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jttxc0q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731901209; x=1763437209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/FSiXsVOMTt6YeHUzhI+bBzJDkdf7s1e+f6VPiX8w6A=;
  b=Jttxc0q/Eu5oBIhGvGBJ0UW1Zh0rK+OVvVFvR+bJWNJ79IcA/tDD2l+9
   RJYvjKsuoS3omajBwR4mUC4HDyEqPdeNQX43R1SPrOggSB11qY5BbEK+6
   XTNYe5szN/ri4Rlq8vLgxhG8WMLiOAiB51kXzy/HIdLRW96kycuN1oH7u
   CUoImOsYBULGPrDq0VAPBMumPO+Fz0M6toqLr47Xm42AVvRufsQkF/Ou+
   fCOVbrO5PfDznxHMGs6OJ/n0NJ7xSt1FSJ7KggjLCEj0Erpd2KfmQEgE5
   zWdV3Oe+7eeePkgxo9cjUTawOHdyN7SqUmTnPjcf2Yr1ESLOxRaixMhHy
   Q==;
X-CSE-ConnectionGUID: rGPWzmXxSaiZaEbcBbbLTg==
X-CSE-MsgGUID: 6Q9c4F/oTU2qcazpZnQm+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43226409"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="43226409"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 19:40:08 -0800
X-CSE-ConnectionGUID: nqhvXi50QSG5x95h2lU1QA==
X-CSE-MsgGUID: vMtEMTN1R3uRaGZOHt8Uyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89532419"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2024 19:40:07 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCscO-0002Fp-1N;
	Mon, 18 Nov 2024 03:40:04 +0000
Date: Mon, 18 Nov 2024 11:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 8/28] drivers/hid/hid-magicmouse.c:573:
 warning: Excess struct member 'crc16' description in 'tp_finger'
Message-ID: <202411181131.KIVkUrZS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   501868c5f377ff4155041d111e0bea3c499b97a8
commit: be8149cc11b4d818756b92bd89e8c50a13b9dc44 [8/28] HID: magicmouse: add support for Macbook trackpads
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241118/202411181131.KIVkUrZS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181131.KIVkUrZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181131.KIVkUrZS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:172: warning: Function parameter or struct member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:172: warning: Function parameter or struct member 'input_ops' not described in 'magicmouse_sc'
>> drivers/hid/hid-magicmouse.c:573: warning: Excess struct member 'crc16' description in 'tp_finger'
   drivers/hid/hid-magicmouse.c:595: warning: expecting prototype for struct trackpad. Prototype was for struct tp_header instead


vim +573 drivers/hid/hid-magicmouse.c

   536	
   537	/**
   538	 * struct tp_finger - single trackpad finger structure, le16-aligned
   539	 *
   540	 * @unknown1:		unknown
   541	 * @unknown2:		unknown
   542	 * @abs_x:		absolute x coordinate
   543	 * @abs_y:		absolute y coordinate
   544	 * @rel_x:		relative x coordinate
   545	 * @rel_y:		relative y coordinate
   546	 * @tool_major:		tool area, major axis
   547	 * @tool_minor:		tool area, minor axis
   548	 * @orientation:	16384 when point, else 15 bit angle
   549	 * @touch_major:	touch area, major axis
   550	 * @touch_minor:	touch area, minor axis
   551	 * @unused:		zeros
   552	 * @pressure:		pressure on forcetouch touchpad
   553	 * @multi:		one finger: varies, more fingers: constant
   554	 * @crc16:		on last finger: crc over the whole message struct
   555	 *			(i.e. message header + this struct) minus the last
   556	 *			@crc16 field; unknown on all other fingers.
   557	 */
   558	struct tp_finger {
   559		__le16 unknown1;
   560		__le16 unknown2;
   561		__le16 abs_x;
   562		__le16 abs_y;
   563		__le16 rel_x;
   564		__le16 rel_y;
   565		__le16 tool_major;
   566		__le16 tool_minor;
   567		__le16 orientation;
   568		__le16 touch_major;
   569		__le16 touch_minor;
   570		__le16 unused[2];
   571		__le16 pressure;
   572		__le16 multi;
 > 573	} __attribute__((packed, aligned(2)));
   574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
