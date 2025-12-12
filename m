Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F4314A62
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765532630; cv=none; b=MGH/hCjPXmuSqaCHHiHcCK8hlOrtxeUeQka8GHPFmAPK4VVyU5eAnQY3tUOXcbvF0mRwK49Phr7ZkvUdKiyLv/IOuZpe6KpGPbnH+mtEizcO4qKc1HjabVA+VA1fXOfZ6bkyKKtsn8O+TGdf8pQZsuh8YPr9k3KJ73K75IpVj3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765532630; c=relaxed/simple;
	bh=3QRer23JxTkYUbMJEIancN8TevF4/C2jLIYw80mHs4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bg6vGM451csH18arU6g688qYWUqd3ghzXvvTQvb8aO9PoA3mF89edWTtETMjk69RF9vUjrmKxHNdQsfzOqSGjdXeY7CDKz1YNoycXcCso6XT3fEl69rz5CF8c8vOGIS3oGK7VFUvRdvoZUv2hPKSY79Cqdjw6NcA2tdPhN/RO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTPMts/r; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTPMts/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765532628; x=1797068628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QRer23JxTkYUbMJEIancN8TevF4/C2jLIYw80mHs4k=;
  b=LTPMts/rQlq4hp5FxHdf+K4+bTQycLP0ak+DOYphKkwpudcM54eOHOXC
   GuXKpEVnsofaBKlfGy6A5j8cDxZUgS5PElJEq+0W8p7IGhlq6D9Gi8aQ7
   Ufl1VaLmwCLkxpjK790YNL/BuVWJRILPCTjkUWEVmOL3/RVh4Mvjyr2d3
   hNhF9RSi45pk3sKRoPIgIv9ekMmAyn1TNkOa8B06492W5hSMZOhxhOMGH
   hNL3AEJm/J7kDUEgxO/jrJHjCjLnCulhUhrXwJ/sIf2RMiz8yJPoUZRna
   IBhN9YXy5fSMWuBOrKVwyNWukGsYp9LELAFkG1KbI/2yVNT8rYQVpnjzl
   Q==;
X-CSE-ConnectionGUID: eXWc23GSRBuLIr+/WuOveA==
X-CSE-MsgGUID: xbau3OzNRkywKtottWuT5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67690949"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67690949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:43:46 -0800
X-CSE-ConnectionGUID: TV/I0wMZROCB3jiWKWoI0A==
X-CSE-MsgGUID: AIZ6XndTTUOjpQrBLkz9sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196124799"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 01:43:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzgb-000000005st-3dqz;
	Fri, 12 Dec 2025 09:43:41 +0000
Date: Fri, 12 Dec 2025 17:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5]
 drivers/usb/gadget/android_configfs_uevent.c:245:6: warning: no previous
 prototype for '__android_set_configured'
Message-ID: <202512121725.pTy64iiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   aede8f2a23afdacd71bb57369610179a20e859a7
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [0/5] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: x86_64-randconfig-015-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121725.pTy64iiR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121725.pTy64iiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121725.pTy64iiR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous prototype for '__android_set_connected' [-Wmissing-prototypes]
     231 | void __android_set_connected(struct android_uevent_opts *opts,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/android_configfs_uevent.c:245:6: warning: no previous prototype for '__android_set_configured' [-Wmissing-prototypes]
     245 | void __android_set_configured(struct android_uevent_opts *opts,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


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
