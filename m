Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E73DA7C2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370207; cv=none; b=GGbLPc2AHviGdeGEtp/3PikFP/L+YWKyuDF3YufmrG0s2TkDIhMzsWk4JAccOP5UOWj3Ir3ysT9FfDFY+KJnD3p/GlaRLdlgeUi0kHYhxqCBifrNAWHw5OECnSXP67C8ZrQwc67rUdXevp5d8y0DCQCiUOWBbPVsjhQPkCsD+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370207; c=relaxed/simple;
	bh=sM3crCqlJFNGQ93Z8qonYEbcMfnVoXrKJel8hiPuzVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r951NpfYLDaY4H/06Hhf08BfTi/pvutHSgSDKk4SVnUvAVolBHr32L1IPPrZ/Xo2qAoVqwjw1jbJGYAJMsMJMS9rIIsBoK6tdudzIjCEjCar3fc8vXVH4uz8En5YUxamjPXkUKqGKM7OvvSwqA1R0QCNJq/1DXJ9JPsBGGGcjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZI0LP5uD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZI0LP5uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791370158; x=1822906158;
  h=date:from:to:cc:subject:message-id;
  bh=sM3crCqlJFNGQ93Z8qonYEbcMfnVoXrKJel8hiPuzVM=;
  b=ZI0LP5uDA6+zmD/PWG1/UGXCLh9oyVRlXTOWrZtUKzh6uBJSAfpGg88S
   GE/DjsAcILupJ0OatQQfijJ3+WUu4XxBkApWgFiP6BkNaSjYpqVWkc83L
   Xjy9023Mav67ocqstee/r3q7osJPPwbhpQ+LWJcxqQ1y/3uGwjMun2cm3
   7GslSvddGaMDGgkpfkZ2PlbWaAmFeqMEwvmsvNkrnlXb6E2B6yBqBGEjZ
   AKkidmNvKK5XrWLlBZXuJ6aWxLD2poJbFGZZiFduyqIRjI8uccsAxO62n
   4TiS3lDcu1AuoNK2/KSOwnxdGOuTibX5G3/V+j5i09Qu3MDxkIO7b8zmJ
   Q==;
X-CSE-ConnectionGUID: OtEaVf0cS9+kVoxBv7GdiQ==
X-CSE-MsgGUID: ru3rG0DYQ8CMBO9FaLV+3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="11027"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="11027"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 03:49:17 -0700
X-CSE-ConnectionGUID: zdWJbxbXTqiJ5Wmp+TMIJA==
X-CSE-MsgGUID: c+efztkNT7iBr5g+/rtPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280691436"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 03:49:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEPD0-000000002s8-102z;
	Wed, 07 Oct 2026 10:49:14 +0000
Date: Wed, 07 Oct 2026 18:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/gunyah/timer.c:25: error: Cannot parse struct or union!
Message-ID: <202610072015.0ayU25U3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   02e193b62eb32656db70ee318262c2e6a6b88147
commit: 1e4ff6e90e08e672cc57f4864cb107024f19d0ab [4/4] ANDROID: gunyah: vcpu: handle EXPECTS_WAKEUP_OR_TIMEOUT vcpu_run state
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261007/202610072015.0ayU25U3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072015.0ayU25U3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072015.0ayU25U3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/gunyah/timer.c:25: error: Cannot parse struct or union!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +25 arch/arm64/gunyah/timer.c

    12	
    13	/**
    14	 * struct gunyah_timer_scale - Scaling factors for timer conversion
    15	 * @mult: Multiplier for converting cycles to nanoseconds
    16	 * @shift: Shift value for the multiplier
    17	 *
    18	 * These values are pre-calculated during initialization to efficiently
    19	 * convert hypervisor tick deadlines to kernel time without performing
    20	 * expensive division operations on the hot path.
    21	 */
    22	static struct {
    23		u32 mult;
    24		u32 shift;
  > 25	} gunyah_timer_scale;
    26	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
