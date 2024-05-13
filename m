Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEEE4C81
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 01:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715562270; cv=none; b=sYiIhFXANProuctcjpz5AcE1QVAhzNAHFT8/s8LAnuv4ToWp0BcPN8oZ8+joQ/VwzhtwaKQHRrJw/Lu9GcmRJUGy6hNkbNZgEcaQU1U2rBR9WlryvAy6eZ0mGxz7ZxGDzpkff7JkFZkv6Erey+9L4faSnhLHgFPUKq10K4YW4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715562270; c=relaxed/simple;
	bh=F/E+poInAa8I0ADhFeff3NjbcCt9stl3cmlP1T0jPfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oa+jDAWsGTXNpBz7l3YDxQUVihpRzaMlnL9g8+NzQZ3iTJmlQ463uGYBAZVcrbJrayiWB9oXBFK0Rb1uL9J84UMkVEvzLAt73y6tke8mabbueFV5MDOajFfNR+sjXVKcO2C2leetnDFJJ3Yhh+2MgVODn2F2/mlSuoBoPA7OzN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUxFGrs6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUxFGrs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715562267; x=1747098267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/E+poInAa8I0ADhFeff3NjbcCt9stl3cmlP1T0jPfo=;
  b=EUxFGrs65RKI8mK1AsUw27C0IC4lF8NUjL9tZy4nD1AnV1v4hMzvY4xy
   hGi8hwMk1ELSBwxAUrJfR/iO8ncV3yqnCMao8YzRDr8OAOOtU0OOwrrhK
   8HI/+7a52t/m/hjy1GB7QZSoKShhhk6muzSfbZefA8yPDHej476rHaV8T
   AFnj8fCcMPLjmsduICBezbSkfEAYlch1b/3zNI9/fBHS5WAh9x9j0jGJO
   vfaSQorIQZASjTTFNkdzMrki217G0ttL1UugDh35G8SCqxWzD0vGGi4Jx
   zU/Jw1MdtuWWMEqlz7xbeyVI2vv55+m1k/ZrRsBNisg0UTetBUL159ZC1
   A==;
X-CSE-ConnectionGUID: D8qgCQRYTMy4FPReL3fXKA==
X-CSE-MsgGUID: gFCxQ2L+R5yd27MFTraQsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11699141"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11699141"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 18:04:27 -0700
X-CSE-ConnectionGUID: GCYvDSDkRKyX1QKh/oIPvw==
X-CSE-MsgGUID: q+FYfZ1oQuqPL7nddk5RfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30570308"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 May 2024 18:04:25 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6K75-0009MR-0a;
	Mon, 13 May 2024 01:04:23 +0000
Date: Mon, 13 May 2024 09:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 95/106] kismet: WARNING: unmet direct
 dependencies detected for MEDIA_CONTROLLER_REQUEST_API when selected by
 VIDEO_MTK_AIE
Message-ID: <202405130952.ePXoLS8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   4caca2e86338fb0028244f751f859824629b3f21
commit: 5cd0ae9700e0a1483b2fd161c7d7f120b643d953 [95/106] CHROMIUM: media: platform: mediatek: aie driver migration
config: i386-kismet-CONFIG_MEDIA_CONTROLLER_REQUEST_API-CONFIG_VIDEO_MTK_AIE-0-0 (https://download.01.org/0day-ci/archive/20240513/202405130952.ePXoLS8m-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240513/202405130952.ePXoLS8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130952.ePXoLS8m-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MEDIA_CONTROLLER_REQUEST_API when selected by VIDEO_MTK_AIE
   WARNING: unmet direct dependencies detected for MEDIA_CONTROLLER_REQUEST_API
     Depends on [n]: MEDIA_SUPPORT [=y] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - VIDEO_MTK_AIE [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
