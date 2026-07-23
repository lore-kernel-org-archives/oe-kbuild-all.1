Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3243B4A7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818192; cv=none; b=AXQqvGOg0KboqnW4h13okhrBh77eYP4hIQygi45NuZazz9Hi3DkKJHlfpahSDej+VvPcRHMg6hunzOzRsB9rhs7S/BCMJY4UZC3nefQBzm67lrZbRkuL8zLWZofKO3TGR7TPl2JjPyPvK9ikkK1NRmH7ciyawacF0DG5D15GnZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818192; c=relaxed/simple;
	bh=9O9z0LKdOKeI04eQv8cHAcOGbPT/PJLCgzPMcYYa4Ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=snzBUewq1/v8iPZSSe6z9CongKUCJnPUb7JsPX0QiTVHIJuqg2wtHobmWxfDpScqSs/vytGNJfrPKsfMtoD/nboB5lZT9X80jeXaUmtRRwLej0vpKPqUGjH5u/HBn0+we96uxdb2TTYGjbLDCrgbgOfnlNiSu3HWcXpcwsvnzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qw1yL04S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qw1yL04S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784818188; x=1816354188;
  h=date:from:to:cc:subject:message-id;
  bh=9O9z0LKdOKeI04eQv8cHAcOGbPT/PJLCgzPMcYYa4Ok=;
  b=Qw1yL04S/mC4hA1+Bp3v7zCtRRGtLwikM3zsM3Co8ly4avQ7NoDmq94G
   u1aiSunmfh3sVLVVN+UoYVOozbocTvwwLlKvOE+YOVxudr8qj+P6Bcskz
   +h6lFt/mvibfVC/PHPtlHS/rz8oHMzbb09vzxOJ0MlTfORTwoToori8q9
   3rs6PnvSQ3mt/QuBZrvbcaetoq9MCWzZ6QGfSFUJZbcpRmOdoxAA5pQ40
   GlJ56yHsCl8G03FmfJSRJ5DaBMUiww9tPVma3dUYhsTtT/guC6N7wdxgk
   jaSSHqu0gkDQqQgu9Tp+j7zXLAMa0334w7uyXYeOoHDKJd3uo0ssWvoEp
   Q==;
X-CSE-ConnectionGUID: pHGSbyoiRy+PlLpyv95LOQ==
X-CSE-MsgGUID: kbwRReshRomjN2HAA12wfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85591971"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="85591971"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 07:49:47 -0700
X-CSE-ConnectionGUID: tyYgmY1rRiqyCjKLxVL9nA==
X-CSE-MsgGUID: icnOQa0mQ6SNVuIP1GRctA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="282939831"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2026 07:49:45 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmuk2-000000000mQ-4123;
	Thu, 23 Jul 2026 14:49:42 +0000
Date: Thu, 23 Jul 2026 16:48:54 +0200
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.12 256/1171] kismet: WARNING:
 unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER when selected by
 VIDEO_XILINX_DPRXSS
Message-ID: <202607231632.Due3ryhM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.12
head:   d25fdf9fee1c8707551f590540e46b3686b90099
commit: 8e7f0d801a77b63164a2defd3aa51109ab17a787 [256/1171] v4l: xilinx: Driver support for Xilinx DP Rx subsystem
config: alpha-kismet-CONFIG_DRM_DISPLAY_DP_HELPER-CONFIG_VIDEO_XILINX_DPRXSS-0-0 (https://download.01.org/0day-ci/archive/20260723/202607231632.Due3ryhM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260723/202607231632.Due3ryhM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231632.Due3ryhM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER when selected by VIDEO_XILINX_DPRXSS
   WARNING: unmet direct dependencies detected for XLNX_HDCP1X_CIPHER
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - VIDEO_XILINX_HDCP1X_RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]
   
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_DISPLAY_HELPER [=y]
     Selected by [y]:
     - VIDEO_XILINX_DPRXSS [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_XILINX [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
