Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB98CA4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 02:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710469496; cv=none; b=rRwuA3Awp19JDyOmbKNIWMySazcI7T0k6cjnqMJ08BgPAdgkK9q3n5L+xQ/0WyYxGTWPx/ag7xbHL5qGDrb+oUlUTI64eFC2/u5faNiCtDt03d5zs3sx/Cj1knJNH54kZkvWOaBxQkQWLO61iMv9oijvUz0wdwwtMyLCD9oo1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710469496; c=relaxed/simple;
	bh=ZXfSG+DVCIjO740VfLSNPSkBPl+IEh4rLgekf8XPL5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jLmU/8zmVKS7LB/1psGvUImWZtcaLqCR7TZ10QaZh+RKHVGej7yCeP6OWax7ovWOUXw3GX40GF7vN/oXTC5XqY/DJZ283J0IGNtngBpvDDfAmefqsBrCd2v6vgxuSF2+QAz2dtZ67gVAM32BVcKeVqRgYKd1cnydoEZKVoVa81E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME4qMOz7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME4qMOz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710469495; x=1742005495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZXfSG+DVCIjO740VfLSNPSkBPl+IEh4rLgekf8XPL5s=;
  b=ME4qMOz7dvC5i8ADWYnGHfOwkoZwnjN76M7JbyyoIpGTjCikbJGt77tJ
   7TvnBSOnfG1VWRKn+r9pfJoKep836wnLc78TqqXfeqETy9mhGqOcHu888
   uMFr/YMXNyQDoTXjQut6Hgkyh1ppjYUyw8O6lf8dwCg9PrbGugAPx2pKG
   fS8Da+RQ8lCbg1IAzZPvcHlZMGrV6L6sMIQfuQm7AtdgWzuKKRhiIGhkz
   RxEqfySkEaJbjZ5h852pY2PXsem90iDNhpiOmZJW8W59U3eqV/j49wyq1
   SAUHd9rlDLW5+P7oREA/5EzuNnRRyykOwyaDiFK66oNcl2EdyWH4KvVQO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5455544"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5455544"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 19:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12916002"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Mar 2024 19:24:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkxFa-000E05-1y;
	Fri, 15 Mar 2024 02:24:50 +0000
Date: Fri, 15 Mar 2024 10:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 7750/29228] kismet: WARNING: unmet
 direct dependencies detected for GPIOLIB_IRQCHIP when selected by
 PINCTRL_MSM
Message-ID: <202403151012.T3zGSASD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d24801ee88749d3bff9f942f228c42a76d4edc48
commit: 5edcc7517c2a97a1bf87fbe00aab8321c760f11a [7750/29228] ANDROID: pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
config: i386-kismet-CONFIG_GPIOLIB_IRQCHIP-CONFIG_PINCTRL_MSM-0-0 (https://download.01.org/0day-ci/archive/20240315/202403151012.T3zGSASD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240315/202403151012.T3zGSASD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151012.T3zGSASD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP when selected by PINCTRL_MSM
   
   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
