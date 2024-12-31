Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D25517C60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 06:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735624919; cv=none; b=G/GcsxVrDc2a/ot70rr/d1p3PzIF5v8oYCLC66xUvMyaakUWB2AX5W+ieu8k1a7zK1oxJ8oYxOAMOU/NXbQ8+AAm3hZCDVpxqZfqqZ4VkOQKKIcvkMsjrXOY+agVBOiVCX4kX+NKhvsI8AjVPPkg9sSpOZvTUkPe+34Fo8e3iTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735624919; c=relaxed/simple;
	bh=TKwE5Y9AEJEAEqekHntnRZyZT8lwrnI1l4rVNc8/cqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iL/IvB3iiqlgS7iqeJMV3zvgcHYiwK0DlHReZmcD+5Bbf4IvkVfRhjqxscbMz3v1h25t8lEFkk2OMTiEAOkJK+pvcnjwgE0qnTOSvhmopKNJnR+bzlxI8qDS8P3wQXWN8IM0DQ/0w3N0r567U5mf1QYHMeb2ArkGNQSyoiLaGVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CktKh0F4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CktKh0F4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735624918; x=1767160918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKwE5Y9AEJEAEqekHntnRZyZT8lwrnI1l4rVNc8/cqc=;
  b=CktKh0F4agb/oibYPyRgCBJN9NglZJx4R31aOBWqxtoFB84D2iQecg4M
   bMsnlmyFNM6NC50dU+zmGFo4a1DXF2mo8nTEIEwmdZX0W3Pw3xKdGpOqo
   ALCd47w4t84f0g3NADbTKeFRemKV3jCf7z9094vihtvoLtYQeXYSblOoP
   z3e6I8hjrMl3/OngriJgmH4HMnS/vCfYff/cwD2RclIHCKL96TocI5GKo
   wFlvb0Y5SRNnntUXPSW/kZocwYHk3t7COcnkcrOvCyMxiiWm7tp/u2yd4
   vwu7/+D9//NM/++QTWorHMsS+GNKwIw1mrZDSEyKUEhGfzX06Ftq5snzr
   Q==;
X-CSE-ConnectionGUID: IvmvGwxmStG062+Ob3YyGA==
X-CSE-MsgGUID: 7gARPAijSTazb/oqWjlgjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="23498477"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="23498477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 22:01:57 -0800
X-CSE-ConnectionGUID: y+T5BtqJSoi5XiX89dL+9A==
X-CSE-MsgGUID: ERUqlc69Rj6OeBsxh8ZZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="131810871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Dec 2024 22:01:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSVKE-0006pB-0W;
	Tue, 31 Dec 2024 06:01:54 +0000
Date: Tue, 31 Dec 2024 14:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] ld.lld: error: undefined
 symbol: cros_ec_cmd_xfer_status
Message-ID: <202412311352.KYHpAbCY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d0b1929484f680c96365fd3da7698811aa526378
commit: df91ba37520e392eb56bc8ba08b9319b02db6216 [1/1] ANDROID: platform/chrome: cros_ec_proto: allow to build as module
config: i386-randconfig-141-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311352.KYHpAbCY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311352.KYHpAbCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311352.KYHpAbCY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cros_ec_cmd_xfer_status
   >>> referenced by cros_kbd_led_backlight.c:165 (drivers/platform/chrome/cros_kbd_led_backlight.c:165)
   >>>               drivers/platform/chrome/cros_kbd_led_backlight.o:(keyboard_led_get_brightness_ec_pwm) in archive vmlinux.a
   >>> referenced by cros_kbd_led_backlight.c:145 (drivers/platform/chrome/cros_kbd_led_backlight.c:145)
   >>>               drivers/platform/chrome/cros_kbd_led_backlight.o:(keyboard_led_set_brightness_ec_pwm) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
