Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E011C2A8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717890815; cv=none; b=Vu+M1FfQrIZDLnNsAFowRNoDeOiuwvBts0iFGYKj7SbWxJ9UVqXhaMXJZyY1JKOhRWtKA3W5rvU2HcArfMTS4Omv5f01ftxMo0v3bwx9LR9XkEZXyH/fD87PWdWMDOePabGVgezVu1tBgdjUE3+WmdGjN3paX6EhEVyardVe/Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717890815; c=relaxed/simple;
	bh=r4NNqS6NqqGLbdoY4L2qLjdP47NMYSkoxsbbQMrAhhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iwgcIDw6jNhkGkKBveh8mRuSuPAy8Ao+9ZY4l50ladKw2dJdh/oYZQiyIYKTN/yl2T1tJyHGAGXAFL+1TqG6ahe2NwFsCg2CgPFEdLmVHW5MvYCYy5QxdO+xVebIO3OwTXb7SEN6jGYWRV0oY0v3S4lvsr8ZQr1F7AmgFhn7Qv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGKP6xLU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGKP6xLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717890814; x=1749426814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r4NNqS6NqqGLbdoY4L2qLjdP47NMYSkoxsbbQMrAhhU=;
  b=TGKP6xLUaQZspwKDmPMMWkTu9EgISRssON+whYIdEQSxt8XlJpFcNXOv
   1Dlprj6RU2K25t0gdlZR74iHA6u9XK2CUpp87Kdot+MOZvkEBgIxjMSMb
   kEZ3xJcCjEJMonVPTjQVqcswooSpQh9nhPHAx5xNLeMEN6FP2xOYavOWo
   ZXj6xh0o9DGdVhekZ5CY//ZoKNk8cvSceZr36x4ZR4a6LcTn0Fhuot3yK
   RV8fHMB+S7/icrGRMxiuklyiIvIhCcyENaZD/wODmFmE8BY5Nv1HBjyBv
   lPNHrJQVRKmd0eJRQ42DqshEgHp0UeQgO3jWRBa8Q3KpZdo2vNN9UoG6w
   g==;
X-CSE-ConnectionGUID: sC7dR7sES5Spcuh6TV+wwQ==
X-CSE-MsgGUID: gYaD2gJvRE61uPndQiwwOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="25159943"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="25159943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 16:53:33 -0700
X-CSE-ConnectionGUID: 4IhWU5zmQZ2qxxHd5p5IYg==
X-CSE-MsgGUID: FlW7rT5ISZ+bWrlKD8zO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="43235618"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2024 16:53:32 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG5sI-0000ek-23;
	Sat, 08 Jun 2024 23:53:30 +0000
Date: Sun, 9 Jun 2024 07:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 3542/27508] ERROR: "kernel_fpu_end"
 [net/wireguard/wireguard.ko] undefined!
Message-ID: <202406090741.gPFaEU0y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   9493a99fc4113db2e277506f6fd7315bd77a927f
commit: dabd02495f84488ea48192d40aa013f3749c1bc1 [3542/27508] added wireguard, tag:0.0.20191219
config: um-defconfig (https://download.01.org/0day-ci/archive/20240609/202406090741.gPFaEU0y-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090741.gPFaEU0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090741.gPFaEU0y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "kernel_fpu_end" [net/wireguard/wireguard.ko] undefined!
>> ERROR: "irq_fpu_usable" [net/wireguard/wireguard.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
