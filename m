Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF9365
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 20:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715719561; cv=none; b=CB0SBkyGQ4OArfmHH34H33j+u6e+pVuMFmKocZzLBVwTN9tsfgHBSte6X/HYhdbYT1TTjbWIjAyFJvm/ffsyG3I7ElJncBEnoBKq6b92eOG1ewg7fTNZHSAgmEtnpPnH7285llrm1duvFmTc4vjB4izPIiGRjK+E85KJUr1Z0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715719561; c=relaxed/simple;
	bh=crfsr17PfBnwM/TXUQCnKktiTaAWu986RKFSMU5Eo5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9EOjhBE+X207JPUSRBa/xosMuGSXtbfvW2SkUKptRnwD5UnvHwv/xfXAxwoPy47D+QN+14ul1PNHZ7H9d2oCfhdZN0cudpnF5KV3KHNzfGUncN8lCa7sWU0zqxdwRixLPU6dnOFbV3bTeW80sZN8IJrsYuaHHpl48O+QE6tWd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUuUSxWm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUuUSxWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715719560; x=1747255560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crfsr17PfBnwM/TXUQCnKktiTaAWu986RKFSMU5Eo5A=;
  b=NUuUSxWms4DwUbgeSfXmRk3RGirNXjyC2ZWfwordAAytriQbpfu2Plmn
   XHvwA3p2iJt/U318b6mii0d/pAyN/rJXg13rJYCq087rkkMtqUMV6/24d
   a2CA/nYbAgr8Tygfzk9d9jn3kITzbcpD3Epiq1fi4iNCGZ/y86XaEc9Nd
   /MYGN20wgQSnjFUPp/fSnmjRZAfa2xsxOEcVgPTZgRTF323LoP/ht/8w6
   mMPMzi1aidmYPhL4ezSSPa6i6nEPWnBzlHK+gmB7ILT5gdlnhu/G3HGTb
   DFq8vpeyUec3wI77/iH8im+kXzYBPjY44/fx2HQQ9tYuD3NQVSE467KcB
   A==;
X-CSE-ConnectionGUID: cBA1fLecTxWUVPCJfWNXvA==
X-CSE-MsgGUID: 5+NJket8SEGZ5LF84f5OMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11563461"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11563461"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 13:45:59 -0700
X-CSE-ConnectionGUID: NN6gSbwNQ7+q29D419hvuA==
X-CSE-MsgGUID: 2I20CxkvQ/mwOgEB+esuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="54025944"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2024 13:45:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6z23-000C0L-1k;
	Tue, 14 May 2024 20:45:55 +0000
Date: Wed, 15 May 2024 04:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 95/106] ERROR: modpost: "v4l2_m2m_init"
 [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
Message-ID: <202405150454.FXGm1s3W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   1f64c8ce89e6d5c5cf094d47ae84dbc6956094a6
commit: 5cd0ae9700e0a1483b2fd161c7d7f120b643d953 [95/106] CHROMIUM: media: platform: mediatek: aie driver migration
config: arm-randconfig-001-20240515 (https://download.01.org/0day-ci/archive/20240515/202405150454.FXGm1s3W-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405150454.FXGm1s3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405150454.FXGm1s3W-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_m2m_init" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_release" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_get_curr_priv" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_next_buf" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_job_finish" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_copy_metadata" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_init" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_release" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_update_start_streaming_state" [drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-encdec.ko] undefined!
WARNING: modpost: suppressed 113 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
