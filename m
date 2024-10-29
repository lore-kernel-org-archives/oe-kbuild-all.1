Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564CC14293
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 00:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730163278; cv=none; b=HeiWzCnfdRT5cgNg+rU5yNlvOP0DgFt81xp1+lBsAsvDuv5Jj1OtOM834HWVQ3S6XuzXQgZQrqg2jVjyDlwexY9aMn6awvGF2jmsqspG48DTKfyzAOO8CY1B1OYNE70ocgUBhJwIUnbh/HquUAK4F0Obr14oNbQTqhXaefDQSAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730163278; c=relaxed/simple;
	bh=JP4ikTBpYf2RE56Dl3AmAcKTt0A2iAdi43H3JRQpMQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gR4/558xzKDiNqiyl5Pccvs9Iab2SNSMlCsNYMB7d0VpXMX+41Hic57AHRGnVZLAOmSOftdhU9qGmvnDlCf2R5X7X7jCYlLTaWkAIDzYum5VrOSgh4V6Lp27l5rrpE5JllqBTbmFRY4rL2R5JRzV7J0OZE2uNxkQ7j997w36qiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBCw/Hhy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBCw/Hhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730163275; x=1761699275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JP4ikTBpYf2RE56Dl3AmAcKTt0A2iAdi43H3JRQpMQE=;
  b=GBCw/HhykbNYNSxPkELfZZM3kym3kPOwUjSnjzts7GVABbnFGyQdog0j
   tH+F9gF3tC/tV1grBNJIMds/qdJuApd6hIX+M1N9klwrmn98qifBlLhqi
   Q0WqYGdb5jNwYoE/0tZ/MKfl8iUCfwxfPf+6Xl1GuZperSisd/Nk4MNQD
   moNJILYFVd0eJvcXfVpgLVrW1an+N3aD9JM0Zfi3W5If6tN+yJb/fZz2j
   8sQXeZ1VRpgBJEvCmmfxyB8tvB7qwQkzDAbPtr5C5/jaZQVyDIucuCnnl
   MXvBl4XFE/lwqR5N52gCxcVEVn85IhbPlb/Zodlz+cxh8qaGQAhTV9CGf
   w==;
X-CSE-ConnectionGUID: xgpDiTwPSqOB7UZQCsJzGg==
X-CSE-MsgGUID: u/t6Q6c/T4ywaxKHH4gLcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41180189"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="41180189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 17:54:34 -0700
X-CSE-ConnectionGUID: GXWWnGQ0Q/2tHMVa1IxR2A==
X-CSE-MsgGUID: Q9okXVH+QLiVjre5tVXuFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="105132382"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 17:54:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5aVD-000d4d-1E;
	Tue, 29 Oct 2024 00:54:31 +0000
Date: Tue, 29 Oct 2024 08:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6091/30000] kismet: WARNING: unmet
 direct dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_MSM
Message-ID: <202410290853.5fYPIsMB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   ca48ea8b94307a011f58fdc6efa124ff7f5508f8
commit: 5edcc7517c2a97a1bf87fbe00aab8321c760f11a [6091/30000] ANDROID: pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
config: x86_64-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_MSM-0-0 (https://download.01.org/0day-ci/archive/20241029/202410290853.5fYPIsMB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241029/202410290853.5fYPIsMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290853.5fYPIsMB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_MSM
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
