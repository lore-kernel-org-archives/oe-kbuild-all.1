Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3D21DFDA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349582; cv=none; b=LUjMHVvPkiGKap56JyKr3cIUSOMv7wG6+G356sS7JbFBe+kkiCke7LOd8iPFThYY4QDpQdNs8ZTsgAMq/V+/9gW2MXNviO3VZXVPHDQfTTHR3lf5P3HvbMBv8BQrEHBQp/vMrJwTmHmcIPsxON0oRKG5GeP4HM0DBr/hELyjCu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349582; c=relaxed/simple;
	bh=8HXrmcxBCqbLUHBDSdcn0l2L5nvateN0JecOg94dbx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TGffggzXDnc9ViHjFXTrWWPa+923LxpdXwprdCu6vjrnsFBtl6cWBzSGukL8pZJD4eDALhrpAgS08wwd812NhzgoV7KoTA02CpKiCd2G8BX2S985WWBd8fi+udnRy3AIhytRExM2qyX72boysSw+guKLhDD7Y0beg/tMpeFwrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6+7NGRN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6+7NGRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774349581; x=1805885581;
  h=date:from:to:cc:subject:message-id;
  bh=8HXrmcxBCqbLUHBDSdcn0l2L5nvateN0JecOg94dbx8=;
  b=F6+7NGRNMCvpLJjvhc2K+Em990DJ7S21pwB6vcgOwuMPU57CpqHFFOSO
   IK56GrltxavqAFpIAFZMGOOxD2Ty5jQCA7VRjkfBQ/a8KkhHc08Hq8yPV
   DNoTlrztK+DALwr1X9BGV7JQggtV/fd+P6h+EVyjcC+aue0udEF/5LHAN
   N9zGp2J5qMUG5bRyj0CGJqqrliIfq8G5xNo7AsJp7Go+vobE7zj59KGMx
   reaVF9QFZbleCoN8fm1nDvXrvO7M6/UMWZ4WzwQnPeMUydlhp1SGNJAwN
   rdDYC0oHLe7xr1PmOy4WeXZ1q9zInvH19i45DIeI4pDVoSiLmsn28Ua/t
   Q==;
X-CSE-ConnectionGUID: /FnSSU9RSCmBcGhAnK84/A==
X-CSE-MsgGUID: 9VRzfi4VTgK2vfbKMZA+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86730512"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86730512"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:53:00 -0700
X-CSE-ConnectionGUID: d/SVn5T9Ro29ZoI7leB9DA==
X-CSE-MsgGUID: dR80eBa4TD+L+OS9BlqlWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229239358"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 03:52:59 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4zNX-000000004Pv-3Jfo;
	Tue, 24 Mar 2026 10:52:55 +0000
Date: Tue, 24 Mar 2026 18:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5]
 drivers/usb/gadget/android_configfs_uevent.c:245:6: warning: no previous
 prototype for '__android_set_configured'
Message-ID: <202603241841.FSenwAyB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Neill,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3ec022196c4e9d5c1434599cdda63f622dd6f586
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [5/5] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260324/202603241841.FSenwAyB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241841.FSenwAyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241841.FSenwAyB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous prototype for '__android_set_connected' [-Wmissing-prototypes]
     231 | void __android_set_connected(struct android_uevent_opts *opts,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:245:6: warning: no previous prototype for '__android_set_configured' [-Wmissing-prototypes]
     245 | void __android_set_configured(struct android_uevent_opts *opts,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/__android_set_configured +245 drivers/usb/gadget/android_configfs_uevent.c

   244	
 > 245	void __android_set_configured(struct android_uevent_opts *opts,
   246			bool configured)
   247	{
   248		unsigned long flags;
   249	
   250		spin_lock_irqsave(&opts_lock, flags);
   251		// Don't send the uevent if configure state is not changed
   252		if (opts->configured != configured) {
   253			opts->configured = configured;
   254			schedule_work(&opts->work);
   255		}
   256		spin_unlock_irqrestore(&opts_lock, flags);
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
